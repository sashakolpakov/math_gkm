"""Machine-authored live research request 01f51d63: reconciliation, no mutations of inherited evidence."""
from pathlib import Path
import hashlib,json,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-01f51d63'
O.mkdir(exist_ok=False); (R/'research/markov-01f51d63-tmp').mkdir(exist_ok=False)
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
prior=R/'evidence/markov-8833a0fb'
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
art=json.loads((prior/'artifacts.json').read_text())['hashes']
checks += [dict(path=k,expected=v,actual=sha(R/k)) for k,v in art.items()]
assert all(x['expected']==x['actual'] for x in checks)
logs={n:(R/f'.control/markov/workers/{n}/events.jsonl').read_text().splitlines()[-3:] for n in ['000081','000084']}
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,raw_log_endings=logs,conclusion='Worker 81 finalizer completed before timeout; worker 84 completed normally. Prior effects inspected and preserved; no side effects replayed.'),indent=2)+'\n')
protected=['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']+list(inh)+list(art)
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in protected},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by active policy, not accessed; unique research temporary directory used.',heredoc='Initial zsh heredoc failed before Python execution; using script files.',hosted_source='Publisher source opened live.'),indent=2)+'\n')
(R/'research/markov-01f51d63-checkpoint.md').write_text('# Checkpoint 01f51d63\n\nMachine-authored live research. Mission and design read fully. Independent target/residual audits, latest report and raw event logs inspected. Inherited artifacts verified. Full pinned Conjecture63 remains unresolved. Investigating fourth lower slice through a local trace expansion; all source constraints and small cycles must remain explicit.\n')
print(json.dumps(dict(verified=len(checks),preserved=len(set(protected)))))
