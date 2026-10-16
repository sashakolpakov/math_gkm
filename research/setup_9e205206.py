"""Machine-authored live worker 9e205206685d4a9cbba612509f4cc95e."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-9e205206'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
d={'request_id':'9e205206685d4a9cbba612509f4cc95e','inherited':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
m=json.loads((R/'evidence/markov-a24fe23d/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
p=R/'.control/markov/workers/000153/events.jsonl'
es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
d['interrupted']={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-4:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Worker 153 timed out after successful finalizer; validation and 108-artifact manifest exist. Its ten accepted modules are distinguished from three unaccepted drafts. No side effect replayed. Earlier midpoint failure already present in MarkovPellObstructions9a72; latest worker rediscovered it.'
d['capabilities']={'scratch':'Denied by higher-priority policy; no access attempted; unique research/evidence paths used.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file(): snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-a24fe23d')+':'+json.loads((R/'evidence/markov-a24fe23d/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_a24fe23d.py','validate_9e205206.py'),('ReplayIsolatedMA24.lean','ReplayIsolatedM9E2.lean'),('audit_a24fe23d.py','audit_9e205206.py'),('finalize_a24fe23d.py','finalize_9e205206.py')]:
 s=(R/'research'/old).read_text().replace('a24fe23d','9e205206').replace('MA24','M9E2'); (R/'research'/new).write_text(s)
print(json.dumps({'manifest':d['latest_manifest'],'inherited_all':all(d['inherited'].values()),'changes':d['interrupted']['change_count'],'mismatches':d['interrupted']['change_mismatches'],'capabilities':d['capabilities']}))
