import MarkovThirdSep0I14M03Defs
import MarkovThirdSep0I14M03E0
import MarkovThirdSep0I14M03E1
import MarkovThirdSep0I14M03E2
import MarkovThirdSep0I14M03G0
import MarkovThirdSep0I14M03G1
import MarkovThirdSep0I14M03G2
import MarkovThirdSep0I14M03G3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep0I14FinalM03 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u-1)*vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) (16+2*v+3*u) (by omega) (by omega)]
 constructor
 · rw [sSep0I14e0M03,sSep0I14e2M03,sSep0I14e1M03]
   apply cubic_lcM03 _ _ (sSep0I14a00M03 u v) (sSep0I14a01M03 u v) (sSep0I14a02M03 u v) (sSep0I14a03M03 u v) (sSep0I14a10M03 u v) (sSep0I14a11M03 u v) (sSep0I14a12M03 u v) (sSep0I14a20M03 u v) (sSep0I14a21M03 u v) (sSep0I14a30M03 u v) (sSep0I14b00M03 u v) (sSep0I14b01M03 u v) (sSep0I14b02M03 u v) (sSep0I14b03M03 u v) (sSep0I14b10M03 u v) (sSep0I14b11M03 u v) (sSep0I14b12M03 u v) (sSep0I14b20M03 u v) (sSep0I14b21M03 u v) (sSep0I14b30M03 u v) (sSep0I14c00M03 u v) (sSep0I14c01M03 u v) (sSep0I14c02M03 u v) (sSep0I14c03M03 u v) (sSep0I14c10M03 u v) (sSep0I14c11M03 u v) (sSep0I14c12M03 u v) (sSep0I14c20M03 u v) (sSep0I14c21M03 u v) (sSep0I14c30M03 u v) hx hy
   · exact sSep0I14g00M03 u v hu hv
   · exact sSep0I14g01M03 u v hu hv
   · exact sSep0I14g02M03 u v hu hv
   · exact sSep0I14g03M03 u v hu hv
   · exact sSep0I14g04M03 u v hu hv
   · exact sSep0I14g05M03 u v hu hv
   · exact sSep0I14g06M03 u v hu hv
   · exact sSep0I14g10M03 u v hu hv
   · exact sSep0I14g11M03 u v hu hv
   · exact sSep0I14g12M03 u v hu hv
   · exact sSep0I14g13M03 u v hu hv
   · exact sSep0I14g14M03 u v hu hv
   · exact sSep0I14g15M03 u v hu hv
   · exact sSep0I14g20M03 u v hu hv
   · exact sSep0I14g21M03 u v hu hv
   · exact sSep0I14g22M03 u v hu hv
   · exact sSep0I14g23M03 u v hu hv
   · exact sSep0I14g24M03 u v hu hv
   · exact sSep0I14g30M03 u v hu hv
   · exact sSep0I14g31M03 u v hu hv
   · exact sSep0I14g32M03 u v hu hv
   · exact sSep0I14g33M03 u v hu hv
   · exact sSep0I14g40M03 u v hu hv
   · exact sSep0I14g41M03 u v hu hv
   · exact sSep0I14g42M03 u v hu hv
   · exact sSep0I14g50M03 u v hu hv
   · exact sSep0I14g51M03 u v hu hv
   · exact sSep0I14g60M03 u v hu hv
 · rw [sSep0I14e1M03]
   simp only [cubicM03,sSep0I14b00M03,sSep0I14b01M03,sSep0I14b02M03,sSep0I14b03M03,sSep0I14b10M03,sSep0I14b11M03,sSep0I14b12M03,sSep0I14b20M03,sSep0I14b21M03,sSep0I14b30M03]
   positivity
end
end MathGKM.Markov
