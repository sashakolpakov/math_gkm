import MarkovMiddleFixedDepthM6C0
/-! Machine-authored 9db2326d. Candidate third-row slice: fixed-column
univariate certificates on the exact nonzero support, all denominators. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000

theorem third_dense_14_falseM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 14 false)) := by decide +kernel

theorem third_dense_14_trueM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 14 true)) := by decide +kernel

theorem middle_two_14_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 14 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 14 false third_dense_14_falseM9DB x
 · exact fixed_two_transferM6C0 14 true third_dense_14_trueM9DB x

theorem third_dense_15_falseM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 15 false)) := by decide +kernel

theorem third_dense_15_trueM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 15 true)) := by decide +kernel

theorem middle_two_15_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 15 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 15 false third_dense_15_falseM9DB x
 · exact fixed_two_transferM6C0 15 true third_dense_15_trueM9DB x

theorem third_dense_16_falseM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 16 false)) := by decide +kernel

theorem third_dense_16_trueM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 16 true)) := by decide +kernel

theorem middle_two_16_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 16 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 16 false third_dense_16_falseM9DB x
 · exact fixed_two_transferM6C0 16 true third_dense_16_trueM9DB x

end MathGKM.Markov
