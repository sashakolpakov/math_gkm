import MarkovDenseProduct3S1MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp3s2MC9F : DenseMC9F 4 := [[[[476,187,24,1],[224,60,4],[28,4]],[[224,60,4],[56,8]],[[28,4]]],[[[663,235,27,1],[284,68,4],[32,4]],[[284,68,4],[64,8]],[[32,4]]],[[[211,51,3],[64,8],[4]],[[64,8],[8]],[[4]]],[[[25,3],[4]],[[4]]],[[[1]]]]
theorem dp3s2MC9F_eqMC9F : dmulMC9F 4 dp3s1MC9F df13MC9F = dp3s2MC9F := by decide +kernel
theorem dp3s2MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp3s2MC9F = devalMC9F 4 v dp3s1MC9F * devalMC9F 4 v df13MC9F := by
 rw [← dp3s2MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
