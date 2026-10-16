"""Machine-authored live research reconciliation; no controller mutation."""
from pathlib import Path
import json,hashlib,time,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ac3d4ab9'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d={'request_id':'ac3d4ab98366433dacc719574d5ff03e','inherited':{}}
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 d['inherited'][p]=sha(R/p)==v['sha256']
for tag in ['f25b03a1','f1e4fe3b']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 d[tag]={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text())
 changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-4:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Worker 136 timed out at the outer boundary after finalizer completed; its five validated modules and report exist. Raw final event records successful finalization. Worker 137 was stopped with empty event log and no recorded changes. No previous command or mutation is replayed.'
d['capabilities']={'scratch':'policy denied; not accessed','heredoc':'initial zsh heredoc failed before Python ran','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-f1e4fe3b')+':'+json.loads((R/'evidence/markov-f1e4fe3b/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_f1e4fe3b.py','validate_ac3d4ab9.py'),('audit_f1e4fe3b.py','audit_ac3d4ab9.py'),('ReplayIsolatedMF1E.lean','ReplayIsolatedMAC3.lean')]:
 s=(R/'research'/old).read_text().replace('f1e4fe3b','ac3d4ab9').replace('MF1E','MAC3')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in d.items() if not k.startswith('000')}))
