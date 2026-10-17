"""Machine-authored 139fed75. Select current mathematical sources for replay."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-139fed75'
mods=['MarkovFibBandM139','MarkovBandGainM139','MarkovBandRecurrenceM139',
 'MarkovBandShapeM139','MarkovBandTransportM139','MarkovBandLinearM139',
 'MarkovBandBudgetCoeffsM139','MarkovBandTopM139','MarkovBandLeadingM139',
 'MarkovFibShiftM139','MarkovBandShiftM139','MarkovBandBoundaryReductionM139',
 'MarkovBandQuadraticM139','MarkovBandBudgetObstructionM139','MarkovBandSourceWitnessM139',
 'MarkovBandSupportM139']
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
(O/'source-visit.json').write_text(json.dumps({'url':'https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',
 'transport':'hosted web','date':'2026-10-17','sections':['(5)','(7)-(11)','Definitions 6.1-6.2','Conjecture 6.3'],
 'role':'Scope/correspondence only; retrieved text adds no mathematical axioms.'},indent=2)+'\n')
print(' '.join(mods))
