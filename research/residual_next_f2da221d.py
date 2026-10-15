"""Machine-authored exact root residual update; protected root unchanged."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovResidualF2.lean').read_text()
s=s.replace('import MarkovFourthSourceF2','import MarkovFirstShiftSourceF2')
s=s.replace('InitialFourthRegionF2','InitialFourthRegionNextF2').replace('InteriorCore63F2','InteriorCore63NextF2').replace('root_iff_coreF2','root_iff_coreNextF2')
s=s.replace('∧ j<n','∧ (j<n ∨ j=n ∧ 5≤n)')
s=s.replace('     exact source_fourth_initial_allF2 n rest hc i j hdiag hj','     rcases hj with hj|⟨he,hn⟩\n     · exact source_fourth_initial_allF2 n rest hc i j hdiag hj\n     · subst j\n       exact source_fourth_first_shiftF2 n rest hc hn i hdiag')
(R/'MarkovResidualNextF2.lean').write_text(s)
print('New residual candidate written.')
