"""Neutral source/runtime tests. No actual study, model, compiler, or full hash."""
import contextlib
import copy
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import tempfile
import time
import unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('efficient_runtime_tested',HERE/'runtime.py');r=importlib.util.module_from_spec(spec);spec.loader.exec_module(r)
from machinery import snapshot_routing,study_bridge,study_observer,study_reports,study_discoveries


class Fixture(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='gkm-neutral-runtime-');self.addCleanup(self.tmp.cleanup)
        self.root=Path(self.tmp.name).resolve();self.study=self.root/'.scratch/studies/neutral-epoch';self.ar=self.study/'arms/exploration';self.ws=self.ar/'workspace';self.ws.mkdir(parents=True)
        self.status=self.root/'.bootstrap/owner/commands/000000/RUNTIME_STATUS.json';self.status.parent.mkdir(parents=True)
        self.p={**r.native.DEFAULT,'transport':'live','rounds':16,'episode_rounds':2,'call_seconds':1800,'validation_seconds':1800,
            'model':'gpt-6.1-sol','arm_seconds':1400000,'max_calls':160,'meta_calls':96}
        self.staged=r.policy.initial('exploration',self.p)
        self.staged['portfolio']={'z':{'id':'z','claim':'PRIVATE_NEUTRAL_Z'},'a':{'id':'a','claim':'PRIVATE_NEUTRAL_A'}}
        self.cached=json.loads(r.D.canonical(self.staged));self.commitment={'trial':None,'round':8}
        self.original=r.D.rebuild(self.staged,self.commitment,self.p,8,r.policy,r.knowledge.SCHEMAS)
        self.write(self.study/'protocol.json',self.p);self.write(self.ws/'contract.json',{'neutral':'contract'});self.write(self.study/'seed/seed-files.json',[])
        state={'round':8,'phase':'research','research':copy.deepcopy(self.staged),'active':None,'active_intent':None,'resolution':None,
            'calls':2,'meta_calls':1,'seconds':3600,'failures':1,'reservations':{},'receipts':[],'counted_jobs':[],'receipt_hashes':{},
            'budget_pools':{'episode-research-8':{'cap':7200,'spent':3600}},'host_events':[],'controller_active_seconds':0,'status':'bounded_or_blocked'}
        self.write(self.ar/'rounds/0008/start.json',{'research':state['research'],'source':{}})
        planner={**r.policy.request(r.common.read(self.ar/'rounds/0008/start.json')['research'],8,self.p),'role':'proposer',
            'model':self.p['model'],'reasoning_effort':'high','request_id':'plan-0008'}
        for key,role,req,rc in [('plan-0008','proposer',planner,0),('round-0008','researcher',self.original,-9)]:
            job=self.ar/'jobs'/key;specification={'role':role,'request_id':key,'seconds':1800,'workspace':str(self.ws),
                'transport':'live','model':self.p['model'],'reasoning_effort':'high','readonly':role=='proposer'}
            receipt={'role':role,'request_id':key,'returncode':rc,'outcome':'completed' if rc==0 else 'ResourceFailure: disk_headroom',
                'payload':{} if rc==0 else None,'model':self.p['model'],'reasoning_effort':'high','elapsed_seconds':222,'before':{},'after':{},'resources':{'termination_cause':None if rc==0 else 'disk_headroom'}}
            for name,value in [('request',req),('receipt',receipt),('spec',specification)]:self.write(job/(name+'.json'),value)
            state['receipts'].append(str(job));state['counted_jobs'].append(key);state['receipt_hashes'][str(job)]=r.common.digest(receipt);state['reservations']['call-'+key]=1800
        self.write(self.ar/'jobs/plan-0008/validated-plan.json',{'receipt_hash':state['receipt_hashes'][str(self.ar/'jobs/plan-0008')],
            'research':self.cached,'commitment':self.commitment})
        r.common.save_state(self.ar/'state.json',state);self.arm=r.RuntimeArm(self.study,'exploration',0)
        self.patches=contextlib.ExitStack();self.addCleanup(self.patches.close)
        self.patches.enter_context(patch.object(r,'ROOT',self.root))
        self.patches.enter_context(patch.object(subprocess,'Popen',side_effect=AssertionError('no process')))
        self.patches.enter_context(patch.object(subprocess,'run',side_effect=AssertionError('no process')))
        self.patches.enter_context(patch.object(r,'headroom',return_value={}))
        self.patches.enter_context(patch.object(r.time,'sleep',return_value=None))
    def write(self,path,value):r.common.write(path,value)
    def alter_receipt(self,**values):
        job=self.ar/'jobs/round-0008';receipt=r.common.read(job/'receipt.json');receipt.update(values);self.write(job/'receipt.json',receipt)
        self.arm.s['receipt_hashes'][str(job)]=r.common.digest(receipt);r.common.save_state(self.ar/'state.json',self.arm.s);return receipt
    def native_round_patches(self):
        stack=contextlib.ExitStack();self.arm.archive_sources=lambda:None;self.arm.protect_concept_horizon=lambda _:None
        stack.enter_context(patch.object(snapshot_routing,'ENABLED',False))
        stack.enter_context(patch.object(r.native,'snapshot',side_effect=lambda ws,dest,*args:self.write(dest/'manifest.json',{'binding':'neutral-snapshot'})))
        stack.enter_context(patch.object(r.native,'verify_snapshot',return_value={'binding':'neutral-snapshot'}))
        stack.enter_context(patch.object(study_observer,'checkpoint',return_value=None))
        stack.enter_context(patch.object(study_bridge,'observation',side_effect=lambda arm,*args:arm.s['host_events'].append('neutral-event')))
        stack.enter_context(patch.object(study_discoveries,'completion_candidate',return_value=None))
        return stack
    def execute(self,operation='run'):
        with patch.object(r,'verify_sources'),patch.object(r.native,'verify'),contextlib.redirect_stdout(io.StringIO()):
            return r.execute(self.study,operation=operation,expected_source_sha256=r.sha(r.__file__),status_path=self.status)


