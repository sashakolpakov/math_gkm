import MathGKM.Round97CompensationA

-- Machine-authored round97: independent exact interface wrapper.
namespace Round97InterfaceSubmissionA
theorem interface_claim :
    (∀ N sigma j i a b : ℕ,
      (Finset.range (a/2+1)).sum (fun c => AllocationCompensationR97.delta N sigma j i a b c) =
        ((PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
        ((PairConvolutionR78.P N sigma j (2*i+2) a b i).card : ℤ)) ∧
    (∀ N sigma j i a b : ℕ,
      (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
        (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card ↔
      AllocationCompensationR97.loss N sigma j i a b ≤ AllocationCompensationR97.gain N sigma j i a b) ∧
    (AllocationCompensationR97.delta 4 0 0 2 2 0 0 = -1 ∧
      AllocationCompensationR97.delta 4 0 0 2 2 0 1 = 4 ∧
      AllocationCompensationR97.loss 4 0 0 2 2 0 = 1 ∧
      AllocationCompensationR97.gain 4 0 0 2 2 0 = 4 ∧
      (Finset.range (2/2+1)).sum (fun c => AllocationCompensationR97.delta 4 0 0 2 2 0 c) = 3) :=
  AllocationCompensationR97.interface

end Round97InterfaceSubmissionA
#print axioms Round97InterfaceSubmissionA.interface_claim
