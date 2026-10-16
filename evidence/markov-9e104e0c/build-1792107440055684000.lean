import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_3_8M9E1 : Bivariate.swap (frame [false,true,false]).mid.p=
 C (1*X^3+7*X^4+21*X^5+35*X^6+35*X^7+21*X^8+7*X^9+1*X^10)*X^0 +
 C (8*X^3+50*X^4+130*X^5+180*X^6+140*X^7+58*X^8+10*X^9)*X^1 +
 C (34*X^3+179*X^4+378*X^5+400*X^6+212*X^7+45*X^8)*X^2 +
 C (4*X^2+108*X^3+412*X^4+636*X^5+448*X^6+120*X^7)*X^3 +
 C (24*X^2+243*X^3+610*X^4+602*X^5+210*X^6)*X^4 +
 C (72*X^2+356*X^3+532*X^4+252*X^5)*X^5 +
 C (8*X^1+120*X^2+308*X^3+210*X^4)*X^6 +
 C (20*X^1+112*X^2+120*X^3)*X^7 +
 C (1*X^0+23*X^1+45*X^2)*X^8 +
 C (2*X^0+10*X^1)*X^9 +
 C (1*X^0)*X^10 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_3_8_3M9E1 : (Bivariate.swap (frame [false,true,false]).mid.p).coeff 3=
 4*X^2+108*X^3+412*X^4+636*X^5+448*X^6+120*X^7 := by
 rw [small_poly_3_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_3_8_3M9E1 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [false,true,false]).mid.p i 3*coeff (frame [false,true,false]).mid.p (i+2) 3 ≤
 coeff (frame [false,true,false]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_3_8_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_3_8_4M9E1 : (Bivariate.swap (frame [false,true,false]).mid.p).coeff 4=
 24*X^2+243*X^3+610*X^4+602*X^5+210*X^6 := by
 rw [small_poly_3_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_3_8_4M9E1 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [false,true,false]).mid.p i 4*coeff (frame [false,true,false]).mid.p (i+2) 4 ≤
 coeff (frame [false,true,false]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_3_8_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
