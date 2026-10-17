import MarkovMiddleExpressionM6C0
import MarkovMiddleFiveResidualMF8D
/-! Machine-authored 6c0f2afd. Full raw gap: no mixed contribution omitted.
The finite polynomial calculation is a kernel-checked universal identity. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000

theorem middle_dense_6_falseM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 1 false 6)) := by decide +kernel

theorem middle_dense_6_trueM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 1 true 6)) := by decide +kernel

theorem middle_gap_6_shiftM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 6 x (k+1) := by
 cases r
 · exact middle_gap_dense_transferM6C0 1 6 false middle_dense_6_falseM6C0 x k
 · exact middle_gap_dense_transferM6C0 1 6 true middle_dense_6_trueM6C0 x k

theorem middle_gap_6_nonnegM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 6 x k := by
 by_cases hk : 1 ≤ k
 · simpa only [Nat.sub_add_cancel hk] using middle_gap_6_shiftM6C0 x (k-1) r
 · exact middle_gap_first_two_baseMF8D x k 6 r (by omega)

end MathGKM.Markov
