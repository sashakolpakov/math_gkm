import MarkovBlowupDe6

/-! Machine-authored worker de6ce8a9. Coefficient extraction from integral blowup. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem evalTri_natural_de6 {R A : Type*} [CommRing R] [CommRing A]
    (h : R →+* A) (u v w : R) (P : TriPoly21a) :
    h (evalTriDe6 u v w P) = evalTriDe6 (h u) (h v) (h w) P := by
  have he : h.comp (evalTriDe6 u v w) = evalTriDe6 (h u) (h v) (h w) := by
    apply Polynomial.ringHom_ext
    · intro q
      induction q using Polynomial.induction_on' with
      | add p q hp hq => simpa using congrArg₂ (·+·) hp hq
      | monomial j q =>
        induction q using Polynomial.induction_on' with
        | add p q hp hq =>
          simp only [map_add, monomial_add, C_add] at *
          exact congrArg₂ (·+·) hp hq
        | monomial k z => simp [evalTriDe6, eval₂_monomial, map_mul, map_pow]
    · simp [evalTriDe6]
  exact DFunLike.congr_fun he P

/-- Coefficients in the outer variable w after setting u=x,v=1. -/
def diagonalPolyDe6 (P : TriPoly21a) : Polynomial (Polynomial ℤ) :=
  evalTriDe6 (C X) 1 X P

theorem rescale_diagonal_de6 (P : TriPoly21a) (s : Polynomial ℤ) :
    (diagonalPolyDe6 P).comp (C (s^2)*X) =
      evalTriDe6 (C X) 1 (C (s^2)*X) P := by
  have h := evalTri_natural_de6 (Polynomial.eval₂RingHom C (C (s^2)*X))
    (C (X : Polynomial ℤ)) (1 : Polynomial (Polynomial ℤ)) X P
  simpa [diagonalPolyDe6, Polynomial.comp] using h

theorem cancel_power_divisibility_de6 {R : Type*} [CommRing R] [IsDomain R]
    (s q : R) (d k : ℕ) (hs : s ≠ 0) (h : s^d ∣ q*s^k) :
    s^(d-k) ∣ q := by
  by_cases hk : k ≤ d
  · obtain ⟨v,hv⟩ := h
    refine ⟨v, ?_⟩
    apply mul_right_cancel₀ (pow_ne_zero k hs)
    calc
      q*s^k = s^d*v := hv
      _ = (s^(d-k)*s^k)*v := by rw [← pow_add, Nat.sub_add_cancel hk]
      _ = (s^(d-k)*v)*s^k := by ring
  · simp [Nat.sub_eq_zero_of_le (by omega : d ≤ k)]

/-- Universal prescribed-factor divisibility of every w slice, including zero slices. -/
theorem residual_divisibility_de6 (path : List Bool) (r : ℕ) :
    (1+(X : Polynomial ℤ))^((frame path).mid.a+(frame path).mid.b-1-2*r) ∣
      (diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r := by
  let s : Polynomial ℤ := 1+X
  let d := (frame path).mid.a+(frame path).mid.b-1
  have hs : s ≠ 0 := by
    intro h
    have hh := congrArg (fun p : Polynomial ℤ => p.coeff 1) h
    norm_num [s] at hh
  have h := blowup_divisibility_de6 (C (X : Polynomial ℤ))
    (C s) (X : Polynomial (Polynomial ℤ)) path
  have hv : C s-C (X : Polynomial ℤ) = (1 : Polynomial (Polynomial ℤ)) := by
    simp [s]
  rw [hv] at h
  simp only [← map_pow C] at h
  rw [← rescale_diagonal_de6] at h
  obtain ⟨Q,hQ⟩ := h
  have hc := congrArg (fun p : Polynomial (Polynomial ℤ) => p.coeff r) hQ
  rw [Polynomial.comp_C_mul_X_coeff, Polynomial.coeff_C_mul] at hc
  have hd : s^d ∣ (diagonalPolyDe6 (numerator4b5 (frame path).mid)).coeff r*s^(2*r) := by
    refine ⟨Q.coeff r, ?_⟩
    simpa [pow_mul, d] using hc
  exact cancel_power_divisibility_de6 s _ d (2*r) hs hd

#print axioms evalTri_natural_de6
#print axioms residual_divisibility_de6
end
end MathGKM.Markov
