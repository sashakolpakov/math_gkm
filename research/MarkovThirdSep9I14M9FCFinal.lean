import MarkovThirdSep9I14M9FCDefs
import MarkovThirdSep9I14M9FCE0
import MarkovThirdSep9I14M9FCE1
import MarkovThirdSep9I14M9FCE2
import MarkovThirdSep9I14M9FCG0
import MarkovThirdSep9I14M9FCG1
import MarkovThirdSep9I14M9FCG2
import MarkovThirdSep9I14M9FCG3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep9I14FinalM9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (9+2*y+3*x) (3+y+x) (0) (y) (0) (5+v+u) (16+2*v+3*u-1)*vEM115 (9+2*y+3*x) (3+y+x) (0) (y) (0) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (9+2*y+3*x) (3+y+x) (0) (y) (0) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (9+2*y+3*x) (3+y+x) (0) (y) (0) (5+v+u) (16+2*v+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) (16+2*v+3*u) (by omega) (by omega)]
 constructor
 · rw [sSep9I14e0M9FC,sSep9I14e2M9FC,sSep9I14e1M9FC]
   apply cubic_lcM03 _ _ (sSep9I14a00M9FC u v) (sSep9I14a01M9FC u v) (sSep9I14a02M9FC u v) (sSep9I14a03M9FC u v) (sSep9I14a10M9FC u v) (sSep9I14a11M9FC u v) (sSep9I14a12M9FC u v) (sSep9I14a20M9FC u v) (sSep9I14a21M9FC u v) (sSep9I14a30M9FC u v) (sSep9I14b00M9FC u v) (sSep9I14b01M9FC u v) (sSep9I14b02M9FC u v) (sSep9I14b03M9FC u v) (sSep9I14b10M9FC u v) (sSep9I14b11M9FC u v) (sSep9I14b12M9FC u v) (sSep9I14b20M9FC u v) (sSep9I14b21M9FC u v) (sSep9I14b30M9FC u v) (sSep9I14c00M9FC u v) (sSep9I14c01M9FC u v) (sSep9I14c02M9FC u v) (sSep9I14c03M9FC u v) (sSep9I14c10M9FC u v) (sSep9I14c11M9FC u v) (sSep9I14c12M9FC u v) (sSep9I14c20M9FC u v) (sSep9I14c21M9FC u v) (sSep9I14c30M9FC u v) hx hy
   · exact sSep9I14g00M9FC u v hu hv
   · exact sSep9I14g01M9FC u v hu hv
   · exact sSep9I14g02M9FC u v hu hv
   · exact sSep9I14g03M9FC u v hu hv
   · exact sSep9I14g04M9FC u v hu hv
   · exact sSep9I14g05M9FC u v hu hv
   · exact sSep9I14g06M9FC u v hu hv
   · exact sSep9I14g10M9FC u v hu hv
   · exact sSep9I14g11M9FC u v hu hv
   · exact sSep9I14g12M9FC u v hu hv
   · exact sSep9I14g13M9FC u v hu hv
   · exact sSep9I14g14M9FC u v hu hv
   · exact sSep9I14g15M9FC u v hu hv
   · exact sSep9I14g20M9FC u v hu hv
   · exact sSep9I14g21M9FC u v hu hv
   · exact sSep9I14g22M9FC u v hu hv
   · exact sSep9I14g23M9FC u v hu hv
   · exact sSep9I14g24M9FC u v hu hv
   · exact sSep9I14g30M9FC u v hu hv
   · exact sSep9I14g31M9FC u v hu hv
   · exact sSep9I14g32M9FC u v hu hv
   · exact sSep9I14g33M9FC u v hu hv
   · exact sSep9I14g40M9FC u v hu hv
   · exact sSep9I14g41M9FC u v hu hv
   · exact sSep9I14g42M9FC u v hu hv
   · exact sSep9I14g50M9FC u v hu hv
   · exact sSep9I14g51M9FC u v hu hv
   · exact sSep9I14g60M9FC u v hu hv
 · rw [sSep9I14e1M9FC]
   simp only [cubicM03,sSep9I14b00M9FC,sSep9I14b01M9FC,sSep9I14b02M9FC,sSep9I14b03M9FC,sSep9I14b10M9FC,sSep9I14b11M9FC,sSep9I14b12M9FC,sSep9I14b20M9FC,sSep9I14b21M9FC,sSep9I14b30M9FC]
   positivity
end
end MathGKM.Markov
