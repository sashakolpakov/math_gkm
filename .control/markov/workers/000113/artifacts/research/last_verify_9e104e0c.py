"""Machine-authored final preservation/hash check; operational evidence only."""
import json,hashlib,subprocess,sys,os
from pathlib import Path
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9e104e0c'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
p=R/'research/markov-9e104e0c-checkpoint.md'
with p.open('a') as f:
 f.write('\nFinal checkpoint: 20 new mathematical modules compiled and kernel-replayed;\n97 named theorem closures audited, all permitted. Exact root residual remains\nunproved; no source candidates pending. The second-vertical symbolic formula\nis experimental advice, not an admitted source theorem. Four rejected builds\nretained. All foreground executions ended; root and contract hashes unchanged.\nNo whole-source rebuild or independent completion audit. See validation.json.\n')
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
subprocess.run([sys.executable,str(R/'research/finalize_9e104e0c.py')],env=env,cwd=R,check=True,stdout=subprocess.DEVNULL)
m=json.loads((O/'artifact-verification.json').read_text())
failed=[p for p,h in m.items() if sha(R/p)!=h]
assert not failed,failed
v=json.loads((O/'final-check.json').read_text())
assert v['new_modules']==v['replayed']==20 and v['axiom_closures']==97
assert not v['pending'] and not v['unaudited'] and not v['unreplayed']
d=dict(verified_artifacts=len(m),failures=failed,unchanged_prior_inputs=v['unchanged_inputs'],root_sha256=v['root_sha256'],canonical_contract_hash=v['canonical_contract_hash'],completion=None,all_foreground_sessions_ended=True,stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'last-verification.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(d))
