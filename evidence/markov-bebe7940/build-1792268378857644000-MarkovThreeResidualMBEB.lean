import MarkovThreeDiagonalMBEB
import MarkovSupportResidualMBEB
/-! Machine-authored bebe7940. Exact full-root reduction after closing the
entire diagonal starting at column three. Other residuals remain OPEN. -/
namespace MathGKM.Markov
noncomputable section

def ThreeRemainingMBEB : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   i < q+(if r then 1 else 2) → i+j+q ≤ sourceNME9C q r →
   kernelRawMED6 q r i j*kernelRawMED6 q r i (j+2) ≤ kernelRawMED6 q r i (j+1)^2) ∧
 (∀ i j, 1 ≤ i → i≠3 → q < j+2 → j+q < sourceNME9C q r →
   (i < 3 ∨ (i < q+(if r then 1 else 2) ∧ i+j+q+2 ≤ sourceNME9C q r)) →
   kernelRawMED6 q r i (j+2)*kernelRawMED6 q r (i+2) j ≤
     kernelRawMED6 q r (i+1) (j+1)^2)

theorem remaining_iffMBEB : ThreeRemainingMBEB ↔ ThreeCorrectionSupportMBEB := by
 constructor
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j hi hj ht he hc
   by_cases hi3 : i=3
   · subst i
     simp only [kernel_raw_eqMED6 q r _ _ hq]
     exact_mod_cast source_three_diagonalMBEB q j r hq
   · exact (h q hq r).2 i j hi hi3 hj ht hc
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j hi hi3 hj ht hc
   exact (h q hq r).2 i j hi hj ht (by omega) hc

theorem root_iff_remainingMBEB : Conjecture63 ↔ ThreeRemainingMBEB ∧ OtherFourM9E2 := by
 rw [remaining_iffMBEB,root_iff_supportMBEB]

end
end MathGKM.Markov
