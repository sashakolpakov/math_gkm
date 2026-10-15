"""Machine-authored request ae37847f; reconcile interrupted worker without replaying mutations."""
from pathlib import Path
import json, hashlib, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ae37847f'
O.mkdir(exist_ok=False)
(O/'work').mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=R/'evidence/markov-00a02b28'
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
for k,v in json.loads((prior/'artifact-verification.json').read_text())['files'].items():
 checks[k]=dict(expected=v,actual=sha(R/k))
worker=R/'.control/markov/workers/000101'
receipt=json.loads((worker/'receipt.json').read_text())
events=[json.loads(x) for x in (worker/'events.jsonl').read_text().splitlines()]
assert all(v['expected']==v['actual'] for v in checks.values())
v=json.loads((prior/'validation.json').read_text())
rec=dict(checks=checks,previous_outcome=receipt['outcome'],last_events=events[-4:],event_count=len(events),compiled_modules=len(v['modules']),replayed_modules=sum(x['kernel_replay_passed'] for x in v['modules']),unreplayed=v['unreplayed_modules'],conclusion='Worker 101 transport timed out after final manifest; raw last command completed. All 30 staged certificates compiled, ten high-chamber replays remain. High adapters and full assembly unbuilt. Low residual equivalence timed out. No inherited mutation replayed; new copied adapters will be compiled under new names.')
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
protected={k:v['actual'] for k,v in checks.items()}
for k in ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json','.control/markov/inherited.json']:
 protected[k]=sha(R/k)
(O/'initial-hashes.json').write_text(json.dumps(protected,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(prior)+':'+json.loads((prior/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=bool(importlib.util.find_spec('sympy')),scratch='Higher-priority filesystem rule denies reads; unique evidence work directory used.',hosted_web='Publisher opened successfully; no shell networking used.'),indent=2)+'\n')
text=(R/'research/validate_00a02b28.py').read_text().replace('00a02b28','ae37847f').replace("str(r/'research/markov-ae37847f-work')","str(out/'work')")
(R/'research/validate_ae37847f.py').write_text(text)
names=['MarkovOnsetAdapter4','MarkovOnsetAdapter5','MarkovOnsetAll','MarkovFourthAfterMiddle','MarkovResidual']
for name in names:
 text=(R/f'research/{name}M00.lean').read_text().replace('00a02b28','ae37847f')
 for renamed in names: text=text.replace(renamed+'M00',renamed+'MAE')
 # Rename only declarations owned by these adapters and assemblies.
 for stem in ['source_fourth_onset4_','source_fourth_onset5_','source_fourth_onset_chamber4','source_fourth_onset_chamber5','source_fourth_onset','source_fourth_after_middle','run_fourth_iff_middle','FinalFourthRegion','InteriorCore63','root_iff_core']:
  import re
  text=re.sub(r'\b('+re.escape(stem)+r'\d*)M00\b',r'\1MAE',text)
 (R/f'research/{name}MAE.lean').write_text(text)
(R/'research/markov-ae37847f-checkpoint.md').write_text('# Request ae37847f\n\nRead complete mission/design, pinned contract and independent target, residual and mathematical audits. Reconciled interrupted worker 101: final checks finished before transport timeout; 42 compiled modules, 32 replays, ten high-chamber replays missing. New copies preserve inherited sources. First action: finish the all-predecessor fourth-slice onset assembly, then reconsider the middle interval. Root remains unresolved.\n')
print(json.dumps(dict(verified_hashes=len(checks),prior_outcome=receipt['outcome'],compiled=len(v['modules']),replayed=sum(x['kernel_replay_passed'] for x in v['modules']))))
