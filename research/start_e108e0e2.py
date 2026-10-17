"""Machine-authored reconciliation and local research setup; no controller writes."""
from pathlib import Path
import json, hashlib, re, os, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-e108e0e2'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] and hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256'] for k,v in idx.items()}
assert all(bindings.values())
raw=R/'.control/markov/workers/000198/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 i=e.get('item',{}); ident=i.get('id')
 if e.get('type')=='item.started':pending[ident]=i
 if e.get('type')=='item.completed':pending.pop(ident,None)
P=R/'evidence/markov-e8743310'; mods=json.loads((P/'planned-validation.json').read_text())
chosen={}
for m in mods:
 good=[p for p in P.glob('build-*.json') if (d:=json.loads(p.read_text())).get('returncode')==0 and d.get('modules',{}).get(m)==sha(R/'research'/f'{m}.lean')]
 assert good,m
 chosen[m]=str(good[-1].relative_to(R))
replay=P/'replay-1792255045794478000-MarkovCacheME87.json'; rd=json.loads(replay.read_text())
assert rd['returncode']==0 and set(rd['modules'])==set(mods)
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in rd['modules'].items())
audit=P/'axioms-1792255058529559000.json'; ad=json.loads(audit.read_text())
assert ad['sources']==rd['modules'] and all(set(a)<={'propext','Classical.choice','Quot.sound'} for a in ad['declarations'].values())
receipt=json.loads((R/'.control/markov/workers/000198/receipt.json').read_text())
changes=receipt.get('changes',receipt.get('changed_files',{}))
prior=json.loads((R/'evidence/markov-6738b4ea/manifest.json').read_text())
assert all(sha(R/k)==h for k,h in prior.items())
out=dict(bindings=bindings,raw_log_sha256=sha(raw),events=len(events),pending=pending,last_event_type=events[-1]['type'],predecessor_builds=chosen,replay=str(replay.relative_to(R)),axioms=str(audit.relative_to(R)),theorem_closures=len(ad['declarations']),prior_manifest_artifacts=len(prior),decision='000198 ended without final report or manifest. All 13 planned builds, joint replay and axiom audit completed with matching hashes. Reconciled in new evidence only; no predecessor finalizer rerun or historical evidence changed. Central signed-offset bridge selected; dense certificates abandoned.')
(O/'reconciliation.json').write_text(json.dumps(out,indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(P)+':'+json.loads((P/'inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority policy; not accessed. Unique research/evidence paths used.',source='Hosted publisher retrieval succeeded.',stop_file=(R/'.control/markov/STOP.json').exists()),indent=2))
for stem in ['validate','audit','finish']:
 s=(R/'research'/f'{stem}_e8743310.py').read_text().replace('e8743310','e108e0e2').replace('ME87','ME10')
 (R/'research'/f'{stem}_e108e0e2.py').write_text(s)
s=(R/'research/ReplayIsolatedME87.lean').read_text().replace('ME87','ME10')
(R/'research/ReplayIsolatedME10.lean').write_text(s)
print(json.dumps(dict(bindings=bindings,events=len(events),pending=pending,validated_predecessor_modules=len(mods),closures=len(ad['declarations']),root_sha256=sha(R/'MathGKM/Markov.lean'))))
