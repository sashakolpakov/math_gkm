import MarkovTransposedKernelM657
/-! Machine-authored be355177. Uniform relative domination of the transposed
correction by the lower kernel. These are bounds, not root log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem choose_ratio_crossMBE3 (A B N m : ℕ) (hAB : A ≤ B) :
 (A.choose (N+m):ℝ)*(B.choose N:ℝ) ≤
 (A.choose N:ℝ)*(B.choose (N+m):ℝ) := by
 have ha := Nat.choose_mul (n:=A) (k:=N+m) (s:=N) (by omega)
 have hb := Nat.choose_mul (n:=B) (k:=N+m) (s:=N) (by omega)
 rw [show N+m-N=m by omega] at ha hb
 have ha' : (A.choose (N+m):ℝ)*((N+m).choose N:ℝ)=
     (A.choose N:ℝ)*((A-N).choose m:ℝ) := by exact_mod_cast ha
 have hb' : (B.choose (N+m):ℝ)*((N+m).choose N:ℝ)=
     (B.choose N:ℝ)*((B-N).choose m:ℝ) := by exact_mod_cast hb
 have hm : ((A-N).choose m:ℝ) ≤ ((B-N).choose m:ℝ) := by
   exact_mod_cast Nat.choose_le_choose m (by omega : A-N ≤ B-N)
 have hp : (0:ℝ)<(N+m).choose N := by exact_mod_cast Nat.choose_pos (by omega : N ≤ N+m)
 apply (mul_le_mul_iff_of_pos_right hp).mp
 calc
  _ = (A.choose N:ℝ)*(B.choose N:ℝ)*((A-N).choose m:ℝ) := by
    linear_combination (B.choose N:ℝ)*ha'
  _ ≤ (A.choose N:ℝ)*(B.choose N:ℝ)*((B-N).choose m:ℝ) :=
    mul_le_mul_of_nonneg_left hm (by positivity)
  _ = _ := by linear_combination -(A.choose N:ℝ)*hb'

theorem choose_successor_boundMBE3 (s m : ℕ) :
 ((s+m+3).choose (m+1):ℝ) ≤ (s+3)*((s+m+3).choose m:ℝ) := by
 have h := Nat.choose_succ_right_eq (s+m+3) m
 rw [show s+m+3-m=s+3 by omega] at h
 have hh : ((s+m+3).choose (m+1):ℝ)*(m+1)=
   ((s+m+3).choose m:ℝ)*(s+3) := by exact_mod_cast h
 nlinarith [mul_nonneg (show (0:ℝ) ≤ m by positivity)
   (show (0:ℝ) ≤ (s+m+3).choose (m+1) by positivity)]

def transposedBaseMBE3 (j s : ℕ) : ℝ := 4*((j+s+4).choose (s+5):ℝ)
def transposedBudgetMBE3 (d k s : ℕ) (r : Bool) : ℝ :=
 absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r)+
 (correctionTermM657 k (s+1) 1 r:ℝ)

