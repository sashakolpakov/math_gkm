import MarkovHorizontalB46

/-! Machine-authored worker b46c0efc. Actual source horizontal quadratic
obstruction to a real-rootedness strategy; NOT a raw LC counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem two_fifths_horizontal46 :
    (Bivariate.swap (frame [false,true]).mid.p).coeff 2 =
      X^2*(14+28*X+15*X^2) := by
  have he : Bivariate.swap (frame [false,true]).mid.p =
    C (1*X^2+4*X^3+6*X^4+4*X^5+1*X^6)*X^0 +
    C (5*X^2+16*X^3+17*X^4+6*X^5)*X^1 +
    C (14*X^2+28*X^3+15*X^4)*X^2 +
    C (4*X^1+22*X^2+20*X^3)*X^3 +
    C (8*X^1+15*X^2)*X^4 +
    C (1*X^0+6*X^1)*X^5 +
    C (1*X^0)*X^6 := by
    simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
      Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
      map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
    norm_num
    ring
  rw [he]
  simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
  norm_num
  ring

theorem horizontal_quadratic_obstruction46 :
    (28:ℝ)^2-4*15*14 < 0 ∧
    (∀ x : ℝ, 0 < 14+28*x+15*x^2) ∧
    (14:ℤ)*15 ≤ 28^2 := by
  refine ⟨by norm_num,?_,by norm_num⟩
  intro x
  nlinarith [sq_nonneg (15*x+14)]

/-- A nonreal zero of the actual 2/5 horizontal row, after mapping its
integer coefficients into the complex numbers. -/
theorem source_horizontal_nonreal_zero46 :
    ∃ z : ℂ, z.im ≠ 0 ∧
      Polynomial.eval₂ (Int.castRingHom ℂ) z
        ((Bivariate.swap (frame [false,true]).mid.p).coeff 2)=0 := by
  let z : ℂ := (-14+(Real.sqrt 14 : ℂ)*Complex.I)/15
  have hs : (Real.sqrt 14)^2=(14:ℝ) := Real.sq_sqrt (by norm_num)
  have hc : (Real.sqrt 14 : ℂ)^2=14 := by exact_mod_cast hs
  have hz : z.im ≠ 0 := by
    have hp : 0 < Real.sqrt 14 := Real.sqrt_pos.2 (by norm_num)
    dsimp [z]
    simp
  have he : 14+28*z+15*z^2=0 := by
    dsimp [z]
    ring_nf
    norm_num [Complex.I_sq,hc]
  refine ⟨z,hz,?_⟩
  rw [two_fifths_horizontal46]
  simp only [Polynomial.eval₂_mul,Polynomial.eval₂_pow,Polynomial.eval₂_X,
    Polynomial.eval₂_add,Polynomial.eval₂_ofNat]
  rw [he,mul_zero]

/-- Literal discrepancy with the displayed j=1 coefficient expression in
the hosted Theorem 4.2. The recurrence and Theorem 4.1 give 4 here.
This concerns an auxiliary source formula, not Conjecture 6.3. -/
theorem printed_row_formula_mismatch46 :
    coeff (frame [true]).mid.p 3 1=4 ∧
    (3*2-1:ℕ)*(3-2).choose (3-2)+(3-2)*(3-3).choose (3-2-1)=6 := by
  have he : (frame [true]).mid.p =
      C (X^4+X^3)+C (4*X^3+4*X^2)*X^1+
      C (6*X^2+5*X+1)*X^2+C (4*X+2)*X^3+X^4 := by
    simp [frame,advance,initial,S,U,V]
    simp only [map_ofNat]
    norm_num
    ring
  constructor
  · rw [he]
    simp only [coeff,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
      Polynomial.coeff_X_pow,Polynomial.coeff_C]
    norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul]
  · norm_num

#print axioms two_fifths_horizontal46
#print axioms horizontal_quadratic_obstruction46
#print axioms source_horizontal_nonreal_zero46
#print axioms printed_row_formula_mismatch46
end
end MathGKM.Markov
