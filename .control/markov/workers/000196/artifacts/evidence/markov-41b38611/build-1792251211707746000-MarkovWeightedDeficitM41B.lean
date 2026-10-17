import MarkovBinomialDeficitM41B
/-! Machine-authored 41b38611. Weighted antitone comparison and exact
attachment of deficit moment bounds to the actual template weights. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

theorem weighted_antitoneM41B (S : Finset ℕ) (w f g : ℕ → ℤ)
 (hw : ∀ s ∈ S, 0 ≤ w s)
 (hfg : ∀ s ∈ S, ∀ t ∈ S, (f s-f t)*(g s-g t) ≤ 0) :
 (∑ s ∈ S,w s)*(∑ s ∈ S,w s*f s*g s) ≤
 (∑ s ∈ S,w s*f s)*(∑ s ∈ S,w s*g s) := by
 have hh : (∑ s ∈ S, ∑ t ∈ S,w s*w t*((f s-f t)*(g s-g t))) ≤ 0 := by
   apply sum_nonpos; intro s hs
   apply sum_nonpos; intro t ht
   exact mul_nonpos_of_nonneg_of_nonpos (mul_nonneg (hw s hs) (hw t ht)) (hfg s hs t ht)
 have he : (∑ s ∈ S, ∑ t ∈ S,w s*w t*((f s-f t)*(g s-g t)))=
   2*((∑ s ∈ S,w s)*(∑ s ∈ S,w s*f s*g s)-
   (∑ s ∈ S,w s*f s)*(∑ s ∈ S,w s*g s)) := by
   calc
    _ = ∑ s ∈ S, ∑ t ∈ S,
      ((w s*f s*g s)*w t+w s*(w t*f t*g t)-(w s*f s)*(w t*g t)-(w s*g s)*(w t*f t)) := by
       apply sum_congr rfl; intro s hs
       apply sum_congr rfl; intro t ht; ring
    _ = _ := by simp only [sum_sub_distrib,sum_add_distrib,←mul_sum,←sum_mul]; ring
 rw [he] at hh
 linarith

def baseWeightM41B (T i s : ℕ) : ℤ :=
 (if s=T then 1 else 4*((T:ℤ)-s))*(s.choose i:ℤ)

theorem base_weight_nonnegM41B (T i s : ℕ) (hs : s ≤ T) :
 0 ≤ baseWeightM41B T i s := by
 unfold baseWeightM41B
 split_ifs <;> have : (s:ℤ) ≤ T := by exact_mod_cast hs
 all_goals positivity

theorem base_weight_sumM41B (T i : ℕ) (f : ℕ → ℤ) :
 (∑ s ∈ range (T+1),baseWeightM41B T i s*f s)=
 topLinearM55C T (fun s => (s.choose i:ℤ)*f s) := by
 rw [sum_range_succ]
 unfold topLinearM55C
 have he : (∑ s ∈ range T,baseWeightM41B T i s*f s)=
   4*∑ s ∈ range T,((T:ℤ)-s)*((s.choose i:ℤ)*f s) := by
   rw [mul_sum]
   apply sum_congr rfl
   intro s hs
   have hst : s ≠ T := by have := mem_range.mp hs; omega
   simp only [baseWeightM41B,if_neg hst]
   ring
 rw [he]
 simp only [baseWeightM41B,if_pos rfl,one_mul]
 ring

def topDeficitM41B (d T i j : ℕ) : ℤ :=
 topLinearM55C T (fun s => topKernelM55C d i s*((T:ℤ)-s)^j)

theorem base_mass_positiveM41B (T i : ℕ) (hi : i ≤ T) :
 0 < ∑ s ∈ range (T+1),baseWeightM41B T i s := by
 have h := base_weight_sumM41B T i (fun _ => 1)
 simp only [mul_one] at h
 rw [h,top_linear_chooseMEB6]
 have hp : (0:ℤ) < T.choose i := by exact_mod_cast Nat.choose_pos hi
 positivity

