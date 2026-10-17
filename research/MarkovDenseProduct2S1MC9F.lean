import MarkovDenseFactorsMC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp2s1MC9F : DenseMC9F 4 := [[[[6,1]],[[7,1]],[[1]]],[[[7,1]],[[2]]],[[[1]]]]
theorem dp2s1MC9F_eqMC9F : dmulMC9F 4 df8MC9F df9MC9F = dp2s1MC9F := by decide +kernel
theorem dp2s1MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp2s1MC9F = devalMC9F 4 v df8MC9F * devalMC9F 4 v df9MC9F := by
 rw [← dp2s1MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