class SourceBoundary(unittest.TestCase):
    def test_import_and_small_pins_never_request_full_implementation_hash(self):
        with patch.object(r.common,'implementation',side_effect=AssertionError('no full native hash')),patch.object(r.D,'native',side_effect=AssertionError('no diagnostic native hash')):
            r.verify_sources(r.sha(r.__file__))
    def test_native_run_acceptor_and_research_body_are_not_reimplemented(self):
        self.assertIs(r.RuntimeArm.run,r.native.Arm.run);self.assertIs(r.RuntimeArm._research_round,r.native.Arm._research_round)
        self.assertNotIn('accept_report',r.RuntimeArm.__dict__)


class CachedRequests(Fixture):
    def test_fresh_call_passes_original_arguments_unchanged(self):
        req={'role':'researcher','neutral':'fresh'}
        with patch.object(r.native.Arm,'call',return_value={'neutral':'fresh result'}) as call:
            result=self.arm.call('round-0009','researcher',req,readonly=False,seconds=123)
        self.assertEqual(result,{'neutral':'fresh result'});self.assertIs(call.call_args.args[2],req)
        self.assertEqual(call.call_args.args,('round-0009','researcher',req,None,False,123))
    def test_exact_restoration_uses_actual_native_cached_planner(self):
        before=r.common.digest(self.cached);original=r.sha(self.ar/'jobs/plan-0008/validated-plan.json')
        req=r.policy.request(r.common.read(self.ar/'rounds/0008/start.json')['research'],8,self.p)
        staged,commitment=self.arm.plan_with_repair('plan-0008',req,self.arm.s['research'],self.ws,8,self.p)
        self.assertEqual(list(staged['portfolio']),['z','a']);self.assertEqual(r.common.digest(staged),before)
        self.assertEqual(r.D.rebuild(staged,commitment,self.p,8,r.policy,r.knowledge.SCHEMAS),self.original)
        self.assertEqual(r.sha(self.ar/'jobs/plan-0008/validated-plan.json'),original)
    def test_reverse_program_requires_exact_preprogram_input_hash(self):
        self.staged['program']['code'].insert(0,{'op':'reverse_portfolio'});self.original=r.D.rebuild(self.staged,self.commitment,self.p,8,r.policy,r.knowledge.SCHEMAS)
        self.write(self.ar/'jobs/round-0008/request.json',self.original)
        accepted=r.common.read(self.ar/'jobs/plan-0008/validated-plan.json');accepted['research']=json.loads(r.D.canonical(self.staged));self.write(self.ar/'jobs/plan-0008/validated-plan.json',accepted)
        req=r.policy.request(r.common.read(self.ar/'rounds/0008/start.json')['research'],8,self.p)
        staged,commitment=self.arm.plan_with_repair('plan-0008',req,self.arm.s['research'],self.ws,8,self.p)
        self.assertEqual(r.D.rebuild(staged,commitment,self.p,8,r.policy,r.knowledge.SCHEMAS),self.original)
    def test_unrelated_request_difference_refuses(self):
        original=copy.deepcopy(self.original);original['agenda']=['PRIVATE_DIFFERENT'];self.write(self.ar/'jobs/round-0008/request.json',original)
        req=r.policy.request(r.common.read(self.ar/'rounds/0008/start.json')['research'],8,self.p)
        with self.assertRaises(r.Refused):self.arm.plan_with_repair('plan-0008',req,self.arm.s['research'],self.ws,8,self.p)
    def test_repaired_or_generation_accepted_path_is_not_skipped(self):
        accepted=r.common.read(self.ar/'jobs/plan-0008/validated-plan.json');(self.ar/'jobs/plan-0008/validated-plan.json').unlink()
        for logical in ('plan-0008-repair-1','plan-0008-generation-1-repair-1'):
            path=self.ar/'jobs'/logical/'validated-plan.json';self.write(path,accepted)
            with patch.object(r.native.Arm,'plan_with_repair',return_value=(copy.deepcopy(self.cached),self.commitment)) as planner:
                staged,_=self.arm.plan_with_repair('plan-0008',{},self.arm.s['research'],self.ws,8,self.p)
            self.assertEqual(list(staged['portfolio']),['z','a']);planner.assert_called_once();path.unlink()
    def actual_retained_chain(self,generation):
        base=self.ar/'jobs/plan-0008';accepted=r.common.read(base/'validated-plan.json');(base/'validated-plan.json').unlink()
        if generation:self.p['proposal_repairs']=0;self.arm.p=self.p
        safe='Invalid plan schema, identity, artifact binding or prospective commitment. Correct your own retained payload; no action executed.'
        receipt=r.common.read(base/'receipt.json')
        rejection={'status':'invalid_proposer_payload','receipt_hash':r.common.digest(receipt),'original_final_sha256':None,
            'error_class':'Invalid','safe_error':safe,'attempt':0,'new_request_required':True}
        self.write(base/'invalid-plan.json',rejection)
        repair={'previous_request':'plan-0008','receipt_hash':r.common.digest(receipt),'error':safe,'previous_payload':receipt['payload'],
                'invalid_receipt_sha256':r.sha(base/'invalid-plan.json')}
        logical='plan-0008-repair-1'
        if generation:
            failed=self.ar/'repair-failures/plan-0008.json'
            self.write(failed,{'status':'operational_repair_exhausted; root remains open','request':'plan-0008','attempts':1})
            rejected={**self.arm.closed_planner_receipt('plan-0008',receipt,self.ws),'invalid_plan_sha256':r.sha(base/'invalid-plan.json'),'final_sha256':None}
            marker=self.ar/'repair-failures/plan-0008-closed.json'
            self.write(marker,{'schema':'math-gkm.closed-planning-generation.v1','request':'plan-0008','generation':0,'round':8,
                'state_binding':r.common.digest(self.arm.s['research']),'rejected':[rejected],'failure_sha256':r.sha(failed)})
            repair['previous_generation_closure_sha256']=r.sha(marker);logical='plan-0008-generation-1'
        job=self.ar/'jobs'/logical
        request=r.common.read(base/'request.json');request.update(request_id=logical,repair=repair,
            planning_generation={'index':int(generation),'total_bound':2,'logical_round':8,'additional_paid_allowance':0})
        record={**receipt,'request_id':logical};specification={**r.common.read(base/'spec.json'),'request_id':logical}
        for name,value in [('request',request),('receipt',record),('spec',specification)]:self.write(job/(name+'.json'),value)
        self.write(job/'validated-plan.json',{**accepted,'receipt_hash':r.common.digest(record)})
        self.arm.s['calls']+=1;self.arm.s['meta_calls']+=1;self.arm.s['receipts'].append(str(job));self.arm.s['counted_jobs'].append(logical)
        self.arm.s['receipt_hashes'][str(job)]=r.common.digest(record);self.arm.s['reservations']['call-'+logical]=1800
        req=r.policy.request(r.common.read(self.ar/'rounds/0008/start.json')['research'],8,self.p)
        with patch.object(r.policy,'commit',side_effect=r.common.Invalid('neutral schema rejection')),patch.object(r.native.Arm,'call',side_effect=AssertionError('all planner work must be retained')):
            restored,commitment=self.arm.plan_with_repair('plan-0008',req,self.arm.s['research'],self.ws,8,self.p)
        self.assertEqual(r.D.rebuild(restored,commitment,self.p,8,r.policy,r.knowledge.SCHEMAS),self.original)
    def test_actual_native_cached_repair_chain_restores(self):self.actual_retained_chain(False)
    def test_actual_native_cached_generation_chain_restores(self):self.actual_retained_chain(True)
    def test_closed_researcher_missing_accepted_plan_cannot_launch_planner(self):
        (self.ar/'jobs/plan-0008/validated-plan.json').unlink()
        with patch.object(r.native.Arm,'plan_with_repair',side_effect=AssertionError('no planner')):
            with self.assertRaises(r.Refused):self.arm.plan_with_repair('plan-0008',{},self.arm.s['research'],self.ws,8,self.p)
    def test_missing_repair_receipt_cannot_launch_fresh_repair(self):
        def native_planner(*args):return self.arm.call('plan-0008-repair-1','proposer',{})
        with patch.object(r.native.Arm,'plan_with_repair',side_effect=native_planner),patch.object(r.native.Arm,'call',side_effect=AssertionError('no fresh proposer')):
            with self.assertRaises(r.Refused):self.arm.plan_with_repair('plan-0008',{},self.arm.s['research'],self.ws,8,self.p)
    def test_cached_receipt_is_consumed_without_recharge_or_role_replay(self):
        before=copy.deepcopy(self.arm.s);result=self.arm.call('round-0008','researcher',self.original)
        self.assertEqual(result['returncode'],-9);self.assertEqual(self.arm.s,before)


