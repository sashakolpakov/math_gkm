import MarkovDenseProduct2S2MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp2s3MC9F : DenseMC9F 4 := [[[[408,170,23,1],[600,226,27,1],[216,60,4],[24,4]],[[986,386,49,2],[1018,336,34,1],[300,72,4],[28,4]],[[771,265,29,1],[501,121,7],[92,12],[4]],[[217,52,3],[88,11],[8]],[[25,3],[5]],[[1]]],[[[578,216,26,1],[826,280,30,1],[276,68,4],[28,4]],[[964,314,32,1],[754,178,10],[156,20],[8]],[[458,107,6],[204,25],[20]],[[76,9],[16]],[[4]]],[[[193,49,3],[253,57,3],[64,8],[4]],[[265,58,3],[144,17],[16]],[[78,9],[18]],[[6]]],[[[24,3],[28,3],[4]],[[28,3],[8]],[[4]]],[[[1],[1]],[[1]]]]
theorem dp2s3MC9F_eqMC9F : dmulMC9F 4 dp2s2MC9F df20MC9F = dp2s3MC9F := by decide +kernel
theorem dp2s3MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp2s3MC9F = devalMC9F 4 v dp2s2MC9F * devalMC9F 4 v df20MC9F := by
 rw [← dp2s3MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
