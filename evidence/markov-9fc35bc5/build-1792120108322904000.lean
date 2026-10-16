import MarkovThirdSep4I9MAE2Defs
import MarkovThirdSep4I9M9FCE0
import MarkovThirdSep4I9M9FCE1
import MarkovThirdSep4I9M9FCE2
import MarkovThirdSep4I9M9FCG0
import MarkovThirdSep4I9M9FCG1
import MarkovThirdSep4I9M9FCG2
import MarkovThirdSep4I9M9FCG3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep4I9FinalM9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u-1)*vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (4+v+u) (9+v+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) (9+v+2*u) (by omega) (by omega)]
 constructor
 · rw [sSep4I9e0M9FC,sSep4I9e2M9FC,sSep4I9e1M9FC]
   apply cubic_lcM03 _ _ (sSep4I9a00MAE2 u v) (sSep4I9a01MAE2 u v) (sSep4I9a02MAE2 u v) (sSep4I9a03MAE2 u v) (sSep4I9a10MAE2 u v) (sSep4I9a11MAE2 u v) (sSep4I9a12MAE2 u v) (sSep4I9a20MAE2 u v) (sSep4I9a21MAE2 u v) (sSep4I9a30MAE2 u v) (sSep4I9b00MAE2 u v) (sSep4I9b01MAE2 u v) (sSep4I9b02MAE2 u v) (sSep4I9b03MAE2 u v) (sSep4I9b10MAE2 u v) (sSep4I9b11MAE2 u v) (sSep4I9b12MAE2 u v) (sSep4I9b20MAE2 u v) (sSep4I9b21MAE2 u v) (sSep4I9b30MAE2 u v) (sSep4I9c00MAE2 u v) (sSep4I9c01MAE2 u v) (sSep4I9c02MAE2 u v) (sSep4I9c03MAE2 u v) (sSep4I9c10MAE2 u v) (sSep4I9c11MAE2 u v) (sSep4I9c12MAE2 u v) (sSep4I9c20MAE2 u v) (sSep4I9c21MAE2 u v) (sSep4I9c30MAE2 u v) hx hy
   · exact sSep4I9g00M9FC u v hu hv
   · exact sSep4I9g01M9FC u v hu hv
   · exact sSep4I9g02M9FC u v hu hv
   · exact sSep4I9g03M9FC u v hu hv
   · exact sSep4I9g04M9FC u v hu hv
   · exact sSep4I9g05M9FC u v hu hv
   · exact sSep4I9g06M9FC u v hu hv
   · exact sSep4I9g10M9FC u v hu hv
   · exact sSep4I9g11M9FC u v hu hv
   · exact sSep4I9g12M9FC u v hu hv
   · exact sSep4I9g13M9FC u v hu hv
   · exact sSep4I9g14M9FC u v hu hv
   · exact sSep4I9g15M9FC u v hu hv
   · exact sSep4I9g20M9FC u v hu hv
   · exact sSep4I9g21M9FC u v hu hv
   · exact sSep4I9g22M9FC u v hu hv
   · exact sSep4I9g23M9FC u v hu hv
   · exact sSep4I9g24M9FC u v hu hv
   · exact sSep4I9g30M9FC u v hu hv
   · exact sSep4I9g31M9FC u v hu hv
   · exact sSep4I9g32M9FC u v hu hv
   · exact sSep4I9g33M9FC u v hu hv
   · exact sSep4I9g40M9FC u v hu hv
   · exact sSep4I9g41M9FC u v hu hv
   · exact sSep4I9g42M9FC u v hu hv
   · exact sSep4I9g50M9FC u v hu hv
   · exact sSep4I9g51M9FC u v hu hv
   · exact sSep4I9g60M9FC u v hu hv
 · rw [sSep4I9e1M9FC]
   simp only [cubicM03,sSep4I9b00MAE2,sSep4I9b01MAE2,sSep4I9b02MAE2,sSep4I9b03MAE2,sSep4I9b10MAE2,sSep4I9b11MAE2,sSep4I9b12MAE2,sSep4I9b20MAE2,sSep4I9b21MAE2,sSep4I9b30MAE2]
   positivity
end
end MathGKM.Markov
