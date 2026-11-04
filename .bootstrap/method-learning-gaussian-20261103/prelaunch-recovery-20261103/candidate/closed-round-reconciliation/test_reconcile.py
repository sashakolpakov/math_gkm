"""Neutral operational tests; never load an actual study or start a process."""
import contextlib
import copy
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import time
import unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('closed_round_reconcile_tested',HERE/'reconcile.py');r=importlib.util.module_from_spec(spec);spec.loader.exec_module(r)
from machinery import study as native,study_bridge,snapshot_routing,study_observer,study_reports


def valid_diagnosis():
    return dict(diagnostic_passed=True,actual_state_unchanged=True,all_input_files_unchanged=True,
        current_research_equals_round_start=True,history_exists=False,snapshot_exists=False,snapshot_staging_exists=False,
        protocol_pending_is_null=True,protocol_inflight_is_false=True,original_receipt_registered_once=True,
        original_full_reservation_preserved=True,recorded_retained_sources_preserved=True,original_request_canonical_bytes_equal=True,
        order_restoration={'exact_restoration_found':True},fixed_key_differences={'portfolio':{},'program_execution':{}},
        cleanup_metadata={'resource_termination_is_disk_headroom':True,'global_cleanup_hold_present':False,
            'outcome_reports_cleanup_problem':False,'receipt_operationally_incomplete':None})


