import MarkovTopSixthCertificateM97B
/-! Machine-authored 99a0f3b8. Wider domain; exact ring certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 24000000
set_option maxRecDepth 40000
theorem middle_wide_c_shiftM99A (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < sixthCM97B (x+7) (y+2) (9*(x+7)/4+(y+2)/2+8+z) := by
 have he : 2*sixthCM97B (x+7) (y+2) (9*(x+7)/4+(y+2)/2+8+z)=(((((324)*x+((432)*y+((288)*z+(16209))))*x+(((144)*y+((192)*z+(16404)))*y+(((64)*z+(10984))*z+(321873))))*x+(((3748)*y+((5008)*z+(231180)))*y+(((1680)*z+(155576))*z+(3170405))))*x+(((32236)*y+((43216)*z+(1433128)))*y+(((14608)*z+(970112))*z+(15485955))))*x+(((91584)*y+((123360)*z+(3297352)))*y+(((42080)*z+(2247520))*z+(30002098))) := by
   try dsimp only
   unfold sixthCM97B
   ring
 have hp : (0:ℝ)<(((((324)*x+((432)*y+((288)*z+(16209))))*x+(((144)*y+((192)*z+(16404)))*y+(((64)*z+(10984))*z+(321873))))*x+(((3748)*y+((5008)*z+(231180)))*y+(((1680)*z+(155576))*z+(3170405))))*x+(((32236)*y+((43216)*z+(1433128)))*y+(((14608)*z+(970112))*z+(15485955))))*x+(((91584)*y+((123360)*z+(3297352)))*y+(((42080)*z+(2247520))*z+(30002098))) := by positivity
 linarith only [he,hp]
attribute [local irreducible] sixthCM97B
theorem middle_wide_c_positiveM99A (a m H : ℝ)
 (ha : 7 ≤ a) (hm : 2 ≤ m) (hH : 9*a+2*m+32 ≤ 4*H) :
 0 < sixthCM97B a m H := by
 have h := middle_wide_c_shiftM99A (a-7) (m-2) (H-9*a/4-m/2-8)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
