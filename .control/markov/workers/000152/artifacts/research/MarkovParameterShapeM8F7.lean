import MarkovWeightOrderM8F7
/-! Machine-authored 8f77f493. Simultaneous binomial-parameter shape. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem convolution_nb_extendM8F7 (f : ℕ → ℝ) (a j N : ℕ) (hN : j<N) :
 convolutionM8F7 f (nbNatM8F7 a) j=
 ∑ k ∈ range N, f k*nbSeqMDB9 a ((j:ℤ)-k) := by
 have he : convolutionM8F7 f (nbNatM8F7 a) j=
   ∑ k ∈ range (j+1),f k*nbSeqMDB9 a ((j:ℤ)-k) := by
   unfold convolutionM8F7
   apply sum_congr rfl
   intro k hk
   have hk' : k≤j := by simpa using hk
   rw [show (j:ℤ)-k=((j-k:ℕ):ℤ) by omega,nbSeq_natMDB9]
   rfl
 rw [he]
 apply sum_subset (range_mono (by omega))
 intro k hk hn
 rw [nbSeq_zeroMDB9 _ _ (by simp only [mem_range] at hn; omega),mul_zero]

theorem kernel_shift_convolutionM8F7 (a b j r : ℕ) :
 kernelM8F7 (a+1) (b+1) j r=
 convolutionM8F7 (prefixM8F7 (weightedReverseM8F7 (b+1) r)) (nbNatM8F7 a) j := by
 rw [kernel_convolutionM8F7,convolution_prefixM8F7,nb_prefixM8F7]

theorem kernel_shift_minorM8F7 (a b j r : ℕ) :
 kernelM8F7 (a+1) (b+1) j r*kernelM8F7 a b (j+1) r≤
 kernelM8F7 a b j r*kernelM8F7 (a+1) (b+1) (j+1) r := by
 have h := determinant_sum_nonnegFe01
   (weightedReverseM8F7 b r) (prefixM8F7 (weightedReverseM8F7 (b+1) r))
   (fun k => nbSeqMDB9 a ((j:ℤ)-k)) (fun k => nbSeqMDB9 a ((j:ℤ)+1-k)) (j+2)
   (fun x y hxy _ => weighted_prefix_orderM8F7 b r x y hxy) ?_
 · rw [kernel_shift_convolutionM8F7,kernel_shift_convolutionM8F7,
     kernel_convolutionM8F7,kernel_convolutionM8F7,
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

theorem kernel_shift_ratio_rowM8F7 (a b r : ℕ) :
 Monotone (fun j => kernelM8F7 (a+1) (b+1) j r/kernelM8F7 a b j r) := by
 apply monotone_nat_of_le_succ
 intro j
 apply (div_le_div_iff₀ (kernel_positiveM8F7 _ _ _ _) (kernel_positiveM8F7 _ _ _ _)).mpr
 simpa only [mul_comm] using kernel_shift_minorM8F7 a b j r

theorem kernel_shift_ratio_columnM8F7 (a b j : ℕ) :
 Monotone (fun r => kernelM8F7 (a+1) (b+1) j r/kernelM8F7 a b j r) := by
 simpa only [kernel_swapM8F7 a b,kernel_swapM8F7 (a+1) (b+1)] using
   kernel_shift_ratio_rowM8F7 b a j

theorem kernel_parameter_lcM8F7 (a b j r : ℕ) :
 kernelM8F7 a b j r*kernelM8F7 (a+2) (b+2) j r≤
 kernelM8F7 (a+1) (b+1) j r^2 := by
 have hc (k l : ℕ) (hk : k≤j) (hl : l≤r) :
   kernelM8F7 (a+1) (b+1) k l*kernelM8F7 a b j r≤
   kernelM8F7 a b k l*kernelM8F7 (a+1) (b+1) j r := by
   have h := le_trans (kernel_shift_ratio_rowM8F7 a b l hk)
     (kernel_shift_ratio_columnM8F7 a b j hl)
   have h' := (div_le_div_iff₀ (kernel_positiveM8F7 _ _ _ _) (kernel_positiveM8F7 _ _ _ _)).mp h
   nlinarith only [h']
 have h : (∑ k ∈ range (j+1),∑ l ∈ range (r+1),
     kernelM8F7 (a+1) (b+1) k l*kernelM8F7 a b j r)≤
   ∑ k ∈ range (j+1),∑ l ∈ range (r+1),
     kernelM8F7 a b k l*kernelM8F7 (a+1) (b+1) j r := by
   apply sum_le_sum
   intro k hk
   apply sum_le_sum
   intro l hl
   exact hc k l (by simpa using hk) (by simpa using hl)
 simp only [←sum_mul,kernel_rectangleM8F7,show a+1+1=a+2 by omega,
   show b+1+1=b+2 by omega] at h
 nlinarith only [h]

theorem reduced_shapeM8F7 : ReducedShapeMDB9 := by
 constructor
 · intro n j r hn
   have h := kernel_parameter_lcM8F7 (n+2) n j r
   simp only [kernelM8F7,show n+2+1=n+1+2 by omega,←reduced_kernel_sumMDB9] at h
   exact_mod_cast h
 · intro n j r hn
   have h := kernel_shift_minorM8F7 (n+2) n j r
   have he : n+2+1=n+1+2 := by omega
   rw [he] at h
   simp only [kernelM8F7,←reduced_kernel_sumMDB9] at h
   exact_mod_cast h

theorem kernel_diagonalM8F7 : KernelDiagonalMDB9 :=
 kernel_diagonal_of_reduced_shapeMDB9 reduced_shapeM8F7

theorem source_two_diagonal_ge_threeM8F7 (path : List Bool)
 (ha : (frame path).mid.a=2) (i j : ℕ) (hi : 3 ≤ i) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 :=
 source_two_diagonal_of_kernelMDB9 kernel_diagonalM8F7 path ha i j hi

theorem root_iff_small_and_otherM8F7 :
 Conjecture63 ↔ SmallTwoDiagonalMDB9 ∧ OtherSourcesM679 := by
 rw [root_iff_kernel_diagonalMDB9]
 exact and_iff_right kernel_diagonalM8F7

end
end MathGKM.Markov
