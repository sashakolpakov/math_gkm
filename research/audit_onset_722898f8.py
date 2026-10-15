"""Machine-authored axiom audit source; ordinary Lean #print axioms."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-722898f8'
ms=['MarkovOnsetAdapter4M722','MarkovOnsetAdapter5MAE','MarkovOnsetAllM722','MarkovFourthAfterMiddleM722','MarkovFourthMiddleM722','MarkovResidualM722']+[f'MarkovOnsetColumns{ch}_{k}M00' for ch in [4,5] for k in range(1,6)]
names=[]
for m in ms:names+=re.findall(r'^theorem (\w+)',(R/'research'/f'{m}.lean').read_text(),re.M)
s=''.join(f'import {m}\n' for m in ms)+'/-! Machine-authored 722898f8. Axiom closure inspection. -/\n'+''.join(f'#print axioms MathGKM.Markov.{n}\n' for n in names)
(R/'research/MarkovOnsetAuditM722.lean').write_text(s)
(O/'onset-audit-inventory.json').write_text(json.dumps(dict(modules=ms,declarations=names),indent=2)+'\n')
print(len(names),'declarations queued for closure inspection')
