import MarkovExpressionFactorsM7A3
import MarkovExpressionGapM7A3
/-! Machine-authored live request 7a344181. Generated positive expression data; all certificate claims require kernel checking. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def rightExprM7A3 : NExprM7A3 := .add (.add ep2M7A3 ep3M7A3) gapExprM7A3
theorem leftExpr_degree0M7A3 : degreeExprM7A3 0 leftExprM7A3 < 23 := by decide +kernel
theorem leftExpr_degree1M7A3 : degreeExprM7A3 1 leftExprM7A3 < 20 := by decide +kernel
theorem leftExpr_degree2M7A3 : degreeExprM7A3 2 leftExprM7A3 < 13 := by decide +kernel
theorem leftExpr_massM7A3 : evalExprM7A3 (fun _ => (1:ℕ)) leftExprM7A3 < 2^80 := by decide +kernel
theorem rightExpr_degree0M7A3 : degreeExprM7A3 0 rightExprM7A3 < 23 := by decide +kernel
theorem rightExpr_degree1M7A3 : degreeExprM7A3 1 rightExprM7A3 < 20 := by decide +kernel
theorem rightExpr_degree2M7A3 : degreeExprM7A3 2 rightExprM7A3 < 13 := by decide +kernel
theorem rightExpr_massM7A3 : evalExprM7A3 (fun _ => (1:ℕ)) rightExprM7A3 < 2^80 := by decide +kernel
end MathGKM.Markov
