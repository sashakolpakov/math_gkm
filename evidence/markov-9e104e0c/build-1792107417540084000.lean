import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_2_7M9E1 : Bivariate.swap (frame [false,false,true]).mid.p=
 C (1*X^2+6*X^3+15*X^4+20*X^5+15*X^6+6*X^7+1*X^8)*X^0 +
 C (5*X^2+28*X^3+62*X^4+68*X^5+37*X^6+8*X^7)*X^1 +
 C (14*X^2+68*X^3+122*X^4+96*X^5+28*X^6)*X^2 +
 C (30*X^2+108*X^3+135*X^4+56*X^5)*X^3 +
 C (4*X^1+47*X^2+110*X^3+70*X^4)*X^4 +
 C (8*X^1+51*X^2+56*X^3)*X^5 +
 C (12*X^1+28*X^2)*X^6 +
 C (1*X^0+8*X^1)*X^7 +
 C (1*X^0)*X^8 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_2_7_3M9E1 : (Bivariate.swap (frame [false,false,true]).mid.p).coeff 3=
 30*X^2+108*X^3+135*X^4+56*X^5 := by
 rw [small_poly_2_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_2_7_3M9E1 (i : ℕ) (hi : i ≤ 8) :
 coeff (frame [false,false,true]).mid.p i 3*coeff (frame [false,false,true]).mid.p (i+2) 3 ≤
 coeff (frame [false,false,true]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_2_7_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_2_7_4M9E1 : (Bivariate.swap (frame [false,false,true]).mid.p).coeff 4=
 4*X^1+47*X^2+110*X^3+70*X^4 := by
 rw [small_poly_2_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_2_7_4M9E1 (i : ℕ) (hi : i ≤ 8) :
 coeff (frame [false,false,true]).mid.p i 4*coeff (frame [false,false,true]).mid.p (i+2) 4 ≤
 coeff (frame [false,false,true]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_2_7_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
