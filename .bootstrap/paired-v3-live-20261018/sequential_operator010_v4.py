"""Operations only: wait for one clean freeze; run official arms once, in order.
No research policy, theorem, runtime implementation or budget is changed.
"""
import fcntl
import json
import os
import re
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT = Path('/Users/sasha/math_gkm')
OPS = Path(__file__).resolve().parent
STUDY = ROOT/'.scratch/paired-v3-live-20261018-study-0004'
sys.path.insert(0, str(ROOT))
from machinery.study_common import (PYTHON, read, write, digest, sha, implementation,
    clean_contract, authorize_live, load_state)
from machinery.study import DEFAULT, verify, validate_protocol, validate_commitment
from machinery.study_policy import initial
from machinery.resources import headroom, limits

EXPECTED_CONTRACT = '95f8e281bd881c80b48287f2f0f8bb8424ddac8fe4b7af7c0312aa9a5b68c7f4'
EXPECTED_PROTOCOL = 'c482aeb8175ad625bfc4cbd90cfa3bd029d753971b0dbe91aacf90d8988f9448'
EXPECTED_IMPLEMENTATION = 'c50e277d2879b55f0d16fbf6bd7499c258a7755dd05eb236bb6ceb913eb63d70'
EXPECTED_SUITE = '63b2ce6c7f223eac414137a90be674ccdeebaebb325a912e78fb1b29e161617d'
WAIT_SECONDS = 1800
TOTAL_SECONDS = 72*3600
CLEANUP_RESERVE = 1900
HEARTBEAT_SECONDS = 900
ACTIVE = None
INTERRUPTED = None


def signal_stop(number, frame):
    global INTERRUPTED
    INTERRUPTED = 'operator signal '+str(number)


def event(kind, **fields):
    record = dict(event=kind, utc=time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime()),
                  unix=time.time(), **fields)
    with (OPS/'sequential010v4-events.jsonl').open('a') as stream:
        stream.write(json.dumps(record,sort_keys=True)+'\n')
        stream.flush(); os.fsync(stream.fileno())


def controls():
    if INTERRUPTED:
        raise RuntimeError(INTERRUPTED)
    for path in (OPS/'STOP.json', STUDY/'STOP.json',
                 ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json',
                 OPS/'SEQUENTIAL010V4_UNRESOLVED.json'):
        if path.exists():
            raise RuntimeError('stop or cleanup hold: '+str(path))


def pristine(mode):
    state = load_state(STUDY/'arms'/mode/'state.json')
    assert state['research']==initial(mode), 'nonempty or modified clean research seed'
    assert state['status']=='ready' and state['round']==0 and state['phase']=='research'
    assert state['active'] is None and state['resolution'] is None
    assert all(state[k]==0 for k in ('calls','meta_calls','seconds','policy_trials','failures'))
    assert not state['receipts'] and not state['reviewed_rounds']
    return digest(state)


