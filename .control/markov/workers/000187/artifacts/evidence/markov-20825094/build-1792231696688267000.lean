import MarkovTopSteinPositiveM208
/-! Machine-authored 20825094. Attach the endpoint-modified weights by
radial covariance, then remove all positive auxiliary scales. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

def steinCutM208 (r m k : ℕ) : ℝ := betaWeightMDCB r k*betaWeightMDCB r (m-k)

theorem stein_cut_symmetricM208 (r m k : ℕ) (hk : k ≤ m) :
 steinCutM208 r m (m-k)=steinCutM208 r m k := by
 unfold steinCutM208
 rw [Nat.sub_sub_self hk,mul_comm]

theorem stein_cut_inwardM208 (r m k : ℕ) (hk : 2*k+1 ≤ m) :
 steinCutM208 r m k ≤ steinCutM208 r m (k+1) := by
 have h := beta_weight_crossMDCB r k (m-(k+1)) (by omega)
 rw [show m-(k+1)+1=m-k by omega] at h
 exact h

theorem stein_pair_cutM208 (d i r m k : ℕ) :
 steinPairM208 d i m k*steinCutM208 r m k=
 betaBaseWeightMCA9 i m k*betaPairLikelihoodMCA9 d i r m k := by
 unfold steinPairM208 steinDensityM208 steinCutM208 betaBaseWeightMCA9
   betaPairLikelihoodMCA9 betaLikelihoodMDCB
 ring

theorem stein_group_positiveM208 (d i r m : ℕ)
 (hm : 2 ≤ m) (hmr : m ≤ 2*r) (ha : 2*m ≤ i+1)
 (hH : 6*(i+1)+m+8 ≤ 2*(d+2*i+9)) : 0 < betaGroupMCA9 d i r m := by
 have hc := radial_covarianceMCA9 m (steinPairM208 d i m) (steinCutM208 r m)
   (betaGroupScalarMCA9 d i m) (fun k _ => (stein_pair_positiveM208 d i m k).le)
   (stein_cut_symmetricM208 r m) (stein_cut_inwardM208 r m)
   (beta_group_scalar_symmetricMCA9 d i m) (beta_group_scalar_inwardMCA9 d i m)
 have hB := stein_base_positiveM208 d i m hm ha hH
 have hM : 0 < ∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k := by
   simp_rw [stein_pair_cutM208]
   exact beta_pair_mass_positiveMCA9 d i r m hmr
 have hgroup : (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
     betaGroupScalarMCA9 d i m k)=betaGroupMCA9 d i r m := by
   simp_rw [stein_pair_cutM208]
   rfl
 rw [hgroup] at hc
 have hp := (mul_pos hM hB).trans_le hc
 have hw : 0 ≤ ∑ k ∈ range (m+1), steinPairM208 d i m k :=
   sum_nonneg (fun k _ => (stein_pair_positiveM208 d i m k).le)
 exact pos_of_mul_pos_right hp hw

theorem stein_group_wedgeM208 (d i r m : ℕ)
 (hd : i+r ≤ d+2) (hi : 4*r ≤ i+1) (hm : 2 ≤ m) (hmr : m ≤ 2*r) :
 0 < betaGroupMCA9 d i r m :=
 stein_group_positiveM208 d i r m hm hmr (by omega) (by omega)

theorem stein_density_gap_positiveM208 (d i r : ℕ)
 (hd : i+r ≤ d+2) (hi : 4*r ≤ i+1) (hr : 1 ≤ r) :
 0 < betaDensityGapMCA9 d i r := by
 have hs : 0 < ∑ m ∈ range (2*r+1), betaGroupMCA9 d i r m := by
   apply sum_pos'
   · intro m hm
     by_cases hm2 : 2 ≤ m
     · exact (stein_group_wedgeM208 d i r m hd hi hm2 (by have := mem_range.mp hm; omega)).le
     · interval_cases m
       · rw [beta_group_zeroMCA9]
       · rw [beta_group_oneMCA9]
   · exact ⟨2,mem_range.mpr (by omega),stein_group_wedgeM208 d i r 2 hd hi le_rfl (by omega)⟩
 rw [beta_group_sum_identityMCA9] at hs
 linarith

theorem tail_gap_wedge_positiveM208 (d i r : ℕ)
 (hd : i+r ≤ d+2) (hi : 4*r ≤ i+1) (hr : 1 ≤ r) : 0 < tailGapMDCB i d r := by
 have h := stein_density_gap_positiveM208 d i r hd hi hr
 have hD : (0:ℝ) < tailDenMDCB i d r := by exact_mod_cast tail_den_positiveMDCB i d r
 have hp := mul_pos (sq_pos_of_pos hD) h
 rw [beta_gap_scaledMCA9] at hp
 exact_mod_cast hp

theorem top_mass_wedge_strictM208 (d i r : ℕ)
 (hd : i+r ≤ d+2) (hi : 4*r ≤ i+1) (hr : 1 ≤ r) :
 topMassM55C d (i+r) i*topMassM55C d (i+r) (i+2) < topMassM55C d (i+r) (i+1)^2 :=
 (tail_strict_iffMDCB d i r).mpr (tail_gap_wedge_positiveM208 d i r hd hi hr)

end
end MathGKM.Markov
