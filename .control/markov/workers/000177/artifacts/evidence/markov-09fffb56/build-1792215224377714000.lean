import MarkovChooseGrowthM09F
/-! Machine-authored 09fffb56. Control of the absorbed endpoint correction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000

theorem correction_pair_rawM09F (k s : ℕ) (r : Bool) :
 (if r then 2 else 1:ℝ)*k*(s+3)*(correctionTermM657 k (s+1) 0 r:ℝ) ≤
 3*(s+5)*(correctionTermM657 k (s+1) 1 r:ℝ) := by
 have hm : ((k+s+3).choose (s+4):ℝ) ≤ ((k+s+4).choose (s+4):ℝ) := by
   exact_mod_cast Nat.choose_le_choose (s+4) (by omega : k+s+3 ≤ k+s+4)
 have h := Nat.choose_succ_right_eq (k+s+4) (s+4)
 rw [show k+s+4-(s+4)=k by omega] at h
 have hh : ((k+s+4).choose (s+5):ℝ)*(s+5)=((k+s+4).choose (s+4):ℝ)*k := by
   have h' := congrArg (fun n : ℕ => (n:ℝ)) h
   push_cast at h'
   rw [show s+4+1=s+5 by omega] at h'
   nlinarith only [h']
 have h0 : (correctionTermM657 k (s+1) 0 r:ℝ) ≤ 12*((k+s+4).choose (s+4):ℝ) := by
   unfold correctionTermM657
   simp only [Nat.choose_zero_right,Nat.add_zero,Nat.cast_one,mul_one,
     show k+(s+1)+3=k+s+4 by omega,show k+(s+1)+2=k+s+3 by omega,
     show s+1+3=s+4 by omega]
   cases r <;> norm_num <;> push_cast <;> nlinarith only [hm]
 have h1 : 4*(if r then 2 else 1:ℝ)*(s+3)*((k+s+4).choose (s+5):ℝ) ≤
     (correctionTermM657 k (s+1) 1 r:ℝ) := by
   unfold correctionTermM657
   simp only [Nat.choose_one_right,show s+1+1+1=s+3 by omega,
     show k+(s+1)+3=k+s+4 by omega,show k+(s+1)+2=k+s+3 by omega,
     show s+1+1+3=s+5 by omega]
   cases r <;> norm_num <;> push_cast <;>
     nlinarith [mul_nonneg (show (0:ℝ) ≤ s+3 by positivity)
       (show (0:ℝ) ≤ (k+s+3).choose (s+5) by positivity)]
 have ha : (0:ℝ) ≤ if r then 2 else 1 := by cases r <;> norm_num
 calc
  _ ≤ (if r then 2 else 1:ℝ)*k*(s+3)*(12*((k+s+4).choose (s+4):ℝ)) :=
    mul_le_mul_of_nonneg_left h0 (by positivity)
  _ = 3*(s+5)*(4*(if r then 2 else 1:ℝ)*(s+3)*((k+s+4).choose (s+5):ℝ)) := by
    linear_combination -12*(if r then 2 else 1:ℝ)*(s+3)*hh
  _ ≤ _ := mul_le_mul_of_nonneg_left h1 (by positivity)

theorem correction_pair_scalarM09F (k s : ℕ) (r : Bool) (hk : 1 ≤ k) (hs : 3 ≤ s) :
 3*(s+5)*(bandJMBE3 0 k r+1) ≤ (if r then 2 else 1:ℝ)*k*(s+3)^2*(s+1) := by
 have hkR : (1:ℝ) ≤ k := by exact_mod_cast hk
 have hsR : (3:ℝ) ≤ s := by exact_mod_cast hs
 have hu : 0 ≤ (k:ℝ)-1 := by linarith
 have hx : 0 ≤ (s:ℝ)-3 := by linarith
 let u : ℝ := k-1
 let x : ℝ := s-3
 have hu' : 0 ≤ u := hu
 have hx' : 0 ≤ x := hx
 have heK : (k:ℝ)=u+1 := by dsimp [u]; ring
 have heS : (s:ℝ)=x+3 := by dsimp [x]; ring
 unfold bandJMBE3
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,Nat.zero_add] <;> push_cast <;> rw [heK,heS]
 · have he : (u+1)*(x+6)^2*(x+4)-3*(x+8)*(3*(u+1)+3)=
     x*(66+x*(16+x))+u*(72+x*(75+x*(16+x))) := by ring
   have hp : 0 ≤ x*(66+x*(16+x))+u*(72+x*(75+x*(16+x))) := by positivity
   nlinarith only [he,hp]
 · have he : 2*(u+1)*(x+6)^2*(x+4)-3*(x+8)*(3*(u+1)+4)=
     (120+x*(147+x*(32+2*x)))+u*(216+x*(159+x*(32+2*x))) := by ring
   have hp : 0 ≤ (120+x*(147+x*(32+2*x)))+u*(216+x*(159+x*(32+2*x))) := by positivity
   nlinarith only [he,hp]

