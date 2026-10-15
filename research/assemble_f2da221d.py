"""Machine-authored assembly from proved bridges, preserving prior drafts."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovFourthSourceK0B.lean').read_text()
s=s.replace('MarkovFourthBoundaryK0B','MarkovFourthBoundaryF2').replace('MarkovFourthShiftK0B','MarkovShiftProductF2')
s=s.replace('request 0b212317','request f2da221d')
for name in ['source_fourth_conv','source_fourth_initial_all','source_fourth_shift_binomial','fourthLow_convolution_lc']:
 s=s.replace(name+'K0B',name+'F2')
(R/'MarkovFourthSourceF2.lean').write_text(s)
s=(R/'MarkovResidualK0B.lean').read_text()
s=s.replace('MarkovFourthInitialLCK0B','MarkovFourthSourceF2').replace('0b212317','f2da221d')
s=s.replace('InitialFourthRegionK0B','InitialFourthRegionF2').replace('InteriorCore63K0B','InteriorCore63F2').replace('root_iff_coreK0B','root_iff_coreF2')
s=s.replace('∧ 5≤j ∧ j+2<n','∧ j<n').replace('hdiag,hj,hn','hdiag,hj')
s=s.replace('source_fourth_initial_lcK0B n rest hc i j hdiag hj hn','source_fourth_initial_allF2 n rest hc i j hdiag hj')
(R/'MarkovResidualF2.lean').write_text(s)
print('New source and exact residual assembly written.')
