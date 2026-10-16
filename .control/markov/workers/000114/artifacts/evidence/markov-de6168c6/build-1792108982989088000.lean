import MarkovHorizontalB46
/-! Machine-authored de6168c6. Literal source expansion, second column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_vpoly_4_5MDE6 : (frame [true,true,true]).mid.p=
 C (1*X^5+3*X^6+3*X^7+1*X^8)*X^0 +
 C (4*X^4+18*X^5+22*X^6+8*X^7)*X^1 +
 C (8*X^3+48*X^4+69*X^5+28*X^6)*X^2 +
 C (12*X^2+72*X^3+120*X^4+56*X^5)*X^3 +
 C (1*X^0+11*X^1+63*X^2+125*X^3+70*X^4)*X^4 +
 C (4*X^0+30*X^1+78*X^2+56*X^3)*X^5 +
 C (6*X^0+27*X^1+28*X^2)*X^6 +
 C (4*X^0+8*X^1)*X^7 +
 C (1*X^0)*X^8 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_vcol_4_5MDE6 : ((frame [true,true,true]).mid.p).coeff 2=8*X^3+48*X^4+69*X^5+28*X^6 := by
 rw [small_vpoly_4_5MDE6]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_vlc_4_5MDE6 (j : ℕ) (hj : j ≤ 8) :
 coeff (frame [true,true,true]).mid.p 2 j*coeff (frame [true,true,true]).mid.p 2 (j+2) ≤
 coeff (frame [true,true,true]).mid.p 2 (j+1)^2 := by
 simp only [coeff,small_vcol_4_5MDE6]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
