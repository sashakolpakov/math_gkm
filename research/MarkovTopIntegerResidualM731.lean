import MarkovTopIntegerDensityM731
/-! Machine-authored 73199834. Exact integer equivalent of the unresolved
upper wedge. This is a representation change, not a positivity theorem. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 7000000

def betaIntegerTotalM731 (d i r : ℕ) : ℤ :=
 ∑ m ∈ range (2*r+1), betaIntegerGroupM731 d i r m

theorem beta_integer_total_castM731 (d i r : ℕ) :
 (betaIntegerTotalM731 d i r:ℝ)=
 2*(betaQDenM731 d i:ℝ)^2*betaDensityGapMCA9 d i r := by
 unfold betaIntegerTotalM731
 push_cast
 simp_rw [beta_integer_group_castM731]
 rw [←mul_sum,beta_group_sum_identityMCA9]
 ring

theorem beta_integer_total_scaleM731 (d i r : ℕ) :
 (tailDenMDCB i d r:ℝ)^2*(betaIntegerTotalM731 d i r:ℝ)=
 2*(betaQDenM731 d i:ℝ)^2*(tailGapMDCB i d r:ℝ) := by
 rw [beta_integer_total_castM731]
 linear_combination 2*(betaQDenM731 d i:ℝ)^2*beta_gap_scaledMCA9 d i r

theorem beta_integer_total_nonneg_iffM731 (d i r : ℕ) :
 0 ≤ betaIntegerTotalM731 d i r ↔ 0 ≤ tailGapMDCB i d r := by
 have hD : (0:ℝ) < tailDenMDCB i d r := by exact_mod_cast tail_den_positiveMDCB i d r
 have hQ : (0:ℝ) < betaQDenM731 d i := by exact_mod_cast beta_q_den_positiveM731 d i
 have h : (0:ℝ) ≤ betaIntegerTotalM731 d i r ↔ (0:ℝ) ≤ tailGapMDCB i d r := by
   rw [←mul_nonneg_iff_of_pos_left (sq_pos_of_pos hD),beta_integer_total_scaleM731]
   exact mul_nonneg_iff_of_pos_left (mul_pos (by norm_num) (sq_pos_of_pos hQ))
 exact_mod_cast h

theorem beta_integer_total_pos_iffM731 (d i r : ℕ) :
 0 < betaIntegerTotalM731 d i r ↔ 0 < tailGapMDCB i d r := by
 have hD : (0:ℝ) < tailDenMDCB i d r := by exact_mod_cast tail_den_positiveMDCB i d r
 have hQ : (0:ℝ) < betaQDenM731 d i := by exact_mod_cast beta_q_den_positiveM731 d i
 have h : (0:ℝ) < betaIntegerTotalM731 d i r ↔ (0:ℝ) < tailGapMDCB i d r := by
   rw [←mul_pos_iff_of_pos_left (sq_pos_of_pos hD),beta_integer_total_scaleM731]
   exact mul_pos_iff_of_pos_left (mul_pos (by norm_num) (sq_pos_of_pos hQ))
 exact_mod_cast h

def TopIntegerWedgeM731 : Prop := ∀ d i r : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → i+1 < 4*r →
 0 ≤ betaIntegerTotalM731 d i r

theorem top_wedge_iff_integerM731 : TopWedgeStripM208 ↔ TopIntegerWedgeM731 := by
 constructor
 · intro H d i r hi hr hd hb hw
   exact (beta_integer_total_nonneg_iffM731 d i r).mpr (H d i r hi hr hd hb hw)
 · intro H d i r hi hr hd hb hw
   exact (beta_integer_total_nonneg_iffM731 d i r).mp (H d i r hi hr hd hb hw)

theorem top_moment_iff_integerM731 : TopMomentBoundM55C ↔ TopIntegerWedgeM731 :=
 top_moment_iff_wedge_stripM208.trans top_wedge_iff_integerM731

end
end MathGKM.Markov
