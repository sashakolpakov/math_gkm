"""Machine-authored new modules extending the same exact recurrence to crossing rows.
Inherited files are read only; only new suffixed declarations are generated.
"""
from pathlib import Path
p=Path('research/MarkovMiddleCorrectionM99A.lean').read_text()
s=p[p.index('theorem source_middle_formulaM99A'):p.rindex('\nend\nend')]
s=s.replace('source_middle_formulaM99A','source_middle_crossing_formulaM50C')
s=s.replace('(hk : k ≤ q)', '(hk : k ≤ q+(if r then 1 else 2))')
s=s.replace('(hl : l ≤ q)', '(hl : l ≤ q+(if r then 1 else 2))')
# The arithmetic fact q<=j+1 is now at its exact endpoint.
s=s.replace(' have hindex', ' have hnExact : sourceNME9C q r=3*q+(if r then 1 else 2) := rfl\n have hindex')
header='''import MarkovMiddleLocalityM99A
/-! Machine-authored 50c262c5. Exact extension through j=q-1, retaining
the full signed middle correction and both residue classes. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

'''
Path('research/MarkovMiddleCrossingM50C.lean').write_text(header+s+'\nend\nend MathGKM.Markov\n')
p=Path('research/MarkovMiddleLocalityM99A.lean').read_text()
s=p[p.index('theorem middle_gain_degreeM99A'):p.rindex('\nend\nend')]
s=s.replace('middle_gain_degreeM99A','middle_gain_crossing_degreeM50C')
s=s.replace('middle_correction_degreeM99A','middle_correction_crossing_degreeM50C')
s=s.replace('source_middle_high_coeffM99A','source_middle_crossing_highM50C')
s=s.replace('source_middle_formulaM99A','source_middle_crossing_formulaM50C')
s=s.replace('(hk : k ≤ q)', '(hk : k ≤ q+(if r then 1 else 2))')
s=s.replace('(hl : l ≤ q)', '(hl : l ≤ q+(if r then 1 else 2))')
Path('research/MarkovMiddleCrossingDegreeM50C.lean').write_text(header.replace('import MarkovMiddleLocalityM99A','import MarkovMiddleCrossingM50C')+s+'\nend\nend MathGKM.Markov\n')
print('Generated two new sources; not yet validated.')
