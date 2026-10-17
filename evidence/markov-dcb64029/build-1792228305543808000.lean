import MarkovTopTailRepresentationMDCB
/-! Machine-authored dcb64029. The actual relative-likelihood sequence
for a proposed beta-binomial comparison has decreasing adjacent ratios. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

def betaQSeqMDCB (d i : ℕ) : ℕ → ℝ
 | 0 => 1
 | k+1 => betaQSeqMDCB d i k*((d:ℝ)+2*i+k+9)/((d:ℝ)+i+k+6)

def betaWeightMDCB (r k : ℕ) : ℝ :=
 if k=r then 1 else if k<r then 4*((r:ℝ)-k) else 0

def betaLikelihoodMDCB (d i r k : ℕ) : ℝ := betaQSeqMDCB d i k*betaWeightMDCB r k

theorem beta_q_positiveMDCB (d i k : ℕ) : 0 < betaQSeqMDCB d i k := by
 induction k with
 | zero => norm_num [betaQSeqMDCB]
 | succ k ih => simp only [betaQSeqMDCB]; positivity

theorem beta_q_crossMDCB (d i k l : ℕ) (hkl : k ≤ l) :
 betaQSeqMDCB d i k*betaQSeqMDCB d i (l+1) ≤
 betaQSeqMDCB d i (k+1)*betaQSeqMDCB d i l := by
 have hqk := beta_q_positiveMDCB d i k
 have hql := beta_q_positiveMDCB d i l
 have hk : 0 < (d:ℝ)+i+k+6 := by positivity
 have hl : 0 < (d:ℝ)+i+l+6 := by positivity
 have hkl' : (k:ℝ) ≤ l := by exact_mod_cast hkl
 have hratio : ((d:ℝ)+2*i+l+9)/((d:ℝ)+i+l+6) ≤
   ((d:ℝ)+2*i+k+9)/((d:ℝ)+i+k+6) := by
   apply (div_le_div_iff₀ hl hk).mpr
   nlinarith [Nat.cast_nonneg (α:=ℝ) i]
 have h := mul_le_mul_of_nonneg_left hratio (mul_pos hqk hql).le
 calc
  _ = (betaQSeqMDCB d i k*betaQSeqMDCB d i l)*
    (((d:ℝ)+2*i+l+9)/((d:ℝ)+i+l+6)) := by rw [betaQSeqMDCB]; ring
  _ ≤ (betaQSeqMDCB d i k*betaQSeqMDCB d i l)*
    (((d:ℝ)+2*i+k+9)/((d:ℝ)+i+k+6)) := h
  _ = _ := by rw [betaQSeqMDCB]; ring

theorem beta_weight_nonnegMDCB (r k : ℕ) : 0 ≤ betaWeightMDCB r k := by
 unfold betaWeightMDCB
 split_ifs with h0 h1
 · norm_num
 · have hk : (k:ℝ) ≤ r := by exact_mod_cast Nat.le_of_lt h1
   positivity
 · rfl

theorem beta_weight_crossMDCB (r k l : ℕ) (hkl : k ≤ l) :
 betaWeightMDCB r k*betaWeightMDCB r (l+1) ≤
 betaWeightMDCB r (k+1)*betaWeightMDCB r l := by
 by_cases he : k=l
 · subst l; exact le_of_eq (mul_comm _ _)
 have hlt : k<l := by omega
 by_cases hl : l+1<r
 · have hk : k<r := by omega
   have hk1 : k+1<r := by omega
   have hl0 : l<r := by omega
   simp only [betaWeightMDCB,if_neg (Nat.ne_of_lt hk),if_neg (Nat.ne_of_lt hl),
     if_neg (Nat.ne_of_lt hk1),if_neg (Nat.ne_of_lt hl0),if_pos hk,if_pos hl,
     if_pos hk1,if_pos hl0,Nat.cast_add,Nat.cast_one]
   have hkl' : (k:ℝ) ≤ l := by exact_mod_cast hkl
   nlinarith
 · by_cases hl1 : l+1=r
   · have hk : k<r := by omega
     have hk1 : k+1<r := by omega
     have hl0 : l<r := by omega
     have hl' : (l:ℝ)+1=r := by exact_mod_cast hl1
     have hk' : (k:ℝ)+1 ≤ l := by exact_mod_cast hlt
     simp only [betaWeightMDCB,if_neg (Nat.ne_of_lt hk),if_pos hl1,
       if_neg (Nat.ne_of_lt hk1),if_neg (Nat.ne_of_lt hl0),if_pos hk,
       if_pos hk1,if_pos hl0,Nat.cast_add,Nat.cast_one]
     nlinarith
   · have hz : betaWeightMDCB r (l+1)=0 := by
       simp [betaWeightMDCB,hl1,hl]
     rw [hz,mul_zero]
     exact mul_nonneg (beta_weight_nonnegMDCB r (k+1)) (beta_weight_nonnegMDCB r l)

theorem beta_likelihood_nonnegMDCB (d i r k : ℕ) : 0 ≤ betaLikelihoodMDCB d i r k :=
 mul_nonneg (beta_q_positiveMDCB d i k).le (beta_weight_nonnegMDCB r k)

theorem beta_likelihood_crossMDCB (d i r k l : ℕ) (hkl : k ≤ l) :
 betaLikelihoodMDCB d i r k*betaLikelihoodMDCB d i r (l+1) ≤
 betaLikelihoodMDCB d i r (k+1)*betaLikelihoodMDCB d i r l := by
 have h := mul_le_mul (beta_q_crossMDCB d i k l hkl) (beta_weight_crossMDCB r k l hkl)
   (mul_nonneg (beta_weight_nonnegMDCB r k) (beta_weight_nonnegMDCB r (l+1)))
   (mul_pos (beta_q_positiveMDCB d i (k+1)) (beta_q_positiveMDCB d i l)).le
 calc
  _ = (betaQSeqMDCB d i k*betaQSeqMDCB d i (l+1))*
    (betaWeightMDCB r k*betaWeightMDCB r (l+1)) := by unfold betaLikelihoodMDCB; ring
  _ ≤ (betaQSeqMDCB d i (k+1)*betaQSeqMDCB d i l)*
    (betaWeightMDCB r (k+1)*betaWeightMDCB r l) := h
  _ = _ := by unfold betaLikelihoodMDCB; ring

theorem beta_likelihood_inwardMDCB (d i r m k : ℕ) (hk : 2*k+1 ≤ m) :
 betaLikelihoodMDCB d i r k*betaLikelihoodMDCB d i r (m-k) ≤
 betaLikelihoodMDCB d i r (k+1)*betaLikelihoodMDCB d i r (m-(k+1)) := by
 have h := beta_likelihood_crossMDCB d i r k (m-(k+1)) (by omega)
 rw [show m-(k+1)+1=m-k by omega] at h
 exact h

end
end MathGKM.Markov
