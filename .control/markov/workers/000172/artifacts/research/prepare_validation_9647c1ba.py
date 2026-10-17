"""Machine-authored 9647c1ba. Select current mathematical sources for replay."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9647c1ba'
mods=['MarkovRobustCutM964','MarkovTwinKernelM964','MarkovThirdMarginCertificateM964',
 'MarkovThirdOutputM964','MarkovThirdMarginsM964','MarkovThirdHighM964','MarkovThirdColumnsBaseM964',
 *[f'MarkovThirdColumn{i}M964' for i in range(2,12)],
 *[f'MarkovThirdGap{i}M964' for i in range(2,10)],'MarkovThirdSmallM964','MarkovThirdClosedM964','MarkovLiftBudgetM964',
 'MarkovCorrectionBudgetM964','MarkovFactoredRowM964']
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
(O/'source-visit.json').write_text(json.dumps({'url':'https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',
 'transport':'hosted web','date':'2026-10-17','sections':['(5)','(7)-(11)','Definitions 6.1-6.2','Conjecture 6.3'],
 'role':'Scope/correspondence only; retrieved text adds no mathematical axioms.'},indent=2)+'\n')
print(' '.join(mods))
