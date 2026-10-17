import MarkovMiddleFiniteColumnsM41B
/-! Machine-authored 6738b4ea. A weaker quantitative template margin,
with the entire actual correction retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

def weakDriftM673 (d T c : ℕ) : ℤ :=
 (15*(c:ℤ)+47)*topExcessM55C d T c^2+
 ((c:ℤ)+1)*(8*((c:ℤ)+4)+1)*(2*(c:ℤ)+d+10)*topMassM55C d T c*topExcessM55C d T c-
 ((c:ℤ)+1)*(8*((c:ℤ)+4)+1)*topVarianceNumerM55C d T c

theorem weak_gap_identityM673 (d T c : ℕ) :
 topScaleM55C c^2*topScaleM55C (c+1)*
 (8*((c:ℤ)+4)*topMassM55C d T (c+1)^2-
 (8*((c:ℤ)+4)+1)*topMassM55C d T c*topMassM55C d T (c+2))=
 ((c:ℤ)+4)*weakDriftM673 d T c := by
 calc
  _ = 8*((c:ℤ)+4)*topScaleM55C (c+1)*(topScaleM55C c*topMassM55C d T (c+1))^2-
    (8*((c:ℤ)+4)+1)*topScaleM55C c*topMassM55C d T c*
    (topScaleM55C c*topScaleM55C (c+1)*topMassM55C d T (c+2)) := by ring
  _ = _ := by
   rw [top_mass_stepM55C,top_mass_two_stepM55C]
   unfold weakDriftM673 topExcessM55C topVarianceNumerM55C topScaleM55C topEigenM55C
   push_cast
   ring

theorem weak_gap_iffM673 (d T c : ℕ) :
 ((8*((c:ℤ)+4)+1)*topMassM55C d T c*topMassM55C d T (c+2) ≤
 8*((c:ℤ)+4)*topMassM55C d T (c+1)^2) ↔ 0 ≤ weakDriftM673 d T c := by
 have h0 : 0 < topScaleM55C c^2*topScaleM55C (c+1) :=
   mul_pos (sq_pos_of_pos (top_scale_positiveM55C c)) (top_scale_positiveM55C (c+1))
 have h1 : (0:ℤ) < c+4 := by positivity
 rw [←mul_nonneg_iff_of_pos_left h1,←weak_gap_identityM673,
   mul_nonneg_iff_of_pos_left h0,sub_nonneg]

theorem weak_exponentialM673 (c : ℕ) (hc : 7 ≤ c) :
 84*(8*(c+4)+1) ≤ (3:ℕ)^(c+2) := by
 induction c,hc using Nat.le_induction with
 | base => norm_num
 | succ c hc ih =>
   rw [show c+1+2=(c+2)+1 by omega,pow_succ]
   nlinarith

theorem weak_correction_boundM673 (x k c : ℕ) (r : Bool) (hc : 7 ≤ c) :
 4*(8*((c:ℤ)+4)+1)*middleCorrMD02 x k r c ≤ middleTemplateMD02 x k r c := by
 have h := correction_exponential_boundM41B x k c r
 have he : 84*(8*((c:ℤ)+4)+1) ≤ (3:ℤ)^(c+2) := by exact_mod_cast weak_exponentialM673 c hc
 have hn : 0 ≤ middleCorrMD02 x k r c := correction_short_nonnegMD02 _ _ _ _
 have hm := mul_le_mul_of_nonneg_right he hn
 nlinarith

theorem middle_gap_of_weakM673 (x k c : ℕ) (r : Bool) (hc : 7 ≤ c)
 (h : (8*((c:ℤ)+4)+1)*middleTemplateMD02 x k r c*middleTemplateMD02 x k r (c+2) ≤
 8*((c:ℤ)+4)*middleTemplateMD02 x k r (c+1)^2) :
 0 ≤ middleGapMD02 r c x k := by
 have hu := weak_correction_boundM673 x k c r hc
 have hw := weak_correction_boundM673 x k (c+2) r (by omega)
 have hun : 0 ≤ middleCorrMD02 x k r c := correction_short_nonnegMD02 _ _ _ _
 have hvn : 0 ≤ middleCorrMD02 x k r (c+1) := correction_short_nonnegMD02 _ _ _ _
 have hwn : 0 ≤ middleCorrMD02 x k r (c+2) := correction_short_nonnegMD02 _ _ _ _
 have hw' : 4*(8*((c:ℤ)+4)+1)*middleCorrMD02 x k r (c+2) ≤ middleTemplateMD02 x k r (c+2) := by
   push_cast at hw
   nlinarith
 have hh := positive_perturbationM41B
   (middleTemplateMD02 x k r c) (middleTemplateMD02 x k r (c+1))
   (middleTemplateMD02 x k r (c+2)) (middleCorrMD02 x k r c)
   (middleCorrMD02 x k r (c+1)) (middleCorrMD02 x k r (c+2)) (8*((c:ℤ)+4))
   (template_nonnegM41B _ _ _ _) (template_nonnegM41B _ _ _ _) (template_nonnegM41B _ _ _ _)
   hun hvn hwn (by omega) h hu hw'
 exact sub_nonneg.mpr hh

theorem weak_control_algebraM673 (I J L S Q A D B M E V : ℝ)
 (hI : 0 < I) (hJ : 0 < J) (hL : 0 ≤ L) (hA : 0 ≤ A) (hD : 0 ≤ D) (hB : 0 ≤ B)
 (hM : 0 ≤ M) (hE : L*M ≤ I*E) (hV : I*J*V ≤ Q^2*S*M^2)
 (hC : 0 ≤ B*L^2*J+D*L*A*I*J-Q^2*S*A*I) :
 0 ≤ B*E^2+A*D*M*E-A*V := by
 have he0 : 0 ≤ I*E := (mul_nonneg hL hM).trans hE
 have hs : (L*M)^2 ≤ (I*E)^2 := (sq_le_sq₀ (mul_nonneg hL hM) he0).mpr hE
 have hs' := mul_le_mul_of_nonneg_left hs (mul_nonneg hB hJ.le)
 have hl := mul_le_mul_of_nonneg_left hE (by positivity : 0 ≤ D*A*I*J*M)
 have hv := mul_le_mul_of_nonneg_left hV (by positivity : 0 ≤ A*I)
 have hc := mul_nonneg hC (sq_nonneg M)
 have ht : 0 ≤ I^2*J*(B*E^2+A*D*M*E-A*V) := by
   nlinarith only [hs',hl,hv,hc]
 exact (mul_nonneg_iff_of_pos_left (mul_pos (sq_pos_of_pos hI) hJ)).mp ht
end
end MathGKM.Markov
