"""INACTIVE pure closed-round diagnosis; emits no mathematical values or IDs.

Only ROOT may run this on actual private artifacts after source review. This file
never calls an Arm action, model, compiler, snapshot, save_state or write API.
In-memory order restoration is returned only to trusted callers, never printed.
"""
import argparse
import copy
import hashlib
import json
from pathlib import Path
import sys

ROOT=Path('/Users/sasha/math_gkm')
NATIVE_SHA='6f3c44afff35f20d63be78d94aac857c9d3532c340c63514d3473de5f7617934'
CONTRACT_SHA='a9802e5423169618ba4e9c4e2cac3003e86e6133a441b6f91abdc00f97745e49'
SOURCE_PINS={'machinery/study.py': 'c072d318480634ebb3e3e7ca474acc35cd9860f327f19169eea3a0cafbe3a7d8', 'machinery/study_common.py': '2388e9094ea69ae934a0bc5be466e8e7457abe08ba55e0413cc4bdc53576301b', 'machinery/study_policy.py': '8d6008420f243f73f5d2c32fcd51195bc6d88a875c164f046e368a4d6f683d70', 'machinery/study_program.py': 'fc254679b6d3b16c8919c0eef4a05e0a6feea3a441f7730f52b5e162b67b123b', 'machinery/study_context.py': '42e025ba0948eea065b805df7a45dda8ab8c24697c3c37b4d11ca147013ca55b', 'machinery/study_research_feedback.py': '4842e27c63414f6ffee6ce5fd316ddd9a53214f352c7d869d114a1f292fa5cde', 'machinery/study_knowledge.py': '4abda23a9bffac1e114de1ce924eb1dcaf5f9b7ec7e1bb05dd38702931db4816', 'machinery/snapshot_routing.py': 'f835c12bb572ba9ff386d0eb8597bf04a5d0c8ee0d0ee9ff69e0fa354fa64d31', 'machinery/study_worker.py': '765b02ec7842f6cd2f60ab7b5515ecc119b16901ecdc690d8ea3a4bb7e78e46d', 'machinery/resources.py': '6103109a36645809fd36cf9d3e963a30604463abb7b3d6614ddab25675e033cc'}
FIXED_KEYS=frozenset(('role','round','policy','mode','agenda','portfolio','episode','observations','own_check_feedback',
 'knowledge','components','remaining_obligations','pending_discoveries','formal_obligations','delayed_use_links','proposition_dag',
 'findings','limits','status','checked_submission_schemas','dag_submission_rules','research_feedback','concept_driver',
 'concept_submission_schemas','method_learning','research_focus','strategy_reassessment','reuse_interfaces','work_mode',
 'execution_budget','reassess_after_rounds','program_execution','committed_trial','prospective_binding','commitment',
 'model','reasoning_effort','request_id'))

class Refused(ValueError):pass

def need(value):
    if not value:raise Refused('diagnostic_input_binding_invalid')

def canonical(value):return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False)
def digest(value):return hashlib.sha256(canonical(value).encode()).hexdigest()
def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda:stream.read(1024**2),b''):h.update(block)
    return h.hexdigest()

def native():
    for name,pin in SOURCE_PINS.items():need(sha(ROOT/name)==pin)
    sys.path.insert(0,str(ROOT))
    from machinery import study_common,study_policy,study_knowledge,study_research_feedback
    need(study_common.digest(study_common.implementation())==NATIVE_SHA)
    return study_common,study_policy,study_knowledge,study_research_feedback

def rebuild(staged,commitment,protocol,index,policy,schemas):
    request=policy.request(staged,index,protocol)
    request.update(committed_trial=commitment['trial'],prospective_binding=digest(commitment),commitment=copy.deepcopy(commitment))
    request['checked_submission_schemas']=schemas
    return {**request,'model':protocol['model'],'reasoning_effort':'high','request_id':f'round-{index:04d}'}

