"""Neutral qualification; no actual study, compiler, model or process launch."""
import ast
import copy
import importlib.util
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT))
from machinery.study_common import Invalid, digest, inventory, read, sha, write
from machinery.gate import Rejected
from machinery import study, study_context, resources

HERE = Path(__file__).resolve().parent

def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result

context = load('machinery.prelaunch_context_candidate', HERE/'study_context.py')
bridge = load('machinery.prelaunch_bridge_candidate', HERE/'study_bridge.py')

OLD_SOURCE = """import subprocess
class Arm:
    def call(self):
        event(self, 'record')
        subprocess.Popen(['neutral-never-executed'])
        event(self, 'later')
"""

def put(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    if isinstance(value, str): path.write_text(value)
    else: write(path, value)
    return path

def pointer(path): return {'path': str(path), 'sha256': sha(path)}

class Fixture:
    def __init__(self, base, index=7, mode='exploration'):
        base=base.resolve()
        self.base=base; self.index=index; self.key=f'plan-{index:04d}'
        self.archive=base/'.bootstrap/archive'; self.study=base/'.scratch/study'
        self.root=self.study/mode; self.workspace=self.root/'workspace'
        self.job=self.root/'jobs'/self.key
        put(self.workspace/'MathGKM/Neutral.lean', '-- neutral retained source\n')
        put(self.workspace/'contract.json', {'goal':'neutral'})
        self.p={'model':'gpt-6.1-sol','transport':'live','call_seconds':1800,
                'proposal_repairs':1, 'max_calls':16}
        put(self.study/'protocol.json', self.p)
        self.request={'role':'proposer','neutral':True,'planning_generation':
            {'index':0,'total_bound':2,'logical_round':index,'additional_paid_allowance':0}}
        self.full={**self.request,'model':self.p['model'],'reasoning_effort':'high','request_id':self.key}
        self.spec={'role':'proposer','request_id':self.key,'readonly':True,'transport':'live',
            'seconds':1800,'model':self.p['model'],'reasoning_effort':'high','workspace':str(self.workspace)}
        self.receipt={'role':'proposer','request_id':self.key,'model':self.p['model'],
            'reasoning_effort':'high','outcome':'uncertain_effects_not_replayed',
            'elapsed_seconds':1800,'payload':None,'usage':[]}
        put(self.job/'spec.json',self.spec);put(self.job/'request.json',self.full)
        put(self.job/'prompt.txt','neutral complete prompt\n');put(self.job/'receipt.json',self.receipt)
        self.s={'calls':1,'meta_calls':1,'seconds':1800,'reservations':{'call-'+self.key:1800},
            'budget_pools':{},'counted_jobs':[self.key],'receipts':[str(self.job)],
            'receipt_hashes':{str(self.job):digest(self.receipt)},'round':index,'phase':'research',
            'status':'running','failures':[],'policy_trials':[],'research':{},'active':None,
            'active_intent':None,'resolution':None,'protocol_state':{'pending':None,'inflight':False},
            'protocol_attempts':1,'protocol_reserved_seconds':30,'protocol_observed_seconds':0.25,
            'semantic_events':[],'host_events':[]}
        self.arm=types.SimpleNamespace(study=self.study,root=self.root,workspace=self.workspace,
            mode=mode,p=self.p,s=self.s)
        self.old_source=put(self.archive/'study.py',OLD_SOURCE)
        self.old_impl={'machinery/study.py':sha(self.old_source),'machinery/other.py':'0'*64}
        self.new_impl={'machinery/study.py':sha(self.old_source),
            'machinery/study_context.py':sha(HERE/'study_context.py'),
            'machinery/study_bridge.py':sha(HERE/'study_bridge.py')}
        self.old_seal=put(self.archive/'old-seal.json',{'implementation':self.old_impl})
        self.trace=put(self.archive/'trace.txt',f'File "{base}/machinery/study.py", line 4, in call\n  event(self, \'record\')\n')
        self.log=put(self.archive/'native.log','neutral exception\n'+self.trace.read_text())
        self.obs={'schema':'math-gkm.closed-prelaunch-proposer-observation.v1','study':str(self.study),
            'arm':mode,'logical_round':index,'failed_request_id':self.key,
            'old_implementation_sha256':digest(self.old_impl),'old_study_source':pointer(self.old_source),
            'trace':pointer(self.trace),'native_log':pointer(self.log),
            'failed_frame':{'filename':str(base/'machinery/study.py'),'function':'call','lineno':4},
            'old_owner_exit':{'actual_numeric_exit_observed':True,'returncode':2,
                'owned_tool_handle':'neutral-owned-handle','completion_reference':'neutral-own-tool-exit'},
            'old_native_exit':{'actual_numeric_exit_observed':True,'returncode':1,
                'completion_reference':'neutral-native-exit'},
            'native_recovery_exit':{'actual_numeric_exit_observed':True,'returncode':0,
                'completion_reference':'neutral-recovery-exit'},
            'watchdog_popen_reached':False,'model_started':False,'cleanup_verified':True}
        self.obs_path=put(self.archive/'observation.json',self.obs)
        self.grant_path=self.archive/'grant.json'
        self.g={'schema':'math-gkm.closed-prelaunch-proposer-recovery.v1','study':str(self.study),
            'arm':mode,'logical_round':index,'failed_request_id':self.key,'next_request_id':self.key+'-repair-1',
            'request_binding':digest(self.full),'receipt_binding':digest(self.receipt),
            'receipt_file_sha256':sha(self.job/'receipt.json'),'spec_sha256':sha(self.job/'spec.json'),
            'prompt_sha256':sha(self.job/'prompt.txt'),'protocol_sha256':sha(self.study/'protocol.json'),
            'old_implementation_sha256':digest(self.old_impl),'implementation_sha256':digest(self.new_impl),
            'old_seal_sha256':sha(self.old_seal),'stopped_state_sha256':'b'*64,
            'recovery_projection_sha256':digest(context.prelaunch_recovery_projection(self.s)),
            'workspace_binding':digest(inventory(self.workspace)),
            'prelaunch_observation':pointer(self.obs_path),
            'classification':'closed_protocol_guard_failure_before_watchdog',
            'no_model_started':True,'native_cleanup_verified':True}
        self.refresh()

    def refresh(self):
        put(self.obs_path,self.obs);self.g['prelaunch_observation']=pointer(self.obs_path)
        core={k:copy.deepcopy(self.g[k]) for k in context.PRELAUNCH_CORE_FIELDS}
        core.update(schema='math-gkm.prelaunch-source-revision.v1',
            prelaunch_observation_sha256=sha(self.obs_path),old_seal=pointer(self.old_seal))
        self.g['revision_core']=core;self.g['revision_binding']=digest(core)
        put(self.grant_path,self.g)
        seal={'implementation':self.new_impl,'source_revision':{'record':str(self.grant_path),
            'binding':digest(core),'old_seal_sha256':self.g['old_seal_sha256']}}
        put(self.study/'seal.json',seal);self.s['seal_hash']=digest(seal)
        put(self.base/'.bootstrap/study-authorization.json',{'prelaunch_recovery':pointer(self.grant_path),
            'implementation_sha256':digest(self.new_impl),'user_explicit_ok':True})

    def accept_receipt(self):
        put(self.job/'receipt.json',self.receipt)
        self.g.update(receipt_binding=digest(self.receipt),receipt_file_sha256=sha(self.job/'receipt.json'))
        self.s['receipt_hashes'][str(self.job)]=digest(self.receipt)
        self.g['recovery_projection_sha256']=digest(context.prelaunch_recovery_projection(self.s))
        self.refresh()

    def invoke(self):
        with patch.object(context,'ROOT',self.base),patch.object(context,'implementation',return_value=self.new_impl):
            return context.operational_recovery(self.arm,self.key,self.receipt,self.request,self.workspace,self.index)

class PrelaunchTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        self.f=Fixture(Path(self.tmp.name))

    def test_generic_indices_and_both_arms(self):
        for index,mode in [(1,'baseline'),(7,'exploration'),(30,'baseline'),(10001,'exploration')]:
            f=Fixture(Path(self.tmp.name)/f'{mode}{index}',index,mode)
            self.assertEqual(f.invoke()['previous_request'],f.key)
            self.assertEqual(read(f.job/'prelaunch-recovery.json')['next_request_id'],f.key+'-repair-1')

    def test_old_charge_receipt_and_idempotence(self):
        f=self.f;before=copy.deepcopy(f.s);raw=(f.job/'receipt.json').read_bytes()
        first=f.invoke();marker=(f.job/'prelaunch-recovery.json').read_bytes()
        self.assertEqual(first,f.invoke());self.assertEqual(marker,(f.job/'prelaunch-recovery.json').read_bytes())
        self.assertEqual(before,f.s);self.assertEqual(raw,(f.job/'receipt.json').read_bytes())
        self.assertNotIn('returncode',read(f.job/'receipt.json'))

    def test_evidence_verifier_is_pure(self):
        f=self.f;before=copy.deepcopy(f.s)
        with patch.object(context,'ROOT',f.base):
            result=context.validate_prelaunch_evidence(f.g)
        self.assertEqual(result['observation_sha256'],sha(f.obs_path))
        self.assertEqual(f.s,before);self.assertFalse((f.job/'prelaunch-recovery.json').exists())

    def test_every_worker_artifact_rejects(self):
        for name in ['worker.json','watchdog.log','process.json','events.jsonl','final.json','before.json','unknown']:
            with self.subTest(name=name):
                p=put(self.f.job/name,'')
                with self.assertRaises(Invalid):self.f.invoke()
                p.unlink()
        p=self.f.job/'unexpected';p.mkdir()
        with self.assertRaises(Invalid):self.f.invoke()

    def test_receipt_returncode_key_always_rejects(self):
        for value in [0,1,None,False]:
            with self.subTest(value=value):
                self.f.receipt['returncode']=value;self.f.accept_receipt()
                with self.assertRaises(Invalid):self.f.invoke()
        self.f.receipt.pop('returncode')

    def test_payload_or_role_or_refund_rejects_even_rehashed(self):
        for field,value in [('payload',{}),('role','researcher'),('elapsed_seconds',0),('outcome','completed')]:
            f=Fixture(Path(self.tmp.name)/field)
            f.receipt[field]=value;f.accept_receipt()
            with self.assertRaises(Invalid):f.invoke()

    def test_immutable_job_bytes_each_reject(self):
        for name in ['spec.json','request.json','prompt.txt','receipt.json']:
            f=Fixture(Path(self.tmp.name)/name)
            if name=='request.json':put(f.job/name,{**f.full,'neutral':False})
            else:
                with (f.job/name).open('a') as out:out.write(' ')
            with self.assertRaises(Invalid):f.invoke()

    def test_workspace_protocol_and_accounting_changes_reject(self):
        for kind in ['workspace','protocol','seconds','calls','meta_calls','reservation','protocol_attempts','semantic_events','active','guard']:
            f=Fixture(Path(self.tmp.name)/kind)
            if kind=='workspace':put(f.workspace/'research/changed.md','new source')
            elif kind=='protocol':put(f.study/'protocol.json',{**f.p,'call_seconds':1801})
            elif kind=='reservation':f.s['reservations']['call-'+f.key]=0
            elif kind=='semantic_events':f.s[kind]=['new event']
            elif kind=='active':f.s[kind]={'job':'unexpected'}
            elif kind=='guard':f.s['protocol_state']['inflight']=True
            else:f.s[kind]=0
            with self.subTest(kind=kind),self.assertRaises(Invalid):f.invoke()

    def test_trace_and_source_are_not_free_operator_booleans(self):
        f=self.f;f.obs['failed_frame']['lineno']=6
        put(f.trace,f'File "{f.base}/machinery/study.py", line 6, in call\n')
        put(f.log,f.trace.read_text());f.obs.update(trace=pointer(f.trace),native_log=pointer(f.log));f.refresh()
        with self.assertRaises(Invalid):f.invoke()

    def test_trace_must_be_exact_original_log_excerpt(self):
        f=self.f;put(f.log,'unrelated retained native log')
        f.obs['native_log']=pointer(f.log);f.refresh()
        with self.assertRaises(Invalid):f.invoke()

    def test_archived_old_source_must_match_old_seal(self):
        f=self.f;put(f.old_source,OLD_SOURCE+'# substituted source\n')
        f.obs['old_study_source']=pointer(f.old_source);f.refresh()
        with self.assertRaises(Invalid):f.invoke()

    def test_actual_numeric_closure_and_no_launch_all_required(self):
        cases=[('old_owner_exit','returncode',False),('old_native_exit','returncode',0),
            ('native_recovery_exit','returncode',1),('old_owner_exit','owned_tool_handle',''),
            ('old_native_exit','actual_numeric_exit_observed',False),
            (None,'watchdog_popen_reached',True),(None,'model_started',True),(None,'cleanup_verified',False)]
        for n,(section,key,value) in enumerate(cases):
            f=Fixture(Path(self.tmp.name)/str(n));(f.obs[section] if section else f.obs)[key]=value;f.refresh()
            with self.subTest(section=section,key=key),self.assertRaises(Invalid):f.invoke()

    def test_wrong_scope_is_not_a_general_uncertainty_bypass(self):
        f=self.f;f.g['failed_request_id']='plan-0008';f.refresh()
        self.assertIsNone(f.invoke())
        f.g['failed_request_id']=f.key;f.g['next_request_id']=f.key+'-repair-2';f.refresh()
        with self.assertRaises(Invalid):f.invoke()

    def test_existing_repair_before_consumption_and_changed_marker_reject(self):
        f=self.f;repair=f.root/'jobs'/(f.key+'-repair-1');repair.mkdir()
        with self.assertRaises(Invalid):f.invoke()
        repair.rmdir();f.invoke();put(f.job/'prelaunch-recovery.json',{'forged':True})
        with self.assertRaises(Invalid):f.invoke()

    def test_registered_ordinary_repair_is_idempotent_and_fully_charged(self):
        f=self.f;first=f.invoke();key=f.key+'-repair-1';job=f.root/'jobs'/key
        put(job/'spec.json',{**f.spec,'request_id':key})
        f.s['counted_jobs'].append(key);f.s['reservations']['call-'+key]=1800
        f.s['calls']+=1;f.s['meta_calls']+=1;f.s['seconds']+=1800
        self.assertEqual(first,f.invoke())
        f.s['reservations']['call-'+key]=0
        with self.assertRaises(Invalid):f.invoke()

    def run_native_planner(self,uncertain_repair=False):
        f=self.f;calls=[]
        f.arm.cached_planner_request=types.MethodType(study.Arm.cached_planner_request,f.arm)
        f.arm.closed_planner_receipt=types.MethodType(study.Arm.closed_planner_receipt,f.arm)
        def call(logical,role,request,workspace,readonly):
            self.assertEqual(logical,f.key+'-repair-1');calls.append(logical)
            job=f.root/'jobs'/logical
            req={**request,'model':f.p['model'],'reasoning_effort':'high','request_id':logical}
            put(job/'request.json',req);put(job/'spec.json',{**f.spec,'request_id':logical})
            result={**f.receipt,'request_id':logical,'outcome':'completed','returncode':0,
                'before':{},'after':{},'resources':{},'payload':{'neutral':'valid'}}
            if uncertain_repair:result.pop('returncode');result['outcome']='uncertain_effects_not_replayed'
            put(job/'receipt.json',result)
            f.s['counted_jobs'].append(logical);f.s['receipts'].append(str(job))
            f.s['receipt_hashes'][str(job)]=digest(result);f.s['reservations']['call-'+logical]=1800
            f.s['calls']+=1;f.s['meta_calls']+=1;f.s['seconds']+=1800
            return result
        f.arm.call=call
        with patch.object(context,'ROOT',f.base),patch.object(context,'implementation',return_value=f.new_impl), \
             patch.object(study_context,'operational_recovery',side_effect=context.operational_recovery), \
             patch.object(study.policy,'commit',return_value=({'neutral':'staged'},{'neutral':'commitment'})):
            result=study.Arm.plan_with_repair(f.arm,f.key,{'neutral':True},{},f.workspace,f.index,f.p)
        return result,calls

    def test_native_planner_uses_unique_paid_repair_never_old_slot(self):
        raw=(self.f.job/'receipt.json').read_bytes()
        result,calls=self.run_native_planner()
        self.assertEqual(calls,[self.f.key+'-repair-1']);self.assertEqual(self.f.s['calls'],2)
        self.assertEqual(self.f.s['seconds'],3600);self.assertEqual(raw,(self.f.job/'receipt.json').read_bytes())
        self.assertEqual(result,({'neutral':'staged'},{'neutral':'commitment'}))

    def test_uncertain_repair_never_authorizes_a_third_identity(self):
        with self.assertRaisesRegex(Invalid,'no uncertain action replay'):self.run_native_planner(True)
        self.assertEqual(self.f.s['calls'],2)
        self.assertFalse((self.f.root/'jobs'/(self.f.key+'-repair-2')).exists())

    def test_historical_handler_is_byte_identical_after_rename(self):
        old=(ROOT/'machinery/study_context.py').read_text()
        new=(HERE/'study_context.py').read_text()
        a=old[old.index('def operational_recovery('):].rstrip()
        b=new[new.index('def _historical_operational_recovery('):new.index('# Prospective generic pre-watchdog')].rstrip()
        self.assertEqual(a,b.replace('def _historical_operational_recovery(','def operational_recovery(',1))

class BridgeTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        self.base=Path(self.tmp.name);self.root=self.base/'arm';self.workspace=self.root/'workspace'
        for name in ['MathGKM/Protocol.lean','machinery/protocol.py','machinery/study_bridge.py']:
            put(self.base/name,'# neutral source\n')
        put(self.workspace/'contract.json',{'neutral':True})
        self.arm=types.SimpleNamespace(root=self.root,workspace=self.workspace,p={'max_calls':2},
            s={'protocol_state':bridge.initial(2),'research':{},'semantic_events':[],
               'active_intent':None},save=lambda:None)
        self.command={'kind':'neutral'}
        self.stack=[]
        for obj,name,value in [(bridge,'ROOT',self.base),(resources,'headroom',lambda _:None)]:
            p=patch.object(obj,name,value);p.start();self.addCleanup(p.stop)

    def event(self,effects):
        with patch.object(bridge.protocol,'transition',side_effect=effects) as transition:
            result=bridge.event(self.arm,self.command)
        return result,transition

    def test_single_pure_retry_has_both_charges_one_commit(self):
        before=copy.deepcopy(self.arm.s['protocol_state']);after={**before,'count':1}
        result,t=self.event([Rejected('neutral guard subprocess rejection'),after])
        self.assertEqual(t.call_count,2);self.assertEqual(self.arm.s['protocol_attempts'],2)
        self.assertEqual(self.arm.s['protocol_reserved_seconds'],60)
        self.assertEqual(len(self.arm.s['semantic_events']),1)
        self.assertEqual(t.call_args_list[0],t.call_args_list[1])
        self.assertEqual(result['after'],after)

    def test_second_rejection_never_commits_and_is_charged(self):
        with self.assertRaises(Rejected):self.event([Rejected('first'),Rejected('second')])
        self.assertEqual(self.arm.s['protocol_attempts'],2)
        self.assertEqual(self.arm.s['protocol_reserved_seconds'],60)
        self.assertEqual(self.arm.s['semantic_events'],[])

    def test_success_does_not_use_extra_attempt(self):
        _,t=self.event([bridge.initial(2)])
        self.assertEqual(t.call_count,1);self.assertEqual(self.arm.s['protocol_reserved_seconds'],30)

    def test_source_or_guard_or_command_mutation_never_retries(self):
        for what in ['source','guard','command']:
            self.setUp()
            def reject(_before,_command):
                if what=='source':put(self.base/'machinery/protocol.py','changed')
                elif what=='guard':self.arm.s['protocol_state']['count']=1
                else:self.command['changed']=True
                raise Rejected('neutral')
            with self.subTest(what=what),patch.object(bridge.protocol,'transition',side_effect=reject) as t:
                with self.assertRaises(Rejected):bridge.event(self.arm,self.command)
                self.assertEqual(t.call_count,1)
                self.assertEqual(self.arm.s['semantic_events'],[])

    def test_source_mutation_after_success_never_commits(self):
        def success(_before,_command):
            put(self.base/'MathGKM/Protocol.lean','changed');return bridge.initial(2)
        with self.assertRaises(Invalid):self.event(success)
        self.assertEqual(self.arm.s['semantic_events'],[])

    def test_headroom_refusal_prevents_second_attempt(self):
        with patch.object(resources,'headroom',side_effect=resources.ResourceFailure('floor')):
            with patch.object(bridge.protocol,'transition',side_effect=Rejected('first')) as t:
                with self.assertRaises(resources.ResourceFailure):bridge.event(self.arm,self.command)
                self.assertEqual(t.call_count,1)

    def test_original_allowance_caps_retry(self):
        self.arm.s['protocol_attempts']=9
        with self.assertRaises(Rejected):self.event([Rejected('last original allowance')])
        self.assertEqual(self.arm.s['protocol_attempts'],10)
        self.assertEqual(self.arm.s['protocol_reserved_seconds'],300)
        with patch.object(bridge.protocol,'transition') as t:
            with self.assertRaises(Invalid):bridge.event(self.arm,self.command)
            t.assert_not_called()

if __name__=='__main__': unittest.main()
