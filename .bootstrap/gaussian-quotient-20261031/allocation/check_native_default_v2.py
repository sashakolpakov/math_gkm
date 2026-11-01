"""Focused new-default checks only; no constructor, model, proof or old suite."""
import ast
import hashlib
import json
from pathlib import Path
import sys

HERE=Path(__file__).parent
ROOT=Path('/Users/sasha/math_gkm')
sys.path.insert(0,str(ROOT))
from machinery.study_common import Invalid,validate_model

v1=(HERE/'study.proposed.py').read_bytes()
v2=(HERE/'study.proposed.v2.py').read_bytes()
assert hashlib.sha256(v1).hexdigest()=='eb19c2086dd318b603d710e7eef0bf57cceedb3b940aeda3fcc0df713bce04f2'
before=b"'max_calls': 24, 'meta_calls': 8,"
after=b"'max_calls': 24, 'meta_calls': 10,"
assert v2.count(after)==1 and v2.replace(after,before)==v1
def all_code(body):
    return {n.name:ast.dump(n,include_attributes=False) for n in ast.parse(body).body
            if isinstance(n,(ast.FunctionDef,ast.ClassDef))}
assert all_code(v1)==all_code(v2)

transfer=(ROOT/'machinery/study_transfer.py').read_bytes()
def namespace(body):
    tree=ast.parse(body)
    default=next(n for n in tree.body if isinstance(n,ast.Assign) and
                 any(isinstance(t,ast.Name) and t.id=='DEFAULT' for t in n.targets))
    nodes=[default]+[n for n in tree.body if isinstance(n,ast.FunctionDef) and
        n.name in ('episode_envelope','validate_commitment','validate_protocol')]
    ns={'__name__':'machinery.focused_native_default_check','__package__':'machinery',
        'Invalid':Invalid,'validate_model':validate_model,'ROOT':ROOT}
    pure=[n for n in ast.parse(transfer).body if isinstance(n,ast.FunctionDef) and
          n.name in ('paired_evaluation_seconds','catalogue_seconds')]
    exec(compile(ast.Module(body=pure,type_ignores=[]),str(ROOT/'machinery/study_transfer.py'),'exec'),ns)
    exec(compile(ast.Module(body=nodes,type_ignores=[]),'exact_public_native_allocation_source','exec'),ns)
    return ns

old,new=namespace(v1),namespace(v2)
try:old['validate_commitment'](old['DEFAULT'])
except Invalid as exc:assert str(exc)=='impossible episode through evaluation/review: meta_calls'
else:raise AssertionError('v1 DEFAULT should refuse its corrected ten-META episode')
new['validate_commitment'](new['DEFAULT'])
new['validate_protocol'](new['DEFAULT'])
assert new['DEFAULT']['meta_calls']==10
assert new['episode_envelope'](new['DEFAULT'],2,0)=={
    'research':(8700,10,8),'evaluation':(0,0,0),'review':(60,2,2)}
selected={**new['DEFAULT'],'transport':'live','model':'gpt-6.1-sol',
    'rounds':4,'episode_rounds':2,'proposal_repairs':1,'knowledge_checks_per_round':3,
    'call_seconds':1800,'adaptation_seconds':1800,'validation_seconds':1800,
    'policy_trials':1,'policy_trial_rounds':2,'arm_seconds':270000,
    'max_calls':64,'meta_calls':40,'concept_driver':{'enabled':True}}
new['validate_protocol'](selected)
new['validate_commitment'](selected,2)
assert new['episode_envelope'](selected,2,2)=={
    'research':(32400,10,8),'evaluation':(21600,2,0),'review':(3600,2,2)}
result={'schema':'math-gkm.native-default-v2-focused-check.v1',
    'v1_sha256':hashlib.sha256(v1).hexdigest(),'v2_sha256':hashlib.sha256(v2).hexdigest(),
    'test_source_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    'transfer_source_sha256':hashlib.sha256(transfer).hexdigest(),
    'v1_DEFAULT_meta8_rejected':True,'v2_DEFAULT_meta10_protocol_and_commitment_passed':True,
    'v1_to_v2_all_function_and_class_ASTs_identical':True,
    'selected_270000_64_40_K3_1800_protocol_and_tasks2_commitment_passed':True,
    'existing_three_group_allocation_result_retained_without_rerun':True,
    'real_deployment_controls_need_no_formula_change_but_new_source_identity':True,
    'actual_ROOT_campaign_constructor_model_proof_or_Git_actions':False}
(HERE/'DEFAULT_V2_RESULT.json').write_text(json.dumps(result,indent=2,sort_keys=True)+'\n')
print(json.dumps({'default_passed':True,'selected_campaign_passed':True,'v1_functions_unchanged':True},sort_keys=True))
