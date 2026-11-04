"""Synthetic operational tests only: no actual study/model/compiler actions."""
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('revision_owner_tested',HERE/'owner.py')
o=importlib.util.module_from_spec(spec);spec.loader.exec_module(o)
h=o.H

def put(path,value):
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n');return path

def row(n,status='finite_budget_finished; root_open',settled=True,numeric=True):
    return dict(round=n,phase='research',status=status,calls=n+20,meta_calls=1,failures=0,
        active_is_null=True,active_intent_is_null=True,resolution_is_null=True,
        state_file_sha256='a'*64,all_job_receipts_numeric=numeric,all_jobs_settled=settled,
        certified_prelaunch_uncertainty_count=int(not numeric),knowledge_count=100,components_count=100)

class Fake:
    def __init__(self,parent,prove_after=1):
        self.parent=str(parent);self.ends={self.parent:8};self.validations={self.parent:600}
        self.rows={self.parent:{'baseline':row(8),'exploration':row(7,'running',numeric=False)}}
        self.runs=[];self.finalizations=[];self.curations=[];self.migrations=[];self.recoveries=[]
        self.prove_after=prove_after;self.on_run=None;self.finalize_code=0;self.resources=True
        self.transition_result=dict(parent_study=self.parent,actual_numeric_exit_observed=True,
            scientific_status='revised_source_history_no_causal_learning_claim')
    def transition(self):return copy.deepcopy(self.transition_result)
    def public(self,study):return copy.deepcopy(self.rows[str(study)])
    def protocol(self,study):return {'rounds':self.ends[str(study)],'validation_seconds':self.validations[str(study)]}
    def verify(self,study):pass
    def proof(self,study,modes):
        return dict(proved=True,refuted=False,bundle_hash='f'*64,receipt_sha256='e'*64) if len(self.runs)>=self.prove_after else None
    def headroom(self):return self.resources
    def recover(self,study):self.recoveries.append(str(study));raise AssertionError('settled original must not be recovered again')
    def run(self,study,both):
        if both:raise AssertionError('baseline must never rerun')
        self.runs.append((str(study),both));self.rows[str(study)]['exploration']=row(self.ends[str(study)],numeric=False)
        if self.on_run:self.on_run()
        return 0
    def finalize(self,study,both):self.finalizations.append((str(study),both));return self.finalize_code
    def finalization_pending(self,study):return False
    def curate(self,path):self.curations.append(str(path));put(Path(path)/'provenance.json',{});return path
    def migrate(self,parent,dest,curation):
        self.migrations.append((str(parent),str(dest)));self.ends[str(dest)]=self.ends[str(parent)]+8;self.validations[str(dest)]=1800
        self.rows[str(dest)]={'baseline':row(0,'ready'),'exploration':row(self.ends[str(parent)],'ready',numeric=False)}
        return {'study':str(dest),'provenance_path':'synthetic-own-history'}

