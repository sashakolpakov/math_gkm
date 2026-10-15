"""Machine-authored live request be5676f95b2a42969d21ef1f51f30bc6."""
from pathlib import Path
import hashlib,json,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-be5676f9'
O.mkdir(exist_ok=False); (R/'research/markov-be5676f9-tmp').mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
art=json.loads((R/'evidence/markov-897eabb3/artifacts.json').read_text())['hashes']
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
checks += [dict(path=k,expected=v,actual=sha(R/k)) for k,v in art.items()]
assert all(x['expected']==x['actual'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000086/events.jsonl').read_text().splitlines()]
recon=json.loads((R/'evidence/markov-897eabb3/reconciliation.json').read_text())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,last_raw_events=events[-3:],inherited_interruption_reconciliation=recon['conclusion'],conclusion='Worker 86 completed. Worker 85 interrupted effects were reconciled by 86; its replay passed, finalizer had not run. No prior side effect replayed.'),indent=2)+'\n')
protected=list(inh)+list(art)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in protected},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-897eabb3')+':'+json.loads((R/'evidence/markov-897eabb3/inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority policy; not accessed. Unique research temporary directory used.',failures=['zsh heredoc rejected before Python execution','Two guessed inherited Lean filenames were absent; located actual module using rg.'],hosted_source='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html accessed successfully'),indent=2)+'\n')
for base in ['validate','replay_union']:
 s=(R/f'research/{base}_897eabb3.py').read_text().replace('897eabb3','be5676f9')
 (R/f'research/{base}_be5676f9.py').write_text(s)
(R/'research/markov-be5676f9-checkpoint.md').write_text('# Checkpoint be5676f9\n\nMachine-authored research. Read full mission, design, target and residual audits, mathematical review, latest reports. Inherited artifacts reconciled. Root remains open. Selected general four-letter cyclic averaging and all-run fourth trace moment bridge; no fitted identities assumed.\n')
print(json.dumps(dict(checks=len(checks),preserved=len(set(protected)))))
