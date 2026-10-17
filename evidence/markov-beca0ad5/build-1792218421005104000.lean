import MarkovReverseKernelMBEC
/-! Machine-authored beca0ad5. A positive rational certificate at deficiency three. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem reverse_kernel_zeroMBEC (j s : ℕ) : reverseKernelMBEC j s 0=1 := by
 norm_num [reverseKernelMBEC,qWeightM7E2]

theorem reverse_kernel_oneMBEC (j s : ℕ) :
 reverseKernelMBEC j s 1=4*(j:ℝ)/(s+j+3) := by
 norm_num [reverseKernelMBEC,qWeightM7E2]

theorem reverse_kernel_twoMBEC (j s : ℕ) :
 reverseKernelMBEC j s 2=8*(j:ℝ)*(j-1)/((s+j+3)*(s+j+2)) := by
 unfold reverseKernelMBEC
 rw [Nat.cast_descFactorial_two,Nat.cast_descFactorial_two]
 norm_num [qWeightM7E2]
 congr 1 <;> ring

theorem reverse_kernel_threeMBEC (j s : ℕ) (hj : 2 ≤ j) :
 reverseKernelMBEC j s 3=12*(j:ℝ)*(j-1)*(j-2)/((s+j+3)*(s+j+2)*(s+j+1)) := by
 unfold reverseKernelMBEC
 rw [Nat.descFactorial_succ,Nat.descFactorial_succ]
 push_cast only [Nat.cast_mul,Nat.cast_sub hj,Nat.cast_sub (show 2 ≤ s+j+3 by omega),
   Nat.cast_descFactorial_two,Nat.cast_add,Nat.cast_ofNat]
 norm_num [qWeightM7E2]
 congr 1 <;> ring

def threeCertificateMBEC (k s : ℝ) : ℝ :=
 342528+123264*s+11136*s^2+534656*k+163968*k*s+12160*k*s^2+
 262656*k^2+61184*k^2*s+3072*k^2*s^2+49024*k^3+6144*k^3*s+3072*k^4

theorem three_certificate_positiveMBEC (k s : ℝ) (hk : 0 ≤ k) (hs : 0 ≤ s) :
 0 < threeCertificateMBEC k s := by
 unfold threeCertificateMBEC
 positivity

theorem reverse_three_gapMBEC (k s : ℕ) :
 reverseConvMBEC (k+3) (s+1) (s+1) 2*reverseConvMBEC (k+3) s (s+2) 3-
 reverseConvMBEC (k+3) (s+1) (s+1) 3*reverseConvMBEC (k+3) s (s+2) 2 =
 ((k:ℝ)+2)*(k+3)^2*threeCertificateMBEC k s/
   ((k+s+4)*(k+s+5)^2*(k+s+6)^2*(k+s+7)^3*(k+s+8)) := by
 unfold reverseConvMBEC
 norm_num only [Finset.sum_range_succ,Finset.sum_range_zero,zero_add,Nat.reduceSub,
   reverse_kernel_zeroMBEC,reverse_kernel_oneMBEC,reverse_kernel_twoMBEC,
   reverse_kernel_threeMBEC (k+3) _ (by omega),mul_one,one_mul]
 push_cast
 unfold threeCertificateMBEC
 field_simp
 <;> ring

theorem reverse_threeMBEC (j s : ℕ) (hj : 3 ≤ j) :
 reverseConvMBEC j (s+1) (s+1) 3*reverseConvMBEC j s (s+2) 2 ≤
 reverseConvMBEC j (s+1) (s+1) 2*reverseConvMBEC j s (s+2) 3 := by
 obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
 rw [Nat.add_comm 3 k]
 have he := reverse_three_gapMBEC k s
 have hp := three_certificate_positiveMBEC (k:ℝ) (s:ℝ) (by positivity) (by positivity)
 have hz : 0 ≤ ((k:ℝ)+2)*(k+3)^2*threeCertificateMBEC k s/
   ((k+s+4)*(k+s+5)^2*(k+s+6)^2*(k+s+7)^3*(k+s+8)) := by positivity
 linarith

end
end MathGKM.Markov
