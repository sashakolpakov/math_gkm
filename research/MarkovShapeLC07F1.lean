import MarkovShapeGap007F1
import MarkovShapeGap107F1
import MarkovShapeGap207F1
import MarkovShapeGap307F1
import MarkovShapeGap407F1
import MarkovShapeGap507F1
import MarkovShapeGap607F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
set_option linter.unusedVariables false
theorem thirdShape_shift_lc07F1 (t s u v : ℤ)
 (ht : 0 ≤ t) (hs : 0 ≤ s) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 thirdShapeBDEE (t+s+5) (u+v+2) (u+1) (t+4)*
 thirdShapeBDEE (t+s+5) (u+v+2) (u+1) (t+6) ≤ 
 (thirdShapeBDEE (t+s+5) (u+v+2) (u+1) (t+5))^2 := by
 rw [shape_expand_L07F1,shape_expand_R07F1,shape_expand_C07F1]
 have h0 := shape_gap_0_nonneg07F1 t u v ht hu hv
 have h1 := shape_gap_1_nonneg07F1 t u v ht hu hv
 have h2 := shape_gap_2_nonneg07F1 t u v ht hu hv
 have h3 := shape_gap_3_nonneg07F1 t u v ht hu hv
 have h4 := shape_gap_4_nonneg07F1 t u v ht hu hv
 have h5 := shape_gap_5_nonneg07F1 t u v ht hu hv
 have h6 := shape_gap_6_nonneg07F1 t u v ht hu hv
 have he : ((shapeC007F1 t u v)*s^0+(shapeC107F1 t u v)*s^1+(shapeC207F1 t u v)*s^2+(shapeC307F1 t u v)*s^3)^2-((shapeL007F1 t u v)*s^0+(shapeL107F1 t u v)*s^1+(shapeL207F1 t u v)*s^2+(shapeL307F1 t u v)*s^3)*((shapeR007F1 t u v)*s^0+(shapeR107F1 t u v)*s^1+(shapeR207F1 t u v)*s^2+(shapeR307F1 t u v)*s^3)=(shapeGap007F1 t u v)*s^0+(shapeGap107F1 t u v)*s^1+(shapeGap207F1 t u v)*s^2+(shapeGap307F1 t u v)*s^3+(shapeGap407F1 t u v)*s^4+(shapeGap507F1 t u v)*s^5+(shapeGap607F1 t u v)*s^6 := by
   unfold shapeGap007F1 shapeGap107F1 shapeGap207F1 shapeGap307F1 shapeGap407F1 shapeGap507F1 shapeGap607F1
   ring
 have hp : 0 ≤ (shapeGap007F1 t u v)*s^0+(shapeGap107F1 t u v)*s^1+(shapeGap207F1 t u v)*s^2+(shapeGap307F1 t u v)*s^3+(shapeGap407F1 t u v)*s^4+(shapeGap507F1 t u v)*s^5+(shapeGap607F1 t u v)*s^6 := by positivity
 omega
theorem thirdShape_lc07F1 (n c r j : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c)
 (hj : 5 ≤ j) (hn : j ≤ n) :
 thirdShapeBDEE n c r (j-1)*thirdShapeBDEE n c r (j+1) ≤ (thirdShapeBDEE n c r j)^2 := by
 have h := thirdShape_shift_lc07F1 (j-5) (n-j) (r-1) (c-r-1)
   (by omega) (by omega) (by omega) (by omega)
 have h0 : j-5+(n-j)+5=n := by ring
 have h1 : r-1+(c-r-1)+2=c := by ring
 have h2 : r-1+1=r := by ring
 have h3 : j-5+4=j-1 := by ring
 have h4 : j-5+5=j := by ring
 have h5 : j-5+6=j+1 := by ring
 simpa only [h0,h1,h2,h3,h4,h5] using h
#print axioms thirdShape_lc07F1
end
end MathGKM.Markov
