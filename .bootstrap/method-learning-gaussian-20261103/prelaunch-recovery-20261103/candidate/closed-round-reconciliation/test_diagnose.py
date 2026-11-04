"""Neutral pure diagnosis tests; no real study inputs or effectful Arm methods."""
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('closed_round_pure_diagnostic_tested',HERE/'diagnose.py');d=importlib.util.module_from_spec(spec);spec.loader.exec_module(d)
sys.path.insert(0,str(d.ROOT))
from machinery import study_policy as policy,study_knowledge as knowledge,study_research_feedback as feedback

class Fixture(unittest.TestCase):
    def setUp(self):
        self.protocol={'rounds':16,'episode_rounds':2,'invention_rounds':1,'call_seconds':1800,'knowledge_checks_per_round':6,'validation_seconds':1800,
            'model':'gpt-6.1-sol','concept_driver':None,'method_learning':None}
        self.staged=policy.initial('exploration',self.protocol)
        self.staged['portfolio']={'z':{'id':'z','claim':'PRIVATE_NEUTRAL_CLAIM_Z'},'a':{'id':'a','claim':'PRIVATE_NEUTRAL_CLAIM_A'}}
        self.commitment={'trial':None,'round':8,'neutral':'immutable commitment'}
        self.original=d.rebuild(self.staged,self.commitment,self.protocol,8,policy,knowledge.SCHEMAS)
        self.cached=json.loads(d.canonical(self.staged))
        self.receipt={'outcome':'ResourceFailure: disk_headroom','payload':None,'elapsed_seconds':222,'returncode':-9}
    def restore(self,staged=None,original=None):
        return d.restore_staged_order(staged or self.cached,original or self.original,self.commitment,self.protocol,8,policy,knowledge.SCHEMAS)

class OrderRestoration(Fixture):
    def test_sorting_roundtrip_changes_list_request_but_not_staged_digest(self):
        self.assertEqual(d.digest(self.staged),d.digest(self.cached));new=d.rebuild(self.cached,self.commitment,self.protocol,8,policy,knowledge.SCHEMAS)
        self.assertNotEqual(new,self.original);self.assertEqual(set(d.diff(self.original,new)),{'portfolio','program_execution'})
    def test_restore_exact_full_request_without_mutating_inputs(self):
        before=d.canonical(self.cached);original=copy.deepcopy(self.original);restored,report=self.restore()
        self.assertTrue(report['exact_restoration_found']);self.assertEqual(d.digest(restored),d.digest(self.cached))
        self.assertEqual(d.rebuild(restored,self.commitment,self.protocol,8,policy,knowledge.SCHEMAS),self.original)
        self.assertEqual(d.canonical(self.cached),before);self.assertEqual(self.original,original)
    def test_reverse_portfolio_program_requires_preprogram_order(self):
        self.staged['program']={**self.staged['program'],'code':[{'op':'reverse_portfolio'}]+self.staged['program']['code']}
        self.original=d.rebuild(self.staged,self.commitment,self.protocol,8,policy,knowledge.SCHEMAS);self.cached=json.loads(d.canonical(self.staged))
        restored,report=self.restore();self.assertTrue(report['exact_restoration_found'])
        self.assertFalse(report['candidates'][0]['full_request_exactly_equal']);self.assertEqual(report['candidates'][-1]['candidate'],'inverse_request_order')
        self.assertEqual(d.rebuild(restored,self.commitment,self.protocol,8,policy,knowledge.SCHEMAS),self.original)
    def test_unrelated_difference_does_not_pass_by_ignoring_fields(self):
        original=copy.deepcopy(self.original);original['agenda']=['PRIVATE_UNRELATED_DIFFERENCE']
        restored,report=self.restore(original=original);self.assertIsNone(restored);self.assertFalse(report['exact_restoration_found'])
    def test_changed_portfolio_value_refuses(self):
        staged=copy.deepcopy(self.cached);staged['portfolio']['z']['claim']='PRIVATE_CHANGED'
        restored,report=self.restore(staged=staged);self.assertIsNone(restored);self.assertFalse(report['portfolio_same_multiset'])
    def test_duplicate_ids_refuse(self):
        original=copy.deepcopy(self.original);original['portfolio'].append(copy.deepcopy(original['portfolio'][0]))
        self.assertIsNone(self.restore(original=original)[0])
    def test_derived_hash_alone_must_match(self):
        original=copy.deepcopy(self.original);original['program_execution']['input_hash']='f'*64
        restored,report=self.restore(original=original);self.assertIsNone(restored);self.assertFalse(report['exact_restoration_found'])
    def test_output_contains_no_private_values_or_ids(self):
        _,report=self.restore();encoded=json.dumps(report)
        for private in ('PRIVATE_NEUTRAL_CLAIM_Z','PRIVATE_NEUTRAL_CLAIM_A','"z"','"a"'):self.assertNotIn(private,encoded)
    def test_unknown_key_name_is_hashed(self):
        result=d.diff({'PRIVATE_UNKNOWN_KEY':'PRIVATE_VALUE'},{})
        encoded=json.dumps(result);self.assertNotIn('PRIVATE_UNKNOWN_KEY',encoded);self.assertNotIn('PRIVATE_VALUE',encoded)

