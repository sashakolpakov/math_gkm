import MarkovHorizontalB46
/-! Machine-authored de6168c6. Literal source expansion, second column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_vpoly_3_5MDE6 : (frame [true,false]).mid.p=
 C (1*X^5+2*X^6+1*X^7)*X^0 +
 C (8*X^4+14*X^5+7*X^6)*X^1 +
 C (4*X^2+24*X^3+40*X^4+21*X^5)*X^2 +
 C (1*X^0+8*X^1+34*X^2+60*X^3+35*X^4)*X^3 +
 C (4*X^0+23*X^1+50*X^2+35*X^3)*X^4 +
 C (6*X^0+22*X^1+21*X^2)*X^5 +
 C (4*X^0+7*X^1)*X^6 +
 C (1*X^0)*X^7 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_vcol_3_5MDE6 : ((frame [true,false]).mid.p).coeff 2=4*X^2+24*X^3+40*X^4+21*X^5 := by
 rw [small_vpoly_3_5MDE6]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_vlc_3_5MDE6 (j : ℕ) (hj : j ≤ 7) :
 coeff (frame [true,false]).mid.p 2 j*coeff (frame [true,false]).mid.p 2 (j+2) ≤
 coeff (frame [true,false]).mid.p 2 (j+1)^2 := by
 simp only [coeff,small_vcol_3_5MDE6]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
