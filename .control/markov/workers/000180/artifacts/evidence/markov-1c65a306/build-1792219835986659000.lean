import MarkovVarianceDriftM1C6
/-! Machine-authored 1c65a306. Universal contraction of the conditional
variance in the parameter s, with an exact fourth-moment defect identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def reverseFourthM1C6 (j s h : ℕ) : ℝ :=
 ∑ r ∈ range (h+1), ((r:ℝ)-(h:ℝ)/2)^4*
   reverseKernelMBEC j s r*reverseKernelMBEC j s (h-r)

theorem weighted_second_momentM1C6 (N : ℕ) (w x : ℕ → ℝ)
 (hw : ∀ i, i < N → 0 ≤ w i) :
 (∑ i ∈ range N, w i*x i)^2 ≤
 (∑ i ∈ range N, w i)*(∑ i ∈ range N, w i*(x i)^2) := by
 have H : 0 ≤ ∑ i ∈ range N, ∑ k ∈ range N, w i*w k*(x i-x k)^2 := by
   apply sum_nonneg; intro i hi
   apply sum_nonneg; intro k hk
   exact mul_nonneg (mul_nonneg (hw i (mem_range.mp hi)) (hw k (mem_range.mp hk))) (sq_nonneg _)
 have he : (∑ i ∈ range N, ∑ k ∈ range N, w i*w k*(x i-x k)^2)=
   2*((∑ i ∈ range N, w i)*(∑ i ∈ range N, w i*(x i)^2)-
     (∑ i ∈ range N, w i*x i)^2) := by
   calc
    _ = ∑ i ∈ range N, ∑ k ∈ range N,
     ((w i*(x i)^2)*w k+w i*(w k*(x k)^2)-2*(w i*x i)*(w k*x k)) := by
      apply sum_congr rfl; intro i hi
      apply sum_congr rfl; intro k hk
      ring
    _ = _ := by
      simp only [sum_sub_distrib,sum_add_distrib,←mul_sum,←sum_mul]
      ring
 rw [he] at H
 linarith

theorem reverse_fourth_boundM1C6 (j s h : ℕ) (hh : h ≤ j) :
 reverseMomentM1C6 j s h^2 ≤ reverseConvMBEC j s s h*reverseFourthM1C6 j s h := by
 have H := weighted_second_momentM1C6 (h+1)
   (fun r => reverseKernelMBEC j s r*reverseKernelMBEC j s (h-r))
   (fun r => ((r:ℝ)-(h:ℝ)/2)^2) (by
     intro r hr
     exact mul_nonneg (reverse_kernel_positiveM1C6 j s r (by omega)).le
       (reverse_kernel_positiveM1C6 j s (h-r) (by omega)).le)
 convert H using 1
 · congr 1
   apply sum_congr rfl; intro r hr; ring
 · congr 1
   apply sum_congr rfl; intro r hr; ring

theorem reverse_moment_shiftM1C6 (j s h : ℕ) (hh : h ≤ j) :
 (s+j+4:ℝ)^2*reverseMomentM1C6 j (s+1) h=
   reverseCenterM1C6 j s h^2*reverseMomentM1C6 j s h-reverseFourthM1C6 j s h := by
 unfold reverseMomentM1C6 reverseFourthM1C6 reverseCenterM1C6
 rw [mul_sum,mul_sum,←sum_sub_distrib]
 apply sum_congr rfl
 intro r hr
 have hr' : r ≤ h := by simpa using hr
 rw [reverse_kernel_shiftM1C6 _ _ _ (by omega),reverse_kernel_shiftM1C6 _ _ _ (by omega)]
 have hy : (s+j+4:ℝ)≠0 := by positivity
 push_cast [Nat.cast_sub hr']
 field_simp
 <;> ring

theorem reverse_variance_contraction_identityM1C6 (j s h : ℕ) (hh : h ≤ j) :
 (s+j+4:ℝ)^2*reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s s h*
   (reverseVarianceM1C6 j s h-reverseVarianceM1C6 j (s+1) h)=
 reverseConvMBEC j s s h*reverseFourthM1C6 j s h-reverseMomentM1C6 j s h^2 := by
 have h0 := ne_of_gt (reverse_mass_positiveM1C6 j s h hh)
 have h1 := ne_of_gt (reverse_mass_positiveM1C6 j (s+1) h hh)
 have he : (s+j+4:ℝ)^2*reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s s h*
   (reverseVarianceM1C6 j s h-reverseVarianceM1C6 j (s+1) h)=
   ((s+j+4:ℝ)^2*reverseConvMBEC j (s+1) (s+1) h)*reverseMomentM1C6 j s h-
   reverseConvMBEC j s s h*((s+j+4:ℝ)^2*reverseMomentM1C6 j (s+1) h) := by
   unfold reverseVarianceM1C6
   field_simp
   <;> ring
 rw [he,reverse_balanced_momentM1C6 j s h hh,reverse_moment_shiftM1C6 j s h hh]
 unfold reverseCenterM1C6
 ring

theorem reverse_variance_decreasingM1C6 (j s h : ℕ) (hh : h ≤ j) :
 reverseVarianceM1C6 j (s+1) h ≤ reverseVarianceM1C6 j s h := by
 have he := reverse_variance_contraction_identityM1C6 j s h hh
 have H := sub_nonneg.mpr (reverse_fourth_boundM1C6 j s h hh)
 rw [←he] at H
 have hp : 0 < (s+j+4:ℝ)^2*reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s s h := by
   exact mul_pos (mul_pos (by positivity) (reverse_mass_positiveM1C6 j (s+1) h hh))
     (reverse_mass_positiveM1C6 j s h hh)
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hp).mp H)

theorem reverse_variance_upperM1C6 (j s h : ℕ) (hh : h ≤ j) :
 reverseVarianceM1C6 j s h ≤ (h:ℝ)^2/4 := by
 have hp := reverse_mass_positiveM1C6 j s h hh
 apply (div_le_iff₀ hp).mpr
 unfold reverseMomentM1C6 reverseConvMBEC
 rw [mul_sum]
 apply sum_le_sum
 intro r hr
 have hr' : r ≤ h := by simpa using hr
 have hr0 : (0:ℝ)≤r := Nat.cast_nonneg r
 have hrh : (r:ℝ)≤h := by exact_mod_cast hr'
 have hq : ((r:ℝ)-(h:ℝ)/2)^2 ≤ (h:ℝ)^2/4 := by nlinarith
 have hw := mul_nonneg (reverse_kernel_positiveM1C6 j s r (by omega)).le
   (reverse_kernel_positiveM1C6 j s (h-r) (by omega)).le
 nlinarith only [mul_le_mul_of_nonneg_right hq hw]

end
end MathGKM.Markov
