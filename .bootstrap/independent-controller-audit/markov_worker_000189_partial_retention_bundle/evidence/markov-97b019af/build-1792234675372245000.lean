import MarkovTopFourthBetaM97B
/-! Machine-authored 97b019af. Fourth-moment contraction for the actual
likelihood, with its cut endpoints and zeros retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

def fourthControlM97B (i m k : ℕ) : ℝ :=
 fourthMomentNumM731 ((i:ℝ)+1) m-
 fourthMomentDenM731 ((i:ℝ)+1)*((k:ℝ)-(m:ℝ)/2)^4

theorem fourth_control_symmetricM97B (i m k : ℕ) (hk : k ≤ m) :
 fourthControlM97B i m (m-k)=fourthControlM97B i m k := by
 unfold fourthControlM97B
 rw [Nat.cast_sub hk]
 ring

theorem fourth_control_inwardM97B (i m k : ℕ) (hk : 2*k+1 ≤ m) :
 fourthControlM97B i m k ≤ fourthControlM97B i m (k+1) := by
 have hkR : 2*(k:ℝ)+1 ≤ m := by exact_mod_cast hk
 have hsq : ((k:ℝ)+1-(m:ℝ)/2)^2 ≤ ((k:ℝ)-(m:ℝ)/2)^2 := by nlinarith
 have hfour := (sq_le_sq₀ (sq_nonneg ((k:ℝ)+1-(m:ℝ)/2))
   (sq_nonneg ((k:ℝ)-(m:ℝ)/2))).mpr hsq
 have hB : 0 ≤ fourthMomentDenM731 ((i:ℝ)+1) := by
   unfold fourthMomentDenM731; positivity
 have hmul := mul_le_mul_of_nonneg_left hfour hB
 unfold fourthControlM97B
 push_cast
 nlinarith only [hmul]

theorem fourth_control_base_zeroM97B (i m : ℕ) :
 (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*fourthControlM97B i m k)=0 := by
 have h := fourth_beta_realM97B i m
 unfold fourthControlM97B
 simp only [mul_sub,sum_sub_distrib,←sum_mul]
 have he : (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*
   (fourthMomentDenM731 ((i:ℝ)+1)*((k:ℝ)-(m:ℝ)/2)^4))=
   fourthMomentDenM731 ((i:ℝ)+1)*
   (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*((k:ℝ)-(m:ℝ)/2)^4) := by
   rw [mul_sum]; apply sum_congr rfl; intro k hk; ring
 rw [he,h]; ring

theorem fourth_control_inward_sumM97B (i m : ℕ) (f : ℕ → ℝ)
 (hs : ∀ k, k ≤ m → f (m-k)=f k)
 (hi : ∀ k, 2*k+1 ≤ m → f k ≤ f (k+1)) :
 0 ≤ ∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*f k*fourthControlM97B i m k := by
 have h := radial_covarianceMCA9 m (betaBaseWeightMCA9 i m) f (fourthControlM97B i m)
   (fun k _ => (beta_base_weight_positiveMCA9 i m k).le) hs hi
   (fourth_control_symmetricM97B i m) (fourth_control_inwardM97B i m)
 rw [fourth_control_base_zeroM97B,mul_zero] at h
 have hM : 0 < ∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k := by
   apply sum_pos'
   · intro k hk; exact (beta_base_weight_positiveMCA9 i m k).le
   · exact ⟨0,mem_range.mpr (by omega),beta_base_weight_positiveMCA9 i m 0⟩
 exact (mul_nonneg_iff_of_pos_left hM).mp h

theorem fourth_actual_controlM97B (d i r m : ℕ) :
 (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   (fourthMomentDenM731 ((i:ℝ)+1)*((k:ℝ)-(m:ℝ)/2)^4-
     fourthMomentNumM731 ((i:ℝ)+1) m)) ≤ 0 := by
 have h := fourth_control_inward_sumM97B i m (betaPairLikelihoodMCA9 d i r m)
   (beta_pair_symmetricMCA9 d i r m)
   (fun k hk => beta_likelihood_inwardMDCB d i r m k hk)
 have he : (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   (fourthMomentDenM731 ((i:ℝ)+1)*((k:ℝ)-(m:ℝ)/2)^4-
     fourthMomentNumM731 ((i:ℝ)+1) m))=
   -(∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*
     betaPairLikelihoodMCA9 d i r m k*fourthControlM97B i m k) := by
   rw [←sum_neg_distrib]
   apply sum_congr rfl; intro k hk
   rw [stein_pair_cutM208]
   unfold fourthControlM97B; ring
 rw [he]
 exact neg_nonpos.mpr h

end
end MathGKM.Markov
