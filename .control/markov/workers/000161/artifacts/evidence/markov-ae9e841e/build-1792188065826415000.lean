import MarkovColumnPolynomialMAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def column1MAE9 (n x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x+4)*(14*n*x^2+70*n*x+105*n-18*x^3-114*x^2-225*x-105)/2520
theorem column_explicit1MAE9 (n x : ℚ) : lowColumnMAE9 n x 1=column1MAE9 n x := by
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 simp only [binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,column1MAE9]
 ring
theorem source_column1MAE9 (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeRawM9E2 q r 4 j:ℚ)=column1MAE9 (sourceNME9C q r) j := by
 have h := source_column_polynomialMAE9 q j 1 r hj
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit1MAE9]
end
end MathGKM.Markov
