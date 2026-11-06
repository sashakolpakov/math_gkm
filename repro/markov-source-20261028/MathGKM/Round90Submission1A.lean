import MathGKM.Round90RankA
/- Machine-authored round90 exact submission. -/
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000
theorem SparseSubmissionR90.zero_bundle :
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
    (L+2*j+b≠4*n → H=0) := by
  intro n sigma hs
  refine ⟨fun i j k => SparseRankR89.zero_count n sigma i j k hs, ?_⟩
  intro j L b
  dsimp only
  refine ⟨fun r hr => SparseRankR89.rank_zero_sum n sigma j L b r hs hr,
    fun r h => SparseRankR90.rank_zero_product n sigma j L b r hs h,
    fun r => SparseRankR89.zero_positive n sigma j L b r hs,
    SparseRankR89.rank_nonneg (2*n) sigma j L 0 b,
    fun x y z hxy hyz hx hz => SparseRankR89.zero_interval n sigma j L b x y z hs hxy hyz hx hz,
    SparseRankR89.rank_symmetry (2*n) sigma j L 0 b,
    fun r => SparseRankR90.rank_zero_lc n sigma j L b r hs,
    fun r hr => SparseRankR90.rank_zero_increasing n sigma j L b r hs hr,
    SparseRankR89.rank_tail (2*n) sigma j L 0 b, ?_, ?_⟩
  · intro r h
    have hn := SparseRankR89.rank_nonneg (2*n) sigma j L 0 b r
    have hp := (SparseRankR89.zero_positive n sigma j L b r hs).not.mpr h
    omega
  · intro h
    apply Polynomial.ext
    intro r
    have hp : ¬SparseRankR89.Supported n sigma j L b r := by
      intro hh
      exact h hh.2.1
    have hn := SparseRankR89.rank_nonneg (2*n) sigma j L 0 b r
    have hh := (SparseRankR89.zero_positive n sigma j L b r hs).not.mpr hp
    simp only [Polynomial.coeff_zero]
    omega
end
#print axioms SparseSubmissionR90.zero_bundle
