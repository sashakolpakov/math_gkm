import MarkovVerticalSecondRightMDE6
/-! Machine-authored 762ebbae. Literal source expansion, third column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
theorem small_v3poly_5_6M762 : (frame [true,true,true,true]).mid.p=
 C (1*X^6+4*X^7+6*X^8+4*X^9+1*X^10)*X^0 +
 C (4*X^5+25*X^6+48*X^7+37*X^8+10*X^9)*X^1 +
 C (8*X^4+72*X^5+172*X^6+152*X^7+45*X^8)*X^2 +
 C (12*X^3+128*X^4+360*X^5+364*X^6+120*X^7)*X^3 +
 C (16*X^2+152*X^3+480*X^4+560*X^5+210*X^6)*X^4 +
 C (1*X^0+14*X^1+117*X^2+416*X^3+574*X^4+252*X^5)*X^5 +
 C (5*X^0+52*X^1+228*X^2+392*X^3+210*X^4)*X^6 +
 C (10*X^0+72*X^1+172*X^2+120*X^3)*X^7 +
 C (10*X^0+44*X^1+45*X^2)*X^8 +
 C (5*X^0+10*X^1)*X^9 +
 C (1*X^0)*X^10 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_v3col_5_6M762 : ((frame [true,true,true,true]).mid.p).coeff 3=12*X^3+128*X^4+360*X^5+364*X^6+120*X^7 := by
 rw [small_v3poly_5_6M762]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_v3lc_5_6M762 (j : ℕ) (hj : j ≤ 10) :
 coeff (frame [true,true,true,true]).mid.p 3 j*coeff (frame [true,true,true,true]).mid.p 3 (j+2) ≤
 coeff (frame [true,true,true,true]).mid.p 3 (j+1)^2 := by
 simp only [coeff,small_v3col_5_6M762]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
