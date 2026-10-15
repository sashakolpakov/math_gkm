"""Machine-authored replay of current built modules without a prior source-bound replay."""
from pathlib import Path
import json,subprocess,sys
from validate_8ae35b59 import R,O,sha,env
done={}
for p in O.glob('kernel-union-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0:done.update(d['modules'])
mods={}
for p in O.glob('run-*.json'):
 d=json.loads(p.read_text())
 if d.get('mode')!='build' or d.get('returncode')!=0 or 'Audit' in d['source']:continue
 m=Path(d['source']).stem;h=sha(R/d['source'])
 if h==d['sha256'] and done.get(m)!=h:mods[m]=h
print('Pending replay modules:',len(mods),flush=True)
if mods:
 x=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/replay_8ae35b59.py'),*sorted(mods)],cwd=R,env=env)
 sys.exit(x.returncode)
