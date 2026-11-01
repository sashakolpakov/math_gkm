"""One fresh independent selector call; unchanged native API, no mathematical advice."""
from pathlib import Path
import hashlib, json, sys
ROOT=Path('/Users/sasha/math_gkm')
assert Path.cwd()==ROOT and sys.flags.isolated and sys.flags.no_site and sys.dont_write_bytecode
sys.path.insert(0,str(ROOT))
from machinery.study_common import read, digest, implementation, authorize_live
from machinery.study_curate import curate
contract_path=ROOT/'contracts/gaussian-quotient-goal.json'
assert hashlib.sha256(contract_path.read_bytes()).hexdigest()=='9c9f6129d1cea8fff8a05afa564f2b73b90736816027d31ff4b017dcf0d9e50e'
assert digest(implementation())=='ec2755d3a6b144a5898b21a0199b98342bf3e4d7a3cb14d34e1b69e57f8ce8fa'
contract=read(contract_path)
assert digest(contract)=='a9802e5423169618ba4e9c4e2cac3003e86e6133a441b6f91abdc00f97745e49'
authorize_live(contract)
result=curate(ROOT/'.bootstrap/gaussian-quotient-20261031/curation','live',1800,contract,model='gpt-6.1-sol',task_limits={'holdout':1,'regression':1})
assert digest(implementation())=='ec2755d3a6b144a5898b21a0199b98342bf3e4d7a3cb14d34e1b69e57f8ce8fa'
print(json.dumps({'native_curation_returned':True,'role':'independent_pretrial_selector','model':'gpt-6.1-sol','suite_path':result['suite'],'provenance_path':result['provenance'],'answers_or_statements_disclosed':False},sort_keys=True))
