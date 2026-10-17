import MarkovSuppressionSumM9C28
/-! Machine-authored request 9c28b628. Uniform suppression of the entire
source correction by its base. This is not a log-concavity theorem. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem base_nonnegM9C28 (q i j : ℕ) (r : Bool) : 0 ≤ baseValueM13E q r i j := by
 unfold baseValueM13E
 split_ifs
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · norm_num

theorem source_correction_suppressedM9C28 (q i j : ℕ) (r : Bool) (hi : 3 ≤ i) :
 (2:ℝ)*(i+1)*correctionValueM13E q r i j ≤ baseValueM13E q r i j := by
 by_cases hc : q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r
 · let t := i-3
   let J := j-q-1
   let K := sourceNME9C q r-q-i-j
   let e : ℕ := if r then 2 else 1
   have ht : t+3=i := by dsimp [t]; omega
   have hJ : J+q+1=j := by dsimp [J]; omega
   have hK : K+q+i+j=sourceNME9C q r := by dsimp [K]; omega
   have he : 1 ≤ e := by cases r <;> simp [e]
   have hj : 2*J+K+t+e+2=j := by
     cases r <;> simp [e,sourceNME9C] at * <;> omega
   have hk : J+2*K+t+e+3=sourceNME9C q r+2-i-j := by
     cases r <;> simp [e,sourceNME9C] at * <;> omega
   have h := suppression_kernelM9C28 e t J K he
   rw [hj,hk] at h
   have heps : correctionEpsilonM13E r=(e:ℝ) := by cases r <;> simp [correctionEpsilonM13E,e]
   rw [correctionValueM13E,if_pos hc,baseValueM13E,if_pos (by omega : i+j ≤ sourceNME9C q r+2),heps]
   have h1 : i-1=t+2 := by omega
   have h2 : i-2=t+1 := by omega
   rw [h1,h2]
   change 2*((i:ℝ)+1)*(4*affineKernelM13E e (t+2) (t+1) J K) ≤ _
   have hiR : (t+4:ℕ)=(i+1) := by omega
   simpa only [hiR,Nat.cast_add,Nat.cast_one] using h
 · rw [correctionValueM13E,if_neg hc,mul_zero]
   exact base_nonnegM9C28 q i j r

theorem raw_excess_suppressedM9C28 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 (2:ℝ)*(i+1)*((threeRawM9E2 q r i j:ℝ)-baseValueM13E q r i j) ≤
   baseValueM13E q r i j := by
 rw [source_two_kernelMED6 q i j r hq hi,add_sub_cancel_left]
 exact source_correction_suppressedM9C28 q i j r hi

end
end MathGKM.Markov
