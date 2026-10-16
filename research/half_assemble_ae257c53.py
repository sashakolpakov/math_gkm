"""Machine-authored source cone assembly; all certificates must first compile."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovThirdAllSourceBoundsMAE2.lean').read_text()
s=s[s.index('theorem vAllnat_midlow_0_4MAE2'):s.index('theorem vAllnat_midlow_3_0MAE2')].replace('vAllnat_midlow','vHalfNat_midlow')
head='''import MarkovThirdLowBoundsMAE2
import MarkovThirdAllmidlow_0_4MAE2
import MarkovThirdAllmidlow_1_2MAE2
import MarkovThirdAllmidlow_2_1MAE2
/-! Machine-authored ae257c53. Source half-cone, unbounded run length. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
'''
tail='''theorem vHalfNat_midlowMAE2 (x y : ℕ) (hb : 7≤3*x+2*y) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) := by omega
 rcases h with ⟨hx,hy⟩|⟨hx,hy⟩|⟨hx,hy⟩
 · exact vHalfNat_midlow_0_4MAE2 x y hx hy
 · exact vHalfNat_midlow_1_2MAE2 x y hx hy
 · exact vHalfNat_midlow_2_1MAE2 x y hx hy

theorem vAllbounds_halfMAE2 (a b : ℕ) (ha : 1≤a) (hb : 7≤b) (hc : 2*a≤b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases h0 : 3*a≤b
 · exact vAllbounds_lowMAE2 a b ha hb h0
 · let x := b-2*a
   let y := 3*a-b
   have ea : a=x+y := by dsimp [x,y]; omega
   have eb : b=3*x+2*y := by dsimp [x,y]; omega
   have eq : 2*a-b=0 := by omega
   have et : min (b-a) (3*a-b)=y := by dsimp [y]; omega
   have eu : 3*a-2*b=0 := by omega
   have h := vHalfNat_midlowMAE2 x y (by omega) (by dsimp [y]; omega)
   rw [eq,et,eu,ea,eb]
   push_cast
   exact h
end
end MathGKM.Markov
'''
(R/'research/MarkovThirdHalfBoundsMAE2.lean').write_text(head+s+tail)
s=(R/'research/MarkovThirdLowSourceMAE2.lean').read_text().replace('LowBoundsMAE2','HalfBoundsMAE2')
for n in ['vThird_seed_cross_low','vertical_third_all_run_low','vAllbounds_low']:
 s=s.replace(n+'MAE2',n.replace('_low','_half')+'MAE2')
s=s.replace('vertical_third_remainderMAE2','vertical_third_half_remainderMAE2').replace('vertical_third_regionMAE2','vertical_third_half_regionMAE2')
s=s.replace('3*(frame rest).mid.a','2*(frame rest).mid.a')
s=s.replace('2*(frame path).mid.a ≤ 3*','(frame path).mid.a ≤ 2*')
(R/'research/MarkovThirdHalfSourceMAE2.lean').write_text(s)
s=(R/'research/MarkovResidualLowMAE2.lean').read_text().replace('LowMAE2','HalfMAE2').replace('LowSourceMAE2','HalfSourceMAE2').replace('vertical_third_regionMAE2','vertical_third_half_regionMAE2')
s=s.replace('3*(m.b % m.a) < 2*m.a','2*(m.b % m.a) < m.a')
s=s.replace('2*(frame path).mid.a ≤ 3*','(frame path).mid.a ≤ 2*')
(R/'research/MarkovResidualHalfMAE2.lean').write_text(s)
print('Half-cone candidates written; no claim of validation.')
