import MarkovColumnPolynomialMAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def column2MAE9 (n x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x+4)*(x+5)*(12*n^2*x^2+72*n^2*x+126*n^2-30*n*x^3-234*n*x^2-576*n*x-378*n+19*x^4+183*x^3+596*x^2+714*x+252)/30240
theorem column_explicit2MAE9 (n x : ℚ) : lowColumnMAE9 n x 2=column2MAE9 n x := by
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 simp only [binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,column2MAE9]
 ring
theorem source_column2MAE9 (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeRawM9E2 q r 5 j:ℚ)=column2MAE9 (sourceNME9C q r) j := by
 have h := source_column_polynomialMAE9 q j 2 r hj
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit2MAE9]
end
end MathGKM.Markov
