"""Machine-authored live request bc8d3b6f136b465a886c6f157ae90136."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-bc8d3b6f'
O.mkdir(exist_ok=False)
(R/'research/markov-bc8d3b6f-tmp').mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
art=json.loads((R/'evidence/markov-6604cff8/artifacts.json').read_text())['hashes']
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
checks += [dict(path=k,expected=v,actual=sha(R/k)) for k,v in art.items()]
assert all(x['expected']==x['actual'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000089/events.jsonl').read_text().splitlines()]
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,last_raw_events=events[-3:],conclusion='Worker 89 completed. Two unused fourth-jet drafts are explicitly excluded. Its final effects agree with hashes; no interrupted side effect requires replay. Earlier interruption reconciliation is inherited.'),indent=2)+'\n')
protected=list(inh)+list(art)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in protected},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-6604cff8')+':'+json.loads((R/'evidence/markov-6604cff8/inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority permissions; not accessed. Unique research temporary directory used.',failures=['Guessed research/markov_6604cff8*.py glob had no matches; actual scripts located with rg.'],hosted_source='Publisher page accessed live.'),indent=2)+'\n')
for base in ['validate','replay_union']:
 (R/f'research/{base}_bc8d3b6f.py').write_text((R/f'research/{base}_6604cff8.py').read_text().replace('6604cff8','bc8d3b6f'))
(R/'research/markov-bc8d3b6f-checkpoint.md').write_text('# Checkpoint bc8d3b6f\n\nMachine-authored research. Mission and design read in full; exact root, inherited index, independent audits, and latest reports inspected. Worker 89 completed and its artifact hashes agree. Selected a uniform coefficient extraction investigation for fourth lower slices. No exact-root closure.\n')
print(json.dumps(dict(checks=len(checks),last_event=events[-1]['type'])))
