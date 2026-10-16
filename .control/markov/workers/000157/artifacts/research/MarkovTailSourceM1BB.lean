import MarkovTailCorrectionM1BB
/-! Machine-authored 1bb0aa1e. Raw source coefficients at the first tail row.
The q=1 case is included without truncating a negative exponent. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] lowerRawME9C lowerForceME9C threeRawM9E2

def tailTwoM1BB (r : Bool) : ℚ := if r then 8 else 4
def tailThreeM1BB (q : ℚ) (r : Bool) : ℚ := if r then 8*(q-2) else 4*(q-1)
def tailFourM1BB (q : ℚ) (r : Bool) : ℚ := if r then 4*(q-2)*(q-3) else 2*(q-1)*(q-2)

theorem first_gain_twoM1BB (q : ℕ) (r : Bool) (hq : 1 ≤ q) :
 (firstGainM1BB q r 2:ℚ)=tailTwoM1BB r := by
 have h := first_gain_binomialM1BB q 0 r hq
 cases r <;> simp_all [tailTwoM1BB]

theorem first_gain_threeM1BB (q : ℕ) (r : Bool) (hq : 1 ≤ q) :
 (firstGainM1BB q r 3:ℚ)=tailThreeM1BB q r+2*tailTwoM1BB r := by
 have h := first_gain_binomialM1BB q 1 r hq
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,Nat.choose_one_right] at h
   <;> rw [h] <;> simp [tailThreeM1BB,tailTwoM1BB] <;> ring

theorem first_gain_fourM1BB (q : ℕ) (r : Bool) (hq : 1 ≤ q) :
 (firstGainM1BB q r 4:ℚ)=tailFourM1BB q r+2*tailThreeM1BB q r+tailTwoM1BB r := by
 have h := first_gain_binomialM1BB q 2 r hq
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at h
   <;> rw [h] <;> push_cast
   <;> rw [choose_poly_natM0D3,binomial_poly_2M295]
   <;> simp only [tailFourM1BB,tailThreeM1BB,tailTwoM1BB,Bool.false_eq_true,if_false,if_true]
   <;> push_cast <;> ring

theorem source_first_small_zeroM1BB (q i : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : i ≤ 1) :
 threeRawM9E2 q r i (q+1)=0 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2]
 apply raw_outside_polygon18
 rw [(three_path_labelsM9E2 n r).1,(three_path_labelsM9E2 n r).2]
 intro h
 have hh := h.1
 have hm := Nat.mul_le_mul_left (3*(n+1)+(if r then 1 else 2)) hi
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at hh hm <;> nlinarith

theorem source_first_twoM1BB (k : ℕ) (r : Bool) :
 (threeRawM9E2 (k+1) r 2 (k+2):ℚ)=tailTwoM1BB r := by
 have hs := raw_disc_stepME9C (k+1) 0 k r
 have hz (i j : ℕ) (hi : i ≤ 2) (hj : j ≤ k+1) :
   (threeRawM9E2 (k+1) r i j:ℚ)=0 := by
   rw [source_three_low_zeroME9C _ _ _ _ (by omega) hi hj]; norm_num
 have he : k+1+1=k+2 := by omega
 have h1 := source_first_small_zeroM1BB (k+1) 1 r (by omega) (by omega)
 have h0 := source_first_small_zeroM1BB (k+1) 0 r (by omega) (by omega)
 have hn : k+2 < sourceNME9C (k+1) r := by cases r <;> simp [sourceNME9C] <;> omega
 norm_num only at hs
 rw [he] at h0 h1
 rw [h0,h1,hz 2 (k+1) (by omega) (by omega),hz 1 (k+1) (by omega) (by omega),
   hz 2 k (by omega) (by omega)] at hs
 rw [←he,first_forceM1BB,he,lower_force_twoM1BB _ _ hn] at hs
 push_cast at hs
 rw [first_gain_twoM1BB _ _ (by omega)] at hs
 linarith

theorem source_first_threeM1BB (k : ℕ) (r : Bool) :
 (threeRawM9E2 (k+1) r 3 (k+2):ℚ)=lowThreeME9C (k+2)+tailThreeM1BB (k+1) r := by
 have hs := raw_disc_stepME9C (k+1) 1 k r
 have he : k+1+1=k+2 := by omega
 have h1 := source_first_small_zeroM1BB (k+1) 1 r (by omega) (by omega)
 have hz := source_three_low_zeroME9C (k+1) 2 (k+1) r (by omega) (by omega) (by omega)
 have hn : k+2 < sourceNME9C (k+1) r := by cases r <;> simp [sourceNME9C] <;> omega
 norm_num only at hs
 rw [he] at h1
 rw [h1,hz,source_first_twoM1BB,source_low_threeME9C _ _ (by omega) (k+1) (by omega),
   source_low_threeME9C _ _ (by omega) k (by omega)] at hs
 rw [←he,first_forceM1BB,he] at hs
 push_cast at hs
 rw [lower_force_threeM1BB _ _ hn,first_gain_threeM1BB _ _ (by omega)] at hs
 have hl := low_three_equationME9C (k:ℚ)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at hs ⊢
 norm_num only [Int.cast_zero] at hs
 linarith

theorem source_first_fourM1BB (k : ℕ) (r : Bool) :
 (threeRawM9E2 (k+1) r 4 (k+2):ℚ)=
   lowFourME9C (sourceNME9C (k+1) r) (k+2)+tailFourM1BB (k+1) r := by
 have hs := raw_disc_stepME9C (k+1) 2 k r
 have he : k+1+1=k+2 := by omega
 have hn : k+2 < sourceNME9C (k+1) r := by cases r <;> simp [sourceNME9C] <;> omega
 norm_num only at hs
 rw [source_first_threeM1BB,source_first_twoM1BB,
   source_low_threeME9C _ _ (by omega) (k+1) (by omega),
   source_low_fourME9C _ _ (by omega) (k+1) (by omega),
   source_low_fourME9C _ _ (by omega) k (by omega)] at hs
 rw [←he,first_forceM1BB,he] at hs
 push_cast at hs
 rw [lower_force_fourM1BB _ _ hn,first_gain_fourM1BB _ _ (by omega)] at hs
 have hl := low_four_equationME9C (sourceNME9C (k+1) r:ℚ) (k:ℚ)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at hs ⊢
 linarith

end
end MathGKM.Markov