class Lifecycle(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.parent=self.root/'parent';self.parent.mkdir();self.output=self.root/'runtime'
        self.config=dict(parent_study=str(self.parent),successor_root=str(self.root/'studies'),
            owner_source_sha256='d'*64,contract_sha256='c'*64,profile_sha256='e'*64,
            revision_finished={'path':str(self.root/'finish'),'sha256':'b'*64})
        o.B.STOPPING=False
    def owner(self,n=1):
        backend=Fake(self.parent,n);return o.Owner(self.config,self.output,backend),backend
    def test_resumes_only_exploration_original_validation600(self):
        owner,b=self.owner();self.assertEqual(owner.run(),0)
        self.assertEqual(b.runs,[(str(self.parent),False)]);self.assertFalse(b.curations);self.assertFalse(b.recoveries)
    def test_finish_original_then_own_history_successors(self):
        owner,b=self.owner(3);self.assertEqual(owner.run(),0)
        self.assertEqual(len(b.runs),3);self.assertEqual(len(b.migrations),2)
        self.assertTrue(all(x[1] is False for x in b.runs));self.assertEqual(b.finalizations[0],(str(self.parent),True))
        self.assertEqual(owner.state['epoch'],2);self.assertTrue(owner.state['root_proved'])
    def test_counts_and_closed_commands_do_not_prove_root(self):
        owner,b=self.owner(100)
        def stop():put(self.output/'STOP_AFTER_BOUNDARY.json',{'schema':o.BOUNDARY_STOP_SCHEMA,'owner_source_sha256':self.config['owner_source_sha256'],'reason':'synthetic boundary'})
        b.on_run=stop;self.assertEqual(owner.run(),4);self.assertFalse(owner.state['root_proved']);self.assertEqual(len(b.runs),1)
    def test_unknown_uncertainty_refuses_research(self):
        owner,b=self.owner();b.rows[str(self.parent)]['exploration']['all_jobs_settled']=False
        with self.assertRaisesRegex(o.Hold,'unknown job uncertainty'):owner.run()
        self.assertFalse(b.runs)
    def test_missing_actual_closed_source_revision_refuses(self):
        owner,b=self.owner();b.transition_result['actual_numeric_exit_observed']=False
        with self.assertRaises(o.Hold):owner.run()
        self.assertFalse(b.runs)
    def test_wrong_scientific_history_refuses(self):
        owner,b=self.owner();b.transition_result['scientific_status']='causal_winner'
        with self.assertRaises(o.Hold):owner.run()
    def test_baseline_must_be_finished_but_is_never_rerun(self):
        owner,b=self.owner();b.rows[str(self.parent)]['baseline']['round']=7
        with self.assertRaisesRegex(o.Hold,'baseline'):owner.run()
        self.assertFalse(b.runs)
    def test_native_stop_is_honored_without_clearing(self):
        owner,b=self.owner();put(self.parent/'STOP.json',{'requested':1})
        self.assertEqual(owner.run(),1);self.assertTrue((self.parent/'STOP.json').exists());self.assertFalse(b.runs)
    def test_original_validation_not_retargeted(self):
        owner,b=self.owner();b.validations[str(self.parent)]=1800
        with self.assertRaisesRegex(o.Hold,'validation600'):owner.run()
    def test_failed_finalizer_prevents_curation(self):
        owner,b=self.owner(100);b.finalize_code=2
        with self.assertRaisesRegex(o.Hold,'finalizer'):owner.run()
        self.assertFalse(b.curations)
    def test_existing_checkpoint_refuses_replay(self):
        owner,b=self.owner();put(self.output/'OWNER_CHECKPOINT.json',{})
        with self.assertRaises(o.Hold):owner.run()
        self.assertFalse(b.runs)

class Settlement(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.origin=self.root/'.scratch/studies/original';self.mode='exploration';self.key='plan-0007';self.job=self.origin/'arms'/self.mode/'jobs'/self.key
        self.request=put(self.job/'request.json',{'private_canary':'never decode this object'})
        self.spec=put(self.job/'spec.json',dict(role='proposer',request_id=self.key,readonly=True,model='gpt-6.1-sol',
            reasoning_effort='high',seconds=1800,transport='live',workspace=str(self.origin/'arms'/self.mode/'workspace')))
        self.receipt=put(self.job/'receipt.json',dict(request_id=self.key,role='proposer',outcome='uncertain_effects_not_replayed',
            elapsed_seconds=1800,model='gpt-6.1-sol',reasoning_effort='high',payload=None,mathematical_resolution=False))
        (self.job/'prompt.txt').write_text('private prompt canary')
        self.protocol=put(self.origin/'protocol.json',dict(model='gpt-6.1-sol',transport='live',call_seconds=1800))
        state={'research':{'private_canary':'never decode this subtree'},'reservations':{'call-'+self.key:1800},
            'counted_jobs':[self.key],'receipts':[str(self.job)],'receipt_hashes':{str(self.job):hashlib.sha256(self.receipt.read_bytes().strip()).hexdigest()}}
        self.archive=put(self.root/'.bootstrap/old-state.raw',{'state':state,'sha256':h.digest(state)})
        put(self.origin/'arms'/self.mode/'state.json',{'opaque':'native state not decoded for original uncertainty'})
        put(self.origin/'seal.json',{'source':'old operational metadata'})
        self.g={'schema':'math-gkm.closed-prelaunch-proposer-recovery.v1','study':str(self.origin),'arm':self.mode,
            'failed_request_id':self.key,'classification':'closed_protocol_guard_failure_before_watchdog','no_model_started':True,'native_cleanup_verified':True,
            'implementation_sha256':'a'*64,'old_implementation_sha256':'b'*64,'receipt_file_sha256':h.sha(self.receipt),
            'spec_sha256':h.sha(self.spec),'request_binding':hashlib.sha256(self.request.read_bytes().strip()).hexdigest(),
            'receipt_binding':hashlib.sha256(self.receipt.read_bytes().strip()).hexdigest(),'prompt_sha256':h.sha(self.job/'prompt.txt'),
            'protocol_sha256':h.sha(self.protocol),'stopped_state_sha256':h.sha(self.archive)}
        core={'schema':'math-gkm.prelaunch-source-revision.v1',**{k:self.g[k] for k in ('study','arm','failed_request_id','implementation_sha256','old_implementation_sha256','receipt_file_sha256','spec_sha256','request_binding','protocol_sha256')},
            'old_files':{str(self.origin/'arms'/self.mode/'state.json'):{'path':str(self.archive),'sha256':h.sha(self.archive)}}}
        self.g.update(revision_core=core,revision_binding=h.digest(core));p=put(self.root/'.bootstrap/grant.json',self.g)
        self.ref={'path':str(p),'sha256':h.sha(p)}
        self.patch=patch.object(h,'ROOT',self.root);self.patch.start();self.addCleanup(self.patch.stop)
    def settled(self,study=None):return h.settlement(study or self.origin,self.mode,self.ref)
    def test_original_certified_uncertainty_settled_but_not_numeric(self):
        row=self.settled();self.assertTrue(row['all_jobs_settled']);self.assertFalse(row['all_job_receipts_numeric']);self.assertEqual(row['certified_prelaunch_uncertainty_count'],1)
    def test_unknown_slot_not_settled(self):
        put(self.job.parent/'plan-0008/receipt.json',dict(request_id='plan-0008',role='proposer',outcome='uncertain_effects_not_replayed'))
        self.assertFalse(self.settled()['all_jobs_settled'])
    def test_after_worker_artifact_not_settled(self):
        put(self.job/'process.json',{'pid':123});self.assertFalse(self.settled()['all_jobs_settled'])
    def test_receipt_mutation_or_fabricated_numeric_is_not_certificate(self):
        value=json.loads(self.receipt.read_bytes());value['returncode']=None;put(self.receipt,value)
        self.assertFalse(self.settled()['all_jobs_settled'])
    def test_request_or_spec_mutation_not_settled(self):
        put(self.request,{'private_canary':'changed'});self.assertFalse(self.settled()['all_jobs_settled'])
    def test_archive_charge_mutation_refuses(self):
        value=json.loads(self.archive.read_bytes());value['state']['reservations']['call-'+self.key]=0
        put(self.archive,value);self.assertFalse(self.settled()['all_jobs_settled'])
    def test_legitimate_normal_numeric_receipts_are_settled(self):
        put(self.job.parent/'plan-0008/receipt.json',{'request_id':'plan-0008','returncode':0})
        self.assertTrue(self.settled()['all_jobs_settled'])
    def test_missing_receipt_refuses(self):
        (self.job.parent/'plan-0008').mkdir();self.assertFalse(self.settled()['all_jobs_settled'])
    def test_opaque_canaries_not_decoded(self):
        original=json.loads
        def guarded(raw,*args,**kw):
            text=raw.decode() if isinstance(raw,bytes) else str(raw)
            if 'private_canary' in text:raise AssertionError('private subtree decoded')
            return original(raw,*args,**kw)
        with patch.object(json,'loads',guarded):self.assertTrue(self.settled()['all_jobs_settled'])
    def make_successor(self):
        import shutil
        child=self.root/'.scratch/studies/child';dest=child/'arms'/self.mode/'jobs'/self.key
        dest.mkdir(parents=True)
        for name in ('receipt.json','spec.json','request.json'):shutil.copyfile(self.job/name,dest/name)
        provenance=put(child/'CONTINUATION_PROVENANCE.json',{'schema':'math-gkm.closed-own-epoch.v1','arm':self.mode,
            'parent_study':str(self.origin),'parent_state_sha256':h.sha(self.origin/'arms'/self.mode/'state.json'),
            'parent_seal_sha256':h.sha(self.origin/'seal.json'),'old_accounting':{'private_canary':'never decode'},
            'inherited_main_jobs':[{'key':self.key,'path':str(dest),'receipt_hash':self.g['receipt_binding'],'elapsed_seconds':1800}]})
        put(child/'seal.json',{'continuation_provenance_sha256':h.sha(provenance)})
        put(child/'MIGRATION_FINISHED.json',{'schema':'math-gkm.closed-own-epoch.v1','source_sha256':h.EPOCH_SHA,'provenance_sha256':h.sha(provenance)})
        return child
    def test_exact_inherited_copy_settled_without_fake_exit(self):
        self.assertTrue(self.settled(self.make_successor())['all_jobs_settled'])
    def test_inherited_origin_changed_refuses(self):
        child=self.make_successor();put(self.origin/'seal.json',{'source':'changed'})
        self.assertFalse(self.settled(child)['all_jobs_settled'])
    def test_inherited_receipt_without_provenance_refuses(self):
        child=self.make_successor();(child/'MIGRATION_FINISHED.json').unlink()
        self.assertFalse(self.settled(child)['all_jobs_settled'])


class RealBackendProjection(unittest.TestCase):
    def test_pinned_actual_backend_protocol_includes_validation(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory).resolve();put(root/'protocol.json',{'rounds':8,'model':'gpt-6.1-sol','call_seconds':1800,'arm_seconds':600000,'validation_seconds':600,'private_canary':'not selected'})
            backend=o.Native({},root/'owner')
            self.assertEqual(backend.protocol(root),{'rounds':8,'model':'gpt-6.1-sol','call_seconds':1800,'arm_seconds':600000,'validation_seconds':600})
    def test_native_run_argv_is_exploration_and_has_no_resume(self):
        with tempfile.TemporaryDirectory() as directory:
            backend=o.Native({},Path(directory));calls=[]
            backend.command=lambda *args:calls.append(args) or 0
            backend.run(Path(directory),False)
            self.assertEqual(calls[0][0],'research');self.assertEqual(calls[0][1][-2:],['--arm','exploration'])
            self.assertNotIn('--resume',calls[0][1])



class RevisionProgression(unittest.TestCase):
    setUp=Settlement.setUp
    def test_real_revision_gate_allows_progress_without_resigning_history(self):
        from types import SimpleNamespace
        native=self.root/'machinery/study_context.py';native.parent.mkdir();native.write_text('neutral revised source')
        implementation={'machinery/study_context.py':h.sha(native)}
        rc={'study':str(self.origin),'arm':'exploration','implementation':implementation,'old_implementation':{'machinery/study_context.py':'0'*64}}
        core=self.g['revision_core'];core.update(implementation=implementation,old_implementation=rc['old_implementation'],
            new_deployment={'neutral_binding':'preserved exact-source metadata'},
            old_verification={'contract_sha256':'c'*64},scientific_status='revised_source_history_no_causal_learning_claim')
        self.g['revision_binding']=h.digest(core)
        self.g['implementation_sha256']=h.digest(implementation)
        core['implementation_sha256']=self.g['implementation_sha256'];self.g['revision_binding']=h.digest(core)
        gp=put(Path(self.ref['path']),self.g);self.ref={'path':str(gp),'sha256':h.sha(gp)}
        put(self.origin/'seal.json',{'implementation':implementation,'deployment_preflight':core['new_deployment'],
            'source_revision':{'record':str(gp),'binding':self.g['revision_binding'],'old_seal_sha256':self.g.get('old_seal_sha256','1'*64)}})
        # Production grants contain this field in both the public grant and core.
        self.g['old_seal_sha256']='1'*64;core['old_seal_sha256']='1'*64
        self.g['revision_binding']=h.digest(core);put(gp,self.g);self.ref['sha256']=h.sha(gp)
        put(self.origin/'seal.json',{'implementation':implementation,'deployment_preflight':core['new_deployment'],
            'source_revision':{'record':str(gp),'binding':self.g['revision_binding'],'old_seal_sha256':'1'*64}})
        rcpath=put(self.root/'.bootstrap/revision-config.json',rc)
        rsource=self.root/'.bootstrap/revision.py';rsource.write_text('neutral explicit fixture source')
        finished=put(self.root/'.bootstrap/FINISHED.json',{'schema':'fixture-revision-v1','phase':'finalized_not_launched',
            'config_sha256':h.sha(rcpath),'implementation_sha256':h.digest(implementation),
            'scientific_status':'revised_source_history_no_causal_learning_claim',
            'research_launches':0,'compiler_launches':0,'model_launches':0,'grant':self.ref,
            'proof_reuse_verification':core['old_verification'],
            'after_files':{str(native):h.sha(native),str(self.origin/'arms/exploration/state.json'):h.sha(self.origin/'arms/exploration/state.json')}})
        c={'revision_source':{'path':str(rsource),'sha256':h.sha(rsource)},'revision_config':{'path':str(rcpath),'sha256':h.sha(rcpath)},
            'revision_finished':{'path':str(finished),'sha256':h.sha(finished)},'parent_study':str(self.origin),
            'contract_sha256':'c'*64,'implementation_sha256':h.digest(implementation)}
        module=SimpleNamespace(SCHEMA='fixture-revision-v1',load_config=lambda *_:rc)
        with patch.object(o,'ROOT',self.root),patch.object(o,'load',return_value=module):
            o.verify_revision(c,initial=True,native_checks=False)
            put(self.origin/'arms/exploration/state.json',{'new':'ordinary admitted theory/accounting progress'})
            o.verify_revision(c,initial=False,native_checks=False)
            with self.assertRaisesRegex(o.Hold,'before first paid'):o.verify_revision(c,initial=True,native_checks=False)
            native.write_text('changed unqualified native source')
            with self.assertRaisesRegex(o.Hold,'before first paid'):o.verify_revision(c,initial=False,native_checks=False)

class Status(unittest.TestCase):
    setUp=Settlement.setUp
    def test_registered_original_status_is_truthful_about600_and_nonnumeric(self):
        spec=importlib.util.spec_from_file_location('revision_status_tested',HERE/'status_public.py')
        m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
        base=self.root/'.bootstrap/continuation';base.mkdir(parents=True)
        source=base/'owner.py';source.write_bytes((HERE/'owner.py').read_bytes())
        history=base/'history.py';history.write_bytes((HERE/'history.py').read_bytes())
        # Exact operational data only; no actual private study is read.
        for mode in ('baseline','exploration'):
            state={'round':8 if mode=='baseline' else 7,'phase':'research','status':'running','calls':31,'meta_calls':14,'failures':0,
                'research':{'knowledge':{},'components':{}},'active':None,'active_intent':None,'resolution':None}
            put(self.origin/'arms'/mode/'state.json',{'state':state,'sha256':h.digest(state)})
        protocol=json.loads(self.protocol.read_bytes());protocol.update(validation_seconds=600,rounds=8)
        put(self.protocol,protocol);self.g['protocol_sha256']=h.sha(self.protocol)
        self.g['revision_core']['protocol_sha256']=self.g['protocol_sha256'];self.g['revision_binding']=h.digest(self.g['revision_core'])
        put(Path(self.ref['path']),self.g);self.ref['sha256']=h.sha(Path(self.ref['path']))
        cfg=put(base/'CONFIG.json',{'owner_source_sha256':h.sha(source),'contract_sha256':m.CONTRACT,
            'history_source':{'path':str(history),'sha256':h.sha(history)},
            'revision_finished':{'path':str(base/'finish'),'sha256':'a'*64},'parent_study':str(self.origin)})
        output=base/'runtime';put(output/'CURRENT.json',{'schema':o.CURRENT_SCHEMA,'owner_source_sha256':h.sha(source),
            'contract_sha256':m.CONTRACT,'revision_finished_sha256':'a'*64,'parent_study':str(self.origin),
            'current_study':str(self.origin),'epoch':0,'phase':'research_running','root_proved':False,'updated_at':1})
        put(base/'REGISTRATION.json',{'schema':'math-gkm.gaussian-revision-status-registration.v1','approved':True,
            'status_source_sha256':hashlib.sha256((HERE/'status_public.py').read_bytes()).hexdigest(),
            'owner_source':{'path':str(source),'sha256':h.sha(source)},'config':{'path':str(cfg),'sha256':h.sha(cfg)},'output':str(output)})
        with patch.object(m,'ROOT',self.root),patch.object(m,'ORIGINAL',self.origin),patch.object(m,'load',return_value=o),patch.object(o,'ROOT',self.root),patch.object(o,'verify_revision',return_value={'grant':self.ref}):
            result=m.status(base)
        self.assertEqual(result['validation_seconds'],600);self.assertEqual(result['future_epoch_validation_seconds'],1800)
        self.assertFalse(result['goal_owner']['root_proved']);self.assertTrue(result['file_observation_only'])
        self.assertFalse(result['arms']['exploration']['all_job_receipts_numeric'])
        self.assertTrue(result['arms']['exploration']['all_jobs_settled'])

if __name__=='__main__':unittest.main()
