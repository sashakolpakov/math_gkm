import MarkovMiddleKernelSourceMD02
/-! Machine-authored d0292f14. Exact positive support of the correction
in every column at least three. This is not a log-concavity assertion. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 6000000

theorem middle_kernel_positiveMD02 (D k a b : ℕ) (hb : b ≤ D+a)
 (hk : a+2 ≤ k) : 0 < middleKernelMD02 D k a b := by
 unfold middleKernelMD02
 apply sum_pos'
 · intro l hl
   positivity
 · refine ⟨0,by simp,?_⟩
   simp only [Nat.add_zero,Nat.sub_zero,Nat.choose_self,Nat.cast_one,one_mul]
   exact mul_pos (by exact_mod_cast Nat.choose_pos hb) (by exact_mod_cast Nat.choose_pos hk)

theorem correction_short_zeroMD02 (d k c : ℕ) (r : Bool) (hk : k<c+2) :
 correctionShortMD02 d k c r=0 := by
 have h (D a b : ℕ) (ha : c ≤ a) := middle_kernel_zeroMD02 D k a b (by omega)
 cases r <;> simp [correctionShortMD02,h _ c _ (by omega),h _ (c+1) _ (by omega)]

theorem correction_short_positiveMD02 (d k c : ℕ) (r : Bool) (hk : c+2 ≤ k) :
 0 < correctionShortMD02 d k c r := by
 have h0 := middle_kernel_positiveMD02 (d+c+4) k c (c+1) (by omega) hk
 have h1 := middle_kernel_positiveMD02 (d+c+5) k c (c+1) (by omega) hk
 have h2 := middle_kernel_nonnegMD02 (d+c+5) k (c+1) (c+2)
 have h3 := middle_kernel_nonnegMD02 (d+c+4) k (c+1) (c+2)
 have h4 := middle_kernel_nonnegMD02 (d+c+4) k c (c+2)
 have h5 := middle_kernel_nonnegMD02 (d+c+5) k c (c+2)
 have h6 := middle_kernel_nonnegMD02 (d+c+6) k (c+1) (c+2)
 cases r <;> simp only [correctionShortMD02,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem correction_short_positive_iffMD02 (d k c : ℕ) (r : Bool) :
 0 < correctionShortMD02 d k c r ↔ c+2 ≤ k := by
 constructor
 · intro h
   by_contra hk
   rw [correction_short_zeroMD02 d k c r (by omega)] at h
   omega
 · exact correction_short_positiveMD02 d k c r

theorem source_middle_excessMD02 (q k c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 (topShortSumMEB6 (sourceNME9C q r-2*(q+3+k)) (q+k) c <
 threeRawM9E2 q r (c+3) (sourceNME9C q r+2-(q+3+k))) ↔ c+2 ≤ k := by
 rw [source_middle_shortMD02 q k c r hq hk hn]
 simpa only [lt_add_iff_pos_right] using correction_short_positive_iffMD02 (q-(2*k+2)) k c r

end
end MathGKM.Markov
