"""Machine-authored request f8ca2c8b49254c66801ae80a511a68c4; research only."""
from pathlib import Path
import json,hashlib,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f8ca2c8b'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'evidence/markov-762ebbae'
manifest=json.loads((old/'manifest.json').read_text())
errors=[p for p,h in manifest.items() if not (R/p).is_file() or sha(R/p)!=h]
inh=json.loads((R/'.control/markov/inherited.json').read_text())
checks={p:sha(R/p)==d['sha256'] for p,d in inh.items()}
w=R/'.control/markov/workers/000123'
receipt=json.loads((w/'receipt.json').read_text())
events=[json.loads(s) for s in (w/'events.jsonl').read_text().splitlines()]
(O/'reconciliation.json').write_text(json.dumps(dict(artifact_count=len(manifest),errors=errors,inherited=checks,latest_outcome=receipt.get('outcome'),events_sha256=sha(w/'events.jsonl'),last_events=events[-2:],finding='Worker 123 completed; its reconciliation explicitly covered interrupted worker 121. No uncertain latest effect to replay.'),indent=2)+'\n')
assert not errors and all(checks.values())
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']
files += [p for p in (R/'research').iterdir() if p.is_file() and p.suffix in ('.lean','.md','.py')]
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
(O/'inherited-lean-path.json').write_text(json.dumps(str(old)+':'+json.loads((old/'inherited-lean-path.json').read_text()))+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by developer permission profile; not accessed.',shell_heredoc='Failed because zsh attempted a denied temporary file; using persistent uniquely named research scripts.',hosted_web='Publisher retrieved.',disk_free=shutil.disk_usage(R).free),indent=2)+'\n')
for kind in ('validate','audit','schedule','validate_selected'):
 s=(R/f'research/{kind}_762ebbae.py').read_text().replace('762ebbae','f8ca2c8b').replace('M762','MF8')
 (R/f'research/{kind}_f8ca2c8b.py').write_text(s)
s=(R/'research/ReplayIsolatedM762.lean').read_text().replace('M762','MF8')
(R/'research/ReplayIsolatedMF8.lean').write_text(s)
print(json.dumps(dict(verified_artifacts=len(manifest),prior_inputs=len(files))))