def diff(left,right):
    output={}
    for key in sorted(set(left)|set(right)):
        present_left=key in left;present_right=key in right
        if present_left and present_right and left[key]==right[key] and canonical(left[key])==canonical(right[key]):continue
        name=key if key in FIXED_KEYS else 'unclassified_key_'+hashlib.sha256(str(key).encode()).hexdigest()
        row={'left_present':present_left,'right_present':present_right}
        for side,value,present in (('left',left.get(key),present_left),('right',right.get(key),present_right)):
            if present:row.update({side+'_sha256':digest(value),side+'_canonical_bytes':len(canonical(value).encode()),side+'_type':type(value).__name__})
        output[name]=row
    return output

def restore_staged_order(staged,original,commitment,protocol,index,policy,schemas):
    """At most two metadata-order candidates; no field-ignoring equivalence."""
    mapping=staged.get('portfolio');sequence=original.get('portfolio')
    report={'portfolio_same_multiset':False,'portfolio_order_changed':False,'candidates':[],'exact_restoration_found':False}
    if not isinstance(mapping,dict) or not isinstance(sequence,list):return None,report
    ids=[]
    for entry in sequence:
        if not isinstance(entry,dict) or not isinstance(entry.get('id'),str):return None,report
        ids.append(entry['id'])
    if len(ids)!=len(set(ids)) or set(ids)!=set(mapping):return None,report
    if any(mapping[key]!=entry or canonical(mapping[key])!=canonical(entry) for key,entry in zip(ids,sequence)):return None,report
    report['portfolio_same_multiset']=True
    report['portfolio_order_changed']=list(mapping)!=ids
    for label,order in (('original_request_order',ids),('inverse_request_order',list(reversed(ids)))):
        candidate=copy.deepcopy(staged);candidate['portfolio']={key:candidate['portfolio'][key] for key in order}
        unchanged=digest(candidate)==digest(staged)
        generated=rebuild(candidate,commitment,protocol,index,policy,schemas)
        exact=generated==original and canonical(generated)==canonical(original)
        report['candidates'].append({'candidate':label,'canonical_staged_digest_unchanged':unchanged,'full_request_exactly_equal':exact,
            'derived_program_input_hash_equal':generated.get('program_execution',{}).get('input_hash')==original.get('program_execution',{}).get('input_hash'),
            'fixed_key_differences':diff(original,generated)})
        if unchanged and exact:
            report['exact_restoration_found']=True;return candidate,report
    return None,report

def analyze(staged,commitment,protocol,index,original,receipt,current_research,policy,schemas,feedback,round_start_research=None):
    generated=rebuild(staged,commitment,protocol,index,policy,schemas)
    restored,restoration=restore_staged_order(staged,original,commitment,protocol,index,policy,schemas)
    delivered=copy.deepcopy(staged)
    feedback.record_feedback_consumption(delivered,f'round-{index:04d}',index,'researcher',
        [packet['reference'] for packet in original['research_feedback']['history']])
    updated=copy.deepcopy(delivered);updated['execution_budget']=original.get('execution_budget',{})
    need(receipt.get('outcome')!='completed' and receipt.get('payload') is None)
    updated['observations'].append({'round':index,'outcome':receipt['outcome'],'meaning':'failure within budget; no unprovability conclusion'})
    return {'full_regenerated_request_equal':generated==original and canonical(generated)==canonical(original),
        'fixed_key_differences':diff(original,generated),'order_restoration':restoration,
        'current_research_equals_round_start':digest(current_research)==digest(round_start_research) if round_start_research is not None else None,
        'round_start_research_sha256':digest(round_start_research) if round_start_research is not None else None,
        'current_research_equals_validated_staged':digest(current_research)==digest(staged),
        'current_research_equals_staged_after_feedback':digest(current_research)==digest(delivered),
        'current_research_equals_expected_failed_update':digest(current_research)==digest(updated),
        'validated_staged_sha256':digest(staged),'expected_failed_update_sha256':digest(updated),'current_research_sha256':digest(current_research),
        'original_request_sha256':digest(original),'regenerated_request_sha256':digest(generated)}

