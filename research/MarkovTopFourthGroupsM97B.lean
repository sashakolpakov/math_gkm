import MarkovTopFourthControlM97B
import MarkovTopFourthSignsM97B
/-! Machine-authored 97b019af. Actual fourth-moment attachment and strict
upper-template inequalities on a quadratic parameter region. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

theorem fourth_group_positiveM97B (d i r m : ℕ)
 (hi : 2 ≤ i) (hm : 2 ≤ m) (hmr : m ≤ 2*r)
 (ham : 4*(m-2) ≤ (i-2)^2)
 (hH : 6*(i+1)+m+8 ≤ 2*(d+2*i+9)) : 0 < betaGroupMCA9 d i r m := by
 have hiR : (3:ℝ) ≤ (i:ℝ)+1 := by exact_mod_cast (show 3 ≤ i+1 by omega)
 have hmR : (2:ℝ) ≤ m := by exact_mod_cast hm
 have hamR : 4*((m:ℝ)-2) ≤ ((i:ℝ)+1-3)^2 := by
   have h : (4:ℝ)*(m-2:ℕ) ≤ (i-2:ℕ)^2 := by exact_mod_cast ham
   rw [Nat.cast_sub hm,Nat.cast_sub hi] at h
   convert h using 1 <;> ring
 have hHR : 6*((i:ℝ)+1)+m+8 ≤ 2*((d:ℝ)+2*i+9) := by exact_mod_cast hH
 have hmass : 0 < ∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k := by
   simp_rw [stein_pair_cutM208]
   exact beta_pair_mass_positiveMCA9 d i r m hmr
 have hL : (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   steinLM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k) ≤ 0 := by
   rw [stein_cut_partsM208]
   exact neg_nonpos.mpr (stein_energy_nonnegM208 d i r m)
 have h := fourth_sum_positive_of_controlM731 ((i:ℝ)+1) ((d:ℝ)+2*i+9) m
   (fun k => steinPairM208 d i m k*steinCutM208 r m k)
   hiR hm hamR hHR (fourth_delta_positiveM97B _ _ _ hiR hmR hHR)
   (fourth_cp_positiveM97B _ _ _ hiR hmR hHR).le hmass hL (fourth_actual_controlM97B d i r m)
 have he : (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   steinScalarM208 ((i:ℝ)+1) ((d:ℝ)+2*i+9) k ((m:ℝ)-k))=betaGroupMCA9 d i r m := by
   unfold betaGroupMCA9
   apply sum_congr rfl; intro k hk
   rw [stein_pair_cutM208,stein_scalar_castM208 d i m k (by have := mem_range.mp hk; omega)]
 rwa [he] at h

theorem fourth_density_gap_positiveM97B (d i r : ℕ)
 (hi : 2 ≤ i) (hr : 1 ≤ r) (hd : i+r ≤ d+2)
 (hq : 8*(r-1) ≤ (i-2)^2) : 0 < betaDensityGapMCA9 d i r := by
 have hs : 0 < ∑ m ∈ range (2*r+1), betaGroupMCA9 d i r m := by
   apply sum_pos'
   · intro m hm
     have hmr : m ≤ 2*r := by have := mem_range.mp hm; omega
     by_cases hm2 : 2 ≤ m
     · exact (fourth_group_positiveM97B d i r m hi hm2 hmr (by omega) (by omega)).le
     · interval_cases m
       · rw [beta_group_zeroMCA9]
       · rw [beta_group_oneMCA9]
   · exact ⟨2,mem_range.mpr (by omega),fourth_group_positiveM97B d i r 2 hi
       le_rfl (by omega) (by omega) (by omega)⟩
 rw [beta_group_sum_identityMCA9] at hs
 linarith

theorem fourth_tail_gap_positiveM97B (d i r : ℕ)
 (hi : 2 ≤ i) (hr : 1 ≤ r) (hd : i+r ≤ d+2)
 (hq : 8*(r-1) ≤ (i-2)^2) : 0 < tailGapMDCB i d r := by
 have h := fourth_density_gap_positiveM97B d i r hi hr hd hq
 have hD : (0:ℝ) < tailDenMDCB i d r := by exact_mod_cast tail_den_positiveMDCB i d r
 have hp := mul_pos (sq_pos_of_pos hD) h
 rw [beta_gap_scaledMCA9] at hp
 exact_mod_cast hp

theorem fourth_top_mass_strictM97B (d i r : ℕ)
 (hi : 2 ≤ i) (hr : 1 ≤ r) (hd : i+r ≤ d+2)
 (hq : 8*(r-1) ≤ (i-2)^2) :
 topMassM55C d (i+r) i*topMassM55C d (i+r) (i+2) < topMassM55C d (i+r) (i+1)^2 :=
 (tail_strict_iffMDCB d i r).mpr (fourth_tail_gap_positiveM97B d i r hi hr hd hq)

end
end MathGKM.Markov
