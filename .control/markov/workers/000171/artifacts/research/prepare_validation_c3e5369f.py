"""Machine-authored c3e5369f. Select only this run's compiled mathematical modules."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c3e5369f'
mods=['MarkovSecondRowEquationMC3E','MarkovSecondRowFormulaMC3E','MarkovPerturbKernelMC3E',
 'MarkovPerturbCutsMC3E','MarkovSecondMarginCertificateMC3E','MarkovSecondMarginsMC3E',
 'MarkovSecondOutputMC3E','MarkovSecondColumnsBaseMC3E','MarkovSecondColumnsMC3E',
 'MarkovSecondGapsMC3E','MarkovSecondClosedMC3E','MarkovFibSecondRowMC3E',
 'MarkovThirdRowFormulaMC3E','MarkovThirdEdgeObstructionMC3E']
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
(O/'failed-margin-base5.json').write_text(json.dumps({
 'status':'Rejected sufficient certificate, not a mathematical refutation',
 'observed_stdout':[{'residue':False,'kind':'complete','terms':229,'negative':38,'degrees':[16,12,2]},
 {'residue':False,'kind':'border','terms':107,'negative':12,'degrees':[12,8,1]},
 {'residue':True,'kind':'complete','terms':229,'negative':51,'degrees':[16,12,2]},
 {'residue':True,'kind':'border','terms':107,'negative':17,'degrees':[12,8,1]}],
 'execution':'First execution of generate_margin_c3e5369f.py returned 1 before emitting Lean source.',
 'reconstruction':'Same numerator expressions as final generator, with B=product(j+1,...,j+5)/120+z; final generator uses degree-seven B instead.'},indent=2)+'\n')
(O/'source-visit.json').write_text(json.dumps({'url':'https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',
 'date':'2026-10-17','transport':'hosted web tool','accessed':['(5)','(7)-(11)','Definitions 6.1-6.2','Conjecture 6.3'],
 'role':'Meaning and scope check only; source text not treated as a Lean theorem.'},indent=2)+'\n')
print(' '.join(mods))
