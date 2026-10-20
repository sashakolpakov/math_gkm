"""Pure operations fixtures: no Lean, models, or research task execution."""
import ast
import copy
import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
spec=importlib.util.spec_from_file_location('failed_tail_ops',Path(__file__).with_name('finalize.py'))
ops=importlib.util.module_from_spec(spec);spec.loader.exec_module(ops)
from machinery import study_policy,study_program
from machinery.study import DEFAULT
from machinery.study_knowledge import SCHEMAS

class Fixtures(unittest.TestCase):
    def fixture(self,reverse=False):
        p=dict(DEFAULT)
        staged=study_policy.initial('exploration',p)
        staged['portfolio']={'z':{'id':'z','reference':'zref'},'a':{'id':'a','reference':'aref'}}
        if reverse:staged['program']={'schema':study_program.REFERENCE['schema'],'code':[{'op':'reverse_portfolio'}]}
        commitment={'trial':{'id':'operational fixture'}}
        retained=study_policy.request(staged,1,p)
        retained.update(committed_trial=commitment['trial'],prospective_binding=ops.digest(commitment),commitment=commitment)
        retained['checked_submission_schemas']=SCHEMAS
        retained.update(model=p['model'],reasoning_effort='high',request_id='round-0001')
        sorted_staged=copy.deepcopy(staged);sorted_staged['portfolio']={k:staged['portfolio'][k] for k in sorted(staged['portfolio'])}
        receipt={'role':'researcher','outcome':'ResourceFailure: fixture','finished':1}
        return p,sorted_staged,commitment,retained,receipt

    def test_restores_original_order_and_input_hash(self):
        p,s,c,r,_=self.fixture()
        self.assertNotEqual(study_policy.request(s,1,p)['program_execution']['input_hash'],r['program_execution']['input_hash'])
        self.assertEqual(ops.restore_exact_request(s,c,r,p,1),r)
        self.assertEqual(list(s['portfolio']),['a','z'])

    def test_restores_reversed_program_order(self):
        p,s,c,r,_=self.fixture(True)
        self.assertEqual(ops.restore_exact_request(s,c,r,p,1),r)

    def test_rejects_changed_execution_envelope(self):
        for key,value in (('model','different'),('reasoning_effort','low'),('request_id','round-0002')):
            p,s,c,r,_=self.fixture();r[key]=value
            with self.subTest(field=key),self.assertRaisesRegex(ops.Invalid,'exactly'):ops.restore_exact_request(s,c,r,p,1)

    def test_rejects_changed_input_hash(self):
        p,s,c,r,_=self.fixture();r['program_execution']['input_hash']='wrong'
        with self.assertRaisesRegex(ops.Invalid,'exactly'):ops.restore_exact_request(s,c,r,p,1)

    def test_rejects_changed_program_trace(self):
        p,s,c,r,_=self.fixture();r['program_execution']['executed']=['reverse_portfolio']
        with self.assertRaisesRegex(ops.Invalid,'exactly'):ops.restore_exact_request(s,c,r,p,1)

    def test_rejects_changed_entry(self):
        p,s,c,r,_=self.fixture();r['portfolio'][0]['reference']='changed'
        with self.assertRaisesRegex(ops.Invalid,'portfolio entries differ'):ops.restore_exact_request(s,c,r,p,1)

    def test_rejects_duplicate_entry(self):
        p,s,c,r,_=self.fixture();r['portfolio'].append(copy.deepcopy(r['portfolio'][0]))
        with self.assertRaisesRegex(ops.Invalid,'portfolio entries differ'):ops.restore_exact_request(s,c,r,p,1)

    def test_rejects_other_request_change(self):
        p,s,c,r,_=self.fixture();r['agenda']=['new advice']
        with self.assertRaisesRegex(ops.Invalid,'exactly'):ops.restore_exact_request(s,c,r,p,1)

    def test_failed_transition_retains_concepts_and_feedback(self):
        p,s,c,r,receipt=self.fixture();s['concepts']={'active':{'end_round':1,'reference':'same'}}
        before=copy.deepcopy(s)
        out,n,phase=ops.failed_transition(s,r,receipt,1,p)
        self.assertEqual(n,2);self.assertEqual(phase,'review');self.assertEqual(s,before)
        self.assertEqual(out['concepts'],s['concepts']);self.assertEqual(out['portfolio'],s['portfolio'])
        self.assertEqual(out['observations'][-1]['outcome'],receipt['outcome'])
        self.assertEqual(out['review_feedback_deliveries'][-1]['request_id'],'round-0001')
        self.assertEqual(out['knowledge'],s['knowledge'])

    def test_completed_unfinished_and_nonresearch_receipts_rejected(self):
        p,s,c,r,receipt=self.fixture()
        for delta in ({'outcome':'completed'},{'finished':None},{'role':'adapter'}):
            with self.subTest(delta=delta),self.assertRaises(ops.Invalid):ops.failed_transition(s,r,{**receipt,**delta},1,p)

    def test_consumption_forbids_replay_before_any_checks(self):
        with tempfile.TemporaryDirectory() as tmp,patch.object(ops,'OPS',Path(tmp)),patch.object(ops,'reviewed') as checked:
            ops.write(Path(tmp)/'APPLY_INTENT.json',{'interrupted':True})
            with self.assertRaisesRegex(ops.Invalid,'already consumed'):ops.finalize(Path(tmp)/'REVIEW.json')
            checked.assert_not_called()

    def test_worker_birth_inventory_absence_required(self):
        receipt={'resources':{'owned_identities':{'1':'a','2':'b'}}}
        with patch('machinery.resources.current_process',return_value=None) as observed:
            ops.owned_absent(receipt);self.assertEqual(observed.call_count,2)
        with patch('machinery.resources.current_process',return_value={'identity':'reused'}):
            with self.assertRaisesRegex(ops.Invalid,'PID still exists'):ops.owned_absent(receipt)
        with self.assertRaisesRegex(ops.Invalid,'inventory missing'):ops.owned_absent({})

    def test_apply_has_no_role_proof_or_acceptance_calls(self):
        tree=ast.parse(Path(ops.__file__).read_text());apply=next(n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name=='finalize')
        names={n.func.attr if isinstance(n.func,ast.Attribute) else n.func.id for n in ast.walk(apply) if isinstance(n,ast.Call) and isinstance(n.func,(ast.Attribute,ast.Name))}
        self.assertFalse(names & {'call','ingest','accept_report','completion_candidate','check','run','execute','Popen','_research_round'})
        self.assertIn('observation',names);self.assertIn('snapshot',names);self.assertIn('checkpoint',names)

    def test_failed_tail_source_phase_matches_official_conditions(self):
        p,s,c,r,receipt=self.fixture();p['episode_rounds']=3;r['reassess_after_rounds']=2
        self.assertEqual(ops.failed_transition(s,r,receipt,1,p)[2],'review')
        r['reassess_after_rounds']=3;s['concepts']={'active':{'end_round':1}}
        self.assertEqual(ops.failed_transition(s,r,receipt,1,p)[2],'review')

if __name__=='__main__':unittest.main()
