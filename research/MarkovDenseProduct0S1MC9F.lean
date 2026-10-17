import MarkovDenseFactorsMC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp0s1MC9F : DenseMC9F 4 := [[[[16,2]],[[10,1]],[[1]]],[[[10,1]],[[2]]],[[[1]]]]
theorem dp0s1MC9F_eqMC9F : dmulMC9F 4 df0MC9F df2MC9F = dp0s1MC9F := by decide +kernel
theorem dp0s1MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp0s1MC9F = devalMC9F 4 v df0MC9F * devalMC9F 4 v df2MC9F := by
 rw [← dp0s1MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
