import MarkovTopRadialCompareMCA9
/-! Machine-authored ca9709f2. Actual likelihood-weighted antidiagonal
positivity in the proposed linear-cutoff region. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def betaBaseWeightMCA9 (i m k : ℕ) : ℝ :=
 ((i+k).choose i:ℝ)*((i+(m-k)).choose i:ℝ)
def betaPairLikelihoodMCA9 (d i r m k : ℕ) : ℝ :=
 betaLikelihoodMDCB d i r k*betaLikelihoodMDCB d i r (m-k)
def betaGroupScalarMCA9 (d i m k : ℕ) : ℝ :=
 (betaScalarMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) k ((m-k:ℕ):ℤ):ℝ)
def betaGroupMCA9 (d i r m : ℕ) : ℝ :=
 ∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*
   betaPairLikelihoodMCA9 d i r m k*betaGroupScalarMCA9 d i m k

theorem beta_weight_positiveMCA9 (r k : ℕ) (hk : k ≤ r) :
 0 < betaWeightMDCB r k := by
 unfold betaWeightMDCB
 split_ifs with h0 h1
 · norm_num
 · have : (k:ℝ) < r := by exact_mod_cast h1
   positivity
 · omega

theorem beta_base_weight_positiveMCA9 (i m k : ℕ) :
 0 < betaBaseWeightMCA9 i m k := by
 unfold betaBaseWeightMCA9
 apply mul_pos
 · exact_mod_cast Nat.choose_pos (show i ≤ i+k by omega)
 · exact_mod_cast Nat.choose_pos (show i ≤ i+(m-k) by omega)

theorem beta_pair_symmetricMCA9 (d i r m k : ℕ) (hk : k ≤ m) :
 betaPairLikelihoodMCA9 d i r m (m-k)=betaPairLikelihoodMCA9 d i r m k := by
 unfold betaPairLikelihoodMCA9
 rw [Nat.sub_sub_self hk,mul_comm]

theorem beta_group_scalar_symmetricMCA9 (d i m k : ℕ) (hk : k ≤ m) :
 betaGroupScalarMCA9 d i m (m-k)=betaGroupScalarMCA9 d i m k := by
 unfold betaGroupScalarMCA9
 rw [Nat.sub_sub_self hk,beta_scalar_symmetricMCA9]

theorem beta_group_scalar_inwardMCA9 (d i m k : ℕ) (hk : 2*k+1 ≤ m) :
 betaGroupScalarMCA9 d i m k ≤ betaGroupScalarMCA9 d i m (k+1) := by
 unfold betaGroupScalarMCA9
 exact_mod_cast beta_scalar_inwardMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) m k (by omega) (by omega) hk

theorem beta_group_baseMCA9 (d i m : ℕ) :
 (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*betaGroupScalarMCA9 d i m k)=
 (betaBaseSumMCA9 i m ((d:ℤ)+2*i+9):ℝ) := by
 unfold betaBaseSumMCA9 betaBaseWeightMCA9 betaGroupScalarMCA9
 push_cast
 rfl

theorem beta_pair_mass_positiveMCA9 (d i r m : ℕ) (hm : m ≤ 2*r) :
 0 < ∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*betaPairLikelihoodMCA9 d i r m k := by
 apply sum_pos'
 · intro k hk
   exact mul_nonneg (beta_base_weight_positiveMCA9 i m k).le
     (mul_nonneg (beta_likelihood_nonnegMDCB d i r k) (beta_likelihood_nonnegMDCB d i r (m-k)))
 · refine ⟨min m r,mem_range.mpr (by omega),?_⟩
   apply mul_pos (beta_base_weight_positiveMCA9 i m (min m r))
   unfold betaPairLikelihoodMCA9 betaLikelihoodMDCB
   apply mul_pos
   · exact mul_pos (beta_q_positiveMDCB d i (min m r))
       (beta_weight_positiveMCA9 r (min m r) (by omega))
   · exact mul_pos (beta_q_positiveMDCB d i (m-min m r))
       (beta_weight_positiveMCA9 r (m-min m r) (by omega))

theorem beta_group_covarianceMCA9 (d i r m : ℕ) :
 (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*betaPairLikelihoodMCA9 d i r m k)*
 (betaBaseSumMCA9 i m ((d:ℤ)+2*i+9):ℝ) ≤
 (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k)*betaGroupMCA9 d i r m := by
 have h := radial_covarianceMCA9 m (betaBaseWeightMCA9 i m)
   (betaPairLikelihoodMCA9 d i r m) (betaGroupScalarMCA9 d i m)
   (fun k _ => (beta_base_weight_positiveMCA9 i m k).le)
   (beta_pair_symmetricMCA9 d i r m)
   (fun k hk => beta_likelihood_inwardMDCB d i r m k hk)
   (beta_group_scalar_symmetricMCA9 d i m)
   (beta_group_scalar_inwardMCA9 d i m)
 rw [beta_group_baseMCA9] at h
 exact h

theorem beta_group_positiveMCA9 (d i r m : ℕ)
 (hd : i+4*r ≤ d+1) (hm : 2 ≤ m) (hmr : m ≤ 2*r) :
 0 < betaGroupMCA9 d i r m := by
 have hM := beta_pair_mass_positiveMCA9 d i r m hmr
 have hB : (0:ℝ) < betaBaseSumMCA9 i m ((d:ℤ)+2*i+9) := by
   exact_mod_cast beta_base_positiveMCA9 i m ((d:ℤ)+2*i+9) hm (by omega)
 have hP := (mul_pos hM hB).trans_le (beta_group_covarianceMCA9 d i r m)
 have hW : 0 ≤ ∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k :=
   sum_nonneg (fun k _ => (beta_base_weight_positiveMCA9 i m k).le)
 exact pos_of_mul_pos_right hP hW

end
end MathGKM.Markov
