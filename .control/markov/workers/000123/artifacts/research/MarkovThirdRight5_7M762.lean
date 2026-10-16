import MarkovVerticalSecondRightMDE6
/-! Machine-authored 762ebbae. Literal source expansion, third column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
theorem small_v3poly_5_7M762 : (frame [true,true,false]).mid.p=
 C (1*X^7+4*X^8+6*X^9+4*X^10+1*X^11)*X^0 +
 C (8*X^6+36*X^7+59*X^8+42*X^9+11*X^10)*X^1 +
 C (32*X^5+148*X^6+260*X^7+198*X^8+55*X^9)*X^2 +
 C (4*X^3+80*X^4+360*X^5+672*X^6+552*X^7+165*X^8)*X^3 +
 C (12*X^2+128*X^3+560*X^4+1120*X^5+1008*X^6+330*X^7)*X^4 +
 C (1*X^0+14*X^1+125*X^2+564*X^3+1246*X^4+1260*X^5+462*X^6)*X^5 +
 C (6*X^0+67*X^1+356*X^2+924*X^3+1092*X^4+462*X^5)*X^6 +
 C (15*X^0+128*X^1+440*X^2+648*X^3+330*X^4)*X^7 +
 C (20*X^0+122*X^1+252*X^2+165*X^3)*X^8 +
 C (15*X^0+58*X^1+55*X^2)*X^9 +
 C (6*X^0+11*X^1)*X^10 +
 C (1*X^0)*X^11 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_v3col_5_7M762 : ((frame [true,true,false]).mid.p).coeff 3=4*X^3+80*X^4+360*X^5+672*X^6+552*X^7+165*X^8 := by
 rw [small_v3poly_5_7M762]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_v3lc_5_7M762 (j : ℕ) (hj : j ≤ 11) :
 coeff (frame [true,true,false]).mid.p 3 j*coeff (frame [true,true,false]).mid.p 3 (j+2) ≤
 coeff (frame [true,true,false]).mid.p 3 (j+1)^2 := by
 simp only [coeff,small_v3col_5_7M762]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
