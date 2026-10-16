"""Machine-authored live request f1e4fe3b99d84d70bd218f29dcffcb3c.
Read-only reconciliation followed by unique research/evidence setup.
"""
from pathlib import Path
import json, hashlib, shutil, time
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f1e4fe3b'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
out={'request_id':'f1e4fe3b99d84d70bd218f29dcffcb3c','inherited':{}}
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 out['inherited'][p]=sha(R/p)==v['sha256']
for tag in ['f25b03a1','81f80b2d','5703599b']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 out[tag]={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000133','000134','000135']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 out[n]={'events_sha256':sha(p),'count':len(es),'last_events':es[-4:], 'receipt':json.loads((p.parent/'receipt.json').read_text())}
out['reconciliation']='Immediate predecessor 135 completed. Its source-bound validation includes the repaired interrupted high-cone assembly and arbitrary-degree gap criterion. Workers 133 and 134 timeout effects were reconciled by 135; manifests are verified here and their final raw events retained. No interrupted mutation or pending execution is replayed.'
out['capabilities']={'scratch':'Denied by higher-priority policy; not accessed. Unique research/evidence paths used.', 'heredoc':'Initial read-only Python heredoc failed because zsh could not create its temporary file; no script ran.', 'sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-f25b03a1')+':'+json.loads((R/'evidence/markov-f25b03a1/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_f25b03a1.py','validate_f1e4fe3b.py'),('audit_f25b03a1.py','audit_f1e4fe3b.py'),('ReplayIsolatedMF25.lean','ReplayIsolatedMF1E.lean')]:
 s=(R/'research'/old).read_text().replace('f25b03a1','f1e4fe3b').replace('MF25','MF1E')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in out.items() if not k.startswith('000')}))
