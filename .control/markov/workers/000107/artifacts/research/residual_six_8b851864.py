"""Machine-authored exact root residual retaining every unsolved obligation."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');D=R/'research'
s=(D/'MarkovResidualM8B8.lean').read_text().replace('import MarkovFourthAllM8B8','import MarkovFourthSixCompleteM8B8\nimport MarkovOnsetWindowLCM8B8')
for old,new in [('SolvedFourthRegionM8B8','SolvedFourthRegionSixM8B8'),('InteriorCore63M8B8','InteriorCore63SixM8B8'),('root_iff_coreM8B8','root_iff_coreSixM8B8')]:s=s.replace(old,new)
s=s.replace('path=List.replicate n true++false::rest ∧ 7≤n','path=List.replicate n true++false::rest ∧ 6≤n')
s=s.replace('run_fourth_allM8B8 n rest hn hc','run_fourth_ge_sixM8B8 n rest hn hc')
m='MarkovResidualSixM8B8';p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
# Extend the exact residual to omit the proved short-onset window as well.
s=s.replace('import MarkovResidualM253','import MarkovResidualM253')
s=s.replace('SolvedFourthRegionSixM8B8','SolvedFourthRegionWindowM8B8').replace('InteriorCore63SixM8B8','InteriorCore63WindowM8B8').replace('root_iff_coreSixM8B8','root_iff_coreWindowM8B8')
s=s.replace(' ∃ n rest, path=List.replicate n true++false::rest ∧ 6≤n ∧\n  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4',' (∃ n rest, path=List.replicate n true++false::rest ∧ 6≤n ∧\n  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4) ∨\n (∃ n rest, path=List.replicate n true++false::rest ∧ 3≤n ∧\n  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4 ∧\n  2*n<j ∧ j≤2*n+5 ∧ n+5≤j ∧ j≤3*n+1)')
s=s.replace('   · obtain ⟨n,rest,hpath,hn,hc,hdiag⟩ := he\n     subst path\n     exact run_fourth_ge_sixM8B8 n rest hn hc i j h0 h1 h2 hdiag','   · rcases he with he | he\n     · obtain ⟨n,rest,hpath,hn,hc,hdiag⟩ := he\n       subst path\n       exact run_fourth_ge_sixM8B8 n rest hn hc i j h0 h1 h2 hdiag\n     · obtain ⟨n,rest,hpath,hn,hc,hdiag,hj,hju,hlo,hhi⟩ := he\n       subst path\n       exact source_fourth_onset_windowM8B8 n rest hn hc i j hj hju hlo hhi hdiag')
m='MarkovResidualWindowM8B8';p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
print('Generated exact residual candidates for n>=6 and the additional source onset window.')
