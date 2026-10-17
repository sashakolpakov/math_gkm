import MarkovPolynomialCertificateMBEC
/-! Machine-authored 1c65a306. Exact mass and centered second moments of the
actual reversed kernel. No universal variance monotonicity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 6000000

theorem reverse_kernel_positiveM1C6 (j s r : ℕ) (hr : r ≤ j) :
 0 < reverseKernelMBEC j s r := by
 have hw : 0 < qWeightM7E2 r := by
   by_cases he : r=0
   · subst r; norm_num [qWeightM7E2]
   · simp only [qWeightM7E2,if_neg (by omega : ¬(r:ℤ)<0),
       if_neg (by exact_mod_cast he)]
     positivity
 have hj : (0:ℝ)<j.descFactorial r := by exact_mod_cast Nat.descFactorial_pos.mpr hr
 have hs : (0:ℝ)<(s+j+3).descFactorial r := by
   exact_mod_cast Nat.descFactorial_pos.mpr (show r ≤ s+j+3 by omega)
 exact div_pos (mul_pos hw hj) hs

theorem reverse_mass_positiveM1C6 (j s h : ℕ) (hh : h ≤ j) :
 0 < reverseConvMBEC j s s h := by
 unfold reverseConvMBEC
 apply sum_pos
 · intro r hr
   have hr' : r ≤ h := by simpa using hr
   exact mul_pos (reverse_kernel_positiveM1C6 j s r (by omega))
     (reverse_kernel_positiveM1C6 j s (h-r) (by omega))
 · exact ⟨0,mem_range.mpr (by omega)⟩

theorem reverse_kernel_shiftM1C6 (j s r : ℕ) (hr : r ≤ j) :
 reverseKernelMBEC j (s+1) r =
 reverseKernelMBEC j s r*((s+j+4:ℝ)-r)/(s+j+4) := by
 have hd : (0:ℝ)<(s+j+3).descFactorial r := by
   exact_mod_cast Nat.descFactorial_pos.mpr (show r ≤ s+j+3 by omega)
 have he : (0:ℝ)<(s+1+j+3).descFactorial r := by
   exact_mod_cast Nat.descFactorial_pos.mpr (show r ≤ s+1+j+3 by omega)
 have hi : ((s:ℝ)+j+4-r)*((s+1+j+3).descFactorial r:ℝ)=
   ((s:ℝ)+j+4)*((s+j+3).descFactorial r:ℝ) := by
   have hn := Nat.succ_descFactorial (s+j+3) r
   have hc := congrArg (fun n : ℕ => (n:ℝ)) hn
   push_cast [Nat.cast_sub (show r ≤ s+j+3+1 by omega)] at hc
   convert hc using 1 <;> congr 1 <;> omega
 unfold reverseKernelMBEC
 have hy : (s:ℝ)+j+4 ≠ 0 := by positivity
 field_simp
 nlinarith only [congrArg (fun x : ℝ => qWeightM7E2 r*(j.descFactorial r:ℝ)*x) hi]

def reverseMomentM1C6 (j s h : ℕ) : ℝ :=
 ∑ r ∈ range (h+1), ((r:ℝ)-(h:ℝ)/2)^2*
   reverseKernelMBEC j s r*reverseKernelMBEC j s (h-r)

def reverseVarianceM1C6 (j s h : ℕ) : ℝ :=
 reverseMomentM1C6 j s h / reverseConvMBEC j s s h

theorem reverse_moment_nonnegM1C6 (j s h : ℕ) (hh : h ≤ j) :
 0 ≤ reverseMomentM1C6 j s h := by
 apply sum_nonneg
 intro r hr
 have hr' : r ≤ h := by simpa using hr
 exact mul_nonneg (mul_nonneg (sq_nonneg _) (reverse_kernel_positiveM1C6 j s r (by omega)).le)
   (reverse_kernel_positiveM1C6 j s (h-r) (by omega)).le

