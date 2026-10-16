"""Machine-authored request ec6f4b83e32c444bb048bd75468b418d."""
from pathlib import Path
import json,hashlib,shutil
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-ec6f4b83';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
(O/'inherited-decoded.txt').write_text('\n\n'.join(p+'\n'+v['content'] for p,v in idx.items()))
d={'request_id':'ec6f4b83e32c444bb048bd75468b418d','inherited':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
m=json.loads((R/'evidence/markov-2b34268b/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000145']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text());changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Inspected raw event logs and change receipts for interrupted 136, empty 137 and completed predecessor 145. No inherited side effect replayed.'
d['capabilities']={'scratch':'Higher-priority policy denies access; unique durable research/evidence paths used.','heredoc':'zsh could not create a temporary file; used apply_patch instead.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-2b34268b')+':'+json.loads((R/'evidence/markov-2b34268b/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_2b34268b.py','validate_ec6f4b83.py'),('ReplayIsolatedM2B3.lean','ReplayIsolatedMEC6.lean'),('audit_2b34268b.py','audit_ec6f4b83.py')]:
 s=(R/'research'/old).read_text().replace('2b34268b','ec6f4b83').replace('M2B3','MEC6')
 (R/'research'/new).write_text(s)
print(json.dumps({k:({x:v[x] for x in ['events_count','change_count','change_mismatches']} if k.startswith('000') else v) for k,v in d.items()},indent=2))
