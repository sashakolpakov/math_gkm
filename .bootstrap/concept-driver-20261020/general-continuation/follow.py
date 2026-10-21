"""Continue own-history research at clean finite boundaries; never supply mathematics."""
import argparse
import fcntl
import importlib.util
import math
import os
from pathlib import Path
import signal
import subprocess
import time
OPS=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('gkm_continuation',OPS/'continue_machine.py')
ops=importlib.util.module_from_spec(spec);spec.loader.exec_module(ops)
ROOT=ops.ROOT
CHECKPOINT=OPS/'FOLLOW.json'
STOPPED=False


def checkpoint(**updates):
    state=ops.read(CHECKPOINT) if CHECKPOINT.exists() else {}
    state.update(schema='math-gkm.ongoing-own-history.v1',updated=time.time(),**updates)
    ops.write(CHECKPOINT,state)
    return state


def controls():
    if STOPPED:raise RuntimeError('follow operator signal; goal remains open')
    ops.controls();ops.authorize_ongoing()


def live_identity(pid,expected):
    if not pid:return False
    info=ops.api()['resources'].current_process(int(pid))
    if info is not None and info['identity']!=expected:
        raise RuntimeError('recorded process PID has another birth; reconcile explicitly')
    return info is not None


def initial_binding(study,record):
    binding=record.get('ongoing_initial')
    if (not isinstance(binding,dict) or binding.get('study')!=str(study) or
        type(binding.get('controller_pid')) is not int or not binding.get('controller_birth')):
        raise RuntimeError('exact initial controller ownership binding required')
    return binding


def outcome(study):
    if not ops.verified_resolution(study):return None
    result=ops.api()['common'].load_state(study/'arms/exploration/state.json')['resolution']
    kind=result.get('kind')
    if kind not in ('proof','refutation') or kind!=result.get('binding',{}).get('claim',{}).get('kind'):
        raise RuntimeError('exact completion kind mismatch')
    return kind


def terminal(study):
    kind=outcome(study)
    if kind is None:return False
    checkpoint(phase='theorem_proved' if kind=='proof' else 'theorem_refuted',
        current_study=str(study),theorem_proved=kind=='proof',root_resolved=True,
        goal_achieved=kind=='proof',completion_kind=kind)
    return True


def wait_closed(study,owner=None):
    while not ops.lock_available(study/'controller.lock'):
        controls()
        if owner:live_identity(owner['controller_pid'],owner['controller_birth'])
        time.sleep(2)
    controls()
    if owner:
        while live_identity(owner['controller_pid'],owner['controller_birth']):
            controls();time.sleep(2)
        while live_identity(owner.get('caffeinate_pid'),owner.get('caffeinate_birth')):
            controls();time.sleep(2)
    state=ops.api()['common'].load_state(study/'arms/exploration/state.json')
    if state.get('active') is not None or state.get('active_intent') is not None:
        raise RuntimeError('uncertain parent invocation; no replay')
    if terminal(study):return False
    ready,reason=ops.parent_ready(study)
    if not ready:raise RuntimeError(reason)
    return True


