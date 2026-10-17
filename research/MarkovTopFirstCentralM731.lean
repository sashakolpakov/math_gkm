import MarkovTopBetaMassLowerM208
import MarkovTopFirstCentralMarginM731
import MarkovTopSteinGroupsM208
import MarkovTopLowerGroupsMCA9
/-! Machine-authored 73199834, completing the inherited draft. The first central antidiagonal m=r,
including both modified endpoint weights, throughout the full sector. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 14000000

def firstCentralBaseM731 (d i r : ℕ) : ℝ :=
 ∑ k ∈ range (r+1), betaBaseWeightMCA9 i r k*steinCutM208 r r k*betaGroupScalarMCA9 d i r k

theorem first_central_base_identityM731 (d i r : ℕ) (hr : 1 ≤ r) :
 firstCentralBaseM731 d i r=
 16*(betaWeightedSumMCA9 i r r ((d:ℤ)+2*i+9):ℝ)+
 8*r*betaBaseWeightMCA9 i r 0*betaGroupScalarMCA9 d i r 0 := by
 have he (k : ℕ) (hk : k ≤ r) :
   betaBaseWeightMCA9 i r k*steinCutM208 r r k*betaGroupScalarMCA9 d i r k=
   16*(betaBaseWeightMCA9 i r k*(k:ℝ)*((r:ℝ)-k)*betaGroupScalarMCA9 d i r k)+
   (if k=0 then 4*r*betaBaseWeightMCA9 i r 0*betaGroupScalarMCA9 d i r 0 else 0)+
   (if k=r then 4*r*betaBaseWeightMCA9 i r 0*betaGroupScalarMCA9 d i r 0 else 0) := by
   by_cases hk0 : k=0
   · subst k
     simp [steinCutM208,betaWeightMDCB,show r≠0 by omega,show (0:ℕ)≠r by omega,
       show 0<r by omega]
     <;> ring_nf <;> simp
   by_cases hkr : k=r
   · subst k
     have hW := beta_base_symmetricM208 i r 0 (by omega)
     have hF := beta_group_scalar_symmetricMCA9 d i r 0 (by omega)
     simp only [Nat.sub_zero] at hW hF
     simp [steinCutM208,betaWeightMDCB,show r≠0 by omega,show (0:ℕ)≠r by omega,
       show 0<r by omega,hW,hF]
     <;> ring_nf <;> simp
   · have h0 : r-k≠r := by omega
     have h1 : r-k≠0 := by omega
     have hklt : k<r := by omega
     have hllt : r-k<r := by omega
     simp only [steinCutM208,betaWeightMDCB,if_neg hkr,if_pos hklt,
       if_neg h1,if_neg h0,if_pos hllt,if_neg hk0,Nat.sub_self]
     rw [Nat.cast_sub hk]
     ring
 have hs := sum_congr (s₁:=range (r+1)) rfl (fun k hk => he k (by have := mem_range.mp hk; omega))
 unfold firstCentralBaseM731
 rw [hs]
 simp only [sum_add_distrib,←mul_sum]
 have hp : (∑ k ∈ range (r+1), betaBaseWeightMCA9 i r k*(k:ℝ)*((r:ℝ)-k)*
     betaGroupScalarMCA9 d i r k)=(betaWeightedSumMCA9 i r r ((d:ℤ)+2*i+9):ℝ) := by
   unfold betaWeightedSumMCA9 betaBaseWeightMCA9 betaGroupScalarMCA9
   push_cast
   apply sum_congr rfl
   intro k hk
   simp only [Nat.cast_sub (by have := mem_range.mp hk; omega : k ≤ r)]
   ring
 rw [hp]
 simp only [sum_ite_eq',mem_range,show 0<r+1 by omega,show r<r+1 by omega,if_true]
 ring

theorem first_central_base_positiveM731 (d i r : ℕ)
 (hi : 1 ≤ i) (hr : 5 ≤ r) (hd : i+r ≤ d+2) : 0 < firstCentralBaseM731 d i r := by
 let a : ℤ := i+1
 let H : ℤ := d+2*i+9
 let D : ℝ := firstCentralDenM731 a
 let N : ℝ := firstCentralMeanM731 a r H
 let F : ℝ := betaScalarMCA9 a H 0 r
 let W : ℝ := betaBaseWeightMCA9 i r 0
 let M : ℝ := betaMomentMDCB i r 0 0
 have hD : 0 < D := by dsimp [D,firstCentralDenM731,a];push_cast;positivity
 have hW : 0 < W := beta_base_weight_positiveMCA9 i r 0
 have hmargin : 0 < 2*N*((r:ℝ)+1)+(r:ℝ)*F*D := by
   have h := first_central_margin_positiveM731 a r H (by dsimp [a];omega)
     (by exact_mod_cast hr) (by dsimp [a,H];omega)
   dsimp [N,F,D]
   exact_mod_cast h
 have hF : F < 0 := by
   dsimp [F,betaScalarMCA9,a,H]
   push_cast
   have hr0 : (0:ℝ) < r := by exact_mod_cast (show 0<r by omega)
   have hr1 : (0:ℝ) < (r:ℝ)-1 := by exact_mod_cast (show (0:ℤ)<(r:ℤ)-1 by omega)
   have : (0:ℝ) < ((i:ℝ)+1)*((i:ℝ)+1+3)*((r:ℝ)*(r-1)*
       ((d:ℝ)+2*i+9+r)*((d:ℝ)+2*i+9+r+1)) := by positivity
   nlinarith only [this]
 have hN : 0 < N := by
   have hh := mul_neg_of_pos_of_neg (by exact_mod_cast (show 0<r by omega) : (0:ℝ)<r) hF
   have hh' := mul_neg_of_neg_of_pos hh hD
   nlinarith
 have hM : ((r:ℝ)+1)*W ≤ M := by
   have h := beta_mass_endpoint_lowerM208 i r
   dsimp [M,W]
   simpa [betaMomentMDCB,betaBaseWeightMCA9] using h
 have hsum : D*(betaWeightedSumMCA9 i r r H:ℝ)=N*M := by
   have h := beta_weighted_sum_clearedMCA9 i r r H
   dsimp [D,N,M,firstCentralDenM731,firstCentralMeanM731,a]
   exact_mod_cast h
 have hbase : D*firstCentralBaseM731 d i r=16*N*M+8*r*W*F*D := by
   rw [first_central_base_identityM731 d i r (by omega)]
   have hF0 : betaGroupScalarMCA9 d i r 0=F := by
     simp [betaGroupScalarMCA9,F,a,H]
   rw [hF0]
   dsimp [W] at *
   linear_combination 16*hsum
 have hbound := mul_le_mul_of_nonneg_left hM hN.le
 have hp := mul_pos (mul_pos (by norm_num : (0:ℝ)<8) hW) hmargin
 have : 0 < D*firstCentralBaseM731 d i r := by nlinarith [hbound,hbase,hp]
 exact (mul_pos_iff_of_pos_left hD).mp this

theorem beta_first_central_positiveM731 (d i r : ℕ)
 (hi : 1 ≤ i) (hr : 5 ≤ r) (hd : i+r ≤ d+2) : 0 < betaGroupMCA9 d i r r := by
 let w : ℕ → ℝ := fun k => betaBaseWeightMCA9 i r k*steinCutM208 r r k
 have hw (k : ℕ) (hk : k ≤ r) : 0 < w k := by
   exact mul_pos (beta_base_weight_positiveMCA9 i r k)
     (mul_pos (beta_weight_positiveMCA9 r k hk) (beta_weight_positiveMCA9 r (r-k) (by omega)))
 have hc := radial_covarianceMCA9 r w (betaQPairMCA9 d i r) (betaGroupScalarMCA9 d i r)
   (fun k hk => (hw k hk).le) (beta_q_pair_symmetricMCA9 d i r) (beta_q_pair_inwardMCA9 d i r)
   (beta_group_scalar_symmetricMCA9 d i r) (beta_group_scalar_inwardMCA9 d i r)
 have hM : 0 < ∑ k ∈ range (r+1), w k*betaQPairMCA9 d i r k := by
   apply sum_pos'
   · intro k hk
     exact (mul_pos (hw k (by have := mem_range.mp hk;omega))
       (mul_pos (beta_q_positiveMDCB d i k) (beta_q_positiveMDCB d i (r-k)))).le
   · refine ⟨0,mem_range.mpr (by omega),?_⟩
     exact mul_pos (hw 0 (by omega))
       (mul_pos (beta_q_positiveMDCB d i 0) (beta_q_positiveMDCB d i (r-0)))
 have hB : 0 < ∑ k ∈ range (r+1), w k*betaGroupScalarMCA9 d i r k :=
   first_central_base_positiveM731 d i r hi hr hd
 have he : (∑ k ∈ range (r+1), w k*betaQPairMCA9 d i r k*betaGroupScalarMCA9 d i r k)=
   betaGroupMCA9 d i r r := by
   unfold betaGroupMCA9
   apply sum_congr rfl;intro k hk
   dsimp [w,steinCutM208,betaQPairMCA9,betaPairLikelihoodMCA9,betaLikelihoodMDCB]
   ring
 rw [he] at hc
 have hp := (mul_pos hM hB).trans_le hc
 exact pos_of_mul_pos_right hp (sum_nonneg (fun k hk => (hw k (by have := mem_range.mp hk;omega)).le))

end
end MathGKM.Markov
