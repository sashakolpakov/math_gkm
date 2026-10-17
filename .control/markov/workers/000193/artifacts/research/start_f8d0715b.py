"""Machine-authored live request f8d0715be053400395d9ac23a673f230 setup."""
from pathlib import Path
import hashlib,json,os,shutil,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f8d0715b'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in idx.items()}
prior=json.loads((R/'evidence/markov-d0292f14/manifest.json').read_text())
assert all(sha(R/k)==h for k,h in prior.items())
raw=R/'.control/markov/workers/000189/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
v=json.loads((R/'evidence/markov-d0292f14/validation.json').read_text())
checks={m:sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items()}
assert all(checks.values()) and all(bindings.values())
(O/'reconciliation.json').write_text(json.dumps(dict(request_id='f8d0715be053400395d9ac23a673f230',bindings=bindings,predecessor_artifacts=len(prior),validated_sources=checks,interrupted_log_sha256=sha(raw),interrupted_event_count=len(events),pending=pending,last_event_type=events[-1]['type'],decision='Interrupted 97b019af raw log parsed; completed turn and no pending item. Subsequent completed reports incorporated partial work. Latest d0292f14 artifacts verified. No side effect replayed; investigate correction structure.'),indent=2))
paths=[R/x for x in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']]
for folder in ['research','evidence','MathGKM']:
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
(O/'input-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in paths},indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-d0292f14')+':'+json.loads((R/'evidence/markov-d0292f14/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied by higher-priority profile; unique research/evidence paths used. zsh heredoc failed creating its temporary file; switched to apply_patch.',hosted_source='Publisher retrieval and live search succeeded'),indent=2))
for stem in ['validate','audit','finish']:
 s=(R/'research'/f'{stem}_d0292f14.py').read_text().replace('d0292f14','f8d0715b').replace('MD02','MF8D').replace('markov-80fb7777','markov-d0292f14')
 (R/'research'/f'{stem}_f8d0715b.py').write_text(s)
s=(R/'research/ReplayIsolatedMD02.lean').read_text().replace('MD02','MF8D')
(R/'research/ReplayIsolatedMF8D.lean').write_text(s)
print(json.dumps(dict(bindings=bindings,artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),stop_file=(R/'.control/markov/STOP.json').exists())))
