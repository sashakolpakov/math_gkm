import MathGKM.MarkovLogConcavity

namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem one_third_numerator :
    (frame [false]).mid.p = (U+V)^3 + 2*U^2 + 2*U*V + U := by
  simp [frame, initial, advance, S]
  ring

theorem one_third_coefficients :
    coeff (frame [false]).mid.p 1 0 = 1 ∧
    coeff (frame [false]).mid.p 1 1 = 2 ∧
    coeff (frame [false]).mid.p 1 2 = 3 := by
  have he : (frame [false]).mid.p =
      C (X^3) + C (3*X^2+2*X+1)*X + C (3*X+2)*X^2 + X^3 := by
    rw [one_third_numerator]
    simp only [U, V, map_add, map_mul, map_pow, map_ofNat, map_one]
    ring
  have hc : ((frame [false]).mid.p).coeff 1 = 3*X^2+2*X+1 := by
    rw [he]
    simp only [coeff_add, coeff_C, coeff_C_mul_X_pow, coeff_C_mul_X, coeff_X_pow]
    norm_num
  change (((frame [false]).mid.p).coeff 1).coeff 0 = 1 ∧
    (((frame [false]).mid.p).coeff 1).coeff 1 = 2 ∧
    (((frame [false]).mid.p).coeff 1).coeff 2 = 3
  rw [hc]
  norm_num only [coeff_add, coeff_ofNat_mul, coeff_X_pow, coeff_X, coeff_one]
  norm_num

/-- The multinomial divisors at (1,0,2),(1,1,1),(1,2,0) are 3,6,3. -/
theorem normalization_counterexample :
    ((coeff (frame [false]).mid.p 1 1 : ℝ)/6)^2 <
      ((coeff (frame [false]).mid.p 1 0 : ℝ)/3) *
      ((coeff (frame [false]).mid.p 1 2 : ℝ)/3) := by
  obtain ⟨h0,h1,h2⟩ := one_third_coefficients
  rw [h0,h1,h2]
  norm_num

theorem one_third_raw_check :
    coeff (frame [false]).mid.p 1 0 * coeff (frame [false]).mid.p 1 2 <
      coeff (frame [false]).mid.p 1 1 ^ 2 := by
  obtain ⟨h0,h1,h2⟩ := one_third_coefficients
  rw [h0,h1,h2]
  norm_num

theorem subtraction_counterexample :
    CrossLC (QuadSeq 1 2 1) ∧ CrossLC (QuadSeq 0 2 0) ∧
      ¬ CrossLC (fun k => QuadSeq 1 2 1 k - QuadSeq 0 2 0 k) := by
  refine ⟨crossLC_quad (by norm_num) (by norm_num) (by norm_num) (by norm_num),
    crossLC_quad (by norm_num) (by norm_num) (by norm_num) (by norm_num), ?_⟩
  intro h
  have hh := h 0 1 (by norm_num)
  norm_num [QuadSeq] at hh

theorem nonreal_seed :
    ThirdB 3 4 ^ 2 - 4*ThirdA 3*ThirdC 4 < 0 ∧
    ThirdA 3*ThirdC 4 ≤ ThirdB 3 4 ^ 2 := by
  norm_num [ThirdA, ThirdB, ThirdC]

/-- A real quadratic with negative discriminant; an explicit obstruction to
the attempted real-rootedness route, not to coefficient log-concavity. -/
theorem nonreal_seed_no_real_root (x : ℝ) : 0 < 1+2*x+3*x^2 := by
  nlinarith [sq_nonneg (x+1/3)]

theorem endpoint_zero : WeakLC 0 1 1 := by
  constructor
  · intro i j h0 h1 h2; unfold InPolygon at *; omega
  constructor
  · intro i j h0 h1 h2; unfold InPolygon at *; omega
  · intro i j h0 h1 h2; unfold InPolygon at *; omega

theorem endpoint_one : WeakLC 1 1 (U+V) := by
  constructor
  · intro i j h0 h1 h2; unfold InPolygon at *; omega
  constructor
  · intro i j h0 h1 h2; unfold InPolygon at *; omega
  · intro i j h0 h1 h2; unfold InPolygon at *; omega

theorem initial_weakLC : WeakLC 1 2 initial.mid.p := by
  constructor
  · intro i j h0 h1 h2; unfold InPolygon at *; omega
  constructor
  · intro i j h0 h1 h2; unfold InPolygon at *; omega
  · intro i j h0 h1 h2
    have hi : i = 0 := by unfold InPolygon at *; omega
    have hj : j = 0 := by unfold InPolygon at *; omega
    subst i; subst j
    have he : initial.mid.p = C (X^2) + C (2*X+1)*X + X^2 := by
      simp only [initial, U, V, map_add, map_mul, map_pow, map_ofNat, map_one]
      ring
    rw [he]
    simp only [coeff, coeff_add, coeff_C, coeff_C_mul_X, coeff_X_pow]
    norm_num only [coeff_add, coeff_ofNat_mul, coeff_X, coeff_one]
    norm_num [coeff_one]

end
end MathGKM.Markov
