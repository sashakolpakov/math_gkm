import MarkovBandSumM831
/-! Machine-authored 831d426f. Real-rootedness of all correction factors is
false; this is an auxiliary obstruction, not a counterexample to raw LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem band_boundary_twoM831 :
 bandAtM139 0 2 false=72+96*X+40*X^2 := by
 ext i
 rw [band_boundary_positive_formulaM831]
 by_cases hi : i ≤ 2
 · interval_cases i <;> norm_num [boundaryBinomialM831,Nat.choose,coeff_add,
     coeff_ofNat_mul,coeff_X_pow,coeff_X]
 · rw [boundary_binomial_tailM831 2 i false (by omega)]
   rw [show (72:Polynomial ℤ)=C 72 by norm_num]
   simp only [coeff_add,coeff_ofNat_mul,coeff_C,coeff_X_pow,coeff_X,
     if_neg (by omega : i≠0),if_neg (by omega : 1≠i),if_neg (by omega : i≠2),
     mul_zero,add_zero]

theorem band_boundary_two_eval_positiveM831 (x : ℝ) :
 0 < ((bandAtM139 0 2 false).map (Int.castRingHom ℝ)).eval x := by
 rw [band_boundary_twoM831]
 norm_num
 nlinarith [sq_nonneg (5*x+6)]

theorem band_boundary_two_gapM831 :
 (bandAtM139 0 2 false).coeff 1^2-
 (bandAtM139 0 2 false).coeff 0*(bandAtM139 0 2 false).coeff 2=6336 := by
 rw [band_boundary_twoM831]
 norm_num [coeff_add,coeff_ofNat_mul,coeff_X_pow,coeff_X]

end
end MathGKM.Markov
