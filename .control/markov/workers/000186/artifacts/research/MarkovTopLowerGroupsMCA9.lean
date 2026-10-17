import MarkovTopWeightedBetaMeanMCA9
import MarkovTopLinearResidualMCA9
/-! Machine-authored ca9709f2. Lower antidiagonals are strictly positive
throughout the actual upper-sector parameter domain, without the linear cutoff. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

def betaPolyWeightMCA9 (i r m k : ℕ) : ℝ :=
 betaBaseWeightMCA9 i m k*((r:ℝ)-k)*((r:ℝ)-(m-k:ℕ))
def betaQPairMCA9 (d i m k : ℕ) : ℝ :=
 betaQSeqMDCB d i k*betaQSeqMDCB d i (m-k)

theorem beta_q_pair_symmetricMCA9 (d i m k : ℕ) (hk : k ≤ m) :
 betaQPairMCA9 d i m (m-k)=betaQPairMCA9 d i m k := by
 unfold betaQPairMCA9
 rw [Nat.sub_sub_self hk,mul_comm]

theorem beta_q_pair_inwardMCA9 (d i m k : ℕ) (hk : 2*k+1 ≤ m) :
 betaQPairMCA9 d i m k ≤ betaQPairMCA9 d i m (k+1) := by
 have h := beta_q_crossMDCB d i k (m-(k+1)) (by omega)
 rw [show m-(k+1)+1=m-k by omega] at h
 exact h

theorem beta_poly_weight_positiveMCA9 (i r m k : ℕ) (hm : m < r) (hk : k ≤ m) :
 0 < betaPolyWeightMCA9 i r m k := by
 unfold betaPolyWeightMCA9
 have hk' : (k:ℝ) < r := by exact_mod_cast (show k < r by omega)
 have hl' : ((m-k:ℕ):ℝ) < r := by exact_mod_cast (show m-k < r by omega)
 exact mul_pos (mul_pos (beta_base_weight_positiveMCA9 i m k) (sub_pos.mpr hk')) (sub_pos.mpr hl')

theorem beta_polynomial_baseMCA9 (d i r m : ℕ) :
 (∑ k ∈ range (m+1), betaPolyWeightMCA9 i r m k*betaGroupScalarMCA9 d i m k)=
 (betaWeightedSumMCA9 i m r ((d:ℤ)+2*i+9):ℝ) := by
 unfold betaWeightedSumMCA9 betaPolyWeightMCA9 betaBaseWeightMCA9 betaGroupScalarMCA9
 push_cast
 rfl

theorem beta_group_polynomialMCA9 (d i r m : ℕ) (hm : m < r) :
 betaGroupMCA9 d i r m=
 16*∑ k ∈ range (m+1), betaPolyWeightMCA9 i r m k*betaQPairMCA9 d i m k*
   betaGroupScalarMCA9 d i m k := by
 unfold betaGroupMCA9
 rw [mul_sum]
 apply sum_congr rfl
 intro k hk
 have hk0 : k < r := by have := mem_range.mp hk; omega
 have hk1 : m-k < r := by omega
 unfold betaPairLikelihoodMCA9 betaLikelihoodMDCB betaWeightMDCB betaPolyWeightMCA9 betaQPairMCA9
 rw [if_neg (by omega : k≠r),if_pos hk0,if_neg (by omega : m-k≠r),if_pos hk1]
 ring

theorem beta_lower_group_positiveMCA9 (d i r m : ℕ)
 (hi : 1 ≤ i) (hd : i+r ≤ d+2) (hm : 2 ≤ m) (hmr : m < r) :
 0 < betaGroupMCA9 d i r m := by
 have hB : (0:ℝ) < betaWeightedSumMCA9 i m r ((d:ℤ)+2*i+9) := by
   exact_mod_cast beta_weighted_sum_positiveMCA9 i m r ((d:ℤ)+2*i+9)
     hi hm (by omega) (by omega)
 have hM : 0 < ∑ k ∈ range (m+1), betaPolyWeightMCA9 i r m k*betaQPairMCA9 d i m k := by
   apply sum_pos'
   · intro k hk
     have hk' : k ≤ m := by simpa using hk
     exact (mul_pos (beta_poly_weight_positiveMCA9 i r m k hmr hk')
       (mul_pos (beta_q_positiveMDCB d i k) (beta_q_positiveMDCB d i (m-k)))).le
   · refine ⟨0,mem_range.mpr (by omega),?_⟩
     exact mul_pos (beta_poly_weight_positiveMCA9 i r m 0 hmr (by omega))
       (mul_pos (beta_q_positiveMDCB d i 0) (beta_q_positiveMDCB d i (m-0)))
 have hcov := radial_covarianceMCA9 m (betaPolyWeightMCA9 i r m)
   (betaQPairMCA9 d i m) (betaGroupScalarMCA9 d i m)
   (fun k hk => (beta_poly_weight_positiveMCA9 i r m k hmr hk).le)
   (beta_q_pair_symmetricMCA9 d i m) (beta_q_pair_inwardMCA9 d i m)
   (beta_group_scalar_symmetricMCA9 d i m) (beta_group_scalar_inwardMCA9 d i m)
 rw [beta_polynomial_baseMCA9] at hcov
 have hp := (mul_pos hM hB).trans_le hcov
 have hW : 0 ≤ ∑ k ∈ range (m+1), betaPolyWeightMCA9 i r m k :=
   sum_nonneg (fun k hk => (beta_poly_weight_positiveMCA9 i r m k hmr (by simpa using hk)).le)
 have hsum := pos_of_mul_pos_right hp hW
 rw [beta_group_polynomialMCA9 d i r m hmr]
 positivity

def UpperHalfBetaMCA9 : Prop := ∀ d i r m : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → r ≤ m → m ≤ 2*r → 0 ≤ betaGroupMCA9 d i r m

theorem top_tail_of_upper_halfMCA9 (H : UpperHalfBetaMCA9) : TopTailResidualMDCB := by
 intro d i r hi hr hd
 have hs : 0 < ∑ m ∈ range (2*r+1), betaGroupMCA9 d i r m := by
   apply sum_pos'
   · intro m hm
     by_cases hmr : r ≤ m
     · exact H d i r m hi hr hd hmr (by have := mem_range.mp hm; omega)
     · by_cases hm2 : 2 ≤ m
       · exact (beta_lower_group_positiveMCA9 d i r m hi hd hm2 (by omega)).le
       · interval_cases m
         · rw [beta_group_zeroMCA9]
         · rw [beta_group_oneMCA9]
   · exact ⟨2,mem_range.mpr (by omega),beta_lower_group_positiveMCA9 d i r 2 hi hd le_rfl (by omega)⟩
 rw [beta_group_sum_identityMCA9] at hs
 have hg : 0 < betaDensityGapMCA9 d i r := by linarith
 have hD : (0:ℝ) < tailDenMDCB i d r := by exact_mod_cast tail_den_positiveMDCB i d r
 have h := mul_pos (sq_pos_of_pos hD) hg
 rw [beta_gap_scaledMCA9] at h
 exact le_of_lt (by exact_mod_cast h)

theorem top_moment_of_upper_halfMCA9 (H : UpperHalfBetaMCA9) : TopMomentBoundM55C :=
 top_moment_iff_tail_residualMDCB.mpr (top_tail_of_upper_halfMCA9 H)

end
end MathGKM.Markov
