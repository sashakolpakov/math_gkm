import MarkovDenseProduct0S1MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp0s2MC9F : DenseMC9F 4 := [[[[864,348,46,2],[448,120,8],[64,8]],[[780,266,29,1],[344,76,4],[40,4]],[[220,52,3],[68,8],[4]],[[25,3],[4]],[[1]]],[[[780,266,29,1],[344,76,4],[40,4]],[[440,104,6],[136,16],[8]],[[75,9],[12]],[[4]]],[[[220,52,3],[68,8],[4]],[[75,9],[12]],[[6]]],[[[25,3],[4]],[[4]]],[[[1]]]]
theorem dp0s2MC9F_eqMC9F : dmulMC9F 4 dp0s1MC9F df3MC9F = dp0s2MC9F := by decide +kernel
theorem dp0s2MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp0s2MC9F = devalMC9F 4 v dp0s1MC9F * devalMC9F 4 v df3MC9F := by
 rw [← dp0s2MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