class Fixture(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='gkm-neutral-reconcile-');self.addCleanup(self.tmp.cleanup)
        self.root=Path(self.tmp.name).resolve();self.study=self.root/'study';self.ar=self.study/'arms/exploration';self.ws=self.ar/'workspace';self.ws.mkdir(parents=True)
        self.output=self.root/'.bootstrap/closure';self.i=8
        self.p={'rounds':16,'episode_rounds':2,'invention_rounds':1,'call_seconds':1800,'knowledge_checks_per_round':6,'validation_seconds':1800,
            'model':'gpt-6.1-sol','concept_driver':None,'method_learning':None,'transport':'live','arm_seconds':1400000,'max_calls':160,'meta_calls':96}
        self.staged=r.POLICY.initial('exploration',self.p)
        self.staged['portfolio']={'z':{'id':'z','claim':'PRIVATE_NEUTRAL_Z'},'a':{'id':'a','claim':'PRIVATE_NEUTRAL_A'}}
        self.commitment={'trial':None,'round':8};self.original=r.D.rebuild(self.staged,self.commitment,self.p,8,r.POLICY,r.KNOWLEDGE.SCHEMAS)
        self.cached=json.loads(r.D.canonical(self.staged));self.source={'research/retained.txt':r.digest('neutral bytes')}
        state={'round':8,'phase':'research','research':copy.deepcopy(self.staged),'active':None,'active_intent':None,'resolution':None,
            'calls':2,'meta_calls':1,'seconds':3600,'failures':1,'reservations':{},'receipts':[],'counted_jobs':[],'receipt_hashes':{},
            'budget_pools':{'episode-research-8':{'cap':7200,'spent':3600}},'protocol_state':{'pending':None,'inflight':False},
            'protocol_attempts':2,'protocol_reserved_seconds':60,'protocol_observed_seconds':0.1,'host_events':[],'controller_active_seconds':0}
        self.arm=r.CachedRoundArm.__new__(r.CachedRoundArm)
        self.arm.study=self.study;self.arm.root=self.ar;self.arm.workspace=self.ws;self.arm.mode='exploration';self.arm.p=self.p;self.arm.s=state
        self.arm.active_budget=None;self.arm.tick=time.monotonic();self.arm.closed_index=8;self.arm.cached_returns=[];self.arm.restoration_checked=False
        self.arm.archive_sources=lambda:None
        self.arm.protect_concept_horizon=lambda _:None
        self.write(self.study/'protocol.json',self.p);self.write(self.study/'seal.json',{'neutral':'seal'})
        self.write(self.study/'seed/contract.json',{'neutral':'contract'});self.write(self.ws/'contract.json',{'neutral':'contract'});self.write(self.study/'seed/seed-files.json',[])
        self.write(self.ar/'rounds/0008/start.json',{'research':state['research'],'source':self.source})
        for key,role,req,rc in [('plan-0008','proposer',{'role':'proposer','request_id':'plan-0008','model':self.p['model'],'reasoning_effort':'high'},0),
                                ('round-0008','researcher',self.original,-9)]:
            job=self.ar/'jobs'/key
            spec={'role':role,'request_id':key,'seconds':1800,'workspace':str(self.ws),'transport':'live','model':self.p['model'],
                  'reasoning_effort':'high','readonly':role=='proposer'}
            receipt={'role':role,'request_id':key,'returncode':rc,'outcome':'completed' if rc==0 else 'ResourceFailure: disk_headroom',
                'payload':{'neutral':'plan'} if rc==0 else None,'model':self.p['model'],'reasoning_effort':'high','elapsed_seconds':222,'after':self.source}
            for name,value in [('request',req),('receipt',receipt),('spec',spec)]:self.write(job/(name+'.json'),value)
            state['receipts'].append(str(job));state['counted_jobs'].append(key);state['receipt_hashes'][str(job)]=r.digest(receipt);state['reservations']['call-'+key]=1800
        self.write(self.ar/'jobs/plan-0008/validated-plan.json',{'neutral':'immutable validated plan'})
        r.COMMON.save_state(self.ar/'state.json',state)
        self.diag=valid_diagnosis();self.diag.update(round=8,round_start_research_sha256=r.digest(state['research']))
        paths={'state':self.ar/'state.json','protocol':self.study/'protocol.json','seal':self.study/'seal.json','contract':self.study/'seed/contract.json',
               'round_start':self.ar/'rounds/0008/start.json','validated_plan':self.ar/'jobs/plan-0008/validated-plan.json'}
        for prefix,key in [('plan','plan-0008'),('research','round-0008')]:
            for name in ('request','receipt','spec'):paths[prefix+'_'+name]=self.ar/'jobs'/key/(name+'.json')
        self.diag['input_file_sha256']={k:r.sha(v) for k,v in paths.items()}
        self.arm.job_pins=r.job_bindings(self.diag)
        self.wrapper={'schema':'math-gkm.actual-closed-round-pure-diagnosis.v1','read_only':True,'source_sha256':r.DIAGNOSTIC_SHA,'result':self.diag}
        self.dp=self.root/'DIAGNOSIS.json';self.write(self.dp,self.wrapper);self.ref={'path':str(self.dp),'sha256':r.sha(self.dp)}
        self.source_sha=r.sha(r.__file__)
        self.patches=contextlib.ExitStack();self.addCleanup(self.patches.close)
        self.patches.enter_context(patch.object(r,'ROOT',self.root))
        self.patches.enter_context(patch.object(subprocess,'Popen',side_effect=AssertionError('no processes')))
        self.patches.enter_context(patch.object(subprocess,'run',side_effect=AssertionError('no processes')))
        self.patches.enter_context(patch.object(r.Arm,'closed_planner_receipt',return_value={'neutral':'authenticated'}))
    def write(self,path,value):r.COMMON.write(path,value)
    def native_round_patches(self):
        stack=contextlib.ExitStack()
        stack.enter_context(patch.object(r.Arm,'plan_with_repair',return_value=(copy.deepcopy(self.cached),copy.deepcopy(self.commitment))))
        stack.enter_context(patch.object(snapshot_routing,'ENABLED',False))
        def snapshot(ws,target,*args):self.write(target/'manifest.json',{'binding':'neutral-snapshot','files':self.source})
        stack.enter_context(patch.object(native,'snapshot',side_effect=snapshot))
        stack.enter_context(patch.object(r.COMMON,'verify_snapshot',return_value={'binding':'neutral-snapshot'}))
        stack.enter_context(patch.object(study_observer,'checkpoint',return_value=None))
        stack.enter_context(patch.object(study_bridge,'observation',side_effect=lambda arm,*args:arm.s['host_events'].append('neutral failed-report observation')))
        stack.enter_context(patch.object(study_reports,'accept_report',side_effect=AssertionError('no mathematical admission')))
        return stack
    def finish(self):
        with self.native_round_patches(),patch.object(r,'native_verify'),patch.object(r,'headroom'),patch.object(r.COMMON,'inventory',return_value=self.source),\
             patch.object(r.D,'diagnose',return_value=copy.deepcopy(self.diag)),patch.object(r,'CachedRoundArm',return_value=self.arm):
            return r.finish_closed_round(self.study,round_index=8,expected_state_sha256=self.diag['input_file_sha256']['state'],
                diagnosis=self.ref,expected_source_sha256=self.source_sha,output=self.output)
    def verify(self,**kwargs):
        return r.verify_finished(self.study,self.output,expected_source_sha256=self.source_sha,native_checks=False,**kwargs)
    def amend_finished(self,**values):
        f=r.read(self.output/'FINISHED.json');f.update(values);self.write(self.output/'FINISHED.json',f)


