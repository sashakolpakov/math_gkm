import MarkovThirdSep11I9MAE2Defs
import MarkovThirdSep11I9MAE2E0
import MarkovThirdSep11I9MAE2E1
import MarkovThirdSep11I9MAE2E2
import MarkovThirdSep11I9MAE2G0
import MarkovThirdSep11I9MAE2G1
import MarkovThirdSep11I9MAE2G2
import MarkovThirdSep11I9MAE2G3
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem sSep11I9FinalMAE2 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u-1)*vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u+1) ≤ vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) (4+v+u) (9+v+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) (9+v+2*u) (by omega) (by omega)]
 constructor
 · rw [sSep11I9e0MAE2,sSep11I9e2MAE2,sSep11I9e1MAE2]
   apply cubic_lcM03 _ _ (sSep11I9a00MAE2 u v) (sSep11I9a01MAE2 u v) (sSep11I9a02MAE2 u v) (sSep11I9a03MAE2 u v) (sSep11I9a10MAE2 u v) (sSep11I9a11MAE2 u v) (sSep11I9a12MAE2 u v) (sSep11I9a20MAE2 u v) (sSep11I9a21MAE2 u v) (sSep11I9a30MAE2 u v) (sSep11I9b00MAE2 u v) (sSep11I9b01MAE2 u v) (sSep11I9b02MAE2 u v) (sSep11I9b03MAE2 u v) (sSep11I9b10MAE2 u v) (sSep11I9b11MAE2 u v) (sSep11I9b12MAE2 u v) (sSep11I9b20MAE2 u v) (sSep11I9b21MAE2 u v) (sSep11I9b30MAE2 u v) (sSep11I9c00MAE2 u v) (sSep11I9c01MAE2 u v) (sSep11I9c02MAE2 u v) (sSep11I9c03MAE2 u v) (sSep11I9c10MAE2 u v) (sSep11I9c11MAE2 u v) (sSep11I9c12MAE2 u v) (sSep11I9c20MAE2 u v) (sSep11I9c21MAE2 u v) (sSep11I9c30MAE2 u v) hx hy
   · exact sSep11I9g00MAE2 u v hu hv
   · exact sSep11I9g01MAE2 u v hu hv
   · exact sSep11I9g02MAE2 u v hu hv
   · exact sSep11I9g03MAE2 u v hu hv
   · exact sSep11I9g04MAE2 u v hu hv
   · exact sSep11I9g05MAE2 u v hu hv
   · exact sSep11I9g06MAE2 u v hu hv
   · exact sSep11I9g10MAE2 u v hu hv
   · exact sSep11I9g11MAE2 u v hu hv
   · exact sSep11I9g12MAE2 u v hu hv
   · exact sSep11I9g13MAE2 u v hu hv
   · exact sSep11I9g14MAE2 u v hu hv
   · exact sSep11I9g15MAE2 u v hu hv
   · exact sSep11I9g20MAE2 u v hu hv
   · exact sSep11I9g21MAE2 u v hu hv
   · exact sSep11I9g22MAE2 u v hu hv
   · exact sSep11I9g23MAE2 u v hu hv
   · exact sSep11I9g24MAE2 u v hu hv
   · exact sSep11I9g30MAE2 u v hu hv
   · exact sSep11I9g31MAE2 u v hu hv
   · exact sSep11I9g32MAE2 u v hu hv
   · exact sSep11I9g33MAE2 u v hu hv
   · exact sSep11I9g40MAE2 u v hu hv
   · exact sSep11I9g41MAE2 u v hu hv
   · exact sSep11I9g42MAE2 u v hu hv
   · exact sSep11I9g50MAE2 u v hu hv
   · exact sSep11I9g51MAE2 u v hu hv
   · exact sSep11I9g60MAE2 u v hu hv
 · rw [sSep11I9e1MAE2]
   simp only [cubicM03,sSep11I9b00MAE2,sSep11I9b01MAE2,sSep11I9b02MAE2,sSep11I9b03MAE2,sSep11I9b10MAE2,sSep11I9b11MAE2,sSep11I9b12MAE2,sSep11I9b20MAE2,sSep11I9b21MAE2,sSep11I9b30MAE2]
   positivity
end
end MathGKM.Markov
