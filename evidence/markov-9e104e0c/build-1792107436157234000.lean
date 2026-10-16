import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_4_7M9E1 : Bivariate.swap (frame [true,false,false]).mid.p=
 C (1*X^4+6*X^5+15*X^6+20*X^7+15*X^8+6*X^9+1*X^10)*X^0 +
 C (11*X^4+54*X^5+106*X^6+104*X^7+51*X^8+10*X^9)*X^1 +
 C (4*X^3+71*X^4+232*X^5+312*X^6+192*X^7+45*X^8)*X^2 +
 C (40*X^3+269*X^4+528*X^5+420*X^6+120*X^7)*X^3 +
 C (8*X^2+176*X^3+550*X^4+588*X^5+210*X^6)*X^4 +
 C (64*X^2+360*X^3+546*X^4+252*X^5)*X^5 +
 C (12*X^1+144*X^2+336*X^3+210*X^4)*X^6 +
 C (1*X^0+32*X^1+132*X^2+120*X^3)*X^7 +
 C (3*X^0+30*X^1+45*X^2)*X^8 +
 C (3*X^0+10*X^1)*X^9 +
 C (1*X^0)*X^10 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_4_7_3M9E1 : (Bivariate.swap (frame [true,false,false]).mid.p).coeff 3=
 40*X^3+269*X^4+528*X^5+420*X^6+120*X^7 := by
 rw [small_poly_4_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_4_7_3M9E1 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [true,false,false]).mid.p i 3*coeff (frame [true,false,false]).mid.p (i+2) 3 ≤
 coeff (frame [true,false,false]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_4_7_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_4_7_4M9E1 : (Bivariate.swap (frame [true,false,false]).mid.p).coeff 4=
 8*X^2+176*X^3+550*X^4+588*X^5+210*X^6 := by
 rw [small_poly_4_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_4_7_4M9E1 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [true,false,false]).mid.p i 4*coeff (frame [true,false,false]).mid.p (i+2) 4 ≤
 coeff (frame [true,false,false]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_4_7_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
