import MarkovResidualDe6

/-! Machine-authored live worker 16cb07ce. Raw diagonal coefficient adapter. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem diagonal_coeff_eval16 (P : TriPoly21a) (r i : ℕ) :
    ((diagonalPolyDe6 P).coeff r).coeff i = ((P.coeff i).eval 1).coeff r := by
  induction P using Polynomial.induction_on' with
  | add p q hp hq =>
    simp only [diagonalPolyDe6, map_add, coeff_add, eval_add] at *
    exact congrArg₂ (·+·) hp hq
  | monomial n q =>
    induction q using Polynomial.induction_on' with
    | add p q hp hq =>
      simp only [map_add, diagonalPolyDe6, coeff_add, eval_add] at *
      exact congrArg₂ (·+·) hp hq
    | monomial j q =>
      induction q using Polynomial.induction_on' with
      | add p q hp hq =>
        simp only [map_add, diagonalPolyDe6, coeff_add, eval_add] at *
        exact congrArg₂ (·+·) hp hq
      | monomial k z =>
        simp [diagonalPolyDe6, evalTriDe6, eval₂_monomial,
          Polynomial.coeff_monomial, Polynomial.coeff_mul_C]

#print axioms diagonal_coeff_eval16
end
end MathGKM.Markov
