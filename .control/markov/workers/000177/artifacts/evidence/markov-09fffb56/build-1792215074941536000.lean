import MarkovCorrectionBudgetM09F
/-! Machine-authored 09fffb56. Elementary lower bounds for binomial growth. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem choose_linear_lowerM09F (A d n : ℕ) :
 (d:ℝ)*(A.choose n:ℝ) ≤ ((A+d).choose (n+1):ℝ) := by
 induction d with
 | zero => simp
 | succ d ih =>
   have hm : (A.choose n:ℝ) ≤ ((A+d).choose n:ℝ) := by
     exact_mod_cast Nat.choose_le_choose n (by omega : A ≤ A+d)
   rw [show A+(d+1)=A+d+1 by omega,Nat.choose_succ_succ]
   push_cast
   nlinarith only [ih,hm]

theorem choose_small_monoM09F (n a b : ℕ) (hab : a ≤ b) (hb : b ≤ n/2) :
 n.choose a ≤ n.choose b := by
 induction b, hab using Nat.le_induction with
 | base => rfl
 | succ b hab ih =>
   exact (ih (by omega)).trans (Nat.choose_le_succ_of_lt_half_left (by omega : b < n/2))

theorem choose_growth_scaledM09F (p q d : ℕ) :
 ((p+q).choose q:ℝ)*(p+1+d*q) ≤ ((p+q+d).choose q:ℝ)*(p+1) := by
 by_cases hq : q=0
 · subst q; simp
 have hqR : (1:ℝ) ≤ q := by exact_mod_cast (show 1 ≤ q by omega)
 induction d with
 | zero => simp
 | succ d ih =>
   have h := Nat.choose_mul_succ_eq (p+q+d) q
   rw [show p+q+d+1-q=p+d+1 by omega] at h
   have hh : ((p+q+d).choose q:ℝ)*(p+q+d+1)=
       ((p+q+(d+1)).choose q:ℝ)*(p+d+1) := by
     have h' := congrArg (fun n : ℕ => (n:ℝ)) h
     push_cast at h'
     simpa only [Nat.add_assoc] using h'
   have hi := mul_le_mul_of_nonneg_right ih (show (0:ℝ) ≤ p+q+d+1 by positivity)
   have he : (p+1+d*q:ℝ)*(p+q+d+1)-(p+1+(d+1)*q)*(p+d+1)=d*q*(q-1) := by ring
   have hp : 0 ≤ (d:ℝ)*q*(q-1) := by positivity
   have hb := mul_nonneg (show (0:ℝ) ≤ (p+q).choose q by positivity) hp
   apply (mul_le_mul_iff_of_pos_right (by positivity : (0:ℝ)<p+d+1)).mp
   push_cast
   nlinarith only [hi,hb,he,hh]

theorem band_base_growthM09F (d k s : ℕ) (r : Bool) :
 bandBaseMBE3 0 k s r*(bandJMBE3 0 k r+1+d*(s+3)) ≤
 bandBaseMBE3 d k s r*(bandJMBE3 0 k r+1) := by
 let j := bandJMBE3 0 k r
 have hj : 1 ≤ j := by dsimp [j,bandJMBE3]; split_ifs <;> omega
 have he : bandJMBE3 d k r=j+d := by dsimp [j,bandJMBE3]; omega
 have h0 := choose_growth_scaledM09F j (s+3) d
 have h2 := choose_growth_scaledM09F (j-1) (s+5) d
 rw [show j-1+(s+5)=j+s+4 by omega,show j-1+1=j by omega] at h2
 have h2' : ((j+s+4).choose (s+5):ℝ)*(j+d*(s+5)) ≤
     ((j+s+4+d).choose (s+5):ℝ)*j := by
   convert h2 using 1 <;> push_cast [Nat.cast_sub hj] <;> ring
 have h2'' : ((j+s+4).choose (s+5):ℝ)*(j+1+d*(s+3)) ≤
     ((j+s+4+d).choose (s+5):ℝ)*(j+1) := by
   have hi := mul_le_mul_of_nonneg_right h2' (show (0:ℝ) ≤ j+1 by positivity)
   have hp : 0 ≤ ((j+s+4).choose (s+5):ℝ)*d*(2*j+s+5) := by positivity
   apply (mul_le_mul_iff_of_pos_right (by exact_mod_cast (show 0<j by omega) : (0:ℝ)<j)).mp
   nlinarith only [hi,hp]
 unfold bandBaseMBE3 liftTermMAE9
 rw [he]
 change _ ≤ _
 simp only [Nat.add_zero,Nat.choose_zero_right,Nat.cast_one,one_mul]
 push_cast
 change _ ≤ _
 rw [show s+(j+d)+3=j+(s+3)+d by omega,show s+(j+d)+4=j+s+4+d by omega,
   show s+bandJMBE3 0 k r+3=j+(s+3) by omega,
   show s+bandJMBE3 0 k r+4=j+s+4 by omega]
 change (((j+(s+3)).choose (s+3):ℝ)+4*((j+s+4).choose (s+5):ℝ))*(j+1+d*(s+3)) ≤ _
 nlinarith only [h0,h2'']

end
end MathGKM.Markov
