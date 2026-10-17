import MarkovTopBetaClearedMDCB
import MarkovTopBetaScalarMDCB
/-! Machine-authored ca9709f2. Exact doubled scalar beta-binomial expectation.
This is an auxiliary identity, with no source-family conclusion. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 12000000

def betaScalarMCA9 (a H k l : ℤ) : ℤ :=
 2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*
 (k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))

def betaBaseSumMCA9 (i m : ℕ) (H : ℤ) : ℤ :=
 ∑ k ∈ range (m+1), ((i+k).choose i:ℤ)*((i+(m-k)).choose i:ℤ)*
 betaScalarMCA9 ((i:ℤ)+1) H k ((m-k:ℕ):ℤ)

theorem beta_fall_smallMCA9 (k : ℕ) :
 (k.descFactorial 0:ℤ)=1 ∧ (k.descFactorial 1:ℤ)=k ∧
 (k.descFactorial 2:ℤ)=(k:ℤ)*(k-1) ∧
 (k.descFactorial 3:ℤ)=(k:ℤ)*(k-1)*(k-2) ∧
 (k.descFactorial 4:ℤ)=(k:ℤ)*(k-1)*(k-2)*(k-3) := by
 have hf (n : ℕ) := descPochhammer_eval_eq_descFactorial ℤ k n
 constructor
 · simp
 constructor
 · simp
 constructor
 · exact Nat.cast_descFactorial_two ℤ k
 constructor
 · rw [←hf 3]
   norm_num [show 3=2+1 by rfl,show 2=1+1 by rfl,descPochhammer_succ_eval]
 · rw [←hf 4]
   norm_num [show 4=3+1 by rfl,show 3=2+1 by rfl,show 2=1+1 by rfl,descPochhammer_succ_eval]

theorem beta_scalar_fallingMCA9 (a H : ℤ) (k l : ℕ) :
 betaScalarMCA9 a H k l=
 2*(a+1)*(a+4)*((k.descFactorial 2:ℤ)*(l.descFactorial 2:ℤ)+
 (H+1)*((k.descFactorial 2:ℤ)*l+(k:ℤ)*(l.descFactorial 2:ℤ))+
 (H+1)^2*(k:ℤ)*l)-a*(a+3)*
 ((k.descFactorial 4:ℤ)+(l.descFactorial 4:ℤ)+
 (2*H+6)*((k.descFactorial 3:ℤ)+(l.descFactorial 3:ℤ))+
 (H+2)*(H+3)*((k.descFactorial 2:ℤ)+(l.descFactorial 2:ℤ))) := by
 obtain ⟨_,_,h2,h3,h4⟩ := beta_fall_smallMCA9 k
 obtain ⟨_,_,g2,g3,g4⟩ := beta_fall_smallMCA9 l
 rw [h2,h3,h4,g2,g3,g4]
 unfold betaScalarMCA9
 ring

theorem beta_sum_momentsMCA9 (i m : ℕ) (H : ℤ) :
 betaBaseSumMCA9 i m H=
 2*((i:ℤ)+2)*(i+5)*(betaMomentMDCB i m 2 2+
 (H+1)*(betaMomentMDCB i m 2 1+betaMomentMDCB i m 1 2)+
 (H+1)^2*betaMomentMDCB i m 1 1)-((i:ℤ)+1)*(i+4)*
 (betaMomentMDCB i m 4 0+betaMomentMDCB i m 0 4+
 (2*H+6)*(betaMomentMDCB i m 3 0+betaMomentMDCB i m 0 3)+
 (H+2)*(H+3)*(betaMomentMDCB i m 2 0+betaMomentMDCB i m 0 2)) := by
 unfold betaBaseSumMCA9 betaMomentMDCB
 simp only [mul_add,mul_sub,Finset.mul_sum,←sum_add_distrib,←sum_sub_distrib]
 apply sum_congr rfl
 intro k hk
 rw [beta_scalar_fallingMCA9]
 simp only [Nat.descFactorial_zero,Nat.descFactorial_one,Nat.cast_one]
 ring

theorem beta_base_clearedMCA9 (i m : ℕ) (H : ℤ) :
 (2*(i:ℤ)+2)*(2*i+3)*(2*i+4)*(2*i+5)*betaBaseSumMCA9 i m H=
 2*((i:ℤ)+1)^2*(i+2)*(m:ℤ)*(m-1)*betaGapMDCB ((i:ℤ)+1) m H*
 betaMomentMDCB i m 0 0 := by
 have h22 := beta_moment_clearedMDCB i m 2 2
 have h21 := beta_moment_clearedMDCB i m 2 1
 have h12 := beta_moment_clearedMDCB i m 1 2
 have h11 := beta_moment_clearedMDCB i m 1 1
 have h40 := beta_moment_clearedMDCB i m 4 0
 have h04 := beta_moment_clearedMDCB i m 0 4
 have h30 := beta_moment_clearedMDCB i m 3 0
 have h03 := beta_moment_clearedMDCB i m 0 3
 have h20 := beta_moment_clearedMDCB i m 2 0
 have h02 := beta_moment_clearedMDCB i m 0 2
 have hf0 (k : ℕ) := (beta_fall_smallMCA9 k).1
 have hf1 (k : ℕ) := (beta_fall_smallMCA9 k).2.1
 have hf2 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.1
 have hf3 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.1
 have hf4 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.2
 norm_num only [show (2:ℕ)+2=4 by rfl,show (2:ℕ)+1=3 by rfl,
   show (1:ℕ)+2=3 by rfl,show (1:ℕ)+1=2 by rfl,Nat.add_zero,Nat.zero_add,
   hf0,hf1,hf2,hf3,hf4,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at h22 h21 h12 h11 h40 h04 h30 h03 h20 h02
 rw [beta_sum_momentsMCA9]
 unfold betaGapMDCB
 linear_combination
   2*((i:ℤ)+2)*(i+5)*h22+
   2*((i:ℤ)+2)*(i+5)*(H+1)*(2*i+5)*(h21+h12)+
   2*((i:ℤ)+2)*(i+5)*(H+1)^2*(2*i+4)*(2*i+5)*h11-
   ((i:ℤ)+1)*(i+4)*(h40+h04)-
   ((i:ℤ)+1)*(i+4)*(2*H+6)*(2*i+5)*(h30+h03)-
   ((i:ℤ)+1)*(i+4)*(H+2)*(H+3)*(2*i+4)*(2*i+5)*(h20+h02)

theorem beta_base_positiveMCA9 (i m : ℕ) (H : ℤ)
 (hm : 2 ≤ m) (hH : 3*((i:ℤ)+1)+2*m+5 ≤ H) :
 0 < betaBaseSumMCA9 i m H := by
 have hg := beta_gap_positiveMDCB ((i:ℤ)+1) m H (by omega) (by exact_mod_cast hm) hH
 have hM := beta_mass_positiveMDCB i m
 have hm0 : (0:ℤ) < m := by omega
 have hm1 : (0:ℤ) < (m:ℤ)-1 := by omega
 have hp : 0 < 2*((i:ℤ)+1)^2*(i+2)*(m:ℤ)*(m-1)*betaGapMDCB ((i:ℤ)+1) m H*
   betaMomentMDCB i m 0 0 := by positivity
 rw [←beta_base_clearedMCA9] at hp
 exact (mul_pos_iff_of_pos_left (by positivity :
   0 < (2*(i:ℤ)+2)*(2*i+3)*(2*i+4)*(2*i+5))).mp hp

end
end MathGKM.Markov
