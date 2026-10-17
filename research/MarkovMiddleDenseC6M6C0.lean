import MarkovMiddleExpressionM6C0
/-! Machine-authored 6c0f2afd. Universal total raw gap at source column six.
Closed finite coefficient computations here are ordinary kernel proofs. -/
namespace MathGKM.Markov
set_option maxHeartbeats 200000000
set_option maxRecDepth 1000000

theorem middle_dense_3_falseM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 0 false 3)) := by decide +kernel

theorem middle_dense_3_trueM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 0 true 3)) := by decide +kernel

theorem middle_gap_3_nonnegM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 3 x k := by
 cases r
 · simpa only [Nat.add_zero] using middle_gap_dense_transferM6C0 0 3 false middle_dense_3_falseM6C0 x k
 · simpa only [Nat.add_zero] using middle_gap_dense_transferM6C0 0 3 true middle_dense_3_trueM6C0 x k

end MathGKM.Markov
