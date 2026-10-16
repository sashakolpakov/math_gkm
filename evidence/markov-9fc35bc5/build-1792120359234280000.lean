import MarkovThirdHalfBoundsMAE2
import MarkovThirdAllmidhigh_0_4M9FC
import MarkovThirdAllmidhigh_1_2M9FC
import MarkovThirdAllmidhigh_2_1M9FC
/-! Machine-authored 9fc35bc5. All run lengths, source cone 3*T<2*L. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
theorem vThirdNat_midhigh_0_4M9FC (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have ex : ((x-0:ℕ):ℤ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midhigh_0_4M9FC ((x-0:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vThirdNat_midhigh_1_2M9FC (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℤ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midhigh_1_2M9FC ((x-1:ℕ):ℤ) ((y-2:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vThirdNat_midhigh_2_1M9FC (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midhigh_2_1M9FC ((x-2:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]


theorem vThirdNat_midhighM9FC (x y : ℕ) (hb : 7≤3*x+2*y) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) := by omega
 rcases h with ⟨hx,hy⟩|⟨hx,hy⟩|⟨hx,hy⟩
 · exact vThirdNat_midhigh_0_4M9FC x y hx hy
 · exact vThirdNat_midhigh_1_2M9FC x y hx hy
 · exact vThirdNat_midhigh_2_1M9FC x y hx hy

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
