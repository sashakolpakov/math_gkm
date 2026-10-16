"""Machine-authored final source preservation check. Operational evidence only."""
import json,hashlib,subprocess,sys,os
from pathlib import Path
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-de6168c6'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
subprocess.run([sys.executable,str(R/'research/finalize_de6168c6.py')],env=env,cwd=R,check=True,stdout=subprocess.DEVNULL)
m=json.loads((O/'artifact-verification.json').read_text())
failed=[p for p,h in m.items() if sha(R/p)!=h]
assert not failed,failed
v=json.loads((O/'final-check.json').read_text())
assert v['new_modules']==v['replayed']==22 and v['axiom_closures']==77
assert not v['pending'] and not v['unaudited'] and not v['unreplayed']
d=dict(verified_artifacts=len(m),failures=failed,unchanged_prior_inputs=v['unchanged_inputs'],root_sha256=v['root_sha256'],canonical_contract_hash=v['canonical_contract_hash'],completion=None,all_foreground_sessions_ended=True,stop_file_present=(R/'.control/markov/STOP.json').exists())
(O/'last-verification.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(d))
