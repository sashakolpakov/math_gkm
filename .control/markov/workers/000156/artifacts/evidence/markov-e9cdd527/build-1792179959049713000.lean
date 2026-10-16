import MarkovLowSourceME9C
import MarkovThreeSolverM96A
/-! Machine-authored e9cdd527. A uniform auxiliary kernel for the entire
lower region. Equality to source coefficients is proved; shape is not assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def lowerForceME9C (n : ℕ) : ℕ → ℕ → ℤ :=
 addSRawM9E2 (addSRawM9E2 (fibDeltaME9C n))
def lowerRawME9C (n : ℕ) : ℕ → ℕ → ℤ := solveDiscM96A (lowerForceME9C n)
def lowerKernelME9C (i j k : ℕ) : ℤ := lowerRawME9C (i+j+k-2) i j

attribute [local irreducible] lowerRawME9C lowerForceME9C solveDiscM96A threeRawM9E2

theorem disc_lower_uniqueME9C (q : ℕ) (f g : ℕ → ℕ → ℤ)
 (heq : ∀ i j, j ≤ q → discriminantActionM96A f i j=discriminantActionM96A g i j) :
 ∀ i j, j ≤ q → f i j=g i j := by
 have H : ∀ t i j, i+j=t → j ≤ q →
     f i j=g i j := by
   intro t
   induction t using Nat.strong_induction_on with
   | h t ih =>
     intro i j ht hj
     have hs (a b : ℕ) (hab : 0<a+b) :
       shiftRawM9E2 a b f i j=shiftRawM9E2 a b g i j := by
       unfold shiftRawM9E2
       split_ifs with h
       · exact ih ((i-a)+(j-b)) (by omega) (i-a) (j-b) rfl (by omega)
       · rfl
     have hh := heq i j hj
     unfold discriminantActionM96A at hh
     rw [hs 1 0 (by omega),hs 0 1 (by omega),hs 2 0 (by omega),
       hs 1 1 (by omega),hs 0 2 (by omega)] at hh
     linarith
 exact fun i j hj => H (i+j) i j rfl hj

theorem lower_raw_equationME9C (n i j : ℕ) :
 discriminantActionM96A (lowerRawME9C n) i j=lowerForceME9C n i j := by
 have hh := solve_disc_stepM96A (lowerForceME9C n) i j
 unfold lowerRawME9C discriminantActionM96A
 linear_combination hh

theorem lower_region_formulaME9C (q : ℕ) (r : Bool) :
 ∀ i j, j ≤ q → lowerRawME9C (sourceNME9C q r) i j=threeRawM9E2 q r i j := by
 apply disc_lower_uniqueME9C
 intro i j hj
 rw [lower_raw_equationME9C,three_raw_equationM96A,low_force_baseME9C q i j r hj]
 rfl

theorem source_lower_kernelME9C (q i j k : ℕ) (r : Bool)
 (hj : j ≤ q) (hn : i+j+k=sourceNME9C q r+2) :
 threeRawM9E2 q r i j=lowerKernelME9C i j k := by
 unfold lowerKernelME9C
 rw [hn,Nat.add_sub_cancel,lower_region_formulaME9C q r i j hj]

theorem source_lower_formulaME9C (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
   ∀ i j, j ≤ q → coeff (frame path).mid.p i j=lowerRawME9C (sourceNME9C q r) i j := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 exact ⟨q,r,hq,hb,fun i j hj => (hp i j).trans (lower_region_formulaME9C q r i j hj).symm⟩

end
end MathGKM.Markov
