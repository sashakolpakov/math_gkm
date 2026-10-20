"""Focused operations-only resume tests; no models, Lean, timers or real probes."""
import copy
import importlib.util
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

spec=importlib.util.spec_from_file_location('resume_general',Path(__file__).with_name('resume.py'))
ops=importlib.util.module_from_spec(spec);spec.loader.exec_module(ops)


class ResumeTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='resume-general-tests-')
        self.addCleanup(self.temp.cleanup)
        self.base=Path(self.temp.name);self.directory=self.base/'ops';self.directory.mkdir()
        self.study=self.base/'existing-study'
        baseline=self.study/'arms/baseline/state.json';baseline.parent.mkdir(parents=True)
        baseline.write_text('unchanged baseline bytes\n')
        (self.directory/'test_resume.py').write_text('neutral test identity\n')
        self.binding={'baseline_state_sha256':ops.sha(baseline),'remaining_rounds':2,
                      'seal_sha256':'unchanged seal','root_sha256':'unchanged exact root',
                      'authorization_sha256':'unchanged protected authority'}
        self.patches=[patch.object(ops,'OPS',self.directory),patch.object(ops,'STUDY',self.study),
             patch.object(ops,'bindings',return_value=self.binding),
             patch.object(ops,'start_keep_awake',return_value=None),
             patch('machinery.resources.headroom'),
             patch.object(ops,'load_state',return_value={'status':'finite_budget_finished; root_open',
                         'round':4,'phase':'research','resolution':None})]
        for item in self.patches:item.start();self.addCleanup(item.stop)

    def review(self):
        ops.prepare_plan()
        tests={'passed':True,'resume_source_sha256':ops.sha(ops.__file__),
               'tests_source_sha256':ops.sha(ops.OPS/'test_resume.py'),
               'implementation_sha256':ops.IMPLEMENTATION}
        ops.write(ops.OPS/'TEST_RESULT.json',tests)
        review={'accepted':True,'reviewer':'independent neutral fixture',
                'plan_sha256':ops.sha(ops.OPS/'PLAN.json'),
                'test_result_sha256':ops.sha(ops.OPS/'TEST_RESULT.json'),
                **{k:v for k,v in tests.items() if k!='passed'}}
        path=ops.OPS/'REVIEW.json';ops.write(path,review)
        return path

    def test_command_resumes_only_existing_exploration_with_no_new_study(self):
        self.assertEqual(ops.argv(),[ops.PYTHON,'-m','machinery.study','run','--study',str(self.study),'--arm','exploration','--resume'])
        self.assertNotIn('freeze',ops.argv());self.assertNotIn('both',ops.argv())

    def test_plan_is_bound_to_goal_state_and_source_without_launch(self):
        with patch.object(ops.subprocess,'Popen',side_effect=AssertionError('no launch')):
            result=ops.prepare_plan()
        plan=ops.read(self.directory/'PLAN.json')
        self.assertEqual(plan['bindings'],self.binding)
        self.assertEqual(plan['user_goal_verbatim'],ops.USER_GOAL)
        self.assertEqual(plan['user_goal_sha256'],ops.digest(ops.USER_GOAL))
        self.assertFalse(plan['new_study']);self.assertFalse(plan['automatic_retry'])
        self.assertEqual(result['status'],'prepared_not_launched')

    def test_changed_state_source_or_goal_rejects_before_launch(self):
        path=self.review()
        for field in ('seal_sha256','baseline_state_sha256','root_sha256','authorization_sha256'):
            altered={**self.binding,field:'changed'}
            with patch.object(ops,'bindings',return_value=altered),self.subTest(field=field),self.assertRaises(ops.Invalid):
                ops.reviewed(path)
        with patch.object(ops,'USER_GOAL','Changed goal'),self.assertRaises(ops.Invalid):
            ops.reviewed(path)

    def test_exact_review_and_passing_tests_are_required(self):
        path=self.review();review=ops.read(path)
        for field in ('plan_sha256','resume_source_sha256','tests_source_sha256','test_result_sha256','implementation_sha256'):
            ops.write(path,{**review,field:'changed'})
            with self.subTest(field=field),self.assertRaises(ops.Invalid):ops.reviewed(path)
        ops.write(path,review)
        value=ops.read(self.directory/'TEST_RESULT.json');value['passed']=False
        ops.write(self.directory/'TEST_RESULT.json',value)
        with self.assertRaises(ops.Invalid):ops.reviewed(path)

    def test_one_official_child_and_baseline_unchanged(self):
        path=self.review();child=SimpleNamespace(pid=12345,poll=lambda:0,returncode=0)
        with patch.object(ops.subprocess,'Popen',return_value=child) as launch:
            result=ops.launch(path)
        self.assertEqual(launch.call_count,1)
        self.assertEqual(launch.call_args.args[0],ops.argv())
        self.assertEqual(launch.call_args.kwargs['cwd'],ops.ROOT)
        self.assertTrue((self.directory/'LAUNCH_CONSUMED.json').is_file())
        self.assertTrue(result['goal_open']);self.assertFalse(result['research_launched'])
        with self.assertRaises(ops.Invalid):ops.launch(path)
        self.assertEqual(launch.call_count,1)

    def test_stop_arriving_during_preflight_prevents_consumption_and_spawn(self):
        path=self.review()
        def stop_during_admission(_):
            ops.write(self.directory/'STOP.json',{'requested':'neutral preflight stop'})
        with patch('machinery.resources.headroom',side_effect=stop_during_admission),             patch.object(ops.subprocess,'Popen') as process:
            with self.assertRaisesRegex(ops.Invalid,'stop arrived during preflight'):
                ops.launch(path)
        process.assert_not_called()
        self.assertFalse((self.directory/'LAUNCH_CONSUMED.json').exists())

    def test_spawn_failure_is_consumed_and_never_retried(self):
        path=self.review()
        with patch.object(ops.subprocess,'Popen',side_effect=OSError('neutral failed spawn')) as process:
            with self.assertRaises(OSError):ops.launch(path)
            with self.assertRaises(ops.Invalid):ops.launch(path)
        self.assertEqual(process.call_count,1)
        self.assertEqual(ops.status()['status'],'needs_reconciliation')

    def test_birth_mismatch_cannot_be_signaled_as_owned_process(self):
        child=SimpleNamespace(pid=55,poll=lambda:None)
        with patch.object(ops,'current_process',return_value={'identity':'replacement'}):
            with self.assertRaises(ops.Invalid):ops.live_birth(child,'original')

    def test_exit_during_birth_query_is_handled_without_borrowed_pid(self):
        child=SimpleNamespace(pid=55,poll=unittest.mock.Mock(side_effect=[None,0]))
        with patch.object(ops,'current_process',return_value=None):
            self.assertIsNone(ops.live_birth(child,'original'))

    def test_stop_writes_only_new_operator_and_existing_study_markers(self):
        old=self.base/'old-status.json';old.write_text('preserved\n')
        ops.stop()
        self.assertTrue((self.directory/'STOP.json').exists())
        self.assertTrue((self.study/'STOP.json').exists())
        self.assertEqual(old.read_text(),'preserved\n')

    def test_status_requires_same_live_birth(self):
        ops.registry(status='research_running',controller_pid=5,controller_birth='original')
        with patch.object(ops,'current_process',return_value={'identity':'replacement'}):
            self.assertFalse(ops.status()['controller_birth_live'])

    def test_finite_wall_or_log_bound_requests_official_stop(self):
        for cause in ('wall','log'):
            directory=self.base/cause;directory.mkdir()
            (directory/'test_resume.py').write_text('neutral test identity\n')
            with patch.object(ops,'OPS',directory):
                path=self.review()
                child=SimpleNamespace(pid=66,poll=lambda:None,returncode=None)
                with patch.object(ops.subprocess,'Popen',return_value=child),\
                     patch.object(ops,'live_birth',return_value='original'),\
                     patch.object(ops,'stop_owned_controller',return_value=False) as stopped,\
                     patch.object(ops,'SUPERVISOR_SECONDS',0 if cause=='wall' else 432000),\
                     patch.object(ops,'LOG_CAP',-1 if cause=='log' else ops.LOG_CAP):
                    # Changed bounds also change plan; use the already-reviewed
                    # neutral record to test only the runtime containment branch.
                    with patch.object(ops,'reviewed',return_value=ops.read(directory/'PLAN.json')):
                        with self.assertRaises(ops.Invalid):ops.launch(path)
                    stopped.assert_called_once_with(child,'original')

    def test_only_owned_keep_awake_handle_is_closed(self):
        child=unittest.mock.Mock();child.poll.return_value=None
        ops.close_keep_awake(child)
        child.terminate.assert_called_once();child.wait.assert_called_once_with(timeout=5)


if __name__=='__main__':
    result=unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(ResumeTests))
    ops.write(Path(__file__).with_name('TEST_RESULT.json'),{'passed':result.wasSuccessful(),
        'tests_run':result.testsRun,'failures':len(result.failures),'errors':len(result.errors),
        'resume_source_sha256':ops.sha(ops.__file__),'tests_source_sha256':ops.sha(__file__),
        'implementation_sha256':ops.IMPLEMENTATION,
        'scope':'pure mocked operations; no model, Lean, resource probe or timer'})
    raise SystemExit(0 if result.wasSuccessful() else 1)
