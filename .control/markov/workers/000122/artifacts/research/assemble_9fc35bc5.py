"""Machine-authored third-remainder cone assembly; generates candidates, not evidence of proof."""
from pathlib import Path
import re
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovThirdAllSourceBoundsM9FC.lean').read_text()
start=s.index('theorem vAllnat_midhigh_0_4M9FC')
end=s.index('theorem vAllnat_midhigh_3_0M9FC')
out='import MarkovThirdHalfBoundsMAE2\n'
out+=''.join('import MarkovThirdAllmidhigh_'+k+'M9FC\n' for k in ['0_4','1_2','2_1'])
out+='''/-! Machine-authored 9fc35bc5. All run lengths, source cone 3*T<2*L. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
'''+s[start:end]+'''
theorem vThirdNat_midhighM9FC (x y : ℕ) (hb : 7≤3*x+2*y) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) := by omega
 rcases h with ⟨hx,hy⟩|⟨hx,hy⟩|⟨hx,hy⟩
 · exact vAllnat_midhigh_0_4M9FC x y hx hy
 · exact vAllnat_midhigh_1_2M9FC x y hx hy
 · exact vAllnat_midhigh_2_1M9FC x y hx hy

theorem vAllbounds_thirdM9FC (a b : ℕ) (ha : 1≤a) (hb : 7≤b) (hc : 3*a<2*b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases h0 : 2*a≤b
 · exact vAllbounds_halfMAE2 a b ha hb h0
 · let x := 2*a-b
   let y := 2*b-3*a
   have ea : a=2*x+y := by dsimp [x,y]; omega
   have eb : b=3*x+2*y := by dsimp [x,y]; omega
   have eq : 2*a-b=x := rfl
   have et : min (b-a) (3*a-b)=x+y := by dsimp [x,y]; omega
   have eu : 3*a-2*b=0 := by omega
   have h := vThirdNat_midhighM9FC x y (by omega) (by dsimp [y]; omega)
   rw [eq,et,eu,ea,eb]
   push_cast
   exact h
end
end MathGKM.Markov
'''
(R/'MarkovThirdThirdBoundsM9FC.lean').write_text(out)
s=(R/'MarkovThirdHalfSourceMAE2.lean').read_text()
s=s.replace('MarkovThirdHalfBoundsMAE2','MarkovThirdThirdBoundsM9FC')
s=s.replace('MAE2','M9FC').replace('half','third')
s=s.replace('2*(frame rest).mid.a ≤ (frame rest).mid.b','3*(frame rest).mid.a < 2*(frame rest).mid.b')
s=s.replace('(frame path).mid.a ≤ 2*((frame path).mid.b % (frame path).mid.a)','(frame path).mid.a < 3*((frame path).mid.b % (frame path).mid.a)')
(R/'MarkovThirdThirdSourceM9FC.lean').write_text(s)
s=(R/'MarkovResidualHalfMAE2.lean').read_text()
s=s.replace('MarkovThirdHalfSourceMAE2','MarkovThirdThirdSourceM9FC').replace('MAE2','M9FC').replace('Half','Third').replace('half','third')
s=s.replace('2*(m.b % m.a) < m.a','3*(m.b % m.a) ≤ m.a')
s=s.replace('(frame path).mid.a ≤ 2*((frame path).mid.b % (frame path).mid.a)','(frame path).mid.a < 3*((frame path).mid.b % (frame path).mid.a)')
(R/'MarkovResidualThirdM9FC.lean').write_text(s)
