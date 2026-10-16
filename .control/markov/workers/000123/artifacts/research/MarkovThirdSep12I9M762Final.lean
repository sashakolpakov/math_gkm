/- Machine-authored 762ebbae: inherited pending certificate, uniquely renamed. -/
import MarkovThirdSep12I9M762Defs
import MarkovThirdSep12I9M762E0
import MarkovThirdSep12I9M762E1
import MarkovThirdSep12I9M762E2
import MarkovThirdSep12I9M762G0
import MarkovThirdSep12I9M762G1
import MarkovThirdSep12I9M762G2
import MarkovThirdSep12I9M762G3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep12I9FinalM762 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (4+v+u) (9+v+2*u-1)*vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (4+v+u) (9+v+2*u+1) ≤ vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (7+y+3*x) (5+y+2*x) (3+y+x) (2+x) (1+y) (4+v+u) (9+v+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) (9+v+2*u) (by omega) (by omega)]
 constructor
 · rw [sSep12I9e0M762,sSep12I9e2M762,sSep12I9e1M762]
   apply cubic_lcM03 _ _ (sSep12I9a00M762 u v) (sSep12I9a01M762 u v) (sSep12I9a02M762 u v) (sSep12I9a03M762 u v) (sSep12I9a10M762 u v) (sSep12I9a11M762 u v) (sSep12I9a12M762 u v) (sSep12I9a20M762 u v) (sSep12I9a21M762 u v) (sSep12I9a30M762 u v) (sSep12I9b00M762 u v) (sSep12I9b01M762 u v) (sSep12I9b02M762 u v) (sSep12I9b03M762 u v) (sSep12I9b10M762 u v) (sSep12I9b11M762 u v) (sSep12I9b12M762 u v) (sSep12I9b20M762 u v) (sSep12I9b21M762 u v) (sSep12I9b30M762 u v) (sSep12I9c00M762 u v) (sSep12I9c01M762 u v) (sSep12I9c02M762 u v) (sSep12I9c03M762 u v) (sSep12I9c10M762 u v) (sSep12I9c11M762 u v) (sSep12I9c12M762 u v) (sSep12I9c20M762 u v) (sSep12I9c21M762 u v) (sSep12I9c30M762 u v) hx hy
   · exact sSep12I9g00M762 u v hu hv
   · exact sSep12I9g01M762 u v hu hv
   · exact sSep12I9g02M762 u v hu hv
   · exact sSep12I9g03M762 u v hu hv
   · exact sSep12I9g04M762 u v hu hv
   · exact sSep12I9g05M762 u v hu hv
   · exact sSep12I9g06M762 u v hu hv
   · exact sSep12I9g10M762 u v hu hv
   · exact sSep12I9g11M762 u v hu hv
   · exact sSep12I9g12M762 u v hu hv
   · exact sSep12I9g13M762 u v hu hv
   · exact sSep12I9g14M762 u v hu hv
   · exact sSep12I9g15M762 u v hu hv
   · exact sSep12I9g20M762 u v hu hv
   · exact sSep12I9g21M762 u v hu hv
   · exact sSep12I9g22M762 u v hu hv
   · exact sSep12I9g23M762 u v hu hv
   · exact sSep12I9g24M762 u v hu hv
   · exact sSep12I9g30M762 u v hu hv
   · exact sSep12I9g31M762 u v hu hv
   · exact sSep12I9g32M762 u v hu hv
   · exact sSep12I9g33M762 u v hu hv
   · exact sSep12I9g40M762 u v hu hv
   · exact sSep12I9g41M762 u v hu hv
   · exact sSep12I9g42M762 u v hu hv
   · exact sSep12I9g50M762 u v hu hv
   · exact sSep12I9g51M762 u v hu hv
   · exact sSep12I9g60M762 u v hu hv
 · rw [sSep12I9e1M762]
   simp only [cubicM03,sSep12I9b00M762,sSep12I9b01M762,sSep12I9b02M762,sSep12I9b03M762,sSep12I9b10M762,sSep12I9b11M762,sSep12I9b12M762,sSep12I9b20M762,sSep12I9b21M762,sSep12I9b30M762]
   positivity
end
end MathGKM.Markov
