"""One exact, failed-only round finalization; no role or mathematical execution.

The immutable failed invocation is already accounted. Canonical JSON sorting
changed portfolio iteration order on request reconstruction. This transaction
binds the original request and executes the official failed-round tail only.
"""
import argparse
import contextlib
import copy
import fcntl
from pathlib import Path
import sys
import time
ROOT=Path(__file__).resolve().parents[3]
OPS=Path(__file__).resolve().parent
STUDY=ROOT/'.scratch/concept-driver-20261020-study-0001'
IMPLEMENTATION='66e3aa3f8dddeaafde8456e46b3636fb23f3737128ce53020e847319db3368ff'
sys.path.insert(0,str(ROOT))
from machinery.study_common import Invalid,read,write,sha,digest,canonical,load_state,implementation,inventory


def restore_exact_request(staged,commitment,retained,p,r):
    """Pure witness: same immutable entries; restore only original iteration order."""
    from machinery import study_policy as policy
    from machinery.study_knowledge import SCHEMAS
    previous=retained.get('portfolio')
    if not isinstance(previous,list):raise Invalid('retained ordered portfolio missing')
    ids=[item.get('id') for item in previous]
    if len(ids)!=len(set(ids)) or {item['id']:item for item in previous}!=staged['portfolio']:
        raise Invalid('portfolio entries differ; not a serialization-order recovery')
    # The bounded request interpreter can reverse portfolio order. Its resulting
    # exact trace is independently reproduced below, not trusted from this hint.
    order=list(ids)
    if retained.get('program_execution',{}).get('executed',[]).count('reverse_portfolio')%2:order.reverse()
    restored=copy.deepcopy(staged)
    restored['portfolio']={key:staged['portfolio'][key] for key in order}
    req=policy.request(restored,r,p)
    req.update(committed_trial=commitment['trial'],prospective_binding=digest(commitment),commitment=commitment)
    req['checked_submission_schemas']=SCHEMAS
    from machinery.study_common import REASONING_EFFORT
    req.update(model=p['model'],reasoning_effort=REASONING_EFFORT,request_id=f'round-{r:04d}')
    if req!=retained:raise Invalid('original executed request cannot be reproduced exactly')
    return req


def failed_transition(staged,request,receipt,r,p):
    from machinery.study_research_feedback import record_feedback_consumption
    if receipt.get('role')!='researcher' or receipt.get('outcome')=='completed' or not receipt.get('finished'):
        raise Invalid('only a closed noncompleted researcher receipt can be finalized')
    updated=copy.deepcopy(staged)
    record_feedback_consumption(updated,f'round-{r:04d}',r,'researcher',
        [packet['reference'] for packet in request['research_feedback']['history']])
    updated['execution_budget']=request.get('execution_budget',{})
    updated['observations'].append({'round':r,'outcome':receipt['outcome'],
        'meaning':'failure within budget; no unprovability conclusion'})
    next_round=r+1
    phase='review' if next_round%p['episode_rounds']==0 or next_round==p['rounds'] else 'research'
    if next_round%request.get('reassess_after_rounds',p['episode_rounds'])==0:phase='review'
    concept=(updated.get('concepts') or {}).get('active')
    if concept and next_round==concept['end_round']+1:phase='review'
    return updated,next_round,phase


def owned_absent(receipt):
    from machinery.resources import current_process
    identities=receipt.get('resources',{}).get('owned_identities')
    if not isinstance(identities,dict) or not identities:raise Invalid('closed worker birth inventory missing')
    for pid in identities:
        if current_process(int(pid)) is not None:raise Invalid('recorded worker PID still exists; identity reconciliation required')


