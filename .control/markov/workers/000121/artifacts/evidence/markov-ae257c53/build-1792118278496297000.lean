import MarkovThirdAlllow_0_4M03
import MarkovThirdAlllow_1_1MAE2
import MarkovThirdAlllow_2_0MAE2
/-! Machine-authored 1152282d. Exhaustive source-count coverage. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

theorem vLowNat_low_0_4MAE2 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have ex : ((x-0:ℕ):ℤ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_low_0_4M03 ((x-0:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vLowNat_low_1_1MAE2 (x y : ℕ) (hx : 1≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_low_1_1MAE2 ((x-1:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vLowNat_low_2_0MAE2 (x y : ℕ) (hx : 2≤x) (hy : 0≤y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℤ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_low_2_0MAE2 ((x-2:ℕ):ℤ) ((y-0:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vLowNat_lowMAE2 (x y : ℕ) (hb : 7≤3*(x+1)+y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 1≤y) ∨ (2≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vLowNat_low_0_4MAE2 x y hx hy
 · exact vLowNat_low_1_1MAE2 x y hx hy
 · exact vLowNat_low_2_0MAE2 x y hx hy

theorem vAllbounds_lowMAE2 (a b : ℕ) (ha : 1≤a) (hb : 7≤b) (hc : 3*a≤b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 let x := a-1
 let y := b-3*a
 have ea : a=x+1 := by dsimp [x]; omega
 have eb : b=3*(x+1)+y := by dsimp [x,y]; omega
 have eq : 2*a-b=0 := by omega
 have et : min (b-a) (3*a-b)=0 := by omega
 have eu : 3*a-2*b=0 := by omega
 have h := vLowNat_lowMAE2 x y (by omega)
 rw [eq,et,eu,ea,eb]
 push_cast
 exact h
end
end MathGKM.Markov
