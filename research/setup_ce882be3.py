"""Machine-authored live request ce882be3; reconciliation without replay."""
from pathlib import Path
import json, hashlib
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ce882be3'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
out={'request_id':'ce882be3be764bbea0eaabd905e3bf18','inherited':{k:sha(R/k)==v['sha256'] for k,v in idx.items()}}
for tag in ['b9d0d341','263d8c71']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 out[tag]={'checked':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000128','000130']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 out[n]={'sha256':sha(p),'count':len(es),'last_events':es[-3:]}
out['reconciliation']='Worker 130 completed. Worker 128 effects already reconciled by 129/130; raw final events and manifest checked again, no side effects replayed. Excluded earlier drafts remain excluded.'
out['scratch']='Higher-priority policy denies access; unique research/evidence files used without accessing scratch.'
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-b9d0d341')+':'+json.loads((R/'evidence/markov-b9d0d341/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_b9d0d341.py','validate_ce882be3.py'),('audit_b9d0d341.py','audit_ce882be3.py'),('finalize_b9d0d341.py','finalize_ce882be3.py'),('ReplayIsolatedMB9D.lean','ReplayIsolatedMCE8.lean')]:
 s=(R/'research'/old).read_text().replace('b9d0d3410a1644b6b35ab712bbfc87f7','ce882be3be764bbea0eaabd905e3bf18').replace('b9d0d341','ce882be3').replace('MB9D','MCE8')
 if new.startswith('finalize'):s=s.replace("['263d8c71','aa6c518b']","['263d8c71','b9d0d341']")
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in out.items() if not k.startswith('000')}))
