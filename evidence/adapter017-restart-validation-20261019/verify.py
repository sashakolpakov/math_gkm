"""Hash-only verification; does not import the harness or run models/Lean."""
from pathlib import Path,PurePosixPath
import hashlib,json,sys
P=Path(__file__).resolve().parent

def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()

def member(name):
    rel=PurePosixPath(name)
    if rel.is_absolute() or '..' in rel.parts:raise ValueError('unsafe member')
    current=P
    for part in rel.parts:
        current=current/part
        if current.is_symlink():raise ValueError('symlink member')
    if not current.is_file():raise ValueError('missing member')
    return current

def main():
    m=json.loads(member('MANIFEST.json').read_text())
    for n,x in m['files'].items():
        p=member(n)
        if p.stat().st_size!=x['bytes'] or sha(p)!=x['sha256']:raise ValueError('member bytes differ: '+n)
    actual={str(p.relative_to(P)) for p in P.rglob('*') if p.is_file() and '__pycache__' not in p.parts}
    if actual!=set(m['files'])|{'MANIFEST.json'}:raise ValueError('unexpected packet members')
    smoke=json.loads(member('neutral/SMOKE_RESULT.json').read_text())
    if smoke['ready'] is not True or smoke['hosted_calls']!=1:raise ValueError('closed neutral result differs')
    for taskid in ['solutions','decline_alpha']:
        base='neutral/validation/live/'+taskid+'/'
        finished=json.loads(member(base+'FINISHED.json').read_text())
        for name,h in finished['files'].items():
            if sha(member(base+name))!=h:raise ValueError('FINISHED source/receipt differs')
    print(json.dumps({'verified_payload_files':len(m['files']),'packet':'current repair plus new neutral controls only','recorded_current_synthetic_tests':7,'recorded_live_model_calls':1,'recorded_real_compile_replay_inspection':'7/7/2; all passed','study_utility_claimed':False},sort_keys=True))

if __name__=='__main__':
    try:main()
    except (OSError,ValueError,KeyError,TypeError) as e:
        print('verification failed: '+str(e),file=sys.stderr);raise SystemExit(1)
