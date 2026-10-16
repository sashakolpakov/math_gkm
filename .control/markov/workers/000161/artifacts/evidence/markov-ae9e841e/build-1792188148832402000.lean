import MarkovColumnPolynomialMAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def column5MAE9 (n x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x+4)*(x+5)*(x+6)*(x+7)*(x+8)*(2002*n^5*x^2+18018*n^5*x+45045*n^5-11830*n^4*x^3-144690*n^4*x^2-569205*n^4*x-675675*n^4+28210*n^3*x^4+436800*n^3*x^3+2376010*n^3*x^2+5217030*n^3*x+3828825*n^3-33950*n^2*x^5-636930*n^2*x^4-4449690*n^2*x^3-14175630*n^2*x^2-20218275*n^2*x-10135125*n^2+20630*n*x^6+455160*n*x^5+3896775*n*x^4+16310160*n*x^3+34601323*n*x^2+34535682*n*x+12342330*n-5066*x^7-128634*x^6-1306835*x^5-6795945*x^4-19233569*x^3-29016381*x^2-20990970*x-5405400)/217945728000
theorem column_explicit5MAE9 (n x : ℚ) : lowColumnMAE9 n x 5=column5MAE9 n x := by
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 simp only [binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,binomial_poly_12M295,binomial_poly_13M295,binomial_poly_14M295,binomial_poly_15M295,column5MAE9]
 ring
theorem source_column5MAE9 (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeRawM9E2 q r 8 j:ℚ)=column5MAE9 (sourceNME9C q r) j := by
 have h := source_column_polynomialMAE9 q j 5 r hj
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit5MAE9]
end
end MathGKM.Markov
