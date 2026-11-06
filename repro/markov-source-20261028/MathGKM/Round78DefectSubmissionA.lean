import MathGKM.Round78DefectA

/- Machine-authored isolated exact secondary submission. -/
theorem PairConvolutionR78.secondary :
    (∀ N sigma i j a b : ℕ,
      ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b =
        ((PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card : ℤ) -
        ((PairConvolutionR78.P N sigma j (2*i+2) a b i).card : ℤ)) ∧
    (∀ N sigma i j a b : ℕ,
      (0 ≤ ((MatchingProjectionR64.defect N sigma i j).coeff a).coeff b) ↔
        (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
        (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card) :=
  PairConvolutionR78.defect_submission

#print axioms PairConvolutionR78.secondary
