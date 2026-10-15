import MarkovRunScalarBDEE
/-! Machine-authored bdee9a64. Denominator-cleared run jet formulas.
Candidate generation is followed by universal Lean recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
set_option linter.unusedSimpArgs false

theorem run_base_1_0BDEE : runEntryBDEE 1 0=U^1*C (1) := by
 change (lowerMatrix487 0).b=_
 norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,map_add,map_mul,map_pow,map_ofNat]
 <;> ring

theorem run_base_1_1BDEE : runEntryBDEE 1 1=U^1*C (1) + U^2*C (1 + 2*X + 1*X^2) := by
 change (lowerMatrix487 1).b=_
 norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,map_add,map_mul,map_pow,map_ofNat]
 <;> ring

def jetClosed10BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (0)+X^n*(0)

theorem jet_closed_10BDEE (n : ℕ) :
 6*(1-X)^1*(runEntryBDEE 1 n).coeff 0=jetClosed10BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_1_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed10BDEE]
   <;> ring
 | one =>
   rw [run_base_1_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed10BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_zero_recurrenceBDEE 1 n
   have he : jetClosed10BDEE (n+2)=(1+X)*jetClosed10BDEE (n+1)-X*jetClosed10BDEE n := by
     simp only [jetClosed10BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)*h+(1+X)*ih1-X*ih
#print axioms jet_closed_10BDEE

def jetClosed11BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (6 + -18*X + 18*X^2 + -6*X^3)+X^n*(0)

theorem jet_closed_11BDEE (n : ℕ) :
 6*(1-X)^3*(runEntryBDEE 1 n).coeff 1=jetClosed11BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_1_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed11BDEE]
   <;> ring
 | one =>
   rw [run_base_1_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed11BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 1 n 0
   have hp := jet_closed_10BDEE (n+1)
   have he : jetClosed11BDEE (n+2)=(1+X)*jetClosed11BDEE (n+1)-X*jetClosed11BDEE n+
       (1-X)^2*(1+X)^2*jetClosed10BDEE (n+1) := by
     simp only [jetClosed11BDEE,jetClosed10BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^3*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_11BDEE

def jetClosed12BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (-6*X + 6*X^2 + 12*X^3 + -12*X^4 + -6*X^5 + 6*X^6 + 6*N + -12*N*X + -6*N*X^2 + 24*N*X^3 + -6*N*X^4 + -12*N*X^5 + 6*N*X^6)+X^n*(6*X + -6*X^2 + -12*X^3 + 12*X^4 + 6*X^5 + -6*X^6)

theorem jet_closed_12BDEE (n : ℕ) :
 6*(1-X)^5*(runEntryBDEE 1 n).coeff 2=jetClosed12BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_1_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed12BDEE]
   <;> ring
 | one =>
   rw [run_base_1_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed12BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 1 n 1
   have hp := jet_closed_11BDEE (n+1)
   have he : jetClosed12BDEE (n+2)=(1+X)*jetClosed12BDEE (n+1)-X*jetClosed12BDEE n+
       (1-X)^2*(1+X)^2*jetClosed11BDEE (n+1) := by
     simp only [jetClosed12BDEE,jetClosed11BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^5*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_12BDEE

def jetClosed13BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (12*X + 18*X^2 + -30*X^3 + -54*X^4 + 18*X^5 + 54*X^6 + 6*X^7 + -18*X^8 + -6*X^9 + -3*N + -9*N*X + 12*N*X^2 + 36*N*X^3 + -18*N*X^4 + -54*N*X^5 + 12*N*X^6 + 36*N*X^7 + -3*N*X^8 + -9*N*X^9 + 3*N^2 + -3*N^2*X + -12*N^2*X^2 + 12*N^2*X^3 + 18*N^2*X^4 + -18*N^2*X^5 + -12*N^2*X^6 + 12*N^2*X^7 + 3*N^2*X^8 + -3*N^2*X^9)+X^n*(-12*X + -18*X^2 + 30*X^3 + 54*X^4 + -18*X^5 + -54*X^6 + -6*X^7 + 18*X^8 + 6*X^9 + -6*N*X + 24*N*X^3 + -36*N*X^5 + 24*N*X^7 + -6*N*X^9)

theorem jet_closed_13BDEE (n : ℕ) :
 6*(1-X)^7*(runEntryBDEE 1 n).coeff 3=jetClosed13BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_1_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed13BDEE]
   <;> ring
 | one =>
   rw [run_base_1_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed13BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 1 n 2
   have hp := jet_closed_12BDEE (n+1)
   have he : jetClosed13BDEE (n+2)=(1+X)*jetClosed13BDEE (n+1)-X*jetClosed13BDEE n+
       (1-X)^2*(1+X)^2*jetClosed12BDEE (n+1) := by
     simp only [jetClosed13BDEE,jetClosed12BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^7*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_13BDEE
end
end MathGKM.Markov
