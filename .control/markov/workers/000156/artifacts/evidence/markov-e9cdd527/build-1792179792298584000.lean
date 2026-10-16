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

theorem lower_region_formulaME9C (q : ℕ) (r : Bool) :
 ∀ i j, j ≤ q → lowerRawME9C (sourceNME9C q r) i j=threeRawM9E2 q r i j := by
 have H : ∀ t i j, i+j=t → j ≤ q →
     lowerRawME9C (sourceNME9C q r) i j=threeRawM9E2 q r i j := by
   intro t
   induction t using Nat.strong_induction_on with
   | h t ih =>
     intro i j ht hj
     have hs (a b : ℕ) (hab : 0<a+b) :
       shiftRawM9E2 a b (lowerRawME9C (sourceNME9C q r)) i j=
       shiftRawM9E2 a b (threeRawM9E2 q r) i j := by
       unfold shiftRawM9E2
       split_ifs with h
       · exact ih ((i-a)+(j-b)) (by omega) (i-a) (j-b) rfl (by omega)
       · rfl
     have hh := solve_disc_stepM96A (lowerForceME9C (sourceNME9C q r)) i j
     change lowerRawME9C (sourceNME9C q r) i j=lowerForceME9C (sourceNME9C q r) i j-
       2*shiftRawM9E2 1 0 (lowerRawME9C (sourceNME9C q r)) i j+
       2*shiftRawM9E2 0 1 (lowerRawME9C (sourceNME9C q r)) i j-
       shiftRawM9E2 2 0 (lowerRawME9C (sourceNME9C q r)) i j-
       2*shiftRawM9E2 1 1 (lowerRawME9C (sourceNME9C q r)) i j-
       shiftRawM9E2 0 2 (lowerRawME9C (sourceNME9C q r)) i j at hh
     rw [hs 1 0 (by omega),hs 0 1 (by omega),hs 2 0 (by omega),
       hs 1 1 (by omega),hs 0 2 (by omega)] at hh
     have he := three_raw_equationM96A q r i j
     rw [low_force_baseME9C q i j r hj] at he
     change discriminantActionM96A (threeRawM9E2 q r) i j=
       lowerForceME9C (sourceNME9C q r) i j at he
     unfold discriminantActionM96A at he
     linear_combination hh-he
 exact fun i j hj => H (i+j) i j rfl hj

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
