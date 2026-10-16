import MarkovThirdSep11I9M9FCDefs
import MarkovThirdSep11I9M9FCE0
import MarkovThirdSep11I9M9FCE1
import MarkovThirdSep11I9M9FCE2
import MarkovThirdSep11I9M9FCG0
import MarkovThirdSep11I9M9FCG1
import MarkovThirdSep11I9M9FCG2
import MarkovThirdSep11I9M9FCG3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep11I9FinalM9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u-1)*vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u+1) ≤ vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) (9+v+2*u) (by omega) (by omega)]
 constructor
 · rw [sSep11I9e0M9FC,sSep11I9e2M9FC,sSep11I9e1M9FC]
   apply cubic_lcM03 _ _ (sSep11I9a00M9FC u v) (sSep11I9a01M9FC u v) (sSep11I9a02M9FC u v) (sSep11I9a03M9FC u v) (sSep11I9a10M9FC u v) (sSep11I9a11M9FC u v) (sSep11I9a12M9FC u v) (sSep11I9a20M9FC u v) (sSep11I9a21M9FC u v) (sSep11I9a30M9FC u v) (sSep11I9b00M9FC u v) (sSep11I9b01M9FC u v) (sSep11I9b02M9FC u v) (sSep11I9b03M9FC u v) (sSep11I9b10M9FC u v) (sSep11I9b11M9FC u v) (sSep11I9b12M9FC u v) (sSep11I9b20M9FC u v) (sSep11I9b21M9FC u v) (sSep11I9b30M9FC u v) (sSep11I9c00M9FC u v) (sSep11I9c01M9FC u v) (sSep11I9c02M9FC u v) (sSep11I9c03M9FC u v) (sSep11I9c10M9FC u v) (sSep11I9c11M9FC u v) (sSep11I9c12M9FC u v) (sSep11I9c20M9FC u v) (sSep11I9c21M9FC u v) (sSep11I9c30M9FC u v) hx hy
   · exact sSep11I9g00M9FC u v hu hv
   · exact sSep11I9g01M9FC u v hu hv
   · exact sSep11I9g02M9FC u v hu hv
   · exact sSep11I9g03M9FC u v hu hv
   · exact sSep11I9g04M9FC u v hu hv
   · exact sSep11I9g05M9FC u v hu hv
   · exact sSep11I9g06M9FC u v hu hv
   · exact sSep11I9g10M9FC u v hu hv
   · exact sSep11I9g11M9FC u v hu hv
   · exact sSep11I9g12M9FC u v hu hv
   · exact sSep11I9g13M9FC u v hu hv
   · exact sSep11I9g14M9FC u v hu hv
   · exact sSep11I9g15M9FC u v hu hv
   · exact sSep11I9g20M9FC u v hu hv
   · exact sSep11I9g21M9FC u v hu hv
   · exact sSep11I9g22M9FC u v hu hv
   · exact sSep11I9g23M9FC u v hu hv
   · exact sSep11I9g24M9FC u v hu hv
   · exact sSep11I9g30M9FC u v hu hv
   · exact sSep11I9g31M9FC u v hu hv
   · exact sSep11I9g32M9FC u v hu hv
   · exact sSep11I9g33M9FC u v hu hv
   · exact sSep11I9g40M9FC u v hu hv
   · exact sSep11I9g41M9FC u v hu hv
   · exact sSep11I9g42M9FC u v hu hv
   · exact sSep11I9g50M9FC u v hu hv
   · exact sSep11I9g51M9FC u v hu hv
   · exact sSep11I9g60M9FC u v hu hv
 · rw [sSep11I9e1M9FC]
   simp only [cubicM03,sSep11I9b00M9FC,sSep11I9b01M9FC,sSep11I9b02M9FC,sSep11I9b03M9FC,sSep11I9b10M9FC,sSep11I9b11M9FC,sSep11I9b12M9FC,sSep11I9b20M9FC,sSep11I9b21M9FC,sSep11I9b30M9FC]
   positivity
end
end MathGKM.Markov
