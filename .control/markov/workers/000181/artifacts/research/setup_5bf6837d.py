"""Machine-authored live request 5bf6837d0c5b4b818f68c99f57ad498a."""
from pathlib import Path
import hashlib,json,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-5bf6837d'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
prev=json.loads((R/'evidence/markov-1c65a306/manifest.json').read_text())
inputs={str(p.relative_to(R)):sha(p) for base in ['research','evidence','MathGKM'] for p in (R/base).rglob('*') if p.is_file() and O not in p.parents and p.suffix in ['.lean','.py','.md','.json','.toml']}
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
out=dict(request_id='5bf6837d0c5b4b818f68c99f57ad498a',bindings={p:sha(R/p)==v['sha256'] for p,v in inh.items()},predecessor_artifacts=len(prev),predecessor_mismatches=[p for p,h in prev.items() if sha(R/p)!=h],root_sha256=sha(R/'MathGKM/Markov.lean'),input_count=len(inputs),stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
p=R/'.control/markov/workers/000171/events.jsonl'
events=[json.loads(x) for x in p.read_text().splitlines()]
prior=json.loads((R/'evidence/markov-1c65a306/interruption-reconciliation.json').read_text())
man=json.loads((R/'evidence/markov-c3e5369f/manifest.json').read_text())
rec=dict(raw_events_sha256=sha(p),matches_predecessor=sha(p)==prior['raw_events_sha256'],event_count=len(events),last_events=events[-4:],artifacts=len(man),mismatches=[p for p,h in man.items() if sha(R/p)!=h],decision='Raw final events show completed finalization then report transport capacity failure. Retain all effects; no replay of interrupted mutation.')
(O/'interruption-reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
old=json.loads((R/'evidence/markov-1c65a306/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-1c65a306')+':'+old)+'\n')
for a,b in [('validate_1c65a306.py','validate_5bf6837d.py'),('audit_1c65a306.py','audit_5bf6837d.py'),('ReplayIsolatedM1C6.lean','ReplayIsolatedM5BF.lean')]:
 (R/'research'/b).write_text((R/'research'/a).read_text().replace('1c65a306','5bf6837d').replace('M1C6','M5BF'))
caps=dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Developer denies .scratch; durable unique research/evidence files used.',sympy=__import__('importlib.util',fromlist=['find_spec']).find_spec('sympy') is not None)
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps(out));print(json.dumps(caps));print(json.dumps(events[-2:]))