class PhaseComparison(Fixture):
    def analyze(self,current,start=None):
        return d.analyze(self.cached,self.commitment,self.protocol,8,self.original,self.receipt,current,policy,knowledge.SCHEMAS,feedback,start)
    def test_round_start_state_C_detected(self):
        start=copy.deepcopy(self.cached);start['agenda']=['PRIVATE_ROUND_START']
        result=self.analyze(start,start);self.assertTrue(result['current_research_equals_round_start']);self.assertFalse(result['current_research_equals_expected_failed_update'])
    def test_validated_staged_A_detected(self):
        result=self.analyze(self.cached);self.assertTrue(result['current_research_equals_validated_staged']);self.assertFalse(result['current_research_equals_expected_failed_update'])
    def test_failed_update_B_detected_without_admitting_math(self):
        after=copy.deepcopy(self.cached);feedback.record_feedback_consumption(after,'round-0008',8,'researcher',[])
        after['execution_budget']=self.original.get('execution_budget',{});after['observations'].append({'round':8,'outcome':self.receipt['outcome'],'meaning':'failure within budget; no unprovability conclusion'})
        result=self.analyze(after);self.assertTrue(result['current_research_equals_expected_failed_update']);self.assertEqual(after['knowledge'],self.cached['knowledge'])
    def test_phase_diagnosis_never_prints_private_values(self):
        result=self.analyze(self.cached);encoded=json.dumps(result)
        self.assertNotIn('PRIVATE_NEUTRAL_CLAIM',encoded);self.assertNotIn('ResourceFailure: disk_headroom',encoded)
    def test_completed_or_nonnull_payload_refuses_failure_diagnosis(self):
        self.receipt['outcome']='completed'
        with self.assertRaises(d.Refused):self.analyze(self.cached)



class CleanupAndRefusal(unittest.TestCase):
    def test_missing_cleanup_flag_is_not_invented_completion(self):
        result=d.cleanup_metadata({'outcome':'ResourceFailure: disk_headroom','resources':{'termination_cause':'disk_headroom','owned_identities':{'PRIVATE_PID':'PRIVATE_BIRTH'}}},False)
        self.assertTrue(result['resource_termination_is_disk_headroom']);self.assertFalse(result['explicit_cleanup_completion_flag_present'])
        self.assertIsNone(result['receipt_operationally_incomplete']);self.assertNotIn('PRIVATE',json.dumps(result))
    def test_unresolved_cleanup_and_global_hold_remain_visible(self):
        result=d.cleanup_metadata({'outcome':'unresolved_cleanup: PRIVATE_DETAILS','operationally_incomplete':True},True)
        self.assertTrue(result['outcome_reports_cleanup_problem']);self.assertTrue(result['global_cleanup_hold_present']);self.assertTrue(result['receipt_operationally_incomplete'])
        self.assertNotIn('PRIVATE_DETAILS',json.dumps(result))
    def test_exception_values_are_never_printed(self):
        import contextlib,io
        out=io.StringIO()
        with patch.object(sys,'argv',['diagnose.py','--study','/neutral','--round','8','--state-sha256','a'*64]),patch.object(d,'diagnose',side_effect=KeyError('PRIVATE_EXCEPTION_VALUE')),contextlib.redirect_stdout(out):
            self.assertEqual(d.main(),2)
        self.assertNotIn('PRIVATE_EXCEPTION_VALUE',out.getvalue());self.assertEqual(json.loads(out.getvalue())['error_class'],'KeyError')

if __name__=='__main__':unittest.main()
