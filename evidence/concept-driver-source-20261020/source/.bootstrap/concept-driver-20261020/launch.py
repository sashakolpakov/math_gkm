"""Reviewed, finite, same-clean-seed paired concept-loop rerun operations.

No command launches research except explicit `launch --review ...`. No implicit
retry or continuation. The researcher chooses all mathematics independently.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
OPS = Path(__file__).resolve().parent
PYTHON = '/opt/homebrew/bin/python3'
STUDY = ROOT/'.scratch/concept-driver-20261020-study-0001'
CURATION = OPS/'independent-pretrial-curation'
LOG_CAP = 8*1024**2
SUPERVISOR_SECONDS = 120*3600
CLEANUP_SECONDS = 1900
MAX_SUITE_TASKS = 3
MODEL = 'gpt-6.1-sol'
sys.path.insert(0, str(ROOT))
from machinery.study_common import (Invalid, canonical, digest, read, write, sha,
    implementation, clean_contract, authorize_live, load_state)


def protocol():
    from machinery.study import DEFAULT, validate_protocol
    p = dict(DEFAULT, transport='live', model=MODEL, rounds=4,
        episode_rounds=2, invention_rounds=1, call_seconds=1800,
        adaptation_seconds=1800, validation_seconds=900,
        arm_seconds=180000, max_calls=64, meta_calls=32,
        knowledge_checks_per_round=3, proposal_repairs=1,
        policy_trials=1, policy_trial_rounds=2,
        output_bytes=2*1024**2)
    p['concept_driver'] = dict(p.get('concept_driver') or {}, enabled=True,
        min_horizon_rounds=2, max_horizon_rounds=2, max_ordinary_rounds=1,
        case_reassessment_after=2)
    validate_protocol(p)
    return p


def capacity(p, tasks):
    """Conservative full-study opportunity reservation, not measured elapsed."""
    if type(tasks) is not int or not 0 <= tasks <= MAX_SUITE_TASKS:
        raise Invalid('independent suite exceeds reviewed task-count bound')
    rounds = p['rounds']
    ordinary_reviews = (rounds+p['episode_rounds']-1)//p['episode_rounds']
    # A protected concept horizon can end between ordinary episode boundaries.
    # At most one forced/ordinary review and comparison occurs per round.
    episodes = rounds if (p.get('concept_driver') or {}).get('enabled') else ordinary_reviews
    research = rounds*((2+p['proposal_repairs'])*p['call_seconds'] +
                       (p['knowledge_checks_per_round']+1)*p['validation_seconds'])
    comparison = (2*p['adaptation_seconds'] +
                  2*(tasks+1)*p['validation_seconds']) if tasks else 0
    review = episodes*2*p['call_seconds']
    main = research+(episodes+1)*comparison+review
    trial_research = 2*p['policy_trial_rounds']*((2+p['proposal_repairs'])*p['call_seconds']+
                                             p['knowledge_checks_per_round']*p['validation_seconds'])
    trials = p['policy_trials']*(trial_research+comparison+2*p['call_seconds'])
    calls = rounds*(2+p['proposal_repairs']) + 2*episodes + (2*(episodes+1) if tasks else 0)
    meta = rounds*(1+p['proposal_repairs'])+2*episodes
    trial_calls = p['policy_trials']*(2*p['policy_trial_rounds']*(2+p['proposal_repairs'])+2+(2 if tasks else 0))
    trial_meta = p['policy_trials']*(2*p['policy_trial_rounds']*(1+p['proposal_repairs'])+2)
    result = dict(suite_tasks=tasks, maximum_reviews=episodes, maximum_comparisons=episodes+1,
        main_seconds=main, strategy_trial_seconds=trials,
        total_reserved_seconds=main+trials, maximum_calls=calls+trial_calls,
        maximum_meta_calls=meta+trial_meta,
        accounting='worst-case reservations; model/provider elapsed and research outcomes reported separately')
    if (result['total_reserved_seconds'] > p['arm_seconds'] or
        result['maximum_calls'] > p['max_calls'] or result['maximum_meta_calls'] > p['meta_calls']):
        raise Invalid('reviewed full-study opportunity allowance is insufficient')
    return result


def plan_value():
    p = protocol()
    contract = clean_contract()
    return dict(schema='math-gkm.concept-driver-launch-plan.v1',
        study=str(STUDY), curation=str(CURATION), model=MODEL,
        reasoning_effort='high', protocol=p,
        contract_sha256=digest(contract), implementation_sha256=digest(implementation()),
        launcher_sha256=sha(__file__), tests_sha256=sha(OPS/'test_launch.py'),
        maximum_suite_tasks=MAX_SUITE_TASKS, capacity=capacity(p, MAX_SUITE_TASKS),
        seed='same exact clean seed; no historical theory or research state',
        arms={'baseline':'ordinary proof work and safe review feedback',
              'exploration':'same guards and feedback plus prospective concept episodes'},
        role_order=['baseline','exploration'],
        order_limit='sequential shared heavy lease; provider/time drift uncontrolled',
        curator_seconds=1800, curator_task_limits={'holdout':2,'regression':1}, deployment_seconds=1800,
        supervisor_seconds=SUPERVISOR_SECONDS,
        wall_containment_accounting={'both_arm_caps':2*p['arm_seconds'],
            'protocol_caps':2*(4*p['max_calls']+2)*30,
            'curation_and_deployment_caps':3600,'cleanup_allowance':CLEANUP_SECONDS,
            'interpretation':'finite containment covers both arms symmetrically; reservations are not expected elapsed time'},
        resource_policy='unchanged immutable resource limits, premise checks, output limits and heavy lease',
        comparisons='same independently selected withheld obligations and equal resources before/after; invalid evidence is missing evidence',
        launch_authority='explicit reviewed source/tests and exact protected live authorization',
        old_studies='preserved unchanged', hosted_model_calls=0, lean_checks=0)


def prepare_plan():
    if STUDY.exists() or CURATION.exists():
        raise Invalid('fresh run path already exists; inspect retained evidence, never overwrite or retry')
    value = plan_value()
    write(OPS/'PLAN.json', value)
    return dict(status='prepared_not_launched', plan=str(OPS/'PLAN.json'),
                plan_sha256=sha(OPS/'PLAN.json'), capacity=value['capacity'])


def reviewed(review_path):
    plan = read(OPS/'PLAN.json')
    if plan != plan_value():
        raise Invalid('reviewed launch plan or implementation changed')
    review = read(review_path)
    tests = read(OPS/'TEST_RESULT.json')
    expected = dict(plan_sha256=sha(OPS/'PLAN.json'),
        launcher_sha256=sha(__file__), tests_sha256=sha(OPS/'test_launch.py'),
        test_result_sha256=sha(OPS/'TEST_RESULT.json'),
        implementation_sha256=digest(implementation()))
    if (review.get('accepted') is not True or not review.get('reviewer') or
        any(review.get(k)!=v for k,v in expected.items())):
        raise Invalid('exact independent source/test review missing or changed')
    if (tests.get('passed') is not True or
        tests.get('launcher_sha256')!=expected['launcher_sha256'] or
        tests.get('tests_sha256')!=expected['tests_sha256'] or
        tests.get('implementation_sha256')!=expected['implementation_sha256']):
        raise Invalid('exact passing operational test evidence missing or changed')
    authorize_live(clean_contract())
    return plan


def start_keep_awake():
    """One own, unreaped process tied to this supervisor; no unrelated PID use."""
    binary = Path('/usr/bin/caffeinate')
    if not binary.is_file():
        return None
    return subprocess.Popen([str(binary),'-dimsu','-w',str(os.getpid())],
        cwd=ROOT, stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL, start_new_session=True)


def close_keep_awake(child):
    if child is None:
        return
    if child.poll() is None:
        child.terminate()
    try:
        child.wait(timeout=5)
    except subprocess.TimeoutExpired:
        # This Popen object still owns an unreaped child; never a borrowed PID.
        child.kill()
        child.wait(timeout=5)


def registry(**updates):
    value = read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else {}
    value.update(schema='math-gkm.concept-driver-operator.v1', updated=time.time(), **updates)
    write(OPS/'STATUS.json', value)
    return value


def stop():
    marker = dict(user_requested=True, requested=time.time(), source='concept-driver operator')
    write(OPS/'STOP.json', marker)
    if CURATION.exists(): write(CURATION/'STOP.json', marker)
    if STUDY.exists(): write(STUDY/'STOP.json', marker)
    return dict(status='stop_requested', automatic_restart=False)


def closed_state():
    result = {}
    for mode in ('baseline','exploration'):
        path = STUDY/'arms'/mode/'state.json'
        if path.exists():
            s = load_state(path)
            result[mode] = {k:s.get(k) for k in ('status','round','phase','calls','meta_calls','resolution')}
            result[mode]['accepted_knowledge'] = len(s['research']['knowledge'])
    return result


def launch(review_path):
    plan = reviewed(review_path)
    if STUDY.exists() or CURATION.exists() or (OPS/'STOP.json').exists():
        raise Invalid('fresh launch already consumed or stopped; no replay')
    from machinery import resources, study
    from machinery.study_curate import curate
    from machinery.study_deployment import reuse_deployment
    resources.headroom(resources.limits())
    started = time.monotonic()
    deadline = started+SUPERVISOR_SECONDS
    with (OPS/'operator.lock').open('a') as lockfile:
        fcntl.flock(lockfile, fcntl.LOCK_EX|fcntl.LOCK_NB)
        child = None
        awake = None
        try:
            awake = start_keep_awake()
            registry(status='independent_pretrial_curation',
                keep_awake_pid=awake.pid if awake is not None else None,
                keep_awake_scope='own caffeinate -w supervisor; prior processes untouched', operator_pid=os.getpid(),
                child_pid=None, research_launched=False, goal_open=True, study=str(STUDY),
                plan_sha256=sha(OPS/'PLAN.json'), review_sha256=sha(review_path))
            curated = curate(CURATION, 'live', plan['curator_seconds'], clean_contract(), model=MODEL,
                             task_limits=plan['curator_task_limits'])
            if (OPS/'STOP.json').exists(): raise Invalid('user stop before freeze')
            suite = read(curated['suite'])
            counts = {kind:sum(t['kind']==kind for t in suite['tasks']) for kind in ('holdout','regression')}
            if counts['holdout'] > 2 or counts['regression'] > 1:
                raise Invalid('curator exceeded reviewed two-holdout/one-regression bound; retain full output, never truncate')
            actual_capacity = capacity(plan['protocol'], len(suite['tasks']))
            registry(status='fresh_study_freeze', suite_tasks=len(suite['tasks']),
                suite_sha256=digest(suite), actual_capacity=actual_capacity)
            study.freeze(STUDY, plan['protocol'], suite, clean_contract(), read(curated['provenance']))
            # Both arms reuse this same exact successful frozen deployment.
            admission = reuse_deployment(read(STUDY/'seal.json')['deployment_preflight'])
            write(OPS/'PRE_LAUNCH_ADMISSION.json', admission)
            if (OPS/'STOP.json').exists(): raise Invalid('user stop before controller launch')
            argv = [PYTHON,'-m','machinery.study','run','--study',str(STUDY),'--arm','both']
            logfile = OPS/'controller.log'
            with logfile.open('xb') as out:
                child = subprocess.Popen(argv, cwd=ROOT, stdin=subprocess.DEVNULL,
                    stdout=out, stderr=out, start_new_session=True,
                    env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'})
                registry(status='research_running', child_pid=child.pid, research_launched=True,
                    started=time.time(), goal_open=True)
                while child.poll() is None:
                    if time.monotonic() >= deadline-CLEANUP_SECONDS:
                        raise Invalid('finite supervisor wall bound; preserve unfinished goal')
                    if logfile.stat().st_size > LOG_CAP:
                        raise Invalid('controller log bound; preserve evidence')
                    if (OPS/'STOP.json').exists():
                        write(STUDY/'STOP.json', dict(user_requested=True, time=time.time()))
                    time.sleep(2)
            states = closed_state()
            registry(status='closed; inspect accepted mathematical evidence', operator_pid=None,
                child_pid=None, research_launched=False, child_returncode=child.returncode,
                arms=states, goal_open=not any(s.get('resolution') for s in states.values()),
                scope='finite paired study, no performance winner inferred from proof counts')
        except BaseException as exc:
            if child is not None and child.poll() is None:
                write(STUDY/'STOP.json', dict(operator_bound=str(exc), time=time.time()))
                end = time.monotonic()+CLEANUP_SECONDS
                while child.poll() is None and time.monotonic()<end-30: time.sleep(1)
                if child.poll() is None: child.terminate()
                while child.poll() is None and time.monotonic()<end: time.sleep(1)
                if child.poll() is None:
                    resources.cleanup_hold('concept-driver child did not finish official stop', {'controller_pid':child.pid})
            registry(status='needs_reconciliation', operator_pid=None,
                child_pid=child.pid if child is not None and child.poll() is None else None,
                research_launched=child is not None and child.poll() is None,
                reason=str(exc), goal_open=True, automatic_retry=False)
            raise
        finally:
            close_keep_awake(awake)
            registry(keep_awake_pid=None, keep_awake_status='own handle closed or unavailable')
    return read(OPS/'STATUS.json')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    sub = p.add_subparsers(dest='command', required=True)
    sub.add_parser('plan'); sub.add_parser('status'); sub.add_parser('stop')
    run = sub.add_parser('launch'); run.add_argument('--review', type=Path, required=True)
    args = p.parse_args()
    try:
        if args.command == 'plan': result = prepare_plan()
        elif args.command == 'status': result = read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else {'status':'not_launched'}
        elif args.command == 'stop': result = stop()
        else:
            signal.signal(signal.SIGTERM, lambda *_: stop())
            signal.signal(signal.SIGINT, lambda *_: stop())
            result = launch(args.review.resolve())
        print(canonical(result))
    except (Invalid,OSError,ValueError,KeyError,TypeError) as exc:
        p.exit(2, type(exc).__name__+': '+str(exc)+'\n')


if __name__ == '__main__': main()
