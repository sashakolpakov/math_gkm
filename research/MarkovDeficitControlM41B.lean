import MarkovDeficitScalarM41B
/-! Machine-authored 41b38611. A scalar implication with explicit moment
hypotheses. This module does not postulate the actual-weight attachment. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem deficit_control_algebraM41B (I J L S Q A D M E V : ℝ)
 (hI : 0 < I) (hJ : 0 < J) (hL : 0 ≤ L) (hA : 0 ≤ A) (hD : 0 ≤ D)
 (hM : 0 ≤ M) (hE : L*M ≤ I*E) (hV : I*J*V ≤ Q^2*S*M^2)
 (hC : 0 ≤ L^2*J+D*L*A*I*J-Q^2*S*A*I) :
 0 ≤ E^2+A*D*M*E-A*V := by
 have he0 : 0 ≤ I*E := (mul_nonneg hL hM).trans hE
 have hs : (L*M)^2 ≤ (I*E)^2 := (sq_le_sq₀ (mul_nonneg hL hM) he0).mpr hE
 have hs' := mul_le_mul_of_nonneg_left hs hJ.le
 have hl := mul_le_mul_of_nonneg_left hE (by positivity : 0 ≤ D*A*I*J*M)
 have hv := mul_le_mul_of_nonneg_left hV (by positivity : 0 ≤ A*I)
 have hc := mul_nonneg hC (sq_nonneg M)
 have ht : 0 ≤ I^2*J*(E^2+A*D*M*E-A*V) := by
   nlinarith only [hs',hl,hv,hc]
 exact (mul_nonneg_iff_of_pos_left (mul_pos (sq_pos_of_pos hI) hJ)).mp ht

theorem deficit_controlM41B (i r H M E V F G : ℝ)
 (hi : 27 ≤ i) (hr : 3 ≤ r) (hH : r+2*i+9 ≤ H)
 (hM : 0 ≤ M)
 (hfirst : (i+3)*F ≤ (2*r+i+1)*M)
 (hsecond : (i+3)*(i+4)*G ≤ deficitSecondM41B i r*M)
 (hE : r*H*M-(H+r)*F ≤ E)
 (hV : V ≤ (H+r)^2*M*G) :
 0 ≤ E^2+(i+1)*(H-r+1)*M*E-(i+1)*V := by
 have hL := deficit_lower_positiveM41B i r H hi hr hH
 have hS := deficit_scalar_positiveM41B i r H hi hr hH
 have hE' : deficitLowerM41B i r H*M ≤ (i+3)*E := by
   have h0 := mul_le_mul_of_nonneg_left hfirst (by linarith : 0 ≤ H+r)
   have h1 := mul_le_mul_of_nonneg_left hE (by linarith : 0 ≤ i+3)
   unfold deficitLowerM41B
   nlinarith only [h0,h1]
 have hV' : (i+3)*(i+4)*V ≤ (H+r)^2*deficitSecondM41B i r*M^2 := by
   have h0 := mul_le_mul_of_nonneg_left hV (by positivity : 0 ≤ (i+3)*(i+4))
   have h1 := mul_le_mul_of_nonneg_left hsecond (by positivity : 0 ≤ (H+r)^2*M)
   nlinarith only [h0,h1]
 exact deficit_control_algebraM41B (i+3) (i+4) (deficitLowerM41B i r H)
   (deficitSecondM41B i r) (H+r) (i+1) (H-r+1) M E V
   (by linarith) (by linarith) hL.le (by linarith) (by linarith) hM hE' hV' hS.le

end
end MathGKM.Markov
