import MarkovVerticalSourceM9C28
import MarkovGeneralDiagonalM9C28
/-! Machine-authored request 9c28b628. Exact pinned-root residual after
closing the whole vertical column four. Both residuals remain OPEN. -/
namespace MathGKM.Markov
noncomputable section

def ThreeRemainingM9C28 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 5 ≤ i → q < j+2 → j+q < sourceNME9C q r →
   i < q+(if r then 1 else 2) → i+j+q ≤ sourceNME9C q r →
   kernelRawMED6 q r i j*kernelRawMED6 q r i (j+2) ≤ kernelRawMED6 q r i (j+1)^2) ∧
 (∀ i j, 1 ≤ i → i≠3 → q < j+2 → j+q < sourceNME9C q r →
   (i < 3 ∨ (i < q+(if r then 1 else 2) ∧ i+j+q+2 ≤ sourceNME9C q r)) →
   kernelRawMED6 q r i (j+2)*kernelRawMED6 q r (i+2) j ≤
     kernelRawMED6 q r (i+1) (j+1)^2)

theorem remaining_iffM9C28 : ThreeRemainingM9C28 ↔ ThreeRemainingMBEB := by
 constructor
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j hi hj ht he hcol hsup
   by_cases hi4 : i=4
   · subst i
     simp only [kernel_raw_eqMED6 q r _ _ hq]
     exact_mod_cast source_four_verticalM9C28 q j r hq
   · exact (h q hq r).1 i j (by omega) hj ht hcol hsup
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j hi hj ht hcol hsup
   exact (h q hq r).1 i j (by omega) hj ht (by omega) hcol hsup

theorem root_iff_remainingM9C28 : Conjecture63 ↔ ThreeRemainingM9C28 ∧ OtherFourM9E2 := by
 rw [remaining_iffM9C28,root_iff_remainingMBEB]

end
end MathGKM.Markov
