import MarkovDenseProduct3S2MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp3s3MC9F : DenseMC9F 4 := [[[[476,187,24,1],[700,247,28,1],[252,64,4],[28,4]],[[224,60,4],[280,68,4],[56,8]],[[28,4],[28,4]]],[[[663,235,27,1],[947,303,31,1],[316,72,4],[32,4]],[[284,68,4],[348,76,4],[64,8]],[[32,4],[32,4]]],[[[211,51,3],[275,59,3],[68,8],[4]],[[64,8],[72,8],[8]],[[4],[4]]],[[[25,3],[29,3],[4]],[[4],[4]]],[[[1],[1]]]]
theorem dp3s3MC9F_eqMC9F : dmulMC9F 4 dp3s2MC9F df18MC9F = dp3s3MC9F := by decide +kernel
theorem dp3s3MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp3s3MC9F = devalMC9F 4 v dp3s2MC9F * devalMC9F 4 v df18MC9F := by
 rw [← dp3s3MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
