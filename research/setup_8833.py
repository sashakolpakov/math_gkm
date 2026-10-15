"""Machine-authored live request 8833a0fb; read-only reconciliation."""
from pathlib import Path
import hashlib,json,shutil,importlib.util
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8833a0fb'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
prior=R/'evidence/markov-fd72158c'
v=json.loads((prior/'validation.json').read_text())
checks += [dict(path=m['source'],expected=m['sha256'],actual=sha(R/m['source'])) for m in v['modules']]
checks += [dict(path='MathGKM/Markov.lean',expected='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe',actual=sha(R/'MathGKM/Markov.lean'))]
art=json.loads((prior/'artifacts.json').read_text())
print('artifact keys',list(art)[:5])
assert all(c['expected']==c['actual'] for c in checks)
logs={n:(R/f'.control/markov/workers/{n}/events.jsonl').read_text().splitlines()[-3:] for n in ['000081','000083']}
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,raw_log_endings=logs,conclusion='Worker 81 finalizer completed before timeout; worker 83 completed normally. Existing source/build effects inspected; no side effect replayed.'),indent=2)+'\n')
protected=['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']+list(inh)
snapshot={p:sha(R/p) for p in protected}
snapshot.update({str(p.relative_to(R)):sha(p) for p in prior.iterdir() if p.is_file()})
(O/'initial-hashes.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied; no access attempted; unique research temporary directory used',heredoc='Two zsh heredoc attempts rejected by temporary-file policy; using files and python -c',hosted_source='Publisher HTML successfully opened live'),indent=2)+'\n')
(R/'research/markov-8833a0fb-checkpoint.md').write_text('# Checkpoint 8833a0fb\n\nMachine-authored live research. Mission and design read completely; root, inherited index, latest mathematics and independent target/residual audits inspected. Two-cycle tail chosen. Earlier completed side effects reconciled from logs. Full Conjecture63 remains unresolved.\n')
print('verified',len(checks),'preserved',len(snapshot))
