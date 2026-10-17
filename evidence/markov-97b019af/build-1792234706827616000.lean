import MarkovTopFourthMomentConditionalM731
/-! Machine-authored 97b019af. Exact signs needed by the fourth-moment attachment. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
theorem fourth_delta_shift_positiveM97B (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < fourthDeltaM731 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : 2*fourthDeltaM731 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 3916
  +672*z
  +28*z^2
  +802*y
  +56*y*z
  +41*y^2
  +2724*x
  +332*x*z
  +8*x*z^2
  +378*x*y
  +16*x*y*z
  +10*x*y^2
  +628*x^2
  +40*x^2*z
  +44*x^2*y
  +48*x^3 := by unfold fourthDeltaM731 steinEM208; ring
 have hp : (0:ℝ)<3916
  +672*z
  +28*z^2
  +802*y
  +56*y*z
  +41*y^2
  +2724*x
  +332*x*z
  +8*x*z^2
  +378*x*y
  +16*x*y*z
  +10*x*y^2
  +628*x^2
  +40*x^2*z
  +44*x^2*y
  +48*x^3 := by positivity
 linarith only [he,hp]

theorem fourth_delta_positiveM97B (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H) :
 0 < fourthDeltaM731 a m H := by
 have h := fourth_delta_shift_positiveM97B (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring

theorem fourth_cp_shift_positiveM97B (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < steinCpM208 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : 1*steinCpM208 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 406248
  +51132*z
  +1608*z^2
  +73092*y
  +4584*y*z
  +3348*y^2
  +422738*x
  +43454*x*z
  +1060*x*z^2
  +63149*x*y
  +3092*x*y*z
  +2291*x*y^2
  +174048*x^2
  +13646*x^2*z
  +228*x^2*z^2
  +20087*x^2*y
  +676*x^2*y*z
  +505*x^2*y^2
  +35490*x^3
  +1880*x^3*z
  +16*x^3*z^2
  +2796*x^3*y
  +48*x^3*y*z
  +36*x^3*y^2
  +3588*x^4
  +96*x^4*z
  +144*x^4*y
  +144*x^5 := by unfold steinCpM208; ring
 have hp : (0:ℝ)<406248
  +51132*z
  +1608*z^2
  +73092*y
  +4584*y*z
  +3348*y^2
  +422738*x
  +43454*x*z
  +1060*x*z^2
  +63149*x*y
  +3092*x*y*z
  +2291*x*y^2
  +174048*x^2
  +13646*x^2*z
  +228*x^2*z^2
  +20087*x^2*y
  +676*x^2*y*z
  +505*x^2*y^2
  +35490*x^3
  +1880*x^3*z
  +16*x^3*z^2
  +2796*x^3*y
  +48*x^3*y*z
  +36*x^3*y^2
  +3588*x^4
  +96*x^4*z
  +144*x^4*y
  +144*x^5 := by positivity
 linarith only [he,hp]

theorem fourth_cp_positiveM97B (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H) :
 0 < steinCpM208 a m H := by
 have h := fourth_cp_shift_positiveM97B (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring

end
end MathGKM.Markov
