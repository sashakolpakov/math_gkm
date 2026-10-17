import MarkovTopBetaComparisonMCA9
/-! Machine-authored 20825094. Uniform lower bound for beta-binomial mass
by its endpoint mass. Every zero/index position is kept. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 9000000

theorem beta_choose_stepM208 (i k : ℕ) :
 ((k:ℝ)+1)*((i+k+1).choose i:ℝ)=((i:ℝ)+k+1)*((i+k).choose i:ℝ) := by
 have h := Nat.choose_mul_succ_eq (i+k) i
 rw [show i+k+1-i=k+1 by omega] at h
 have hh : ((i+k).choose i:ℝ)*((i:ℝ)+k+1)=
   ((i+k+1).choose i:ℝ)*((k:ℝ)+1) := by exact_mod_cast h
 nlinarith only [hh]

theorem beta_base_symmetricM208 (i m k : ℕ) (hk : k ≤ m) :
 betaBaseWeightMCA9 i m (m-k)=betaBaseWeightMCA9 i m k := by
 unfold betaBaseWeightMCA9
 rw [Nat.sub_sub_self hk,mul_comm]

theorem beta_base_inwardM208 (i m k : ℕ) (hk : 2*k+1 ≤ m) :
 betaBaseWeightMCA9 i m k ≤ betaBaseWeightMCA9 i m (k+1) := by
 have h0 := beta_choose_stepM208 i k
 have h1 := beta_choose_stepM208 i (m-(k+1))
 rw [show i+(m-(k+1))+1=i+(m-k) by omega] at h1
 rw [Nat.cast_sub (by omega : k+1 ≤ m)] at h1
 push_cast at h1
 have he : ((k:ℝ)+1)*((i:ℝ)+m-k)*
   (betaBaseWeightMCA9 i m (k+1)-betaBaseWeightMCA9 i m k)=
   (i:ℝ)*((m:ℝ)-2*k-1)*betaBaseWeightMCA9 i m k := by
   unfold betaBaseWeightMCA9
   rw [show i+(k+1)=i+k+1 by omega]
   linear_combination ((i:ℝ)+m-k)*((i+(m-(k+1))).choose i:ℝ)*h0-
     ((i:ℝ)+k+1)*((i+k).choose i:ℝ)*h1
 have hR : 0 ≤ (m:ℝ)-2*k-1 := by exact_mod_cast (show 0 ≤ (m:ℤ)-2*k-1 by omega)
 have hp : 0 ≤ (i:ℝ)*((m:ℝ)-2*k-1)*betaBaseWeightMCA9 i m k :=
   mul_nonneg (mul_nonneg (by positivity) hR) (beta_base_weight_positiveMCA9 i m k).le
 rw [←he] at hp
 have hden : 0 < ((k:ℝ)+1)*((i:ℝ)+m-k) := by
   have hmR : (k:ℝ) < m := by exact_mod_cast (show k < m by omega)
   have hiR : (0:ℝ) ≤ i := by positivity
   exact mul_pos (by positivity) (by linarith)
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hden).mp hp)

theorem beta_base_endpoint_lowerM208 (i m k : ℕ) (hk : k ≤ m) :
 betaBaseWeightMCA9 i m 0 ≤ betaBaseWeightMCA9 i m k := by
 apply inward_orderMCA9 m (betaBaseWeightMCA9 i m)
   (beta_base_symmetricM208 i m) (beta_base_inwardM208 i m) 0 k (by omega) hk
 simp

theorem beta_mass_endpoint_lowerM208 (i m : ℕ) :
 ((m:ℝ)+1)*betaBaseWeightMCA9 i m 0 ≤ ∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k := by
 have h := sum_le_sum (s:=range (m+1)) (fun k hk =>
   beta_base_endpoint_lowerM208 i m k (by have := mem_range.mp hk; omega))
 simpa using h

end
end MathGKM.Markov
