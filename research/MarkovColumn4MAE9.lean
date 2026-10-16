import MarkovColumnPolynomialMAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
def column4MAE9 (n x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x+4)*(x+5)*(x+6)*(x+7)*(715*n^4*x^2+5720*n^4*x+12870*n^4-3432*n^3*x^3-36894*n^3*x^2-126984*n^3*x-128700*n^3+6240*n^2*x^4+84396*n^2*x^3+397397*n^2*x^2+741052*n^2*x+450450*n^2-5096*n*x^5-83200*n*x^4-500812*n*x^3-1352234*n*x^2-1597908*n*x-643500*n+1578*x^6+30228*x^5+222504*x^4+789132*x^3+1389978*x^2+1118700*x+308880)/1556755200
theorem column_explicit4MAE9 (n x : ℚ) : lowColumnMAE9 n x 4=column4MAE9 n x := by
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 simp only [binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,binomial_poly_12M295,binomial_poly_13M295,column4MAE9]
 ring
theorem source_column4MAE9 (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeRawM9E2 q r 7 j:ℚ)=column4MAE9 (sourceNME9C q r) j := by
 have h := source_column_polynomialMAE9 q j 4 r hj
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit4MAE9]
end
end MathGKM.Markov
