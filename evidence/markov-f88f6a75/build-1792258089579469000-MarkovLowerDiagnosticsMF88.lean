import MarkovLowerDiagonalMF88
/-! Machine-authored f88f6a75. Auxiliary shortcut failures, not a refutation
of any source-family log-concavity inequality. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

theorem lower_parameter_minor_negativeMF88 :
 lowerDiagMF88 0 0 1*lowerDiagMF88 1 1 1-
 lowerDiagMF88 1 0 1*lowerDiagMF88 0 1 1 = -2 := by
 norm_num [lowerDiagMF88,diagSumMDB9,nbSeqMDB9,chooseSeqMDB9,rampWeightMF88,
   sum_range_succ,Nat.choose]

theorem lower_parameter_minor_unrestricted_falseMF88 : ¬(∀ t j k : ℕ,
 lowerDiagMF88 (t+1) j k*lowerDiagMF88 t (j+1) k ≤
 lowerDiagMF88 t j k*lowerDiagMF88 (t+1) (j+1) k) := by
 intro h
 have h0 := h 0 0 1
 norm_num only [Nat.reduceAdd] at h0
 linarith [lower_parameter_minor_negativeMF88]

def verticalPairTermMF88 (n t j r : ℕ) : ℤ :=
 if r ≤ j then ((n-j-r-1).choose t:ℤ)*((j-r+t+3).choose (t+3):ℤ) else 0

theorem vertical_term_pair_failureMF88 :
 2*verticalPairTermMF88 8 0 1 0*verticalPairTermMF88 8 0 1 2-
 verticalPairTermMF88 8 0 0 0*verticalPairTermMF88 8 0 2 2-
 verticalPairTermMF88 8 0 0 2*verticalPairTermMF88 8 0 2 0 = -1 := by
 norm_num [verticalPairTermMF88,Nat.choose]

end
end MathGKM.Markov
