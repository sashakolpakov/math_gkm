import MarkovThirdSep4I14MAE2Defs
import MarkovThirdSep4I14M9FCE0
import MarkovThirdSep4I14M9FCE1
import MarkovThirdSep4I14M9FCE2
import MarkovThirdSep4I14M9FCG0
import MarkovThirdSep4I14M9FCG1
import MarkovThirdSep4I14M9FCG2
import MarkovThirdSep4I14M9FCG3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep4I14FinalM9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (5+v+u) (16+2*v+3*u-1)*vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+2*x) (x) (4+y+x) (0) (5+v+u) (16+2*v+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) (16+2*v+3*u) (by omega) (by omega)]
 constructor
 · rw [sSep4I14e0M9FC,sSep4I14e2M9FC,sSep4I14e1M9FC]
   apply cubic_lcM03 _ _ (sSep4I14a00MAE2 u v) (sSep4I14a01MAE2 u v) (sSep4I14a02MAE2 u v) (sSep4I14a03MAE2 u v) (sSep4I14a10MAE2 u v) (sSep4I14a11MAE2 u v) (sSep4I14a12MAE2 u v) (sSep4I14a20MAE2 u v) (sSep4I14a21MAE2 u v) (sSep4I14a30MAE2 u v) (sSep4I14b00MAE2 u v) (sSep4I14b01MAE2 u v) (sSep4I14b02MAE2 u v) (sSep4I14b03MAE2 u v) (sSep4I14b10MAE2 u v) (sSep4I14b11MAE2 u v) (sSep4I14b12MAE2 u v) (sSep4I14b20MAE2 u v) (sSep4I14b21MAE2 u v) (sSep4I14b30MAE2 u v) (sSep4I14c00MAE2 u v) (sSep4I14c01MAE2 u v) (sSep4I14c02MAE2 u v) (sSep4I14c03MAE2 u v) (sSep4I14c10MAE2 u v) (sSep4I14c11MAE2 u v) (sSep4I14c12MAE2 u v) (sSep4I14c20MAE2 u v) (sSep4I14c21MAE2 u v) (sSep4I14c30MAE2 u v) hx hy
   · exact sSep4I14g00M9FC u v hu hv
   · exact sSep4I14g01M9FC u v hu hv
   · exact sSep4I14g02M9FC u v hu hv
   · exact sSep4I14g03M9FC u v hu hv
   · exact sSep4I14g04M9FC u v hu hv
   · exact sSep4I14g05M9FC u v hu hv
   · exact sSep4I14g06M9FC u v hu hv
   · exact sSep4I14g10M9FC u v hu hv
   · exact sSep4I14g11M9FC u v hu hv
   · exact sSep4I14g12M9FC u v hu hv
   · exact sSep4I14g13M9FC u v hu hv
   · exact sSep4I14g14M9FC u v hu hv
   · exact sSep4I14g15M9FC u v hu hv
   · exact sSep4I14g20M9FC u v hu hv
   · exact sSep4I14g21M9FC u v hu hv
   · exact sSep4I14g22M9FC u v hu hv
   · exact sSep4I14g23M9FC u v hu hv
   · exact sSep4I14g24M9FC u v hu hv
   · exact sSep4I14g30M9FC u v hu hv
   · exact sSep4I14g31M9FC u v hu hv
   · exact sSep4I14g32M9FC u v hu hv
   · exact sSep4I14g33M9FC u v hu hv
   · exact sSep4I14g40M9FC u v hu hv
   · exact sSep4I14g41M9FC u v hu hv
   · exact sSep4I14g42M9FC u v hu hv
   · exact sSep4I14g50M9FC u v hu hv
   · exact sSep4I14g51M9FC u v hu hv
   · exact sSep4I14g60M9FC u v hu hv
 · rw [sSep4I14e1M9FC]
   simp only [cubicM03,sSep4I14b00MAE2,sSep4I14b01MAE2,sSep4I14b02MAE2,sSep4I14b03MAE2,sSep4I14b10MAE2,sSep4I14b11MAE2,sSep4I14b12MAE2,sSep4I14b20MAE2,sSep4I14b21MAE2,sSep4I14b30MAE2]
   positivity
end
end MathGKM.Markov
