"""Machine-authored live worker 96ada19b024045ac97c60b3c8dfb10e6."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-96ada19b';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
d={'request_id':'96ada19b024045ac97c60b3c8dfb10e6','inherited':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
m=json.loads((R/'evidence/markov-9e205206/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
p=R/'.control/markov/workers/000153/events.jsonl'
es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
d['interrupted']={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'prior_reconciliation':json.loads((R/'evidence/markov-9e205206/reconciliation.json').read_text())['reconciliation']}
d['reconciliation']='Worker 154 completed. Worker 153 interrupted after finalization, already reconciled by 154; raw log inspected, no side effects replayed. Retain drafts and successful modules separately.'
d['capabilities']={'scratch':'Denied by higher-priority policy; no access attempted. New research/evidence paths used.','shell_heredoc':'Failed because zsh cannot create temporary file; apply_patch used.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-9e205206')+':'+json.loads((R/'evidence/markov-9e205206/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_9e205206.py','validate_96ada19b.py'),('ReplayIsolatedM9E2.lean','ReplayIsolatedM96A.lean'),('audit_9e205206.py','audit_96ada19b.py'),('finalize_9e205206.py','finalize_96ada19b.py')]:
 s=(R/'research'/old).read_text().replace('9e205206','96ada19b').replace('M9E2','M96A');(R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in d.items() if k!='interrupted'}))
