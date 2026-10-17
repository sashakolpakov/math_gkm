"""Machine-authored live request 2c6e5ef091f448a7af8d427ae6c3dfc5.
Read-only reconciliation and new evidence initialization; no controller calls.
"""
from pathlib import Path
import hashlib,json,os,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-2c6e5ef0'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prior=json.loads((R/'evidence/markov-9c28b628/manifest.json').read_text())
bad=[p for p,h in prior.items() if sha(R/p)!=h]
events=R/'.control/markov/workers/000207/events.jsonl'
lines=events.read_text().splitlines()
last=json.loads(lines[-1])
inherited=json.loads((R/'.control/markov/inherited.json').read_text())
ibad=[p for p,d in inherited.items() if hashlib.sha256(d['content'].encode()).hexdigest()!=d['sha256']]
out=dict(predecessor='000207',artifacts=len(prior),mismatches=bad,
 raw_events_sha256=sha(events),event_lines=len(lines),last_event=last,
 inherited_index_sha256=sha(R/'.control/markov/inherited.json'),inherited_binding_failures=ibad,
 reconciliation='Predecessor completed. Existing effects retained; no side effect replayed.',
 denied_scratch='Higher-priority policy denies .scratch; durable new evidence paths used instead.',
 failures=['zsh here-document temporary-file creation denied; switched to apply_patch and Python -c.',
 'Guessed research/markov-9c28b628-run.py and research/MarkovRampKernelM9F23.lean absent.'])
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
assert not bad and not ibad
old=json.loads((R/'evidence/markov-9c28b628/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(str(R/'evidence/markov-9c28b628')+':'+old))
inputs={}
for base in ['MathGKM','research','contracts','evidence/independent-markov']:
 for p in (R/base).rglob('*'):
  if p.is_file() and p.suffix in ('.lean','.py','.md','.json'):
   inputs[str(p.relative_to(R))]=sha(p)
for name in ['MISSION.md','docs/DESIGN.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 inputs[name]=sha(R/name)
(O/'input-hashes.json').write_text(json.dumps(inputs,indent=2)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=os.sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='denied, not accessed'),indent=2)+'\n')
print(json.dumps(dict(verified_prior=len(prior),input_files=len(inputs),last_event=last.get('type'),inherited_entries=len(inherited))))
