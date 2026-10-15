"""Machine-authored 00a02b28. Source adapters; build only after dependencies pass."""
from pathlib import Path
import re
R=Path('/Users/sasha/math_gkm/research')
for ch in range(6):
 s=(R/f'MarkovOnsetAdapter{ch}M1B.lean').read_text()
 s=s.replace(f'import MarkovOnsetChamberGaps{ch}M1B', '\n'.join(f'import MarkovOnsetColumns{ch}_{k}M00' for k in range(1,6))+f'\nimport MarkovOnsetSixSource{ch}M1B')
 # The sixth position is inherited and checked. Do not rely on its unbuilt candidate.
 a=s.index(f'\ntheorem source_fourth_onset{ch}_6M1B')
 b=s.index(f'\ntheorem source_fourth_onset_chamber{ch}M1B',a)
 s=s[:a]+s[b:]
 s=s.replace(f'exact source_fourth_onset{ch}_6M1B n rest hn hc hl hu i hs',f'simpa only [show 3*n+6+2=3*n+8 by omega,show 3*n+6+1=3*n+7 by omega] using source_fourth_onset_six{ch}M1B n rest hn hc hl hu i hs')
 for name in re.findall(r'^theorem (\w+)',s,re.M):s=re.sub(r'\b'+name+r'\b',name.replace('M1B','M00'),s)
 s=re.sub(r'(onset_columns_lc\d_\d)M1B',r'\1M00',s)
 s=s.replace('Machine-authored 1b02dddc','Machine-authored 00a02b28; adapted source transport')
 (R/f'MarkovOnsetAdapter{ch}M00.lean').write_text(s)
for m in ['MarkovOnsetAll','MarkovFourthAfterMiddle']:
 s=(R/f'{m}M1B.lean').read_text().replace('M1B','M00').replace('Machine-authored 1b02dddc','Machine-authored 00a02b28')
 (R/f'{m}M00.lean').write_text(s)
s=(R/'MarkovFourthMiddleSixM1B.lean').read_text().replace('MarkovFourthFinalSixM1B','MarkovFourthAfterMiddleM00').replace('RunFourthMiddleSixM1B','RunFourthMiddleM00').replace('run_fourth_iff_middle_sixM1B','run_fourth_iff_middleM00').replace('j<3*n+6','j≤3*n').replace('3*n+6≤j','3*n<j').replace('source_fourth_final_sixM1B','source_fourth_after_middleM00').replace('Machine-authored 1b02dddc','Machine-authored 00a02b28')
(R/'MarkovFourthMiddleM00.lean').write_text(s)
s=(R/'MarkovResidualSixM1B.lean').read_text().replace('MarkovFourthFinalSixM1B','MarkovFourthAfterMiddleM00').replace('FinalFourthRegionSixM1B','FinalFourthRegionM00').replace('InteriorCore63SixM1B','InteriorCore63M00').replace('root_iff_core_sixM1B','root_iff_coreM00').replace('3*n+6≤j','3*n<j').replace('source_fourth_final_sixM1B','source_fourth_after_middleM00').replace('Machine-authored 1b02dddc','Machine-authored 00a02b28')
(R/'MarkovResidualM00.lean').write_text(s)
print('Prepared six source adapters, all-chamber theorem, final interval and exact residuals. Not yet validated.')
