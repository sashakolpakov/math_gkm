import MarkovTopSixthCertificateM97B
/-! Machine-authored 99a0f3b8. Wider domain; exact ring certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 24000000
set_option maxRecDepth 40000
theorem middle_wide_k_shiftM99A (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < (fun a m H => -sixthKM97B a m H) (x+7) (y+2) (9*(x+7)/4+(y+2)/2+8+z) := by
 have he : 1*(fun a m H => -sixthKM97B a m H) (x+7) (y+2) (9*(x+7)/4+(y+2)/2+8+z)=((((((2592)*x+((3456)*y+((2304)*z+(153648))))*x+(((1152)*y+((1536)*z+(163200)))*y+(((512)*z+(109184))*z+(3774450))))*x+(((40640)*y+((54272)*z+(3063336)))*y+(((18176)*z+(2057424))*z+(49181842))))*x+(((535240)*y+((716320)*z+(28572344)))*y+(((241184)*z+(19273520))*z+(358497610))))*x+(((3118136)*y+((4184864)*z+(132430288)))*y+(((1417632)*z+(89768448))*z+(1385977454))))*x+(((6777216)*y+((9128640)*z+(244004048)))*y+(((3113920)*z+(166316480))*z+(2220155252))) := by
   try dsimp only
   unfold sixthKM97B
   ring
 have hp : (0:ℝ)<((((((2592)*x+((3456)*y+((2304)*z+(153648))))*x+(((1152)*y+((1536)*z+(163200)))*y+(((512)*z+(109184))*z+(3774450))))*x+(((40640)*y+((54272)*z+(3063336)))*y+(((18176)*z+(2057424))*z+(49181842))))*x+(((535240)*y+((716320)*z+(28572344)))*y+(((241184)*z+(19273520))*z+(358497610))))*x+(((3118136)*y+((4184864)*z+(132430288)))*y+(((1417632)*z+(89768448))*z+(1385977454))))*x+(((6777216)*y+((9128640)*z+(244004048)))*y+(((3113920)*z+(166316480))*z+(2220155252))) := by positivity
 linarith only [he,hp]
attribute [local irreducible] sixthKM97B
theorem middle_wide_k_positiveM99A (a m H : ℝ)
 (ha : 7 ≤ a) (hm : 2 ≤ m) (hH : 9*a+2*m+32 ≤ 4*H) :
 0 < (fun a m H => -sixthKM97B a m H) a m H := by
 have h := middle_wide_k_shiftM99A (a-7) (m-2) (H-9*a/4-m/2-8)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
