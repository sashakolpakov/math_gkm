"""Machine-authored inventory from successful final-source build receipts."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fddabb33'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[json.loads(p.read_text()) for p in O.glob('run-*.json')]
mods=[];names=[]
for p in sorted((R/'research').glob('*FDDA.lean')):
 if p.stem=='MarkovAuditFDDA':continue
 if not any(d.get('mode')=='build' and d.get('returncode')==0 and d.get('source')==str(p.relative_to(R)) and d.get('sha256')==sha(p) for d in runs):continue
 mods.append(p.stem)
 names.extend((p.stem,n) for n in re.findall(r'^theorem\s+(\w+)',p.read_text(),re.M))
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=names),indent=2)+'\n')
(R/'research/MarkovAuditFDDA.lean').write_text(''.join(f'import {m}\n' for m in mods)+'\n'+''.join(f'#print axioms MathGKM.Markov.{n}\n' for _,n in names))
print(json.dumps(dict(modules=len(mods),theorems=len(names))))
