import MarkovPositive16cb
import MarkovScaling16cb
import MarkovDiagonal16cb

/-! Machine-authored worker 774eaadc. Exact slice factorization and positive
upper residuals. No log-concavity or lower-half deconvolution is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem quotient_subst_nonneg774 (u v : BiPoly)
    (hu : PolyNonneg16 u) (hv : PolyNonneg16 v) (path : List Bool) :
    PolyNonneg16 (qTree16 u v 1 path).2.1 := by
  rw [quotient_matrix16]
  have ha : MatNonneg16 (matA16 u v) :=
    ⟨poly_one_nonneg16,poly_one_nonneg16,hu,poly_add_nonneg16 hu hv⟩
  have hb : MatNonneg16 (matB16 u v) :=
    ⟨poly_add_nonneg16 poly_one_nonneg16 hv,poly_one_nonneg16,hu,hu⟩
  have h := mat_pair_nonneg16 path (matA16 u v,matB16 u v) ha hb
  exact (mat_mul_nonneg16 h.1 h.2).2.1

/-- Outer variable is t, inner variable x; this is an explicit quotient slice. -/
def quotientSlice774 (path : List Bool) (r : ℕ) : Polynomial ℤ :=
  ((qTree16 (C X) (1 : BiPoly) X path).2.1).coeff r

theorem quotient_slice_nonneg774 (path : List Bool) (r i : ℕ) :
    0 ≤ (quotientSlice774 path r).coeff i := by
  have h := quotient_subst_nonneg774 (V*U) U
    (poly_mul_nonneg16 poly_V_nonneg16 poly_U_nonneg16) poly_U_nonneg16 path
  unfold quotientSlice774
  rw [quotient_scaling16]
  simpa [U,V,coeff] using h r i

theorem slice_balance774 (path : List Bool) (r : ℕ) :
    (diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r *
        (1+(X : Polynomial ℤ))^(2*r) =
      (1+X)^((frame path).mid.a+(frame path).mid.b-1)*quotientSlice774 path r := by
  let s : Polynomial ℤ := 1+X
  have h := source_quotient16 (C (X : Polynomial ℤ)) (1 : BiPoly) X path
  have he : C (X : Polynomial ℤ)+(1 : BiPoly) = C s := by simp [s,add_comm]
  rw [he, ← map_pow C, ← rescale_diagonal_de6] at h
  have hc := congrArg (fun p : BiPoly => p.coeff r) h
  rw [Polynomial.comp_C_mul_X_coeff, ← map_pow C, Polynomial.coeff_C_mul] at hc
  simpa [s,pow_mul,quotientSlice774] using hc

theorem one_add_X_ne_zero774 : (1+(X : Polynomial ℤ)) ≠ 0 := by
  intro h
  have hh := congrArg (fun p : Polynomial ℤ => p.coeff 1) h
  norm_num [Polynomial.coeff_one] at hh

/-- Exact prescribed residual on the upper half of the homogeneous slices. -/
theorem upper_slice_factor774 (path : List Bool) (r : ℕ)
    (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1) :
    (diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r =
      (1+X)^((frame path).mid.a+(frame path).mid.b-1-2*r)*quotientSlice774 path r := by
  apply mul_right_cancel₀ (pow_ne_zero (2*r) one_add_X_ne_zero774)
  rw [slice_balance774]
  rw [mul_right_comm, ← pow_add, Nat.sub_add_cancel hr]

/-- The opposite regime is multiplication of the raw slice, not deconvolution. -/
theorem lower_slice_factor774 (path : List Bool) (r : ℕ)
    (hr : (frame path).mid.a+(frame path).mid.b-1 ≤ 2*r) :
    quotientSlice774 path r =
      (1+X)^(2*r-((frame path).mid.a+(frame path).mid.b-1))*
        (diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r := by
  apply mul_left_cancel₀ (pow_ne_zero _ one_add_X_ne_zero774)
  rw [← slice_balance774, ← mul_assoc, ← pow_add, Nat.add_sub_of_le hr]
  ring

/-- Existential form with an integral, coefficientwise nonnegative residual. -/
theorem upper_residual_positive774 (path : List Bool) (r : ℕ)
    (hr : 2*r ≤ (frame path).mid.a+(frame path).mid.b-1) :
    ∃ Q : Polynomial ℤ, (∀ i, 0 ≤ Q.coeff i) ∧
      (diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r =
        (1+X)^((frame path).mid.a+(frame path).mid.b-1-2*r)*Q :=
  ⟨quotientSlice774 path r,quotient_slice_nonneg774 path r,upper_slice_factor774 path r hr⟩

#print axioms quotient_slice_nonneg774
#print axioms slice_balance774
#print axioms upper_slice_factor774
#print axioms lower_slice_factor774
#print axioms upper_residual_positive774
end
end MathGKM.Markov
