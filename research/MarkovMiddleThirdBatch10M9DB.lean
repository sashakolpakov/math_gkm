import MarkovMiddleFixedDepthM6C0
/-! Machine-authored 9db2326d. Candidate third-row slice: fixed-column
univariate certificates on the exact nonzero support, all denominators. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000

theorem third_dense_10_falseM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 10 false)) := by decide +kernel

theorem third_dense_10_trueM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 10 true)) := by decide +kernel

theorem middle_two_10_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 10 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 10 false third_dense_10_falseM9DB x
 · exact fixed_two_transferM6C0 10 true third_dense_10_trueM9DB x

theorem third_dense_11_falseM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 11 false)) := by decide +kernel

theorem third_dense_11_trueM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 11 true)) := by decide +kernel

theorem middle_two_11_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 11 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 11 false third_dense_11_falseM9DB x
 · exact fixed_two_transferM6C0 11 true third_dense_11_trueM9DB x

theorem third_dense_12_falseM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 12 false)) := by decide +kernel

theorem third_dense_12_trueM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 12 true)) := by decide +kernel

theorem middle_two_12_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 12 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 12 false third_dense_12_falseM9DB x
 · exact fixed_two_transferM6C0 12 true third_dense_12_trueM9DB x

theorem third_dense_13_falseM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 13 false)) := by decide +kernel

theorem third_dense_13_trueM9DB :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 13 true)) := by decide +kernel

theorem middle_two_13_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 13 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 13 false third_dense_13_falseM9DB x
 · exact fixed_two_transferM6C0 13 true third_dense_13_trueM9DB x

end MathGKM.Markov
