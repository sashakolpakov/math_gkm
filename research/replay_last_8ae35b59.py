"""Machine-authored final wave, excluding the already running second-audit inventory."""
from pathlib import Path
import json,subprocess,sys
from validate_8ae35b59 import R,O,sha,env
old=json.loads((O/'MarkovSecondAuditM8AE-inventory.json').read_text())['modules']
mods={}
for p in O.glob('run-*.json'):
 d=json.loads(p.read_text())
 if d.get('mode')!='build' or d.get('returncode')!=0 or 'Audit' in d['source']:continue
 m=Path(d['source']).stem
 if m not in old and sha(R/d['source'])==d['sha256']:mods[m]=d['sha256']
(O/'last-wave-input.json').write_text(json.dumps(mods,indent=2)+'\n')
print('Last wave:',len(mods),flush=True)
if mods:
 x=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/replay_8ae35b59.py'),*sorted(mods)],cwd=R,env=env)
 sys.exit(x.returncode)
