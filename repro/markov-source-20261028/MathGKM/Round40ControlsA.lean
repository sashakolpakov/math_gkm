import MathGKM.Round40BridgeA

/-! Machine-authored nonreachable controls, committed before execution. -/
namespace GroupedR40
open Polynomial
noncomputable section

theorem pointwise_control :
    Defect (1 : Polynomial ℤ) (1+X) (2*X) = 1+X^2 ∧
    Nonnegative (Defect (1 : Polynomial ℤ) (1+X) (2*X)) ∧
    (1 : Polynomial ℤ).coeff 0*(2*X : Polynomial ℤ).coeff 1 >
      (1+X : Polynomial ℤ).coeff ((0+1)/2)*
        (1+X : Polynomial ℤ).coeff ((0+1+1)/2) := by
  have he : Defect (1 : Polynomial ℤ) (1+X) (2*X) = 1+X^2 := by
    unfold Defect
    ring
  refine ⟨he, ?_, ?_⟩
  · intro l
    rw [he]
    simp only [coeff_add, coeff_one, coeff_X_pow]
    positivity
  · norm_num [coeff_add, coeff_one, coeff_X]

theorem evaluated_control :
    Defect (2 : Polynomial ℤ) (1+X) 1 = -1+2*X+X^2 ∧
    (Defect (2 : Polynomial ℤ) (1+X) 1).coeff 0 = -1 ∧
    (Defect (2 : Polynomial ℤ) (1+X) 1).eval 1 = 2 ∧
    ¬ Nonnegative (Defect (2 : Polynomial ℤ) (1+X) 1) := by
  have he : Defect (2 : Polynomial ℤ) (1+X) 1 = -1+2*X+X^2 := by
    unfold Defect
    ring
  have hc : (Defect (2 : Polynomial ℤ) (1+X) 1).coeff 0 = -1 := by
    rw [he]
    norm_num
  refine ⟨he,hc,?_,?_⟩
  · rw [he]
    norm_num
  · intro h
    have := h 0
    rw [hc] at this
    norm_num at this

end
end GroupedR40
#print axioms GroupedR40.pointwise_control
#print axioms GroupedR40.evaluated_control
