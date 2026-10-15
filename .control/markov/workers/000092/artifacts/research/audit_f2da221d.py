"""Machine-authored axiom audit inventory bound to current successful builds."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f2da221d'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[json.loads(p.read_text()) for p in O.glob('run-*.json')]
mods=[];excluded=[];names=[]
for p in sorted((R/'research').glob('Markov*F2.lean')):
 if p.stem=='MarkovAuditF2':continue
 good=any(x.get('source')==str(p.relative_to(R)) and x.get('sha256')==sha(p) and x.get('mode')=='build' and x.get('returncode')==0 for x in runs)
 if good:
  mods.append(p.stem)
  names += [(p.stem,n) for n in re.findall(r'^theorem (\w+)',p.read_text(),re.M)]
 else:excluded.append(p.stem)
text=''.join('import '+m+'\n' for m in mods)+'/-! Machine-authored f2da221d axiom-closure audit. -/\n'
text+=''.join('#print axioms MathGKM.Markov.'+n+'\n' for _,n in names)
(R/'research/MarkovAuditF2.lean').write_text(text)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=names,excluded=excluded),indent=2)+'\n')
print(dict(modules=len(mods),theorems=len(names),excluded=excluded))
