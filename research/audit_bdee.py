"""Machine-authored all-new-theorem axiom inventory. No root completion claim."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bdee9a64'
modules=['MarkovRunScalarBDEE']+[f'MarkovRunJets{i}BDEE' for i in range(4)]+['MarkovRunFieldBDEE','MarkovThirdClosedBDEE','MarkovShapePartsBDEE']+[f'MarkovShapeGap{i}BDEE' for i in range(7)]+['MarkovShapeLCBDEE','MarkovThirdInteriorTransferBDEE','MarkovShapeBinomialBDEE']
theorems=[]
for m in modules:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide)\b|^\s*axiom\b',s,re.M),m
 theorems.extend((m,n) for n in re.findall(r'^theorem\s+(\w+)',s,re.M))
src=''.join('import '+m+'\n' for m in modules)+'\n/-! Machine-authored local axiom audit; not independent certification. -/\n'
src+=''.join('#print axioms MathGKM.Markov.'+n+'\n' for _,n in theorems)
(R/'research/MarkovAuditBDEE.lean').write_text(src)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=modules,theorems=theorems),indent=2)+'\n')
print(json.dumps(dict(modules=len(modules),theorems=len(theorems))))
