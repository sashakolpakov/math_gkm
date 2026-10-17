"""Machine-authored live research request 9db2326d4e514e22b19a30513b4cae50."""
from pathlib import Path
import hashlib,json,os,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-9db2326d'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] and hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256'] for k,v in idx.items()}
prior=json.loads((R/'evidence/markov-6c0f2afd/manifest.json').read_text())
assert all(sha(R/k)==h for k,h in prior.items())
raw=R/'.control/markov/workers/000189/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
v=json.loads((R/'evidence/markov-6c0f2afd/validation.json').read_text())
checks={m:sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items()}
failures=json.loads((R/'evidence/markov-6c0f2afd/failed-build-index.json').read_text())
receipts=[json.loads((R/f['receipt']).read_text()) for f in failures]
assert all(checks.values()) and all(bindings.values())
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='9db2326d4e514e22b19a30513b4cae50',bindings=bindings,predecessor_artifacts=len(prior),validated_sources=checks,interrupted_log_sha256=sha(raw),interrupted_event_count=len(events),pending=pending,last_event_type=events[-1]['type'],rejected_builds=len(receipts),decision='Inspected interrupted raw events and latest completed predecessor. No pending interrupted item; subsequent workers incorporated effects. Generated third-row batches 10 and 14 are unbuilt, not accepted results. New copies will be validated, without editing or replaying prior side effects.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-6c0f2afd')+':'+json.loads((R/'evidence/markov-6c0f2afd/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied by higher-priority profile; no access attempted. Shell here-document failed to create denied temporary file; using unique research/evidence files.',hosted_source='Publisher retrieval succeeded.'),indent=2))
for stem in ['validate','audit','finish']:
 s=(R/'research'/f'{stem}_6c0f2afd.py').read_text().replace('6c0f2afd','9db2326d').replace('M6C0','M9DB').replace('markov-f8d0715b','markov-6c0f2afd')
 (R/'research'/f'{stem}_9db2326d.py').write_text(s)
s=(R/'research/ReplayIsolatedM6C0.lean').read_text().replace('M6C0','M9DB')
(R/'research/ReplayIsolatedM9DB.lean').write_text(s)
for b in [10,14]:
 s=(R/'research'/f'MarkovMiddleThirdBatch{b}M6C0.lean').read_text()
 s=s.replace('6c0f2afd','9db2326d').replace('Complete third middle row','Candidate third-row slice')
 # Preserve inherited names in imports, definitions and transfer theorem.
 import re
 for name in re.findall(r'^theorem (\w+)',s,re.M):s=s.replace(name,name.replace('M6C0','M9DB'))
 (R/'research'/f'MarkovMiddleThirdBatch{b}M9DB.lean').write_text(s)
print(json.dumps(dict(bindings=bindings,artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),stop_file=(R/'.control/markov/STOP.json').exists())))
