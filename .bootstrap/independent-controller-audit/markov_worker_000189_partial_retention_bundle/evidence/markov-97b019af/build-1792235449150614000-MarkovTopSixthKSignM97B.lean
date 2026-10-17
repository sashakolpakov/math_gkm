import MarkovTopSixthCertificateM97B
/-! Machine-authored 97b019af. Ring-checked positive scalar expansion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
theorem sixth_k_shiftM97B (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < (fun a m H => -sixthKM97B a m H) (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : 1*(fun a m H => -sixthKM97B a m H) (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 68249664
  +8590176*z
  +270144*z^2
  +12279456*y
  +770112*y*z
  +562464*y^2
  +84019920*x
  +8936496*x*z
  +229536*x*z^2
  +12947976*x*y
  +666144*x*y*z
  +492024*x*y^2
  +42767680*x^2
  +3683056*x^2*z
  +72224*x^2*z^2
  +5395384*x^2*y
  +212512*x^2*y*z
  +158152*x^2*y^2
  +11531856*x^3
  +752512*x^3*z
  +9984*x^3*z^2
  +1112512*x^3*y
  +29696*x^3*y*z
  +22208*x^3*y^2
  +1738464*x^4
  +76288*x^4*z
  +512*x^4*z^2
  +113664*x^4*y
  +1536*x^4*y*z
  +1152*x^4*y^2
  +139008*x^5
  +3072*x^5*z
  +4608*x^5*y
  +4608*x^6 := by dsimp only; unfold sixthKM97B; ring
 have hp : (0:ℝ)<68249664
  +8590176*z
  +270144*z^2
  +12279456*y
  +770112*y*z
  +562464*y^2
  +84019920*x
  +8936496*x*z
  +229536*x*z^2
  +12947976*x*y
  +666144*x*y*z
  +492024*x*y^2
  +42767680*x^2
  +3683056*x^2*z
  +72224*x^2*z^2
  +5395384*x^2*y
  +212512*x^2*y*z
  +158152*x^2*y^2
  +11531856*x^3
  +752512*x^3*z
  +9984*x^3*z^2
  +1112512*x^3*y
  +29696*x^3*y*z
  +22208*x^3*y^2
  +1738464*x^4
  +76288*x^4*z
  +512*x^4*z^2
  +113664*x^4*y
  +1536*x^4*y*z
  +1152*x^4*y^2
  +139008*x^5
  +3072*x^5*z
  +4608*x^5*y
  +4608*x^6 := by positivity
 linarith only [he,hp]

theorem sixth_k_positiveM97B (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H) :
 0 < (fun a m H => -sixthKM97B a m H) a m H := by
 have h := sixth_k_shiftM97B (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
