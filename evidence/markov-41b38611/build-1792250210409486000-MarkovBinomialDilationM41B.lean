import MarkovMiddleCrossObstructionMD02
/-! Machine-authored 41b38611. Uniform binomial comparison tools. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 2000000

theorem desc_dilationM41B (m k n : ℕ) :
 m^n*k.descFactorial n ≤ (m*k).descFactorial n := by
 induction n with
 | zero => simp
 | succ n ih =>
   rw [Nat.descFactorial_succ,Nat.descFactorial_succ,pow_succ]
   have h : m*(k-n) ≤ m*k-n := by
     by_cases hn : n ≤ k
     · rw [Nat.mul_sub_left_distrib]
       by_cases hm : m=0
       · simp [hm]
       · have : n ≤ m*n := Nat.le_mul_of_pos_left n (Nat.pos_of_ne_zero hm)
         omega
     · simp [Nat.sub_eq_zero_of_le (by omega : k ≤ n)]
   calc
    _ = (m*(k-n))*(m^n*k.descFactorial n) := by ring
    _ ≤ (m*k-n)*(m*k).descFactorial n := Nat.mul_le_mul h ih

theorem choose_dilationM41B (m k n : ℕ) :
 m^n*k.choose n ≤ (m*k).choose n := by
 have h := desc_dilationM41B m k n
 rw [Nat.descFactorial_eq_factorial_mul_choose,Nat.descFactorial_eq_factorial_mul_choose] at h
 have hf := Nat.factorial_pos n
 nlinarith

theorem choose_dilation_leM41B (m k n T : ℕ) (hT : m*k ≤ T) :
 m^n*k.choose n ≤ T.choose n :=
 (choose_dilationM41B m k n).trans (Nat.choose_le_choose n hT)

theorem choose_lower_stepM41B (N a b : ℕ) (hab : a ≤ b) (hb : 2*b ≤ N) :
 N.choose a ≤ N.choose b := by
 induction b with
 | zero => simp only [Nat.le_zero] at hab; subst a; rfl
 | succ b ih =>
   by_cases he : a=b+1
   · subst a; rfl
   · exact (ih (by omega) (by omega)).trans (Nat.choose_le_succ_of_lt_half_left (by omega))

theorem choose_upper_stepM41B (N a : ℕ) (ha : 2*a ≤ N) :
 (N+1).choose a ≤ 2*N.choose a := by
 cases a with
 | zero => simp
 | succ a =>
   rw [Nat.choose_succ_succ]
   have h := choose_lower_stepM41B N a (a+1) (by omega) (by omega)
   change N.choose a+N.choose (a+1) ≤ 2*N.choose (a+1)
   omega

theorem choose_weight_shiftM41B (c l : ℕ) (hl : l ≤ c+2) :
 (c+1+l).choose (c+1) ≤ 3*(c+(l+1)).choose c := by
 have h := Nat.choose_succ_right_eq (c+1+l) c
 rw [show c+1+l-c=l+1 by omega] at h
 have h' : l+1 ≤ 3*(c+1) := by omega
 have hmul := Nat.mul_le_mul_left ((c+1+l).choose c) h'
 have he : c+1+l=c+(l+1) := by omega
 rw [he] at h hmul ⊢
 nlinarith

end
end MathGKM.Markov
