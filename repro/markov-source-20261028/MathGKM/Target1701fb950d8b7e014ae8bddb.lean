import MathGKM.Round80RankA
import MathGKM.Markov
def MathGKM.Target1701fb950d8b7e014ae8bddb.Interface :=
  (
    True
  )
def MathGKM.Target1701fb950d8b7e014ae8bddb.Transport (StudyInterface : MathGKM.Target1701fb950d8b7e014ae8bddb.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target1701fb950d8b7e014ae8bddb.Goal (StudyInterface : MathGKM.Target1701fb950d8b7e014ae8bddb.Interface) : Prop :=
  (
    (∀ N sigma j L a b r : ℕ,
      (FullFiberRankR80.rankPoly N sigma j L a b).coeff r =
        ((PairConvolutionR78.P N sigma j L a b r).card : ℤ) ∧
      (r≤L → (FullFiberRankR80.rankPoly N sigma j L a b).coeff r =
        (((MatchingProjectionR64.B N sigma r j *
          MatchingProjectionR64.B N sigma (L-r) j).coeff a).coeff b))) ∧
    (∀ (N sigma j L a b : ℕ) (gamma : ℕ → ℤ),
      FullFiberRankR80.rankPoly N sigma j L a b = SymmetricBinomialR80.expansion L gamma →
      (∀ k, k≤L/2 → 0≤gamma k) →
      (∀ r, r≤L → (PairConvolutionR78.P N sigma j L a b r).card =
        (PairConvolutionR78.P N sigma j L a b (L-r)).card) ∧
      (∀ r, 2*r<L → (PairConvolutionR78.P N sigma j L a b r).card ≤
        (PairConvolutionR78.P N sigma j L a b (r+1)).card)) ∧
    (∀ (N sigma j i a b : ℕ) (gamma : ℕ → ℤ),
      FullFiberRankR80.rankPoly N sigma j (2*i+2) a b =
        SymmetricBinomialR80.expansion (2*i+2) gamma →
      (∀ k, k≤(2*i+2)/2 → 0≤gamma k) →
      (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
        (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card)
  )
