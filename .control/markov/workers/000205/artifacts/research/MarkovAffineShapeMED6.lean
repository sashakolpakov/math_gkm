import MarkovAffineOrderMED6
/-! Machine-authored ed6bdbeb. Simultaneous affine-kernel parameter shape.
Every parameter is unbounded; e>=1 and a,b>=1 are explicit hypotheses. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem affine_shift_convolutionMED6 (e : ℝ) (a b j r : ℕ) :
 affineKernelM13E e (a+1) (b+1) j r=
 convolutionM8F7 (prefixM8F7 (affineReverseMED6 e (b+1) r)) (nbNatM8F7 a) j := by
 rw [affine_convolutionMED6,convolution_prefixM8F7,nb_prefixM8F7]

theorem affine_shift_minorMED6 (e : ℝ) (he : 1≤e) (a b j r : ℕ) (hb : 1≤b) :
 affineKernelM13E e (a+1) (b+1) j r*affineKernelM13E e a b (j+1) r ≤
 affineKernelM13E e a b j r*affineKernelM13E e (a+1) (b+1) (j+1) r := by
 have h := determinant_sum_nonnegFe01
   (affineReverseMED6 e b r) (prefixM8F7 (affineReverseMED6 e (b+1) r))
   (fun k => nbSeqMDB9 a ((j:ℤ)-k)) (fun k => nbSeqMDB9 a ((j:ℤ)+1-k)) (j+2)
   (fun x y hxy _ => affine_prefix_orderMED6 e he b r x y hb hxy) ?_
 · rw [affine_shift_convolutionMED6,affine_shift_convolutionMED6,
     affine_convolutionMED6,affine_convolutionMED6,
     convolution_nb_extendM8F7 _ _ j (j+2) (by omega),
     convolution_nb_extendM8F7 _ _ (j+1) (j+2) (by omega),
     convolution_nb_extendM8F7 _ _ j (j+2) (by omega),
     convolution_nb_extendM8F7 _ _ (j+1) (j+2) (by omega)]
   push_cast
   nlinarith only [h]
 · intro x y hxy hy
   have h := nbSeq_crossMDB9 a ((j:ℤ)-y) ((j:ℤ)-x) (by omega)
   rw [show (j:ℤ)-x+1=j+1-x by omega,show (j:ℤ)-y+1=j+1-y by omega] at h
   nlinarith only [h]

theorem affine_shift_ratio_rowMED6 (e : ℝ) (he : 1≤e) (a b r : ℕ) (hb : 1≤b) :
 Monotone (fun j => affineKernelM13E e (a+1) (b+1) j r/affineKernelM13E e a b j r) := by
 have he0 : 0<e := by linarith
 apply monotone_nat_of_le_succ
 intro j
 apply (div_le_div_iff₀ (affine_kernel_positiveM13E e he0 _ _ _ _)
   (affine_kernel_positiveM13E e he0 _ _ _ _)).mpr
 simpa only [mul_comm] using affine_shift_minorMED6 e he a b j r hb

theorem affine_shift_ratio_columnMED6 (e : ℝ) (he : 1≤e) (a b j : ℕ) (ha : 1≤a) :
 Monotone (fun r => affineKernelM13E e (a+1) (b+1) j r/affineKernelM13E e a b j r) := by
 simpa only [affine_kernel_swapM13E e a b,affine_kernel_swapM13E e (a+1) (b+1)] using
   affine_shift_ratio_rowMED6 e he b a j ha

theorem affine_parameter_lcMED6 (e : ℝ) (he : 1≤e) (a b j r : ℕ) (ha : 1≤a) (hb : 1≤b) :
 affineKernelM13E e a b j r*affineKernelM13E e (a+2) (b+2) j r ≤
 affineKernelM13E e (a+1) (b+1) j r^2 := by
 have he0 : 0<e := by linarith
 have hc (k l : ℕ) (hk : k≤j) (hl : l≤r) :
   affineKernelM13E e (a+1) (b+1) k l*affineKernelM13E e a b j r ≤
   affineKernelM13E e a b k l*affineKernelM13E e (a+1) (b+1) j r := by
   have h := le_trans (affine_shift_ratio_rowMED6 e he a b l hb hk)
     (affine_shift_ratio_columnMED6 e he a b j ha hl)
   have h' := (div_le_div_iff₀ (affine_kernel_positiveM13E e he0 _ _ _ _)
     (affine_kernel_positiveM13E e he0 _ _ _ _)).mp h
   nlinarith only [h']
 have h : (∑ k ∈ range (j+1),∑ l ∈ range (r+1),
     affineKernelM13E e (a+1) (b+1) k l*affineKernelM13E e a b j r) ≤
   ∑ k ∈ range (j+1),∑ l ∈ range (r+1),
     affineKernelM13E e a b k l*affineKernelM13E e (a+1) (b+1) j r := by
   apply sum_le_sum
   intro k hk
   apply sum_le_sum
   intro l hl
   exact hc k l (by simpa using hk) (by simpa using hl)
 simp only [←sum_mul,affine_rectangleMED6,show a+1+1=a+2 by omega,
   show b+1+1=b+2 by omega] at h
 nlinarith only [h]

theorem affine_parameter_diagonalMED6 (e : ℝ) (he : 1≤e) (a b j k : ℕ) (ha : 1≤a) (hb : 1≤b) :
 affineKernelM13E e a b (j+2) k*affineKernelM13E e (a+2) (b+2) j k ≤
 affineKernelM13E e (a+1) (b+1) (j+1) k^2 := by
 have he0 : 0<e := by linarith
 apply real_minor_glueM9F23
   (affineKernelM13E e a b (j+2) k) (affineKernelM13E e (a+1) (b+1) (j+2) k)
   (affineKernelM13E e (a+2) (b+2) (j+2) k) (affineKernelM13E e (a+1) (b+1) (j+1) k)
   (affineKernelM13E e (a+2) (b+2) (j+1) k) (affineKernelM13E e (a+2) (b+2) j k)
 · exact affine_kernel_nonnegM13E e he0.le _ _ _ _
 · exact affine_kernel_positiveM13E e he0 _ _ _ _
 · exact affine_kernel_nonnegM13E e he0.le _ _ _ _
 · exact affine_kernel_nonnegM13E e he0.le _ _ _ _
 · exact affine_kernel_nonnegM13E e he0.le _ _ _ _
 · exact affine_parameter_lcMED6 e he a b (j+2) k ha hb
 · exact affine_kernel_rowM13E e he0.le (a+2) (b+2) j k
 · simpa only [Nat.add_assoc,mul_comm] using
     affine_shift_minorMED6 e he (a+1) (b+1) (j+1) k (by omega)

end
end MathGKM.Markov
