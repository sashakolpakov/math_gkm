import MarkovAbsorbedBudgetM09F
import MarkovZeroBandBudgetM09F
import MarkovTopScalarM09F
/-! Machine-authored 09fffb56. The top-scalar premise is closed universally.
The complete convolution-margin premise remains explicit and unproved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem band_budget_allM09F (d k s : ℕ) (r : Bool) (hs : 3 ≤ s) :
 ((s+9).choose 4:ℝ)*transposedBudgetMBE3 d k s r ≤ (s+3)*bandBaseMBE3 d k s r := by
 by_cases hk : k=0
 · subst k; exact zero_band_budgetM09F d s r hs
 · exact band_budget_positive_kM09F d k s r (by omega) hs

theorem sharp_top_scalarsM09F : SharpTopScalarsMBE3 := by
 intro d k s r hs hsj
 by_cases hj : 5 ≤ bandJMBE3 d k r
 · apply top_scalar_of_budgetsM09F d k s r hs hj hsj
   · exact band_budget_allM09F d k s r hs
   · simpa only [show s+2+9=s+11 by omega,Nat.cast_add,Nat.cast_ofNat,
       show (s:ℝ)+2+3=s+5 by ring] using band_budget_allM09F d k (s+2) r (by omega)
 · have hd : d ≤ s := by unfold bandJMBE3 at hj; split_ifs at hj <;> omega
   exact top_scalar_clampedM09F d k s r hs hsj hd

theorem band_uniform_allM09F (d k s h : ℕ) (r : Bool) (hs : 3 ≤ s) :
 ((s+9).choose 4:ℝ)*(bandKernelM657 d k s r).coeff h ≤
 (((s+9).choose 4:ℝ)+(s+3))*(liftPolyM7E2 (bandJMBE3 d k r) s).coeff h := by
 have hb := band_budget_allM09F d k s r hs
 have hh := band_kernel_scaledMBE3 d k s h r
 have hl := lift_nonnegM964 (bandJMBE3 d k r) s h
 have h1 := mul_le_mul_of_nonneg_right hb hl
 have h2 := mul_le_mul_of_nonneg_left hh (show (0:ℝ) ≤ (s+9).choose 4 by positivity)
 apply (mul_le_mul_iff_of_pos_left (band_base_posMBE3 d k s r)).mp
 unfold bandTopMBE3 at h2
 nlinarith only [h1,h2]

theorem source_band_uniform_allM09F (q k s : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hs : 3 ≤ s) :
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
   (fun h => band_uniform_allM09F d k s h r hs)
 rw [band_kernel_weightM657,weighted_lift_outputMFEE,hj,
   ←source_band_outputM657 d k s r (by omega),he] at h
 exact_mod_cast h

theorem band_middle_of_marginM09F (HM : SharpCompleteMarginMBE3) : BandMiddleM657 :=
 band_middle_of_sharpMBE3 HM sharp_top_scalarsM09F

theorem source_band_all_of_marginM09F (HM : SharpCompleteMarginMBE3)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_all_of_sharpMBE3 HM sharp_top_scalarsM09F q k i r hq hn

end
end MathGKM.Markov
