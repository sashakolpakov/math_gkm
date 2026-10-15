"""Machine-authored exact six-chamber specialization of saved candidate numerators."""
from generate_split_fa9eb434 import *
rows=[P({tuple(k):F(v) for k,v in row['numerator']}) for row in json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']]
params=[['0','0','0','0'],['0','0','0','(4*R-C)*x^5'],['0','3*R-C','0','(C-2*R)*x^5'],['2*R-C','C-R','0','2*(2*R-C)*x^6'],['2*R-C','C-R','3*R-2*C','2*(C-R)*x^6'],['2*R-C','C-R','3*R-2*C','2*(C-R)*x^6+(4*R-3*C)*x^7']]
mods=[]
for ch,row in enumerate(rows):
 text='import MarkovFullCoeff0FA\nimport MarkovFullCoeff1FA\nimport MarkovFullCoeff2FA\nimport MarkovFullCoeff3FA\nimport MarkovFullCoeff4FA\n'+header
 q,t,u,corr=params[ch]
 for k in range(5):
  p=split(row,k)
  if k<2:
   assert p==hs[k]
   continue
  text+=definition(f'chamberH{ch}{k}FA',p,'N C R x')
  text+=f'''\ntheorem chamberH{ch}{k}FA_eq {{A : Type*}} [CommRing A] (N C R x : A) :
 fullH{k}FA N C R ({q}) ({t}) ({u}) x'''+(' + 96*(1-x)^8*('+corr+')' if k==4 else '')+f'''=chamberH{ch}{k}FA N C R x := by
 unfold fullH{k}FA chamberH{ch}{k}FA
 ring
'''
 text+=f'''\ndef chamberNumerator{ch}FA {{A : Type*}} [CommRing A] (N Z C R x : A) : A :=
 fullH0FA N C R 0 0 0 x+Z*fullH1FA N C R 0 0 0 x+
 Z^2*chamberH{ch}2FA N C R x+Z^3*chamberH{ch}3FA N C R x+Z^4*chamberH{ch}4FA N C R x
'''
 module=f'MarkovFullChamber{ch}FA';mods.append(module);(R/f'research/{module}.lean').write_text(text+end)
(O/'chamber-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
print(dict(chambers=len(mods),saved_candidate_terms=[len(x) for x in rows],first_two_shift_coefficients_exactly_shared=True))
