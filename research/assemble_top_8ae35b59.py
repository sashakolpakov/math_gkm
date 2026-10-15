"""Machine-authored 8ae35b59: separately usable top-predecessor result candidate."""
from pathlib import Path
D=Path('/Users/sasha/math_gkm/research')
s=(D/'MarkovMiddleOneM5DC.lean').read_text()
s=s.replace('import MarkovMiddleLowDirectM722','import MarkovMiddleHighDirectM8AE')
s=s.replace('722898f8. The predecessor numerator-one subfamily.','8ae35b59. The predecessor numerator c-1 subfamily.')
s=s.replace('middleRawValue_one_lcM5DC','middleRawValue_top_lcM8AE').replace('source_fourth_middle_oneM5DC','source_fourth_middle_topM8AE')
s=s.replace('middleRawValueM722 n c 1','middleRawValueM722 n c (c-1)')
s=s.replace('middle_low_directM722','middle_high_directM8AE')
s=s.replace('have ec : c-5+5=c := by ring','have ec : c-5+5=c := by ring\n have er : c-5+4=c-1 := by ring')
s=s.replace('[ej,ej1,ej2,en,ec]','[ej,ej1,ej2,en,ec,er]')
s=s.replace('if_pos (by omega : 2*(1:ℤ)<c)','if_neg (by omega : ¬2*(c-1)<c)')
s=s.replace('(hr : (frame rest).mid.a=1)','(hr : (frame rest).mid.a+1=(frame rest).mid.b)')
s=s.replace(' rw [hr] at h0 h1 h2',' have er : ((frame rest).mid.b:ℤ)-1=(frame rest).mid.a := by omega\n rw [er] at h')
p=D/'MarkovMiddleTopM8AE.lean';assert not p.exists();p.write_text(s)
p=D/'MarkovFourthTopM8AE.lean';assert not p.exists();p.write_text('''import MarkovMiddleTopM8AE
import MarkovFourthCentralM253
/-! Machine-authored 8ae35b59. Top-predecessor fourth slice; exact scope. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem run_fourth_topM8AE (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hr : (frame rest).mid.a+1=(frame rest).mid.b) : RunFourthLCM94 n rest := by
 apply (run_fourth_iff_centralM253 n rest hn hc).mpr
 intro i j _ _ _ hs hj hju
 exact source_fourth_middle_topM8AE n rest hc hr i j hj hju hs
end
end MathGKM.Markov
''')
print('Created separately usable top-predecessor source candidates.')