class NativeResultPaths(Fixture):
    def test_failed_cached_result_uses_unchanged_native_failure_tail(self):
        before=copy.deepcopy(self.arm.s)
        with self.native_round_patches(),patch.object(study_reports,'accept_report',side_effect=AssertionError('failed payload cannot be admitted')):
            self.arm.research_round()
        self.assertEqual(self.arm.s['round'],9);self.assertEqual(self.arm.s['calls'],before['calls']);self.assertEqual(self.arm.s['reservations'],before['reservations'])
        self.assertEqual(self.arm.s['research']['knowledge'],before['research']['knowledge']);self.assertEqual(len(self.arm.s['research']['observations']),len(before['research']['observations'])+1)
    def test_completed_cached_result_invokes_unchanged_native_acceptor(self):
        self.alter_receipt(returncode=0,outcome='completed',payload={});before=copy.deepcopy(self.arm.s)
        with self.native_round_patches(),patch.object(study_reports,'accept_report',wraps=study_reports.accept_report) as accept:
            self.arm.research_round()
        accept.assert_called_once();self.assertEqual(self.arm.s['round'],9);self.assertEqual(self.arm.s['calls'],before['calls']);self.assertEqual(self.arm.s['receipt_hashes'],before['receipt_hashes'])
    def test_partial_completed_native_ADMITTED_journal_survives_admission_retry(self):
        report={'mathematical_claims':[{'id':'neutral-one'},{'id':'neutral-two'}]};self.alter_receipt(returncode=0,outcome='completed',payload=report)
        before=copy.deepcopy(self.arm.s);seen=[]
        def batch(arm,state,one,workspace,dest):
            item=one['mathematical_claims'][0];seen.append(item['id'])
            if item['id']=='neutral-two' and seen.count('neutral-two')==1:raise r.ResourceFailure('admission_disk_headroom')
            state['knowledge'][item['id']]={'source_files':{}}
        def one_round(subject):
            # Bound the neutral fixture to one body; production run is inherited.
            subject.archive_sources=lambda:None;subject.protect_concept_horizon=lambda _:None
            r.native.Arm.research_round(subject)
        with self.native_round_patches(),patch.object(r.native.Arm,'run',one_round),patch.object(r.knowledge,'_ingest_batch',side_effect=batch),\
             patch.object(r.knowledge,'verify_record'),patch.object(study_discoveries,'recheck'),patch.object(r.policy,'record'):
            result=self.execute()
        self.assertEqual(seen,['neutral-one','neutral-two','neutral-two']);self.assertEqual(result['round'],9)
        after=r.common.load_state(self.ar/'state.json');self.assertEqual(after['calls'],before['calls']);self.assertEqual(after['meta_calls'],before['meta_calls'])
        self.assertEqual(after['seconds'],before['seconds']);self.assertEqual(after['reservations'],before['reservations']);self.assertEqual(after['receipt_hashes'],before['receipt_hashes'])
        self.assertEqual(set(after['research']['knowledge']),{'neutral-one','neutral-two'})
        self.assertEqual(len(list((self.ar/'rounds/0008/checks/math').glob('*/ADMITTED.json'))),2)


