"""One reviewed official resume of the existing exploration remainder.

Operations only: no new study, proof, mathematical advice, changed goal, source
edit, or automatic retry. The closed baseline is preserved and not rerun.
"""
import argparse
import fcntl
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[3]
OPS = Path(__file__).resolve().parent
PARENT = OPS.parent
STUDY = ROOT/'.scratch/concept-driver-20261020-study-0001'
PYTHON = '/opt/homebrew/bin/python3'
IMPLEMENTATION = '66e3aa3f8dddeaafde8456e46b3636fb23f3737128ce53020e847319db3368ff'
USER_GOAL = "we need to push for general log-concavity. otherwise this whole machine ain't worth shit."
SUPERVISOR_SECONDS = 120*3600
CLEANUP_SECONDS = 1900
LOG_CAP = 8*1024**2
sys.path.insert(0,str(ROOT))
from machinery.study_common import Invalid, canonical, digest, sha, read, write, load_state, implementation, authorize_live
from machinery.resources import current_process


def argv():
    return [PYTHON,'-m','machinery.study','run','--study',str(STUDY),'--arm','exploration','--resume']


def unlocked_controller():
    """Read-only lock probe; release before the official child takes its lock."""
    with (STUDY/'controller.lock').open('rb') as lockfile:
        try:
            fcntl.flock(lockfile,fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError as exc:
            raise Invalid('existing controller or watchdog still owns the study lock') from exc
        fcntl.flock(lockfile,fcntl.LOCK_UN)


def bindings():
    if digest(implementation()) != IMPLEMENTATION:
        raise Invalid('reviewed implementation changed; no resume')
    unlocked_controller()
    seal=read(STUDY/'seal.json'); protocol=read(STUDY/'protocol.json')
    contract=read(STUDY/'seed/contract.json')
    if digest(seal['implementation']) != IMPLEMENTATION or digest(protocol) != seal['protocol']:
        raise Invalid('existing study seal or protocol does not match unchanged implementation')
    if sha(STUDY/'seed/contract.json') != seal['seed']['contract.json']:
        raise Invalid('existing exact goal contract changed')
    if sha(ROOT/contract['root_file']) != contract['root_sha256']:
        raise Invalid('exact original root source changed')
    authorize_live(contract)  # Existing protected authority is checked, never edited.
    acceptance=read(PARENT/'ACCEPTANCE_TEST_RESULT.json')
    if acceptance.get('passed') is not True or acceptance.get('implementation_sha256') != IMPLEMENTATION:
        raise Invalid('passing tests for unchanged implementation required')
    baseline=load_state(STUDY/'arms/baseline/state.json')
    exploration=load_state(STUDY/'arms/exploration/state.json')
    if baseline['active'] is not None or baseline['round'] < protocol['rounds']:
        raise Invalid('baseline is not closed; this helper cannot resume a paired comparison')
    if exploration.get('resolution') is not None:
        raise Invalid('exact root already resolved; no further research authorized by this resume')
    return {'study':str(STUDY),'implementation_sha256':IMPLEMENTATION,
        'seal_sha256':sha(STUDY/'seal.json'),'protocol_sha256':sha(STUDY/'protocol.json'),
        'contract_sha256':sha(STUDY/'seed/contract.json'),
        'root_file':contract['root_file'],'root_sha256':contract['root_sha256'],
        'root_declaration':contract['root_declaration'],
        'dependency_identity_sha256':digest(seal['dependencies']),
        'acceptance_sha256':sha(PARENT/'ACCEPTANCE_TEST_RESULT.json'),
        'authorization_sha256':sha(ROOT/'.bootstrap/study-authorization.json'),
        'baseline_state_sha256':sha(STUDY/'arms/baseline/state.json'),
        'exploration_state_sha256':sha(STUDY/'arms/exploration/state.json'),
        'exploration_round':exploration['round'],'exploration_phase':exploration['phase'],
        'remaining_rounds':max(0,protocol['rounds']-exploration['round']),
        'baseline_status':baseline['status'],'baseline_round':baseline['round'],
        'goal':'unchanged exact universal contract root; finite families do not complete it'}


def plan_value():
    return {'schema':'math-gkm.exploration-resume-plan.v1','bindings':bindings(),
        'user_goal_verbatim':USER_GOAL,'user_goal_sha256':digest(USER_GOAL),
        'resume_source_sha256':sha(__file__),'tests_source_sha256':sha(OPS/'test_resume.py'),
        'argv':argv(),'supervisor_seconds':SUPERVISOR_SECONDS,'cleanup_seconds':CLEANUP_SECONDS,
        'log_cap_bytes':LOG_CAP,'new_study':False,'new_mathematical_guidance':False,
        'baseline':'closed and preserved; continuation is noncomparative',
        'completion':'only unchanged exact root completion and existing independent gates',
        'scope':'remaining frozen exploration allowance only; no promise that the conjecture will be solved',
        'automatic_retry':False,'models_launched_by_plan':0}


def prepare_plan():
    if (OPS/'LAUNCH_CONSUMED.json').exists():
        raise Invalid('resume already consumed; preserve evidence and do not retry')
    value=plan_value(); write(OPS/'PLAN.json',value)
    return {'status':'prepared_not_launched','plan_sha256':sha(OPS/'PLAN.json'),
            'remaining_rounds':value['bindings']['remaining_rounds']}


def reviewed(path):
    plan=read(OPS/'PLAN.json')
    if plan != plan_value():
        raise Invalid('reviewed state, goal, sources or implementation changed')
    tests=read(OPS/'TEST_RESULT.json'); review=read(path)
    expected={'plan_sha256':sha(OPS/'PLAN.json'),'resume_source_sha256':sha(__file__),
        'tests_source_sha256':sha(OPS/'test_resume.py'),
        'test_result_sha256':sha(OPS/'TEST_RESULT.json'),'implementation_sha256':IMPLEMENTATION}
    if (tests.get('passed') is not True or
            any(tests.get(k)!=expected[k] for k in ('resume_source_sha256','tests_source_sha256','implementation_sha256'))):
        raise Invalid('exact passing operations tests required')
    if review.get('accepted') is not True or not review.get('reviewer') or any(review.get(k)!=v for k,v in expected.items()):
        raise Invalid('independent exact source/state/test review required')
    return plan


def registry(**updates):
    value=read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else {}
    value.update(schema='math-gkm.exploration-resume-status.v1',updated=time.time(),**updates)
    write(OPS/'STATUS.json',value)
    return value


def stop():
    marker={'requested':time.time(),'source':'reviewed exploration resume operator'}
    write(OPS/'STOP.json',marker)
    # Only the current study's official stop marker; old operator files stay intact.
    write(STUDY/'STOP.json',marker)
    return {'status':'official_stop_requested','automatic_retry':False}


def live_birth(child, expected=None):
    if child.poll() is not None:
        return None
    info=current_process(child.pid)
    if info is None:
        if child.poll() is not None:
            return None
        raise Invalid('owned controller identity unavailable while still live')
    birth=info['identity']
    if expected is not None and birth != expected:
        raise Invalid('controller birth changed; no borrowed PID action permitted')
    return birth


def start_keep_awake():
    if not Path('/usr/bin/caffeinate').is_file():
        return None
    return subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],
        cwd=ROOT,stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,
        start_new_session=True)


