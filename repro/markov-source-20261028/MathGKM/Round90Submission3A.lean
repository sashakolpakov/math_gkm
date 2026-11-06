import MathGKM.Round90RankA
/- Machine-authored round90 exact submission. -/
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000
theorem SparseSubmissionR90.central_bundle :
∀ n i j b : ℕ,
  (PairConvolutionR78.P (2*n) 0 j (2*i+2) 0 b i).card ≤
    (PairConvolutionR78.P (2*n) 0 j (2*i+2) 0 b (i+1)).card ∧
  (PairConvolutionR78.P (2*n) 1 i (2*j+2) 0 b j).card ≤
    (PairConvolutionR78.P (2*n) 1 i (2*j+2) 0 b (j+1)).card := by
  intro n i j b
  exact ⟨SparseRankR90.alpha_zero_central n 0 j i b (by omega),
    SparseRankR90.alpha_zero_central n 1 i j b (by omega)⟩
end
#print axioms SparseSubmissionR90.central_bundle