theorem reverse_variance_nonnegM1C6 (j s h : ℕ) (hh : h ≤ j) :
 0 ≤ reverseVarianceM1C6 j s h :=
 div_nonneg (reverse_moment_nonnegM1C6 j s h hh) (reverse_mass_positiveM1C6 j s h hh).le

theorem symmetric_sumM1C6 (h : ℕ) (f : ℕ → ℝ) :
 (∑ r ∈ range (h+1), f (h-r))=∑ r ∈ range (h+1), f r := by
 simpa using sum_range_reflect f (h+1)

theorem reverse_balanced_momentM1C6 (j s h : ℕ) (hh : h ≤ j) :
 ((s+j+4:ℝ))^2*reverseConvMBEC j (s+1) (s+1) h =
 ((s+j+4:ℝ)-(h:ℝ)/2)^2*reverseConvMBEC j s s h-reverseMomentM1C6 j s h := by
 unfold reverseConvMBEC reverseMomentM1C6
 rw [mul_sum,mul_sum,←sum_sub_distrib]
 apply sum_congr rfl
 intro r hr
 have hr' : r ≤ h := by simpa using hr
 rw [reverse_kernel_shiftM1C6 _ _ _ (by omega),reverse_kernel_shiftM1C6 _ _ _ (by omega)]
 have hy : (s+j+4:ℝ)≠0 := by positivity
 push_cast [Nat.cast_sub hr']
 field_simp
 <;> ring

theorem reverse_unbalanced_momentM1C6 (j s h : ℕ) (hh : h ≤ j) :
 ((s+j+4:ℝ))*((s+j+5:ℝ))*reverseConvMBEC j s (s+2) h =
 (((s+j+4:ℝ)-(h:ℝ)/2)^2+((s+j+4:ℝ)-(h:ℝ)/2))*
   reverseConvMBEC j s s h+reverseMomentM1C6 j s h := by
 have he : reverseConvMBEC j s (s+2) h=reverseConvMBEC j (s+2) s h := by
   unfold reverseConvMBEC
   rw [←symmetric_sumM1C6 h (fun r => reverseKernelMBEC j s r*reverseKernelMBEC j (s+2) (h-r))]
   apply sum_congr rfl
   intro r hr
   have hr' : r ≤ h := by simpa using hr
   rw [show h-(h-r)=r by omega,mul_comm]
 have htwo : 2*reverseConvMBEC j s (s+2) h=
   reverseConvMBEC j s (s+2) h+reverseConvMBEC j (s+2) s h := by rw [←he]; ring
 have hid : 2*((s+j+4:ℝ))*((s+j+5:ℝ))*reverseConvMBEC j s (s+2) h =
   2*((((s+j+4:ℝ)-(h:ℝ)/2)^2+((s+j+4:ℝ)-(h:ℝ)/2))*
     reverseConvMBEC j s s h+reverseMomentM1C6 j s h) := by
   calc
    _ = ((s+j+4:ℝ))*((s+j+5:ℝ))*(reverseConvMBEC j s (s+2) h+
      reverseConvMBEC j (s+2) s h) := by rw [←htwo]; ring
    _ = _ := by
      unfold reverseConvMBEC reverseMomentM1C6
      simp only [←sum_add_distrib,mul_sum]
      rw [←sum_add_distrib]
      apply sum_congr rfl
      intro r hr
      have hr' : r ≤ h := by simpa using hr
      rw [show s+2=(s+1)+1 by omega,reverse_kernel_shiftM1C6 j (s+1) r (by omega),
        reverse_kernel_shiftM1C6 j (s+1) (h-r) (by omega),
        reverse_kernel_shiftM1C6 j s r (by omega),reverse_kernel_shiftM1C6 j s (h-r) (by omega)]
      have hy : (s+j+4:ℝ)≠0 := by positivity
      have hz : (s+j+5:ℝ)≠0 := by positivity
      push_cast [Nat.cast_sub hr']
      field_simp
      <;> ring
 linarith

end
end MathGKM.Markov
