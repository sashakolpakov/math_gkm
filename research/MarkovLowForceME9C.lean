import MarkovLowDifferenceME9C
/-! Machine-authored e9cdd527. Exact forcing in the lower source region. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def sourceNME9C (q : ℕ) (r : Bool) : ℕ := 3*q+(if r then 1 else 2)
def lowForceThreeME9C (x : ℚ) : ℚ :=
 deltaThreeME9C x+2*deltaThreeME9C (x-1)+deltaThreeME9C (x-2)
def lowForceFourME9C (n x : ℚ) : ℚ :=
 deltaFourME9C n x+2*deltaFourME9C n (x-1)+deltaFourME9C n (x-2)+
 2*deltaThreeME9C x+2*deltaThreeME9C (x-1)

theorem source_n_gtME9C (q j : ℕ) (r : Bool) (hj : j ≤ q) : j < sourceNME9C q r := by
 cases r  <;> simp [sourceNME9C]  <;> omega

theorem low_force_baseME9C (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeForceM96A q r i j=
 addSRawM9E2 (addSRawM9E2 (fibDeltaME9C (sourceNME9C q r))) i j := by
 simp only [threeForceM96A,shiftRawM9E2,
   show ¬(1 ≤ i ∧ q+1 ≤ j) by omega,if_false,mul_zero,add_zero]
 rfl

theorem low_force_threeME9C (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeForceM96A q r 3 j:ℚ)=lowForceThreeME9C j := by
 rw [low_force_baseME9C q 3 j r hj]
 have hn := source_n_gtME9C q j r hj
 rcases j with _|_|j
 · simp [addSRawM9E2,shiftRawM9E2,fib_delta_oneME9C _ _ hn,
     fib_delta_twoME9C _ _ hn,fib_delta_threeME9C _ _ hn,
     lowForceThreeME9C,deltaThreeME9C]
 · have h0 : 0 < sourceNME9C q r := by omega
   simp [addSRawM9E2,shiftRawM9E2,fib_delta_oneME9C _ _ hn,
     fib_delta_twoME9C _ _ hn,fib_delta_twoME9C _ _ h0,
     lowForceThreeME9C,Int.cast_add,fib_delta_threeME9C _ _ hn,
     fib_delta_threeME9C _ _ h0,deltaThreeME9C]
   ring
 · have h0 : j < sourceNME9C q r := by omega
   have h1 : j+1 < sourceNME9C q r := by omega
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

theorem low_force_fourME9C (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeForceM96A q r 4 j:ℚ)=lowForceFourME9C (sourceNME9C q r) j := by
 rw [low_force_baseME9C q 4 j r hj]
 have hn := source_n_gtME9C q j r hj
 rcases j with _|_|j
 · simp [addSRawM9E2,shiftRawM9E2,fib_delta_twoME9C _ _ hn,
     lowForceFourME9C,Int.cast_add,fib_delta_threeME9C _ _ hn,
     fib_delta_fourME9C _ _ hn,deltaThreeME9C,deltaFourME9C]
   ring
 · have h0 : 0 < sourceNME9C q r := by omega
   simp [addSRawM9E2,shiftRawM9E2,fib_delta_twoME9C _ _ hn,
     lowForceFourME9C,Int.cast_add,fib_delta_threeME9C _ _ hn,
     fib_delta_threeME9C _ _ h0,fib_delta_fourME9C _ _ hn,
     fib_delta_fourME9C _ _ h0,deltaThreeME9C,deltaFourME9C]
   ring
 · have h0 : j < sourceNME9C q r := by omega
   have h1 : j+1 < sourceNME9C q r := by omega
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
