"""Machine-authored live request 0b212317001348aaa31bde36d93913b1."""
from pathlib import Path
import json,hashlib,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-0b212317'; O.mkdir(); (R/'research/markov-0b212317-tmp').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text());art=json.loads((R/'evidence/markov-bc8d3b6f/artifacts.json').read_text())['hashes']
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]+[dict(path=k,expected=v,actual=sha(R/k)) for k,v in art.items()]
assert all(x['actual']==x['expected'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000090/events.jsonl').read_text().splitlines()]
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,last_raw_events=events[-3:],conclusion='Worker 90 completed. Raw events and effects verified; excluded expanded and zero-Z drafts remain excluded. No interrupted side effect is replayed.'),indent=2)+'\n')
protected=list(inh)+list(art)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in protected},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-bc8d3b6f')+':'+json.loads((R/'evidence/markov-bc8d3b6f/inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Higher-priority deny; not accessed. Unique research temporary directory used.',failures=['Initial zsh heredoc could not create its temporary file; command did not execute. Switched to explicit research script.'],hosted_source='Publisher page opened live.'),indent=2)+'\n')
for base in ['validate','replay_union']:
 (R/f'research/{base}_0b212317.py').write_text((R/f'research/{base}_bc8d3b6f.py').read_text().replace('bc8d3b6f','0b212317'))
(R/'research/markov-0b212317-checkpoint.md').write_text('# Checkpoint 0b212317\n\nMission/design read fully. Contract, inherited index, latest results and independent audits read. Worker 90 completed and all inherited hashes agree. Investigating pre-shift truncation and compact zero-Z local moments. Full root open.\n')
print({'verified_hashes':len(checks),'last_raw_event':events[-1]['type'],'inherited_keys':list(inh)})
