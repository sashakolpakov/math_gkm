import MarkovTopFourthMomentConditionalM731
/-! Machine-authored live 97b019af. Exact beta-binomial fourth central moment,
including totals below four. No asymptotic or probabilistic assumption. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

def fourthBetaIntM97B (i m : ℕ) : ℤ :=
 ∑ k ∈ range (m+1), ((i+k).choose i:ℤ)*((i+(m-k)).choose i:ℤ)*(2*(k:ℤ)-m)^4

theorem fourth_beta_expansionM97B (i m : ℕ) :
 fourthBetaIntM97B i m=(m:ℤ)^4*betaMomentMDCB i m 0 0+
 (16*(m:ℤ)-16-8*(m:ℤ)^2)*betaMomentMDCB i m 1 1+16*betaMomentMDCB i m 2 2 := by
 unfold fourthBetaIntM97B betaMomentMDCB
 simp only [mul_sum,←sum_add_distrib,Nat.descFactorial_zero,Nat.descFactorial_one,
   Nat.cast_one,mul_one,Nat.cast_descFactorial_two]
 apply sum_congr rfl
 intro k hk
 rw [Nat.cast_sub (by have := mem_range.mp hk; omega : k ≤ m)]
 ring

theorem fourth_beta_integerM97B (i m : ℕ) :
 (2*(i:ℤ)+3)*(2*i+5)*fourthBetaIntM97B i m=
 (m:ℤ)*(2*((i:ℤ)+1)+m)*(3*(m:ℤ)*(2*((i:ℤ)+1)+m)-4*((i:ℤ)+1))*
 betaMomentMDCB i m 0 0 := by
 have h11 := beta_moment_clearedMDCB i m 1 1
 have h22 := beta_moment_clearedMDCB i m 2 2
 have hf2 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.1
 have hf4 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.2
 norm_num only [show (1:ℕ)+1=2 by rfl,show (2:ℕ)+2=4 by rfl,
   hf2,hf4,Nat.descFactorial_one,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at h11 h22
 apply (mul_left_cancel₀ (by positivity : (4*((i:ℤ)+1)*(i+2))≠0))
 rw [fourth_beta_expansionM97B]
 linear_combination 16*h22+(16*(m:ℤ)-16-8*(m:ℤ)^2)*(2*(i:ℤ)+4)*(2*i+5)*h11

theorem fourth_beta_realM97B (i m : ℕ) :
 fourthMomentDenM731 ((i:ℝ)+1)*
 (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*((k:ℝ)-(m:ℝ)/2)^4)=
 fourthMomentNumM731 ((i:ℝ)+1) m*(∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k) := by
 have h := fourth_beta_integerM97B i m
 have hh : (2*(i:ℝ)+3)*(2*i+5)*(fourthBetaIntM97B i m:ℝ)=
   (m:ℝ)*(2*((i:ℝ)+1)+m)*(3*(m:ℝ)*(2*((i:ℝ)+1)+m)-4*((i:ℝ)+1))*
   (betaMomentMDCB i m 0 0:ℝ) := by exact_mod_cast h
 have he : (fourthBetaIntM97B i m:ℝ)=
   16*(∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*((k:ℝ)-(m:ℝ)/2)^4) := by
   unfold fourthBetaIntM97B betaBaseWeightMCA9
   push_cast
   rw [mul_sum]
   apply sum_congr rfl; intro k hk; ring
 have hm : (betaMomentMDCB i m 0 0:ℝ)=∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k := by
   simp [betaMomentMDCB,betaBaseWeightMCA9]
 rw [he,hm] at hh
 unfold fourthMomentDenM731 fourthMomentNumM731
 linear_combination hh

end
end MathGKM.Markov
