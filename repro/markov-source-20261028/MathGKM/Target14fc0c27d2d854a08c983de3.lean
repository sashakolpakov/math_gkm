import MathGKM.Round90Submission2A
import MathGKM.Markov
def MathGKM.Target14fc0c27d2d854a08c983de3.Interface :=
  (
    True
  )
def MathGKM.Target14fc0c27d2d854a08c983de3.Transport (StudyInterface : MathGKM.Target14fc0c27d2d854a08c983de3.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target14fc0c27d2d854a08c983de3.Goal (StudyInterface : MathGKM.Target14fc0c27d2d854a08c983de3.Interface) : Prop :=
  (
    ∀ (n sigma : ℕ), sigma≤1 →
      (∀ i j b : ℕ, ((MatchingProjectionR64.B (2*n) sigma i j).coeff 1).coeff b =
        SparseCoupledR90.oneCount n sigma i j b) ∧
      (∀ i j b : ℕ, ((MatchingProjectionR64.B (2*n) sigma i j).coeff 1).coeff b≠0 →
        i+j+b+1=2*n) ∧
      ∀ j L b : ℕ, let H := FullFiberRankR80.rankPoly (2*n) sigma j L 1 b
        (∀ r, r≤L → H.coeff r =
          ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
            (SparseRankR89.count (SparseRankR89.isolated n sigma) (SparseRankR89.cells n sigma) r j q.1 *
              SparseCoupledR90.oneCount n sigma (L-r) j q.2 +
             SparseCoupledR90.oneCount n sigma r j q.1 *
              SparseRankR89.count (SparseRankR89.isolated n sigma) (SparseRankR89.cells n sigma) (L-r) j q.2)) ∧
        (∀ r, H.coeff r≠0 → L+2*j+b+1=4*n) ∧
        (L+2*j+b+1≠4*n → H=0)
  )
