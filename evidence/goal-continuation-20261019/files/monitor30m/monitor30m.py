"""Proposed OPS-only scheduler. Enqueue to existing root; never starts research."""
import argparse,fcntl,json,os,signal,subprocess,time
from pathlib import Path
BASE=Path('/Users/sasha/math_gkm/.bootstrap/paired-v3-restart-20261019/monitor30m')
ROOT=Path('/Users/sasha/math_gkm')
THREAD='01a12a35-a808-77f3-a79a-97e87091dacc'
PYTHON='/opt/homebrew/bin/python3'
CODEX='/opt/homebrew/bin/codex'

def write(path,value):
    tmp=path.with_name(path.name+'.new')
    with tmp.open('w') as f:
        json.dump(value,f,sort_keys=True);f.write('\n');f.flush();os.fsync(f.fileno())
    os.replace(tmp,path)

def event(kind,**fields):
    log=BASE/'events.jsonl'
    if log.exists() and log.stat().st_size>262144:os.replace(log,BASE/'events.previous.jsonl')
    with log.open('a') as f:f.write(json.dumps({'time':time.time(),'event':kind,**fields},sort_keys=True)+'\n')

def main():
    a=argparse.ArgumentParser();m=a.add_mutually_exclusive_group(required=True)
    m.add_argument('--tick',action='store_true');m.add_argument('--validation-only',action='store_true')
    m.add_argument('--ack',type=int);m.add_argument('--done',type=int)
    m.add_argument('--disable',action='store_true');m.add_argument('--status',action='store_true')
    a.add_argument('--terminal',action='store_true');args=a.parse_args()
    os.umask(0o077);BASE.mkdir(parents=True,exist_ok=True)
    with (BASE/'lock').open('a') as lock:
        try:fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError:return
        path=BASE/'state.json'
        s=json.loads(path.read_text()) if path.exists() else {'enabled':True,'seq':0}
        enabled=s.get('enabled',True) and not (BASE/'STOP').exists()
        if args.status:print(json.dumps(s,sort_keys=True));return
        if args.disable:
            s['enabled']=False;write(path,s);event('disabled');return
        if args.ack is not None or args.done is not None:
            n=args.ack if args.ack is not None else args.done
            if not s.get('pending') or s['pending']['seq']!=n:raise ValueError('no matching pending tick')
            if args.ack is not None:
                s['pending']['phase']='running';s['pending'].setdefault('ack_at',time.time());event('ack',seq=n)
            else:
                if s['pending'].get('phase')!='running':raise ValueError('tick must be acknowledged first')
                if s['pending']['kind']=='validation':s['validation_done']=True
                s['last_completed']={**s.pop('pending'),'done_at':time.time()}
                if args.terminal:s['enabled']=False
                event('done',seq=n,terminal=args.terminal)
            write(path,s);print(json.dumps({'acknowledged':n,'enabled':enabled and s.get('enabled',True)}));return
        if not enabled:return
        if s.get('pending'):event('skipped_outstanding',seq=s['pending']['seq'],phase=s['pending']['phase']);return
        if args.validation_only and s.get('validation_sent'):return
        if args.tick and not s.get('validation_done'):event('awaiting_idle_validation');return
        n=s['seq']+1;kind='validation' if args.validation_only else 'monitor'
        command=f'{PYTHON} {BASE}/monitor30m.py'
        if kind=='validation':
            prompt=(f'[GKM017 monitor delivery test {n}] This is an authorized ack-only idle-delivery test, not research. Use /Users/sasha/math_gkm as workdir for every command. '
                    f'First run `{command} --ack {n}`, then `{command} --done {n}`. '
                    'Reply briefly in this existing conversation that the delayed monitoring test reached you. '
                    'Do not inspect research, run models/proofs/tests, create threads or contact any researcher.')
        else:
            prompt=(f'[GKM017 scheduled monitor {n}] First run `{command} --ack {n}`. '
                    f'Follow the read-only status instructions at {BASE}/MONITOR_INSTRUCTIONS.md. '
                    f'Then run `{command} --done {n}` (add --terminal only after final status when both lanes/operator closed). '
                    'Give the user the compact status in this same conversation. No research help or new tasks.')
        s.update(seq=n,pending={'seq':n,'kind':kind,'phase':'queued_or_delivery_uncertain','attempt_at':time.time()})
        if kind=='validation':s['validation_sent']=True
        write(path,s);event('queue_attempt',seq=n,tick_kind=kind)
        fcntl.flock(lock,fcntl.LOCK_UN)  # The woken root must be able to acknowledge immediately.
        p=None;rc=None;outcome='delivery_uncertain'
        try:
            p=subprocess.Popen([CODEX,'queue','--thread',THREAD,'--message',prompt],cwd=ROOT,
                stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,start_new_session=True)
            try:rc=p.wait(timeout=25);outcome='enqueued_unacknowledged' if rc==0 else 'queue_failed_or_uncertain'
            except subprocess.TimeoutExpired:
                try:os.killpg(p.pid,signal.SIGKILL)
                except ProcessLookupError:pass
                try:rc=p.wait(timeout=2)
                except subprocess.TimeoutExpired:pass
                outcome='queue_timeout_delivery_uncertain'
        except OSError:outcome='queue_launch_failed_or_uncertain'
        fcntl.flock(lock,fcntl.LOCK_EX)
        s=json.loads(path.read_text())  # Preserve any concurrent root ack/done.
        target=s.get('pending') or s.get('last_completed')
        if target and target['seq']==n:target.update(queue_exit_code=rc,queue_outcome=outcome,attempt_finished=time.time())
        write(path,s);event('queue_return',seq=n,returncode=rc,outcome=outcome)
        # Never resend automatically: even timeout/nonzero may have committed delivery.

if __name__=='__main__':main()