def execute(study,deadline):
    argv=[ops.PYTHON,'-m','machinery.study','run','--study',str(study),'--arm','exploration']
    child=birth=None
    try:
        checkpoint(phase='launch_intent',current_study=str(study),argv=argv)
        with (OPS/'follow.log').open('ab') as log:
            controls()
            child=subprocess.Popen(argv,cwd=ROOT,stdin=subprocess.DEVNULL,stdout=log,stderr=log,
                start_new_session=True,env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'})
            birth=ops.own_birth(child)
            checkpoint(phase='research_running',controller_pid=child.pid,controller_birth=birth)
            while child.poll() is None:
                controls();ops.own_birth(child,birth)
                if time.monotonic()>=deadline-ops.CLEANUP_SECONDS:raise RuntimeError('finite epoch wall bound')
                if (OPS/'follow.log').stat().st_size>ops.LOG_LIMIT:raise RuntimeError('bounded follow log limit')
                time.sleep(2)
        if child.returncode!=0:raise RuntimeError('official controller failed; no automatic retry')
        controls()
    except BaseException:
        clean=True
        if child is not None and child.poll() is None:
            try:clean=ops.stop_child(child,study,deadline,birth)
            except BaseException:clean=False
        checkpoint(phase='needs_reconciliation',controller_pid=child.pid if child is not None and not clean else None,
            controller_birth=birth if not clean else None,goal_achieved=False,root_resolved=False)
        raise
    finally:
        if child is None or child.poll() is not None:checkpoint(controller_pid=None,controller_birth=None)


def remaining_wall(protocol,state):
    # seconds includes funded pools, so their unspent balances remain available.
    unfunded=protocol['arm_seconds']-state['seconds']
    funded=sum(pool['cap']-pool['spent'] for pool in state['budget_pools'].values())
    calls=protocol['max_calls']-state['calls']
    if min(unfunded,funded,calls,protocol['meta_calls']-state['meta_calls'])<0:
        raise RuntimeError('remaining finite accounting is invalid')
    return unfunded+funded+(4*calls+2)*30+ops.SETUP_SECONDS+ops.CLEANUP_SECONDS


def resume_current(study,state):
    """Authorize one owned continuation of the exact stopped revision; no fresh epoch."""
    record=ops.authorize_ongoing();grant=record.get('ongoing_current_resume')
    revision=state.get('request_context_revision',{});path=OPS/'REQUEST_CONTEXT_REVISION.json'
    if (not isinstance(grant,dict) or grant!=state.get('current_resume') or grant.get('authorized') is not True or
        not grant.get('reviewer') or grant.get('study')!=str(study) or study!=ops.REQUEST_CONTEXT_STUDY or
        grant.get('current_sequence')!=6 or grant.get('next_sequence')!=7 or state.get('next_sequence')!=6 or
        revision.get('status')!='applied' or revision.get('record_sha256')!=ops.sha(path) or
        grant.get('revision_sha256')!=ops.sha(path) or
        record.get('operational_recovery')!={'path':str(path),'sha256':ops.sha(path)}):
        raise RuntimeError('exact reviewed current-study resume authority required')
    for name,key in [('seal.json','seal_sha256'),('protocol.json','protocol_sha256'),('arms/exploration/state.json','state_sha256')]:
        if ops.sha(study/name)!=grant.get(key):raise RuntimeError('current-study resume bytes changed')
    controls();ops.immutable_bindings(ongoing=True);ops.api()['study'].verify(study)
    if (study/'STOP.json').exists() or not ops.lock_available(study/'controller.lock'):
        raise RuntimeError('current study stopped or controller remains')
    if grant.get('native_cleanup_verified') is not True or not grant.get('native_owners'):
        raise RuntimeError('current-study native closure not attested')
    for pid,birth in grant['native_owners'].items():
        if live_identity(int(pid),birth):raise RuntimeError('current-study historical owner remains')
    current=ops.api()['common'].load_state(study/'arms/exploration/state.json')
    if (current.get('round')!=30 or current.get('phase')!='research' or current.get('resolution') is not None or
        current.get('active') is not None or current.get('active_intent') is not None or
        any(str(job) not in current['receipts'] for job in (study/'arms/exploration/jobs').iterdir() if job.is_dir())):
        raise RuntimeError('current-study invocation uncertain; no replay')
    allowed=remaining_wall(ops.read(study/'protocol.json'),current)
    start,end=grant.get('authorized_at'),grant.get('deadline_wall')
    if (any(type(v) not in (int,float) or not math.isfinite(v) for v in (start,end)) or
        start>time.time() or end>start+allowed or end-time.time()<=ops.CLEANUP_SECONDS):
        raise RuntimeError('current-study finite remaining wall is invalid or exhausted')
    return time.monotonic()+end-time.time()


def follow(initial):
    initial=Path(initial).resolve()
    if initial.parent!=(ROOT/'.scratch').resolve():raise RuntimeError('study must be inside scratch')
    with (OPS/'FOLLOW.lock').open('a') as lockfile,(OPS/'operator.lock').open('a') as shared:
        fcntl.flock(lockfile,fcntl.LOCK_EX|fcntl.LOCK_NB)
        fcntl.flock(shared,fcntl.LOCK_EX|fcntl.LOCK_NB);controls()
        state=ops.read(CHECKPOINT) if CHECKPOINT.exists() else None
        if state:
            if state.get('phase') not in ('waiting','ready_to_resume_current','theorem_proved','theorem_refuted'):
                raise RuntimeError('unfinished owned intent; reconcile explicitly, never replay')
            if state['helper_sha256']!=ops.sha(ops.__file__) or state['follow_sha256']!=ops.sha(__file__):
                raise RuntimeError('existing follow source binding changed')
            if state['phase'] in ('theorem_proved','theorem_refuted'):
                expected='proof' if state['phase']=='theorem_proved' else 'refutation'
                if outcome(Path(state['current_study']))!=expected:
                    raise RuntimeError('persisted terminal checkpoint lacks current exact evidence')
                return
            for role in ('operator','caffeinate'):
                if live_identity(state.get(role+'_pid'),state.get(role+'_birth')):
                    raise RuntimeError('previous follow owner still lives; no replacement')
            current=Path(state['current_study']);number=state['next_sequence']
            prior_owner=state['initial_owner']
            if initial_binding(Path(prior_owner['study']),ops.authorize_ongoing())!=prior_owner:
                raise RuntimeError('initial owner authority changed')
            owner=prior_owner if str(current)==prior_owner['study'] else None
        else:
            current=initial;number=1
            owner=initial_binding(initial,ops.authorize_ongoing())
        resuming=bool(state and state.get('phase')=='ready_to_resume_current')
        resume_deadline=resume_current(current,state) if resuming else None
        checkpoint(phase='ready_to_resume_current' if resuming else 'waiting',current_study=str(current),next_sequence=number,
            helper_sha256=ops.sha(ops.__file__),follow_sha256=ops.sha(__file__),
            goal_root=ops.EXPECTED_CONTRACT,goal_achieved=False,root_resolved=False,
            initial_owner=owner if state is None else state.get('initial_owner'),operator_pid=os.getpid(),
            operator_birth=ops.api()['resources'].current_process(os.getpid())['identity'])
        awake=None
        try:
            awake=ops.start_keep_awake()
            checkpoint(caffeinate_pid=awake.pid if awake else None,caffeinate_birth=ops.own_birth(awake) if awake else None)
            if resuming:
                ops.DEADLINE=resume_deadline;controls()
                execute(current,resume_deadline)
                if not wait_closed(current):return
                number=state['current_resume']['next_sequence'];owner=None;ops.DEADLINE=None
                checkpoint(phase='waiting',current_study=str(current),next_sequence=number,current_resume_finished_at=time.time())
            while wait_closed(current,owner):
                owner=None
                controls();ops.immutable_bindings(ongoing=True)
                p=ops.planned_protocol(ops.read(current/'protocol.json')['rounds'])
                ops.api()['resources'].headroom(ops.api()['resources'].limits())
                destination=ROOT/'.scratch'/f'concept-driver-20261020-follow-{number:06d}'
                checkpoint(phase='migration_intent',parent_study=str(current),destination=str(destination))
                binding={'follow_sha256':ops.sha(__file__),'checkpoint_sha256':ops.sha(CHECKPOINT)}
                deadline=time.monotonic()+ops.epoch_wall_reservation(p)
                ops.DEADLINE=deadline;controls()
                current=ops.migrate(current,number,destination=destination,caller_binding=binding,ongoing=True)
                checkpoint(phase='ready_to_launch',current_study=str(current))
                execute(current,deadline)
                if not wait_closed(current):return
                number+=1;ops.DEADLINE=None
                checkpoint(phase='waiting',current_study=str(current),next_sequence=number)
        except BaseException as exc:
            checkpoint(phase='needs_reconciliation',reason=type(exc).__name__+': '+str(exc),goal_achieved=False)
            raise
        finally:
            ops.close_keep_awake(awake);ops.DEADLINE=None
            checkpoint(operator_pid=None,operator_birth=None,caffeinate_pid=None,caffeinate_birth=None)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--study',type=Path,default=ROOT/'.scratch/concept-driver-20261020-general-0001')
    parser.add_argument('--status',action='store_true');parser.add_argument('--stop',action='store_true')
    args=parser.parse_args()
    if args.status:
        print(ops.canonical(ops.read(CHECKPOINT) if CHECKPOINT.exists() else {'phase':'not_started'}));return
    if args.stop:
        ops.write(OPS/'STOP.json',{'requested':time.time(),'source':'ongoing follow user stop'});return
    def signal_stop(number,frame):
        global STOPPED
        STOPPED=True
    for number in (signal.SIGINT,signal.SIGTERM):signal.signal(number,signal_stop)
    follow(args.study)


if __name__=='__main__':main()
