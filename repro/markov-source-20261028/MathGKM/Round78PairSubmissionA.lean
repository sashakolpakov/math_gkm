import MathGKM.Round78PairA

/- Machine-authored exact primary submission wrapper, round78. -/
theorem PairConvolutionR78.submission :
    (∀ (N : ℕ) (o : LocalRetilingR76.Obj),
      o ∈ PairConvolutionR78.U N ↔ LocalRetilingR76.valid N o) ∧
    (∀ N sigma i k j a b : ℕ,
      (((MatchingProjectionR64.B N sigma i j * MatchingProjectionR64.B N sigma k j).coeff a).coeff b) =
        ((PairConvolutionR78.P N sigma j (i+k) a b i).card : ℤ)) :=
  ⟨PairConvolutionR78.mem_U,PairConvolutionR78.pair_coefficient⟩

#print axioms PairConvolutionR78.submission
#print axioms PairConvolutionR78.forget_injective
#print axioms PairConvolutionR78.pair_card
