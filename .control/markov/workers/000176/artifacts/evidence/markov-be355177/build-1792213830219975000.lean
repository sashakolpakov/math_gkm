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

end
end MathGKM.Markov
