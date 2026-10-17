import MarkovTopSixthCertificateM97B
/-! Machine-authored 99a0f3b8. Wider domain; exact ring certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 24000000
set_option maxRecDepth 40000
theorem middle_first_k_shiftM99A (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < (fun a m H => -sixthKM97B a m H) (x+7) (y+2) (3*(x+7)+(y+2)/2+1+z) := by
 have he : 1*(fun a m H => -sixthKM97B a m H) (x+7) (y+2) (3*(x+7)+(y+2)/2+1+z)=((((((4608)*x+((4608)*y+((3072)*z+(240384))))*x+(((1152)*y+((1536)*z+(201216)))*y+(((512)*z+(134656))*z+(5215968))))*x+(((40640)*y+((54272)*z+(3505600)))*y+(((18176)*z+(2355584))*z+(60256464))))*x+(((535240)*y+((716320)*z+(30457432)))*y+(((241184)*z+(20555824))*z+(390864208))))*x+(((3118136)*y+((4184864)*z+(131953256)))*y+(((1417632)*z+(89477616))*z+(1349787488))))*x+(((6777216)*y+((9128640)*z+(228028928)))*y+(((3113920)*z+(155417760))*z+(1938637792))) := by
   try dsimp only
   unfold sixthKM97B
   ring
 have hp : (0:ℝ)<((((((4608)*x+((4608)*y+((3072)*z+(240384))))*x+(((1152)*y+((1536)*z+(201216)))*y+(((512)*z+(134656))*z+(5215968))))*x+(((40640)*y+((54272)*z+(3505600)))*y+(((18176)*z+(2355584))*z+(60256464))))*x+(((535240)*y+((716320)*z+(30457432)))*y+(((241184)*z+(20555824))*z+(390864208))))*x+(((3118136)*y+((4184864)*z+(131953256)))*y+(((1417632)*z+(89477616))*z+(1349787488))))*x+(((6777216)*y+((9128640)*z+(228028928)))*y+(((3113920)*z+(155417760))*z+(1938637792))) := by positivity
 linarith only [he,hp]
attribute [local irreducible] sixthKM97B
theorem middle_first_k_positiveM99A (a m H : ℝ)
 (ha : 7 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+2 ≤ 2*H) :
 0 < (fun a m H => -sixthKM97B a m H) a m H := by
 have h := middle_first_k_shiftM99A (a-7) (m-2) (H-3*a-m/2-1)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