def bindings():
    if digest(implementation())!=IMPLEMENTATION:raise Invalid('frozen implementation changed')
    arm=STUDY/'arms/exploration';job=arm/'jobs/round-0001';planjob=arm/'jobs/plan-0001'
    state=load_state(arm/'state.json');start=read(arm/'rounds/0001/start.json')
    p=read(STUDY/'protocol.json');validated=read(planjob/'validated-plan.json')
    req=read(job/'request.json');receipt=read(job/'receipt.json')
    if state['round']!=1 or state['phase']!='research' or state.get('active') is not None or state.get('active_intent') is not None or state.get('resolution'):
        raise Invalid('exact inactive unresolved failed round1 required')
    if digest(state['research'])!=digest(start['research']):raise Invalid('round start research state changed')
    if str(job) not in state['receipts'] or state['receipt_hashes'].get(str(job))!=digest(receipt) or state['counted_jobs'].count('round-0001')!=1:
        raise Invalid('closed failed receipt is not already accounted exactly once')
    if state.get('failures')!=1 or receipt.get('outcome')!='ResourceFailure: monitor_unavailable: /bin/ps: observer timeout':
        raise Invalid('exact observed failure/accounting required')
    if validated['receipt_hash']!=digest(read(planjob/'receipt.json')):raise Invalid('original validated proposer receipt changed')
    exact=restore_exact_request(validated['research'],validated['commitment'],req,p,1)
    updated,next_round,phase=failed_transition(validated['research'],exact,receipt,1,p)
    for path in (arm/'snapshots/round-0001',arm/'workspace/history/round-0001.json',arm/'observer-outbox/round-0001.json'):
        if path.exists():raise Invalid('failed tail already has effects; explicit reconciliation required')
    seal=read(STUDY/'seal.json')
    if digest(seal['implementation'])!=IMPLEMENTATION or state['seal_hash']!=digest(seal):raise Invalid('exact seal binding changed')
    for ev in (arm/'semantics/host').glob('*.json'):
        record=read(ev)
        if record.get('evidence',{}).get('receipt')==digest(receipt):raise Invalid('failed tail host transition already exists')
    paths=[arm/'state.json',arm/'rounds/0001/start.json',job/'request.json',job/'receipt.json',job/'spec.json',planjob/'validated-plan.json',planjob/'receipt.json',STUDY/'seal.json',STUDY/'protocol.json',STUDY/'seed/contract.json']
    return dict(schema='math-gkm.exact-failed-tail-bindings.v1',implementation_sha256=IMPLEMENTATION,
        inputs={str(x.relative_to(ROOT)):sha(x) for x in paths},workspace_inventory=inventory(arm/'workspace'),
        before_research_sha256=digest(state['research']),validated_research_sha256=digest(validated['research']),
        expected_after_research_sha256=digest(updated),expected_round=next_round,expected_phase=phase,
        original_request_input_hash=req['program_execution']['input_hash'],
        role_calls=0,proof_checks=0,admissions=0,preserves_failure=True)


def plan_value():
    return dict(schema='math-gkm.failed-round-finalization-plan.v1',bindings=bindings(),
        source_sha256=sha(__file__),tests_source_sha256=sha(OPS/'test_finalize.py'),
        operation='official study.py failed-only post-call tail at lines606-647, with exact retained request',
        automatic_retry=False,no_request_overwrite=True,no_source_change=True)


def reviewed(path):
    plan=read(OPS/'PLAN.json')
    if plan!=plan_value():raise Invalid('reviewed exact failed checkpoint changed')
    tests=read(OPS/'TEST_RESULT.json');review=read(path)
    expected=dict(plan_sha256=sha(OPS/'PLAN.json'),source_sha256=sha(__file__),tests_source_sha256=sha(OPS/'test_finalize.py'),
        test_result_sha256=sha(OPS/'TEST_RESULT.json'),implementation_sha256=IMPLEMENTATION)
    if tests.get('passed') is not True or any(tests.get(k)!=expected[k] for k in ('source_sha256','tests_source_sha256','implementation_sha256')):
        raise Invalid('exact passing operations tests required')
    if review.get('accepted') is not True or not review.get('reviewer') or any(review.get(k)!=v for k,v in expected.items()):
        raise Invalid('independent exact operational review required')
    return plan


