import MathGKM.Round90Submission1A
import MathGKM.Markov
def MathGKM.Target6dc834dcccacde2a7614f14f.Interface :=
  (
    True
  )
def MathGKM.Target6dc834dcccacde2a7614f14f.Transport (StudyInterface : MathGKM.Target6dc834dcccacde2a7614f14f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target6dc834dcccacde2a7614f14f.Goal (StudyInterface : MathGKM.Target6dc834dcccacde2a7614f14f.Interface) : Prop :=
  (
    ∀ (n sigma : ℕ), sigma ≤ 1 →
      (∀ i j k : ℕ,
        ((MatchingProjectionR64.B (2*n) sigma i j).coeff 0).coeff k =
          SparseRankR89.count (SparseRankR89.isolated n sigma) (SparseRankR89.cells n sigma) i j k) ∧
      ∀ j L b : ℕ, let H := FullFiberRankR80.rankPoly (2*n) sigma j L 0 b
        (∀ r, r≤L → H.coeff r =
          ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
            SparseRankR89.count (SparseRankR89.isolated n sigma) (SparseRankR89.cells n sigma) r j q.1 *
            SparseRankR89.count (SparseRankR89.isolated n sigma) (SparseRankR89.cells n sigma) (L-r) j q.2) ∧
        (∀ r, SparseRankR89.Supported n sigma j L b r →
          H.coeff r=SparseRankR90.row n sigma j r*SparseRankR90.row n sigma j (L-r)) ∧
        (∀ r, 0<H.coeff r ↔ SparseRankR89.Supported n sigma j L b r) ∧
        (∀ r, 0≤H.coeff r) ∧
        (∀ x y z : ℕ, x<y → y<z → 0<H.coeff x → 0<H.coeff z → 0<H.coeff y) ∧
        (∀ r, r≤L → H.coeff r=H.coeff (L-r)) ∧
        (∀ r, H.coeff r*H.coeff (r+2)≤H.coeff (r+1)^2) ∧
        (∀ r, 2*r<L → H.coeff r≤H.coeff (r+1)) ∧
        (∀ r, L<r → H.coeff r=0) ∧
        (∀ r, ¬SparseRankR89.Supported n sigma j L b r → H.coeff r=0) ∧
        (L+2*j+b≠4*n → H=0)
  )
