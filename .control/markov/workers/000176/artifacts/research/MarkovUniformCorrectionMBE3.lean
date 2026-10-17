import MarkovSeparatedChooseMBE3
import MarkovTransposedSharpMBE3
/-! Machine-authored be355177. Uniform suppression of the transposed correction
by a quartic binomial factor, independently of the correction-band index. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem separated_choose_offsetMBE3 (j k s m : ℕ) (hj : 3*k+2 ≤ j) :
 ((s+9).choose 4:ℝ)*((k+s+4).choose (s+5+m):ℝ) ≤
 ((j+s+4).choose (s+5+m):ℝ) := by
 by_cases hk : k=0
 · subst k
   simp only [Nat.zero_add]
   rw [Nat.choose_eq_zero_of_lt (by omega : s+4<s+5+m)]
   simp only [Nat.cast_zero,mul_zero]
   positivity
 have hsep := separated_chooseMBE3 k s (by omega)
 have hmono : ((3*k+s+6).choose (s+5):ℝ) ≤ ((j+s+4).choose (s+5):ℝ) := by
   exact_mod_cast Nat.choose_le_choose (s+5) (by omega : 3*k+s+6 ≤ j+s+4)
 have hc := choose_ratio_crossMBE3 (k+s+4) (j+s+4) (s+5) m (by omega)
 have h0 := mul_le_mul_of_nonneg_left hc (show 0 ≤ ((s+9).choose 4:ℝ) by positivity)
 have h1 := mul_le_mul_of_nonneg_right (hsep.trans hmono)
   (show 0 ≤ ((j+s+4).choose (s+5+m):ℝ) by positivity)
 have hp : (0:ℝ)<(j+s+4).choose (s+5) := by
   exact_mod_cast Nat.choose_pos (by omega : s+5 ≤ j+s+4)
 apply (mul_le_mul_iff_of_pos_right hp).mp
 nlinarith only [h0,h1]

theorem correction_uniform_relativeMBE3 (j k s m : ℕ) (r : Bool) (hj : 3*k+2 ≤ j) :
 ((s+9).choose 4:ℝ)*(correctionTermM657 k (s+1) (m+1) r:ℝ) ≤
 3*(s+3)*(liftTermMAE9 j s m:ℝ) := by
 have h0 := separated_choose_offsetMBE3 j k s m hj
 have hmono : ((k+s+3).choose (s+5+m):ℝ) ≤ ((k+s+4).choose (s+5+m):ℝ) := by
   exact_mod_cast Nat.choose_le_choose (s+5+m) (by omega : k+s+3 ≤ k+s+4)
 have h1 := (mul_le_mul_of_nonneg_left hmono (show 0 ≤ ((s+9).choose 4:ℝ) by positivity)).trans h0
 have hc := choose_successor_boundMBE3 s m
 have hc' := mul_le_mul_of_nonneg_right hc (show 0 ≤ ((j+s+4).choose (s+5+m):ℝ) by positivity)
 have H : ((s+9).choose 4:ℝ)*((s+m+3).choose (m+1):ℝ)*
     ((if r then 2 else 1)*((k+s+4).choose (s+5+m):ℝ)+
      (if r then 1 else 2)*((k+s+3).choose (s+5+m):ℝ)) ≤
   3*(s+3)*((s+m+3).choose m:ℝ)*((j+s+4).choose (s+5+m):ℝ) := by
   have h2 := mul_le_mul_of_nonneg_left h0 (show 0 ≤ ((s+m+3).choose (m+1):ℝ) by positivity)
   have h3 := mul_le_mul_of_nonneg_left h1 (show 0 ≤ ((s+m+3).choose (m+1):ℝ) by positivity)
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;>
     nlinarith only [h2,h3,hc']
 unfold correctionTermM657 liftTermMAE9
 simp only [show s+1+(m+1)+1=s+m+3 by omega,
   show k+(s+1)+3=k+s+4 by omega,show k+(s+1)+2=k+s+3 by omega,
   show s+1+(m+1)+3=s+5+m by omega,show s+m+5=s+5+m by omega,
   show s+j=j+s by omega]
 push_cast
 have hp : 0 ≤ ((s:ℝ)+3)*((s+m+3).choose m:ℝ)*((j+s+3).choose (s+m+3):ℝ) := by positivity
 nlinarith only [H,hp]

theorem band_uniform_scaledMBE3 (d k s h : ℕ) (r : Bool) (hd : d ≤ s) :
 ((s+9).choose 4:ℝ)*(bandKernelM657 d k s r).coeff h ≤
 (((s+9).choose 4:ℝ)+3*(s+3))*(liftPolyM7E2 (bandJMBE3 d k r) s).coeff h := by
 by_cases hh : h ≤ s
 · have hj : 3*k+2 ≤ bandJMBE3 d k r := by unfold bandJMBE3; split_ifs <;> omega
   have hb := correction_uniform_relativeMBE3 (bandJMBE3 d k r) k s (s-h) r hj
   have hz : absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r)=0 := by
     simp [absorbedExtraM418,Nat.sub_eq_zero_of_le hd]
   rw [band_kernel_coeffM657,lift_poly_coeffM7E2,hz]
   simp only [ite_self,add_zero,reverseLiftMAE9,if_pos hh]
   change ((s+9).choose 4:ℝ)*((liftTermMAE9 (bandJMBE3 d k r) s (s-h):ℝ)+
     (correctionTermM657 k (s+1) (s-h+1) r:ℝ)) ≤
     (((s+9).choose 4:ℝ)+3*(s+3))*(liftTermMAE9 (bandJMBE3 d k r) s (s-h):ℝ)
   nlinarith only [hb]
 · rw [band_kernel_tailMBE3 _ _ _ _ _ (by omega),lift_poly_coeffM7E2]
   simp [reverseLiftMAE9,hh]

