import MarkovExpressionPackedM7A3
/-! Machine-authored 7a344181. The complete positive-expression certificate
is used only through checked degree, mass and packed arithmetic theorems. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
theorem pair_reduced_nonnegM7A3 (T x g z : ℚ)
 (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ pairReducedMAD5 T x g z := by
 let v : Fin 4 → ℚ := ![x,g,z,T]
 have h := expr_certificateM7A3 (2^80) (by norm_num) leftExprM7A3 rightExprM7A3
   leftExpr_degree0M7A3 leftExpr_degree1M7A3 leftExpr_degree2M7A3
   rightExpr_degree0M7A3 rightExpr_degree1M7A3 rightExpr_degree2M7A3
   leftExpr_massM7A3 rightExpr_massM7A3 packed_identityM7A3 v
 change evalExprM7A3 v ep0M7A3 + evalExprM7A3 v ep1M7A3 =
   (evalExprM7A3 v ep2M7A3 + evalExprM7A3 v ep3M7A3) +
   evalExprM7A3 v gapExprM7A3 at h
 have hpos : 0 ≤ evalExprM7A3 v gapExprM7A3 :=
   eval_expr_nonnegM7A3 v (by intro i; fin_cases i <;> assumption) gapExprM7A3
 dsimp [v] at h
 rw [ep0_evalM7A3,ep1_evalM7A3,ep2_evalM7A3,ep3_evalM7A3] at h
 unfold pairReducedMAD5
 linarith

theorem reduced_pair_positiveM7A3 : ReducedPairPositiveMAD5 := by
 intro T x g z
 exact pair_reduced_nonnegM7A3 T x g z (by positivity) (by positivity)
   (by positivity) (by positivity)
end
end MathGKM.Markov
