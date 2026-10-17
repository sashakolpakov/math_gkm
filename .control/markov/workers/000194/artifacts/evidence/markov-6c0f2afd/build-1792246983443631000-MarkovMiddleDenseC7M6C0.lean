import MarkovMiddleExpressionM6C0
import MarkovMiddleFiveResidualMF8D
/-! Machine-authored 6c0f2afd. Full raw gap: no mixed contribution omitted.
The finite polynomial calculation is a kernel-checked universal identity. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000

theorem middle_dense_4_falseM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 0 false 4)) := by decide +kernel

theorem middle_dense_4_trueM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 0 true 4)) := by decide +kernel

theorem middle_gap_4_shiftM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 4 x (k+0) := by
 cases r
 · exact middle_gap_dense_transferM6C0 0 4 false middle_dense_4_falseM6C0 x k
 · exact middle_gap_dense_transferM6C0 0 4 true middle_dense_4_trueM6C0 x k

theorem middle_gap_4_nonnegM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 4 x k := by
 by_cases hk : 0 ≤ k
 · simpa only [Nat.sub_add_cancel hk] using middle_gap_4_shiftM6C0 x (k-0) r
 · exact middle_gap_first_two_baseMF8D x k 4 r (by omega)

end MathGKM.Markov
