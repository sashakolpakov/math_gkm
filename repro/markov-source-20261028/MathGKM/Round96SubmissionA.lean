import MathGKM.Round96OriginalA

/- Machine-authored exact r96 submission wrappers. -/
namespace Round96SubmissionA

theorem interface_claim :
(∀ N sigma j L a b r : ℕ,
  (FullFiberRankR80.rankPoly N sigma j L a b).coeff r =
    (Finset.range (a/2+1)).sum (fun c => ComplementaryAllocationR96.G N sigma j L a b c r)) ∧
  (∀ N sigma j L a b c r : ℕ, c≤a/2 → r≤L →
    ComplementaryAllocationR96.G N sigma j L a b c (L-r) =
      ComplementaryAllocationR96.G N sigma j L a b c r) ∧
  (∀ N sigma j L a b c r : ℕ, L<r → ComplementaryAllocationR96.G N sigma j L a b c r=0) :=
  ComplementaryAllocationR96.interface

#print axioms interface_claim

theorem separator_claim :
(ComplementaryAllocationR96.G 4 0 0 6 2 0 0 2=1 ∧
  ComplementaryAllocationR96.G 4 0 0 6 2 0 0 3=0 ∧
  ComplementaryAllocationR96.G 4 0 0 6 2 0 1 2=0 ∧
  ComplementaryAllocationR96.G 4 0 0 6 2 0 1 3=4) ∧
  (ComplementaryAllocationR96.G 4 0 0 6 2 0 0 3 < ComplementaryAllocationR96.G 4 0 0 6 2 0 0 2 ∧
    (PairConvolutionR78.P 4 0 0 6 2 0 2).card=1 ∧
    (PairConvolutionR78.P 4 0 0 6 2 0 3).card=4 ∧
    ¬ (∀ n sigma j i a b c : ℕ, sigma≤1 → c≤a/2 →
      ComplementaryAllocationR96.G (2*n) sigma j (2*i+2) a b c i ≤
        ComplementaryAllocationR96.G (2*n) sigma j (2*i+2) a b c (i+1))) ∧
  (let E := (MathGKM.Markov.frame [true]).mid;
    E.a=2 ∧ E.b=3 ∧
    MathGKM.Markov.InPolygon E.a E.b 2 0 ∧ MathGKM.Markov.InPolygon E.a E.b 3 0 ∧
    MathGKM.Markov.InPolygon E.a E.b 4 0 ∧
    MathGKM.Markov.coeff E.p 2 0=1 ∧ MathGKM.Markov.coeff E.p 3 0=2 ∧
    MathGKM.Markov.coeff E.p 4 0=1 ∧
    MathGKM.Markov.coeff E.p 3 0^2-MathGKM.Markov.coeff E.p 2 0*MathGKM.Markov.coeff E.p 4 0=3) :=
  ComplementaryAllocationR96.separator_bundle

#print axioms separator_claim

theorem central_claim :
∀ N sigma j i a b : ℕ,
  (∀ c : ℕ, c≤a/2 → ComplementaryAllocationR96.G N sigma j (2*i+2) a b c i ≤
    ComplementaryAllocationR96.G N sigma j (2*i+2) a b c (i+1)) →
  (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
    (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card :=
  ComplementaryAllocationR96.conditional_central

#print axioms central_claim

end Round96SubmissionA