class RecoveryRefusal(Fixture):
    def test_missing_receipt_refuses_before_any_native_PID_query(self):
        job=self.ar/'jobs/round-0008';(job/'receipt.json').unlink();self.arm.s['active']=str(job)
        self.write(job/'process.json',{'pid':'PRIVATE_UNUSED_PID'})
        with patch.object(r.native.Arm,'recover',side_effect=AssertionError('must not query saved PID')):
            with self.assertRaises(r.Refused):self.arm.recover()
    def test_unregistered_nonnumeric_receipt_refuses_recovery(self):
        job=self.ar/'jobs/round-0008';receipt=r.common.read(job/'receipt.json');receipt.pop('returncode');self.write(job/'receipt.json',receipt)
        self.arm.s['receipts'].remove(str(job));self.arm.s['receipt_hashes'].pop(str(job));self.arm.s['active']=str(job)
        with self.assertRaises(r.Refused):self.arm.check_recoverable()
    def test_registered_historic_nonnumeric_receipt_keeps_exact_bytes_and_charge(self):
        receipt=self.alter_receipt(outcome='uncertain_effects_not_replayed');receipt.pop('returncode');job=self.ar/'jobs/round-0008';self.write(job/'receipt.json',receipt)
        self.arm.s['receipt_hashes'][str(job)]=r.common.digest(receipt);before=copy.deepcopy(self.arm.s)
        self.assertEqual(self.arm.check_recoverable(),0);self.assertEqual(self.arm.call('round-0008','researcher',self.original),receipt);self.assertEqual(self.arm.s,before)
    def test_cleanup_incomplete_or_changed_receipt_refuses(self):
        self.alter_receipt(operationally_incomplete=True)
        with self.assertRaises(r.Refused):self.arm.call('round-0008','researcher',self.original)
    def test_unknown_resource_exception_does_not_retry(self):
        with patch.object(r.native.Arm,'run',side_effect=r.ResourceFailure('monitor_unavailable: PRIVATE_DETAIL')) as run:
            with self.assertRaises(r.ResourceFailure):self.execute()
        self.assertEqual(run.call_count,1);self.assertEqual(r.common.read(self.status)['phase'],'refused')
    def test_admission_exception_with_missing_receipt_is_not_retried(self):
        def broken(subject):
            (self.ar/'jobs/round-0008/receipt.json').unlink();subject.s['active']=str(self.ar/'jobs/round-0008');r.common.save_state(self.ar/'state.json',subject.s)
            raise r.ResourceFailure('admission_memory_headroom')
        with patch.object(r.native.Arm,'run',broken):
            with self.assertRaises(r.Refused):self.execute()


