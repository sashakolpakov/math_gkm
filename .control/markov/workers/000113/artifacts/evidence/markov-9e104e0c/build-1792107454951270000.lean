import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_5_8M9E1 : Bivariate.swap (frame [true,false,true]).mid.p=
 C (1*X^5+7*X^6+21*X^7+35*X^8+35*X^9+21*X^10+7*X^11+1*X^12)*X^0 +
 C (14*X^5+82*X^6+200*X^7+260*X^8+190*X^9+74*X^10+12*X^11)*X^1 +
 C (8*X^4+125*X^5+484*X^6+848*X^7+770*X^8+355*X^9+66*X^10)*X^2 +
 C (92*X^4+644*X^5+1592*X^6+1840*X^7+1020*X^8+220*X^9)*X^3 +
 C (32*X^3+512*X^4+1894*X^5+2870*X^6+1950*X^7+495*X^8)*X^4 +
 C (4*X^2+248*X^3+1480*X^4+3052*X^5+2604*X^6+792*X^7)*X^5 +
 C (72*X^2+760*X^3+2240*X^4+2478*X^5+924*X^6)*X^6 +
 C (12*X^1+248*X^2+1120*X^3+1680*X^4+792*X^5)*X^7 +
 C (1*X^0+47*X^1+365*X^2+795*X^3+495*X^4)*X^8 +
 C (4*X^0+70*X^1+250*X^2+220*X^3)*X^9 +
 C (6*X^0+47*X^1+66*X^2)*X^10 +
 C (4*X^0+12*X^1)*X^11 +
 C (1*X^0)*X^12 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_5_8_3M9E1 : (Bivariate.swap (frame [true,false,true]).mid.p).coeff 3=
 92*X^4+644*X^5+1592*X^6+1840*X^7+1020*X^8+220*X^9 := by
 rw [small_poly_5_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_5_8_3M9E1 (i : ℕ) (hi : i ≤ 12) :
 coeff (frame [true,false,true]).mid.p i 3*coeff (frame [true,false,true]).mid.p (i+2) 3 ≤
 coeff (frame [true,false,true]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_5_8_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_5_8_4M9E1 : (Bivariate.swap (frame [true,false,true]).mid.p).coeff 4=
 32*X^3+512*X^4+1894*X^5+2870*X^6+1950*X^7+495*X^8 := by
 rw [small_poly_5_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_5_8_4M9E1 (i : ℕ) (hi : i ≤ 12) :
 coeff (frame [true,false,true]).mid.p i 4*coeff (frame [true,false,true]).mid.p (i+2) 4 ≤
 coeff (frame [true,false,true]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_5_8_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