class CachedCalls(Fixture):
    def test_existing_failed_receipt_returns_without_cost_or_launch(self):
        self.arm.restoration_checked=True;before=copy.deepcopy(self.arm.s)
        result=self.arm.call('round-0008','researcher',self.original)
        self.assertEqual(result['returncode'],-9);self.assertEqual(self.arm.s,before);self.assertEqual(self.arm.cached_returns,['researcher'])
    def test_any_fresh_key_refuses(self):
        with self.assertRaises(r.Refused):self.arm.call('round-0009','researcher',self.original)
        self.assertEqual(self.arm.cached_returns,[])
    def test_full_request_difference_refuses(self):
        self.arm.restoration_checked=True;req=copy.deepcopy(self.original);req['agenda']=['PRIVATE_NEW_VALUE']
        with self.assertRaises(r.Refused):self.arm.call('round-0008','researcher',req)
    def test_unrestored_researcher_refuses(self):
        with self.assertRaises(r.Refused):self.arm.call('round-0008','researcher',self.original)
    def test_modified_authenticated_receipt_refuses(self):
        self.write(self.ar/'jobs/round-0008/receipt.json',{'returncode':-9})
        with self.assertRaises(r.Refused):self.arm.call('round-0008','researcher',self.original)
    def test_plan_restores_order_in_memory_only(self):
        before=r.sha(self.ar/'jobs/plan-0008/validated-plan.json');cached=copy.deepcopy(self.cached)
        with patch.object(r.Arm,'plan_with_repair',return_value=(cached,self.commitment)):
            staged,commitment=self.arm.plan_with_repair('plan-0008',{},self.arm.s['research'],self.ws,8,self.p)
        self.assertEqual(list(staged['portfolio']),['z','a']);self.assertEqual(r.digest(staged),r.digest(cached));self.assertEqual(list(cached['portfolio']),['a','z'])
        self.assertEqual(r.sha(self.ar/'jobs/plan-0008/validated-plan.json'),before);self.assertTrue(self.arm.restoration_checked)
    def test_reverse_program_exact_gate(self):
        self.cached['program']['code'].insert(0,{'op':'reverse_portfolio'})
        staged=copy.deepcopy(self.cached);staged['portfolio']={k:staged['portfolio'][k] for k in ['z','a']}
        original=r.D.rebuild(staged,self.commitment,self.p,8,r.POLICY,r.KNOWLEDGE.SCHEMAS)
        self.write(self.ar/'jobs/round-0008/request.json',original);self.arm.job_pins['researcher']['request.json']=r.sha(self.ar/'jobs/round-0008/request.json')
        with patch.object(r.Arm,'plan_with_repair',return_value=(self.cached,self.commitment)):
            restored,_=self.arm.plan_with_repair('plan-0008',{},self.arm.s['research'],self.ws,8,self.p)
        self.assertEqual(r.D.rebuild(restored,self.commitment,self.p,8,r.POLICY,r.KNOWLEDGE.SCHEMAS),original)


class DiagnosisGuards(Fixture):
    def test_escaped_study_refuses_before_opening_lock(self):
        with patch.object(r.COMMON,'lock',side_effect=AssertionError('must not create escaped lock')):
            with self.assertRaises(r.Refused):
                r.finish_closed_round(self.root.parent/'escaped-study',round_index=8,expected_state_sha256='a'*64,
                    diagnosis=self.ref,expected_source_sha256=self.source_sha,output=self.output)
    def test_exact_typed_wrapper_normalizes(self):self.assertEqual(r.diagnosis_result(self.wrapper),self.diag)
    def test_wrong_source_or_raw_result_refuses(self):
        for value in (self.diag,{**self.wrapper,'source_sha256':'f'*64},{**self.wrapper,'read_only':False}):
            with self.assertRaises(r.Refused):r.diagnosis_result(value)
    def test_C_markers_and_cleanup_are_required(self):
        for key,value in [('current_research_equals_round_start',False),('history_exists',True),('snapshot_exists',True),('snapshot_staging_exists',True),('protocol_pending_is_null',False)]:
            changed=copy.deepcopy(self.diag);changed[key]=value;self.assertFalse(r.safe_diagnosis(changed))
        for key,value in [('global_cleanup_hold_present',True),('outcome_reports_cleanup_problem',True),('receipt_operationally_incomplete',True)]:
            changed=copy.deepcopy(self.diag);changed['cleanup_metadata'][key]=value;self.assertFalse(r.safe_diagnosis(changed))
    def test_unrelated_request_field_refuses(self):
        changed=copy.deepcopy(self.diag);changed['fixed_key_differences']['agenda']={};self.assertFalse(r.safe_diagnosis(changed))


