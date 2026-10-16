import MarkovVerticalSecondRightMDE6
/-! Machine-authored 762ebbae. Literal source expansion, third column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
theorem small_v3poly_5_9M762 : (frame [true,false,false,false]).mid.p=
 C (1*X^9+4*X^10+6*X^11+4*X^12+1*X^13)*X^0 +
 C (16*X^8+58*X^9+81*X^10+52*X^11+13*X^12)*X^1 +
 C (12*X^6+128*X^7+372*X^8+487*X^9+308*X^10+78*X^11)*X^2 +
 C (8*X^4+108*X^5+560*X^6+1372*X^7+1728*X^8+1100*X^9+286*X^10)*X^3 +
 C (4*X^2+56*X^3+372*X^4+1440*X^5+3220*X^6+4032*X^7+2640*X^8+715*X^9)*X^4 +
 C (1*X^0+14*X^1+117*X^2+644*X^3+2286*X^4+5040*X^5+6510*X^6+4488*X^7+1287*X^8)*X^5 +
 C (8*X^0+97*X^1+600*X^2+2276*X^3+5348*X^4+7434*X^5+5544*X^6+1716*X^7)*X^6 +
 C (28*X^0+288*X^1+1388*X^2+3812*X^3+6012*X^4+5016*X^5+1716*X^6)*X^7 +
 C (56*X^0+475*X^1+1752*X^2+3378*X^3+3300*X^4+1287*X^5)*X^8 +
 C (70*X^0+470*X^1+1257*X^2+1540*X^3+715*X^4)*X^9 +
 C (56*X^0+279*X^1+484*X^2+286*X^3)*X^10 +
 C (28*X^0+92*X^1+78*X^2)*X^11 +
 C (8*X^0+13*X^1)*X^12 +
 C (1*X^0)*X^13 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_v3col_5_9M762 : ((frame [true,false,false,false]).mid.p).coeff 3=8*X^4+108*X^5+560*X^6+1372*X^7+1728*X^8+1100*X^9+286*X^10 := by
 rw [small_v3poly_5_9M762]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_v3lc_5_9M762 (j : ℕ) (hj : j ≤ 13) :
 coeff (frame [true,false,false,false]).mid.p 3 j*coeff (frame [true,false,false,false]).mid.p 3 (j+2) ≤
 coeff (frame [true,false,false,false]).mid.p 3 (j+1)^2 := by
 simp only [coeff,small_v3col_5_9M762]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
