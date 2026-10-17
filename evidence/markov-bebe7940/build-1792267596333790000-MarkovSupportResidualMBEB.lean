import MarkovSourceDiagonalMBEB
import MarkovCorrectionSupportResidualMED6
/-! Machine-authored bebe7940. Exact root reduction. Neither residual is
assumed or asserted as a theorem. All remaining directions are retained. -/
namespace MathGKM.Markov
noncomputable section

def ThreeCorrectionSupportMBEB : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   i < q+(if r then 1 else 2) → i+j+q ≤ sourceNME9C q r →
   kernelRawMED6 q r i j*kernelRawMED6 q r i (j+2) ≤ kernelRawMED6 q r i (j+1)^2) ∧
 (∀ i j, 1 ≤ i → q < j+2 → j+q < sourceNME9C q r →
   ¬(i=3 ∧ sourceNME9C q r ≤ 2*j ∧ sourceNME9C q r < i+j+q+2) →
   (i < 3 ∨ (i < q+(if r then 1 else 2) ∧ i+j+q+2 ≤ sourceNME9C q r)) →
   kernelRawMED6 q r i (j+2)*kernelRawMED6 q r (i+2) j ≤
     kernelRawMED6 q r (i+1) (j+1)^2)

theorem support_residual_iffMBEB : ThreeCorrectionSupportMBEB ↔ ThreeCorrectionSupportMED6 := by
 constructor
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j hi hj ht he hc
   by_cases hi3 : 3 ≤ i
   · by_cases hcol : i < q+(if r then 1 else 2)
     · by_cases hcap : i+j+q+2 ≤ sourceNME9C q r
       · exact (h q hq r).2 i j hi hj ht he (Or.inr ⟨hcol,hcap⟩)
       · simp only [kernel_raw_eqMED6 q r _ _ hq]
         exact_mod_cast source_above_diagonalMBEB q i j r hq hi3 (by omega)
     · simp only [kernel_raw_eqMED6 q r _ _ hq]
       exact_mod_cast source_support_column_diagonalMBEB q i j r hq hi3 (by omega)
   · exact (h q hq r).2 i j hi hj ht he (Or.inl (by omega))
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j hi hj ht he hc
   apply (h q hq r).2 i j hi hj ht he
   rcases hc with hc|hc
   · exact Or.inl (by omega)
   · exact Or.inr hc

theorem root_iff_supportMBEB : Conjecture63 ↔ ThreeCorrectionSupportMBEB ∧ OtherFourM9E2 := by
 rw [support_residual_iffMBEB,root_iff_correction_supportMED6]

end
end MathGKM.Markov
