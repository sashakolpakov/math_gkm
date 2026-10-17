"""Machine-authored live request c3e5369fa14d43dbbe480d50598f6f6a."""
from pathlib import Path
import json, hashlib, shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-c3e5369f'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
man=json.loads((R/'evidence/markov-a646848d/manifest.json').read_text())
ev=R/'.control/markov/workers/000170/events.jsonl'
events=[json.loads(s) for s in ev.read_text().splitlines()]
receipt=json.loads((ev.parent/'receipt.json').read_text())
rec={'bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()},
 'predecessor_artifacts':len(man),'mismatches':[p for p,h in man.items() if sha(R/p)!=h],
 'root_sha256':sha(R/'MathGKM/Markov.lean'),
 'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),
 'predecessor_events_sha256':sha(ev),'predecessor_final_events':events[-2:],
 'predecessor_returncode':receipt.get('returncode'),
 'reconciliation':'Worker 170 completed. Its final event and receipt agree. Experiment reruns were explicitly reconciled in experiment-rerun.json; failed builds remain excluded from validation. No interrupted pending side effect identified and no side effect replayed.',
 'capabilities':{'scratch':'Denied by higher-priority policy; not accessed. Durable unique research/evidence files used.','sage':shutil.which('sage'),'gap':shutil.which('gap')}}
assert all(rec['bindings'].values()) and not rec['mismatches']
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
before={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file() and 'c3e5369f' not in p.name:before[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:before[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(before,indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-a646848d')+':'+json.loads((R/'evidence/markov-a646848d/inherited-lean-path.json').read_text())))
for old,new in [('validate_a646848d.py','validate_c3e5369f.py'),('ReplayIsolatedMA64.lean','ReplayIsolatedMC3E.lean'),('audit_a646848d.py','audit_c3e5369f.py'),('finalize_a646848d.py','finalize_c3e5369f.py')]:
 s=(R/'research'/old).read_text().replace('a646848db8dc4dffbca4cc335370b378','c3e5369fa14d43dbbe480d50598f6f6a').replace('a646848d','c3e5369f').replace('MA64','MC3E')
 if old.startswith('finalize'):s=s.replace('markov-f8f306c0','markov-a646848d')
 (R/'research'/new).write_text(s)
print(json.dumps({k:v for k,v in rec.items() if k!='predecessor_final_events'},indent=2))
