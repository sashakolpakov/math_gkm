import MarkovTopFourthControlM97B
/-! Machine-authored 97b019af. Exact sixth central moment with all totals retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 14000000
def sixthMomentDenM97B (a : ℝ) : ℝ := 64*(2*a+1)*(2*a+3)*(2*a+5)
def sixthMomentNumM97B (a m : ℝ) : ℝ :=
 15*m^6+16*a*m^2-60*a*m^4+90*a*m^5+32*a^2*m+64*a^2*m^2-
 240*a^2*m^3+180*a^2*m^4+128*a^3*m-240*a^3*m^2+120*a^3*m^3
def sixthBetaIntM97B (i m : ℕ) : ℤ :=
 ∑ k ∈ range (m+1), ((i+k).choose i:ℤ)*((i+(m-k)).choose i:ℤ)*(2*(k:ℤ)-m)^6

theorem sixth_beta_expansionM97B (i m : ℕ) :
 sixthBetaIntM97B i m=(m:ℤ)^6*betaMomentMDCB i m 0 0+
 (-12*(m:ℤ)^4+48*(m:ℤ)^2*(m-1)-64*((m:ℤ)-1)^2)*betaMomentMDCB i m 1 1+
 (48*(m:ℤ)^2-64*(3*(m:ℤ)-5))*betaMomentMDCB i m 2 2-64*betaMomentMDCB i m 3 3 := by
 unfold sixthBetaIntM97B betaMomentMDCB
 have hf2 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.1
 have hf3 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.1
 simp only [mul_sum,←sum_add_distrib,←sum_sub_distrib,Nat.descFactorial_zero,
   Nat.descFactorial_one,Nat.cast_one,mul_one,hf2,hf3]
 apply sum_congr rfl; intro k hk
 rw [Nat.cast_sub (by have := mem_range.mp hk; omega : k ≤ m)]
 ring

theorem sixth_beta_realM97B (i m : ℕ) :
 sixthMomentDenM97B ((i:ℝ)+1)*
 (∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*((k:ℝ)-(m:ℝ)/2)^6)=
 sixthMomentNumM97B ((i:ℝ)+1) m*(∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k) := by
 have h11 := beta_moment_clearedMDCB i m 1 1
 have h22 := beta_moment_clearedMDCB i m 2 2
 have h33 := beta_moment_clearedMDCB i m 3 3
 have hf2 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.1
 have hf3 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.1
 have hf4 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.2
 norm_num only [show (1:ℕ)+1=2 by rfl,show (2:ℕ)+2=4 by rfl,show (3:ℕ)+3=6 by rfl,
   hf2,hf3,hf4,beta_fall_6MCA9,Nat.descFactorial_one,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at h11 h22 h33
 have he : (2*(i:ℤ)+3)*(2*i+5)*(2*i+7)*sixthBetaIntM97B i m=
   (15*(m:ℤ)^6+16*((i:ℤ)+1)*m^2-60*((i:ℤ)+1)*m^4+90*((i:ℤ)+1)*m^5+
    32*((i:ℤ)+1)^2*m+64*((i:ℤ)+1)^2*m^2-240*((i:ℤ)+1)^2*m^3+
    180*((i:ℤ)+1)^2*m^4+128*((i:ℤ)+1)^3*m-240*((i:ℤ)+1)^3*m^2+
    120*((i:ℤ)+1)^3*m^3)*betaMomentMDCB i m 0 0 := by
   apply (mul_left_cancel₀ (by positivity : (8*((i:ℤ)+1)*(i+2)*(i+3))≠0))
   rw [sixth_beta_expansionM97B]
   linear_combination -64*h33+
     (48*(m:ℤ)^2-64*(3*(m:ℤ)-5))*(2*(i:ℤ)+6)*(2*i+7)*h22+
     (-12*(m:ℤ)^4+48*(m:ℤ)^2*(m-1)-64*((m:ℤ)-1)^2)*
       (2*(i:ℤ)+4)*(2*i+5)*(2*i+6)*(2*i+7)*h11
 have hh : (2*(i:ℝ)+3)*(2*i+5)*(2*i+7)*(sixthBetaIntM97B i m:ℝ)=
   sixthMomentNumM97B ((i:ℝ)+1) m*(betaMomentMDCB i m 0 0:ℝ) := by
   unfold sixthMomentNumM97B
   exact_mod_cast he
 have hs : (sixthBetaIntM97B i m:ℝ)=
   64*(∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k*((k:ℝ)-(m:ℝ)/2)^6) := by
   unfold sixthBetaIntM97B betaBaseWeightMCA9
   push_cast
   rw [mul_sum]; apply sum_congr rfl; intro k hk; ring
 have hm : (betaMomentMDCB i m 0 0:ℝ)=∑ k ∈ range (m+1), betaBaseWeightMCA9 i m k := by
   simp [betaMomentMDCB,betaBaseWeightMCA9]
 rw [hs,hm] at hh
 unfold sixthMomentDenM97B
 linear_combination hh

end
end MathGKM.Markov
