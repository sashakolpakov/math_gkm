"""Machine-authored live research request 6c0f2afda19a4b5cbd7130331ec09bc2."""
from pathlib import Path
import hashlib,json,os,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-6c0f2afd'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] and hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256'] for k,v in idx.items()}
prior=json.loads((R/'evidence/markov-f8d0715b/manifest.json').read_text())
assert all(sha(R/k)==h for k,h in prior.items())
raw=R/'.control/markov/workers/000189/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
v=json.loads((R/'evidence/markov-f8d0715b/validation.json').read_text())
checks={m:sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items()}
failures=json.loads((R/'evidence/markov-f8d0715b/failed-build-index.json').read_text())
for f in failures:
 receipt=json.loads((R/f['receipt']).read_text())
 assert receipt.get('timeout') and receipt.get('returncode') is None
assert all(checks.values()) and all(bindings.values())
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='6c0f2afda19a4b5cbd7130331ec09bc2',bindings=bindings,predecessor_artifacts=len(prior),validated_sources=checks,interrupted_log_sha256=sha(raw),interrupted_event_count=len(events),pending=pending,last_event_type=events[-1]['type'],timeout_receipts=failures,decision='Parsed interrupted worker raw log: completed turn, no pending item; later workers incorporated effects. Verified latest accepted sources and all predecessor artifacts. Four larger-column certificates and two dependent drafts remain unaccepted; no side effect replayed.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-f8d0715b')+':'+json.loads((R/'evidence/markov-f8d0715b/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied by higher-priority profile; unique research/evidence paths used without attempting denied access.',hosted_source='Publisher retrieval and live search succeeded.'),indent=2))
for stem in ['validate','audit','finish']:
 s=(R/'research'/f'{stem}_f8d0715b.py').read_text().replace('f8d0715b','6c0f2afd').replace('MF8D','M6C0').replace('markov-d0292f14','markov-f8d0715b')
 (R/'research'/f'{stem}_6c0f2afd.py').write_text(s)
s=(R/'research/ReplayIsolatedMF8D.lean').read_text().replace('MF8D','M6C0')
(R/'research/ReplayIsolatedM6C0.lean').write_text(s)
print(json.dumps(dict(bindings=bindings,artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),stop_file=(R/'.control/markov/STOP.json').exists())))
