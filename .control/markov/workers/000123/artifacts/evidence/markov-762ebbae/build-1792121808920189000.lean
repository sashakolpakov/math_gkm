import MarkovVerticalSecondRightMDE6
/-! Machine-authored 762ebbae. Literal source expansion, third column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
theorem small_v3poly_6_7M762 : (frame [true,true,true,true,true]).mid.p=
 C (1*X^7+5*X^8+10*X^9+10*X^10+5*X^11+1*X^12)*X^0 +
 C (4*X^6+32*X^7+84*X^8+100*X^9+56*X^10+12*X^11)*X^1 +
 C (8*X^5+96*X^6+324*X^7+455*X^8+285*X^9+66*X^10)*X^2 +
 C (12*X^4+184*X^5+760*X^6+1240*X^7+870*X^8+220*X^9)*X^3 +
 C (16*X^3+256*X^4+1200*X^5+2240*X^6+1770*X^7+495*X^8)*X^4 +
 C (20*X^2+264*X^3+1320*X^4+2800*X^5+2520*X^6+792*X^7)*X^5 +
 C (1*X^0+17*X^1+188*X^2+1004*X^3+2450*X^4+2562*X^5+924*X^6)*X^6 +
 C (6*X^0+80*X^1+504*X^2+1480*X^3+1860*X^4+792*X^5)*X^7 +
 C (15*X^0+150*X^1+590*X^2+945*X^3+495*X^4)*X^8 +
 C (20*X^0+140*X^1+320*X^2+220*X^3)*X^9 +
 C (15*X^0+65*X^1+66*X^2)*X^10 +
 C (6*X^0+12*X^1)*X^11 +
 C (1*X^0)*X^12 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_v3col_6_7M762 : ((frame [true,true,true,true,true]).mid.p).coeff 3=12*X^4+184*X^5+760*X^6+1240*X^7+870*X^8+220*X^9 := by
 rw [small_v3poly_6_7M762]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_v3lc_6_7M762 (j : ℕ) (hj : j ≤ 12) :
 coeff (frame [true,true,true,true,true]).mid.p 3 j*coeff (frame [true,true,true,true,true]).mid.p 3 (j+2) ≤
 coeff (frame [true,true,true,true,true]).mid.p 3 (j+1)^2 := by
 simp only [coeff,small_v3col_6_7M762]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
