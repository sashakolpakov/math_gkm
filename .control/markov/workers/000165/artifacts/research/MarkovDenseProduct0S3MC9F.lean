import MarkovDenseProduct0S2MC9F
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def dp0s3MC9F : DenseMC9F 4 := [[[[1728,696,92,4],[1760,588,62,2],[576,136,8],[64,8]],[[2424,880,104,4],[1916,538,45,1],[488,92,4],[40,4]],[[1220,370,35,1],[700,144,7],[116,12],[4]],[[270,58,3],[101,11],[8]],[[27,3],[5]],[[1]]],[[[1560,532,58,2],[1468,418,37,1],[424,84,4],[40,4]],[[1660,474,41,1],[1056,212,10],[192,20],[8]],[[590,122,6],[235,25],[20]],[[83,9],[16]],[[4]]],[[[440,104,6],[356,68,3],[76,8],[4]],[[370,70,3],[167,17],[16]],[[87,9],[18]],[[6]]],[[[50,6],[33,3],[4]],[[33,3],[8]],[[4]]],[[[2],[1]],[[1]]]]
theorem dp0s3MC9F_eqMC9F : dmulMC9F 4 dp0s2MC9F df16MC9F = dp0s3MC9F := by decide +kernel
theorem dp0s3MC9F_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v dp0s3MC9F = devalMC9F 4 v dp0s2MC9F * devalMC9F 4 v df16MC9F := by
 rw [← dp0s3MC9F_eqMC9F,deval_mulMC9F]
end MathGKM.Markov
