"""One fresh comparison: await curation, native freeze, native sequential arms."""
import json
import os
from pathlib import Path
import signal
import subprocess
import time
ROOT = Path('/Users/sasha/math_gkm')
BASE = ROOT/'.bootstrap/method-learning-gaussian-20261103'
STUDY = ROOT/'.scratch/studies/method-learning-gaussian-20261103'
PYTHON = '/opt/homebrew/bin/python3'
STOPPING = False

def record(phase, **extra):
    value = {'phase': phase, 'observed_at': time.time(), 'study': str(STUDY),
             'mathematical_completion_claimed': False, **extra}
    target = BASE/'STARTUP_STATUS.json'
    temporary = target.with_suffix('.next')
    with temporary.open('w') as stream:
        json.dump(value, stream, sort_keys=True); stream.write(chr(10))
        stream.flush(); os.fsync(stream.fileno())
    os.replace(temporary, target)

def stopped():
    return STOPPING or (BASE/'STOP').exists()

def request_stop():
    for directory in (BASE/'curation', STUDY):
        if directory.exists():
            target = directory/'STOP.json'
            if not target.exists():
                try:
                    with target.open('x') as stream:
                        json.dump({'requested': time.time(), 'source': 'owned comparison startup'}, stream)
                except FileExistsError:
                    pass

def command(phase, arguments):
    record(phase)
    child = None
    try:
        with (BASE/(phase+'.raw.log')).open('xb') as log:
            child = subprocess.Popen(arguments, cwd=ROOT, stdin=subprocess.DEVNULL,
                stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
            stop_at = None
            last = 0
            while child.poll() is None:
                if stopped() and stop_at is None:
                    request_stop(); child.send_signal(signal.SIGINT); stop_at=time.monotonic()
                if stop_at is not None and time.monotonic()-stop_at > 2100:
                    child.terminate()
                    try: child.wait(timeout=10)
                    except subprocess.TimeoutExpired: child.kill(); child.wait(timeout=10)
                if time.monotonic()-last >= 15:
                    record(phase, stop_requested=stop_at is not None); last=time.monotonic()
                time.sleep(1)
            result=child.wait(timeout=0)
        record(phase+'_closed', returncode=result, actual_numeric_exit_observed=True)
        return result
    finally:
        if child is not None and child.poll() is None:
            request_stop(); child.send_signal(signal.SIGINT)
            try: child.wait(timeout=2100)
            except subprocess.TimeoutExpired:
                child.terminate()
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired: child.kill(); child.wait(timeout=10)

def main():
    if STUDY.exists():
        raise RuntimeError('fresh study namespace already exists')
    with (BASE/'STARTUP_INTENT.json').open('x') as stream:
        json.dump({'started_at': time.time(), 'automatic_retry': False,
                   'study': str(STUDY)}, stream, sort_keys=True)
        stream.flush(); os.fsync(stream.fileno())
    record('awaiting_independent_curation')
    deadline=time.monotonic()+1900
    while not (BASE/'curation/provenance.json').exists():
        if stopped(): request_stop(); record('stopped_before_freeze'); return 1
        if time.monotonic()>deadline:
            record('curation_not_published_within_bound'); return 1
        time.sleep(5)
    if stopped(): request_stop(); record('stopped_before_freeze'); return 1
    result=command('freezing', [PYTHON,'-m','machinery.study','freeze',
        '--study',str(STUDY),'--config',str(ROOT/'studies/method-learning-sol.json'),
        '--suite',str(BASE/'curation/suite.json'),
        '--contract',str(ROOT/'contracts/gaussian-quotient-goal.json')])
    if result or stopped(): return result or 1
    return command('running_both_arms', [PYTHON,'-m','machinery.study','run',
        '--study',str(STUDY),'--arm','both'])

if __name__=='__main__':
    def stop_signal(*_):
        global STOPPING
        STOPPING=True
    for number in (signal.SIGINT,signal.SIGTERM): signal.signal(number,stop_signal)
    raise SystemExit(main())
