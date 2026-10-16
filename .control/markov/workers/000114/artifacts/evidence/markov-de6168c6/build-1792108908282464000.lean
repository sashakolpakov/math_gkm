import MarkovHorizontalB46
/-! Machine-authored de6168c6. Literal source expansion, second column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_vpoly_4_7MDE6 : (frame [true,false,false]).mid.p=
 C (1*X^7+3*X^8+3*X^9+1*X^10)*X^0 +
 C (12*X^6+32*X^7+30*X^8+10*X^9)*X^1 +
 C (8*X^4+64*X^5+144*X^6+132*X^7+45*X^8)*X^2 +
 C (4*X^2+40*X^3+176*X^4+360*X^5+336*X^6+120*X^7)*X^3 +
 C (1*X^0+11*X^1+71*X^2+269*X^3+550*X^4+546*X^5+210*X^6)*X^4 +
 C (6*X^0+54*X^1+232*X^2+528*X^3+588*X^4+252*X^5)*X^5 +
 C (15*X^0+106*X^1+312*X^2+420*X^3+210*X^4)*X^6 +
 C (20*X^0+104*X^1+192*X^2+120*X^3)*X^7 +
 C (15*X^0+51*X^1+45*X^2)*X^8 +
 C (6*X^0+10*X^1)*X^9 +
 C (1*X^0)*X^10 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V]
 norm_num
 ring
theorem small_vcol_4_7MDE6 : ((frame [true,false,false]).mid.p).coeff 2=8*X^4+64*X^5+144*X^6+132*X^7+45*X^8 := by
 rw [small_vpoly_4_7MDE6]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_vlc_4_7MDE6 (j : ℕ) (hj : j ≤ 10) :
 coeff (frame [true,false,false]).mid.p 2 j*coeff (frame [true,false,false]).mid.p 2 (j+2) ≤
 coeff (frame [true,false,false]).mid.p 2 (j+1)^2 := by
 simp only [coeff,small_vcol_4_7MDE6]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