theorem weighted_value_boundMBE3 (P Q : ℝ[X]) (w : ℕ → ℝ) (a b : ℝ)
 (hw : ∀ h, 0 ≤ w h) (H : ∀ h, a*P.coeff h ≤ b*Q.coeff h) :
 a*(weightPolyMFEE w P).eval 1 ≤ b*(weightPolyMFEE w Q).eval 1 := by
 have hc (h : ℕ) : 0 ≤ (C b*weightPolyMFEE w Q-C a*weightPolyMFEE w P).coeff h := by
   simp only [coeff_sub,coeff_C_mul,weight_poly_coeffMFEE]
   have hh := mul_le_mul_of_nonneg_left (H h) (hw h)
   nlinarith only [hh]
 have he : 0 ≤ (C b*weightPolyMFEE w Q-C a*weightPolyMFEE w P).eval 1 := by
   rw [eval_eq_sum_range]
   apply Finset.sum_nonneg
   intro h hh
   simpa using hc h
 simpa only [eval_sub,eval_mul,eval_C,sub_nonneg] using he

theorem band_output_uniformMBE3 (d k s : ℕ) (r : Bool) (hd : d ≤ s) :
 ((s+9).choose 4:ℤ)*bandOutputM657 d k s r ≤
 (((s+9).choose 4:ℤ)+3*(s+3))*liftOutputMAE9 d (bandJMBE3 d k r) s := by
 have hw (h : ℕ) : 0 ≤ zchooseM37B d h := by rw [zchoose_natM37B]; positivity
 have h := weighted_value_boundMBE3 (bandKernelM657 d k s r)
   (liftPolyM7E2 (bandJMBE3 d k r) s) (fun h => zchooseM37B d h)
   ((s+9).choose 4) (((s+9).choose 4:ℝ)+3*(s+3)) hw
   (fun h => band_uniform_scaledMBE3 d k s h r hd)
 rw [band_kernel_weightM657,weighted_lift_outputMFEE] at h
 exact_mod_cast h

theorem source_band_uniformMBE3 (q k s : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hd : bandExponentM139 q k r ≤ s) :
 ((s+9).choose 4:ℤ)*threeRawM9E2 q r (s+3) (q+k+1) ≤
 (((s+9).choose 4:ℤ)+3*(s+3))*liftOutputMAE9 (bandExponentM139 q k r) (q+k+1) s := by
 have he : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 have hj : bandJMBE3 (bandExponentM139 q k r) k r=q+k+1 := by
   unfold bandJMBE3
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at * <;> omega
 have h := band_output_uniformMBE3 (bandExponentM139 q k r) k s r hd
 rw [hj,←source_band_outputM657 _ k s r (by omega),he] at h
 exact h

end
end MathGKM.Markov
