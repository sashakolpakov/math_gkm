import MarkovCutoffFormulaMA45
/-! Machine-authored a45def12. A uniform quadratic binomial growth bound. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem double_choose_quadraticMA45 (p q : ℕ) (hp : 3 ≤ p) :
 ((p+q).choose q:ℝ)*(q+1)*(q+2) ≤ 4*((2*p+q+1).choose q:ℝ) := by
 by_cases hq0 : q=0
 · subst q; norm_num
 by_cases hq1 : q=1
 · subst q; simp only [Nat.choose_one_right]; push_cast; nlinarith
 have hq : 2 ≤ q := by omega
 induction q, hq using Nat.le_induction with
 | base =>
   have h0 := Nat.add_one_mul_choose_eq (p+1) 1
   have h1 := Nat.add_one_mul_choose_eq (2*p+2) 1
   simp only [Nat.choose_one_right] at h0 h1
   have h0' : ((p+2).choose 2:ℝ)*2=(p+2:ℝ)*(p+1) := by exact_mod_cast h0.symm
   have h1' : ((2*p+3).choose 2:ℝ)*2=(2*p+3:ℝ)*(2*p+2) := by exact_mod_cast h1.symm
   rw [show 2*p+2+1=2*p+3 by omega]
   norm_num
   have hp' : (3:ℝ) ≤ p := by exact_mod_cast hp
   nlinarith
 | succ q hq ih =>
   have ha := Nat.add_one_mul_choose_eq (p+q) q
   have hb := Nat.add_one_mul_choose_eq (2*p+q+1) q
   have ha' : ((p+(q+1)).choose (q+1):ℝ)*(q+1)=((p+q).choose q:ℝ)*(p+q+1) := by
     convert congrArg (fun n : ℕ => (n:ℝ)) ha.symm using 1 <;> push_cast <;> ring_nf
   have hb' : ((2*p+(q+1)+1).choose (q+1):ℝ)*(q+1)=((2*p+q+1).choose q:ℝ)*(2*p+q+2) := by
     convert congrArg (fun n : ℕ => (n:ℝ)) hb.symm using 1 <;> push_cast <;> ring_nf
   have hp' : (3:ℝ) ≤ p := by exact_mod_cast hp
   have hq' : (2:ℝ) ≤ q := by exact_mod_cast hq
   have hm : 0 ≤ ((p:ℝ)-3)*((q:ℝ)-1)+2*((q:ℝ)-2) := by positivity
   have he : 0 ≤ (2*p+q+2:ℝ)*(q+1)-(p+q+1)*(q+3) := by nlinarith only [hm]
   have hi := mul_le_mul_of_nonneg_right ih (show (0:ℝ)≤2*p+q+2 by positivity)
   have hh := mul_nonneg (show (0:ℝ)≤((p+q).choose q:ℝ)*(q+2) by positivity) he
   apply (mul_le_mul_iff_of_pos_right (show (0:ℝ)<q+1 by positivity)).mp
   push_cast
   nlinarith only [ha',hb',hi,hh]

theorem cutoff_binomial_boundMA45 (s k : ℕ) :
 ((s+k+5).choose k:ℝ)*(k+1)*(k+2) ≤ 4*((2*s+k+11).choose k:ℝ) := by
 convert double_choose_quadraticMA45 (s+5) k (by omega) using 1 <;>
   congr 1 <;> omega

end
end MathGKM.Markov
