import MarkovHorizontalB46
/-! Machine-authored de6168c6. Literal source expansion, second column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_vpoly_3_4MDE6 : (frame [true,true]).mid.p=
 C (1*X^4+2*X^5+1*X^6)*X^0 +
 C (4*X^3+11*X^4+6*X^5)*X^1 +
 C (8*X^2+24*X^3+15*X^4)*X^2 +
 C (1*X^0+8*X^1+26*X^2+20*X^3)*X^3 +
 C (3*X^0+14*X^1+15*X^2)*X^4 +
 C (3*X^0+6*X^1)*X^5 +
 C (1*X^0)*X^6 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_vcol_3_4MDE6 : ((frame [true,true]).mid.p).coeff 2=8*X^2+24*X^3+15*X^4 := by
 rw [small_vpoly_3_4MDE6]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_vlc_3_4MDE6 (j : ℕ) (hj : j ≤ 6) :
 coeff (frame [true,true]).mid.p 2 j*coeff (frame [true,true]).mid.p 2 (j+2) ≤
 coeff (frame [true,true]).mid.p 2 (j+1)^2 := by
 simp only [coeff,small_vcol_3_4MDE6]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
