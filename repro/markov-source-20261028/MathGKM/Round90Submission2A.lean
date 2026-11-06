import MathGKM.Round90CoupledA
/- Machine-authored round90 exact submission. -/
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000
theorem SparseSubmissionR90.one_bundle :
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
    (L+2*j+b+1≠4*n → H=0) := by
  intro n sigma hs
  refine ⟨fun i j b => SparseCoupledR90.one_count n sigma i j b hs,
    fun i j b h => SparseCoupledR90.one_conservation n sigma i j b hs h, ?_⟩
  intro j L b
  dsimp only
  refine ⟨fun r hr => SparseCoupledR90.rank_one_closed n sigma j L b r hs hr,
    fun r h => SparseCoupledR90.rank_one_all_conservation n sigma j L b r hs h, ?_⟩
  intro h
  apply Polynomial.ext
  intro r
  simp only [Polynomial.coeff_zero]
  by_contra hh
  exact h (SparseCoupledR90.rank_one_all_conservation n sigma j L b r hs hh)
end
#print axioms SparseSubmissionR90.one_bundle
