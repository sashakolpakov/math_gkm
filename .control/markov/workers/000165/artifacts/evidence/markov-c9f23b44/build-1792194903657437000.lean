import MarkovDenseProduct1S2MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp1s3MC9F : DenseMC9F 4 := [[],[[[0,0,0],[420,179,24,1],[180,56,4],[20,4]],[[0,0],[180,56,4],[40,8]],[[0],[20,4]]],[[[0,0],[179,48,3],[56,8],[4]],[[0],[56,8],[8]],[[],[4]]],[[[0],[24,3],[4]],[[],[4]]],[[[],[1]]]]
theorem dp1s3MC9F_eqMC9F : dmulMC9F 4 dp1s2MC9F df14MC9F = dp1s3MC9F := by decide +kernel
theorem dp1s3MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp1s3MC9F = devalMC9F 4 v dp1s2MC9F * devalMC9F 4 v df14MC9F := by
 rw [← dp1s3MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
