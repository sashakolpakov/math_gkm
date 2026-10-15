"""Machine-authored live research initialization; no controller writes."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-fd72158c'
O.mkdir(exist_ok=False)
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
checks=[]
inh=json.loads((R/'.control/markov/inherited.json').read_text())
for name,v in inh.items():
 checks.append(dict(path=name,expected=v['sha256'],actual=sha(R/name)))
v=json.loads((R/'evidence/markov-e2cd486c/validation.json').read_text())
for m in v['modules']:
 checks.append(dict(path=m['source'],expected=m['sha256'],actual=sha(R/m['source'])))
prior=R/'evidence/markov-e2cd486c'
for p in prior.glob('*manifest*.json'): print('manifest',p)
checks.append(dict(path='MathGKM/Markov.lean',expected='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe',actual=sha(R/'MathGKM/Markov.lean')))
assert all(z['expected']==z['actual'] for z in checks)
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,interrupted_worker_81='Read raw event log: final audit replay and finalizer completed before timeout. Latest worker 82 reconciled workers 77-81 and completed normally. No inherited side effect rerun.',latest_worker_82='Read final report, validation, mathematics, correspondence, and raw event-log ending.'),indent=2)+'\n')
protected=['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']+list(inh)
snapshot={p:sha(R/p) for p in protected}
snapshot.update({str(p.relative_to(R)):sha(p) for p in prior.iterdir() if p.is_file()})
(O/'initial-hashes.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority sandbox; no access attempted. New research/evidence files used.',shell_heredoc='Initial zsh heredoc failed: cannot create temporary file. Switched to scripts and python -c.'),indent=2)+'\n')
(O/'source-use.json').write_text(json.dumps(dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',access='Hosted live web open succeeded, 2026-10-15',use='Source conventions and scope only; not a Lean premise'),indent=2)+'\n')
(R/'research/markov-fd72158c-checkpoint.md').write_text('# Live checkpoint fd72158c\n\nMachine-authored research. Mission/design, pinned root/contract, inherited index and independent audits read. Latest completed worker 82 and interrupted worker 81 raw log endings reconciled. No old side effect replayed. Exact run lengths 2 and 3 selected for third-lower-slice investigation; full Conjecture63 remains open. Sandbox denies .scratch, so temporary artifacts stay in uniquely named research/evidence paths.\n')
print(json.dumps(dict(checks=len(checks),preserved_inputs=len(snapshot))))
