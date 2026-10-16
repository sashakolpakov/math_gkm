import MarkovDiagonalShapeMDB9
/-! Machine-authored db972d62. The remaining parameter-shape property does
not follow merely from log-concavity of an arbitrary diagonal weight. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def parameterWeightMDB9 (t : ℝ) (k : ℤ) : ℝ :=
 if k<0 then 0 else if k=0 then 1 else t

theorem parameter_weight_nonnegMDB9 (t : ℝ) (ht : 1 ≤ t) (k : ℤ) :
 0 ≤ parameterWeightMDB9 t k := by
 unfold parameterWeightMDB9
 split_ifs <;> linarith

theorem parameter_weight_crossMDB9 (t : ℝ) (ht : 1 ≤ t) : CrossLC (parameterWeightMDB9 t) := by
 intro i j hij
 by_cases hi : i<0
 · simp only [parameterWeightMDB9,if_pos hi,zero_mul]
   exact mul_nonneg (parameter_weight_nonnegMDB9 t ht _) (parameter_weight_nonnegMDB9 t ht _)
 · have hj : ¬j<0 := by omega
   have hi1 : ¬i+1<0 := by omega
   have hj1 : ¬j+1<0 := by omega
   simp only [parameterWeightMDB9,hi,hj,hi1,hj1,if_false,
     if_neg (show i+1≠0 by omega),if_neg (show j+1≠0 by omega)]
   by_cases hi0 : i=0
   · rw [if_pos hi0]
     by_cases hj0 : j=0
     · rw [if_pos hj0]; simp
     · rw [if_neg hj0]; nlinarith
   · rw [if_neg hi0,if_neg (show j≠0 by omega)]

theorem parameter_shape_counterexampleMDB9 :
 let H := fun n => diagSumMDB9 (nbSeqMDB9 (n+2)) (nbSeqMDB9 n) (parameterWeightMDB9 17) 1 1
 H 2^2 < H 1*H 3 := by
 norm_num [diagSumMDB9,Finset.sum_range_succ,parameterWeightMDB9,nbSeqMDB9,Nat.choose]

theorem actual_weight_small_gapMDB9 :
 reducedKernelMDB9 1 1 1*reducedKernelMDB9 3 1 1 ≤ reducedKernelMDB9 2 1 1^2 := by
 norm_num [reducedKernelMDB9,twoKernelM4F4,Finset.sum_range_succ,Nat.choose]
end
end MathGKM.Markov
