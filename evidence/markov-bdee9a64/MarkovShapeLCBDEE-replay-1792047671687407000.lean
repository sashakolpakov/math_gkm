import MarkovShapeGap0BDEE
import MarkovShapeGap1BDEE
import MarkovShapeGap2BDEE
import MarkovShapeGap3BDEE
import MarkovShapeGap4BDEE
import MarkovShapeGap5BDEE
import MarkovShapeGap6BDEE
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
set_option linter.unusedVariables false
theorem thirdShape_shift_lcBDEE (t s u v : ℤ)
 (ht : 0 ≤ t) (hs : 0 ≤ s) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 thirdShapeBDEE (t+s+6) (u+v+2) (u+1) (t+4)*
 thirdShapeBDEE (t+s+6) (u+v+2) (u+1) (t+6) ≤ 
 (thirdShapeBDEE (t+s+6) (u+v+2) (u+1) (t+5))^2 := by
 rw [shape_expand_LBDEE,shape_expand_RBDEE,shape_expand_CBDEE]
 have h0 := shape_gap_0_nonnegBDEE t u v ht hu hv
 have h1 := shape_gap_1_nonnegBDEE t u v ht hu hv
 have h2 := shape_gap_2_nonnegBDEE t u v ht hu hv
 have h3 := shape_gap_3_nonnegBDEE t u v ht hu hv
 have h4 := shape_gap_4_nonnegBDEE t u v ht hu hv
 have h5 := shape_gap_5_nonnegBDEE t u v ht hu hv
 have h6 := shape_gap_6_nonnegBDEE t u v ht hu hv
 have he : ((shapeC0BDEE t u v)*s^0+(shapeC1BDEE t u v)*s^1+(shapeC2BDEE t u v)*s^2+(shapeC3BDEE t u v)*s^3)^2-((shapeL0BDEE t u v)*s^0+(shapeL1BDEE t u v)*s^1+(shapeL2BDEE t u v)*s^2+(shapeL3BDEE t u v)*s^3)*((shapeR0BDEE t u v)*s^0+(shapeR1BDEE t u v)*s^1+(shapeR2BDEE t u v)*s^2+(shapeR3BDEE t u v)*s^3)=(shapeGap0BDEE t u v)*s^0+(shapeGap1BDEE t u v)*s^1+(shapeGap2BDEE t u v)*s^2+(shapeGap3BDEE t u v)*s^3+(shapeGap4BDEE t u v)*s^4+(shapeGap5BDEE t u v)*s^5+(shapeGap6BDEE t u v)*s^6 := by
   unfold shapeGap0BDEE shapeGap1BDEE shapeGap2BDEE shapeGap3BDEE shapeGap4BDEE shapeGap5BDEE shapeGap6BDEE
   ring
 have hp : 0 ≤ (shapeGap0BDEE t u v)*s^0+(shapeGap1BDEE t u v)*s^1+(shapeGap2BDEE t u v)*s^2+(shapeGap3BDEE t u v)*s^3+(shapeGap4BDEE t u v)*s^4+(shapeGap5BDEE t u v)*s^5+(shapeGap6BDEE t u v)*s^6 := by positivity
 omega
theorem thirdShape_lcBDEE (n c r j : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c)
 (hj : 5 ≤ j) (hn : j+1 ≤ n) :
 thirdShapeBDEE n c r (j-1)*thirdShapeBDEE n c r (j+1) ≤ (thirdShapeBDEE n c r j)^2 := by
 have h := thirdShape_shift_lcBDEE (j-5) (n-j-1) (r-1) (c-r-1)
   (by omega) (by omega) (by omega) (by omega)
 have h0 : j-5+(n-j-1)+6=n := by ring
 have h1 : r-1+(c-r-1)+2=c := by ring
 have h2 : r-1+1=r := by ring
 have h3 : j-5+4=j-1 := by ring
 have h4 : j-5+5=j := by ring
 have h5 : j-5+6=j+1 := by ring
 simpa only [h0,h1,h2,h3,h4,h5] using h
#print axioms thirdShape_lcBDEE
end
end MathGKM.Markov
