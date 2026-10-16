import MarkovLowerUniformME9C
/-! Machine-authored request 1bb0aa1e. Exact first-tail forcing, with guards. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem lower_force_twoM1BB (n j : ℕ) (hj : j < n) : lowerForceME9C n 2 j=0 := by
 unfold lowerForceME9C addSRawM9E2 shiftRawM9E2
 split_ifs <;> simp_all only [Nat.sub_zero, Nat.reduceSub]
 all_goals
   simp_all [fib_delta_axisME9C, fib_delta_oneME9C, fib_delta_twoME9C,
     show j-1<n by omega, show j-1-1<n by omega]

theorem lower_force_threeM1BB (n j : ℕ) (hj : j < n) :
 (lowerForceME9C n 3 j:ℚ)=lowForceThreeME9C j := by
 unfold lowerForceME9C
 have hn := hj
 rcases j with _|_|j
 · simp [addSRawM9E2,shiftRawM9E2,fib_delta_oneME9C _ _ hn,
     fib_delta_twoME9C _ _ hn,fib_delta_threeME9C _ _ hn,
     lowForceThreeME9C,deltaThreeME9C]
 · have h0 : 0 < n := by omega
   simp [addSRawM9E2,shiftRawM9E2,fib_delta_oneME9C _ _ hn,
     fib_delta_twoME9C _ _ hn,fib_delta_twoME9C _ _ h0,
     lowForceThreeME9C,Int.cast_add,fib_delta_threeME9C _ _ hn,
     fib_delta_threeME9C _ _ h0,deltaThreeME9C]
   ring
 · have h0 : j < n := by omega
   have h1 : j+1 < n := by omega
   simp only [addSRawM9E2,shiftRawM9E2]
   simp only [show 1 ≤ j+1+1 by omega,show 1 ≤ j+1 by omega,
     Nat.zero_le,Nat.reduceLeDiff, true_and,and_self,if_true,Nat.sub_zero,
     Nat.add_sub_cancel,Nat.reduceSub]
   rw [fib_delta_oneME9C _ _ hn,fib_delta_twoME9C _ _ hn,
     fib_delta_twoME9C _ _ h1]
   push_cast
   rw [fib_delta_threeME9C _ _ h0,fib_delta_threeME9C _ _ h1,
     fib_delta_threeME9C _ _ hn]
   unfold lowForceThreeME9C deltaThreeME9C
   push_cast
   ring

theorem lower_force_fourM1BB (n j : ℕ) (hj : j < n) :
 (lowerForceME9C n 4 j:ℚ)=lowForceFourME9C (n) j := by
 unfold lowerForceME9C
 have hn := hj
 rcases j with _|_|j
 · simp [addSRawM9E2,shiftRawM9E2,fib_delta_twoME9C _ _ hn,
     lowForceFourME9C,Int.cast_add,fib_delta_threeME9C _ _ hn,
     fib_delta_fourME9C _ _ hn,deltaThreeME9C,deltaFourME9C]
   ring
 · have h0 : 0 < n := by omega
   simp [addSRawM9E2,shiftRawM9E2,fib_delta_twoME9C _ _ hn,
     lowForceFourME9C,Int.cast_add,fib_delta_threeME9C _ _ hn,
     fib_delta_threeME9C _ _ h0,fib_delta_fourME9C _ _ hn,
     fib_delta_fourME9C _ _ h0,deltaThreeME9C,deltaFourME9C]
   ring
 · have h0 : j < n := by omega
   have h1 : j+1 < n := by omega
   simp only [addSRawM9E2,shiftRawM9E2]
   simp only [show 1 ≤ j+1+1 by omega,show 1 ≤ j+1 by omega,
     Nat.zero_le,Nat.reduceLeDiff,true_and,and_self,if_true,Nat.sub_zero,
     Nat.add_sub_cancel,Nat.reduceSub]
   rw [fib_delta_twoME9C _ _ hn]
   push_cast
   rw [fib_delta_threeME9C _ _ h1,fib_delta_threeME9C _ _ hn,
     fib_delta_fourME9C _ _ h0,fib_delta_fourME9C _ _ h1,fib_delta_fourME9C _ _ hn]
   unfold lowForceFourME9C deltaThreeME9C deltaFourME9C
   push_cast
   ring

end
end MathGKM.Markov
