"""Machine-authored research execution 1bb0aa1ee066482294f620401d001bf2."""
from pathlib import Path
import json,hashlib,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-1bb0aa1e';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
d={'request_id':'1bb0aa1ee066482294f620401d001bf2','inherited_bindings':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
p=R/'.control/markov/workers/000156/events.jsonl'; es=[json.loads(s) for s in p.read_text().splitlines()]
d['interrupted']={'events_sha256':sha(p),'event_count':len(es),'last_events':es[-5:]}
checks=[]
for p in sorted((R/'evidence/markov-e9cdd527').glob('build-*.json')):
 v=json.loads(p.read_text())
 if v.get('returncode')==0:
  checks.append({'receipt':str(p.relative_to(R)),'sources_match':{m:sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items()}})
d['interrupted_successful_builds']=checks
d['reconciliation']='Worker 156 left twelve built modules and a successful seven-module replay. Its final twelve-module replay and axiom audit both timed out at 100 seconds. No validation.json or final manifest exists. Existing source is preserved; renewed checks write only this run’s unique paths. No predecessor mutation is replayed.'
d['capabilities']={'scratch':'Denied by higher-priority policy; not accessed. Unique research/evidence paths substitute.','sage':shutil.which('sage'),'gap':shutil.which('gap'),'initial_search':'Hidden rg enumeration emitted denied .git/.scratch errors; no contents read; restricted explicit directories thereafter.','heredoc':'zsh could not create temporary heredoc file; use apply_patch and Python files instead.'}
d['root_sha256']=sha(R/'MathGKM/Markov.lean')
c=json.loads((R/'.control/markov/contract.json').read_text());d['contract_sha256']=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-e9cdd527')+':'+json.loads((R/'evidence/markov-e9cdd527/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_e9cdd527.py','validate_1bb0aa1e.py'),('ReplayIsolatedME9C.lean','ReplayIsolatedM1BB.lean'),('audit_e9cdd527.py','audit_1bb0aa1e.py')]:
 s=(R/'research'/old).read_text().replace('e9cdd527','1bb0aa1e').replace('ME9C','M1BB')
 if new.startswith('validate_'):s=s.replace("assert all(n.endswith('M1BB')", "assert all(n.endswith(('M1BB','ME9C'))")
 if new.startswith('Replay'):s=s.replace('n.toString.endsWith "M1BB"','(n.toString.endsWith "M1BB" || n.toString.endsWith "ME9C")')
 (R/'research'/new).write_text(s)
print(json.dumps({'bindings':d['inherited_bindings'],'root':d['root_sha256'],'contract':d['contract_sha256'],'successful_builds':len(checks),'reconciliation':d['reconciliation']}))
