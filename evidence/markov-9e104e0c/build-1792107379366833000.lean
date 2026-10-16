import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_2_3M9E1 : Bivariate.swap (frame [true]).mid.p=
 C (1*X^2+2*X^3+1*X^4)*X^0 +
 C (5*X^2+4*X^3)*X^1 +
 C (4*X^1+6*X^2)*X^2 +
 C (1*X^0+4*X^1)*X^3 +
 C (1*X^0)*X^4 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_2_3_3M9E1 : (Bivariate.swap (frame [true]).mid.p).coeff 3=
 1*X^0+4*X^1 := by
 rw [small_poly_2_3M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_2_3_3M9E1 (i : ℕ) (hi : i ≤ 4) :
 coeff (frame [true]).mid.p i 3*coeff (frame [true]).mid.p (i+2) 3 ≤
 coeff (frame [true]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_2_3_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_2_3_4M9E1 : (Bivariate.swap (frame [true]).mid.p).coeff 4=
 1*X^0 := by
 rw [small_poly_2_3M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_2_3_4M9E1 (i : ℕ) (hi : i ≤ 4) :
 coeff (frame [true]).mid.p i 4*coeff (frame [true]).mid.p (i+2) 4 ≤
 coeff (frame [true]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_2_3_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
