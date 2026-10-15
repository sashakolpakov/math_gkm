"""Machine-authored exact residual adaptation, retaining the protected root."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovResidualOnsetM96.lean').read_text()
s=s.replace('import MarkovBlockSmallM042','import MarkovBlockSourceM806')
s=s.replace('Machine-authored 96dea62b','Machine-authored 8067e0c5')
s=s.replace('InitialFourthRegionOnsetM96','InitialFourthRegionM806')
s=s.replace('InteriorCore63OnsetM96','InteriorCore63M806').replace('root_iff_coreOnsetM96','root_iff_coreM806')
s=s.replace('(frame rest).mid.a≤3 ∧ j=n+k','j=n+k')
s=s.replace('⟨k,hr,he,hk,hkn⟩','⟨k,he,hk,hkn⟩')
s=s.replace('source_fourth_block_smallM042 n rest hc hr','source_fourth_blockM806 n rest hc')
p=R/'research/MarkovResidualM806.lean';assert not p.exists();p.write_text(s)
