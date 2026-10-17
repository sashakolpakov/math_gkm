import MarkovCorrectionSupportLCMED6
import MarkovKernelResidualMED6
/-! Machine-authored ed6bdbeb. Exact root reduction to the correction-support
triangle, retaining all small-column diagonal obligations and all other sources. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def ThreeCorrectionSupportMED6 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   i < q+(if r then 1 else 2) → i+j+q ≤ sourceNME9C q r →
   kernelRawMED6 q r i j*kernelRawMED6 q r i (j+2) ≤ kernelRawMED6 q r i (j+1)^2) ∧
 (∀ i j, 1 ≤ i → q < j+2 → j+q < sourceNME9C q r →
   ¬(i=3 ∧ sourceNME9C q r ≤ 2*j ∧ sourceNME9C q r < i+j+q+2) →
   (i < 4 ∨ (i < q+(if r then 1 else 2) ∧ i+j+q+2 ≤ sourceNME9C q r)) →
   kernelRawMED6 q r i (j+2)*kernelRawMED6 q r (i+2) j ≤
     kernelRawMED6 q r (i+1) (j+1)^2)

theorem correction_support_iffMED6 : ThreeCorrectionSupportMED6 ↔ ThreeKernelTriangleMED6 := by
 constructor
 · intro h q hq r
   constructor
   · intro i j hi hj ht he hw
     by_cases hcol : i < q+(if r then 1 else 2)
     · by_cases hcap : i+j+q ≤ sourceNME9C q r
       · exact (h q hq r).1 i j hi hj ht he hcol hcap
       · simp only [kernel_raw_eqMED6 q r _ _ hq]
         exact_mod_cast source_above_verticalMED6 q i j r hq (by omega)
     · simp only [kernel_raw_eqMED6 q r _ _ hq]
       exact_mod_cast source_support_column_verticalMED6 q i j r hq (by omega)
   · intro i j hi hj ht hw he
     by_cases hi4 : 4 ≤ i
     · by_cases hcol : i < q+(if r then 1 else 2)
       · by_cases hcap : i+j+q+2 ≤ sourceNME9C q r
         · exact (h q hq r).2 i j hi hj ht he (Or.inr ⟨hcol,hcap⟩)
         · simp only [kernel_raw_eqMED6 q r _ _ hq]
           exact_mod_cast source_above_diagonalMED6 q i j r hq hi4 (by omega)
       · simp only [kernel_raw_eqMED6 q r _ _ hq]
         exact_mod_cast source_support_column_diagonalMED6 q i j r hq hi4 (by omega)
     · exact (h q hq r).2 i j hi hj ht he (Or.inl (by omega))
 · intro h q hq r
   constructor
   · intro i j hi hj ht he hcol hcap
     exact (h q hq r).1 i j hi hj ht he (by omega)
   · intro i j hi hj ht he hc
     exact (h q hq r).2 i j hi hj ht (by omega) he

theorem root_iff_correction_supportMED6 :
 Conjecture63 ↔ ThreeCorrectionSupportMED6 ∧ OtherFourM9E2 := by
 rw [correction_support_iffMED6,root_iff_kernel_triangleMED6]

end
end MathGKM.Markov