def finalize(review_path):
    if (OPS/'APPLY_INTENT.json').exists():raise Invalid('transaction already consumed; never replay interrupted effects')
    reviewed(review_path)
    from machinery import study,study_bridge,study_observer,resources
    from machinery.study_common import snapshot,verify_snapshot
    with contextlib.ExitStack() as stack:
        for path in (OPS/'operator.lock',STUDY/'controller.lock',ROOT/'.scratch/resources/heavy.lock',OPS.parent/'resume-general/operator.lock'):
            stream=stack.enter_context(path.open('a'))
            try:fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
            except BlockingIOError as exc:raise Invalid('controller/heavy/operator ownership is not closed') from exc
        if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():raise Invalid('unresolved cleanup hold remains')
        if (OPS/'APPLY_INTENT.json').exists():raise Invalid('transaction already consumed under lock')
        plan=reviewed(review_path);study.verify(STUDY)
        arm=study.Arm(STUDY,'exploration',-1);r=arm.s['round']
        receipt=read(arm.root/'jobs/round-0001/receipt.json');owned_absent(receipt)
        resources.headroom(resources.limits())
        staged=read(arm.root/'jobs/plan-0001/validated-plan.json');start=read(arm.root/'rounds/0001/start.json')
        req=read(arm.root/'jobs/round-0001/request.json')
        updated,next_round,phase=failed_transition(staged['research'],req,receipt,r,arm.p)
        write(OPS/'BEFORE_STATE.json',read(arm.root/'state.json'))
        write(OPS/'APPLY_INTENT.json',dict(plan_sha256=sha(OPS/'PLAN.json'),review_sha256=sha(review_path),
            expected_after_research_sha256=digest(updated),time=time.time(),automatic_retry=False))
        study_bridge.observation(arm,'research-report-and-checked-knowledge',start['research'],updated,
            {'receipt':digest(receipt),'commitment':digest(staged['commitment'])})
        arm.s['research']=updated
        write(arm.workspace/f'history/round-{r:04d}.json',receipt)
        target=arm.root/'snapshots'/f'round-{r:04d}'
        snapshot(arm.workspace,target,updated['policy'],arm.admitted(updated));verify_snapshot(target)
        arm.archive_sources()
        arm.s['round']=next_round;arm.s['phase']=phase
        study_observer.checkpoint(STUDY,'exploration',f'round-{r:04d}',arm.s,target)
        arm.save()
        final=load_state(arm.root/'state.json')
        if digest(final['research'])!=plan['bindings']['expected_after_research_sha256'] or final['failures']!=1:
            raise Invalid('finalized transition differs from reviewed failed-only result')
        original_inputs=plan['bindings']['inputs']
        for name,expected in original_inputs.items():
            if name.endswith('/state.json'):continue
            if sha(ROOT/name)!=expected:raise Invalid('immutable original invocation artifact changed')
        write(OPS/'FINISHED.json',dict(schema='math-gkm.exact-failed-tail-finished.v1',
            state_sha256=sha(arm.root/'state.json'),round=next_round,phase=phase,
            before_state_sha256=sha(OPS/'BEFORE_STATE.json'),plan_sha256=sha(OPS/'PLAN.json'),
            review_sha256=sha(review_path),source_sha256=sha(__file__),finished=time.time(),
            outcome=receipt['outcome'],admissions=0,role_calls=0,proof_checks=0,root_resolved=False))
        return read(OPS/'FINISHED.json')


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('command',choices=('plan','apply','status'))
    parser.add_argument('--review',type=Path);args=parser.parse_args()
    if args.command=='plan':value=plan_value();write(OPS/'PLAN.json',value)
    elif args.command=='status':value=read(OPS/'FINISHED.json') if (OPS/'FINISHED.json').exists() else {'finished':False}
    else:
        if args.review is None:parser.error('exact independent --review required')
        value=finalize(args.review)
    print(canonical(value))
if __name__=='__main__':main()
