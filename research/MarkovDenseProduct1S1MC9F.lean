import MarkovDenseFactorsMC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp1s1MC9F : DenseMC9F 4 := [[],[[[5,1]]],[[[1]]]]
theorem dp1s1MC9F_eqMC9F : dmulMC9F 4 df4MC9F df5MC9F = dp1s1MC9F := by decide +kernel
theorem dp1s1MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp1s1MC9F = devalMC9F 4 v df4MC9F * devalMC9F 4 v df5MC9F := by
 rw [← dp1s1MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
