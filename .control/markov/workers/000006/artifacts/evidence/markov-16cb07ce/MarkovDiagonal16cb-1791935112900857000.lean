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
        by_cases hn : n = i <;> by_cases hk : k = r <;>
          simp [diagonalPolyDe6, evalTriDe6, eval₂_monomial,
            Polynomial.coeff_monomial, ← map_pow, Polynomial.coeff_mul_C,
            hn, hk, Polynomial.coeff_mul_X_pow]

theorem diagonal_coeff_homogeneous16 {P : TriPoly21a} {d : ℕ}
    (h : IsHomogeneous21a d P) (r i : ℕ) :
    ((diagonalPolyDe6 P).coeff r).coeff i =
      if i+r ≤ d then ((P.coeff i).coeff (d-i-r)).coeff r else 0 := by
  classical
  rw [diagonal_coeff_eval16, Polynomial.eval_eq_sum]
  simp only [one_pow, mul_one, Polynomial.sum_def, Polynomial.finsetSum_coeff]
  split_ifs with hir
  · apply Finset.sum_eq_single (d-i-r)
    · intro j hj hne
      by_contra hc
      have hh := h i j r hc
      omega
    · intro hj
      have hz : (P.coeff i).coeff (d-i-r) = 0 := by
        simpa only [Polynomial.mem_support_iff, not_not] using hj
      simp [hz]
  · apply Finset.sum_eq_zero
    intro j hj
    by_contra hc
    have hh := h i j r hc
    omega

/-- Exact raw diagonal adapter, with zero extension past the diagonal endpoints. -/
theorem diagonal_raw_coeff16 (path : List Bool) (r i : ℕ) :
    ((diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r).coeff i =
      if i+r ≤ (frame path).mid.a+(frame path).mid.b-1 then
        coeff (frame path).mid.p i ((frame path).mid.a+(frame path).mid.b-1-i-r)
      else 0 := by
  rw [diagonal_coeff_homogeneous16
    (numerator_homogeneous_4b5 (degree_frame_21a path).2.1)]
  split_ifs with h
  · rw [numerator4b5, raw_homogeneous_coeff_21a]
    have he : (frame path).mid.a+(frame path).mid.b-1-i-
        ((frame path).mid.a+(frame path).mid.b-1-i-r) = r := by omega
    simp [he]
  · rfl

theorem diagonal_raw_coeff_on16 (path : List Bool) (r i j : ℕ)
    (h : i+j+r=(frame path).mid.a+(frame path).mid.b-1) :
    ((diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r).coeff i =
      coeff (frame path).mid.p i j := by
  rw [diagonal_raw_coeff16, if_pos (by omega)]
  congr 1
  omega

#print axioms diagonal_coeff_eval16
#print axioms diagonal_coeff_homogeneous16
#print axioms diagonal_raw_coeff16
#print axioms diagonal_raw_coeff_on16
end
end MathGKM.Markov
