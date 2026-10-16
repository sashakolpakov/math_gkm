import MarkovResidualMDB9
/-! Machine-authored db972d62. Reparameterization of the remaining source-diagonal
problem. Two shape inequalities remain hypotheses, not asserted results. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def reducedKernelMDB9 (n j r : ℕ) : ℤ := twoKernelM4F4 (n+2) j (r+n)

theorem reduced_kernel_sumMDB9 (n j r : ℕ) :
 (reducedKernelMDB9 n j r:ℝ)=
 diagSumMDB9 (nbSeqMDB9 (n+2)) (nbSeqMDB9 n) weightSeqMDB9 j r := by
 unfold reducedKernelMDB9
 rw [two_kernel_diagSumMDB9,show n+2-2=n by omega]
 rw [diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _) j (r+n)
   (j+r+n+1) (by omega),
   diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _) j r
   (j+r+n+1) (by omega)]
 apply sum_congr rfl
 intro k hk
 unfold chooseSeqMDB9
 rw [show ((r+n:ℕ):ℤ)-k-n=(r:ℤ)-k by omega]

theorem reduced_kernel_posMDB9 (n j r : ℕ) : 0<reducedKernelMDB9 n j r :=
 two_kernel_posM4F4 (n+2) j (r+n) (by omega)

theorem reduced_kernel_rowMDB9 (n j r : ℕ) :
 reducedKernelMDB9 n j r*reducedKernelMDB9 n (j+2) r ≤
 reducedKernelMDB9 n (j+1) r^2 := (kernel_shapeMDB9 (n+2)).1 j (r+n)

def ReducedShapeMDB9 : Prop :=
 (∀ n j r : ℕ, 1 ≤ n →
   reducedKernelMDB9 n j r*reducedKernelMDB9 (n+2) j r ≤ reducedKernelMDB9 (n+1) j r^2) ∧
 (∀ n j r : ℕ, 1 ≤ n →
   reducedKernelMDB9 (n+1) j r*reducedKernelMDB9 n (j+1) r ≤
   reducedKernelMDB9 n j r*reducedKernelMDB9 (n+1) (j+1) r)

theorem reduced_antidiagonal_of_shapeMDB9 (h : ReducedShapeMDB9)
 (n j r : ℕ) (hn : 1 ≤ n) :
 reducedKernelMDB9 n (j+2) r*reducedKernelMDB9 (n+2) j r ≤
 reducedKernelMDB9 (n+1) (j+1) r^2 := by
 apply minor_diagonal_glueM4F4
   (reducedKernelMDB9 n (j+2) r) (reducedKernelMDB9 (n+1) (j+2) r)
   (reducedKernelMDB9 (n+2) (j+2) r) (reducedKernelMDB9 (n+1) (j+1) r)
   (reducedKernelMDB9 (n+2) (j+1) r) (reducedKernelMDB9 (n+2) j r)
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact reduced_kernel_posMDB9 _ _ _
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact h.1 n (j+2) r hn
 · exact reduced_kernel_rowMDB9 (n+2) j r
 · simpa [Nat.add_assoc,mul_comm] using h.2 (n+1) (j+1) r (by omega)

theorem kernel_diagonal_of_reduced_shapeMDB9 (h : ReducedShapeMDB9) : KernelDiagonalMDB9 := by
 intro i j m hi hpar
 by_cases hm : m<i-2
 · rw [two_kernel_zeroM4F4 i (j+2) m hm,zero_mul]
   exact sq_nonneg _
 · have hs := reduced_antidiagonal_of_shapeMDB9 h (i-2) j (m-(i-2)) (by omega)
   unfold reducedKernelMDB9 at hs
   convert hs using 1 <;> congr 2 <;> omega

theorem root_of_reduced_shapeMDB9 (h : ReducedShapeMDB9)
 (hs : SmallTwoDiagonalMDB9) (ho : OtherSourcesM679) : Conjecture63 :=
 root_iff_kernel_diagonalMDB9.mpr ⟨kernel_diagonal_of_reduced_shapeMDB9 h,hs,ho⟩
end
end MathGKM.Markov
