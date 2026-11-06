import MathGKM.Round88CellsA
/- Machine-authored round88. Exact alpha-count-one boundary-class formulas.
No log-concavity closure or sign premise is used. -/
namespace SparseColorR88
set_option maxSynthPendingDepth 128
open Polynomial
noncomputable section

theorem one_two_step_one (n : ℕ) :
    A 1 (2*n+4) 1=Ccell*A 1 (2*n+2) 1+u*T^2*Ccell^n := by
  have he := one_step (2*n+2) 1
  have ho := one_step (2*n+1) 1
  have hp : (2*n+2+1)%2=1 := by omega
  have hq : (2*n+1+1)%2=0 := by omega
  simp only [hp,show ¬(1:ℕ)=0 by omega,if_false] at he
  simp only [hq,if_true] at ho
  have hz := (zero_orientation_one n).2
  have heq : 2*n+2+1=(2*n+1)+2 := by omega
  have heq2 : 2*n+1+1=2*n+2 := by omega
  rw [show 2*n+4=(2*n+2)+2 by omega,he,heq,ho,heq2,hz]
  simp only [Ccell]
  ring

theorem one_even_one (n : ℕ) :
    A 1 (2*n+4) 1=(n+1 : ℕ)*u*T^2*Ccell^n := by
  induction n with
  | zero =>
    have h2 := one_step 0 1
    have hb := A_boundaries 1
    simp only [hb.2.2.1,hb.2.2.2,zero_add,Nat.reduceMod,if_false,mul_zero,add_zero] at h2
    rw [show 2*0+4=2*0+4 by rfl,one_two_step_one]
    simp [h2]
  | succ n ih =>
    have h := one_two_step_one (n+1)
    rw [show 2*(n+1)+2=2*n+4 by omega,ih] at h
    rw [show 2*(n+1)+4=2*(n+1)+4 by rfl,h,pow_succ]
    push_cast
    ring

theorem one_two_step_zero (n : ℕ) :
    A 1 (2*n+6) 0=Ccell*A 1 (2*n+4) 0+u*T^4*Ccell^n := by
  have he := one_step (2*n+4) 0
  have ho := one_step (2*n+3) 0
  have hp := one_step (2*n+2) 0
  have p0 : (2*n+4+0)%2=0 := by omega
  have p1 : (2*n+3+0)%2=1 := by omega
  have p2 : (2*n+2+0)%2=0 := by omega
  simp only [p0,if_true] at he
  simp only [p1,show ¬(1:ℕ)=0 by omega,if_false] at ho
  simp only [p2,if_true] at hp
  have hz0 := (zero_orientation_zero n).2
  have hz1 := (zero_orientation_zero (n+1)).2
  rw [show 2*(n+1)+2=2*n+4 by omega] at hz1
  rw [hz0] at hp
  rw [hz1] at he
  have e0 : 2*n+4+2=2*n+6 := by omega
  have e1 : 2*n+4+1=2*n+3+2 := by omega
  have e2 : 2*n+3+1=2*n+4 := by omega
  have e3 : 2*n+2+2=2*n+4 := by omega
  have e4 : 2*n+2+1=2*n+3 := by omega
  rw [e0,e1] at he
  rw [e2] at ho
  rw [e3,e4] at hp
  simp only [pow_succ,Ccell] at he hp ⊢
  linear_combination he + T*ho - (z*v)*hp

theorem one_even_zero (n : ℕ) :
    A 1 (2*n+6) 0=u*T^2*Ccell^n*((n+3 : ℕ)*T^2+2*z*v) := by
  induction n with
  | zero =>
    have hb := A_boundaries 0
    have h2 := one_step 0 0
    have h3 := one_step 1 0
    have h4 := one_step 2 0
    simp only [Nat.reduceAdd,Nat.reduceMod,if_true,if_false,hb.2.2.1,hb.2.2.2,
      hb.1,hb.2.1,mul_zero,zero_add,add_zero,mul_one] at h2 h3 h4
    have hz : A 0 2 0=T^2 := by simpa using (zero_orientation_zero 0).2
    rw [h2] at h3
    rw [h3,hz] at h4
    rw [show 2*0+6=2*0+6 by rfl,one_two_step_zero]
    norm_num at h4 ⊢
    rw [h4]
    simp only [Ccell]
    ring
  | succ n ih =>
    have h := one_two_step_zero (n+1)
    rw [show 2*(n+1)+4=2*n+6 by omega,ih] at h
    rw [h,pow_succ]
    push_cast
    ring

theorem one_odd_one (n : ℕ) :
    A 1 (2*n+5) 1=u*T*Ccell^n*((n+2 : ℕ)*T^2+z*v) := by
  have he := one_step (2*n+3) 1
  have hp : (2*n+3+1)%2=0 := by omega
  simp only [hp,if_true] at he
  have hz := (zero_orientation_one (n+1)).2
  rw [show 2*(n+1)+1=2*n+3 by omega] at hz
  rw [show 2*n+3+1=2*n+4 by omega,one_even_one,hz] at he
  rw [show 2*n+5=(2*n+3)+2 by omega,he,pow_succ]
  simp only [Ccell]
  push_cast
  ring

theorem T_ne_zero : T≠0 := by
  intro h
  have hc := congrArg (fun P : Three => P.coeff 1) h
  norm_num [T,u,v,coeff_add,coeff_X,coeff_C] at hc

theorem one_odd_zero (n : ℕ) :
    A 1 (2*n+5) 0=u*T*Ccell^n*((n+2 : ℕ)*T^2+z*v) := by
  have he := one_step (2*n+4) 0
  have hp : (2*n+4+0)%2=0 := by omega
  simp only [hp,if_true] at he
  have hz := (zero_orientation_zero (n+1)).2
  rw [show 2*(n+1)+2=2*n+4 by omega] at hz
  rw [show 2*n+4+2=2*n+6 by omega,one_even_zero,hz,
    show 2*n+4+1=2*n+5 by omega] at he
  apply mul_left_cancel₀ T_ne_zero
  simp only [pow_succ,Ccell] at he ⊢
  push_cast at he ⊢
  linear_combination -he
end
end SparseColorR88
#print axioms SparseColorR88.one_even_one
#print axioms SparseColorR88.one_even_zero
