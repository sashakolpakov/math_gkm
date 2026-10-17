import MarkovTopBetaGroupingMCA9
/-! Machine-authored ca9709f2. Exact transport from the likelihood density
to the denominator-free raw-kernel gap. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

theorem beta_density_factorMCA9 (d i k : ℕ) :
 (tailDenMDCB i d k:ℝ)*((i+k).choose i:ℝ)*betaQSeqMDCB d i k=
 (tailNumMDCB i d k:ℝ) := by
 induction k with
 | zero => simp [tailDenMDCB,tailNumMDCB,betaQSeqMDCB]
 | succ k ih =>
   have hC : ((k:ℝ)+1)*((i+k+1).choose i:ℝ)=
     ((i:ℝ)+k+1)*((i+k).choose i:ℝ) := by
     have h := Nat.choose_mul_succ_eq (i+k) i
     have he : i+k+1-i=k+1 := by omega
     rw [he] at h
     have hh : ((i+k).choose i:ℝ)*((i:ℝ)+k+1)=
       ((i+k+1).choose i:ℝ)*((k:ℝ)+1) := by exact_mod_cast h
     nlinarith only [hh]
   have hQ : (d:ℝ)+i+k+6 ≠ 0 := by positivity
   have hD : (tailDenMDCB i d (k+1):ℝ)=
     (tailDenMDCB i d k:ℝ)*((k:ℝ)+1)*((d:ℝ)+i+k+6) := by
     simp only [tailDenMDCB,prod_range_succ]
     push_cast
     ring
   have hN : (tailNumMDCB i d (k+1):ℝ)=
     (tailNumMDCB i d k:ℝ)*((i:ℝ)+k+1)*((d:ℝ)+2*i+k+9) := by
     simp only [tailNumMDCB,prod_range_succ]
     push_cast
     ring
   rw [hD,hN,betaQSeqMDCB,show i+(k+1)=i+k+1 by omega]
   calc
    _ = (tailDenMDCB i d k:ℝ)*(((k:ℝ)+1)*((i+k+1).choose i:ℝ))*
      betaQSeqMDCB d i k*((d:ℝ)+2*i+k+9) := by field_simp <;> ring
    _ = _ := by rw [hC]; linear_combination ((i:ℝ)+k+1)*((d:ℝ)+2*i+k+9)*ih

theorem beta_term_factorMCA9 (d i r k : ℕ) (hk : k ≤ r) :
 (tailDenMDCB i d r:ℝ)*((i+k).choose i:ℝ)*betaQSeqMDCB d i k=
 (tailTermMDCB i d r k:ℝ) := by
 have h := beta_density_factorMCA9 d i k
 have hs : (tailDenMDCB i d k:ℝ)*(tailRestMDCB i d r k:ℝ)=
   (tailDenMDCB i d r:ℝ) := by exact_mod_cast tail_den_splitMDCB (i:ℤ) d r k hk
 unfold tailTermMDCB
 push_cast
 rw [←hs]
 linear_combination (tailRestMDCB i d r k:ℝ)*h

theorem beta_density_scaledMCA9 (d i r k : ℕ) (hk : k ≤ r) :
 (tailDenMDCB i d r:ℝ)*betaDensityMCA9 d i r k=
 betaWeightMDCB r k*(tailTermMDCB i d r k:ℝ) := by
 unfold betaDensityMCA9 betaLikelihoodMDCB
 linear_combination betaWeightMDCB r k*beta_term_factorMCA9 d i r k hk

