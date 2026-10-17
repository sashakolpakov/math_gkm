import MarkovOutwardRatesM5BF
import MarkovRadialCovarianceM5BF
/-! Machine-authored 5bf6837d. Exact outward-shift moment transport.
The new external endpoints are retained explicitly. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def rateMassM5BF (j s H : ℕ) : ℝ := ∑ t ∈ range (H+1),
 radialRateM5BF j H t*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t)

def rateMomentM5BF (j s H : ℕ) : ℝ := ∑ t ∈ range (H+1),
 radialRateM5BF j H t*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t)*
   ((t:ℝ)-(H:ℝ)/2)^2

def outwardTailM5BF (j s H : ℕ) : ℝ :=
 2*((s:ℝ)+j+4)*reverseKernelMBEC j s 0*reverseKernelMBEC j s (H+1)

theorem rate_productM5BF (j s H t : ℕ) (hH : H<j) (ht : t≤H) :
 radialRateM5BF j H t*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t)=
 (((s:ℝ)+j+4-(t+1))*reverseKernelMBEC j s (t+1)*reverseKernelMBEC j s (H-t)+
  ((s:ℝ)+j+4-(H-t+1))*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t+1)) := by
 have h0 := kernel_birthM5BF j s t (by omega)
 have h1 := kernel_birthM5BF j s (H-t) (by omega)
 rw [Nat.cast_sub ht] at h1
 unfold radialRateM5BF
 nlinarith only [congrArg (fun x : ℝ => x*reverseKernelMBEC j s (H-t)) h0,
   congrArg (fun x : ℝ => x*reverseKernelMBEC j s t) h1]

theorem outward_massM5BF (j s H : ℕ) (hH : H<j) :
 rateMassM5BF j s H+outwardTailM5BF j s H=
 2*reverseCenterM1C6 j s (H+1)*reverseConvMBEC j s s (H+1) := by
 have he := outward_sumM5BF H (reverseKernelMBEC j s) ((s:ℝ)+j+4) (fun _ => 1)
 simp only [mul_one] at he
 have hl : rateMassM5BF j s H =
   ∑ t ∈ range (H+1),
    (((s:ℝ)+j+4-(t+1))*reverseKernelMBEC j s (t+1)*reverseKernelMBEC j s (H-t)+
     ((s:ℝ)+j+4-(H-t+1))*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t+1)) := by
   apply sum_congr rfl; intro t ht
   exact rate_productM5BF j s H t hH (by simpa using ht)
 calc
  _ = (∑ t ∈ range (H+1),
    (((s:ℝ)+j+4-(t+1))*reverseKernelMBEC j s (t+1)*reverseKernelMBEC j s (H-t)+
     ((s:ℝ)+j+4-(H-t+1))*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t+1)))+
     ((s:ℝ)+j+4)*reverseKernelMBEC j s 0*reverseKernelMBEC j s (H+1)+
     ((s:ℝ)+j+4)*reverseKernelMBEC j s (H+1)*reverseKernelMBEC j s 0 := by
    rw [hl]; unfold outwardTailM5BF; ring
  _ = _ := by
    rw [he]
    unfold reverseConvMBEC
    rw [mul_sum]
    apply sum_congr rfl
    intro r hr
    unfold reverseCenterM1C6
    push_cast
    ring

theorem outward_momentM5BF (j s H : ℕ) (hH : H<j) :
 rateMomentM5BF j s H+outwardTailM5BF j s H*((H:ℝ)/2+1)^2=
 2*(reverseCenterM1C6 j s (H+1)+1)*reverseMomentM1C6 j s (H+1)+
 reverseCenterM1C6 j s (H+1)/2*reverseConvMBEC j s s (H+1) := by
 have he := outward_sumM5BF H (reverseKernelMBEC j s) ((s:ℝ)+j+4) (fun x => x^2)
 have hl : rateMomentM5BF j s H =
   ∑ t ∈ range (H+1),
    (((s:ℝ)+j+4-(t+1))*reverseKernelMBEC j s (t+1)*reverseKernelMBEC j s (H-t)+
     ((s:ℝ)+j+4-(H-t+1))*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t+1))*
       ((t:ℝ)-(H:ℝ)/2)^2 := by
   apply sum_congr rfl; intro t ht
   rw [rate_productM5BF j s H t hH (by simpa using ht)]
 calc
  _ = (∑ t ∈ range (H+1),
    (((s:ℝ)+j+4-(t+1))*reverseKernelMBEC j s (t+1)*reverseKernelMBEC j s (H-t)+
     ((s:ℝ)+j+4-(H-t+1))*reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t+1))*
       ((t:ℝ)-(H:ℝ)/2)^2)+
     ((s:ℝ)+j+4)*reverseKernelMBEC j s 0*reverseKernelMBEC j s (H+1)*(-(H:ℝ)/2-1)^2+
     ((s:ℝ)+j+4)*reverseKernelMBEC j s (H+1)*reverseKernelMBEC j s 0*((H:ℝ)/2+1)^2 := by
    rw [hl]; unfold outwardTailM5BF; ring
  _ = _ := by
    rw [he]
    unfold reverseMomentM1C6 reverseConvMBEC
    rw [mul_sum,mul_sum,←sum_add_distrib]
    apply sum_congr rfl
    intro r hr
    unfold reverseCenterM1C6
    push_cast
    ring

theorem rate_covarianceM5BF (j s H : ℕ) (hH : H≤j) :
 reverseMomentM1C6 j s H*rateMassM5BF j s H≤
 reverseConvMBEC j s s H*rateMomentM5BF j s H := by
 have he := weighted_covarianceM5BF (H+1)
   (fun t => reverseKernelMBEC j s t*reverseKernelMBEC j s (H-t))
   (fun t => ((t:ℝ)-(H:ℝ)/2)^2) (radialRateM5BF j H)
   (by
     intro t ht
     exact mul_nonneg (reverse_kernel_positiveM1C6 j s t (by omega)).le
       (reverse_kernel_positiveM1C6 j s (H-t) (by omega)).le)
   (by intro t ht u hu hord; exact radial_rate_orderM5BF j H t u (by omega) (by omega) hord)
 convert he using 1
 · congr 1
   · apply sum_congr rfl; intro t ht; ring
   · apply sum_congr rfl; intro t ht; ring
 · congr 1
   apply sum_congr rfl; intro t ht; ring

end
end MathGKM.Markov