def identities():
    controls()
    contract=read(OPS/'contract.json'); plain=clean_contract()
    assert {k:v for k,v in contract.items() if k!='evaluation_setup'}==plain
    assert not contract.get('seed_sources') and not contract['inherited']
    assert digest(contract)==EXPECTED_CONTRACT
    assert read(STUDY/'seed/contract.json')==contract
    assert digest(implementation())==EXPECTED_IMPLEMENTATION
    authorize_live(contract)
    protocol={**DEFAULT,**read(OPS/'config.json')};validate_protocol(protocol)
    assert digest(protocol)==EXPECTED_PROTOCOL
    assert read(STUDY/'protocol.json')==protocol
    suite=read(STUDY/'evaluation/suite.json')
    assert digest(suite)==EXPECTED_SUITE and len(suite['tasks'])==2
    count_gate=read(OPS/'COUNT_GATE_010.json')
    assert count_gate['accepted'] is True
    assert count_gate['implementation_sha256']==EXPECTED_IMPLEMENTATION
    assert count_gate['contract_sha256']==EXPECTED_CONTRACT
    assert count_gate['suite_sha256']==EXPECTED_SUITE and count_gate['tasks']==2
    assert count_gate['max_tasks']==2 and count_gate['planned_seconds']==76800
    publication=read(OPS/'SOURCE_PUBLICATION010.json')
    assert publication.get('public') is True and publication.get('verified') is True
    assert publication.get('implementation_sha256')==EXPECTED_IMPLEMENTATION
    assert re.fullmatch(r'[0-9a-fA-F]{40}',publication.get('public_commit',''))
    assert read(OPS/'ARM_ORDER.json')['arm_order']==['exploration','baseline']
    validate_commitment(protocol,2)
    assert 76800<=protocol['arm_seconds'] and 36<=protocol['max_calls'] and 20<=protocol['meta_calls']
    # Official verification includes seed copies, all frozen dependency contents,
    # implementation, full preflight receipt, and accepted-record integrity.
    verify(STUDY)
    headroom(limits())
    controls()
    return dict(contract=EXPECTED_CONTRACT,protocol=EXPECTED_PROTOCOL,
                implementation=EXPECTED_IMPLEMENTATION,suite=EXPECTED_SUITE,
                seal_sha256=sha(STUDY/'seal.json'),setup_sha256=sha(STUDY/'setup-cost.json'))


