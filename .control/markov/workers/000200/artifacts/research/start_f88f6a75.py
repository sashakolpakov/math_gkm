"""Machine-authored research reconciliation; request f88f6a75. No control writes."""
from pathlib import Path
import json, hashlib, os, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f88f6a75'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] and hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256'] for k,v in idx.items()}
assert all(bindings.values())
logs={}
for num in ['000198','000199']:
 p=R/'.control/markov/workers'/num/'events.jsonl'; events=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 pending={}
 for e in events:
  i=e.get('item',{}); ident=i.get('id')
  if e.get('type')=='item.started':pending[ident]=i
  if e.get('type')=='item.completed':pending.pop(ident,None)
 logs[num]=dict(sha256=sha(p),events=len(events),pending=pending,last_events=events[-3:])
v=json.loads((R/'evidence/markov-e108e0e2/validation.json').read_text())
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items())
for m,p in v['compilation'].items():
 d=json.loads((R/p).read_text());assert d['returncode']==0 and d['modules'][m]==v['modules'][m]
d=json.loads((R/v['replay']).read_text());assert d['returncode']==0 and d['modules']==v['modules']
a=json.loads((R/v['axioms']).read_text());assert a['sources']==v['modules'] and all(set(x)<={'propext','Classical.choice','Quot.sound'} for x in a['declarations'].values())
prior=json.loads((R/'evidence/markov-6738b4ea/manifest.json').read_text());assert all(sha(R/k)==h for k,h in prior.items())
(O/'reconciliation.json').write_text(json.dumps(dict(bindings=bindings,logs=logs,predecessor_validation=v,prior_manifest_artifacts=len(prior),decision='Both interrupted raw logs inspected. Current 24-module validation, joint replay and 96 axiom closures match saved sources. No predecessor side effect replayed; use ThreeCentralNineME10. New one-variable certificate action selected.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
P=R/'evidence/markov-e108e0e2'
(O/'inherited-lean-path.json').write_text(json.dumps(str(P)+':'+json.loads((P/'inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority policy; not accessed.',shell_heredoc='Failed: cannot create temporary file; no mathematical implication.',publisher='Hosted retrieval succeeded.',stop_file=(R/'.control/markov/STOP.json').exists()),indent=2))
for stem in ['validate','audit','finish']:
 s=(R/'research'/f'{stem}_e108e0e2.py').read_text().replace('e108e0e2','f88f6a75').replace('ME10','MF88')
 (R/'research'/f'{stem}_f88f6a75.py').write_text(s)
(R/'research/ReplayIsolatedMF88.lean').write_text((R/'research/ReplayIsolatedME10.lean').read_text().replace('ME10','MF88'))
print(json.dumps(dict(bindings=bindings,logs={k:dict(events=x['events'],pending=list(x['pending']),last_type=x['last_events'][-1]['type']) for k,x in logs.items()},modules=len(v['modules']),closures=len(a['declarations']))))
