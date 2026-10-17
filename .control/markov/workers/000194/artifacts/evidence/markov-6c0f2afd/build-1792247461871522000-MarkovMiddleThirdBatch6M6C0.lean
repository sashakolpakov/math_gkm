import MarkovMiddleFixedDepthM6C0
/-! Machine-authored 6c0f2afd. Complete third middle row: fixed-column
univariate certificates on the exact nonzero support, all denominators. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000

theorem third_dense_6_falseM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 6 false)) := by decide +kernel

theorem third_dense_6_trueM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 6 true)) := by decide +kernel

theorem middle_two_6_nonnegM6C0 (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 6 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 6 false third_dense_6_falseM6C0 x
 · exact fixed_two_transferM6C0 6 true third_dense_6_trueM6C0 x

theorem third_dense_7_falseM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 7 false)) := by decide +kernel

theorem third_dense_7_trueM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 7 true)) := by decide +kernel

theorem middle_two_7_nonnegM6C0 (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 7 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 7 false third_dense_7_falseM6C0 x
 · exact fixed_two_transferM6C0 7 true third_dense_7_trueM6C0 x

theorem third_dense_8_falseM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 8 false)) := by decide +kernel

theorem third_dense_8_trueM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 8 true)) := by decide +kernel

theorem middle_two_8_nonnegM6C0 (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 8 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 8 false third_dense_8_falseM6C0 x
 · exact fixed_two_transferM6C0 8 true third_dense_8_trueM6C0 x

theorem third_dense_9_falseM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 9 false)) := by decide +kernel

theorem third_dense_9_trueM6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 9 true)) := by decide +kernel

theorem middle_two_9_nonnegM6C0 (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 9 x 2 := by
 cases r
 · exact fixed_two_transferM6C0 9 false third_dense_9_falseM6C0 x
 · exact fixed_two_transferM6C0 9 true third_dense_9_trueM6C0 x

end MathGKM.Markov
