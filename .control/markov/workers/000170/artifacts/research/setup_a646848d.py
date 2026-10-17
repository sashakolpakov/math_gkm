"""Machine-authored live research a646848d; reconciliation and local receipts."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-a646848d'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-f8f306c0/manifest.json').read_text())
ev=R/'.control/markov/workers/000169/events.jsonl'
events=[json.loads(s) for s in ev.read_text().splitlines()]
rec={'bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},
 'predecessor_artifacts':len(man),'mismatches':[p for p,h in man.items() if sha(R/p)!=h],
 'root_sha256':sha(R/'MathGKM/Markov.lean'),
 'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),
 'predecessor_events_sha256':sha(ev),'predecessor_final_events':events[-3:],
 'reconciliation':'Worker 169 completed. Its source scan was explicitly interrupted and replaced by a completed bounded scan; GAP reduction timed out. Both are preserved and neither will be replayed. Prior failed Lean attempts are excluded from its validated selection. No unresolved inherited side effect was identified.',
 'capabilities':{'scratch':'Denied by developer policy; not accessed. A shell here-document failed to create its temporary file. Unique durable research/evidence files used.', 'sage':shutil.which('sage'),'gap':shutil.which('gap')}}
assert all(rec['bindings'].values()) and not rec['mismatches']
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file() and 'a646848d' not in p.name:before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-f8f306c0')+':'+json.loads((R/'evidence/markov-f8f306c0/inherited-lean-path.json').read_text())))
for old,new in [('validate_f8f306c0.py','validate_a646848d.py'),('ReplayIsolatedMF8F.lean','ReplayIsolatedMA64.lean'),('audit_f8f306c0.py','audit_a646848d.py'),('finalize_f8f306c0.py','finalize_a646848d.py')]:
 s=(R/'research'/old).read_text().replace('f8f306c0701a4692b57e05ac3c809fa5','a646848db8dc4dffbca4cc335370b378').replace('f8f306c0','a646848d').replace('MF8F','MA64')
 if old.startswith('finalize'):s=s.replace('markov-418bcc64','markov-f8f306c0')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in rec.items() if k!='predecessor_final_events'},indent=2))
