"""Machine-authored live request 722898f8: read-only reconciliation and new evidence."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-722898f8'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
print('Inherited index',[(k,len(v.get('content',''))) for k,v in inh.items()])
for k,v in json.loads((R/'evidence/markov-00a02b28/artifact-verification.json').read_text())['files'].items():
 checks[k]=dict(expected=v,actual=sha(R/k))
workers=[]
for num in ['000101','000102']:
 p=R/'.control/markov/workers'/num
 es=[json.loads(x) for x in (p/'events.jsonl').read_text().splitlines()]
 receipt=json.loads((p/'receipt.json').read_text())
 workers.append(dict(worker=num,receipt=receipt,event_count=len(es),last_events=es[-8:]))
 print('Worker',num,'receipt',receipt,'events',len(es))
 for e in es[-5:]:print(json.dumps(e)[:7000])
prior=[]
for p in (R/'evidence/markov-ae37847f').glob('run-*.json'):
 d=json.loads(p.read_text());prior.append(d);print(p.name,d)
assert all(v['expected']==v['actual'] for v in checks.values())
rec=dict(checks=checks,workers=workers,latest_builds=prior,conclusion='101 final receipts inspected; 102 adapter4 timed out, adapter5 compiled. Do not repeat setup scripts or overwrite their output. New names for new work. No root result.')
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for directory in ['evidence/markov-ae37847f']:
 for p in (R/directory).rglob('*'):
  if p.is_file():protected[str(p.relative_to(R))]=sha(p)
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-ae37847f')+':'+json.loads((R/'evidence/markov-ae37847f/inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Higher-priority access denial. Unique evidence work directory used. Two zsh heredocs failed before Python ran, including one after setting TMPDIR.',hosted_web='Primary publisher opened successfully.'),indent=2)+'\n')
text=(R/'research/validate_ae37847f.py').read_text().replace('ae37847f','722898f8')
(R/'research/validate_722898f8.py').write_text(text)
(R/'research/markov-722898f8-checkpoint.md').write_text('# Live request 722898f8\n\nRead mission and design, exact pinned root, independent target and residual audits. Reconciliation is in evidence/markov-722898f8/reconciliation.json. Full root remains unresolved. No inherited side effects replayed. All new work receives unique names.\n')
print('Verified hashes',len(checks))
