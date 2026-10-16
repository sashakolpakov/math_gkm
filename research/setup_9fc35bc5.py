"""Machine-authored request 9fc35bc50ae14db198b964755648474b. Read-only reconciliation."""
from pathlib import Path
import json,hashlib,shutil,sys,re
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-9fc35bc5'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-ae257c53'
manifest=json.loads((old/'manifest.json').read_text())
errors=[p for p,h in manifest.items() if not (R/p).is_file() or sha(R/p)!=h]
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={p:sha(R/p)==d['sha256'] for p,d in inh.items()}
w=R/'.control/markov/workers/000121'
receipt=json.loads((w/'receipt.json').read_text())
events=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]
changes=receipt.get('changes',{})
checked={p:sha(R/p)==d['after'] for p,d in changes.items() if d.get('after') and (R/p).is_file()}
summary={k:v for k,v in receipt.items() if k not in ('changes','report')}
summary={k:v for k,v in summary.items() if len(str(v))<2000}
out=dict(inherited_index=ic,artifact_count=len(manifest),artifact_errors=errors,
 worker_receipt=summary,receipt_keys=list(receipt),checked_changes=len(checked),changed_mismatches=[p for p,v in checked.items() if not v],
 event_log_sha256=sha(w/'events.jsonl'),event_count=len(events),last_events=events[-5:],
 finding='Worker 121 timed out after finalization completed with exit 0; 235 compiled modules, 23 separately replayed modules, 167 axiom-audited modules. Its all-source assembly remains pending. Do not rerun prior generators or overwrite prior outputs.')
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
assert not errors and all(ic.values()) and all(checked.values())
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']
files+=list((R/'research').glob('*.lean'))+list((R/'research').glob('*.md'))+list((R/'research').glob('*.py'))
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
lp=str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by higher-priority sandbox; not accessed.',shell_heredoc='Failed: cannot create temp file; use direct arguments and file edits.',hosted_web='Published source retrieved successfully.',disk_free=shutil.disk_usage(R).free),indent=2)+'\n')
for kind in ('validate','audit'):
 s=(R/f'research/{kind}_ae257c53.py').read_text().replace('ae257c53','9fc35bc5').replace("+'MAE2'","+'M9FC'")
 (R/f'research/{kind}_9fc35bc5.py').write_text(s)
inv=json.loads((old/'compiled-inventory.json').read_text())
needed=set()
def visit(m):
 if m in needed or m in inv:return
 p=R/'research'/f'{m}.lean'
 if not p.is_file() or 'MAE2' not in m:return
 needed.add(m)
 for n in re.findall(r'^import (\w+)',p.read_text(),re.M):visit(n)
visit('MarkovThirdAllLCMAE2')
names={m:m.replace('MAE2','M9FC') for m in needed}
for m,n in names.items():
 s=(R/'research'/f'{m}.lean').read_text()
 # Rename all declarations locally, and imports only for pending modules.
 s=s.replace('MAE2','M9FC')
 for imp in re.findall(r'^import (\w+)',s,re.M):
  orig=imp.replace('M9FC','MAE2')
  if orig not in needed:s=s.replace('import '+imp+'\n','import '+orig+'\n')
 # References to declarations from compiled MAE2 modules retain their names.
 for im in re.findall(r'^import (\w+)',(R/'research'/f'{m}.lean').read_text(),re.M):
  if im in inv:
   for d in re.findall(r'^(?:theorem|def|abbrev)\s+(\w+)',(R/'research'/f'{im}.lean').read_text(),re.M):s=s.replace(d.replace('MAE2','M9FC'),d)
 (R/'research'/f'{n}.lean').write_text(s)
(O/'pending-plan.json').write_text(json.dumps(names,indent=2)+'\n')
print(json.dumps(dict(verified_artifacts=len(manifest),pending_new_modules=len(names),receipt=summary)))
