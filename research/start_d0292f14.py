"""Machine-authored live request d0292f142b0e4db995dc25f58edefaca setup."""
from pathlib import Path
import hashlib,json,os,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-d0292f14'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in idx.items()}
prior=json.loads((R/'evidence/markov-80fb7777/manifest.json').read_text())
assert all(sha(R/k)==h for k,h in prior.items())
raw=R/'.control/markov/workers/000189/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
v=json.loads((R/'evidence/markov-80fb7777/validation.json').read_text())
checks={m:sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items()}
assert all(checks.values()) and all(bindings.values())
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='d0292f142b0e4db995dc25f58edefaca',bindings=bindings,predecessor_artifacts=len(prior),validated_sources=checks,interrupted_log_sha256=sha(raw),interrupted_event_count=len(events),pending=pending,last_event_type=events[-1]['type'],decision='Interrupted 97b019af log inspected; completed turn and no pending item. Latest 80fb7777 artifacts verified. No side effect replayed. Investigate uniform correction structure.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-80fb7777')+':'+json.loads((R/'evidence/markov-80fb7777/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied; unique research/evidence paths used.',hosted_source='Publisher retrieval succeeded'),indent=2))
for old,new in [('validate_80fb7777.py','validate_d0292f14.py'),('audit_80fb7777.py','audit_d0292f14.py'),('finish_80fb7777.py','finish_d0292f14.py'),('ReplayIsolatedM80F.lean','ReplayIsolatedMD02.lean')]:
 s=(R/'research'/old).read_text().replace('markov-99a0f3b8','markov-80fb7777').replace('80fb7777','d0292f14').replace('M80F','MD02')
 if old.startswith('finish'): s=s.replace("R/'evidence/markov-d0292f14/manifest.json'", "R/'evidence/markov-80fb7777/manifest.json'")
 (R/'research'/new).write_text(s)
print(json.dumps(dict(bindings=bindings,artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),stop_file=(R/'.control/markov/STOP.json').exists())))
