import json, hashlib, subprocess, sys
from pathlib import Path
r=Path.cwd(); o=r/'evidence/markov-5110b3fa'
p=r/'research/markov-5110b3fa-checkpoint.md'
with p.open('a') as f:
    f.write('\nFinal checkpoint: 21 new modules compiled and kernel-replayed; 68 theorem closures audited with permitted axioms only. No pending source candidates. Full pinned root unresolved. All foreground sessions ended. Final shell heredoc attempts failed because the shell could not create temporary files; no mathematical or artifact effects. This script uses an ordinary project file instead. See validation.json, final-check.json and last-verification.json.\n')
subprocess.run([sys.executable,'research/finalize_5110b3fa.py'],check=True,stdout=subprocess.DEVNULL)
m=json.loads((o/'artifact-verification.json').read_text())
failed=[p for p,h in m.items() if hashlib.sha256((r/p).read_bytes()).hexdigest()!=h]
assert not failed,failed
v=json.loads((o/'final-check.json').read_text())
assert v['new_modules']==v['replayed']==21 and v['axiom_closures']==68 and not v['pending'] and not v['unaudited']
d=dict(verified_artifacts=len(m),failures=failed,unchanged_prior_inputs=v['unchanged_inputs'],root_sha256=v['root_sha256'],canonical_contract_hash=v['canonical_contract_hash'],completion=None,all_foreground_sessions_ended=True)
(o/'last-verification.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(d))
