import MarkovVerticalSecondRightMDE6
/-! Machine-authored 762ebbae. Literal source expansion, third column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
theorem small_v3poly_5_8M762 : (frame [true,false,true]).mid.p=
 C (1*X^8+4*X^9+6*X^10+4*X^11+1*X^12)*X^0 +
 C (12*X^7+47*X^8+70*X^9+47*X^10+12*X^11)*X^1 +
 C (4*X^5+72*X^6+248*X^7+365*X^8+250*X^9+66*X^10)*X^2 +
 C (32*X^4+248*X^5+760*X^6+1120*X^7+795*X^8+220*X^9)*X^3 +
 C (8*X^2+92*X^3+512*X^4+1480*X^5+2240*X^6+1680*X^7+495*X^8)*X^4 +
 C (1*X^0+14*X^1+125*X^2+644*X^3+1894*X^4+3052*X^5+2478*X^6+792*X^7)*X^5 +
 C (7*X^0+82*X^1+484*X^2+1592*X^3+2870*X^4+2604*X^5+924*X^6)*X^6 +
 C (21*X^0+200*X^1+848*X^2+1840*X^3+1950*X^4+792*X^5)*X^7 +
 C (35*X^0+260*X^1+770*X^2+1020*X^3+495*X^4)*X^8 +
 C (35*X^0+190*X^1+355*X^2+220*X^3)*X^9 +
 C (21*X^0+74*X^1+66*X^2)*X^10 +
 C (7*X^0+12*X^1)*X^11 +
 C (1*X^0)*X^12 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_v3col_5_8M762 : ((frame [true,false,true]).mid.p).coeff 3=32*X^4+248*X^5+760*X^6+1120*X^7+795*X^8+220*X^9 := by
 rw [small_v3poly_5_8M762]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_v3lc_5_8M762 (j : ℕ) (hj : j ≤ 12) :
 coeff (frame [true,false,true]).mid.p 3 j*coeff (frame [true,false,true]).mid.p 3 (j+2) ≤
 coeff (frame [true,false,true]).mid.p 3 (j+1)^2 := by
 simp only [coeff,small_v3col_5_8M762]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
