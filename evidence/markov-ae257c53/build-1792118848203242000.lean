import MarkovThirdLowBoundsMAE2
import MarkovThirdAllmidlow_0_4MAE2
import MarkovThirdAllmidlow_1_2MAE2
import MarkovThirdAllmidlow_2_1MAE2
/-! Machine-authored ae257c53. Source half-cone, unbounded run length. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
theorem vHalfNat_midlow_0_4MAE2 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have ex : ((x-0:ℕ):ℤ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midlow_0_4MAE2 ((x-0:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vHalfNat_midlow_1_2MAE2 (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℤ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midlow_1_2MAE2 ((x-1:ℕ):ℤ) ((y-2:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vHalfNat_midlow_2_1MAE2 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midlow_2_1MAE2 ((x-2:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vHalfNat_midlowMAE2 (x y : ℕ) (hb : 7≤3*x+2*y) (hy : 1≤y) :
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
