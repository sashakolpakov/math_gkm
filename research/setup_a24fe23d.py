"""Machine-authored live research a24fe23da04d441088b5fe10c2c4681e."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-a24fe23d'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
d={'request_id':'a24fe23da04d441088b5fe10c2c4681e','inherited':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
m=json.loads((R/'evidence/markov-8f77f493/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000152']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Inspected interrupted workers 136/137 and completed predecessor152 raw event tails and compared effects. No earlier execution replayed.'
d['capabilities']={'scratch':'Higher-priority denial; unique research/evidence files used.','shell_heredoc':'Not used; prior worker reported denied shell temporary files.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file(): snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-8f77f493')+':'+json.loads((R/'evidence/markov-8f77f493/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_8f77f493.py','validate_a24fe23d.py'),('ReplayIsolatedM8F7.lean','ReplayIsolatedMA24.lean'),('audit_8f77f493.py','audit_a24fe23d.py')]:
 s=(R/'research'/old).read_text().replace('8f77f493','a24fe23d').replace('M8F7','MA24'); (R/'research'/new).write_text(s)
print(json.dumps({k:({x:v[x] for x in ['events_count','change_count','change_mismatches']} if k.startswith('000') else v) for k,v in d.items()},indent=2))
