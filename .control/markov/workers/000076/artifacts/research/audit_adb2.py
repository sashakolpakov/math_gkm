"""Machine-authored audit inventory; not an independent completion audit."""
from pathlib import Path
import re,json
R=Path('research');O=Path('evidence/markov-adb2c7b0')
files=sorted(p for p in R.glob('Markov*ADB2.lean') if 'Audit' not in p.name)
decl=[]
for p in files:
 s=p.read_text()
 assert not re.search(r'\b(sorry|admit|native_decide)\b',s),p
 assert not re.search(r'^\s*axiom\b',s,re.M),p
 decl += [(p.stem,n) for n in re.findall(r'^theorem\s+(\w+)',s,re.M)]
s=''.join('import '+p.stem+'\n' for p in files)
s+='/-! Machine-authored complete new theorem axiom inventory, request adb2c7b0. -/\n'
s+='\n'.join('#print axioms MathGKM.Markov.'+n for _,n in decl)+'\n'
(R/'MarkovAuditADB2.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=[p.stem for p in files],theorems=decl),indent=2)+'\n')
print(json.dumps(dict(modules=len(files),theorems=len(decl))))