class AdmissionAndStatus(Fixture):
    def test_cheap_wait_precedes_expensive_native_qualification(self):
        events=[];headrooms=[r.ResourceFailure('admission_disk_headroom'),{}]
        def admission(cap):
            events.append('cheap')
            if headrooms:
                value=headrooms.pop(0)
                if isinstance(value,Exception):raise value
            return {}
        with patch.object(r,'headroom',side_effect=admission),patch.object(r,'verify_sources'),patch.object(r.native,'verify',side_effect=lambda _:events.append('expensive')),\
             patch.object(r.native.Arm,'run',return_value=None),contextlib.redirect_stdout(io.StringIO()):
            r.execute(self.study,operation='run',expected_source_sha256=r.sha(r.__file__),status_path=self.status)
        self.assertGreater(events.index('expensive'),events.index('cheap'));r.time.sleep.assert_any_call(15)
    def test_new_paid_action_waits_before_native_call(self):
        events=[]
        with patch.object(r,'headroom',side_effect=[r.ResourceFailure('admission_memory_headroom'),{}]),\
             patch.object(r.native.Arm,'call',side_effect=lambda *a:events.append('native-fresh')):
            self.arm.call('round-0009','researcher',{'role':'researcher'})
        self.assertEqual(events,['native-fresh']);r.time.sleep.assert_called_with(15)
    def test_cleanup_resource_hold_never_waits_or_retries(self):
        r.time.sleep.reset_mock()
        with patch.object(r,'headroom',side_effect=r.ResourceFailure('unresolved_owned_cleanup_hold')):
            with self.assertRaises(r.ResourceFailure):r.wait_for_headroom(self.study)
        r.time.sleep.assert_not_called()
    def test_STOP_during_wait_prevents_any_native_action(self):
        def sleeping(seconds):self.write(self.study/'STOP.json',{'neutral':'requested'})
        with patch.object(r,'headroom',side_effect=r.ResourceFailure('admission_disk_headroom')),patch.object(r.time,'sleep',side_effect=sleeping),\
             patch.object(r.native.Arm,'run',side_effect=AssertionError('STOP prevents run')):
            with self.assertRaises(r.Stopped):self.execute()
        self.assertEqual(r.common.read(self.status)['phase'],'stopped');self.assertTrue((self.study/'STOP.json').exists())
    def test_public_status_has_only_fixed_operational_metadata(self):
        publish=r.status_writer(self.status,self.study,'run','a'*64);publish('waiting_host_headroom','admission_disk_headroom')
        row=r.common.read(self.status);self.assertEqual(set(row),{'schema','source_sha256','study','operation','phase','updated_at','resource_reason'})
        self.assertNotIn('PRIVATE',json.dumps(row));publish('finished');self.assertNotIn('resource_reason',r.common.read(self.status))
    def test_status_path_cannot_write_outside_owned_command_directory(self):
        with self.assertRaises(r.Refused):r.status_writer(self.root/'RUNTIME_STATUS.json',self.study,'run','a'*64)
    def test_waiting_status_is_observable_before_expensive_work(self):
        values=[r.ResourceFailure('admission_disk_headroom'),{}];observed=[]
        def headroom(cap):
            value=values.pop(0) if values else {}
            if isinstance(value,Exception):raise value
            return value
        def sleeping(seconds):observed.append(r.common.read(self.status)['phase'])
        with patch.object(r,'headroom',side_effect=headroom),patch.object(r.time,'sleep',side_effect=sleeping),patch.object(r.native.Arm,'run',return_value=None):self.execute()
        self.assertEqual(observed,['waiting_host_headroom']);self.assertEqual(r.common.read(self.status)['phase'],'finished')

if __name__=='__main__':unittest.main()
