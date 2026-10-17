import MarkovTopSteinResidualM208
/-! Machine-authored 73199834. Exact denominator-free integer representation
of the actual q-weighted antidiagonal groups. No positivity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 9000000

def betaQDenM731 (d i : ℕ) : ℕ := (d+2*i+8).choose (i+3)

theorem beta_q_den_positiveM731 (d i : ℕ) : 0 < betaQDenM731 d i := by
 exact Nat.choose_pos (by omega)

theorem beta_q_chooseM731 (d i k : ℕ) :
 betaQSeqMDCB d i k*(betaQDenM731 d i:ℝ)=
 ((d+2*i+k+8).choose (i+3):ℝ) := by
 induction k with
 | zero => simp [betaQSeqMDCB,betaQDenM731]
 | succ k ih =>
   have h := Nat.choose_mul_succ_eq (d+2*i+k+8) (i+3)
   rw [show d+2*i+k+8+1-(i+3)=d+i+k+6 by omega] at h
   have hc : ((d+2*i+k+8).choose (i+3):ℝ)*((d:ℝ)+2*i+k+9)=
       ((d+2*i+(k+1)+8).choose (i+3):ℝ)*((d:ℝ)+i+k+6) := by
     have hh : ((d+2*i+k+8).choose (i+3):ℝ)*((d+2*i+k+8+1:ℕ):ℝ)=
       ((d+2*i+k+8+1).choose (i+3):ℝ)*((d+i+k+6:ℕ):ℝ) := by exact_mod_cast h
     convert hh using 1 <;> push_cast <;> ring
   have hb : (d:ℝ)+i+k+6 ≠ 0 := by positivity
   rw [betaQSeqMDCB]
   calc
    _ = (betaQSeqMDCB d i k*(betaQDenM731 d i:ℝ))*
      ((d:ℝ)+2*i+k+9)/((d:ℝ)+i+k+6) := by ring
    _ = _ := by rw [ih]; exact (div_eq_iff hb).mpr hc

def betaIntegerDensityM731 (d i k : ℕ) : ℤ :=
 ((i+k).choose i:ℤ)*((d+2*i+k+8).choose (i+3):ℤ)

def betaIntegerCutM731 (r k : ℕ) : ℤ :=
 if k=r then 1 else if k<r then 4*((r:ℤ)-k) else 0

def betaIntegerGroupM731 (d i r m : ℕ) : ℤ :=
 ∑ k ∈ range (m+1), betaIntegerDensityM731 d i k*betaIntegerDensityM731 d i (m-k)*
   betaIntegerCutM731 r k*betaIntegerCutM731 r (m-k)*
   betaScalarMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) k ((m-k:ℕ):ℤ)

theorem beta_integer_density_positiveM731 (d i k : ℕ) :
 0 < betaIntegerDensityM731 d i k := by
 unfold betaIntegerDensityM731
 apply mul_pos
 · exact_mod_cast Nat.choose_pos (show i ≤ i+k by omega)
 · exact_mod_cast Nat.choose_pos (show i+3 ≤ d+2*i+k+8 by omega)

theorem beta_integer_cut_castM731 (r k : ℕ) :
 (betaIntegerCutM731 r k:ℝ)=betaWeightMDCB r k := by
 unfold betaIntegerCutM731 betaWeightMDCB
 split_ifs <;> push_cast <;> rfl

theorem beta_integer_density_castM731 (d i k : ℕ) :
 (betaIntegerDensityM731 d i k:ℝ)=
 (betaQDenM731 d i:ℝ)*steinDensityM208 d i k := by
 unfold betaIntegerDensityM731 steinDensityM208
 push_cast
 rw [show (betaQDenM731 d i:ℝ)*(((i+k).choose i:ℝ)*betaQSeqMDCB d i k)=
   ((i+k).choose i:ℝ)*(betaQSeqMDCB d i k*(betaQDenM731 d i:ℝ)) by ring]
 rw [beta_q_chooseM731]

theorem beta_integer_group_castM731 (d i r m : ℕ) :
 (betaIntegerGroupM731 d i r m:ℝ)=
 (betaQDenM731 d i:ℝ)^2*betaGroupMCA9 d i r m := by
 unfold betaIntegerGroupM731 betaGroupMCA9
 push_cast
 rw [mul_sum]
 apply sum_congr rfl
 intro k hk
 rw [beta_integer_density_castM731,beta_integer_density_castM731,
   beta_integer_cut_castM731,beta_integer_cut_castM731]
 unfold steinDensityM208 betaBaseWeightMCA9 betaPairLikelihoodMCA9
   betaLikelihoodMDCB betaGroupScalarMCA9
 push_cast
 ring

theorem beta_integer_group_nonneg_iffM731 (d i r m : ℕ) :
 0 ≤ betaIntegerGroupM731 d i r m ↔ 0 ≤ betaGroupMCA9 d i r m := by
 have hD : (0:ℝ) < betaQDenM731 d i := by exact_mod_cast beta_q_den_positiveM731 d i
 have hc : (0:ℝ) ≤ betaIntegerGroupM731 d i r m ↔ 0 ≤ betaGroupMCA9 d i r m := by
   rw [beta_integer_group_castM731]
   exact mul_nonneg_iff_of_pos_left (sq_pos_of_pos hD)
 exact_mod_cast hc

theorem beta_integer_group_pos_iffM731 (d i r m : ℕ) :
 0 < betaIntegerGroupM731 d i r m ↔ 0 < betaGroupMCA9 d i r m := by
 have hD : (0:ℝ) < betaQDenM731 d i := by exact_mod_cast beta_q_den_positiveM731 d i
 have hc : (0:ℝ) < betaIntegerGroupM731 d i r m ↔ 0 < betaGroupMCA9 d i r m := by
   rw [beta_integer_group_castM731]
   exact mul_pos_iff_of_pos_left (sq_pos_of_pos hD)
 exact_mod_cast hc

end
end MathGKM.Markov
