"""One-shot deployment operator neutral controls; no process or proof launch."""
import contextlib
import fcntl
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[3]
sys.path.insert(0,str(ROOT))

def load(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    return module

fixtures=load('one_shot_revision_fixtures',HERE/'test_revision.py')
d=load('one_shot_deployment_under_test',HERE/'deployment_once.py')
r=fixtures.r

class DeploymentOnceTests(unittest.TestCase):
    def setUp(self):
        self.f=fixtures.RevisionTests(methodName='runTest');self.f.setUp()
        self.addCleanup(self.f.doCleanups);self.f.installed()
        self.out=self.f.base/'neutral-one-shot'
        self.calls=[];self.admissions=[]

    def native_output(self):
        return self.f.root/'.scratch'/('neutral-'+self.out.name)/'native'

    def runner(self,argv,**kwargs):
        self.calls.append((argv,kwargs))
        self.assertEqual(kwargs['timeout'],1800)
        self.assertEqual(kwargs['output_bytes'],65536)
        self.assertEqual(kwargs['tree_only'],True)
        self.assertEqual(kwargs['scope'],self.native_output().parent)
        self.assertEqual(kwargs['env']['TMPDIR'],str(self.native_output().parent))
        self.assertEqual(kwargs['cwd'],self.f.root)
        self.assertEqual(kwargs['env']['PYTHONDONTWRITEBYTECODE'],'1')
        self.assertEqual(argv[-1],str(self.native_output()))
        self.assertIn('seconds=1740',argv[-2])
        self.assertNotIn('study.run',argv[-2])
        self.assertTrue(self.native_output().parent.is_dir())
        self.assertFalse(self.native_output().exists())
        path=self.native_output()/'receipt.json'
        fixtures.put(path,{'synthetic_neutral_receipt':True})
        binding={'ready':True,'receipt':str(path),'receipt_sha256':r.sha(path)}
        return {'returncode':0,'termination':None,'operationally_incomplete':False,
            'stdout':json.dumps(binding),'stderr':'','elapsed_ns':1}

    def admission(self,binding):
        self.admissions.append(binding)
        return {'ready':True,'reused':True,**binding}

    def execute(self,runner=None,admission=None,pin=None):
        # Only the child process and heavyweight native admission are fixtures.
        # Real source/config hashes, CAS writes and maintenance filesystem fence run.
        return d.execute(r,self.f.config_path,pin or self.f.pin,self.f.output,self.out,self.native_output(),
                         runner=runner or self.runner,admission=admission or self.admission)

    def assert_no_finished(self):
        self.assertFalse((self.out/'FINISHED.json').exists())
        self.assertNotEqual(json.loads((self.f.output/'TRANSACTION.json').read_bytes())['phase'],
                            'finalized_not_launched')

    def test_correct_one_shot_preserves_old_state_and_requires_new_binding(self):
        states={name:(self.f.study/name).read_bytes() for name in r.ARM_STATES}
        source_before=r.source_vector(self.f.root)
        row=self.execute()
        self.assertEqual(row['path'],str(self.out/'BINDING.json'))
        self.assertEqual(row['sha256'],r.sha(self.out/'BINDING.json'))
        done=json.loads((self.out/'FINISHED.json').read_bytes())
        self.assertIs(done['ready'],True);self.assertEqual(done['binding'],row)
        self.assertEqual(done['operation_sha256'],r.sha(self.out/'OPERATION.json'))
        self.assertEqual(done['hosted_model_calls'],0);self.assertEqual(done['research_launches'],0)
        self.assertEqual(len(self.calls),1);self.assertEqual(len(self.admissions),1)
        for name,data in states.items():self.assertEqual((self.f.study/name).read_bytes(),data)
        self.assertEqual(r.source_vector(self.f.root),source_before)
        with self.assertRaises(r.Hold):self.execute()
        self.assertEqual(len(self.calls),1)

    def test_native_output_is_separate_and_bound_in_protected_records(self):
        self.execute()
        intent=json.loads((self.out/'INTENT.json').read_bytes())
        done=json.loads((self.out/'FINISHED.json').read_bytes())
        binding=json.loads((self.out/'BINDING.json').read_bytes())
        self.assertEqual(intent['native_output'],str(self.native_output()))
        self.assertEqual(done['native_output'],str(self.native_output()))
        self.assertEqual(binding['receipt'],str(self.native_output()/'receipt.json'))
        self.assertFalse((self.out/'native').exists())

    def test_native_output_under_bootstrap_refused_before_child(self):
        with self.assertRaisesRegex(r.Hold,'ROOT/.scratch'):
            d.execute(r,self.f.config_path,self.f.pin,self.f.output,self.out,self.f.base/'forbidden-native',
                      runner=self.runner,admission=self.admission)
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_existing_native_output_refused_before_child(self):
        self.native_output().mkdir(parents=True)
        with self.assertRaisesRegex(r.Hold,'ROOT/.scratch'):self.execute()
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_existing_container_with_absent_native_output_refused(self):
        self.native_output().parent.mkdir()
        with self.assertRaisesRegex(r.Hold,'ROOT/.scratch'):self.execute()
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_symlink_container_refused_before_child(self):
        target=self.f.root/'.scratch/other-container';target.mkdir()
        self.native_output().parent.symlink_to(target,target_is_directory=True)
        with self.assertRaisesRegex(r.Hold,'ROOT/.scratch'):self.execute()
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_symlink_native_output_refused_before_child(self):
        target=self.f.root/'.scratch/actual-neutral';target.mkdir()
        self.native_output().parent.mkdir()
        self.native_output().symlink_to(target,target_is_directory=True)
        with self.assertRaisesRegex(r.Hold,'ROOT/.scratch'):self.execute()
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_real_completion_prepare_accepts_scratch_and_rejects_bootstrap(self):
        from machinery import completion
        for location,allowed in ((self.f.root/'.scratch/neutral-completion-fixture/native/workspace',True),
                                 (self.f.root/'.bootstrap/neutral-completion-fixture/workspace',False)):
            source=location/'MathGKM/Neutral.lean';source.parent.mkdir(parents=True)
            source.write_text('namespace Neutral\ndef Goal : Prop := True\ntheorem claim : Goal := True.intro\nend Neutral\n')
            correspondence=location/'research/correspondence.txt';correspondence.parent.mkdir()
            correspondence.write_text('Synthetic identity only; no mathematical result asserted.\n')
            contract=dict(root_file='MathGKM/Neutral.lean',root_sha256=r.sha(source))
            claim=dict(kind='proof',module='MathGKM.Neutral',declaration='Neutral.claim',
                       correspondence='research/correspondence.txt')
            with self.subTest(location=location),patch.object(completion,'ROOT',location):
                if allowed:self.assertIn('bundle_hash',completion.prepare(contract,claim))
                else:
                    with self.assertRaisesRegex(completion.Rejected,'invalid correspondence path'):
                        completion.prepare(contract,claim)

    def test_parent_holds_controller_fence_but_never_heavy_lease(self):
        def runner(argv,**kwargs):
            with (self.f.study/'controller.lock').open('a') as lock:
                with self.assertRaises(BlockingIOError):
                    fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
            with (self.f.root/'.scratch/resources/heavy.lock').open('a') as lock:
                fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
                fcntl.flock(lock,fcntl.LOCK_UN)
            return self.runner(argv,**kwargs)
        self.execute(runner=runner)
        self.assertEqual(len(self.calls),1)

    def test_wrong_config_pin_refuses_before_fence_or_child(self):
        with self.assertRaisesRegex(r.Hold,'configuration'):self.execute(pin='0'*64)
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_wrong_reviewed_revision_pin_refuses_import(self):
        with self.assertRaises(ValueError):d.load_revision(HERE/'revision.py','0'*64)

    def test_noncanonical_revision_path_refuses_import(self):
        with self.assertRaises(ValueError):d.load_revision(Path('revision.py'),r.sha(HERE/'revision.py'))

    def test_busy_controller_refuses_without_creating_output(self):
        with (self.f.study/'controller.lock').open('a') as lock:
            fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
            with self.assertRaisesRegex(r.Hold,'controller'):self.execute()
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_cleanup_hold_refuses_before_child(self):
        fixtures.put(self.f.root/'.scratch/resources/UNRESOLVED_CLEANUP.json',{'neutral':'hold'})
        with self.assertRaisesRegex(r.Hold,'cleanup'):self.execute()
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_source_change_before_fence_refuses(self):
        (self.f.root/'machinery/study_context.py').write_text('foreign source')
        with self.assertRaises(r.Hold):self.execute()
        self.assertFalse(self.out.exists());self.assertEqual(self.calls,[])

    def test_failed_and_nonnumeric_child_results_preserve_operation_no_finished(self):
        for number,change in enumerate([{'returncode':1},{'returncode':None},{'returncode':False},
                {'returncode':'0'},{'termination':'timeout'},{'operationally_incomplete':True}]):
            self.out=self.f.base/f'failed-one-shot-{number}'
            def runner(argv,**kwargs):return {**self.runner(argv,**kwargs),**change}
            with self.subTest(change=change),self.assertRaises(r.Hold):self.execute(runner=runner)
            self.assertTrue((self.out/'INTENT.json').exists())
            self.assertTrue((self.out/'OPERATION.json').exists())
            self.assertFalse((self.out/'BINDING.json').exists());self.assert_no_finished()
        self.assertEqual(len(self.calls),6);self.assertEqual(self.admissions,[])

    def test_raised_child_failure_keeps_intent_never_retries(self):
        calls=[]
        def runner(*args,**kwargs):calls.append(True);raise RuntimeError('neutral injected runner failure')
        with self.assertRaises(RuntimeError):self.execute(runner=runner)
        self.assertTrue((self.out/'INTENT.json').exists());self.assert_no_finished()
        self.assertEqual(calls,[True]);self.assertEqual(self.admissions,[])

    def test_invalid_stdout_preserves_actual_child_operation(self):
        def runner(argv,**kwargs):return {**self.runner(argv,**kwargs),'stdout':'not JSON'}
        with self.assertRaises(ValueError):self.execute(runner=runner)
        self.assertTrue((self.out/'OPERATION.json').exists());self.assert_no_finished()
        self.assertEqual(self.admissions,[])

    def test_fake_or_cross_output_binding_refuses_before_admission(self):
        cases=[{'ready':False},{'receipt':'/not-the-owned-output/receipt.json'},
               {'receipt_sha256':'0'*64}]
        for number,change in enumerate(cases):
            self.out=self.f.base/f'bad-binding-{number}'
            def runner(argv,**kwargs):
                result=self.runner(argv,**kwargs);binding=json.loads(result['stdout']);binding.update(change)
                result['stdout']=json.dumps(binding);return result
            with self.subTest(change=change),self.assertRaises(r.Hold):self.execute(runner=runner)
            self.assertTrue((self.out/'OPERATION.json').exists());self.assert_no_finished()
        self.assertEqual(self.admissions,[])

    def test_missing_genuine_receipt_cannot_use_reported_sha(self):
        def runner(argv,**kwargs):
            result=self.runner(argv,**kwargs);(self.native_output()/'receipt.json').unlink();return result
        with self.assertRaises(FileNotFoundError):self.execute(runner=runner)
        self.assert_no_finished();self.assertEqual(self.admissions,[])

    def test_negative_or_nonreuse_admission_never_finishes(self):
        for number,checked in enumerate([{'ready':False,'reused':True},{'ready':True,'reused':False}]):
            self.out=self.f.base/f'bad-admission-{number}'
            with self.subTest(checked=checked),self.assertRaises(r.Hold):
                self.execute(admission=lambda _:checked)
            self.assertTrue((self.out/'OPERATION.json').exists());self.assert_no_finished()

    def test_admission_exception_is_not_retried_or_published(self):
        def admission(_):raise r.Hold('current deployment identity differs')
        with self.assertRaisesRegex(r.Hold,'identity'):self.execute(admission=admission)
        self.assert_no_finished();self.assertEqual(len(self.calls),1)

    def test_post_child_fence_failure_cannot_leave_finished(self):
        def admission(binding):
            result=self.admission(binding)
            (self.f.root/'machinery/study_context.py').write_text('post-child foreign source')
            return result
        with self.assertRaises(r.Hold):self.execute(admission=admission)
        self.assertTrue((self.out/'OPERATION.json').exists())
        self.assertTrue((self.out/'BINDING.json').exists())
        self.assert_no_finished()

    def test_no_uninjected_process_or_compiler_can_be_reached(self):
        from machinery import process,study_deployment
        with patch.object(process,'run',side_effect=AssertionError('real process forbidden')), \
             patch.object(study_deployment,'require_deployment',side_effect=AssertionError('real deployment forbidden')):
            self.execute()
        self.assertEqual(len(self.calls),1)

if __name__=='__main__':unittest.main()
