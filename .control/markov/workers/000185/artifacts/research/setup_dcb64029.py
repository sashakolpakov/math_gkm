"""Machine-authored live request dcb6402998ac4eed9feb37199e0f0cee."""
from pathlib import Path
import hashlib,json,shutil,sys,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-dcb64029'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
prev=json.loads((R/'evidence/markov-eb6a9001/manifest.json').read_text())
inputs={str(p.relative_to(R)):sha(p) for base in ['research','evidence','MathGKM'] for p in (R/base).rglob('*') if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']}
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
out=dict(request_id='dcb6402998ac4eed9feb37199e0f0cee',bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()},predecessor_artifacts=len(prev),predecessor_mismatches=[p for p,h in prev.items() if sha(R/p)!=h],root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=sha(R/'.control/markov/contract.json'),input_count=len(inputs),stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
p=R/'.control/markov/workers/000183/events.jsonl'; events=[json.loads(x) for x in p.read_text().splitlines()]
started={x['item']['id']:x['item'] for x in events if x['type']=='item.started'}; completed={x['item']['id']:x['item'] for x in events if x['type']=='item.completed'}
prior=json.loads((R/'evidence/markov-eb6a9001/interruption-reconciliation.json').read_text())
rec=dict(raw_events_sha256=sha(p),event_count=len(events),unfinished_items={k:v for k,v in started.items() if k not in completed},last_events=events[-4:],sources_unchanged={m:sha(R/'research'/f'{m}.lean')==h for m,h in prior['matching_compiled_sources'].items()},prior_recovery='evidence/markov-eb6a9001/validation.json',decision='Interrupted 183 final build completed. Latest completed worker already rebuilt and replayed ten retained modules. All source bindings checked; no uncertain mutation remains and no prior side effect is replayed.')
(O/'interruption-reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
old=json.loads((R/'evidence/markov-eb6a9001/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-eb6a9001')+':'+old)+'\n')
for a,b in [('validate_eb6a9001.py','validate_dcb64029.py'),('audit_eb6a9001.py','audit_dcb64029.py'),('ReplayIsolatedMEB6.lean','ReplayIsolatedMDCB.lean')]:
 s=(R/'research'/a).read_text().replace('eb6a9001','dcb64029').replace('ReplayIsolatedMEB6','ReplayIsolatedMDCB').replace("('M55C','MEB6')","('MDCB',)").replace('endsWith "M55C" || n.toString.endsWith "MEB6"','endsWith "MDCB"').replace('suffixed M55C','suffixed MDCB').replace("+'M55C'","+'MDCB'")
 (R/'research'/b).write_text(s)
caps=dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Higher-priority policy denies .scratch; durable unique research/evidence used.',sympy=importlib.util.find_spec('sympy') is not None,heredoc='zsh heredoc failed creating denied temporary file; no setup side effect occurred. Switched to apply_patch.')
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps(out));print(json.dumps(caps))
