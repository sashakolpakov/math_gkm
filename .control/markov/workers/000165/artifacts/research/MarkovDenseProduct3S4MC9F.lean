import MarkovDenseProduct3S3MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp3s4MC9F : DenseMC9F 4 := [[[[2856,1598,331,30,1],[4200,2182,415,34,1],[1512,636,88,4],[168,52,4]],[[1820,771,108,5],[2380,935,120,5],[588,168,12],[28,4]],[[392,112,8],[448,120,8],[56,8]],[[28,4],[28,4]]],[[[4454,2260,421,34,1],[6382,3012,517,38,1],[2148,812,100,4],[220,60,4]],[[2591,987,123,5],[3315,1175,135,5],[756,192,12],[32,4]],[[504,128,8],[568,136,8],[64,8]],[[32,4],[32,4]]],[[[1929,752,96,4],[2597,932,108,4],[724,188,12],[56,8]],[[879,231,15],[1055,255,15],[180,24],[4]],[[120,16],[128,16],[8]],[[4],[4]]],[[[361,94,6],[449,106,6],[92,12],[4]],[[113,15],[125,15],[12]],[[8],[8]]],[[[31,4],[35,4],[4]],[[5],[5]]],[[[1],[1]]]]
theorem dp3s4MC9F_eqMC9F : dmulMC9F 4 dp3s3MC9F df9MC9F = dp3s4MC9F := by decide +kernel
theorem dp3s4MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp3s4MC9F = devalMC9F 4 v dp3s3MC9F * devalMC9F 4 v df9MC9F := by
 rw [← dp3s4MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
