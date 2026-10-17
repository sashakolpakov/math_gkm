"""Machine-authored live request 73199834; read-only reconciliation and new artifacts."""
from pathlib import Path
import json, hashlib, os, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-73199834'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
index=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in index.items()}
prior=json.loads((R/'evidence/markov-20825094/manifest.json').read_text())
assert all(sha(R/k)==v for k,v in prior.items())
contract=json.loads((R/'.control/markov/contract.json').read_text())
raw=R/'.control/markov/workers/000183/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
drafts=json.loads((R/'evidence/markov-20825094/draft-status.json').read_text())
assert all(sha(R/'research'/f'{m}.lean')==v['sha256'] for m,v in drafts.items())
(O/'interruption-reconciliation.json').write_text(json.dumps(dict(raw_sha256=sha(raw),event_count=len(events),pending=pending,last_events=events[-3:],drafts=drafts,decision='No unfinished raw event. Prior nine-module validation remains distinct from two unaccepted drafts. New renamed work only; no replay of prior side effects.'),indent=2))
paths=[R/'MISSION.md',R/'docs/DESIGN.md',R/'lakefile.toml',R/'lake-manifest.json',R/'lean-toolchain',R/'.control/markov/contract.json']
for folder in ('research','evidence','MathGKM'):
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
hashes={str(p.relative_to(R)):sha(p) for p in paths}
(O/'input-hashes.json').write_text(json.dumps(hashes,indent=2))
out=dict(request_id='73199834a78f44d9a2ee490e7f54f632',bindings=bindings,predecessor_artifacts=len(prior),root_sha256=sha(R/'MathGKM/Markov.lean'),canonical_contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),inputs=len(hashes),stop_file=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2))
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-20825094')+':'+json.loads((R/'evidence/markov-20825094/inherited-lean-path.json').read_text())))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied by higher-priority policy; unique research/evidence paths used'),indent=2))
for old,new in [('validate_20825094.py','validate_73199834.py'),('audit_20825094.py','audit_73199834.py'),('finish_20825094.py','finish_73199834.py'),('ReplayIsolatedM208.lean','ReplayIsolatedM731.lean')]:
 s=(R/'research'/old).read_text().replace('20825094','73199834').replace('M208','M731').replace('markov-ca9709f2','markov-20825094')
 (R/'research'/new).write_text(s)
print(json.dumps(out))