theorem correction_second_relativeMBE3 (j k s m : ℕ) (r : Bool) (hkj : k ≤ j) :
 transposedBaseMBE3 j s*(correctionTermM657 k (s+1) (m+1) r:ℝ) ≤
 (correctionTermM657 k (s+1) 1 r:ℝ)*
   (4*((s+m+3).choose m:ℝ)*((j+s+4).choose (s+m+5):ℝ)) := by
 have ha := choose_ratio_crossMBE3 (k+s+4) (j+s+4) (s+5) m (by omega)
 have hb := choose_ratio_crossMBE3 (k+s+3) (j+s+4) (s+5) m (by omega)
 have hc := choose_successor_boundMBE3 s m
 have ha0 : (0:ℝ) ≤ (k+s+4).choose (s+5+m) := by positivity
 have hb0 : (0:ℝ) ≤ (k+s+3).choose (s+5+m) := by positivity
 have he (a b : ℝ) (ha0' : 0 ≤ a) (hb0' : 0 ≤ b) :
   ((j+s+4).choose (s+5):ℝ)*((s+m+3).choose (m+1):ℝ)*
      (a*((k+s+4).choose (s+5+m):ℝ)+b*((k+s+3).choose (s+5+m):ℝ)) ≤
   (s+3)*(a*((k+s+4).choose (s+5):ℝ)+b*((k+s+3).choose (s+5):ℝ))*
      ((s+m+3).choose m:ℝ)*((j+s+4).choose (s+5+m):ℝ) := by
   have h1 := mul_le_mul_of_nonneg_left hc
     (show 0 ≤ ((j+s+4).choose (s+5):ℝ)*
       (a*((k+s+4).choose (s+5+m):ℝ)+b*((k+s+3).choose (s+5+m):ℝ)) by positivity)
   have h2 := add_le_add (mul_le_mul_of_nonneg_left ha ha0')
     (mul_le_mul_of_nonneg_left hb hb0')
   have h3 := mul_le_mul_of_nonneg_left h2
     (show 0 ≤ ((s:ℝ)+3)*((s+m+3).choose m:ℝ) by positivity)
   nlinarith only [h1,h3]
 have h := he (if r then 2 else 1) (if r then 1 else 2)
   (by cases r <;> norm_num) (by cases r <;> norm_num)
 unfold transposedBaseMBE3 correctionTermM657
 simp only [show s+1+(m+1)+1=s+m+3 by omega,
   show k+(s+1)+3=k+s+4 by omega,show k+(s+1)+2=k+s+3 by omega,
   show s+1+(m+1)+3=s+5+m by omega,show s+1+1+1=s+3 by omega,
   show s+1+1+3=s+5 by omega,Nat.choose_one_right,
   show s+m+5=s+5+m by omega]
 push_cast
 nlinarith only [h]

theorem correction_term_nonnegMBE3 (k t m : ℕ) (r : Bool) :
 0 ≤ (correctionTermM657 k t m r:ℝ) := by
 unfold correctionTermM657
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> positivity

theorem shifted_choose_budgetMBE3 (A j s m : ℕ) (hAj : A-(s+5) ≤ j) :
 ((s+m+3).choose (m+1):ℝ)*(A.choose (s+m+5):ℝ) ≤
 (s+3)*(A.choose (s+5):ℝ)*(j.choose m:ℝ) := by
 have h0 := choose_successor_boundMBE3 s m
 have h1 : ((s+m+3).choose m:ℝ) ≤ ((s+m+5).choose m:ℝ) := by
   exact_mod_cast Nat.choose_le_choose m (by omega : s+m+3 ≤ s+m+5)
 have h2 : ((A-(s+5)).choose m:ℝ) ≤ (j.choose m:ℝ) := by
   exact_mod_cast Nat.choose_le_choose m hAj
 have hi := Nat.choose_mul (n:=A) (k:=s+m+5) (s:=s+5) (by omega)
 rw [show s+m+5-(s+5)=m by omega,
   ←Nat.choose_symm (by omega : s+5 ≤ s+m+5),show s+m+5-(s+5)=m by omega] at hi
 have hi' : (A.choose (s+m+5):ℝ)*((s+m+5).choose m:ℝ)=
   (A.choose (s+5):ℝ)*((A-(s+5)).choose m:ℝ) := by exact_mod_cast hi
 calc
  _ ≤ ((s:ℝ)+3)*((s+m+5).choose m:ℝ)*(A.choose (s+m+5):ℝ) := by
    apply mul_le_mul_of_nonneg_right _ (by positivity)
    exact h0.trans (mul_le_mul_of_nonneg_left h1 (by positivity))
  _ = (s+3)*(A.choose (s+5):ℝ)*((A-(s+5)).choose m:ℝ) := by
    linear_combination (s+3:ℝ)*hi'
  _ ≤ _ := mul_le_mul_of_nonneg_left h2 (by positivity)

theorem correction_choose_budgetMBE3 (j k s m : ℕ) (r : Bool) (hkj : k ≤ j) :
 (correctionTermM657 k (s+1) (m+1) r:ℝ) ≤
 (correctionTermM657 k (s+1) 1 r:ℝ)*(j.choose m:ℝ) := by
 have ha := shifted_choose_budgetMBE3 (k+s+4) j s m (by omega)
 have hb := shifted_choose_budgetMBE3 (k+s+3) j s m (by omega)
 unfold correctionTermM657
 simp only [show s+1+(m+1)+1=s+m+3 by omega,
   show k+(s+1)+3=k+s+4 by omega,show k+(s+1)+2=k+s+3 by omega,
   show s+1+(m+1)+3=s+m+5 by omega,show s+1+1+1=s+3 by omega,
   show s+1+1+3=s+5 by omega,Nat.choose_one_right]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> push_cast <;>
   nlinarith only [ha,hb]

theorem correction_relativeMBE3 (j k s m : ℕ) (r : Bool) (hkj : k ≤ j) :
 (liftTermMAE9 j s 0:ℝ)*(correctionTermM657 k (s+1) (m+1) r:ℝ) ≤
 (correctionTermM657 k (s+1) 1 r:ℝ)*(liftTermMAE9 j s m:ℝ) := by
 have ha := correction_choose_budgetMBE3 j k s m r hkj
 have hb := correction_second_relativeMBE3 j k s m r hkj
 have he : ((j+s+3).choose (s+3):ℝ)*(j.choose m:ℝ)=
   ((s+m+3).choose m:ℝ)*((j+s+3).choose (s+m+3):ℝ) := by
   have h := binomial_product_liftMAE9 j s m
   rw [←Nat.choose_symm (by omega : j ≤ s+j+3),show s+j+3-j=s+3 by omega] at h
   have h' : (j.choose m:ℝ)*((s+j+3).choose (s+3):ℝ)=
     ((s+m+3).choose m:ℝ)*((s+j+3).choose (s+m+3):ℝ) := by exact_mod_cast h
   simpa only [Nat.add_comm j s,mul_comm] using h'
 have h := mul_le_mul_of_nonneg_left ha (show 0 ≤ ((j+s+3).choose (s+3):ℝ) by positivity)
 have h' : ((j+s+3).choose (s+3):ℝ)*(correctionTermM657 k (s+1) (m+1) r:ℝ) ≤
   (correctionTermM657 k (s+1) 1 r:ℝ)*
    (((s+m+3).choose m:ℝ)*((j+s+3).choose (s+m+3):ℝ)) := by
   calc
    _ ≤ _ := h
    _ = _ := by rw [←he]; ring
 unfold liftTermMAE9 transposedBaseMBE3 at *
 simp only [Nat.add_zero,Nat.choose_zero_right,Nat.cast_one,one_mul,
   show s+j=j+s by omega] at *
 push_cast
 nlinarith only [h',hb]

end
end MathGKM.Markov
