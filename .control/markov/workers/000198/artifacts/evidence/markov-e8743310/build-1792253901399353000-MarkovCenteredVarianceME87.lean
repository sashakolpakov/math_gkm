import MarkovWeakMarginM673
/-! Machine-authored e8743310. Retain the squared displacement from the
actual weighted mean in the variance bound. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem top_variance_centeredME87 (d T i : ℕ) :
 topVarianceNumerM55C d T i+
 ((topEigenM55C d T-topEigenM55C d i)*topMassM55C d T i-topExcessM55C d T i)^2 ≤
 (2*(T:ℤ)+d+9)^2*topMassM55C d T i*topDeficitM41B d T i 2 := by
 have h := mul_le_mul_of_nonneg_left (top_centered_boundM41B d T i)
   (top_mass_nonnegM55C d T i)
 rw [top_centered_identityM41B] at h
 unfold topVarianceNumerM55C topExcessM55C
 nlinarith only [h]

theorem centered_control_algebraME87 (I J S Q A D B R M E V : ℝ)
 (hI : 0 < I) (hJ : 0 < J) (hA : 0 ≤ A) (hAB : 0 < A+B)
 (hV : I*J*(V+(R*M-E)^2) ≤ Q^2*S*M^2)
 (hC : 0 ≤ 4*I*J*B*R^2+4*I*J*A*D*R-I*J*A*D^2-4*(A+B)*Q^2*S) :
 0 ≤ B*E^2+A*D*M*E-A*V := by
 have h0 : 0 ≤ I*J*(2*(A+B)*E+A*(D-2*R)*M)^2 := by positivity
 have h1 := mul_nonneg (mul_nonneg hA hC) (sq_nonneg M)
 have h2 := mul_nonneg (show 0 ≤ 4*(A+B)*A by positivity) (sub_nonneg.mpr hV)
 have he : I*J*(2*(A+B)*E+A*(D-2*R)*M)^2+
   A*(4*I*J*B*R^2+4*I*J*A*D*R-I*J*A*D^2-4*(A+B)*Q^2*S)*M^2+
   (4*(A+B)*A)*(Q^2*S*M^2-I*J*(V+(R*M-E)^2)) =
   (4*(A+B)*I*J)*(B*E^2+A*D*M*E-A*V) := by ring
 have ht : 0 ≤ (4*(A+B)*I*J)*(B*E^2+A*D*M*E-A*V) := by
   rw [←he]
   exact add_nonneg (add_nonneg h0 h1) h2
 exact (mul_nonneg_iff_of_pos_left (by positivity : 0 < 4*(A+B)*I*J)).mp ht

def centeredScalarME87 (i r H : ℝ) : ℝ :=
 let I := i+3
 let J := i+4
 let A := (i+1)*(8*(i+4)+1)
 let B := 15*i+47
 let D := H-r+1
 let R := r*H
 4*I*J*B*R^2+4*I*J*A*D*R-I*J*A*D^2-
 4*(A+B)*(H+r)^2*deficitSecondM41B i r

end
end MathGKM.Markov