theorem beta_linear_castMCA9 (r : ℕ) (f : ℕ → ℤ) :
 (topLinearM55C r f:ℝ)=∑ k ∈ range (r+1), betaWeightMDCB r k*(f k:ℝ) := by
 rw [sum_range_succ]
 simp only [betaWeightMDCB,if_pos rfl,one_mul]
 unfold topLinearM55C
 push_cast
 have hh : (∑ k ∈ range r, (if k=r then 1 else if k<r then 4*((r:ℝ)-k) else 0)*(f k:ℝ))=
   4*∑ k ∈ range r, ((r:ℝ)-k)*(f k:ℝ) := by
   rw [mul_sum]
   apply sum_congr rfl
   intro k hk
   have hkr := mem_range.mp hk
   rw [if_neg (by omega : k≠r),if_pos hkr]
   ring
 rw [hh]
 ring

theorem beta_sums_scaledMCA9 (d i r : ℕ) :
 (tailDenMDCB i d r:ℝ)*betaSumAMCA9 d i r=(tailAMDCB i d r:ℝ) ∧
 (tailDenMDCB i d r:ℝ)*betaSumEMCA9 d i r=(tailEMDCB i d r:ℝ) ∧
 (tailDenMDCB i d r:ℝ)*betaSumCMCA9 d i r=(tailCMDCB i d r:ℝ) := by
 constructor
 · unfold betaSumAMCA9 tailAMDCB
   rw [mul_sum,beta_linear_castMCA9]
   apply sum_congr rfl
   intro k hk
   exact beta_density_scaledMCA9 d i r k (by have := mem_range.mp hk; omega)
 constructor
 · unfold betaSumEMCA9 tailEMDCB
   rw [mul_sum,beta_linear_castMCA9]
   apply sum_congr rfl
   intro k hk
   have h := beta_density_scaledMCA9 d i r k (by have := mem_range.mp hk; omega)
   push_cast
   linear_combination (k:ℝ)*((d:ℝ)+2*i+k+9)*h
 · unfold betaSumCMCA9 tailCMDCB
   rw [mul_sum,beta_linear_castMCA9]
   apply sum_congr rfl
   intro k hk
   have h := beta_density_scaledMCA9 d i r k (by have := mem_range.mp hk; omega)
   push_cast
   linear_combination (k:ℝ)*(k-1)*((d:ℝ)+2*i+k+9)*((d:ℝ)+2*i+k+10)*h

theorem beta_gap_scaledMCA9 (d i r : ℕ) :
 (tailDenMDCB i d r:ℝ)^2*betaDensityGapMCA9 d i r=(tailGapMDCB i d r:ℝ) := by
 obtain ⟨hA,hE,hC⟩ := beta_sums_scaledMCA9 d i r
 unfold betaDensityGapMCA9 tailGapMDCB
 push_cast
 calc
  _ = ((i:ℝ)+2)*(i+5)*((tailDenMDCB i d r:ℝ)*betaSumEMCA9 d i r)^2-
    ((i:ℝ)+1)*(i+4)*((tailDenMDCB i d r:ℝ)*betaSumAMCA9 d i r)*
      ((tailDenMDCB i d r:ℝ)*betaSumCMCA9 d i r) := by ring
  _ = _ := by rw [hA,hE,hC]

theorem tail_gap_linear_positiveMCA9 (d i r : ℕ)
 (hd : i+4*r ≤ d+1) (hr : 1 ≤ r) : 0 < tailGapMDCB i d r := by
 have h := beta_density_gap_positiveMCA9 d i r hd hr
 have hD : (0:ℝ) < tailDenMDCB i d r := by exact_mod_cast tail_den_positiveMDCB i d r
 have hp := mul_pos (sq_pos_of_pos hD) h
 rw [beta_gap_scaledMCA9] at hp
 exact_mod_cast hp

theorem top_mass_linear_strictMCA9 (d i r : ℕ)
 (hd : i+4*r ≤ d+1) (hr : 1 ≤ r) :
 topMassM55C d (i+r) i*topMassM55C d (i+r) (i+2) < topMassM55C d (i+r) (i+1)^2 :=
 (tail_strict_iffMDCB d i r).mpr (tail_gap_linear_positiveMCA9 d i r hd hr)

end
end MathGKM.Markov
