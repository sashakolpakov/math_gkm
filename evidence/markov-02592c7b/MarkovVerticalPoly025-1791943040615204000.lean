import MarkovVerticalRamp025

/-! Machine-authored request 02592c7b. The candidate first-vertical residual
has raw log-concave coefficients, with arbitrary ramp length and all zeros.
The actual source identity remains a separate obligation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def rampPoly025 (a r : ℝ) (q : ℕ) : Polynomial ℝ :=
  (∑ k ∈ Finset.range q, monomial k (4*(a*k+r)))+
    monomial q (3*(a*q+r)-1)+monomial (q+1) (a*(q+1)+r-1)

theorem rampPoly_coeff025 (a r : ℝ) (q k : ℕ) :
    (rampPoly025 a r q).coeff k=rampSeq025 a r q k := by
  simp only [rampPoly025,Polynomial.coeff_add,Polynomial.finsetSum_coeff,
    Polynomial.coeff_monomial]
  rw [Finset.sum_ite_eq']
  simp only [Finset.mem_range]
  unfold rampSeq025
  by_cases hk : k<q
  · simp [hk,show (q:ℤ)≠k by omega,show (k:ℤ)≠q by omega,
      show (k:ℤ)≠q+1 by omega,show q≠k by omega,show q+1≠k by omega,
      show (k:ℤ)<q by omega]
  · by_cases he : k=q
    · subst k; simp
    · by_cases hl : k=q+1
      · subst k; simp
      · simp [hk,he,hl,Ne.symm he,Ne.symm hl,
          show ¬ (k:ℤ)<q by omega,show (k:ℤ)≠q by omega,
          show (k:ℤ)≠q+1 by omega]

theorem rampPoly_coeffSeq025 (a r : ℝ) (q : ℕ) :
    CoeffSeq (rampPoly025 a r q)=rampSeq025 a r q := by
  funext k
  by_cases hk : k<0
  · rw [CoeffSeq,if_pos hk,ramp_zero025 a r q k (Or.inl hk)]
  · lift k to ℕ using (show 0≤k by omega)
    simpa [CoeffSeq] using rampPoly_coeff025 a r q k

theorem rampPoly_crossLC025 (a r : ℝ) (q : ℕ)
    (ha : 3≤a) (hr : 0≤r) (hq : 1≤q) :
    CrossLC (CoeffSeq (rampPoly025 a r q)) := by
  rw [rampPoly_coeffSeq025]
  exact ramp_crossLC025 a r q ha hr hq

theorem shifted_ramp_crossLC025 (a r : ℝ) (q shift n : ℕ)
    (ha : 3≤a) (hr : 0≤r) (hq : 1≤q) :
    CrossLC (CoeffSeq (X^shift*(X+1)^n*rampPoly025 a r q)) := by
  have h := crossLC_pascal (rampPoly_crossLC025 a r q ha hr hq) n
  rw [← coeffSeq_binomial_mul] at h
  simpa [mul_assoc,add_comm] using crossLC_X_pow_mul46 _ h shift

/-- Explicitly conditional raw source transfer; this theorem does not
discharge the equality hypothesis, nor the small-numerator cases. -/
theorem vertical_one_of_formula025 (path : List Bool) (a b q r : ℕ)
    (ha : 3≤a) (hq : 1≤q)
    (he : (((frame path).mid.p).coeff 1).map (Int.castRingHom ℝ)=
      X^(b-q)*(X+1)^(a-3)*rampPoly025 a r q) (j : ℕ) :
    coeff (frame path).mid.p 1 j*coeff (frame path).mid.p 1 (j+2) ≤
      coeff (frame path).mid.p 1 (j+1)^2 := by
  have h := crossLC_adjacent
    (shifted_ramp_crossLC025 a r q (b-q) (a-3)
      (by exact_mod_cast ha) (by positivity) hq) (↑j+1)
  rw [← he] at h
  have hn : ¬ (↑j : ℤ)<0 := by omega
  have hn1 : ¬ (↑j+1 : ℤ)<0 := by omega
  have hn2 : ¬ (↑j+1+1 : ℤ)<0 := by omega
  simp only [CoeffSeq,add_sub_cancel_right,hn,hn1,hn2,if_false,
    Int.toNat_natCast,Polynomial.coeff_map] at h
  change (coeff (frame path).mid.p 1 j : ℝ)*
    (coeff (frame path).mid.p 1 (j+2) : ℝ) ≤
      (coeff (frame path).mid.p 1 (j+1) : ℝ)^2 at h
  exact_mod_cast h

#print axioms shifted_ramp_crossLC025
#print axioms vertical_one_of_formula025
end
end MathGKM.Markov
