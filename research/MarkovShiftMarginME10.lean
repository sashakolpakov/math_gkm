import MarkovShiftDeficitME10
/-! Machine-authored e108e0e2. Shifted actual-weight identities. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
def weakDriftME10 (d T c : ℕ) : ℤ :=
 (15*(c:ℤ)+47)*topExcessME10 d T c^2+
 ((c:ℤ)+1)*(8*((c:ℤ)+4)+1)*(2*(c:ℤ)+d+6)*topMassME10 d T c*topExcessME10 d T c-
 ((c:ℤ)+1)*(8*((c:ℤ)+4)+1)*topVarianceNumerME10 d T c


theorem weak_gap_identityME10 (d T c : ℕ) :
 topScaleM55C c^2*topScaleM55C (c+1)*
 (8*((c:ℤ)+4)*topMassME10 d T (c+1)^2-
 (8*((c:ℤ)+4)+1)*topMassME10 d T c*topMassME10 d T (c+2))=
 ((c:ℤ)+4)*weakDriftME10 d T c := by
 calc
  _ = 8*((c:ℤ)+4)*topScaleM55C (c+1)*(topScaleM55C c*topMassME10 d T (c+1))^2-
    (8*((c:ℤ)+4)+1)*topScaleM55C c*topMassME10 d T c*
    (topScaleM55C c*topScaleM55C (c+1)*topMassME10 d T (c+2)) := by ring
  _ = _ := by
   rw [top_mass_stepME10,top_mass_two_stepME10]
   unfold weakDriftME10 topExcessME10 topVarianceNumerME10 topScaleM55C topEigenME10
   push_cast
   ring


theorem weak_gap_iffME10 (d T c : ℕ) :
 ((8*((c:ℤ)+4)+1)*topMassME10 d T c*topMassME10 d T (c+2) ≤
 8*((c:ℤ)+4)*topMassME10 d T (c+1)^2) ↔ 0 ≤ weakDriftME10 d T c := by
 have h0 : 0 < topScaleM55C c^2*topScaleM55C (c+1) :=
   mul_pos (sq_pos_of_pos (top_scale_positiveM55C c)) (top_scale_positiveM55C (c+1))
 have h1 : (0:ℤ) < c+4 := by positivity
 rw [←mul_nonneg_iff_of_pos_left h1,←weak_gap_identityME10,
   mul_nonneg_iff_of_pos_left h0,sub_nonneg]



end
end MathGKM.Markov
