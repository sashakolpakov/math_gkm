import MarkovShiftMomentsME10
/-! Machine-authored e108e0e2. Shifted actual-weight identities. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
def topDeficitME10 (d T i j : ℕ) : ℤ :=
 topLinearM55C T (fun s => topKernelME10 d i s*((T:ℤ)-s)^j)


theorem deficit_covarianceME10 (d T i j : ℕ) :
 (∑ s ∈ range (T+1),baseWeightM41B T i s)*topDeficitME10 d T i j ≤
 (∑ s ∈ range (T+1),baseWeightM41B T i s*((T:ℤ)-s)^j)*topMassME10 d T i := by
 let f : ℕ → ℤ := fun s => ((T:ℤ)-s)^j
 let g : ℕ → ℤ := fun s => ((d+s+i+4).choose (i+3):ℤ)
 have hg : Monotone g := by
   intro s t hst
   dsimp [g]
   exact_mod_cast Nat.choose_le_choose (i+3) (by omega : d+s+i+4 ≤ d+t+i+4)
 have hf (s t : ℕ) (hs : s ≤ T) (ht : t ≤ T) (hst : s ≤ t) : f t ≤ f s := by
   dsimp [f]
   have hnon : (0:ℤ) ≤ T-t := by omega
   exact pow_le_pow_left₀ hnon (by omega) j
 have h := weighted_antitoneM41B (range (T+1)) (baseWeightM41B T i) f g
   (fun s hs => base_weight_nonnegM41B T i s (by simpa using hs)) (by
     intro s hs t ht
     have hs' : s ≤ T := by simpa using hs
     have ht' : t ≤ T := by simpa using ht
     rcases le_total s t with hst|hts
     · exact mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr (hf s t hs' ht' hst)) (sub_nonpos.mpr (hg hst))
     · exact mul_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr (hf t s ht' hs' hts)) (sub_nonneg.mpr (hg hts)))
 have he : (∑ s ∈ range (T+1),baseWeightM41B T i s*f s*g s)=topDeficitME10 d T i j := by
   simp_rw [mul_assoc]
   rw [base_weight_sumM41B]
   unfold topDeficitME10 topKernelME10
   congr 1
   funext s
   dsimp [f,g]
   ring
 have he' : (∑ s ∈ range (T+1),baseWeightM41B T i s*g s)=topMassME10 d T i := by
   rw [base_weight_sumM41B]
   rfl
 rw [he,he'] at h
 exact h


theorem actual_deficit_secondME10 (d T i : ℕ) (hi : i ≤ T) :
 ((i:ℤ)+3)*((i:ℤ)+4)*topDeficitME10 d T i 2 ≤
 (6*(T:ℤ)^2-6*T*i+(i:ℤ)^2+6*T-5*i)*topMassME10 d T i := by
 have hb := base_mass_positiveM41B T i hi
 have hc := deficit_covarianceME10 d T i 2
 rw [base_deficitM41B _ _ _ (by omega)] at hc
 norm_num only [Nat.reduceSub] at hc
 have he := binomial_deficit_second_exactM41B T i
 have hm := base_weight_sumM41B T i (fun _ => 1)
 simp only [mul_one] at hm
 rw [top_linear_chooseMEB6,←binomial_deficit_zeroM41B] at hm
 have hn : 0 ≤ 6*(T:ℤ)^2-6*T*i+(i:ℤ)^2+6*T-5*i := by
   have h : 0 ≤ (T:ℤ)-i := by omega
   nlinarith [sq_nonneg ((T:ℤ)-i),mul_nonneg (show (0:ℤ) ≤ i by positivity) h]
 have hs : ((i:ℤ)+3)*((i:ℤ)+4)*(4*binomialDeficitM41B T i 2) ≤
   (6*(T:ℤ)^2-6*T*i+(i:ℤ)^2+6*T-5*i)*(∑ s ∈ range (T+1),baseWeightM41B T i s) := by
   rw [hm]
   have hz := mul_nonneg hn (show (0:ℤ) ≤ T.choose i by positivity)
   nlinarith only [he,hz]
 have h1 := mul_le_mul_of_nonneg_left hc (by positivity : (0:ℤ) ≤ ((i:ℤ)+3)*(i+4))
 have h2 := mul_le_mul_of_nonneg_right hs (top_shift_nonnegME10 d T i)
 have h3 : (∑ s ∈ range (T+1),baseWeightM41B T i s)*
   (((i:ℤ)+3)*((i:ℤ)+4)*topDeficitME10 d T i 2) ≤
   (∑ s ∈ range (T+1),baseWeightM41B T i s)*
   ((6*(T:ℤ)^2-6*T*i+(i:ℤ)^2+6*T-5*i)*topMassME10 d T i) := by
   nlinarith only [h1,h2]
 exact le_of_mul_le_mul_left h3 hb


def topCenteredME10 (d T i : ℕ) : ℤ :=
 topLinearM55C T (fun s => (topEigenME10 d T-topEigenME10 d s)^2*topKernelME10 d i s)


theorem top_centered_identityME10 (d T i : ℕ) :
 topCenteredME10 d T i=topEigenME10 d T^2*topMassME10 d T i-
 2*topEigenME10 d T*topMomentME10 d T i 1+topMomentME10 d T i 2 := by
 have he : (fun s => (topEigenME10 d T-topEigenME10 d s)^2*topKernelME10 d i s)=
   (fun s => topEigenME10 d T^2*topKernelME10 d i s-
   (2*topEigenME10 d T)*(topEigenME10 d s^1*topKernelME10 d i s)+
   topEigenME10 d s^2*topKernelME10 d i s) := by funext s; ring
 rw [topCenteredME10,he,top_linear_addM55C,top_linear_subM55C,
   top_linear_smulM55C,top_linear_smulM55C]
 rfl


theorem top_centered_boundME10 (d T i : ℕ) :
 topCenteredME10 d T i ≤ (2*(T:ℤ)+d+5)^2*topDeficitME10 d T i 2 := by
 rw [topCenteredME10,topDeficitME10,←top_linear_smulM55C]
 apply top_linear_monoM41B
 intro s hs
 have ht : (0:ℤ) ≤ T-s := by omega
 have hq : (0:ℤ) ≤ (T:ℤ)+s+d+5 := by positivity
 have hsq : ((T:ℤ)+s+d+5)^2 ≤ (2*(T:ℤ)+d+5)^2 := by
   apply (sq_le_sq₀ hq (by positivity)).mpr
   omega
 have hh := mul_le_mul_of_nonneg_right hsq
   (mul_nonneg (sq_nonneg ((T:ℤ)-s)) (top_kernel_nonnegME10 d i s))
 unfold topEigenME10
 nlinarith only [hh]


theorem top_variance_centeredME10 (d T i : ℕ) :
 topVarianceNumerME10 d T i+
 ((topEigenME10 d T-topEigenME10 d i)*topMassME10 d T i-topExcessME10 d T i)^2 ≤
 (2*(T:ℤ)+d+5)^2*topMassME10 d T i*topDeficitME10 d T i 2 := by
 have h := mul_le_mul_of_nonneg_left (top_centered_boundME10 d T i)
   (top_shift_nonnegME10 d T i)
 rw [top_centered_identityME10] at h
 unfold topVarianceNumerME10 topExcessME10
 nlinarith only [h]



end
end MathGKM.Markov
