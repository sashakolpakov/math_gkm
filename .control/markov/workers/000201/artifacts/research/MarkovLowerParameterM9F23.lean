import MarkovRampShapeM9F23
import MarkovLowerVerticalMF88
/-! Machine-authored 9f234835. Uniform lower-diagonal parameter variation.
The lower-kernel/source wedge is not extended by this positive model. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem lower_diag_kernelM9F23 (t j k : ℕ) :
 lowerDiagMF88 t j k=kernelM9F23 (t+3) t j k := by
 unfold lowerDiagMF88 kernelM9F23
 rw [diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _)
   j (t+k) (j+t+k+1) (by omega),
   diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _)
   j k (j+t+k+1) (by omega)]
 apply sum_congr rfl
 intro r hr
 unfold chooseSeqMDB9
 rw [show ((t+k:ℕ):ℤ)-r-t=(k:ℤ)-r by omega]

theorem lower_diag_positiveM9F23 (t j k : ℕ) : 0 < lowerDiagMF88 t j k := by
 rw [lower_diag_kernelM9F23]
 exact kernel_positiveM9F23 _ _ _ _

theorem lower_parameter_lcM9F23 (t j k : ℕ) (ht : 1 ≤ t) :
 lowerDiagMF88 t j k*lowerDiagMF88 (t+2) j k ≤ lowerDiagMF88 (t+1) j k^2 := by
 simp only [lower_diag_kernelM9F23]
 simpa only [Nat.add_assoc,Nat.add_left_comm,Nat.add_comm] using
   kernel_parameter_lcM9F23 (t+3) t j k (by omega) ht

theorem lower_parameter_minorM9F23 (t j k : ℕ) (ht : 1 ≤ t) :
 lowerDiagMF88 (t+1) j k*lowerDiagMF88 t (j+1) k ≤
 lowerDiagMF88 t j k*lowerDiagMF88 (t+1) (j+1) k := by
 simp only [lower_diag_kernelM9F23]
 simpa only [Nat.add_assoc,Nat.add_left_comm,Nat.add_comm] using
   kernel_shift_minorM9F23 (t+3) t j k ht

theorem real_minor_glueM9F23 (a b c e f z : ℝ)
 (hb : 0 ≤ b) (hc : 0 < c) (he : 0 ≤ e) (hf : 0 ≤ f) (hz : 0 ≤ z)
 (hrow : a*c ≤ b^2) (hcol : z*c ≤ f^2) (hminor : b*f ≤ e*c) : a*z ≤ e^2 := by
 apply (mul_le_mul_iff_left₀ (sq_pos_of_pos hc)).mp
 calc
  a*z*c^2=(a*c)*(z*c) := by ring
  _ ≤ b^2*f^2 := mul_le_mul hrow hcol (mul_nonneg hz hc.le) (sq_nonneg b)
  _ = (b*f)^2 := by ring
  _ ≤ (e*c)^2 := (sq_le_sq₀ (mul_nonneg hb hf) (mul_nonneg he hc.le)).mpr hminor
  _ = e^2*c^2 := by ring

theorem lower_parameter_diagonalM9F23 (t j k : ℕ) (ht : 1 ≤ t) :
 lowerDiagMF88 t (j+2) k*lowerDiagMF88 (t+2) j k ≤
 lowerDiagMF88 (t+1) (j+1) k^2 := by
 apply real_minor_glueM9F23
   (lowerDiagMF88 t (j+2) k) (lowerDiagMF88 (t+1) (j+2) k)
   (lowerDiagMF88 (t+2) (j+2) k) (lowerDiagMF88 (t+1) (j+1) k)
   (lowerDiagMF88 (t+2) (j+1) k) (lowerDiagMF88 (t+2) j k)
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact lower_diag_positiveM9F23 _ _ _
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact (lower_diag_positiveM9F23 _ _ _).le
 · exact lower_parameter_lcM9F23 t (j+2) k ht
 · exact lower_diag_rowMF88 (t+2) j k
 · simpa [Nat.add_assoc,mul_comm] using lower_parameter_minorM9F23 (t+1) (j+1) k (by omega)

theorem lower_kernel_diagonal_lcM9F23 (i j k : ℕ) (hi : 4 ≤ i)
 (hw : 2*j+7 ≤ i+k) :
 lowerKernelME9C i (j+2) k*lowerKernelME9C (i+2) j k ≤
 lowerKernelME9C (i+1) (j+1) k^2 := by
 have h := lower_parameter_diagonalM9F23 (i-3) j k (by omega)
 rw [show i-3+2=i+2-3 by omega,show i-3+1=i+1-3 by omega,
   ←lower_kernel_diagonalMF88 i (j+2) k (by omega) (by omega),
   ←lower_kernel_diagonalMF88 (i+2) j k (by omega) (by omega),
   ←lower_kernel_diagonalMF88 (i+1) (j+1) k (by omega) (by omega)] at h
 exact_mod_cast h

end
end MathGKM.Markov
