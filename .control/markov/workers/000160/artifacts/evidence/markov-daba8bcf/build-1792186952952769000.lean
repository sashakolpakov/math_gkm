import MarkovPositiveRowsMDAB
/-! Machine-authored daba8bcf. An auxiliary transform obstruction.
Geometric weights are NOT the source weights. This does not refute 6.3. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def reverseKernelMDAB (j d l r : ℕ) : ℤ :=
 ((j-r+3).choose (j-l+3):ℤ)*((d+2*j-r-l+3).choose (j-l):ℤ)
def kernelMixtureMDAB (j d l : ℕ) (q : ℤ) : ℤ :=
 ∑ r ∈ range (l+1), q^r*reverseKernelMDAB j d l r

theorem reverseKernel_coeffMDAB (j d l r : ℕ) (hr : r ≤ l) (hl : l ≤ j) :
 reverseKernelMDAB j d l r=(diagonalJMDAB d (j-r)).coeff (j-l) := by
 rw [diagonalJ_coeffMDAB]
 unfold reverseKernelMDAB
 rw [show d+(j-r)+(j-l)+3=d+2*j-r-l+3 by omega]

theorem geometric_weights_lcMDAB (q : ℤ) (k : ℕ) : q^k*q^(k+2)=(q^(k+1))^2 := by
 simp only [pow_add,pow_one]
 ring

theorem kernel_small_valuesMDAB (q : ℤ) :
 kernelMixtureMDAB 8 0 0 q=75582 ∧
 kernelMixtureMDAB 8 0 1 q=350064+19448*q ∧
 kernelMixtureMDAB 8 0 2 q=680680+80080*q+5005*q^2 := by
 norm_num [kernelMixtureMDAB,reverseKernelMDAB,Finset.sum_range_succ,Nat.choose]
 constructor <;> ring

theorem kernel_mixture_gapMDAB (q : ℤ) :
 kernelMixtureMDAB 8 0 1 q^2-
 kernelMixtureMDAB 8 0 0 q*kernelMixtureMDAB 8 0 2 q=
 71101557936+7566664176*q-63206*q^2 := by
 obtain ⟨h0,h1,h2⟩ := kernel_small_valuesMDAB q
 rw [h0,h1,h2]
 ring

theorem kernel_mixture_failureMDAB :
 kernelMixtureMDAB 8 0 1 1000000^2 <
 kernelMixtureMDAB 8 0 0 1000000*kernelMixtureMDAB 8 0 2 1000000 := by
 have h := kernel_mixture_gapMDAB 1000000
 norm_num at h
 linarith

end
end MathGKM.Markov
