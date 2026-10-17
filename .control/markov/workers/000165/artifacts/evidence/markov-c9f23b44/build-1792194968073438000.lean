import MarkovDenseProduct1S3MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp1s4MC9F : DenseMC9F 4 := [[],[[[0,0,0,0],[3360,1852,371,32,1],[1440,628,88,4],[160,52,4]],[[0,0,0],[1860,807,112,5],[500,160,12],[20,4]],[[0,0],[340,108,8],[40,8]],[[0],[20,4]]],[[[0,0,0],[1852,742,96,4],[628,176,12],[52,8]],[[0,0],[807,224,15],[160,24],[4]],[[0],[108,16],[8]],[[],[4]]],[[[0,0],[371,96,6],[88,12],[4]],[[0],[112,15],[12]],[[],[8]]],[[[0],[32,4],[4]],[[],[5]]],[[[],[1]]]]
theorem dp1s4MC9F_eqMC9F : dmulMC9F 4 dp1s3MC9F df2MC9F = dp1s4MC9F := by decide +kernel
theorem dp1s4MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp1s4MC9F = devalMC9F 4 v dp1s3MC9F * devalMC9F 4 v df2MC9F := by
 rw [← dp1s4MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
