import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_6_7M9E1 : Bivariate.swap (frame [true,true,true,true,true]).mid.p=
 C (1*X^6+6*X^7+15*X^8+20*X^9+15*X^10+6*X^11+1*X^12)*X^0 +
 C (17*X^6+80*X^7+150*X^8+140*X^9+65*X^10+12*X^11)*X^1 +
 C (20*X^5+188*X^6+504*X^7+590*X^8+320*X^9+66*X^10)*X^2 +
 C (16*X^4+264*X^5+1004*X^6+1480*X^7+945*X^8+220*X^9)*X^3 +
 C (12*X^3+256*X^4+1320*X^5+2450*X^6+1860*X^7+495*X^8)*X^4 +
 C (8*X^2+184*X^3+1200*X^4+2800*X^5+2562*X^6+792*X^7)*X^5 +
 C (4*X^1+96*X^2+760*X^3+2240*X^4+2520*X^5+924*X^6)*X^6 +
 C (1*X^0+32*X^1+324*X^2+1240*X^3+1770*X^4+792*X^5)*X^7 +
 C (5*X^0+84*X^1+455*X^2+870*X^3+495*X^4)*X^8 +
 C (10*X^0+100*X^1+285*X^2+220*X^3)*X^9 +
 C (10*X^0+56*X^1+66*X^2)*X^10 +
 C (5*X^0+12*X^1)*X^11 +
 C (1*X^0)*X^12 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_6_7_3M9E1 : (Bivariate.swap (frame [true,true,true,true,true]).mid.p).coeff 3=
 16*X^4+264*X^5+1004*X^6+1480*X^7+945*X^8+220*X^9 := by
 rw [small_poly_6_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_6_7_3M9E1 (i : ℕ) (hi : i ≤ 12) :
 coeff (frame [true,true,true,true,true]).mid.p i 3*coeff (frame [true,true,true,true,true]).mid.p (i+2) 3 ≤
 coeff (frame [true,true,true,true,true]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_6_7_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_6_7_4M9E1 : (Bivariate.swap (frame [true,true,true,true,true]).mid.p).coeff 4=
 12*X^3+256*X^4+1320*X^5+2450*X^6+1860*X^7+495*X^8 := by
 rw [small_poly_6_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_6_7_4M9E1 (i : ℕ) (hi : i ≤ 12) :
 coeff (frame [true,true,true,true,true]).mid.p i 4*coeff (frame [true,true,true,true,true]).mid.p (i+2) 4 ≤
 coeff (frame [true,true,true,true,true]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_6_7_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
