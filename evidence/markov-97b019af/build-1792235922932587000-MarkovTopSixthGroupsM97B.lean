import MarkovTopSixthControlM97B
import MarkovTopSixthGeneratorM97B
import MarkovTopSixthDeltaSignM97B
import MarkovTopSixthASignM97B
import MarkovTopSixthCSignM97B
import MarkovTopSixthKSignM97B
import MarkovTopSixthReducedSignM97B
/-! Machine-authored 97b019af. Full sector group positivity for i>=6. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 14000000
attribute [local irreducible] sixthdeltaM97B sixthAM97B sixthCM97B sixthJM97B sixthKM97B sixthReducedM97B

theorem sixth_combined_pointM97B (a m H k : ℝ) :
 sixthMomentDenM97B a*sixthdeltaM97B a m H*steinScalarM208 a H k (m-k)+
 sixthMomentDenM97B a*sixthAM97B a m H*steinLM208 a m H k+
 sixthMomentDenM97B a*sixthCM97B a m H*sixthLM97B a m H k+
 (-sixthKM97B a m H)*(sixthMomentDenM97B a*(k-m/2)^6-sixthMomentNumM97B a m)=
 a*m*(m-1)*sixthReducedM97B a m H := by
 linear_combination sixthMomentDenM97B a*sixth_point_certificateM97B a m H k+
   sixth_certificate_factorM97B a m H

theorem sixth_sum_positiveM97B (a H : ℝ) (m : ℕ) (w : ℕ → ℝ)
 (ha : 7 ≤ a) (hm : 2 ≤ m) (hH : 6*a+m+8 ≤ 2*H)
 (hMass : 0 < ∑ k ∈ range (m+1), w k)
 (hL1 : (∑ k ∈ range (m+1), w k*steinLM208 a m H k) ≤ 0)
 (hL2 : (∑ k ∈ range (m+1), w k*sixthLM97B a m H k) ≤ 0)
 (h6 : (∑ k ∈ range (m+1), w k*(sixthMomentDenM97B a*((k:ℝ)-(m:ℝ)/2)^6-
   sixthMomentNumM97B a m)) ≤ 0) :
 0 < ∑ k ∈ range (m+1), w k*steinScalarM208 a H k ((m:ℝ)-k) := by
 have hmR : (2:ℝ) ≤ m := by exact_mod_cast hm
 have hden : 0 < sixthMomentDenM97B a := by unfold sixthMomentDenM97B; positivity
 have hdel := sixth_delta_positiveM97B a m H (by linarith) hmR hH
 have hA := sixth_a_positiveM97B a m H (by linarith) hmR hH
 have hC := sixth_c_positiveM97B a m H (by linarith) hmR hH
 have hK := sixth_k_positiveM97B a m H (by linarith) hmR hH
 have hR := sixth_reduced_positiveM97B a m H ha hmR hH
 have hs := sum_congr (s₁:=range (m+1)) rfl (fun k _ =>
   congrArg (fun v : ℝ => w k*v) (sixth_combined_pointM97B a m H k))
 have hmul (c : ℝ) (f : ℕ → ℝ) :
   (∑ k ∈ range (m+1), w k*(c*f k))=c*∑ k ∈ range (m+1), w k*f k := by
   rw [mul_sum]; apply sum_congr rfl; intro k hk; ring
 simp only [mul_add,sum_add_distrib] at hs
 rw [hmul,hmul,hmul,hmul,←sum_mul] at hs
 have hl1 := mul_nonpos_of_nonneg_of_nonpos (mul_pos hden hA).le hL1
 have hl2 := mul_nonpos_of_nonneg_of_nonpos (mul_pos hden hC).le hL2
 have hlast := mul_nonpos_of_nonneg_of_nonpos hK.le h6
 have hp := mul_pos hMass (mul_pos (mul_pos (mul_pos (by linarith : 0 < a)
   (by linarith : (0:ℝ) < m)) (by linarith : (0:ℝ) < (m:ℝ)-1)) hR)
 have hscaled : 0 < sixthMomentDenM97B a*sixthdeltaM97B a m H*
   (∑ k ∈ range (m+1), w k*steinScalarM208 a H k ((m:ℝ)-k)) := by
   linarith only [hs,hl1,hl2,hlast,hp]
 exact (mul_pos_iff_of_pos_left (mul_pos hden hdel)).mp hscaled

theorem sixth_group_positiveM97B (d i r m : ℕ)
 (hi : 6 ≤ i) (hm : 2 ≤ m) (hmr : m ≤ 2*r) (hd : i+r ≤ d+2) :
 0 < betaGroupMCA9 d i r m := by
 have hmass : 0 < ∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k := by
   simp_rw [stein_pair_cutM208]; exact beta_pair_mass_positiveMCA9 d i r m hmr
 have hL : (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   steinLM208 ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k) ≤ 0 := by
   rw [stein_cut_partsM208]; exact neg_nonpos.mpr (stein_energy_nonnegM208 d i r m)
 have hHR : 6*((i:ℝ)+1)+m+8 ≤ 2*((d:ℝ)+2*i+9) := by
   exact_mod_cast (show 6*(i+1)+m+8 ≤ 2*(d+2*i+9) by omega)
 have h := sixth_sum_positiveM97B ((i:ℝ)+1) ((d:ℝ)+2*i+9) m
   (fun k => steinPairM208 d i m k*steinCutM208 r m k)
   (by exact_mod_cast (show 7 ≤ i+1 by omega)) hm hHR hmass hL
   (sixth_generator_nonposM97B d i r m) (sixth_actual_controlM97B d i r m)
 have he : (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   steinScalarM208 ((i:ℝ)+1) ((d:ℝ)+2*i+9) k ((m:ℝ)-k))=betaGroupMCA9 d i r m := by
   unfold betaGroupMCA9; apply sum_congr rfl; intro k hk
   rw [stein_pair_cutM208,stein_scalar_castM208 d i m k (by have := mem_range.mp hk; omega)]
 rwa [he] at h

theorem sixth_tail_gap_positiveM97B (d i r : ℕ)
 (hi : 6 ≤ i) (hr : 1 ≤ r) (hd : i+r ≤ d+2) : 0 < tailGapMDCB i d r := by
 have hs : 0 < ∑ m ∈ range (2*r+1), betaGroupMCA9 d i r m := by
   apply sum_pos'
   · intro m hm
     by_cases hm2 : 2 ≤ m
     · exact (sixth_group_positiveM97B d i r m hi hm2 (by have := mem_range.mp hm; omega) hd).le
     · interval_cases m
       · rw [beta_group_zeroMCA9]
       · rw [beta_group_oneMCA9]
   · exact ⟨2,mem_range.mpr (by omega),sixth_group_positiveM97B d i r 2 hi le_rfl (by omega) hd⟩
 rw [beta_group_sum_identityMCA9] at hs
 have h : 0 < betaDensityGapMCA9 d i r := by linarith
 have hD : (0:ℝ) < tailDenMDCB i d r := by exact_mod_cast tail_den_positiveMDCB i d r
 have hp := mul_pos (sq_pos_of_pos hD) h
 rw [beta_gap_scaledMCA9] at hp
 exact_mod_cast hp

end
end MathGKM.Markov
