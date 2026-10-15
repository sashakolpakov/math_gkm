"""Machine-authored audit inventory, only successfully compiled final source bytes."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-53d5229e'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[dict(json.loads(p.read_text()),receipt=str(p.relative_to(R))) for p in O.glob('run-*.json')]
mods=[];names=[];excluded=[]
for p in sorted((R/'research').glob('*53D.lean')):
 if p.stem in ['MarkovAudit53D','MarkovInheritedAudit53D']:continue
 if not any(d.get('mode')=='build' and d.get('returncode')==0 and d.get('source')==str(p.relative_to(R)) and d.get('sha256')==sha(p) for d in runs):
  excluded.append(p.stem);continue
 mods.append(p.stem);names.extend((p.stem,n) for n in re.findall(r'^theorem\s+(\w+)',p.read_text(),re.M))
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=names,excluded=excluded),indent=2)+'\n')
(R/'research/MarkovAudit53D.lean').write_text(''.join(f'import {m}\n' for m in mods)+'\n'+''.join(f'#print axioms MathGKM.Markov.{n}\n' for _,n in names))
print(json.dumps(dict(modules=len(mods),theorems=len(names),excluded=excluded)))
