import MarkovBandPolynomialM657
/-! Machine-authored 6576ccc5. Universal raw correction-band inequality at
starting column 3, checked by exact rational polynomial arithmetic. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 16000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2

theorem band_column3_certificateM657 (d k : ℚ) (r : Bool) (hd : 0 ≤ d) (hk : 0 ≤ k) :
 bandColumnM657 d k 0 r*bandColumnM657 d k 2 r ≤ bandColumnM657 d k 1 r^2 := by
 apply sub_nonneg.mp
 cases r <;> simp only [bandColumnM657,lowColumnMAE9,correctionPolyM657,
   Bool.false_eq_true,if_false,if_true]
 all_goals
   simp only [sum_range_succ,sum_range_zero]
   norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
     Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
   simp only [binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295]
   ring_nf
   positivity

theorem source_band_column3_parameterM657 (d k : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 threeRawM9E2 (d+2*k+(if r then 2 else 1)) r 3 ((d+2*k+(if r then 2 else 1))+k+1)*
 threeRawM9E2 (d+2*k+(if r then 2 else 1)) r 5 ((d+2*k+(if r then 2 else 1))+k+1) ≤
 threeRawM9E2 (d+2*k+(if r then 2 else 1)) r 4 ((d+2*k+(if r then 2 else 1))+k+1)^2 := by
 have h0 := source_band_polynomialM657 d k 0 r hq
 have h1 := source_band_polynomialM657 d k 1 r hq
 have h2 := source_band_polynomialM657 d k 2 r hq
 norm_num only [Nat.reduceAdd] at h0 h1 h2
 have h := band_column3_certificateM657 (d:ℚ) (k:ℚ) r (by positivity) (by positivity)
 rw [←h0,←h1,←h2] at h
 exact_mod_cast h

end
end MathGKM.Markov
