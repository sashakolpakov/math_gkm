import MarkovMiddlePerturbationM41B
/-! Machine-authored 41b38611. Exact moment form of the new quantitative
template condition. The actual-weight variance bound is not asserted. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def strongDriftM41B (d T c : ℕ) : ℤ :=
 topExcessM55C d T c^2+
 ((c:ℤ)+1)*(2*(c:ℤ)+d+10)*topMassM55C d T c*topExcessM55C d T c-
 ((c:ℤ)+1)*topVarianceNumerM55C d T c

theorem strong_gap_identityM41B (d T c : ℕ) :
 topScaleM55C c^2*topScaleM55C (c+1)*
 (((c:ℤ)+4)*topMassM55C d T (c+1)^2-
 ((c:ℤ)+5)*topMassM55C d T c*topMassM55C d T (c+2))=
 ((c:ℤ)+4)*((c:ℤ)+5)*strongDriftM41B d T c := by
 calc
  _ = ((c:ℤ)+4)*topScaleM55C (c+1)*(topScaleM55C c*topMassM55C d T (c+1))^2-
    ((c:ℤ)+5)*topScaleM55C c*topMassM55C d T c*
    (topScaleM55C c*topScaleM55C (c+1)*topMassM55C d T (c+2)) := by ring
  _ = _ := by
   rw [top_mass_stepM55C,top_mass_two_stepM55C]
   unfold strongDriftM41B topExcessM55C topVarianceNumerM55C topScaleM55C topEigenM55C
   push_cast
   ring

theorem template_strong_iff_momentM41B (d T c : ℕ) :
 (((c:ℤ)+5)*topMassM55C d T c*topMassM55C d T (c+2) ≤
 ((c:ℤ)+4)*topMassM55C d T (c+1)^2) ↔ 0 ≤ strongDriftM41B d T c := by
 have h0 : 0 < topScaleM55C c^2*topScaleM55C (c+1) := by
   exact mul_pos (sq_pos_of_pos (top_scale_positiveM55C c)) (top_scale_positiveM55C (c+1))
 have h1 : 0 < ((c:ℤ)+4)*((c:ℤ)+5) := by positivity
 have he := strong_gap_identityM41B d T c
 rw [←mul_nonneg_iff_of_pos_left h1,←he,mul_nonneg_iff_of_pos_left h0,sub_nonneg]

def TemplateVarianceM41B : Prop := ∀ x k c r, 5 ≤ c → 3 ≤ k →
 c < middleConeBoundM6C0 k r →
 ((c:ℤ)+1)*topVarianceNumerM55C x (x+3*k+middleBaseMD02 r) c ≤
 topExcessM55C x (x+3*k+middleBaseMD02 r) c^2+
 ((c:ℤ)+1)*(2*(c:ℤ)+x+10)*topMassM55C x (x+3*k+middleBaseMD02 r) c*
 topExcessM55C x (x+3*k+middleBaseMD02 r) c

theorem template_strong_iff_varianceM41B : TemplateStrongM41B ↔ TemplateVarianceM41B := by
 unfold TemplateStrongM41B TemplateVarianceM41B
 simp only [middleTemplateMD02,←top_mass_short_sumMEB6]
 apply forall_congr'
 intro x
 apply forall_congr'
 intro k
 apply forall_congr'
 intro c
 apply forall_congr'
 intro r
 apply imp_congr_right
 intro hc
 apply imp_congr_right
 intro hk
 apply imp_congr_right
 intro hb
 rw [template_strong_iff_momentM41B,strongDriftM41B,sub_nonneg]

theorem root_of_template_varianceM41B (h : TemplateVarianceM41B)
 (ht : ThreeOutsideMiddleMD02) (ho : OtherFourM9E2) : Conjecture63 :=
 root_of_template_strongM41B (template_strong_iff_varianceM41B.mpr h) ht ho

end
end MathGKM.Markov
