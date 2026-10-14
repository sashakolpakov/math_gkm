"""Machine-authored foreground source rebuild and kernel replay, worker 2d1cb040."""
import hashlib, json, os, pathlib, subprocess, sys, time
root = pathlib.Path('/Users/sasha/math_gkm')
out = root / 'evidence/markov-2d1cb040'
out.mkdir(exist_ok=True)
(out / 'MathGKM').mkdir(exist_ok=True)
env = dict(os.environ, GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL='/dev/null',
           PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
p = subprocess.run(['lake', 'env', 'printenv', 'LEAN_PATH'], cwd=root, env=env,
                   capture_output=True, text=True, timeout=30)
assert p.returncode == 0, p.stderr
env['LEAN_PATH'] = str(out) + ':' + ':'.join(x for x in p.stdout.strip().split(':')
    if x != str(root / '.lake/build/lib/lean'))
sources = [('MathGKM/Markov.lean', 'MathGKM.Markov'),
           ('MathGKM/MarkovIndices.lean', 'MathGKM.MarkovIndices'),
           ('research/MarkovExchange2d1.lean', 'MarkovExchange2d1'),
           ('research/MarkovLaurent2d1.lean', 'MarkovLaurent2d1'),
           ('research/MarkovProjective2d1.lean', 'MarkovProjective2d1')]
if len(sys.argv) > 1 and sys.argv[1] == 'new': sources = sources[2:3]
if len(sys.argv) > 1 and sys.argv[1] == 'laurent': sources = sources[3:4]
if len(sys.argv) > 1 and sys.argv[1] == 'projective': sources = sources[-1:]
if len(sys.argv) > 1 and sys.argv[1] == 'kernel-projective': sources = sources[-1:]
records = []
stamp = str(time.time_ns())
for source, module in sources:
    (out / (module + '-' + stamp + '.lean')).write_bytes((root / source).read_bytes())
    cmd = ['lean', '-o', str(out / (module.replace('.', '/') + '.olean')), source]
    if len(sys.argv) > 1 and sys.argv[1].startswith('kernel'):
        cmd = ['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/leanchecker', module]
    start = time.monotonic()
    p = subprocess.run(cmd, cwd=root, env=env, capture_output=True, text=True, timeout=90)
    rec = dict(source=source, sha256=hashlib.sha256((root / source).read_bytes()).hexdigest(),
               command=cmd, returncode=p.returncode, stdout=p.stdout, stderr=p.stderr,
               seconds=time.monotonic()-start, lean_path=env['LEAN_PATH'])
    records.append(rec)
    (out / ('run-' + stamp + '.json')).write_text(json.dumps(records, indent=2)+'\n')
    print(json.dumps(rec), flush=True)
    if p.returncode: sys.exit(p.returncode)
