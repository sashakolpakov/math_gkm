"""Synthetic status routing; never inspect a real research state."""
import copy
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('long_validation_status_under_test',HERE/'status_public.py')
s=importlib.util.module_from_spec(spec);spec.loader.exec_module(s)
PARSER=s.PARSER


def write(path,value):
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(json.dumps(value,sort_keys=True)+'\n')


def digest(path):return hashlib.sha256(path.read_bytes()).hexdigest()


class StatusTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='gaussian-status1800-neutral-')
        self.addCleanup(self.tmp.cleanup)
        self.root=Path(self.tmp.name)
        self.base=self.root/'operations/new';self.base.mkdir(parents=True)
        self.ops=self.root/'operations/old';self.ops.mkdir(parents=True)
        self.original=self.root/'.scratch/studies/method-learning-gaussian-20261103'
        self.next=self.root/'.scratch/studies/method-learning-gaussian-20261103-v1800-epoch-0001'
        self.patchers=[patch.object(s,'ROOT',self.root),patch.object(s,'OPS',self.ops),
            patch.object(s,'ORIGINAL',self.original),patch.object(s,'PARSER',PARSER)]
        for item in self.patchers:item.start();self.addCleanup(item.stop)
        self.state(self.original,'baseline',19,8);self.state(self.original,'exploration',7,8)
        self.state(self.next,'baseline',0,0);self.state(self.next,'exploration',7,8)
        for name in ('owner.py','transition.py','watch_transition.py','funding_profile.py','finalize.py'):
            (self.base/name).write_text('synthetic source, never executed\n')
        (self.base/'status_public.py').write_bytes((HERE/'status_public.py').read_bytes())
        write(self.base/'successor-profile.json',{'validation_seconds':1800,'arm_seconds':1400000})
        self.hashes={p.name:digest(p) for p in self.base.iterdir() if p.is_file()}
        write(self.base/'REVIEW.json',{'approved':True,'source_hashes':self.hashes})
        write(self.base/'TESTS.json',{'passed':True,'source_hashes':self.hashes})
        self.q={'schema':s.QUALIFIED_SCHEMA,'approved':True,'contract_sha256':s.CONTRACT_SHA,
            'implementation_sha256':s.IMPLEMENTATION_SHA,'source_hashes':self.hashes,
            'profile_sha256':self.hashes['successor-profile.json'],
            'review':{'file':'REVIEW.json','sha256':digest(self.base/'REVIEW.json')},
            'tests':{'file':'TESTS.json','sha256':digest(self.base/'TESTS.json')}}
        self.saveq()
        epoch=self.ops/'continuation/epoch.py';epoch.parent.mkdir(parents=True)
        epoch.write_text('synthetic unchanged migration source\n')
        self.patchers.append(patch.object(s,'EPOCH_SHA',digest(epoch)))
        self.patchers[-1].start();self.addCleanup(self.patchers[-1].stop)
        for name in ('BINDING.json','TRANSITION.json'):write(self.base/name,{'synthetic_public_metadata':True})
        self.c={'schema':s.CONFIG_SCHEMA,'parent_study':str(self.original),
            'owner_source_sha256':self.hashes['owner.py'],'profile_path':str(self.base/'successor-profile.json'),
            'profile_sha256':self.q['profile_sha256'],'contract_sha256':s.CONTRACT_SHA,
            'implementation_sha256':s.IMPLEMENTATION_SHA,
            'epoch_source':self.ref(epoch),'finalization_source':self.ref(self.base/'finalize.py'),
            'transition_source':self.ref(self.base/'transition.py'),
            'funding_source':self.ref(self.base/'funding_profile.py'),
            'transition_binding':self.ref(self.base/'BINDING.json'),
            'transition_receipt':self.ref(self.base/'TRANSITION.json')}
        self.current={'schema':s.CURRENT_SCHEMA,'epoch':1,'phase':'research_running','root_proved':False,
            'updated_at':100.0,'owner_source_sha256':self.c['owner_source_sha256'],
            'profile_sha256':self.c['profile_sha256'],'contract_sha256':s.CONTRACT_SHA,
            'transition_receipt_sha256':self.c['transition_receipt']['sha256'],
            'parent_study':str(self.original),'original_comparison_study':str(self.original),
            'migration_first':True,'current_study':str(self.next)}
        self.saveconfig();self.savecurrent()

    def ref(self,path):return {'path':str(path),'sha256':digest(path)}
    def saveq(self):write(self.base/'QUALIFIED.json',self.q)
    def saveconfig(self):write(self.base/'CONFIG.json',self.c)
    def savecurrent(self):write(self.base/'runtime/CURRENT.json',self.current)
    def observe(self):return s.status(self.base)
    def state(self,study,mode,count,round):
        body=json.dumps({'round':round,'phase':'research','status':'ready','calls':2,'meta_calls':1,
            'seconds':0,'failures':0,'policy_trials':0,'active':None,'active_intent':None,'resolution':None,
            'research':{'knowledge':{str(i):{'private':'PRIVATE_SENTINEL'} for i in range(count)},
                        'components':{},'role_data':'PRIVATE_SENTINEL'}},sort_keys=True,separators=(',',':')).encode()
        path=study/'arms'/mode/'state.json';path.parent.mkdir(parents=True,exist_ok=True)
        path.write_bytes(b'{"sha256":'+json.dumps(hashlib.sha256(body).hexdigest()).encode()+b',"state":'+body+b'}\n')

    def test_valid_new_source_keeps_historical_comparison_separate(self):
        r=self.observe()
        self.assertEqual(r['study'],str(self.next));self.assertTrue(r['file_observation_only'])
        self.assertTrue(r['baseline_is_placeholder']);self.assertFalse(r['goal_owner']['root_proved'])
        self.assertEqual(r['arms']['baseline']['knowledge_count'],0)
        self.assertEqual(r['arms']['exploration']['knowledge_count'],7)
        self.assertEqual(r['historical_comparison']['arms']['baseline']['knowledge_count'],19)
        self.assertNotIn('PRIVATE_SENTINEL',str(r))

    def test_no_real_state_or_role_body_is_json_decoded(self):
        original=json.loads
        def guarded(value,*args,**kwargs):
            text=value.decode() if isinstance(value,bytes) else value
            if 'PRIVATE_SENTINEL' in text:raise AssertionError('private body was JSON decoded')
            return original(value,*args,**kwargs)
        with patch.object(json,'loads',side_effect=guarded):self.observe()

    def test_missing_pointer_is_not_reported_as_running_or_legacy(self):
        (self.base/'runtime/CURRENT.json').unlink()
        r=self.observe()
        self.assertEqual(r['goal_owner']['phase'],'waiting_new_owner_start')
        self.assertEqual(r['activation'],'qualified_transition_without_owner_observation')
        self.assertEqual(r['study'],str(self.original))

    def test_inactive_config_falls_back_only_to_pinned_historical_reader(self):
        (self.base/'CONFIG.json').unlink()
        legacy=self.ops/'status_public.py'
        legacy.write_text('from pathlib import Path\ndef selected_study():\n return Path('+repr(str(self.original))+'), {"phase":"research_running","epoch":0,"root_proved":False}\n')
        with patch.object(s,'LEGACY_READER_SHA',digest(legacy)):
            r=self.observe();self.assertEqual(r['activation'],'not_activated')
            self.assertEqual(r['arms']['baseline']['knowledge_count'],19)
        with self.assertRaises(RuntimeError):self.observe()

    def test_missing_or_unapproved_qualification_refuses(self):
        for value in (False,1,None):
            self.q['approved']=value;self.saveq()
            with self.subTest(value=value),self.assertRaises(RuntimeError):self.observe()
        (self.base/'QUALIFIED.json').unlink()
        with self.assertRaises(RuntimeError):self.observe()

    def test_source_change_and_review_change_refuse(self):
        (self.base/'owner.py').write_text('changed source\n')
        with self.assertRaises(RuntimeError):self.observe()
        (self.base/'owner.py').write_text('synthetic source, never executed\n')
        write(self.base/'REVIEW.json',{'approved':True,'source_hashes':{}})
        with self.assertRaises(RuntimeError):self.observe()

    def test_outside_or_mismatched_epoch_paths_refuse(self):
        for path,epoch in ((str(self.root/'outside'),1),(str(self.original),1),(str(self.next),2)):
            self.current.update(current_study=path,epoch=epoch);self.savecurrent()
            with self.subTest(path=path,epoch=epoch),self.assertRaises(RuntimeError):self.observe()

    def test_symlink_study_refuses(self):
        alias=self.root/'.scratch/studies/method-learning-gaussian-20261103-v1800-epoch-0002'
        alias.symlink_to(self.next,target_is_directory=True)
        self.current.update(current_study=str(alias),epoch=2);self.savecurrent()
        with self.assertRaises(RuntimeError):self.observe()

    def test_pointer_bindings_and_types_refuse(self):
        original=copy.deepcopy(self.current)
        for change in ({'epoch':True},{'root_proved':'yes'},{'updated_at':float('nan')},
                       {'updated_at':True},{'migration_first':False},{'profile_sha256':'a'*64},
                       {'transition_receipt_sha256':'b'*64},{'owner_source_sha256':'c'*64},
                       {'contract_sha256':'d'*64},{'parent_study':str(self.next)},
                       {'original_comparison_study':str(self.next)}):
            self.current={**original,**change};self.savecurrent()
            with self.subTest(change=change),self.assertRaises(RuntimeError):self.observe()

    def test_transition_receipt_change_refuses(self):
        write(self.base/'TRANSITION.json',{'changed':True})
        with self.assertRaises(RuntimeError):self.observe()

    def test_wrong_qualified_component_or_migration_source_refuses(self):
        original=copy.deepcopy(self.c)
        for key in ('transition_source','funding_source','finalization_source','epoch_source'):
            path=self.base/('another-'+key+'.py');path.write_text('another synthetic source\n')
            self.c={**original,key:self.ref(path)};self.saveconfig()
            with self.subTest(key=key),self.assertRaises(RuntimeError):self.observe()

    def test_state_integrity_refuses_before_observing_counters(self):
        path=self.next/'arms/exploration/state.json'
        value=path.read_bytes().replace(b'"calls":2',b'"calls":3')
        path.write_bytes(value)
        with self.assertRaises(RuntimeError):self.observe()

    def test_bootstrap_pointer_keeps_exact_parent(self):
        self.current.update(epoch=0,current_study=str(self.original),phase='checking_closed_parent')
        self.savecurrent();r=self.observe()
        self.assertEqual(r['study'],str(self.original));self.assertIsNone(r['historical_comparison'])
        self.current['current_study']=str(self.next);self.savecurrent()
        with self.assertRaises(RuntimeError):self.observe()


