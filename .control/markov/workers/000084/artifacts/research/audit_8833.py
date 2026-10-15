"""Machine-authored audit inventory generation, no admission claim."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8833a0fb'
mods=['MarkovTwoTail8833','MarkovTwoCoefficients8833','MarkovTwoSource8833','MarkovThreeGaps8833','MarkovThreeExtract8833','MarkovThreeBridge8833','MarkovThirdGlobal8833','MarkovResidual8833','MarkovDiagonalCore8833']
thms=[(m,n) for m in mods for n in re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M)]
s='\n'.join('import '+m for m in mods)+'\n/-! Machine-authored 8833a0fb axiom inspection. -/\n'
s+='\n'.join('#print axioms MathGKM.Markov.'+n for _,n in thms)+'\n'
(R/'research/MarkovAudit8833.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=thms),indent=2)+'\n')
print(len(thms))
