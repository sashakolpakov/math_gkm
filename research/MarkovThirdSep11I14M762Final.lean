/- Machine-authored 762ebbae: inherited pending certificate, uniquely renamed. -/
import MarkovThirdSep11I14M762Defs
import MarkovThirdSep11I14M762E0
import MarkovThirdSep11I14M762E1
import MarkovThirdSep11I14M762E2
import MarkovThirdSep11I14M762G0
import MarkovThirdSep11I14M762G1
import MarkovThirdSep11I14M762G2
import MarkovThirdSep11I14M762G3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep11I14FinalM762 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u-1)*vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) (16+2*v+3*u) (by omega) (by omega)]
 constructor
 · rw [sSep11I14e0M762,sSep11I14e2M762,sSep11I14e1M762]
   apply cubic_lcM03 _ _ (sSep11I14a00M762 u v) (sSep11I14a01M762 u v) (sSep11I14a02M762 u v) (sSep11I14a03M762 u v) (sSep11I14a10M762 u v) (sSep11I14a11M762 u v) (sSep11I14a12M762 u v) (sSep11I14a20M762 u v) (sSep11I14a21M762 u v) (sSep11I14a30M762 u v) (sSep11I14b00M762 u v) (sSep11I14b01M762 u v) (sSep11I14b02M762 u v) (sSep11I14b03M762 u v) (sSep11I14b10M762 u v) (sSep11I14b11M762 u v) (sSep11I14b12M762 u v) (sSep11I14b20M762 u v) (sSep11I14b21M762 u v) (sSep11I14b30M762 u v) (sSep11I14c00M762 u v) (sSep11I14c01M762 u v) (sSep11I14c02M762 u v) (sSep11I14c03M762 u v) (sSep11I14c10M762 u v) (sSep11I14c11M762 u v) (sSep11I14c12M762 u v) (sSep11I14c20M762 u v) (sSep11I14c21M762 u v) (sSep11I14c30M762 u v) hx hy
   · exact sSep11I14g00M762 u v hu hv
   · exact sSep11I14g01M762 u v hu hv
   · exact sSep11I14g02M762 u v hu hv
   · exact sSep11I14g03M762 u v hu hv
   · exact sSep11I14g04M762 u v hu hv
   · exact sSep11I14g05M762 u v hu hv
   · exact sSep11I14g06M762 u v hu hv
   · exact sSep11I14g10M762 u v hu hv
   · exact sSep11I14g11M762 u v hu hv
   · exact sSep11I14g12M762 u v hu hv
   · exact sSep11I14g13M762 u v hu hv
   · exact sSep11I14g14M762 u v hu hv
   · exact sSep11I14g15M762 u v hu hv
   · exact sSep11I14g20M762 u v hu hv
   · exact sSep11I14g21M762 u v hu hv
   · exact sSep11I14g22M762 u v hu hv
   · exact sSep11I14g23M762 u v hu hv
   · exact sSep11I14g24M762 u v hu hv
   · exact sSep11I14g30M762 u v hu hv
   · exact sSep11I14g31M762 u v hu hv
   · exact sSep11I14g32M762 u v hu hv
   · exact sSep11I14g33M762 u v hu hv
   · exact sSep11I14g40M762 u v hu hv
   · exact sSep11I14g41M762 u v hu hv
   · exact sSep11I14g42M762 u v hu hv
   · exact sSep11I14g50M762 u v hu hv
   · exact sSep11I14g51M762 u v hu hv
   · exact sSep11I14g60M762 u v hu hv
 · rw [sSep11I14e1M762]
   simp only [cubicM03,sSep11I14b00M762,sSep11I14b01M762,sSep11I14b02M762,sSep11I14b03M762,sSep11I14b10M762,sSep11I14b11M762,sSep11I14b12M762,sSep11I14b20M762,sSep11I14b21M762,sSep11I14b30M762]
   positivity
end
end MathGKM.Markov
