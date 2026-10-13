"""Rebuild Markov modules with pinned Lean; inspect axioms and replay kernel checks."""
import hashlib,json,os,re,subprocess,sys
from pathlib import Path
root=Path(__file__).resolve().parents[2]
mods=['MathGKM.Markov','MathGKM.MarkovIndices','MathGKM.MarkovLogConcavity',
      'MathGKM.MarkovBoundary','MathGKM.MarkovExamples','MathGKM.MarkovAudit']
r=subprocess.run(['/opt/homebrew/bin/python3','evidence/markov/compile.py',*mods],cwd=root)
if r.returncode: sys.exit(r.returncode)
attempt=max((root/'evidence/markov').glob('compile-*.json'),key=lambda p:p.stat().st_mtime_ns)
build=json.loads(attempt.read_text())
audit=build['records'][-1]['stdout']
assert 'sorryAx' not in audit
closures=re.findall(r'depends on axioms: \[([^\]]*)\]',audit)
names=json.loads((root/'evidence/markov/theorem-names.json').read_text())
assert len(closures)==len(names),(len(closures),len(names))
allowed={'propext','Classical.choice','Quot.sound'}
for closure in closures:
    assert {x.strip() for x in closure.split(',') if x.strip()}<=allowed
for mod in mods:
    text=(root/(mod.replace('.','/')+'.lean')).read_text()
    assert not re.search(r'\b(sorry|admit|native_decide)\b',text)
build['source_sha256']={mod:hashlib.sha256((root/(mod.replace('.','/')+'.lean')).read_bytes()).hexdigest() for mod in mods}
build['theorem_count']=len(names)
build['axiom_allowlist']=sorted(allowed)
env=os.environ.copy();env['LEAN_PATH']=build['lean_path']
records=[]
for mod in mods:
    cmd=['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/leanchecker',mod]
    p=subprocess.run(cmd,cwd=root,env=env,capture_output=True,text=True,timeout=120)
    records.append(dict(module=mod,command=cmd,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr))
    print('kernel',mod,p.returncode,flush=True)
    (root/'evidence/markov/kernel.json').write_text(json.dumps(records,indent=2)+'\n')
    if p.returncode: print(p.stdout,p.stderr);sys.exit(p.returncode)
build['kernel_passed']=True
(root/'evidence/markov/MarkovAudit.log').write_text(audit)
(root/'evidence/markov/build.json').write_text(json.dumps(build,indent=2)+'\n')
print('PASS:',len(names),'theorems; allowed axioms only; kernel replay passed')
