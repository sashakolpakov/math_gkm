"""Machine-authored exact residual update; no weakening of the pinned root."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');p=R/'research/MarkovResidualSmallM042.lean'
s=p.read_text().replace('import MarkovBlockSmallM042','import MarkovBlockSmallM042\nimport MarkovOnsetSourceM96')
for name in ['InitialFourthRegion','InteriorCore63','root_iff_core']:
 s=s.replace(name+'SmallM042',name+'OnsetM96')
s=s.replace('Machine-authored 04290504','Machine-authored 96dea62b')
s=s.replace('∨ ∃ k, (frame rest).mid.a≤3 ∧ j=n+k ∧ 5≤k ∧ k≤n)', '∨\n     (∃ k, (frame rest).mid.a≤3 ∧ j=n+k ∧ 5≤k ∧ k≤n) ∨\n     ∃ k, j=n+k ∧ 4≤n ∧ 1≤k ∧ k≤4)')
s=s.replace('⟨k,hr,he,hk,hkn⟩','⟨k,hr,he,hk,hkn⟩|⟨k,he,hn,hk,hk4⟩')
s=s.replace('source_fourth_block_smallM042','source_fourth_block_smallM042')
s=s.replace('   · exact hd i j h0 h1 h2 ht hs hb hx he', '''     · subst j
       exact source_fourth_onsetM96 n rest hc hn i k hk hk4 hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx he''')
out=R/'research/MarkovResidualOnsetM96.lean'
if out.exists():
 assert out.read_text()==s, 'Existing source differs; do not overwrite'
 print('generator reproduces current source exactly')
else:
 out.write_text(s)
 print('residual draft generated')
