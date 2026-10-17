import MarkovMarginSourceMA64
/-! Machine-authored a646848d. A coarse endpoint-safe upper bound for the
diagonal kernel step; all compared terms retain their raw values. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem pair_b_upperMA64 (j t n : ℚ) (ht : 0 ≤ t) (hn : 1 ≤ n) (hnj : n ≤ j) :
 pairBMAD5 j t n ≤ j := by
 let W := liftWeightMAE9 j t n
 let D := liftDenMAE9 t n
 let E := (t+n+6)*(t+n+7)
 have hj : 0 ≤ j := by linarith
 have hD : 0 ≤ D := by dsimp [D,liftDenMAE9]; positivity
 have hE : 0 < E := by dsimp [E]; positivity
 have hW : 2 ≤ W := by
   have hz : 0 ≤ 4*(j-n)*(t+j+4) := by positivity
   dsimp [W,liftWeightMAE9,liftDenMAE9]
   nlinarith
 have hDE : D ≤ E := by dsimp [D,E,liftDenMAE9]; nlinarith
 have hp : 0 < (n+1)*E*W := by positivity
 unfold pairBMAD5
 rw [show (n+1)*(t+n+6)*(t+n+7)*liftWeightMAE9 j t n=(n+1)*E*W by dsimp [E,W]; ring]
 change (j-n)*D*(W+2)/((n+1)*E*W) ≤ j
 apply (div_le_iff₀ hp).mpr
 calc
  _ ≤ j*D*(W+2) := by gcongr <;> linarith
  _ ≤ j*D*(2*W) := by gcongr <;> linarith
  _ ≤ j*E*(2*W) := by gcongr
  _ ≤ j*((n+1)*E*W) := by
    have h := mul_nonneg (sub_nonneg.mpr hn) (mul_nonneg hj (mul_nonneg hE.le (by linarith : 0 ≤ W)))
    nlinarith only [h]

def borderRatioMA64 (j t : ℕ) : ℝ := (j:ℝ)*(t+j+5)/(t+5)

theorem lift_right_upperMA64 (j t n : ℕ) (hn : 1 ≤ n) (hnj : n ≤ j) :
 (liftTermMAE9 j (t+2) (n+1):ℝ) ≤
 borderRatioMA64 j t*(liftTermMAE9 j (t+1) n:ℝ) := by
 have h := pair_b_upperMA64 j (t+1) n (by positivity) (by exact_mod_cast hn) (by exact_mod_cast hnj)
 have hp : (0:ℚ) ≤ (liftTermMAE9 j (t+1) n:ℚ)*(((t:ℚ)+j+5)/(t+5)) := by
   have hn' : (0:ℚ) ≤ liftTermMAE9 j (t+1) n := by
     exact_mod_cast (lift_term_positiveMAD5 j (t+1) n hnj).le
   positivity
 have hmul := mul_le_mul_of_nonneg_left h hp
 rw [←pair_right_stepMAD5 j t n hnj] at hmul
 have he : (liftTermMAE9 j (t+2) (n+1):ℚ) ≤
   ((j:ℚ)*((t:ℚ)+j+5)/(t+5))*(liftTermMAE9 j (t+1) n:ℚ) := by
   convert hmul using 1 <;> ring
 unfold borderRatioMA64
 exact_mod_cast he

end
end MathGKM.Markov
