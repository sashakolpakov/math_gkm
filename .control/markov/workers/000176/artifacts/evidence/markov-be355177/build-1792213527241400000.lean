import MarkovTransposedBoundsMBE3
/-! Machine-authored be355177. A universal separated-top binomial bound,
motivated by the two distinct parameters in the source correction kernel. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem choose_rise_threeMBE3 (p q : ℕ) :
 ((p+q+3).choose q:ℝ)*(p+1)*(p+2)*(p+3)=
 ((p+q).choose q:ℝ)*(p+q+1)*(p+q+2)*(p+q+3) := by
 have h0 := Nat.choose_mul_succ_eq (p+q) q
 have h1 := Nat.choose_mul_succ_eq (p+q+1) q
 have h2 := Nat.choose_mul_succ_eq (p+q+2) q
 rw [show p+q+1-q=p+1 by omega] at h0
 rw [show p+q+1+1-q=p+2 by omega,show p+q+1+1=p+q+2 by omega] at h1
 rw [show p+q+2+1-q=p+3 by omega,show p+q+2+1=p+q+3 by omega] at h2
 have h0' : ((p+q).choose q:ℝ)*(p+q+1)=((p+q+1).choose q:ℝ)*(p+1) := by exact_mod_cast h0
 have h1' : ((p+q+1).choose q:ℝ)*(p+q+2)=((p+q+2).choose q:ℝ)*(p+2) := by exact_mod_cast h1
 have h2' : ((p+q+2).choose q:ℝ)*(p+q+3)=((p+q+3).choose q:ℝ)*(p+3) := by exact_mod_cast h2
 linear_combination -(p+q+2:ℝ)*(p+q+3)*h0'-(p+1:ℝ)*(p+q+3)*h1'-(p+1:ℝ)*(p+2)*h2'

theorem separated_step_certificateMBE3 (u s : ℝ) (hu : 0 ≤ u) (hs : 0 ≤ s) :
 (u+1+s+5)*(3*(u+1)+2)*(3*(u+1)+3)*(3*(u+1)+4) ≤
 (u+1)*(3*(u+1)+s+7)*(3*(u+1)+s+8)*(3*(u+1)+s+9) := by
 have he : (u+1)*(3*(u+1)+s+7)*(3*(u+1)+s+8)*(3*(u+1)+s+9)-
   (u+1+s+5)*(3*(u+1)+2)*(3*(u+1)+3)*(3*(u+1)+4)=
   60+152*s+33*s^2+s^3+270*u+239*u*s+42*u*s^2+u*s^3+
   90*u^2+63*u^2*s+9*u^2*s^2 := by ring
 have hp : 0 ≤ 60+152*s+33*s^2+s^3+270*u+239*u*s+42*u*s^2+u*s^3+
   90*u^2+63*u^2*s+9*u^2*s^2 := by positivity
 linarith

theorem separated_chooseMBE3 (k s : ℕ) (hk : 1 ≤ k) :
 ((s+9).choose 4:ℝ)*((k+s+4).choose (s+5):ℝ) ≤
 ((3*k+s+6).choose (s+5):ℝ) := by
 induction k, hk using Nat.le_induction with
 | base =>
   rw [show 1+s+4=s+5 by omega,show 3*1+s+6=s+9 by omega,Nat.choose_self]
   simp only [Nat.cast_one,mul_one]
   rw [←Nat.choose_symm (by omega : s+5 ≤ s+9),show s+9-(s+5)=4 by omega]
 | succ k hk ih =>
   have hA := Nat.choose_mul_succ_eq (k+s+4) (s+5)
   rw [show k+s+4+1=k+1+s+4 by omega,show k+1+s+4-(s+5)=k by omega] at hA
   have hA' : ((k+s+4).choose (s+5):ℝ)*(k+s+5)=
     ((k+1+s+4).choose (s+5):ℝ)*k := by exact_mod_cast hA
   have hB := choose_rise_threeMBE3 (3*k+1) (s+5)
   simp only [show 3*k+1+(s+5)+3=3*(k+1)+s+6 by omega,
     show 3*k+1+(s+5)=3*k+s+6 by omega] at hB
   push_cast at hB
   have hS := separated_step_certificateMBE3 (k-1) s (by exact_mod_cast hk) (by positivity)
   simp only [sub_add_cancel] at hS
   have hp : (0:ℝ)<k*((3*k+2)*(3*k+3)*(3*k+4)) := by
     have hk' : (0:ℝ)<k := by exact_mod_cast (show 0<k by omega)
     positivity
   apply (mul_le_mul_iff_of_pos_right hp).mp
   calc
    _ = ((s+9).choose 4:ℝ)*((k+s+4).choose (s+5):ℝ)*(k+s+5)*
        ((3*k+2)*(3*k+3)*(3*k+4)) := by
      linear_combination -((s+9).choose 4:ℝ)*((3*k+2)*(3*k+3)*(3*k+4))*hA'
    _ ≤ ((3*k+s+6).choose (s+5):ℝ)*(k+s+5)*
        ((3*k+2)*(3*k+3)*(3*k+4)) := by
      exact mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right ih (by positivity)) (by positivity)
    _ ≤ ((3*k+s+6).choose (s+5):ℝ)*
        (k*(3*k+s+7)*(3*k+s+8)*(3*k+s+9)) := by
      have h := mul_le_mul_of_nonneg_left hS (show 0 ≤ ((3*k+s+6).choose (s+5):ℝ) by positivity)
      nlinarith only [h]
    _ = _ := by linear_combination -(k:ℝ)*hB

end
end MathGKM.Markov