class ClosureLifecycle(Fixture):
    def test_unchanged_native_round_closes_failure_without_new_math_or_cost(self):
        before=copy.deepcopy(self.arm.s);result=self.finish();after=r.COMMON.load_state(self.ar/'state.json')
        self.assertEqual(result['round_after'],9);self.assertFalse(result['root_proved']);self.assertEqual(self.arm.cached_returns,['researcher'])
        self.assertEqual(r.accounting(before),r.accounting(after));self.assertEqual(r.admissions(before),r.admissions(after))
        self.assertEqual(len(after['research']['observations']),len(self.staged['observations'])+1)
        self.assertEqual(r.read(self.ws/'history/round-0008.json'),r.read(self.ar/'jobs/round-0008/receipt.json'))
        self.assertTrue(self.verify()['finished']['sha256'])
    def test_original_request_plan_receipts_are_not_rewritten(self):
        pins=copy.deepcopy(self.diag['input_file_sha256']);self.finish()
        for key,job in [('plan','plan-0008'),('research','round-0008')]:
            for name in ('request','receipt','spec'):self.assertEqual(r.sha(self.ar/'jobs'/job/(name+'.json')),pins[key+'_'+name])
    def test_fresh_output_is_once_only_no_automatic_retry(self):
        self.finish()
        with self.assertRaises(r.Refused):self.finish()
    def test_current_CAS_is_once_then_legitimate_progress_is_allowed(self):
        self.finish();state=r.COMMON.load_state(self.ar/'state.json');state['round']=10;r.COMMON.save_state(self.ar/'state.json',state)
        with self.assertRaises(r.Refused):self.verify()
        self.assertEqual(self.verify(require_current_state=False)['round_after'],9)
    def test_after_archive_and_current_binding_cannot_diverge(self):
        self.finish();self.amend_finished(after_state_sha256='a'*64)
        with self.assertRaises(r.Refused):self.verify(require_current_state=False)
    def test_before_archive_must_equal_original_state_pin(self):
        self.finish();self.amend_finished(input_file_sha256={**self.diag['input_file_sha256'],'state':'a'*64})
        with self.assertRaises(r.Refused):self.verify()
    def test_archive_tamper_refuses(self):
        self.finish();p=self.output/'AFTER_STATE.raw';p.chmod(0o600);p.write_text('{}')
        with self.assertRaises(r.Refused):self.verify()
    def test_failed_or_incomplete_transaction_refuses(self):
        self.finish();self.write(self.output/'FAILED.json',{'error_class':'Neutral'})
        with self.assertRaises(r.Refused):self.verify()
    def test_reader_native_checks_false_never_calls_native_verify(self):
        self.finish()
        with patch.object(r,'native_verify',side_effect=AssertionError('reader cannot verify compiler')):
            self.verify(require_current_state=False)
    def test_E1_archives_never_decode_private_research(self):
        self.finish();original_loads=json.loads
        def selected_only(value,*args,**kwargs):
            raw=value.encode() if isinstance(value,str) else value
            if b'PRIVATE_NEUTRAL' in raw:raise AssertionError('whole private state decode')
            return original_loads(value,*args,**kwargs)
        with patch.object(json,'loads',side_effect=selected_only):self.verify(require_current_state=False)
    def test_FINISHED_never_claims_theorem_or_new_admissions(self):
        result=self.finish();self.assertFalse(result['root_proved']);self.assertEqual(result['new_role_launches'],0);self.assertEqual(result['new_mathematical_admissions'],0)

if __name__=='__main__':unittest.main()