def idle_controller():
    # Do not hold this lock while the official child needs to acquire it.
    with (STUDY/'controller.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        fcntl.flock(lock,fcntl.LOCK_UN)


def stop_child(child,reason,deadline):
    event('stop_requested',reason=reason,pid=child.pid)
    # Official STOP channel, never direct state modification or forced recovery.
    with (OPS/'sequential010v4-stop.log').open('ab') as stream:
        try:
            result=subprocess.run([PYTHON,'-m','machinery.study','stop','--study',str(STUDY)],
                cwd=ROOT,stdout=stream,stderr=stream,stdin=subprocess.DEVNULL,timeout=15)
            event('official_stop_returned',returncode=result.returncode)
        except Exception as exc:
            event('official_stop_failed',error=repr(exc))
    if child.poll() is None:
        child.terminate()  # direct unreaped child; official controller handles SIGTERM
    end=min(deadline,time.monotonic()+CLEANUP_RESERVE)
    while child.poll() is None and time.monotonic()<end:
        time.sleep(1)
    if child.poll() is None:
        write(OPS/'SEQUENTIAL010V4_UNRESOLVED.json',dict(pid=child.pid,reason=reason,
              status='owned controller did not stop; supervisor reconciliation required'))
        return False
    event('stopped_child_exited',returncode=child.returncode)
    return True


def run_arm(mode,deadline):
    global ACTIVE
    controls(); idle_controller()
    bindings=identities()
    clean_hash=pristine(mode)
    log=OPS/('sequential010v4-'+mode+'.log')
    # No detach/resume/retry. This one official foreground child owns its normal
    # study controller lock, worker monitors, fresh preflight and frozen budgets.
    argv=[PYTHON,'-m','machinery.study','run','--study',str(STUDY),'--arm',mode]
    with log.open('xb') as stream:
        ACTIVE=subprocess.Popen(argv,cwd=ROOT,stdout=stream,stderr=stream,
            stdin=subprocess.DEVNULL,start_new_session=True)
        write(OPS/('sequential010v4-'+mode+'-launch.json'),dict(pid=ACTIVE.pid,argv=argv,
              started=time.time(),bindings=bindings,pristine_state_sha256=clean_hash))
        event('arm_started',mode=mode,pid=ACTIVE.pid)
        heartbeat=0
        try:
            while ACTIVE.poll() is None:
                controls()
                if time.monotonic()>=deadline-CLEANUP_RESERVE:
                    raise RuntimeError('finite overall deadline; reserved graceful-stop window')
                if log.stat().st_size>8*1024**2:
                    raise RuntimeError('operator controller-log bound')
                now=time.monotonic()
                if now>=heartbeat:
                    state=load_state(STUDY/'arms'/mode/'state.json')
                    event('heartbeat',mode=mode,pid=ACTIVE.pid,
                          status=state['status'],round=state['round'],phase=state['phase'],
                          calls=state['calls'],seconds=state['seconds'])
                    heartbeat=now+HEARTBEAT_SECONDS
                time.sleep(2)
        except BaseException as exc:
            stop_child(ACTIVE,str(exc),deadline)
            raise
        rc=ACTIVE.returncode;ACTIVE=None
    state=load_state(STUDY/'arms'/mode/'state.json')
    event('arm_finished',mode=mode,returncode=rc,status=state['status'],round=state['round'])
    assert rc==0, 'official controller nonzero; no automatic retry'
    assert state['status'] in ('finite_budget_finished; root_open','mathematically_resolved'), \
        'official arm stopped/blocked; next arm not launched'
    assert state['active'] is None
    controls();idle_controller()
    write(OPS/('sequential010v4-'+mode+'-result.json'),dict(returncode=rc,state_sha256=digest(state),
          status=state['status'],round=state['round'],finished=time.time()))


def main():
    started=time.monotonic();deadline=started+TOTAL_SECONDS
    # Sole ops launcher. A second invocation must not proceed, even after normal
    # completion: the exclusive BEGIN marker prevents replay/reuse.
    with (OPS/'sequential010v4-operator.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        with (OPS/'SEQUENTIAL010V4_BEGIN.json').open('x') as stream:
            json.dump(dict(pid=os.getpid(),started=time.time(),script_sha256=sha(__file__),
                           total_seconds=TOTAL_SECONDS,wait_seconds=WAIT_SECONDS),stream)
            stream.flush();os.fsync(stream.fileno())
        for number in (signal.SIGTERM,signal.SIGINT):signal.signal(number,signal_stop)
        event('operator_started',pid=os.getpid())
        ready=[OPS/'SOURCE_PUBLICATION010.json',STUDY/'setup-cost.json',STUDY/'seal.json',
               STUDY/'arms/exploration/state.json',STUDY/'arms/baseline/state.json']
        wait_end=min(started+WAIT_SECONDS,deadline-CLEANUP_RESERVE)
        try:
            wait_heartbeat=0
            while not all(path.is_file() for path in ready):
                controls()
                # A finished failed preflight is terminal for this fresh path.
                # Preserve it and return; never wait pointlessly, retry or rebind.
                report=STUDY/'deployment-preflight/result.json'
                receipt=STUDY/'deployment-preflight/receipt.json'
                if report.is_file():
                    failed=read(report)
                    if failed.get('finished') and failed.get('ready') is False:
                        raise RuntimeError('freeze preflight finished ready=false: '+str(failed.get('failure','unknown')))
                if receipt.is_file() and read(receipt).get('ready') is False:
                    raise RuntimeError('freeze preflight receipt ready=false; preserve failed study')
                now=time.monotonic()
                if now>=wait_end:raise RuntimeError('freeze final-marker wait expired')
                if now>=wait_heartbeat:
                    event('freeze_wait_heartbeat',remaining_seconds=max(0,int(wait_end-now)))
                    wait_heartbeat=now+HEARTBEAT_SECONDS
                time.sleep(2)
            event('freeze_final_marker_observed')
            identities();pristine('exploration');pristine('baseline');idle_controller()
            for mode in ('exploration','baseline'):run_arm(mode,deadline)
            result=dict(status='both official arms finished sequentially',finished=time.time())
        except BaseException as exc:
            result=dict(status='stopped; no retry or next arm',error=repr(exc),finished=time.time())
            write(OPS/'SEQUENTIAL010V4_RESULT.json',result);event('operator_finished',**result)
            raise
        write(OPS/'SEQUENTIAL010V4_RESULT.json',result);event('operator_finished',**result)

if __name__=='__main__':main()
