import MarkovColumnPolynomialMAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def column3MAE9 (n x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x+4)*(x+5)*(x+6)*(165*n^3*x^2+1155*n^3*x+2310*n^3-605*n^2*x^3-5610*n^2*x^2-16555*n^2*x-13860*n^2+748*n*x^4+8657*n*x^3+34463*n*x^2+52822*n*x+25410*n-312*x^5-4338*x^4-21942*x^3-48618*x^2-45570*x-13860)/9979200
theorem column_explicit3MAE9 (n x : ℚ) : lowColumnMAE9 n x 3=column3MAE9 n x := by
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 simp only [binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,column3MAE9]
 ring
theorem source_column3MAE9 (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeRawM9E2 q r 6 j:ℚ)=column3MAE9 (sourceNME9C q r) j := by
 have h := source_column_polynomialMAE9 q j 3 r hj
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit3MAE9]
end
end MathGKM.Markov
