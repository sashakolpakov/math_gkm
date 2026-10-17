import MarkovTopSixthCertificateM97B
/-! Machine-authored 97b019af. Ring-checked positive scalar expansion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
theorem sixth_c_shiftM97B (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < sixthCM97B (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : 1*sixthCM97B (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 812496
  +102264*z
  +3216*z^2
  +146184*y
  +9168*y*z
  +6696*y^2
  +845476*x
  +86908*x*z
  +2120*x*z^2
  +126298*x*y
  +6184*x*y*z
  +4582*x*y^2
  +348096*x^2
  +27292*x^2*z
  +456*x^2*z^2
  +40174*x^2*y
  +1352*x^2*y*z
  +1010*x^2*y^2
  +70980*x^3
  +3760*x^3*z
  +32*x^3*z^2
  +5592*x^3*y
  +96*x^3*y*z
  +72*x^3*y^2
  +7176*x^4
  +192*x^4*z
  +288*x^4*y
  +288*x^5 := by dsimp only; unfold sixthCM97B; ring
 have hp : (0:ℝ)<812496
  +102264*z
  +3216*z^2
  +146184*y
  +9168*y*z
  +6696*y^2
  +845476*x
  +86908*x*z
  +2120*x*z^2
  +126298*x*y
  +6184*x*y*z
  +4582*x*y^2
  +348096*x^2
  +27292*x^2*z
  +456*x^2*z^2
  +40174*x^2*y
  +1352*x^2*y*z
  +1010*x^2*y^2
  +70980*x^3
  +3760*x^3*z
  +32*x^3*z^2
  +5592*x^3*y
  +96*x^3*y*z
  +72*x^3*y^2
  +7176*x^4
  +192*x^4*z
  +288*x^4*y
  +288*x^5 := by positivity
 linarith only [he,hp]

theorem sixth_c_positiveM97B (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H) :
 0 < sixthCM97B a m H := by
 have h := sixth_c_shiftM97B (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
