import MarkovFivePolynomialM468
/-! Machine-authored 4687d03f. Exact source forcing in column five. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem fib_delta_fiveM468 (n j : ℕ) (hj : j < n) :
 (fibDeltaME9C n 5 j:ℚ)=deltaFiveM468 n j := by
 rw [fib_delta_highME9C n 2 j hj]
 simp only [Int.cast_mul,Int.cast_natCast]
 norm_num only [Nat.reduceAdd] at ⊢
 rw [choose_poly_natM0D3,choose_poly_natM0D3,binomial_poly_2M295,binomial_poly_5M295]
 rw [Nat.cast_sub (by omega : 1 ≤ n-j),Nat.cast_sub (by omega : j ≤ n)]
 unfold deltaFiveM468
 push_cast
 ring

theorem low_force_fiveM468 (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeForceM96A q r 5 j:ℚ)=lowForceFiveM468 (sourceNME9C q r) j := by
 rw [low_force_baseME9C q 5 j r hj]
 have hn := source_n_gtME9C q j r hj
 rcases j with _|_|j
 · simp [addSRawM9E2,shiftRawM9E2,lowForceFiveM468,Int.cast_add,
     fib_delta_threeME9C _ _ hn,fib_delta_fourME9C _ _ hn,fib_delta_fiveM468 _ _ hn,
     deltaThreeME9C,deltaFourME9C,deltaFiveM468]
   ring
 · have h0 : 0 < sourceNME9C q r := by omega
   simp [addSRawM9E2,shiftRawM9E2,lowForceFiveM468,Int.cast_add,
     fib_delta_threeME9C _ _ hn,fib_delta_fourME9C _ _ hn,
     fib_delta_fourME9C _ _ h0,fib_delta_fiveM468 _ _ hn,fib_delta_fiveM468 _ _ h0,
     deltaThreeME9C,deltaFourME9C,deltaFiveM468]
   ring
 · have h0 : j < sourceNME9C q r := by omega
   have h1 : j+1 < sourceNME9C q r := by omega
   simp only [addSRawM9E2,shiftRawM9E2]
   simp only [show 1 ≤ j+1+1 by omega,show 1 ≤ j+1 by omega,
     Nat.zero_le,Nat.reduceLeDiff,true_and,and_self,if_true,Nat.sub_zero,
     Nat.add_sub_cancel,Nat.reduceSub]
   push_cast
   rw [fib_delta_threeME9C _ _ hn,
     fib_delta_fourME9C _ _ h1,fib_delta_fourME9C _ _ hn,
     fib_delta_fiveM468 _ _ h0,fib_delta_fiveM468 _ _ h1,fib_delta_fiveM468 _ _ hn]
   unfold lowForceFiveM468 deltaFiveM468 deltaFourME9C deltaThreeME9C
   push_cast
   ring

end
end MathGKM.Markov
