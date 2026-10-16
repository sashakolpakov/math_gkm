import MarkovHorizontalB46
/-! Machine-authored de6168c6. Literal source expansion, second column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_vpoly_2_3MDE6 : (frame [true]).mid.p=
 C (1*X^3+1*X^4)*X^0 +
 C (4*X^2+4*X^3)*X^1 +
 C (1*X^0+5*X^1+6*X^2)*X^2 +
 C (2*X^0+4*X^1)*X^3 +
 C (1*X^0)*X^4 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_vcol_2_3MDE6 : ((frame [true]).mid.p).coeff 2=1*X^0+5*X^1+6*X^2 := by
 rw [small_vpoly_2_3MDE6]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_vlc_2_3MDE6 (j : ℕ) (hj : j ≤ 4) :
 coeff (frame [true]).mid.p 2 j*coeff (frame [true]).mid.p 2 (j+2) ≤
 coeff (frame [true]).mid.p 2 (j+1)^2 := by
 simp only [coeff,small_vcol_2_3MDE6]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
