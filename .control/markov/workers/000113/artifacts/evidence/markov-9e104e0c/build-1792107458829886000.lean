import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_5_6M9E1 : Bivariate.swap (frame [true,true,true,true]).mid.p=
 C (1*X^5+5*X^6+10*X^7+10*X^8+5*X^9+1*X^10)*X^0 +
 C (14*X^5+52*X^6+72*X^7+44*X^8+10*X^9)*X^1 +
 C (16*X^4+117*X^5+228*X^6+172*X^7+45*X^8)*X^2 +
 C (12*X^3+152*X^4+416*X^5+392*X^6+120*X^7)*X^3 +
 C (8*X^2+128*X^3+480*X^4+574*X^5+210*X^6)*X^4 +
 C (4*X^1+72*X^2+360*X^3+560*X^4+252*X^5)*X^5 +
 C (1*X^0+25*X^1+172*X^2+364*X^3+210*X^4)*X^6 +
 C (4*X^0+48*X^1+152*X^2+120*X^3)*X^7 +
 C (6*X^0+37*X^1+45*X^2)*X^8 +
 C (4*X^0+10*X^1)*X^9 +
 C (1*X^0)*X^10 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_5_6_3M9E1 : (Bivariate.swap (frame [true,true,true,true]).mid.p).coeff 3=
 12*X^3+152*X^4+416*X^5+392*X^6+120*X^7 := by
 rw [small_poly_5_6M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_5_6_3M9E1 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [true,true,true,true]).mid.p i 3*coeff (frame [true,true,true,true]).mid.p (i+2) 3 ≤
 coeff (frame [true,true,true,true]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_5_6_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_5_6_4M9E1 : (Bivariate.swap (frame [true,true,true,true]).mid.p).coeff 4=
 8*X^2+128*X^3+480*X^4+574*X^5+210*X^6 := by
 rw [small_poly_5_6M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_5_6_4M9E1 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [true,true,true,true]).mid.p i 4*coeff (frame [true,true,true,true]).mid.p (i+2) 4 ≤
 coeff (frame [true,true,true,true]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_5_6_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
