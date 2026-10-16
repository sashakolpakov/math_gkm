import MarkovHorizontalB46
/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_poly_3_7M9E1 : Bivariate.swap (frame [false,true,true]).mid.p=
 C (1*X^3+6*X^4+15*X^5+20*X^6+15*X^7+6*X^8+1*X^9)*X^0 +
 C (8*X^3+41*X^4+84*X^5+86*X^6+44*X^7+9*X^8)*X^1 +
 C (34*X^3+136*X^4+206*X^5+140*X^6+36*X^7)*X^2 +
 C (8*X^2+104*X^3+265*X^4+252*X^5+84*X^6)*X^3 +
 C (36*X^2+195*X^3+280*X^4+126*X^5)*X^4 +
 C (4*X^1+80*X^2+196*X^3+126*X^4)*X^5 +
 C (16*X^1+84*X^2+84*X^3)*X^6 +
 C (1*X^0+20*X^1+36*X^2)*X^7 +
 C (2*X^0+9*X^1)*X^8 +
 C (1*X^0)*X^9 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring

theorem small_row_3_7_3M9E1 : (Bivariate.swap (frame [false,true,true]).mid.p).coeff 3=
 8*X^2+104*X^3+265*X^4+252*X^5+84*X^6 := by
 rw [small_poly_3_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_3_7_3M9E1 (i : ℕ) (hi : i ≤ 9) :
 coeff (frame [false,true,true]).mid.p i 3*coeff (frame [false,true,true]).mid.p (i+2) 3 ≤
 coeff (frame [false,true,true]).mid.p (i+1) 3^2 := by
 simp only [←swap_coeff46,small_row_3_7_3M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_row_3_7_4M9E1 : (Bivariate.swap (frame [false,true,true]).mid.p).coeff 4=
 36*X^2+195*X^3+280*X^4+126*X^5 := by
 rw [small_poly_3_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num

theorem small_lc_3_7_4M9E1 (i : ℕ) (hi : i ≤ 9) :
 coeff (frame [false,true,true]).mid.p i 4*coeff (frame [false,true,true]).mid.p (i+2) 4 ≤
 coeff (frame [false,true,true]).mid.p (i+1) 4^2 := by
 simp only [←swap_coeff46,small_row_3_7_4M9E1]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

end
end MathGKM.Markov
