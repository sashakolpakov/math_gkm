"""Machine-authored extension of the actual-source adapter; preserves inherited file."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovBackwardTwoSourceM1B.lean').read_text()
s=s.replace('import MarkovBackwardTwoM1B','import MarkovBackwardThreeM5DC').replace('source_fourth_backward_twoM1B','source_fourth_backward_threeM5DC').replace('(hj : 2*n+6≤j)','(hj : n+5≤j)')
start=s.index(' if j≤3*n+6 then');end=s.index(' := by',start)
old=s[start:end]
new=' ('+old.strip()+')+\n ('+old.strip().replace('3*n+6','2*n+5').replace('reflect 14','reflect 13').replace('fullH3FA','fullH2FA')+')'
s=s[:start]+new+s[end:]
start=s.index(' have ht := backward_two_coeffM1B')
end=s.index(' simpa only',start)
s=s[:start]+''' have ht := backward_three_coeffM5DC _ _ _ _ _ _ n j hj hju
   h0d h1d h2d h3d (correctedH4_degreeM94 _ _ _ _ _ _) hh'
'''+s[end:]
p=R/'MarkovBackwardThreeSourceM5DC.lean';assert not p.exists();p.write_text(s)
