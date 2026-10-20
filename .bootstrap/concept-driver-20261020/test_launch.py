"""Operations-only launcher fixtures. Never starts a model or Lean."""
import copy
import importlib.util
from pathlib import Path
import tempfile
import unittest
from types import SimpleNamespace
from unittest.mock import patch

spec = importlib.util.spec_from_file_location('concept_launch', Path(__file__).with_name('launch.py'))
ops = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ops)


class LaunchFixtures(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='math-gkm-concept-launch-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.directory = self.root/'ops'; self.directory.mkdir()
        (self.directory/'test_launch.py').write_text('fixture tests only\n')
        self.study = self.root/'study'
        self.curation = self.directory/'curation'
        self.patches = [patch.object(ops,'OPS',self.directory),
            patch.object(ops,'STUDY',self.study), patch.object(ops,'CURATION',self.curation),
            patch.object(ops,'implementation',return_value={'fixture':'implementation'}),
            patch.object(ops,'clean_contract',return_value={'fixture':'same exact clean seed'}),
            patch.object(ops,'authorize_live'), patch.object(ops,'start_keep_awake',return_value=None)]
        for p in self.patches: p.start(); self.addCleanup(p.stop)

    def review(self):
        ops.prepare_plan()
        tests = dict(passed=True, launcher_sha256=ops.sha(ops.__file__),
            tests_sha256=ops.sha(self.directory/'test_launch.py'),
            implementation_sha256=ops.digest(ops.implementation()))
        ops.write(self.directory/'TEST_RESULT.json',tests)
        review = dict(accepted=True, reviewer='independent fixture',
            plan_sha256=ops.sha(self.directory/'PLAN.json'),
            launcher_sha256=tests['launcher_sha256'], tests_sha256=tests['tests_sha256'],
            implementation_sha256=tests['implementation_sha256'],
            test_result_sha256=ops.sha(self.directory/'TEST_RESULT.json'))
        path = self.directory/'REVIEW.json'; ops.write(path,review)
        return path

    def test_protocol_preserves_matching_model_budgets_and_guards(self):
        p = ops.protocol()
        self.assertEqual(p['model'],'gpt-6.1-sol')
        self.assertEqual((p['rounds'],p['episode_rounds']),(4,2))
        self.assertEqual((p['call_seconds'],p['adaptation_seconds'],p['validation_seconds']),(1800,1800,900))
        self.assertEqual(p['knowledge_checks_per_round'],3)
        self.assertEqual(p['output_bytes'],2*1024**2)
        self.assertTrue(p['concept_driver']['enabled'])
        self.assertEqual(p['concept_driver']['max_horizon_rounds'],2)

    def test_full_study_and_trial_opportunities_fit_every_reviewed_suite_size(self):
        p = ops.protocol()
        for tasks in range(ops.MAX_SUITE_TASKS+1):
            result = ops.capacity(p,tasks)
            self.assertLessEqual(result['total_reserved_seconds'],p['arm_seconds'])
            self.assertLessEqual(result['maximum_calls'],p['max_calls'])
            self.assertLessEqual(result['maximum_meta_calls'],p['meta_calls'])
        self.assertEqual(ops.capacity(p,3)['total_reserved_seconds'],151200)
        self.assertEqual(ops.capacity(p,3)['maximum_reviews'],4)
        self.assertEqual(ops.capacity(p,3)['maximum_comparisons'],5)
        self.assertEqual(ops.capacity(p,3)['maximum_calls'],46)
        self.assertEqual(ops.capacity(p,3)['maximum_meta_calls'],26)

    def test_supervisor_wall_covers_both_full_arm_caps_and_operational_overhead(self):
        p = ops.protocol()
        required = 2*p['arm_seconds'] + 2*(4*p['max_calls']+2)*30 + 3600 + ops.CLEANUP_SECONDS
        self.assertGreaterEqual(ops.SUPERVISOR_SECONDS,required)
        self.assertEqual(ops.plan_value()['supervisor_seconds'],120*3600)

    def test_insufficient_aggregate_allowance_rejected(self):
        for field in ('arm_seconds','max_calls','meta_calls'):
            p = ops.protocol(); p[field] = 1
            with self.subTest(field=field),self.assertRaises(ops.Invalid): ops.capacity(p,3)

    def test_suite_bound_does_not_silently_truncate(self):
        for value in (-1,4,True,1.5):
            with self.subTest(value=value),self.assertRaises(ops.Invalid): ops.capacity(ops.protocol(),value)

    def test_plan_starts_no_models_proofs_or_controllers(self):
        with patch.object(ops.subprocess,'Popen',side_effect=AssertionError('forbidden launch')):
            result = ops.prepare_plan()
        self.assertEqual(result['status'],'prepared_not_launched')
        plan = ops.read(self.directory/'PLAN.json')
        self.assertEqual(plan['hosted_model_calls'],0)
        self.assertEqual(plan['lean_checks'],0)
        self.assertEqual(plan['role_order'],['baseline','exploration'])
        self.assertFalse(self.study.exists())
        self.assertFalse(self.curation.exists())

    def test_existing_study_or_curator_is_preserved(self):
        for target in (self.study,self.curation):
            target.mkdir()
            with self.assertRaisesRegex(ops.Invalid,'already exists'):ops.prepare_plan()
            target.rmdir()

    def test_exact_review_and_passing_tests_are_required(self):
        path = self.review()
        self.assertEqual(ops.reviewed(path),ops.plan_value())
        review = ops.read(path)
        for field in ('plan_sha256','launcher_sha256','tests_sha256','test_result_sha256','implementation_sha256'):
            ops.write(path,{**review,field:'changed'})
            with self.subTest(field=field),self.assertRaisesRegex(ops.Invalid,'review'):ops.reviewed(path)
        ops.write(path,{**review,'accepted':False})
        with self.assertRaises(ops.Invalid):ops.reviewed(path)

    def test_source_changes_invalidate_review_before_live_authorization(self):
        path = self.review()
        with patch.object(ops,'implementation',return_value={'fixture':'changed'}), \
             patch.object(ops,'authorize_live') as authorize:
            with self.assertRaisesRegex(ops.Invalid,'implementation changed'):ops.reviewed(path)
            authorize.assert_not_called()

    def test_failed_tests_cannot_be_reviewed_as_passed(self):
        path = self.review()
        tests = ops.read(self.directory/'TEST_RESULT.json'); tests['passed'] = False
        ops.write(self.directory/'TEST_RESULT.json',tests)
        review = ops.read(path); review['test_result_sha256'] = ops.sha(self.directory/'TEST_RESULT.json')
        ops.write(path,review)
        with self.assertRaisesRegex(ops.Invalid,'passing operational'):ops.reviewed(path)

    def test_keep_awake_is_owned_and_tied_to_current_supervisor(self):
        # Override the test's default no-process stub to inspect only argv.
        original = self.patches[-1]
        original.stop()
        fake = SimpleNamespace(pid=12345)
        with patch.object(ops.Path,'is_file',return_value=True), \
             patch.object(ops.subprocess,'Popen',return_value=fake) as process:
            child = ops.start_keep_awake()
        original.start()
        self.assertIs(child,fake)
        self.assertEqual(process.call_args.args[0],['/usr/bin/caffeinate','-dimsu','-w',str(ops.os.getpid())])
        self.assertTrue(process.call_args.kwargs['start_new_session'])

    def test_keep_awake_cleanup_only_uses_own_child_handle(self):
        from unittest.mock import Mock
        child = Mock();child.poll.return_value = None
        ops.close_keep_awake(child)
        child.terminate.assert_called_once_with()
        child.wait.assert_called_once_with(timeout=5)
        child.kill.assert_not_called()
        ops.close_keep_awake(None)

    def test_stop_uses_official_files(self):
        self.study.mkdir(); self.curation.mkdir()
        result = ops.stop()
        self.assertFalse(result['automatic_restart'])
        for path in (self.directory/'STOP.json',self.study/'STOP.json',self.curation/'STOP.json'):
            self.assertTrue(path.exists())

    def test_launch_without_review_never_reaches_child_or_curator(self):
        with patch.object(ops,'reviewed',side_effect=ops.Invalid('fixture rejected')), \
             patch.object(ops.subprocess,'Popen') as child:
            with self.assertRaises(ops.Invalid):ops.launch(self.directory/'REVIEW.json')
            child.assert_not_called()

    def test_consumed_launch_is_not_retried(self):
        self.study.mkdir()
        with patch.object(ops,'reviewed',return_value=ops.plan_value()), \
             patch.object(ops.subprocess,'Popen') as child:
            with self.assertRaisesRegex(ops.Invalid,'no replay'):ops.launch(self.directory/'REVIEW.json')
            child.assert_not_called()

    def fake_curation(self,tasks):
        def run(*args,**kwargs):
            self.curation.mkdir()
            suite = dict(tasks=tasks)
            ops.write(self.curation/'suite.json',suite)
            ops.write(self.curation/'provenance.json',{'fixture':'curation'})
            return dict(suite=str(self.curation/'suite.json'),provenance=str(self.curation/'provenance.json'))
        return run

    def test_oversized_curation_preserved_without_freeze_or_child(self):
        path = self.review()
        plan = ops.plan_value()
        with patch.object(ops,'reviewed',return_value=plan), \
             patch('machinery.resources.headroom',return_value={}), \
             patch('machinery.study_curate.curate',side_effect=self.fake_curation([{'kind':'holdout'}]*3)), \
             patch('machinery.study.freeze') as freeze,patch.object(ops.subprocess,'Popen') as child:
            with self.assertRaisesRegex(ops.Invalid,'never truncate'):ops.launch(path)
            freeze.assert_not_called();child.assert_not_called()
        self.assertTrue((self.curation/'suite.json').exists())
        self.assertEqual(ops.read(self.directory/'STATUS.json')['status'],'needs_reconciliation')

    def test_curation_failure_is_durable_and_not_retried(self):
        path = self.review()
        with patch.object(ops,'reviewed',return_value=ops.plan_value()), \
             patch('machinery.resources.headroom',return_value={}), \
             patch('machinery.study_curate.curate',side_effect=ops.Invalid('fixture bounded failure')) as curate, \
             patch.object(ops.subprocess,'Popen') as child:
            with self.assertRaises(ops.Invalid):ops.launch(path)
            self.assertEqual(curate.call_count,1);child.assert_not_called()
        status = ops.read(self.directory/'STATUS.json')
        self.assertEqual(status['status'],'needs_reconciliation')
        self.assertFalse(status['automatic_retry'])
        self.assertTrue(status['goal_open'])

    def test_both_arms_are_launched_only_through_official_sequential_controller(self):
        path = self.review()
        def freeze(study,p,suite,contract,provenance):
            study.mkdir()
            ops.write(study/'seal.json',{'deployment_preflight':{'fixture':'checked deployment'}})
        fake = SimpleNamespace(pid=12345,returncode=0,poll=lambda:0)
        with patch.object(ops,'reviewed',return_value=ops.plan_value()), \
             patch('machinery.resources.headroom',return_value={}), \
             patch('machinery.study_curate.curate',side_effect=self.fake_curation([{'kind':'holdout'},{'kind':'regression'}])), \
             patch('machinery.study.freeze',side_effect=freeze), \
             patch('machinery.study_deployment.reuse_deployment',return_value={'fixture':'authenticated admission'}), \
             patch.object(ops,'closed_state',return_value={}), \
             patch.object(ops.subprocess,'Popen',return_value=fake) as child:
            result = ops.launch(path)
        self.assertEqual(child.call_count,1)
        self.assertEqual(child.call_args.args[0][-2:],['--arm','both'])
        self.assertTrue(child.call_args.kwargs['start_new_session'])
        self.assertEqual(child.call_args.kwargs['cwd'],ops.ROOT)
        self.assertEqual(result['child_returncode'],0)
        self.assertTrue(result['goal_open'])


if __name__ == '__main__':
    result = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(LaunchFixtures))
    ops.write(Path(__file__).with_name('TEST_RESULT.json'),{
        'schema':'math-gkm.concept-driver-operations-tests.v1',
        'passed':result.wasSuccessful(),'tests_run':result.testsRun,
        'failures':len(result.failures),'errors':len(result.errors),
        'launcher_sha256':ops.sha(ops.__file__),'tests_sha256':ops.sha(__file__),
        'implementation_sha256':ops.digest(ops.implementation()),
        'scope':'synthetic operational fixtures; no model calls or Lean execution'})
    raise SystemExit(0 if result.wasSuccessful() else 1)
