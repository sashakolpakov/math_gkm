import MarkovPrefixM8F7
/-! Machine-authored 8f77f493. Exact limit of the generalized-weight strategy.
This is an auxiliary obstruction, not a source-family counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def variableWeightM8F7 (t : ℝ) (k : ℤ) : ℝ := if k<0 then 0 else if k=0 then 1 else t

def variableKernelM8F7 (t : ℝ) (a b j r : ℕ) : ℝ :=
 diagSumMDB9 (nbSeqMDB9 a) (nbSeqMDB9 b) (variableWeightM8F7 t) j r

theorem variable_minor_gapM8F7 (t : ℝ) (a b : ℕ) :
 variableKernelM8F7 t a b 0 1*variableKernelM8F7 t (a+1) (b+1) 1 1-
 variableKernelM8F7 t (a+1) (b+1) 0 1*variableKernelM8F7 t a b 1 1=
 ((b:ℝ)+1)*((b:ℝ)+2)-t := by
 have hc (n : ℕ) : (1+n).choose n=1+n := by
   simpa only [Nat.add_comm] using Nat.choose_succ_self_right n
 have hc2 (n : ℕ) : (2+n).choose (1+n)=2+n := by
   simpa only [show (1+n)+1=2+n by omega] using Nat.choose_succ_self_right (1+n)
 simp [variableKernelM8F7,diagSumMDB9,Finset.sum_range_succ,variableWeightM8F7,
   nbSeqMDB9,hc,hc2]
 <;> ring

theorem weight_two_sharpM8F7 (t : ℝ) (a : ℕ) :
 variableKernelM8F7 t (a+1) 1 0 1*variableKernelM8F7 t a 0 1 1≤
 variableKernelM8F7 t a 0 0 1*variableKernelM8F7 t (a+1) 1 1 1 ↔ t≤2 := by
 have h := variable_minor_gapM8F7 t a 0
 norm_num at h
 constructor <;> intro ht <;> linarith

theorem weight_three_failureM8F7 :
 variableKernelM8F7 3 2 0 0 1*variableKernelM8F7 3 3 1 1 1<
 variableKernelM8F7 3 3 1 0 1*variableKernelM8F7 3 2 0 1 1 := by
 have h := variable_minor_gapM8F7 3 2 0
 norm_num at h
 linarith

end
end MathGKM.Markov
