import MarkovTopSixthCertificateM97B
/-! Machine-authored 99a0f3b8. Wider domain; exact ring certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 24000000
set_option maxRecDepth 40000
theorem middle_first_c_shiftM99A (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < sixthCM97B (x+7) (y+2) (3*(x+7)+(y+2)/2+1+z) := by
 have he : 1*sixthCM97B (x+7) (y+2) (3*(x+7)+(y+2)/2+1+z)=(((((288)*x+((288)*y+((192)*z+(12360))))*x+(((72)*y+((96)*z+(9912)))*y+(((32)*z+(6640))*z+(211668))))*x+(((1874)*y+((2504)*z+(127414)))*y+(((840)*z+(85804))*z+(1808100))))*x+(((16118)*y+((21608)*z+(725010)))*y+(((7304)*z+(491052))*z+(7704088))))*x+(((45792)*y+((61680)*z+(1540736)))*y+(((21040)*z+(1050120))*z+(13098904))) := by
   try dsimp only
   unfold sixthCM97B
   ring
 have hp : (0:ℝ)<(((((288)*x+((288)*y+((192)*z+(12360))))*x+(((72)*y+((96)*z+(9912)))*y+(((32)*z+(6640))*z+(211668))))*x+(((1874)*y+((2504)*z+(127414)))*y+(((840)*z+(85804))*z+(1808100))))*x+(((16118)*y+((21608)*z+(725010)))*y+(((7304)*z+(491052))*z+(7704088))))*x+(((45792)*y+((61680)*z+(1540736)))*y+(((21040)*z+(1050120))*z+(13098904))) := by positivity
 linarith only [he,hp]
attribute [local irreducible] sixthCM97B
theorem middle_first_c_positiveM99A (a m H : ℝ)
 (ha : 7 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+2 ≤ 2*H) :
 0 < sixthCM97B a m H := by
 have h := middle_first_c_shiftM99A (a-7) (m-2) (H-3*a-m/2-1)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
