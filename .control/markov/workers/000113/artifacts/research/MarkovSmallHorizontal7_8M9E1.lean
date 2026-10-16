import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_7_8M9E1 : Bivariate.swap (frame [true,true,true,true,true,true]).mid.p=
 C (1*X^7+7*X^8+21*X^9+35*X^10+35*X^11+21*X^12+7*X^13+1*X^14)*X^0 +
 C (20*X^7+114*X^8+270*X^9+340*X^10+240*X^11+90*X^12+14*X^13)*X^1 +
 C (24*X^6+276*X^7+945*X^8+1510*X^9+1260*X^10+534*X^11+91*X^12)*X^2 +
 C (20*X^5+408*X^6+2000*X^7+4060*X^8+4020*X^9+1936*X^10+364*X^11)*X^3 +
 C (16*X^4+432*X^5+2880*X^6+7370*X^7+8685*X^8+4785*X^9+1001*X^10)*X^4 +
 C (12*X^3+360*X^4+3000*X^5+9520*X^6+13392*X^7+8514*X^8+2002*X^9)*X^5 +
 C (8*X^2+240*X^3+2320*X^4+8960*X^5+15120*X^6+11220*X^7+3003*X^8)*X^6 +
 C (4*X^1+120*X^2+1320*X^3+6160*X^4+12600*X^5+11088*X^6+3432*X^7)*X^7 +
 C (1*X^0+39*X^1+525*X^2+3035*X^3+7695*X^4+8217*X^5+3003*X^6)*X^8 +
 C (6*X^0+130*X^1+1020*X^2+3360*X^3+4510*X^4+2002*X^5)*X^9 +
 C (15*X^0+210*X^1+996*X^2+1782*X^3+1001*X^4)*X^10 +
 C (20*X^0+180*X^1+480*X^2+364*X^3)*X^11 +
 C (15*X^0+79*X^1+91*X^2)*X^12 +
 C (6*X^0+14*X^1)*X^13 +
 C (1*X^0)*X^14 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_7_8_3M9E1 : (Bivariate.swap (frame [true,true,true,true,true,true]).mid.p).coeff 3=
 20*X^5+408*X^6+2000*X^7+4060*X^8+4020*X^9+1936*X^10+364*X^11 := by
 rw [small_poly_7_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_7_8_3M9E1 (i : ℕ) (hi : i ≤ 14) :
 coeff (frame [true,true,true,true,true,true]).mid.p i 3*coeff (frame [true,true,true,true,true,true]).mid.p (i+2) 3 ≤
 coeff (frame [true,true,true,true,true,true]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_7_8_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_7_8_4M9E1 : (Bivariate.swap (frame [true,true,true,true,true,true]).mid.p).coeff 4=
 16*X^4+432*X^5+2880*X^6+7370*X^7+8685*X^8+4785*X^9+1001*X^10 := by
 rw [small_poly_7_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_7_8_4M9E1 (i : ℕ) (hi : i ≤ 14) :
 coeff (frame [true,true,true,true,true,true]).mid.p i 4*coeff (frame [true,true,true,true,true,true]).mid.p (i+2) 4 ≤
 coeff (frame [true,true,true,true,true,true]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_7_8_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
