"""Machine-authored live research setup; immutable prior inputs, no control writes."""
from pathlib import Path
import hashlib,json,os,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-80fb7777'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in idx.items()}
prior=json.loads((R/'evidence/markov-99a0f3b8/manifest.json').read_text())
assert all(sha(R/k)==h for k,h in prior.items())
raw=R/'.control/markov/workers/000189/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
v=json.loads((R/'evidence/markov-99a0f3b8/validation.json').read_text())
checks={m:sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items()}
assert all(checks.values()) and all(bindings.values())
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='80fb7777cca84604a67221c353b91e37',bindings=bindings,predecessor_artifacts=len(prior),validated_sources=checks,interrupted_log_sha256=sha(raw),interrupted_event_count=len(events),pending=pending,last_event_type=events[-1]['type'],decision='Confirmed prior reconciliation: interrupted 97b019af reached turn.completed. Current 99a0f3b8 artifacts match; no prior side effect replayed. Investigate exact correction structure.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-99a0f3b8')+':'+json.loads((R/'evidence/markov-99a0f3b8/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied; unique research/evidence paths used. Initial zsh here-document failed because temporary directory is denied.',hosted_source='Publisher retrieval succeeded'),indent=2))
for old,new in [('validate_99a0f3b8.py','validate_80fb7777.py'),('audit_99a0f3b8.py','audit_80fb7777.py'),('finish_99a0f3b8.py','finish_80fb7777.py'),('ReplayIsolatedM99A.lean','ReplayIsolatedM80F.lean')]:
 s=(R/'research'/old).read_text().replace('markov-97b019af','markov-99a0f3b8').replace('99a0f3b8','80fb7777').replace('M99A','M80F')
 if old.startswith('finish'): s=s.replace("R/'evidence/markov-80fb7777/manifest.json'", "R/'evidence/markov-99a0f3b8/manifest.json'")
 (R/'research'/new).write_text(s)
print(json.dumps(dict(bindings=bindings,artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),stop_file=(R/'.control/markov/STOP.json').exists())))
