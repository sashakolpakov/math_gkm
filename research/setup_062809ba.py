"""Machine-authored research request 062809bac9f44b50b45dfdee483159d5."""
from pathlib import Path
import hashlib,json,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-062809ba'
O.mkdir(exist_ok=False); (R/'research/markov-062809ba-tmp').mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
art=json.loads((R/'evidence/markov-be5676f9/artifacts.json').read_text())['hashes']
checks=[dict(path=k,expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()]
checks += [dict(path=k,expected=v,actual=sha(R/k)) for k,v in art.items()]
assert all(x['expected']==x['actual'] for x in checks)
events=[json.loads(l) for l in (R/'.control/markov/workers/000087/events.jsonl').read_text().splitlines()]
recon=json.loads((R/'evidence/markov-be5676f9/reconciliation.json').read_text())
(O/'reconciliation.json').write_text(json.dumps(dict(checks=checks,last_raw_events=events[-3:],inherited_interruption_reconciliation=recon['conclusion'],conclusion='Worker 87 completed; no interrupted effect outstanding. Earlier interrupted effects reconciled in inherited evidence. No inherited side effect repeated.'),indent=2)+'\n')
protected=list(inh)+list(art)+['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']
(O/'initial-hashes.json').write_text(json.dumps({k:sha(R/k) for k in protected},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-be5676f9')+':'+json.loads((R/'evidence/markov-be5676f9/inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Denied by higher-priority policy; not accessed. Unique research temporary directory used.',failures=['Guessed MarkovInteriorCoreBE filename absent; actual residual module located by search.'],hosted_source='Published source accessed live; no external theorem added.'),indent=2)+'\n')
for base in ['validate','replay_union']:
 s=(R/f'research/{base}_be5676f9.py').read_text().replace('be5676f9','062809ba')
 (R/f'research/{base}_062809ba.py').write_text(s)
(R/'research/markov-062809ba-checkpoint.md').write_text('# Checkpoint 062809ba\n\nMachine-authored research. Mission, design, pinned target, independent audits and latest reports read. Inherited artifact hashes checked and raw terminal events reconciled. Full root remains open. Selected fourth-slice run-two and run-three proofs with exact small-cycle corrections.\n')
print(json.dumps(dict(checks=len(checks),protected=len(set(protected)),last_events=events[-1:])))
