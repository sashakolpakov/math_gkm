import MarkovWeightedSeparationM09F
import MarkovUniformCorrectionMBE3
/-! Machine-authored 09fffb56. A threefold sharper uniform budget when the
absorbed term is clamped to zero. This is an auxiliary bound, not root LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem weighted_correction_boundM09F (d k s : ℕ) (r : Bool) (hs : 3 ≤ s) :
 ((s+9).choose 4:ℝ)*(correctionTermM657 k (s+1) 1 r:ℝ) ≤
 (s+3)*bandBaseMBE3 d k s r := by
 by_cases hk : k=0
 · subst k
   unfold correctionTermM657
   simp only [Nat.zero_add,show s+1+1+3=s+5 by omega,
     show s+1+3=s+4 by omega,show s+1+2=s+3 by omega,
     Nat.choose_eq_zero_of_lt (show s+4 < s+5 by omega),
     Nat.choose_eq_zero_of_lt (show s+3 < s+5 by omega),Nat.cast_zero,mul_zero,add_zero]
   have hp := band_base_posMBE3 d 0 s r
   simp only [Int.cast_zero,mul_zero]
   exact mul_nonneg (by positivity) hp.le
 · let a : ℕ := if r then 2 else 1
   have ha : 1 ≤ a := by dsimp [a]; split_ifs <;> omega
   have ha2 : a ≤ 2 := by dsimp [a]; split_ifs <;> omega
   have hw := weighted_separated_chooseM09F a k s ha ha2 (by omega) hs
   have hj : 3*k+a+s+5 ≤ bandJMBE3 d k r+s+4 := by
     dsimp [a,bandJMBE3]; split_ifs <;> omega
   have hm : ((3*k+a+s+5).choose (s+5):ℝ) ≤
       ((bandJMBE3 d k r+s+4).choose (s+5):ℝ) := by
     exact_mod_cast Nat.choose_le_choose (s+5) hj
   have h := mul_le_mul_of_nonneg_left (hw.trans hm) (show (0:ℝ) ≤ 4*(s+3) by positivity)
   have he : (correctionTermM657 k (s+1) 1 r:ℝ)=4*(s+3)*weightedChooseM09F a k s := by
     unfold correctionTermM657 weightedChooseM09F
     simp only [show s+1+1+1=s+3 by omega,show k+(s+1)+3=k+s+4 by omega,
       show k+(s+1)+2=k+s+3 by omega,show s+1+1+3=s+5 by omega,Nat.choose_one_right]
     cases r <;> norm_num [a] <;> push_cast <;> ring
   rw [he]
   unfold bandBaseMBE3 liftTermMAE9
   simp only [Nat.add_zero,Nat.choose_zero_right,Nat.cast_one,one_mul]
   push_cast
   have hp : 0 ≤ (s+3:ℝ)*((s+bandJMBE3 d k r+3).choose (s+3):ℝ) := by positivity
   rw [show s+bandJMBE3 d k r=bandJMBE3 d k r+s by omega]
   nlinarith only [h,hp]

theorem band_budget_clampedM09F (d k s : ℕ) (r : Bool) (hs : 3 ≤ s) (hd : d ≤ s) :
 ((s+9).choose 4:ℝ)*transposedBudgetMBE3 d k s r ≤ (s+3)*bandBaseMBE3 d k s r := by
 unfold transposedBudgetMBE3
 have he : absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r)=0 := by
   simp [absorbedExtraM418,Nat.sub_eq_zero_of_le hd]
 rw [he,zero_add]
 exact weighted_correction_boundM09F d k s r hs

theorem band_uniform_sharpM09F (d k s h : ℕ) (r : Bool) (hs : 3 ≤ s) (hd : d ≤ s) :
 ((s+9).choose 4:ℝ)*(bandKernelM657 d k s r).coeff h ≤
 (((s+9).choose 4:ℝ)+(s+3))*(liftPolyM7E2 (bandJMBE3 d k r) s).coeff h := by
 have hb := band_budget_clampedM09F d k s r hs hd
 have hh := band_kernel_scaledMBE3 d k s h r
 have hl := lift_nonnegM964 (bandJMBE3 d k r) s h
 have h1 := mul_le_mul_of_nonneg_right hb hl
 have h2 := mul_le_mul_of_nonneg_left hh (show (0:ℝ) ≤ (s+9).choose 4 by positivity)
 apply (mul_le_mul_iff_of_pos_left (band_base_posMBE3 d k s r)).mp
 unfold bandTopMBE3 at h2
 nlinarith only [h1,h2]

theorem source_band_uniform_sharpM09F (q k s : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hs : 3 ≤ s)
 (hd : bandExponentM139 q k r ≤ s) :
 ((s+9).choose 4:ℤ)*threeRawM9E2 q r (s+3) (q+k+1) ≤
 (((s+9).choose 4:ℤ)+(s+3))*liftOutputMAE9 (bandExponentM139 q k r) (q+k+1) s := by
 let d := bandExponentM139 q k r
 have he : d+2*k+(if r then 2 else 1)=q := by
   dsimp [d]
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 have hj : bandJMBE3 d k r=q+k+1 := by
   unfold bandJMBE3; cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at * <;> omega
 have hw (h : ℕ) : 0 ≤ zchooseM37B d h := by rw [zchoose_natM37B]; positivity
 have h := weighted_value_boundMBE3 (bandKernelM657 d k s r)
   (liftPolyM7E2 (bandJMBE3 d k r) s) (fun h => zchooseM37B d h)
   ((s+9).choose 4) (((s+9).choose 4:ℝ)+(s+3)) hw
   (fun h => band_uniform_sharpM09F d k s h r hs hd)
 rw [band_kernel_weightM657,weighted_lift_outputMFEE,hj,
   ←source_band_outputM657 d k s r (by omega),he] at h
 exact_mod_cast h

end
end MathGKM.Markov
