import MarkovTopSixthCertificateM97B
/-! Machine-authored 97b019af. Ring-checked positive scalar expansion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
theorem sixth_delta_shiftM97B (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < sixthdeltaM97B (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : 2*sixthdeltaM97B (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 18622704
  +6575616*z
  +854592*z^2
  +48384*z^3
  +1008*z^4
  +7490016*y
  +1867584*y*z
  +151752*y*z^2
  +4032*y*z^3
  +1123932*y^2
  +174192*y^2*z
  +6708*y^2*z^2
  +74724*y^3
  +5352*y^3*z
  +1863*y^4
  +25065664*x
  +7466304*x*z
  +790848*x*z^2
  +34656*x*z^3
  +512*x*z^4
  +8444064*x*y
  +1719336*x*y*z
  +108328*x*y*z^2
  +2048*x*y*z^3
  +1021376*x*y^2
  +123284*x*y^2*z
  +3376*x*y^2*z^2
  +51512*x*y^3
  +2656*x*y^3*z
  +872*x*y^4
  +14026384*x^2
  +3378240*x^2*z
  +272784*x^2*z^2
  +8192*x^2*z^3
  +64*x^2*z^4
  +3794016*x^2*y
  +589640*x^2*y*z
  +25504*x^2*y*z^2
  +256*x^2*y*z^3
  +345956*x^2*y^2
  +28720*x^2*y^2*z
  +416*x^2*y^2*z^2
  +11712*x^2*y^3
  +320*x^2*y^3*z
  +100*x^2*y^4
  +4177792*x^3
  +761760*x^3*z
  +41600*x^3*z^2
  +640*x^3*z^3
  +849600*x^3*y
  +89376*x^3*y*z
  +1984*x^3*y*z^2
  +51808*x^3*y^2
  +2208*x^3*y^2*z
  +880*x^3*y^3
  +698672*x^4
  +85632*x^4*z
  +2368*x^4*z^2
  +94848*x^4*y
  +5056*x^4*y*z
  +2896*x^4*y^2
  +62208*x^5
  +3840*x^5*z
  +4224*x^5*y
  +2304*x^6 := by dsimp only; unfold sixthdeltaM97B; ring
 have hp : (0:ℝ)<18622704
  +6575616*z
  +854592*z^2
  +48384*z^3
  +1008*z^4
  +7490016*y
  +1867584*y*z
  +151752*y*z^2
  +4032*y*z^3
  +1123932*y^2
  +174192*y^2*z
  +6708*y^2*z^2
  +74724*y^3
  +5352*y^3*z
  +1863*y^4
  +25065664*x
  +7466304*x*z
  +790848*x*z^2
  +34656*x*z^3
  +512*x*z^4
  +8444064*x*y
  +1719336*x*y*z
  +108328*x*y*z^2
  +2048*x*y*z^3
  +1021376*x*y^2
  +123284*x*y^2*z
  +3376*x*y^2*z^2
  +51512*x*y^3
  +2656*x*y^3*z
  +872*x*y^4
  +14026384*x^2
  +3378240*x^2*z
  +272784*x^2*z^2
  +8192*x^2*z^3
  +64*x^2*z^4
  +3794016*x^2*y
  +589640*x^2*y*z
  +25504*x^2*y*z^2
  +256*x^2*y*z^3
  +345956*x^2*y^2
  +28720*x^2*y^2*z
  +416*x^2*y^2*z^2
  +11712*x^2*y^3
  +320*x^2*y^3*z
  +100*x^2*y^4
  +4177792*x^3
  +761760*x^3*z
  +41600*x^3*z^2
  +640*x^3*z^3
  +849600*x^3*y
  +89376*x^3*y*z
  +1984*x^3*y*z^2
  +51808*x^3*y^2
  +2208*x^3*y^2*z
  +880*x^3*y^3
  +698672*x^4
  +85632*x^4*z
  +2368*x^4*z^2
  +94848*x^4*y
  +5056*x^4*y*z
  +2896*x^4*y^2
  +62208*x^5
  +3840*x^5*z
  +4224*x^5*y
  +2304*x^6 := by positivity
 linarith only [he,hp]

theorem sixth_delta_positiveM97B (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H) :
 0 < sixthdeltaM97B a m H := by
 have h := sixth_delta_shiftM97B (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
