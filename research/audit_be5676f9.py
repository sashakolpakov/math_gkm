"""Machine-authored audit inventory, compiled separately; never admission."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-be5676f9'
mods=['MarkovFourMomentBE','MarkovFourthRunMomentBE','MarkovFourthOneLocalBE']+[f'MarkovFourthOne{i}BE' for i in range(6)]+['MarkovFourthOneSmallBE','MarkovFourthOneSmallPolyBE','MarkovFourthOneSourceBE','MarkovFourthAllCyclesBE','MarkovResidualBE']
theorems=[]
for m in mods:
 theorems.extend((m,n) for n in re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M))
s=''.join(f'import {m}\n' for m in mods)+'/-! Machine-authored be5676f9 axiom closure audit. -/\n'
s+=''.join(f'#print axioms MathGKM.Markov.{n}\n' for m,n in theorems)
(R/'research/MarkovAuditBE.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=theorems),indent=2)+'\n')
print(json.dumps(dict(modules=len(mods),theorems=len(theorems))))
