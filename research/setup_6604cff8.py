"""Machine-authored request 6604cff88c7e4daf8bbf37dc04e75558; read-only reconciliation."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-6604cff8'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
art=json.loads((R/'evidence/markov-062809ba/artifacts.json').read_text())['hashes']
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
checks += [dict(path=k,expected=v,actual=sha(R/k)) for k,v in art.items()]
assert all(x['expected']==x['actual'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000088/events.jsonl').read_text().splitlines()]
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,last_raw_events=events[-3:],conclusion='Worker 88 completed with ten explicitly pending draft modules. No interrupted effect outstanding; prior interruptions reconciled in inherited reports. Pending drafts will be copied to new unique names and repaired, not assumed proved.'),indent=2)+'\n')
protected=list(inh)+list(art)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in protected},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-062809ba')+':'+json.loads((R/'evidence/markov-062809ba/inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Higher-priority denied path: not accessed; unique research temporary directory used.',failures=['Initial guessed MathGKM paths absent; actual research modules located.','zsh heredoc attempted temporary-file creation and was denied; subsequent scripts use apply_patch and a permitted TMPDIR.'],hosted_source='Published source accessed live.'),indent=2)+'\n')
for base in ['validate','replay_union']:
 (R/f'research/{base}_6604cff8.py').write_text((R/f'research/{base}_062809ba.py').read_text().replace('062809ba','6604cff8'))
(R/'research/markov-6604cff8-checkpoint.md').write_text('# Checkpoint 6604cff8\n\nMachine-authored research. Mission, design, root, independent audits and latest reports read. Inherited hashes and worker 88 terminal events reconciled. Selected run-three matrix bridge. Full root open.\n')
print(json.dumps(dict(checks=len(checks),last_events=events[-1:])))
