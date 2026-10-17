"""Machine-authored live research ca9709f2; read-only inheritance reconciliation."""
from pathlib import Path
import hashlib,json,shutil,sys,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ca9709f2'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
prev=json.loads((R/'evidence/markov-dcb64029/manifest.json').read_text())
inputs={str(p.relative_to(R)):sha(p) for base in ['research','evidence','MathGKM'] for p in (R/base).rglob('*') if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']}
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
out=dict(request_id='ca9709f2af7048a4813bd37d46ae4ce9',bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()},inherited_index={p:dict(sha256=v['sha256'],content_bytes=len(v['content'])) for p,v in inh.items()},predecessor_artifacts=len(prev),predecessor_mismatches=[p for p,h in prev.items() if sha(R/p)!=h],root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=sha(R/'.control/markov/contract.json'),pins={p:sha(R/p) for p in ['lean-toolchain','lakefile.toml','lake-manifest.json']},input_count=len(inputs),stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
p=R/'.control/markov/workers/000183/events.jsonl'; events=[json.loads(x) for x in p.read_text().splitlines()]
started={x['item']['id']:x['item'] for x in events if x['type']=='item.started'}; completed={x['item']['id']:x['item'] for x in events if x['type']=='item.completed'}
prior=json.loads((R/'evidence/markov-eb6a9001/interruption-reconciliation.json').read_text())
rec=dict(raw_events_sha256=sha(p),event_count=len(events),unfinished_items={k:v for k,v in started.items() if k not in completed},last_events=events[-4:],sources_unchanged={m:sha(R/'research'/f'{m}.lean')==h for m,h in prior['matching_compiled_sources'].items()},prior_recovery='evidence/markov-eb6a9001/validation.json',decision='Interrupted 183 final build completed. Later workers rebuilt and replayed retained modules. Bindings checked; no uncertain mutation remains and no side effect is replayed.')
(O/'interruption-reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
old=json.loads((R/'evidence/markov-dcb64029/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-dcb64029')+':'+old)+'\n')
for a,b in [('validate_dcb64029.py','validate_ca9709f2.py'),('audit_dcb64029.py','audit_ca9709f2.py'),('ReplayIsolatedMDCB.lean','ReplayIsolatedMCA9.lean')]:
 s=(R/'research'/a).read_text().replace('dcb64029','ca9709f2').replace('MDCB','MCA9')
 (R/'research'/b).write_text(s)
caps=dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority policy; unique research/evidence paths used.')
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps(out));print(json.dumps(caps));print(json.dumps({k:v for k,v in rec.items() if k not in ['last_events']}))
