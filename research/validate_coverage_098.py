"""Machine-authored worker 098a5a66; fresh local source builds, no admission claim."""
import hashlib, json, os, pathlib, subprocess, time
ROOT = pathlib.Path('/Users/sasha/math_gkm')
OUT = ROOT / 'evidence/markov-098a5a66'
OUT.mkdir(parents=True, exist_ok=True)
(OUT / 'MathGKM').mkdir(exist_ok=True)
env = dict(os.environ, GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL='/dev/null',
           PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
p = subprocess.run(['lake','env','printenv','LEAN_PATH'], cwd=ROOT, env=env,
                   text=True, capture_output=True, timeout=30)
if p.returncode: raise RuntimeError(p.stderr)
env['LEAN_PATH'] = str(OUT) + ':' + ':'.join(x for x in p.stdout.strip().split(':')
    if x != str(ROOT / '.lake/build/lib/lean'))
records = []
for source, target in [('MathGKM/Markov.lean','MathGKM/Markov.olean'),
                       ('MathGKM/MarkovIndices.lean','MathGKM/MarkovIndices.olean'),
                       ('research/MarkovCoverage098.lean','MarkovCoverage098.olean')]:
    start = time.monotonic()
    cmd = ['lean','-o',str(OUT / target), source]
    p = subprocess.run(cmd,cwd=ROOT,env=env,text=True,capture_output=True,timeout=120)
    log = OUT / (pathlib.Path(source).stem + '.log')
    log.write_text(p.stdout + p.stderr)
    records.append(dict(source=source,sha256=hashlib.sha256((ROOT/source).read_bytes()).hexdigest(),
        command=cmd,returncode=p.returncode,seconds=time.monotonic()-start,log=str(log)))
    (OUT/'build.json').write_text(json.dumps(records,indent=2)+'\n')
    print(json.dumps(records[-1]),flush=True)
    print(p.stdout+p.stderr,flush=True)
    if p.returncode: break
