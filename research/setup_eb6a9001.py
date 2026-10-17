"""Machine-authored live research request eb6a900170904ab59255de637301f446."""
from pathlib import Path
import hashlib,json,shutil,sys,importlib.util
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-eb6a9001'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
prev=json.loads((R/'evidence/markov-b3eed364/manifest.json').read_text())
inputs={str(p.relative_to(R)):sha(p) for base in ['research','evidence','MathGKM'] for p in (R/base).rglob('*') if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']}
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
out=dict(request_id='eb6a900170904ab59255de637301f446',bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()},predecessor_artifacts=len(prev),predecessor_mismatches=[p for p,h in prev.items() if sha(R/p)!=h],root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=sha(R/'.control/markov/contract.json'),input_count=len(inputs),stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
p=R/'.control/markov/workers/000183/events.jsonl'
events=[json.loads(x) for x in p.read_text().splitlines()]
started={x['item']['id']:x['item'] for x in events if x['type']=='item.started'}
completed={x['item']['id']:x['item'] for x in events if x['type']=='item.completed'}
builds=[json.loads(p.read_text()) for p in (R/'evidence/markov-55cf20d2').glob('build-*.json')]
latest={}
for b in builds:
 for m,h in b['modules'].items():
  if b.get('returncode')==0 and sha(R/'research'/f'{m}.lean')==h:latest[m]=h
rec=dict(raw_events_sha256=sha(p),event_count=len(events),unfinished_items={k:v for k,v in started.items() if k not in completed},last_events=events[-6:],matching_compiled_sources=latest,previous_build_failures=sum(b.get('returncode')!=0 for b in builds),decision='All started items have completed events. Final Leading module build succeeded, followed by read-only search. No joint replay, axiom audit, manifest or final report. Preserve all effects; rebuild and validate retained sources into a new evidence directory, never replay prior mutations.')
(O/'interruption-reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
old=json.loads((R/'evidence/markov-55cf20d2/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(old)+'\n')
for a,b in [('validate_55cf20d2.py','validate_eb6a9001.py'),('audit_55cf20d2.py','audit_eb6a9001.py'),('ReplayIsolatedM55C.lean','ReplayIsolatedMEB6.lean')]:
 s=(R/'research'/a).read_text().replace('55cf20d2','eb6a9001').replace('ReplayIsolatedM55C','ReplayIsolatedMEB6').replace("('M55C','M55C')","('M55C','MEB6')").replace('endsWith "M55C" || n.toString.endsWith "M55C"','endsWith "M55C" || n.toString.endsWith "MEB6"')
 (R/'research'/b).write_text(s)
caps=dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Higher-priority policy denies .scratch. Unique durable research/evidence files used.',sympy=importlib.util.find_spec('sympy') is not None)
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps(out));print(json.dumps(caps));print(json.dumps(dict(compiled=list(latest),unfinished=list(rec['unfinished_items']))))
