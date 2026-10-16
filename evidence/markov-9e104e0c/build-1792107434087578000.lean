import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_3_5M9E1 : Bivariate.swap (frame [true,false]).mid.p=
 C (1*X^3+4*X^4+6*X^5+4*X^6+1*X^7)*X^0 +
 C (8*X^3+23*X^4+22*X^5+7*X^6)*X^1 +
 C (4*X^2+34*X^3+50*X^4+21*X^5)*X^2 +
 C (24*X^2+60*X^3+35*X^4)*X^3 +
 C (8*X^1+40*X^2+35*X^3)*X^4 +
 C (1*X^0+14*X^1+21*X^2)*X^5 +
 C (2*X^0+7*X^1)*X^6 +
 C (1*X^0)*X^7 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_3_5_3M9E1 : (Bivariate.swap (frame [true,false]).mid.p).coeff 3=
 24*X^2+60*X^3+35*X^4 := by
 rw [small_poly_3_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_3_5_3M9E1 (i : ℕ) (hi : i ≤ 7) :
 coeff (frame [true,false]).mid.p i 3*coeff (frame [true,false]).mid.p (i+2) 3 ≤
 coeff (frame [true,false]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_3_5_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_3_5_4M9E1 : (Bivariate.swap (frame [true,false]).mid.p).coeff 4=
 8*X^1+40*X^2+35*X^3 := by
 rw [small_poly_3_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_3_5_4M9E1 (i : ℕ) (hi : i ≤ 7) :
 coeff (frame [true,false]).mid.p i 4*coeff (frame [true,false]).mid.p (i+2) 4 ≤
 coeff (frame [true,false]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_3_5_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