theorem correction_pair_budgetM09F (k s : ℕ) (r : Bool) (hk : 1 ≤ k) (hs : 3 ≤ s) :
 (correctionTermM657 k (s+1) 0 r:ℝ)*(bandJMBE3 0 k r+1) ≤
 (correctionTermM657 k (s+1) 1 r:ℝ)*(s+3)*(s+1) := by
 have h0 := correction_pair_rawM09F k s r
 have h1 := correction_pair_scalarM09F k s r hk hs
 have hh := mul_le_mul_of_nonneg_right h0 (show (0:ℝ) ≤ bandJMBE3 0 k r+1 by positivity)
 have hi := mul_le_mul_of_nonneg_right h1 (correction_term_nonnegMBE3 k (s+1) 1 r)
 have hp : (0:ℝ)<(if r then 2 else 1:ℝ)*k*(s+3) := by
   have hk' : (0:ℝ)<k := by exact_mod_cast (show 0<k by omega)
   cases r <;> norm_num <;> positivity
 apply (mul_le_mul_iff_of_pos_left hp).mp
 nlinarith only [hh,hi]

theorem budget_dominated_by_zeroM09F (d k s : ℕ) (r : Bool) (hk : 1 ≤ k) (hs : 3 ≤ s) :
 transposedBudgetMBE3 d k s r*(bandJMBE3 0 k r+1) ≤
 (correctionTermM657 k (s+1) 1 r:ℝ)*(bandJMBE3 0 k r+1+d*(s+3)) := by
 have h := correction_pair_budgetM09F k s r hk hs
 have hd : ((d-s:ℕ):ℝ) ≤ d := by exact_mod_cast Nat.sub_le d s
 have he : 0 ≤ (correctionTermM657 k (s+1) 0 r:ℝ) := correction_term_nonnegMBE3 _ _ _ _
 have hmul := mul_le_mul_of_nonneg_right h (show (0:ℝ) ≤ d by positivity)
 have hsub := mul_le_mul_of_nonneg_left hd
   (mul_nonneg he (show (0:ℝ) ≤ bandJMBE3 0 k r+1 by positivity))
 unfold transposedBudgetMBE3 absorbedExtraM418
 apply (mul_le_mul_iff_of_pos_right (by positivity : (0:ℝ)<s+1)).mp
 have hn : (s:ℝ)+1≠0 := by positivity
 field_simp [hn]
 nlinarith only [hmul,hsub]

theorem band_budget_positive_kM09F (d k s : ℕ) (r : Bool) (hk : 1 ≤ k) (hs : 3 ≤ s) :
 ((s+9).choose 4:ℝ)*transposedBudgetMBE3 d k s r ≤ (s+3)*bandBaseMBE3 d k s r := by
 have h0 := weighted_correction_boundM09F 0 k s r hs
 have h1 := budget_dominated_by_zeroM09F d k s r hk hs
 have h2 := band_base_growthM09F d k s r
 have H0 := mul_le_mul_of_nonneg_right h0
   (show (0:ℝ) ≤ bandJMBE3 0 k r+1+d*(s+3) by positivity)
 have H1 := mul_le_mul_of_nonneg_left h1 (show (0:ℝ) ≤ (s+9).choose 4 by positivity)
 have H2 := mul_le_mul_of_nonneg_left h2 (show (0:ℝ) ≤ s+3 by positivity)
 apply (mul_le_mul_iff_of_pos_right (by positivity : (0:ℝ)<bandJMBE3 0 k r+1)).mp
 nlinarith only [H0,H1,H2]

end
end MathGKM.Markov