if __name__=='__main__':
    before={p.name:digest(p) for p in (HERE/'status_public.py',Path(__file__))}
    stream=io.StringIO();start=time.monotonic()
    with patch('subprocess.Popen',side_effect=AssertionError('no external process permitted')),\
         patch('subprocess.run',side_effect=AssertionError('no external command permitted')),\
         patch('os.system',side_effect=AssertionError('no external command permitted')):
        result=unittest.TextTestRunner(stream=stream,verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(StatusTests))
    after={p.name:digest(p) for p in (HERE/'status_public.py',Path(__file__))}
    receipt={'schema':'math-gkm.long-validation-status-tests.v1','passed':result.wasSuccessful() and before==after,
        'tests_run':result.testsRun,'failures':len(result.failures),'errors':len(result.errors),
        'source_hashes':before,'source_hashes_after':after,'source_unchanged_during_tests':before==after,
        'elapsed_seconds':time.monotonic()-start,'scope':'Synthetic public status routing, no real research state, model or proof checker',
        'test_log':stream.getvalue()}
    with (HERE/'STATUS_TEST_EXECUTION.json').open('x') as out:json.dump(receipt,out,sort_keys=True,indent=2);out.write('\n')
    print(json.dumps({key:receipt[key] for key in ('passed','tests_run','failures','errors','elapsed_seconds')},sort_keys=True))
    if not receipt['passed']:print(stream.getvalue())
    raise SystemExit(0 if receipt['passed'] else 1)
