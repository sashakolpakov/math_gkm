import MarkovThirdSep0I9M03Defs
import MarkovThirdSep0I9M03E0
import MarkovThirdSep0I9M03E1
import MarkovThirdSep0I9M03E2
import MarkovThirdSep0I9M03G0
import MarkovThirdSep0I9M03G1
import MarkovThirdSep0I9M03G2
import MarkovThirdSep0I9M03G3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep0I9FinalM03 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (1+x) (0) (0) (0) (4+v+u) (9+v+2*u-1)*vEM115 (7+y+3*x) (1+x) (0) (0) (0) (4+v+u) (9+v+2*u+1) ≤ vEM115 (7+y+3*x) (1+x) (0) (0) (0) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (7+y+3*x) (1+x) (0) (0) (0) (4+v+u) (9+v+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) (9+v+2*u) (by omega) (by omega)]
 constructor
 · rw [sSep0I9e0M03,sSep0I9e2M03,sSep0I9e1M03]
   apply cubic_lcM03 _ _ (sSep0I9a00M03 u v) (sSep0I9a01M03 u v) (sSep0I9a02M03 u v) (sSep0I9a03M03 u v) (sSep0I9a10M03 u v) (sSep0I9a11M03 u v) (sSep0I9a12M03 u v) (sSep0I9a20M03 u v) (sSep0I9a21M03 u v) (sSep0I9a30M03 u v) (sSep0I9b00M03 u v) (sSep0I9b01M03 u v) (sSep0I9b02M03 u v) (sSep0I9b03M03 u v) (sSep0I9b10M03 u v) (sSep0I9b11M03 u v) (sSep0I9b12M03 u v) (sSep0I9b20M03 u v) (sSep0I9b21M03 u v) (sSep0I9b30M03 u v) (sSep0I9c00M03 u v) (sSep0I9c01M03 u v) (sSep0I9c02M03 u v) (sSep0I9c03M03 u v) (sSep0I9c10M03 u v) (sSep0I9c11M03 u v) (sSep0I9c12M03 u v) (sSep0I9c20M03 u v) (sSep0I9c21M03 u v) (sSep0I9c30M03 u v) hx hy
   · exact sSep0I9g00M03 u v hu hv
   · exact sSep0I9g01M03 u v hu hv
   · exact sSep0I9g02M03 u v hu hv
   · exact sSep0I9g03M03 u v hu hv
   · exact sSep0I9g04M03 u v hu hv
   · exact sSep0I9g05M03 u v hu hv
   · exact sSep0I9g06M03 u v hu hv
   · exact sSep0I9g10M03 u v hu hv
   · exact sSep0I9g11M03 u v hu hv
   · exact sSep0I9g12M03 u v hu hv
   · exact sSep0I9g13M03 u v hu hv
   · exact sSep0I9g14M03 u v hu hv
   · exact sSep0I9g15M03 u v hu hv
   · exact sSep0I9g20M03 u v hu hv
   · exact sSep0I9g21M03 u v hu hv
   · exact sSep0I9g22M03 u v hu hv
   · exact sSep0I9g23M03 u v hu hv
   · exact sSep0I9g24M03 u v hu hv
   · exact sSep0I9g30M03 u v hu hv
   · exact sSep0I9g31M03 u v hu hv
   · exact sSep0I9g32M03 u v hu hv
   · exact sSep0I9g33M03 u v hu hv
   · exact sSep0I9g40M03 u v hu hv
   · exact sSep0I9g41M03 u v hu hv
   · exact sSep0I9g42M03 u v hu hv
   · exact sSep0I9g50M03 u v hu hv
   · exact sSep0I9g51M03 u v hu hv
   · exact sSep0I9g60M03 u v hu hv
 · rw [sSep0I9e1M03]
   simp only [cubicM03,sSep0I9b00M03,sSep0I9b01M03,sSep0I9b02M03,sSep0I9b03M03,sSep0I9b10M03,sSep0I9b11M03,sSep0I9b12M03,sSep0I9b20M03,sSep0I9b21M03,sSep0I9b30M03]
   positivity
end
end MathGKM.Markov
