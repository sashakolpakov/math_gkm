"""Machine-authored request 762ebbaeac124186a32c169420cce484; preserve prior evidence."""
from pathlib import Path
import json, hashlib, re, shutil, sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-762ebbae'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-9fc35bc5'
manifest=json.loads((old/'manifest.json').read_text())
errors=[p for p,h in manifest.items() if not (R/p).is_file() or sha(R/p)!=h]
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={p:sha(R/p)==d['sha256'] for p,d in inh.items()}
w=R/'.control/markov/workers/000122'
receipt=json.loads((w/'receipt.json').read_text())
events=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]
out=dict(inherited_index=ic,artifact_count=len(manifest),artifact_errors=errors,
 latest_worker_outcome=receipt.get('outcome'),event_count=len(events),event_log_sha256=sha(w/'events.jsonl'),last_events=events[-3:],
 finding='Latest worker completed. Earlier interrupted workers reconciled by worker 122. Reuse only hash-checked successful modules; copy pending candidates to unique names.')
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
assert not errors and all(ic.values())
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']
files += [p for p in (R/'research').iterdir() if p.is_file() and p.suffix in ('.lean','.md','.py')]
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by developer permission profile; not accessed.',hosted_web='Publisher retrieved.',disk_free=shutil.disk_usage(R).free),indent=2)+'\n')
for kind in ('validate','audit','schedule','validate_selected'):
 s=(R/f'research/{kind}_9fc35bc5.py').read_text().replace('9fc35bc5','762ebbae').replace('M9FC','M762')
 (R/f'research/{kind}_762ebbae.py').write_text(s)
s=(R/'research/ReplayIsolatedM9FC.lean').read_text().replace('M9FC','M762')
(R/'research/ReplayIsolatedM762.lean').write_text(s)
inv=json.loads((old/'compiled-inventory.json').read_text())
needed=set()
def visit(m):
 if m in needed or m in inv:return
 p=R/'research'/f'{m}.lean'
 if not p.is_file() or 'M9FC' not in m:return
 needed.add(m)
 for n in re.findall(r'^import (\w+)',p.read_text(),re.M):visit(n)
for m in ('MarkovThirdAllhigh_1_4M9FC','MarkovThirdAllhigh_2_1M9FC'):visit(m)
names={m:m.replace('M9FC','M762') for m in needed}
decls={}
for m in needed:
 for n in re.findall(r'^(?:theorem|def|abbrev)\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M):
  decls[n]=n.replace('M9FC','M762')
renames={**names,**decls}
pat=re.compile(r'\b('+ '|'.join(map(re.escape,sorted(renames,key=len,reverse=True)))+r')\b')
for m,n in names.items():
 s=pat.sub(lambda z:renames[z.group()],(R/'research'/f'{m}.lean').read_text())
 (R/'research'/f'{n}.lean').write_text('/- Machine-authored 762ebbae: inherited pending certificate, uniquely renamed. -/\n'+s)
(O/'pending-plan.json').write_text(json.dumps(names,indent=2)+'\n')
print(json.dumps(dict(verified_artifacts=len(manifest),new_candidates=len(names))))
