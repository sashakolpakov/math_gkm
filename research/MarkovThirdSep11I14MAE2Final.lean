import MarkovThirdSep11I14MAE2Defs
import MarkovThirdSep11I14MAE2E0
import MarkovThirdSep11I14MAE2E1
import MarkovThirdSep11I14MAE2E2
import MarkovThirdSep11I14MAE2G0
import MarkovThirdSep11I14MAE2G1
import MarkovThirdSep11I14MAE2G2
import MarkovThirdSep11I14MAE2G3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep11I14FinalMAE2 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u-1)*vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (5+v+u) (16+2*v+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) (16+2*v+3*u) (by omega) (by omega)]
 constructor
 · rw [sSep11I14e0MAE2,sSep11I14e2MAE2,sSep11I14e1MAE2]
   apply cubic_lcM03 _ _ (sSep11I14a00MAE2 u v) (sSep11I14a01MAE2 u v) (sSep11I14a02MAE2 u v) (sSep11I14a03MAE2 u v) (sSep11I14a10MAE2 u v) (sSep11I14a11MAE2 u v) (sSep11I14a12MAE2 u v) (sSep11I14a20MAE2 u v) (sSep11I14a21MAE2 u v) (sSep11I14a30MAE2 u v) (sSep11I14b00MAE2 u v) (sSep11I14b01MAE2 u v) (sSep11I14b02MAE2 u v) (sSep11I14b03MAE2 u v) (sSep11I14b10MAE2 u v) (sSep11I14b11MAE2 u v) (sSep11I14b12MAE2 u v) (sSep11I14b20MAE2 u v) (sSep11I14b21MAE2 u v) (sSep11I14b30MAE2 u v) (sSep11I14c00MAE2 u v) (sSep11I14c01MAE2 u v) (sSep11I14c02MAE2 u v) (sSep11I14c03MAE2 u v) (sSep11I14c10MAE2 u v) (sSep11I14c11MAE2 u v) (sSep11I14c12MAE2 u v) (sSep11I14c20MAE2 u v) (sSep11I14c21MAE2 u v) (sSep11I14c30MAE2 u v) hx hy
   · exact sSep11I14g00MAE2 u v hu hv
   · exact sSep11I14g01MAE2 u v hu hv
   · exact sSep11I14g02MAE2 u v hu hv
   · exact sSep11I14g03MAE2 u v hu hv
   · exact sSep11I14g04MAE2 u v hu hv
   · exact sSep11I14g05MAE2 u v hu hv
   · exact sSep11I14g06MAE2 u v hu hv
   · exact sSep11I14g10MAE2 u v hu hv
   · exact sSep11I14g11MAE2 u v hu hv
   · exact sSep11I14g12MAE2 u v hu hv
   · exact sSep11I14g13MAE2 u v hu hv
   · exact sSep11I14g14MAE2 u v hu hv
   · exact sSep11I14g15MAE2 u v hu hv
   · exact sSep11I14g20MAE2 u v hu hv
   · exact sSep11I14g21MAE2 u v hu hv
   · exact sSep11I14g22MAE2 u v hu hv
   · exact sSep11I14g23MAE2 u v hu hv
   · exact sSep11I14g24MAE2 u v hu hv
   · exact sSep11I14g30MAE2 u v hu hv
   · exact sSep11I14g31MAE2 u v hu hv
   · exact sSep11I14g32MAE2 u v hu hv
   · exact sSep11I14g33MAE2 u v hu hv
   · exact sSep11I14g40MAE2 u v hu hv
   · exact sSep11I14g41MAE2 u v hu hv
   · exact sSep11I14g42MAE2 u v hu hv
   · exact sSep11I14g50MAE2 u v hu hv
   · exact sSep11I14g51MAE2 u v hu hv
   · exact sSep11I14g60MAE2 u v hu hv
 · rw [sSep11I14e1MAE2]
   simp only [cubicM03,sSep11I14b00MAE2,sSep11I14b01MAE2,sSep11I14b02MAE2,sSep11I14b03MAE2,sSep11I14b10MAE2,sSep11I14b11MAE2,sSep11I14b12MAE2,sSep11I14b20MAE2,sSep11I14b21MAE2,sSep11I14b30MAE2]
   positivity
end
end MathGKM.Markov
