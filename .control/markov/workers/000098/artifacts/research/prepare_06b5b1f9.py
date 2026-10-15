"""New drafts only; inherited sources remain untouched."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
opaque='attribute [local irreducible] fullH0FA fullH1FA fullH2FA fullH3FA fullH4FA\n'
for k in range(2):
 s=(R/f'MarkovFullSourceChamber{k}FA.lean').read_text()
 s=s.replace('fa9eb434','06b5b1f9').replace(f'chamber{k}FA',f'chamber{k}M06').replace(f'chamber{k}_',f'chamber{k}_')
 # Rename only new theorems, keeping imported polynomial definitions.
 s=s.replace(f'chamber{k}_clearedFA',f'chamber{k}_clearedM06').replace(f'chamber{k}_coeffFA',f'chamber{k}_coeffM06')
 s=s.replace('open Polynomial\n','open Polynomial\n'+opaque+f'attribute [local irreducible] chamberH{k}2FA chamberH{k}3FA chamberH{k}4FA\n')
 (R/f'MarkovFullSourceChamber{k}M06.lean').write_text(s)
s=(R/'MarkovFullCoefficientLCFA.lean').read_text().replace('fa9eb434','06b5b1f9').replace('fullFourthValueFA','fullFourthValueM06').replace('fullFourthValue_sourceFA','fullFourthValue_sourceM06').replace('source_fourth_full_lc_iffFA','source_fourth_full_lc_iffM06')
s=s.replace('open Polynomial\n','open Polynomial\n'+opaque+'attribute [local irreducible] fullNumeratorFA coeff frame\n')
(R/'MarkovFullCoefficientLCM06.lean').write_text(s)
