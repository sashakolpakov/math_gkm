"""Synthetic closed-resume tests; no live state, models or Lean invocation."""
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent

def load(path,name):
    spec=importlib.util.spec_from_file_location(name,path);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module

o=load(HERE/'owner.py','closed_resume_owner_tested')
r=load(HERE/'settlement.py','closed_resume_settlement_tested')
previous=load(HERE.parent/'continuation/test_continuation.py','closed_resume_prior_synthetic_fixtures')

def put(path,value):
    path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(value,sort_keys=True,separators=(',',':'))+'\n');return path

def ref(path):return {'path':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}

def envelope(path,state):return put(path,{'state':state,'sha256':r.digest(state)})

class Fixture(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.study=self.root/'.scratch/studies/original';self.key='review-source-v1-8';self.job=self.study/'arms/exploration/jobs'/self.key
        self.source=self.root/'machinery/study.py';self.source.parent.mkdir();self.source.write_text('class Arm:\n def call(self):\n  event(self, {"issue": {"id": "example"}})\n  child = subprocess.Popen(["neutral"])\n')
        implementation={'machinery/study.py':ref(self.source)['sha256']};self.impl=r.digest(implementation)
        self.protocol=put(self.study/'protocol.json',{'model':'gpt-6.1-sol','transport':'live','call_seconds':1800,'validation_seconds':600,'rounds':8})
        self.seal=put(self.study/'seal.json',{'implementation':implementation})
        self.spec={'request_id':self.key,'role':'reviewer','readonly':True,'transport':'live','model':'gpt-6.1-sol','reasoning_effort':'high','seconds':1800,'workspace':str(self.study/'arms/exploration/roles'/self.key)}
        self.request={'request_id':self.key,'role':'reviewer','review_scope':'own_sources_only','records':'inbox/records.json','model':'gpt-6.1-sol','reasoning_effort':'high','private_canary':'request subtree never decoded wholesale'}
        self.receipt={'request_id':self.key,'role':'reviewer','outcome':'uncertain_effects_not_replayed','payload':None,'elapsed_seconds':1800,'model':'gpt-6.1-sol','reasoning_effort':'high','mathematical_resolution':False}
        put(self.job/'spec.json',self.spec);put(self.job/'request.json',self.request);put(self.job/'receipt.json',self.receipt);(self.job/'prompt.txt').write_text('private prompt is opaque')
        self.state={'round':8,'phase':'review','status':'running','calls':34,'meta_calls':16,'research':{'private_canary':'never decode theory'},
            'active':None,'active_intent':None,'resolution':None,'reservations':{'call-'+self.key:1800,'pool-review-8':3600},
            'counted_jobs':[self.key],'receipts':[str(self.job)],'receipt_hashes':{str(self.job):r.digest(self.receipt)},
            'budget_pools':{'review-8':{'cap':3600,'spent':1800,'calls':2,'calls_spent':1,'meta_calls':2,'meta_calls_spent':1}},'protocol_attempts':40,'protocol_reserved_seconds':1200,
            'protocol_state':{'pending':None,'inflight':False,'count':33}}
        self.archive=envelope(self.root/'.bootstrap/after/exploration.raw',self.state)
        self.live=envelope(self.study/'arms/exploration/state.json',self.state)
        baseline={'round':8,'phase':'research','status':'finite_budget_finished; root_open','active':None,'active_intent':None,'resolution':None}
        self.basearchive=envelope(self.root/'.bootstrap/after/baseline.raw',baseline);self.baselive=envelope(self.study/'arms/baseline/state.json',baseline)
        self.trace=self.root/'.bootstrap/trace.txt';self.trace.write_text(f'  File "{self.source}", line 3, in call\n    event(self, command)\n')
        self.log=self.root/'.bootstrap/native.log';self.log.write_bytes(self.trace.read_bytes()+b'ResourceFailure: ADMISSION_DISK_HEADROOM\n')
        self.native_exit=put(self.root/'.bootstrap/command/EXIT.json',{'actual_numeric_exit_observed':True,'owned_handle':True,'returncode':1,'log_sha256':ref(self.log)['sha256']})
        self.preconfig=put(self.root/'.bootstrap/predecessor-config.json',{'public':'original settings'})
        self.finished=put(self.root/'.bootstrap/old-FINISHED.json',{'public':'explicit source revision'})
        self.closures={
            'owner_exit':{'actual_numeric_exit_observed':True,'returncode':2,'completion_reference':'synthetic closed handle observation','owned_tool_handle':'fixture-owned-handle'},
            'native_exit':{'actual_numeric_exit_observed':True,'returncode':1,'completion_reference':'synthetic owned child exit','record':ref(self.native_exit)},
            'recovery_exit':{'actual_numeric_exit_observed':True,'returncode':0,'completion_reference':'synthetic genuine native recovery'}}
        identity={'study':str(self.study),'arm':'exploration','request_id':self.key,'round':8,'role':'reviewer',
            'implementation_sha256':self.impl,'contract_sha256':o.CONTRACT_SHA}
        self.observation={'schema':r.OBSERVATION_SCHEMA,**identity,**self.closures,'watchdog_popen_reached':False,'model_started':False,'cleanup_verified':True,
            'predecessor_owner':{'path':str(o.PREDECESSOR),'sha256':o.PREDECESSOR_SHA},'predecessor_config':ref(self.preconfig),
            'predecessor_output':str(self.root/'.bootstrap/old-owner'),'native_log':ref(self.log),'native_study_source':ref(self.source),'trace':ref(self.trace),
            'failed_frame':{'filename':str(self.source),'function':'call','lineno':3}}
        self.obspath=put(self.root/'.bootstrap/OBSERVATION.json',self.observation)
        self.certificate={'schema':r.SCHEMA,**identity,'paid_retry_authorized':False,'observation':ref(self.obspath),'recovered_state':ref(self.archive),'protocol':ref(self.protocol),
            **{name:ref(self.job/file) for name,file in {'spec':'spec.json','request':'request.json','receipt':'receipt.json','prompt':'prompt.txt'}.items()}}
        self.certpath=put(self.root/'.bootstrap/CERTIFICATE.json',self.certificate)
        self.handler=self.root/'.bootstrap/handler.py';self.handler.write_text('synthetic separately pinned handler source')
        self.handoff={'schema':o.HANDOFF_SCHEMA,'study':str(self.study),'arm':'exploration','contract_sha256':o.CONTRACT_SHA,'implementation_sha256':self.impl,
            'predecessor_owner':self.observation['predecessor_owner'],'predecessor_config':ref(self.preconfig),'predecessor_output':self.observation['predecessor_output'],
            'revision_finished':ref(self.finished),'paid_review_replay_authorized':False,**self.closures,
            'seal':ref(self.seal),'protocol':ref(self.protocol),'extra_nonlaunch':ref(self.certpath),
            'recovered_states':{'baseline':{'current':ref(self.baselive),'archive':ref(self.basearchive)},'exploration':{'current':ref(self.live),'archive':ref(self.archive)}}}
        self.handoffpath=put(self.root/'.bootstrap/HANDOFF.json',self.handoff)
        self.c={'parent_study':str(self.study),'contract_sha256':o.CONTRACT_SHA,'implementation_sha256':self.impl,'resume_predecessor_config':ref(self.preconfig),
            'revision_finished':ref(self.finished),'resume_handoff':ref(self.handoffpath),'resume_settlement_source':ref(self.handler)}
        for module in (o,o.O,r,r.H):
            p=patch.object(module,'ROOT',self.root);p.start();self.addCleanup(p.stop)
    def save(self):
        put(self.obspath,self.observation);self.certificate['observation']=ref(self.obspath)
        put(self.certpath,self.certificate);self.handoff['extra_nonlaunch']=ref(self.certpath)
        put(self.handoffpath,self.handoff);self.c['resume_handoff']=ref(self.handoffpath)
    def validate(self):return r.validate_certificate(ref(self.certpath),self.c)

class CertificateTests(Fixture):
    def test_exact_original_review_no_launch_is_settled_without_retry(self):
        value=self.validate();self.assertTrue(value['settled']);self.assertFalse(value['paid_retry_authorized'])
    def test_worker_artifact_refuses_certificate(self):
        put(self.job/'process.json',{'pid':123})
        with self.assertRaises(r.Hold):self.validate()
    def test_unknown_uncertainty_is_not_settled(self):
        put(self.job.parent/'other/receipt.json',{'request_id':'other','outcome':'uncertain_effects_not_replayed'})
        with patch.object(r.H,'grant',return_value={}):
            row=r.settlement(self.study,'exploration',{},ref(self.certpath),self.c)
        self.assertFalse(row['all_jobs_settled']);self.assertFalse(row['all_job_receipts_numeric'])
    def test_valid_review_stays_nonnumeric(self):
        with patch.object(r.H,'grant',return_value={}):row=r.settlement(self.study,'exploration',{},ref(self.certpath),self.c)
        self.assertTrue(row['all_jobs_settled']);self.assertFalse(row['all_job_receipts_numeric']);self.assertEqual(row['certified_readonly_role_nonlaunch_count'],1)
    def test_bad_role_or_readonly_or_paid_retry_refuses(self):
        for field,value in (('role','researcher'),('readonly',False)):
            spec=copy.deepcopy(self.spec);spec[field]=value;put(self.job/'spec.json',spec);self.certificate['spec']=ref(self.job/'spec.json');self.save()
            with self.assertRaises(r.Hold):self.validate()
        put(self.job/'spec.json',self.spec);self.certificate['spec']=ref(self.job/'spec.json');self.certificate['paid_retry_authorized']=True;self.save()
        with self.assertRaises(r.Hold):self.validate()
    def test_refunded_charge_or_changed_review_pool_refuses(self):
        for mutate in (lambda s:s['reservations'].__setitem__('call-'+self.key,0),lambda s:s['budget_pools']['review-8'].__setitem__('cap',7200)):
            state=copy.deepcopy(self.state);mutate(state);envelope(self.archive,state)
            self.certificate['recovered_state']=ref(self.archive);self.handoff['recovered_states']['exploration']['archive']=ref(self.archive);self.handoff['recovered_states']['exploration']['current']['sha256']=ref(self.archive)['sha256'];self.save()
            with self.assertRaises(r.Hold):self.validate()
    def test_review_workspace_must_be_exact_role_workspace(self):
        spec=copy.deepcopy(self.spec);spec['workspace']=str(self.study/'arms/exploration/workspace');put(self.job/'spec.json',spec)
        self.certificate['spec']=ref(self.job/'spec.json');self.save()
        with self.assertRaises(r.Hold):self.validate()
    def test_missing_actual_closed_exit_refuses(self):
        self.observation['owner_exit']['actual_numeric_exit_observed']=False;self.save()
        with self.assertRaises(r.Hold):self.validate()
    def test_source_frame_after_popen_refuses(self):
        self.observation['failed_frame']['lineno']=4;self.save()
        with self.assertRaises(r.Hold):self.validate()
    def test_request_receipt_or_trace_tampering_refuses(self):
        self.trace.write_text('not the observed source trace')
        with self.assertRaises(r.Hold):self.validate()
    def test_private_request_and_theory_not_decoded(self):
        original=json.loads
        def guarded(data,*args,**kw):
            value=data.decode() if isinstance(data,bytes) else str(data)
            if 'private_canary' in value and value.lstrip().startswith(('{','[')):raise AssertionError('private request or theory decoded')
            return original(data,*args,**kw)
        with patch.object(json,'loads',guarded):self.assertTrue(self.validate()['settled'])

class HandoffTests(Fixture):
    def verify(self,initial):
        with patch.object(o,'load',return_value=r),patch.object(o.O,'verify_revision',return_value={'grant':{'public':'old certificate'},'actual_numeric_exit_observed':True}):
            return o.verify_handoff(self.c,initial=initial,native_checks=False)
    def test_new_stopped_state_cas_then_normal_progress_is_allowed(self):
        self.verify(True);envelope(self.live,{**self.state,'phase':'research','calls':35})
        self.verify(False)
        with self.assertRaises(o.Hold):self.verify(True)
    def test_original_revision_checked_without_obsolete_initial_state(self):
        with patch.object(o,'load',return_value=r),patch.object(o.O,'verify_revision',return_value={'grant':{},'actual_numeric_exit_observed':True}) as verify:
            o.verify_handoff(self.c,initial=True,native_checks=False)
        self.assertEqual(verify.call_args.kwargs,{'initial':False,'native_checks':False})
    def test_handoff_for_different_theorem_refuses(self):
        self.handoff['contract_sha256']='f'*64;self.save()
        with self.assertRaises(o.Hold):self.verify(False)
    def test_uncertainty_never_turns_into_numeric_exit(self):
        receipt=copy.deepcopy(self.receipt);receipt['returncode']=0;put(self.job/'receipt.json',receipt)
        self.certificate['receipt']=ref(self.job/'receipt.json');self.save()
        with self.assertRaises(r.Hold):self.validate()

class Lifecycle(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve();self.parent=self.root/'parent';self.parent.mkdir()
        self.c={'parent_study':str(self.parent),'successor_root':str(self.root/'studies'),'owner_source_sha256':'d'*64,'contract_sha256':'c'*64,
            'profile_sha256':'e'*64,'revision_finished':{'path':str(self.root/'finish'),'sha256':'b'*64},'resume_handoff':{'path':str(self.root/'handoff'),'sha256':'a'*64}}
        o.O.B.STOPPING=False
    def instance(self,n=1):
        backend=previous.Fake(self.parent,n);backend.rows[str(self.parent)]['exploration'].update(round=8,phase='review',calls=34)
        return o.Owner(self.c,self.root/'runtime',backend),backend
    def test_resume_round8_review_runs_only_exploration600(self):
        owner,b=self.instance();self.assertEqual(owner.run(),0);self.assertEqual(b.runs,[(str(self.parent),False)]);self.assertFalse(b.recoveries)
        pointer=o.public_json(self.root/'runtime/CURRENT.json');self.assertEqual(pointer['schema'],o.CURRENT_SCHEMA);self.assertEqual(pointer['resume_handoff_sha256'],'a'*64)
    def test_finite_original_then_inherited_funded1800_successors(self):
        owner,b=self.instance(3);self.assertEqual(owner.run(),0);self.assertEqual(len(b.migrations),2);self.assertTrue(all(not both for _,both in b.runs))
        self.assertEqual(b.finalizations[0],(str(self.parent),True));self.assertEqual(owner.state['epoch'],2)
    def test_curation_uses_actual_new_source_identity(self):
        backend=o.Native({'owner_source_sha256':'c'*64},self.root/'runtime')
        argv=['python','-c','neutral-source',str(self.root/'curation'),'contract',str(o.PREDECESSOR),'c'*64]
        with patch.object(o.O.B.Native,'command',return_value=0) as command:backend.command('curation',argv,self.parent)
        self.assertEqual(command.call_args.args[1][-2:], [str(HERE/'owner.py'),'c'*64])

class NativeCachedReview(unittest.TestCase):
    def test_actual_cached_call_never_launches_or_refunds(self):
        sys.path.insert(0,str(o.ROOT));from machinery.study import Arm
        with tempfile.TemporaryDirectory() as directory:
            armroot=Path(directory).resolve();key='review-source-v1-8';req={'role':'reviewer','records':'inbox/records.json','review_scope':'own_sources_only'}
            expected={**req,'model':'gpt-6.1-sol','reasoning_effort':'high','request_id':key}
            job=armroot/'jobs'/key;put(job/'request.json',expected)
            receipt={'request_id':key,'role':'reviewer','outcome':'uncertain_effects_not_replayed','payload':None,'elapsed_seconds':1800}
            put(job/'receipt.json',receipt);consumed=[]
            def forbidden(*_):raise AssertionError('cached review must not launch/fund/deploy')
            arm=SimpleNamespace(root=armroot,p={'model':'gpt-6.1-sol'},consume=lambda job,record:consumed.append(record) or record,
                ensure_deployment=forbidden,permitted=forbidden,reserve=forbidden)
            self.assertEqual(Arm.call(arm,key,'reviewer',req,armroot,True),receipt)
            self.assertEqual(consumed,[receipt]);self.assertFalse(Arm.checked_findings(arm,receipt,armroot))



class StatusTests(Fixture):
    def test_status_preserves_nonnumeric_settled_flags_and_current600(self):
        m=load(HERE/'status_public.py','closed_resume_status_tested')
        base=self.root/'.bootstrap/status';base.mkdir(parents=True)
        source=base/'owner.py';source.write_bytes((HERE/'owner.py').read_bytes())
        outer=put(base/'CONFIG.json',{'owner_source_sha256':ref(source)['sha256']})
        output=base/'runtime'
        pointer={'schema':o.CURRENT_SCHEMA,'owner_source_sha256':ref(source)['sha256'],'contract_sha256':self.c['contract_sha256'],
            'revision_finished_sha256':self.c['revision_finished']['sha256'],'resume_handoff_sha256':self.c['resume_handoff']['sha256'],
            'parent_study':str(self.study),'current_study':str(self.study),'epoch':0,'phase':'research_running','updated_at':1,'root_proved':False}
        put(output/'CURRENT.json',pointer)
        put(base/'REGISTRATION.json',{'schema':'math-gkm.gaussian-closed-resume-status-registration.v1','approved':True,
            'owner_source':ref(source),'status_source_sha256':ref(HERE/'status_public.py')['sha256'],'config':ref(outer),'output':str(output)})
        # Fixed fixture public counters; these are not mathematical evidence.
        rows={'baseline':{'all_job_receipts_numeric':True,'all_jobs_settled':True},
            'exploration':{'all_job_receipts_numeric':False,'all_jobs_settled':True,'certified_prelaunch_uncertainty_count':2}}
        with patch.object(m,'ROOT',self.root),patch.object(m,'ORIGINAL',self.study),patch.object(m,'load',return_value=o),patch.object(o,'configuration',return_value=self.c),patch.object(o,'verify_handoff',return_value={}),patch.object(o,'public_study',return_value=rows):
            result=m.status(base)
        self.assertTrue(result['file_observation_only']);self.assertEqual(result['validation_seconds'],600)
        self.assertEqual(result['future_epoch_validation_seconds'],1800);self.assertFalse(result['goal_owner']['root_proved'])
        self.assertFalse(result['arms']['exploration']['all_job_receipts_numeric']);self.assertTrue(result['arms']['exploration']['all_jobs_settled'])

if __name__=='__main__':unittest.main()
