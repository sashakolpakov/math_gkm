"""Machine-authored live research setup; no controller mutations."""
from pathlib import Path
import json, hashlib, os, shutil, importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-20825094'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inherited=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={k:sha(R/k)==v['sha256'] for k,v in inherited.items()}
contract=json.loads((R/'.control/markov/contract.json').read_text())
prior=json.loads((R/'evidence/markov-ca9709f2/manifest.json').read_text())
(O/'prior-manifest-shape.json').write_text(json.dumps(prior,indent=2))
raw=R/'.control/markov/workers/000183/events.jsonl'
events=[json.loads(s) for s in raw.read_text().splitlines() if s.strip()]
pending={}
for e in events:
 item=e.get('item',{}); ident=item.get('id')
 if e.get('type')=='item.started':pending[ident]=item
 if e.get('type')=='item.completed':pending.pop(ident,None)
old=json.loads((R/'evidence/markov-ca9709f2/interruption-reconciliation.json').read_text())
sources={n:sha(R/'research'/f'{n}.lean') for n in old['sources_unchanged']}
snap={n:sha(R/'.control/markov/workers/000183/artifacts/research'/f'{n}.lean') if (R/'.control/markov/workers/000183/artifacts/research'/f'{n}.lean').exists() else None for n in sources}
(O/'interruption-reconciliation.json').write_text(json.dumps(dict(raw_sha256=sha(raw),event_count=len(events),pending=pending,sources=sources,snapshots=snap,last_events=events[-4:],decision='Final build completed; inherited later validation retained. No side effects replayed.'),indent=2))
paths=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'lakefile.toml',R/'lake-manifest.json',R/'lean-toolchain',R/'.control/markov/contract.json']
for folder in ('research','evidence','MathGKM'):
 paths.extend(p for p in (R/folder).rglob('*') if p.is_file() and O not in p.parents and p.suffix not in ('.olean','.ilean','.c','.o','.pyc'))
hashes={str(p.relative_to(R)):sha(p) for p in paths}
(O/'input-hashes.json').write_text(json.dumps(hashes,indent=2))
receipt=dict(request_id='2082509481ba44c7bfe6fb10865a70b1',bindings=bindings,root_sha256=sha(R/'MathGKM/Markov.lean'),canonical_contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),inputs=len(hashes),stop_file=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(receipt,indent=2))
lp=str(R/'evidence/markov-ca9709f2')+':'+json.loads((R/'evidence/markov-ca9709f2/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,temporary_policy='.scratch denied by higher-priority policy; use unique research/evidence paths',initial_failure='zsh heredoc could not create temp file; switched to apply_patch and python -c'),indent=2))
print(json.dumps(receipt))
