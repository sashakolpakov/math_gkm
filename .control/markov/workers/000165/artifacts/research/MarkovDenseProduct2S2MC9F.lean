import MarkovDenseProduct2S1MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp2s2MC9F : DenseMC9F 4 := [[[[408,170,23,1],[192,56,4],[24,4]],[[578,216,26,1],[248,64,4],[28,4]],[[193,49,3],[60,8],[4]],[[24,3],[4]],[[1]]],[[[578,216,26,1],[248,64,4],[28,4]],[[386,98,6],[120,16],[8]],[[72,9],[12]],[[4]]],[[[193,49,3],[60,8],[4]],[[72,9],[12]],[[6]]],[[[24,3],[4]],[[4]]],[[[1]]]]
theorem dp2s2MC9F_eqMC9F : dmulMC9F 4 dp2s1MC9F df10MC9F = dp2s2MC9F := by decide +kernel
theorem dp2s2MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp2s2MC9F = devalMC9F 4 v dp2s1MC9F * devalMC9F 4 v df10MC9F := by
 rw [← dp2s2MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
