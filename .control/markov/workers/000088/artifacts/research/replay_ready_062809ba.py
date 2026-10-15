"""Machine-authored foreground replay of current successful sources only."""
from pathlib import Path
import json,hashlib,subprocess,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-062809ba'
inv=json.loads((O/'audit-inventory.json').read_text())
runs=[json.loads(p.read_text()) for p in O.glob('run-*.json')]
groups=[json.loads(p.read_text()) for p in O.glob('kernel-union-*.json')]
mods=[]
for m in inv['modules']+['MarkovAuditK062']:
 p=R/'research'/f'{m}.lean'
 if not p.exists():continue
 h=hashlib.sha256(p.read_bytes()).hexdigest()
 if any(d.get('returncode')==0 and d.get('modules',{}).get(m)==h for d in groups):continue
 if any(d.get('returncode')==0 and d.get('mode')=='build' and d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h for d in runs):mods.append(m)
print(json.dumps(dict(replaying=mods)),flush=True)
if mods:sys.exit(subprocess.run(['/opt/homebrew/bin/python3','research/replay_union_062809ba.py',*mods]).returncode)