theorem deficit_covarianceM41B (d T i j : ℕ) :
 (∑ s ∈ range (T+1),baseWeightM41B T i s)*topDeficitM41B d T i j ≤
 (∑ s ∈ range (T+1),baseWeightM41B T i s*((T:ℤ)-s)^j)*topMassM55C d T i := by
 let f : ℕ → ℤ := fun s => ((T:ℤ)-s)^j
 let g : ℕ → ℤ := fun s => ((d+s+i+8).choose (i+3):ℤ)
 have hg : Monotone g := by
   intro s t hst
   exact_mod_cast Nat.choose_le_choose (i+3) (by omega : d+s+i+8 ≤ d+t+i+8)
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
 have he : (∑ s ∈ range (T+1),baseWeightM41B T i s*f s*g s)=topDeficitM41B d T i j := by
   simp_rw [mul_assoc]
   rw [base_weight_sumM41B]
   unfold topDeficitM41B topKernelM55C
   congr 1
   funext s
   dsimp [f,g]
   ring
 have he' : (∑ s ∈ range (T+1),baseWeightM41B T i s*g s)=topMassM55C d T i := by
   rw [base_weight_sumM41B]
   rfl
 rw [he,he'] at h
 exact h

theorem base_deficitM41B (T i j : ℕ) (hj : 1 ≤ j) :
 (∑ s ∈ range (T+1),baseWeightM41B T i s*((T:ℤ)-s)^j)=
 4*binomialDeficitM41B T i j := by
 rw [base_weight_sumM41B,topLinearM55C]
 simp only [sub_self,zero_pow (by omega : j≠0),mul_zero,zero_add]
 unfold binomialDeficitM41B
 congr 1
 apply sum_congr rfl
 intro s hs
 rw [pow_succ]
 ring

theorem actual_deficit_firstM41B (d T i : ℕ) (hi : i ≤ T) :
 ((i:ℤ)+3)*topDeficitM41B d T i 1 ≤ (2*(T:ℤ)-i+1)*topMassM55C d T i := by
 have hb := base_mass_positiveM41B T i hi
 have hc := deficit_covarianceM41B d T i 1
 rw [base_deficitM41B _ _ _ (by omega)] at hc
 norm_num only [Nat.reduceSub] at hc
 have he := binomial_deficit_first_exactM41B T i
 have hm := base_weight_sumM41B T i (fun _ => 1)
 simp only [mul_one] at hm
 rw [top_linear_chooseMEB6,←binomial_deficit_zeroM41B] at hm
 have hn : 0 ≤ 2*(T:ℤ)-i+1 := by omega
 have hs : ((i:ℤ)+3)*(4*binomialDeficitM41B T i 1) ≤
   (2*(T:ℤ)-i+1)*(∑ s ∈ range (T+1),baseWeightM41B T i s) := by
   rw [hm]
   have hz : (0:ℤ) ≤ T.choose i := by positivity
   nlinarith
 have h1 := mul_le_mul_of_nonneg_left hc (by positivity : (0:ℤ) ≤ i+3)
 have h2 := mul_le_mul_of_nonneg_right hs (top_mass_nonnegM55C d T i)
 have h3 : (∑ s ∈ range (T+1),baseWeightM41B T i s)*
   (((i:ℤ)+3)*topDeficitM41B d T i 1) ≤
   (∑ s ∈ range (T+1),baseWeightM41B T i s)*((2*(T:ℤ)-i+1)*topMassM55C d T i) := by
   nlinarith only [h1,h2]
 exact le_of_mul_le_mul_left h3 hb

theorem actual_deficit_secondM41B (d T i : ℕ) (hi : i ≤ T) :
 ((i:ℤ)+3)*((i:ℤ)+4)*topDeficitM41B d T i 2 ≤
 (6*(T:ℤ)^2-6*T*i+(i:ℤ)^2+6*T-5*i)*topMassM55C d T i := by
 have hb := base_mass_positiveM41B T i hi
 have hc := deficit_covarianceM41B d T i 2
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
 have h2 := mul_le_mul_of_nonneg_right hs (top_mass_nonnegM55C d T i)
 have h3 : (∑ s ∈ range (T+1),baseWeightM41B T i s)*
   (((i:ℤ)+3)*((i:ℤ)+4)*topDeficitM41B d T i 2) ≤
   (∑ s ∈ range (T+1),baseWeightM41B T i s)*
   ((6*(T:ℤ)^2-6*T*i+(i:ℤ)^2+6*T-5*i)*topMassM55C d T i) := by
   nlinarith only [h1,h2]
 exact le_of_mul_le_mul_left h3 hb

end
end MathGKM.Markov
