import MarkovRampOrderM9F23
import MarkovParameterShapeM8F7
/-! Machine-authored 9f234835. Simultaneous ramp-kernel parameter shape on a,b >= 1. Adapted from the inherited weight-two argument, with newly proved ramp prefix comparison. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem kernel_shift_convolutionM9F23 (a b j r : ℕ) :
 kernelM9F23 (a+1) (b+1) j r=
 convolutionM8F7 (prefixM8F7 (weightedReverseM9F23 (b+1) r)) (nbNatM8F7 a) j := by
 rw [kernel_convolutionM9F23,convolution_prefixM8F7,nb_prefixM8F7]

theorem kernel_shift_minorM9F23 (a b j r : ℕ) (hb : 1 ≤ b) :
 kernelM9F23 (a+1) (b+1) j r*kernelM9F23 a b (j+1) r≤
 kernelM9F23 a b j r*kernelM9F23 (a+1) (b+1) (j+1) r := by
 have h := determinant_sum_nonnegFe01
   (weightedReverseM9F23 b r) (prefixM8F7 (weightedReverseM9F23 (b+1) r))
   (fun k => nbSeqMDB9 a ((j:ℤ)-k)) (fun k => nbSeqMDB9 a ((j:ℤ)+1-k)) (j+2)
   (fun x y hxy _ => weighted_prefix_orderM9F23 b r x y hb hxy) ?_
 · rw [kernel_shift_convolutionM9F23,kernel_shift_convolutionM9F23,
     kernel_convolutionM9F23,kernel_convolutionM9F23,
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

theorem kernel_shift_ratio_rowM9F23 (a b r : ℕ) (hb : 1 ≤ b) :
 Monotone (fun j => kernelM9F23 (a+1) (b+1) j r/kernelM9F23 a b j r) := by
 apply monotone_nat_of_le_succ
 intro j
 apply (div_le_div_iff₀ (kernel_positiveM9F23 _ _ _ _) (kernel_positiveM9F23 _ _ _ _)).mpr
 simpa only [mul_comm] using kernel_shift_minorM9F23 a b j r hb

theorem kernel_shift_ratio_columnM9F23 (a b j : ℕ) (ha : 1 ≤ a) :
 Monotone (fun r => kernelM9F23 (a+1) (b+1) j r/kernelM9F23 a b j r) := by
 simpa only [kernel_swapM9F23 a b,kernel_swapM9F23 (a+1) (b+1)] using
   kernel_shift_ratio_rowM9F23 b a j ha

theorem kernel_parameter_lcM9F23 (a b j r : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b) :
 kernelM9F23 a b j r*kernelM9F23 (a+2) (b+2) j r≤
 kernelM9F23 (a+1) (b+1) j r^2 := by
 have hc (k l : ℕ) (hk : k≤j) (hl : l≤r) :
   kernelM9F23 (a+1) (b+1) k l*kernelM9F23 a b j r≤
   kernelM9F23 a b k l*kernelM9F23 (a+1) (b+1) j r := by
   have h := le_trans (kernel_shift_ratio_rowM9F23 a b l hb hk)
     (kernel_shift_ratio_columnM9F23 a b j ha hl)
   have h' := (div_le_div_iff₀ (kernel_positiveM9F23 _ _ _ _) (kernel_positiveM9F23 _ _ _ _)).mp h
   nlinarith only [h']
 have h : (∑ k ∈ range (j+1),∑ l ∈ range (r+1),
     kernelM9F23 (a+1) (b+1) k l*kernelM9F23 a b j r)≤
   ∑ k ∈ range (j+1),∑ l ∈ range (r+1),
     kernelM9F23 a b k l*kernelM9F23 (a+1) (b+1) j r := by
   apply sum_le_sum
   intro k hk
   apply sum_le_sum
   intro l hl
   exact hc k l (by simpa using hk) (by simpa using hl)
 simp only [←sum_mul,kernel_rectangleM9F23,show a+1+1=a+2 by omega,
   show b+1+1=b+2 by omega] at h
 nlinarith only [h]

end
end MathGKM.Markov
