"""Machine-authored live request 897eabb33b1e4aa8848c530bea99c83d.
Read-only reconciliation followed by unique evidence creation.
"""
from pathlib import Path
import hashlib,json,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-897eabb3'
O.mkdir(exist_ok=False); (R/'research/markov-897eabb3-tmp').mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
prior=R/'evidence/markov-01f51d63'
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
art=json.loads((R/'evidence/markov-8833a0fb/artifacts.json').read_text())['hashes']
checks += [dict(path=k,expected=v,actual=sha(R/k)) for k,v in art.items()]
assert all(x['expected']==x['actual'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000085/events.jsonl').read_text().splitlines()]
inv=json.loads((prior/'audit-inventory.json').read_text())
runs=[dict(json.loads(p.read_text()),receipt=str(p.relative_to(R))) for p in prior.glob('run-*.json')]
groups=[dict(json.loads(p.read_text()),receipt=str(p.relative_to(R))) for p in prior.glob('kernel-union-*.json')]
verified=[]
for m in inv['modules']+['MarkovAudit01F']:
 p=R/'research'/f'{m}.lean'; h=sha(p)
 builds=[d['receipt'] for d in runs if d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h and d.get('mode')=='build' and d.get('returncode')==0]
 replays=[d['receipt'] for d in runs if d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h and d.get('mode')=='replay' and d.get('returncode')==0]
 replays += [d['receipt'] for d in groups if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 assert builds and replays,m
 verified.append(dict(module=m,sha256=h,builds=builds,replays=replays))
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,interrupted_modules=verified,raw_log_tail=events[-8:],conclusion='Worker 85 finished its audit replay before timeout; finalizer script exists but validation/preservation/artifacts outputs were never produced. Do not rerun its finalizer or overwrite inherited evidence. All 15 final sources have matching successful build and replay receipts; final source-moment hypothesis remains unproved.'),indent=2)+'\n')
protected=['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']+list(inh)+list(art)
protected += [str(p.relative_to(R)) for p in prior.iterdir() if p.is_file()]
protected += [f'research/{m}.lean' for m in inv['modules']+['MarkovAudit01F']]
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in protected},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority active policy; not accessed. Unique research temporary directory used.',heredoc='Initial zsh heredoc failed before Python execution; use scripts.'),indent=2)+'\n')
(R/'research/markov-897eabb3-checkpoint.md').write_text('# Research checkpoint 897eabb3\n\nMachine-authored live research. Mission/design and independent audits read. Worker 85 reconciled: final replay succeeded, but finalizer was not executed. No inherited side effect replayed. Investigating four-letter source pattern counts and fourth-slice transport. Full pinned Conjecture63 remains open.\n')
print(json.dumps(dict(checks=len(checks),verified_interrupted_modules=len(verified),preserved=len(set(protected)))))