def cleanup_metadata(receipt,hold_present):
    outcome=receipt.get('outcome');outcome=outcome if isinstance(outcome,str) else ''
    resources=receipt.get('resources',{});resources=resources if isinstance(resources,dict) else {}
    operational=receipt.get('operationally_incomplete')
    return {'receipt_operationally_incomplete_present':'operationally_incomplete' in receipt,
        'receipt_operationally_incomplete':operational if type(operational) is bool else None,
        'resource_termination_is_disk_headroom':resources.get('termination_cause')=='disk_headroom',
        'resource_termination_is_null':resources.get('termination_cause') is None,
        'explicit_cleanup_completion_flag_present':any(k in receipt or k in resources for k in ('cleanup_verified','cleanup_complete','remaining_children')),
        'outcome_reports_cleanup_problem':any(marker in outcome for marker in ('unresolved_cleanup','unresolved cleanup','cleanup_monitor_unavailable','monitor_unavailable')),
        'global_cleanup_hold_present':bool(hold_present),
        'last_resource_sample_is_not_final_cleanup_evidence':True}


def diagnose(study,mode,index,state_sha256):
    common,policy,knowledge,feedback=native();study=Path(study)
    need(study.is_absolute() and study.resolve()==study and study.parent==ROOT/'.scratch/studies' and
         study.name.startswith('method-learning-gaussian-20261103') and mode=='exploration' and type(index) is int and index>=0)
    arm=study/'arms'/mode;state_path=arm/'state.json';need(sha(state_path)==state_sha256)
    fixed_paths={'state':state_path,'protocol':study/'protocol.json','seal':study/'seal.json','contract':study/'seed/contract.json',
        'round_start':arm/'rounds'/f'{index:04d}'/'start.json','validated_plan':arm/'jobs'/f'plan-{index:04d}'/'validated-plan.json',
        'plan_receipt':arm/'jobs'/f'plan-{index:04d}'/'receipt.json','plan_spec':arm/'jobs'/f'plan-{index:04d}'/'spec.json',
        'plan_request':arm/'jobs'/f'plan-{index:04d}'/'request.json','research_request':arm/'jobs'/f'round-{index:04d}'/'request.json',
        'research_receipt':arm/'jobs'/f'round-{index:04d}'/'receipt.json','research_spec':arm/'jobs'/f'round-{index:04d}'/'spec.json'}
    input_pins={key:sha(path) for key,path in fixed_paths.items()}
    state=common.load_state(state_path);protocol=common.read(study/'protocol.json');seal=common.read(study/'seal.json')
    need(digest(common.read(study/'seed/contract.json'))==CONTRACT_SHA and digest(seal['implementation'])==NATIVE_SHA and
         state.get('active') is None and state.get('active_intent') is None and state.get('resolution') is None and state['round']==index)
    plan=arm/'jobs'/f'plan-{index:04d}';job=arm/'jobs'/f'round-{index:04d}'
    start=common.read(arm/'rounds'/f'{index:04d}'/'start.json');accepted=common.read(plan/'validated-plan.json')
    original=common.read(job/'request.json');receipt=common.read(job/'receipt.json');spec=common.read(job/'spec.json')
    plan_receipt=common.read(plan/'receipt.json');plan_spec=common.read(plan/'spec.json')
    need(accepted['receipt_hash']==digest(plan_receipt) and plan_receipt.get('outcome')=='completed' and plan_receipt.get('returncode')==0 and
         plan_spec.get('readonly') is True and plan_spec.get('role')=='proposer' and
         original.get('request_id')==job.name and receipt.get('request_id')==job.name and spec.get('request_id')==job.name and
         original.get('role')==receipt.get('role')==spec.get('role')=='researcher' and spec.get('readonly') is False and
         type(receipt.get('returncode')) is int and receipt['returncode']!=0 and receipt.get('payload') is None and
         original.get('commitment')==accepted['commitment'] and original.get('prospective_binding')==digest(accepted['commitment']) and
         accepted['commitment'].get('state_binding')==digest(start['research']))
    for directory,record,specification in ((plan,plan_receipt,plan_spec),(job,receipt,spec)):
        need(state.get('counted_jobs',[]).count(directory.name)==1 and state.get('receipts',[]).count(str(directory))==1 and
             state.get('receipt_hashes',{}).get(str(directory))==digest(record) and
             state.get('reservations',{}).get('call-'+directory.name)==specification.get('seconds') and
             specification.get('workspace')==str(arm/'workspace') and specification.get('transport')==protocol.get('transport')=='live' and
             specification.get('model')==record.get('model')==protocol.get('model') and
             specification.get('reasoning_effort')==record.get('reasoning_effort')=='high')
    from types import SimpleNamespace
    from machinery.study import Arm
    Arm.closed_planner_receipt(SimpleNamespace(root=arm,p=protocol,s=state),plan.name,plan_receipt,arm/'workspace')
    result=analyze(accepted['research'],accepted['commitment'],protocol,index,original,receipt,state['research'],policy,knowledge.SCHEMAS,feedback,start['research'])
    history=arm/'workspace/history'/f'round-{index:04d}.json'
    result.update(diagnostic_passed=True,source_implementation_sha256=NATIVE_SHA,round=index,
        original_request_file_sha256=sha(job/'request.json'),original_receipt_file_sha256=sha(job/'receipt.json'),
        cached_plan_authenticated=True,original_receipt_registered_once=True,original_full_reservation_preserved=True,
        protocol_pending_is_null=state.get('protocol_state',{}).get('pending') is None,
        protocol_inflight_is_false=state.get('protocol_state',{}).get('inflight') is False,
        recorded_retained_sources_preserved=all(receipt.get('after',{}).get(path)==pin for path,pin in spec.get('retained_sources',{}).items()),
        original_request_canonical_bytes_equal=raw_canonical(job/'request.json',original),
        history_exists=history.exists(),history_equals_original_receipt=(common.read(history)==receipt and digest(common.read(history))==digest(receipt)) if history.exists() else False,
        snapshot_exists=(arm/'snapshots'/f'round-{index:04d}').exists(),
        snapshot_manifest_exists=(arm/'snapshots'/f'round-{index:04d}'/'manifest.json').exists(),
        snapshot_routing_seal_exists=(arm/'snapshots'/f'round-{index:04d}'/'routing-seal.json').exists(),
        snapshot_staging_exists=(arm/'snapshots'/f'round-{index:04d}.staging').exists(),
        actual_state_unchanged=sha(state_path)==state_sha256,all_input_files_unchanged=all(sha(path)==input_pins[key] for key,path in fixed_paths.items()),
        input_file_sha256=input_pins,effects_executed=False)
    result['cleanup_metadata']=cleanup_metadata(receipt,(ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists())
    need(result['actual_state_unchanged'] and result['all_input_files_unchanged']);return result

def raw_canonical(path,value):return Path(path).read_bytes().strip()==canonical(value).encode()

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--study',type=Path,required=True);p.add_argument('--arm',default='exploration');p.add_argument('--round',type=int,required=True);p.add_argument('--state-sha256',required=True)
    a=p.parse_args()
    try:result=diagnose(a.study,a.arm,a.round,a.state_sha256)
    except Exception as exc:
        print(json.dumps({'diagnostic_passed':False,'error_class':type(exc).__name__,'effects_executed':False},sort_keys=True));return 2
    print(json.dumps(result,sort_keys=True));return 0

if __name__=='__main__':raise SystemExit(main())
