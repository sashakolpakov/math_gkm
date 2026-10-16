import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_5_7M9E1 : Bivariate.swap (frame [true,true,false]).mid.p=
 C (1*X^5+6*X^6+15*X^7+20*X^8+15*X^9+6*X^10+1*X^11)*X^0 +
 C (14*X^5+67*X^6+128*X^7+122*X^8+58*X^9+11*X^10)*X^1 +
 C (12*X^4+125*X^5+356*X^6+440*X^7+252*X^8+55*X^9)*X^2 +
 C (4*X^3+128*X^4+564*X^5+924*X^6+648*X^7+165*X^8)*X^3 +
 C (80*X^3+560*X^4+1246*X^5+1092*X^6+330*X^7)*X^4 +
 C (32*X^2+360*X^3+1120*X^4+1260*X^5+462*X^6)*X^5 +
 C (8*X^1+148*X^2+672*X^3+1008*X^4+462*X^5)*X^6 +
 C (1*X^0+36*X^1+260*X^2+552*X^3+330*X^4)*X^7 +
 C (4*X^0+59*X^1+198*X^2+165*X^3)*X^8 +
 C (6*X^0+42*X^1+55*X^2)*X^9 +
 C (4*X^0+11*X^1)*X^10 +
 C (1*X^0)*X^11 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_5_7_3M9E1 : (Bivariate.swap (frame [true,true,false]).mid.p).coeff 3=
 4*X^3+128*X^4+564*X^5+924*X^6+648*X^7+165*X^8 := by
 rw [small_poly_5_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_5_7_3M9E1 (i : ℕ) (hi : i ≤ 11) :
 coeff (frame [true,true,false]).mid.p i 3*coeff (frame [true,true,false]).mid.p (i+2) 3 ≤
 coeff (frame [true,true,false]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_5_7_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_5_7_4M9E1 : (Bivariate.swap (frame [true,true,false]).mid.p).coeff 4=
 80*X^3+560*X^4+1246*X^5+1092*X^6+330*X^7 := by
 rw [small_poly_5_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_5_7_4M9E1 (i : ℕ) (hi : i ≤ 11) :
 coeff (frame [true,true,false]).mid.p i 4*coeff (frame [true,true,false]).mid.p (i+2) 4 ≤
 coeff (frame [true,true,false]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_5_7_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
