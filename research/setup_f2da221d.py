"""Machine-authored live research request f2da221d241a479bb83492e861a09fd7."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f2da221d'
O.mkdir(); (R/'research/markov-f2da221d-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
receipt=json.loads((R/'.control/markov/workers/000091/receipt.json').read_text())
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
checks += [dict(path=k,expected=v['after'],actual=sha(R/k)) for k,v in receipt['changes'].items() if v['after']]
assert all(x['actual']==x['expected'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000091/events.jsonl').read_text().splitlines()]
prior=R/'evidence/markov-0b212317'
replays=[dict(path=str(p.relative_to(R)),**json.loads(p.read_text())) for p in prior.glob('kernel-union-*.json')]
builds=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in prior.glob('run-*.json')]
inventory=json.loads((prior/'audit-inventory.json').read_text())
recovered=[]
for m in inventory['modules']+['MarkovAuditK0B']:
 p=R/'research'/f'{m}.lean';h=sha(p)
 b=[x['receipt'] for x in builds if x.get('sha256')==h and x.get('returncode')==0 and x.get('mode')=='build']
 k=[x['path'] for x in replays if x.get('returncode')==0 and x.get('modules',{}).get(m)==h]
 recovered.append(dict(module=m,sha256=h,builds=b,replays=k,matched=bool(b and k)))
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='f2da221d241a479bb83492e861a09fd7',checks=checks,last_raw_events=events[-3:],recovered=recovered,conclusion='Worker 91 timed out after starting its final small union replay. The replay receipt exists and succeeds. Final validation/artifact manifests were not created. Matched per-module build and replay receipts are recovered here; no prior files are changed. Audit module changed during an earlier replay; only matching final hashes count. Excluded drafts remain excluded.'),indent=2)+'\n')
protected={x['path']:x['actual'] for x in checks}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Higher-priority filesystem denial; not accessed. Unique research temporary directory used.',source='Publisher accessed through hosted web tool.'),indent=2)+'\n')
for base in ['validate','replay_union']:
 (R/f'research/{base}_f2da221d.py').write_text((R/f'research/{base}_0b212317.py').read_text().replace('0b212317','f2da221d'))
(R/'research/markov-f2da221d-checkpoint.md').write_text('# Research checkpoint f2da221d\n\nMission/design, pinned contract, inherited index, latest results and independent audits read. Worker 91 interruption reconciled from raw events, final replay receipts and artifact hashes. No prior effects replayed. Full root open. Working on generic shift divisibility and boundary coefficient gaps.\n')
print(dict(verified_hashes=len(checks),recovered=len(recovered),unmatched=[x['module'] for x in recovered if not x['matched']],inherited_keys=list(inh)))
