import MarkovGeneralMassM9C28
/-! Machine-authored request 9c28b628. Canonical binomial mass bridges.
These are exact identities for raw coefficients, without LC assumptions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem base_liftM9C28 (q i j d : ℕ) (r : Bool) (hi : 3 ≤ i)
 (hd : d+2*j+1=sourceNME9C q r) (hs : i+j ≤ sourceNME9C q r+2) :
 baseValueM13E q r i j=(liftOutputMAE9 d j (i-3):ℝ) := by
 rw [baseValueM13E,if_pos hs,lower_liftMBEB _ _ _ (by omega)]
 congr 2
 omega

theorem base_shortM9C28 (q i j H T : ℕ) (r : Bool) (hi : 3 ≤ i)
 (hH : H+sourceNME9C q r+2=2*(i+j)) (hT : T+j+1=sourceNME9C q r)
 (hs : i+j ≤ sourceNME9C q r+2) :
 baseValueM13E q r i j=(shortValueMBEB H T (i-3):ℝ) := by
 rw [baseValueM13E,if_pos hs,lower_shortMBEB _ _ _ H (by omega)]
 congr 2
 omega

theorem correction_liftM9C28 (q i j d J : ℕ) (r : Bool) (hi : 3 ≤ i)
 (hd : d+2*j+1=sourceNME9C q r) (hJ : J+q+1=j)
 (hs : i+j+q ≤ sourceNME9C q r) :
 correctionValueM13E q r i j=
 (4*affineIntMBEB (if r then 2 else 1) (i-1) (i-2) J d:ℤ) := by
 have hc : q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r := by omega
 rw [correctionValueM13E,if_pos hc,show j-q-1=J by omega,
   affine_shortMBEB _ (i-1) (i-2) J _ d (by omega)]
 have heps : correctionEpsilonM13E r=((if r then 2 else 1:ℕ):ℝ) := by
   cases r <;> norm_num [correctionEpsilonM13E]
 rw [heps,←affine_int_realMBEB]
 push_cast
 rfl

theorem correction_shortM9C28 (q i j H K : ℕ) (r : Bool) (hi : 3 ≤ i)
 (hH : H+sourceNME9C q r+2=2*(i+j)) (hK : K+q+i+j=sourceNME9C q r)
 (hj : q+1 ≤ j) :
 correctionValueM13E q r i j=
 (4*affineIntMBEB (if r then 2 else 1) (i-2) (i-1) K H:ℤ) := by
 have hc : q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r := by omega
 rw [correctionValueM13E,if_pos hc,show sourceNME9C q r-q-i-j=K by omega,
   affine_kernel_swapM13E,affine_shortMBEB _ (i-2) (i-1) K _ H (by omega)]
 have heps : correctionEpsilonM13E r=((if r then 2 else 1:ℕ):ℝ) := by
   cases r <;> norm_num [correctionEpsilonM13E]
 rw [heps,←affine_int_realMBEB]
 push_cast
 rfl

end
end MathGKM.Markov
