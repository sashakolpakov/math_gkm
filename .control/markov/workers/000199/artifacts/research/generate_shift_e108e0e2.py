"""Machine-authored new generalized identities, preserving inherited sources."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovMiddleParameterM99A.lean').read_text()
s=s[s.index('theorem middle_gain_parameterM99A'):s.index('\nend\nend MathGKM.Markov')]
for n in ['middle_gain_parameter','middle_correction_parameter','middle_correction_diagonal']:
 s=s.replace(n+'M99A',n+'ME10')
s=s.replace('(hq : k+2 ≤ q)','(hq : k ≤ q)')
(R/'MarkovCorrectionParameterME10.lean').write_text('import MarkovCorrectionPositiveSumM80F\n/-! Machine-authored e108e0e2. Weaker exact parameter hypotheses. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 8000000\n'+s+'\nend\nend MathGKM.Markov\n')
s=(R/'MarkovTopSumMB3E.lean').read_text()
s=s[s.index('theorem top_delta_parameterMB3E'):s.index('theorem top_diagonal_sumMB3E')]
for n in ['top_delta_parameter','top_template_parameter','top_diagonal_equation']:
 s=s.replace(n+'MB3E',n+'ME10')
s=s.replace('(ht : t ≤ n)','(ht : t ≤ n+2)')
(R/'MarkovTopParameterME10.lean').write_text('import MarkovTopFiveFormulaME87\n/-! Machine-authored e108e0e2. Exact template recurrence through central offsets. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial Finset\nset_option maxHeartbeats 8000000\nattribute [local irreducible] topDiagonalDeltaMB3E topTemplateMB3E\n'+s+'\nend\nend MathGKM.Markov\n')