def close_keep_awake(child):
    if child is None:
        return
    if child.poll() is None:
        child.terminate()
    try:
        child.wait(timeout=5)
    except subprocess.TimeoutExpired:
        child.kill(); child.wait(timeout=5)


def stop_owned_controller(child, birth):
    """Bounded official STOP grace, then signal only the same owned live birth.

    A remaining uncertain process is recorded for reconciliation, not silently
    replaced or accepted. This helper never edits a resource cleanup hold.
    """
    stop()
    deadline=time.monotonic()+CLEANUP_SECONDS
    while child.poll() is None and time.monotonic()<deadline-30:
        live_birth(child,birth); time.sleep(1)
    if child.poll() is None:
        live_birth(child,birth); child.terminate()
    while child.poll() is None and time.monotonic()<deadline:
        live_birth(child,birth); time.sleep(1)
    return child.poll() is not None


def status():
    value=read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else {'status':'not_launched'}
    # Status uses only own operational metadata, never researcher/evaluator text.
    pid=value.get('controller_pid'); expected=value.get('controller_birth')
    if pid and expected:
        info=current_process(pid)
        value['controller_birth_live']=bool(info and info['identity']==expected)
    return value


def launch(review_path):
    if (OPS/'LAUNCH_CONSUMED.json').exists() or (OPS/'STOP.json').exists():
        raise Invalid('resume already consumed or stopped; no automatic retry')
    plan=reviewed(review_path)
    from machinery import resources
    resources.headroom(resources.limits())
    with (OPS/'operator.lock').open('a') as lockfile:
        fcntl.flock(lockfile,fcntl.LOCK_EX|fcntl.LOCK_NB)
        if (OPS/'LAUNCH_CONSUMED.json').exists() or (OPS/'STOP.json').exists():
            raise Invalid('resume already consumed or stop arrived during preflight; no launch')
        write(OPS/'LAUNCH_CONSUMED.json',{'plan_sha256':sha(OPS/'PLAN.json'),
            'review_sha256':sha(review_path),'time':time.time(),'automatic_retry':False})
        child=None; awake=None; birth=None
        deadline=time.monotonic()+SUPERVISOR_SECONDS
        try:
            awake=start_keep_awake()
            registry(status='launching_official_resume',operator_pid=os.getpid(),
                caffeinate_pid=awake.pid if awake else None,baseline='closed; not rerun',
                goal_open=True,comparison='noncomparative exploration continuation')
            logfile=OPS/'controller.log'
            with logfile.open('xb') as out:
                if (OPS/'STOP.json').exists():
                    raise Invalid('stop arrived before official resume spawn')
                child=subprocess.Popen(argv(),cwd=ROOT,stdin=subprocess.DEVNULL,
                    stdout=out,stderr=out,start_new_session=True,
                    env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'})
                birth=live_birth(child)
                registry(status='research_running',controller_pid=child.pid,controller_birth=birth,
                    research_launched=True,argv=argv())
                while child.poll() is None:
                    live_birth(child,birth)
                    if time.monotonic()>=deadline-CLEANUP_SECONDS:
                        raise Invalid('finite operator wall limit; exact goal remains unresolved')
                    if logfile.stat().st_size>LOG_CAP:
                        raise Invalid('operator controller-log limit')
                    if (OPS/'STOP.json').exists():
                        write(STUDY/'STOP.json',read(OPS/'STOP.json'))
                    time.sleep(2)
            if sha(STUDY/'arms/baseline/state.json') != plan['bindings']['baseline_state_sha256']:
                raise Invalid('closed baseline changed unexpectedly')
            exploration=load_state(STUDY/'arms/exploration/state.json')
            registry(status='closed; inspect accepted evidence',operator_pid=None,
                controller_pid=None,controller_birth=None,research_launched=False,
                controller_returncode=child.returncode,
                exploration={k:exploration.get(k) for k in ('status','round','phase','resolution')},
                goal_open=exploration.get('resolution') is None)
        except BaseException as exc:
            cleaned=True
            if child is not None and child.poll() is None:
                try:
                    cleaned=stop_owned_controller(child,birth)
                except BaseException:
                    cleaned=False
            registry(status='needs_reconciliation',operator_pid=None,
                controller_pid=child.pid if child is not None and child.poll() is None else None,
                controller_birth=birth,research_launched=not cleaned,
                reason=type(exc).__name__+': '+str(exc),automatic_retry=False,goal_open=True)
            raise
        finally:
            close_keep_awake(awake)
            registry(caffeinate_pid=None)
    return status()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    sub=parser.add_subparsers(dest='command',required=True)
    for name in ('plan','status','stop'):
        sub.add_parser(name)
    run=sub.add_parser('launch');run.add_argument('--review',type=Path,required=True)
    args=parser.parse_args()
    try:
        if args.command=='plan':result=prepare_plan()
        elif args.command=='status':result=status()
        elif args.command=='stop':result=stop()
        else:
            signal.signal(signal.SIGTERM,lambda *_:stop())
            signal.signal(signal.SIGINT,lambda *_:stop())
            result=launch(args.review.resolve())
        print(canonical(result))
    except (Invalid,OSError,KeyError,TypeError,ValueError) as exc:
        parser.exit(2,type(exc).__name__+': '+str(exc)+'\n')


if __name__=='__main__':main()
