"""UNRUN pure synthetic tests. No filesystem input except sibling source loading.
Run only after root GO; never reads a study/receipt/private mathematical body.
"""
import copy,importlib.util,unittest
from pathlib import Path
path=Path(__file__).with_name('old100_controls20.py')
spec=importlib.util.spec_from_file_location('synthetic_old100_controls20',path)
c=importlib.util.module_from_spec(spec);spec.loader.exec_module(c)

def fixture():
 bundles={};receipts={};paths=[]
 roles={'plan-0080':'proposer','round-0080':'researcher','plan-0081':'proposer','round-0081':'researcher','review-source-v1-82':'reviewer','select-82':'selector'}
 for index,name in enumerate(c.JOBS):
  pid=1000+index;watchdog=2000+index;role=roles[name]
  body={'request_id':name,'role':role,'outcome':'output_budget_exceeded' if role=='reviewer' else 'completed','returncode':-9 if role=='reviewer' else 0,'operationally_incomplete':role=='reviewer','payload':{'private_body':'synthetic value, never decoded by validator'},'resources':{'owned_identities':{str(pid):'1792840520:185712'}}}
  bundles[name]={'request':c.canonical({'request_id':name,'role':role,'private_request':'synthetic'}),'spec':c.canonical({'request_id':name,'role':role,'private_spec':'synthetic'}),'receipt':c.canonical(body)+b'\n','process':c.canonical({'pid':pid,'watchdog_pid':watchdog}),'watchdog':c.canonical({'pid':watchdog})}
  absolute=str(c.STUDY/'arms/exploration/jobs'/name);paths.append(absolute);receipts[absolute]=c.bytesha(bundles[name]['receipt'][:-1])
 state={'state':{'calls':6,'meta_calls':4,'counted_jobs':list(c.JOBS),'receipts':paths,'receipt_hashes':receipts}}
 return state,bundles

def replace_receipt(state,bundles,name,field,value):
 # Tests own their synthetic object; production never decodes mixed receipts.
 import json
 body=json.loads(bundles[name]['receipt']);body[field]=value;data=c.canonical(body)+b'\n';bundles[name]['receipt']=data
 state['state']['receipt_hashes'][str(c.STUDY/'arms/exploration/jobs'/name)]=c.bytesha(data[:-1])

class TerminalTailTests(unittest.TestCase):
 def validate(self,state,bundles,names=None):return c.validate_terminal_tail(c.canonical(state),list(c.JOBS) if names is None else names,bundles)
 def test_closed_output_budget_reviewer_is_accepted(self):
  state,bundles=fixture();result=self.validate(state,bundles)
  self.assertEqual(result['terminal_jobs']['review-source-v1-82']['returncode'],-9)
  self.assertTrue(result['exact_accounted_six_jobs'])
 def test_wrong_outcome_is_rejected(self):
  state,bundles=fixture();replace_receipt(state,bundles,'review-source-v1-82','outcome','completed')
  with self.assertRaises(RuntimeError):self.validate(state,bundles)
 def test_wrong_returncode_is_rejected(self):
  state,bundles=fixture();replace_receipt(state,bundles,'review-source-v1-82','returncode',0)
  with self.assertRaises(RuntimeError):self.validate(state,bundles)
 def test_boolean_returncode_is_rejected(self):
  state,bundles=fixture();replace_receipt(state,bundles,'round-0081','returncode',False)
  with self.assertRaises(RuntimeError):self.validate(state,bundles)
 def test_unaccounted_job_is_rejected(self):
  state,bundles=fixture();bundles['plan-0082']=copy.deepcopy(bundles['plan-0081'])
  with self.assertRaises(RuntimeError):self.validate(state,bundles,list(c.JOBS)+['plan-0082'])
 def test_receipt_digest_mismatch_is_rejected(self):
  state,bundles=fixture();state['state']['receipt_hashes'][state['state']['receipts'][0]]='0'*64
  with self.assertRaises(RuntimeError):self.validate(state,bundles)
 def test_numeric_pid_key_write_order_matches_consumed_digest(self):
  import json
  state,bundles=fixture();name='round-0080';body=json.loads(bundles[name]['receipt'])
  # Original Guard map uses int keys: write sorts 9,10,1001 numerically, but
  # consume reads string keys and digest sorts "10","1001","9".
  body['resources']['owned_identities']={9:'1792840520:1',10:'1792840520:2',1001:'1792840520:185712'}
  data=c.canonical(body)+b'\n';bundles[name]['receipt']=data
  expected=c.digest(json.loads(data));state['state']['receipt_hashes'][str(c.STUDY/'arms/exploration/jobs'/name)]=expected
  self.assertNotEqual(c.bytesha(data[:-1]),expected)
  self.assertEqual(c.canonical_receipt_digest(data),expected)
  self.assertTrue(self.validate(state,bundles)['exact_accounted_six_jobs'])
 def test_process_watchdog_disagreement_is_rejected(self):
  state,bundles=fixture();bundles['round-0081']['watchdog']=c.canonical({'pid':98765})
  with self.assertRaises(RuntimeError):self.validate(state,bundles)
if __name__=='__main__':unittest.main()
