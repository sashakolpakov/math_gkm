import MarkovRunScalarBDEE
/-! Machine-authored bdee9a64. Denominator-cleared run jet formulas.
Candidate generation is followed by universal Lean recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
set_option linter.unusedSimpArgs false

def jetClosed00BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (0)+X^n*(0)

theorem jet_closed_00BDEE (n : ℕ) :
 6*(1-X)^1*(runEntryBDEE 0 n).coeff 0=jetClosed00BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed00BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul]
   <;> ring
 | one =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed00BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul,
     Polynomial.coeff_mul_C,Polynomial.coeff_C_mul]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_zero_recurrenceBDEE 0 n
   have he : jetClosed00BDEE (n+2)=(1+X)*jetClosed00BDEE (n+1)-X*jetClosed00BDEE n := by
     simp only [jetClosed00BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)*h+(1+X)*ih1-X*ih
#print axioms jet_closed_00BDEE

def jetClosed01BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (12*X + -24*X^2 + 12*X^3)+X^n*(-6*X + 6*X^2 + 6*X^3 + -6*X^4)

theorem jet_closed_01BDEE (n : ℕ) :
 6*(1-X)^3*(runEntryBDEE 0 n).coeff 1=jetClosed01BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed01BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul]
   <;> ring
 | one =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed01BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul,
     Polynomial.coeff_mul_C,Polynomial.coeff_C_mul]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 0 n 0
   have hp := jet_closed_00BDEE (n+1)
   have he : jetClosed01BDEE (n+2)=(1+X)*jetClosed01BDEE (n+1)-X*jetClosed01BDEE n+
       (1-X)^2*(1+X)^2*jetClosed00BDEE (n+1) := by
     simp only [jetClosed01BDEE,jetClosed00BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^3*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_01BDEE

def jetClosed02BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (-6*X + -18*X^2 + 12*X^3 + 36*X^4 + -6*X^5 + -18*X^6 + 12*N*X + -12*N*X^2 + -24*N*X^3 + 24*N*X^4 + 12*N*X^5 + -12*N*X^6)+X^n*(6*X + 18*X^2 + -12*X^3 + -36*X^4 + 6*X^5 + 18*X^6 + 6*N*X + -18*N*X^3 + 18*N*X^5 + -6*N*X^7)

theorem jet_closed_02BDEE (n : ℕ) :
 6*(1-X)^5*(runEntryBDEE 0 n).coeff 2=jetClosed02BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed02BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul]
   <;> ring
 | one =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed02BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul,
     Polynomial.coeff_mul_C,Polynomial.coeff_C_mul]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 0 n 1
   have hp := jet_closed_01BDEE (n+1)
   have he : jetClosed02BDEE (n+2)=(1+X)*jetClosed02BDEE (n+1)-X*jetClosed02BDEE n+
       (1-X)^2*(1+X)^2*jetClosed01BDEE (n+1) := by
     simp only [jetClosed02BDEE,jetClosed01BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^5*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_02BDEE

def jetClosed03BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (6*X + 54*X^2 + 102*X^3 + -18*X^4 + -198*X^5 + -126*X^6 + 66*X^7 + 90*X^8 + 24*X^9 + -12*N*X + -36*N*X^2 + 12*N*X^3 + 108*N*X^4 + 36*N*X^5 + -108*N*X^6 + -60*N*X^7 + 36*N*X^8 + 24*N*X^9 + 6*N^2*X + -24*N^2*X^3 + 36*N^2*X^5 + -24*N^2*X^7 + 6*N^2*X^9)+X^n*(-6*X + -54*X^2 + -102*X^3 + 18*X^4 + 198*X^5 + 126*X^6 + -66*X^7 + -90*X^8 + -24*X^9 + -9*N*X + -33*N*X^2 + 96*N*X^4 + 54*N*X^5 + -90*N*X^6 + -72*N*X^7 + 24*N*X^8 + 27*N*X^9 + 3*N*X^10 + -3*N^2*X + -3*N^2*X^2 + 12*N^2*X^3 + 12*N^2*X^4 + -18*N^2*X^5 + -18*N^2*X^6 + 12*N^2*X^7 + 12*N^2*X^8 + -3*N^2*X^9 + -3*N^2*X^10)

theorem jet_closed_03BDEE (n : ℕ) :
 6*(1-X)^7*(runEntryBDEE 0 n).coeff 3=jetClosed03BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed03BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul]
   <;> ring
 | one =>
   norm_num [runEntryBDEE,lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     jetClosed03BDEE,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul,
     Polynomial.coeff_mul_C,Polynomial.coeff_C_mul]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 0 n 2
   have hp := jet_closed_02BDEE (n+1)
   have he : jetClosed03BDEE (n+2)=(1+X)*jetClosed03BDEE (n+1)-X*jetClosed03BDEE n+
       (1-X)^2*(1+X)^2*jetClosed02BDEE (n+1) := by
     simp only [jetClosed03BDEE,jetClosed02BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^7*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_03BDEE
end
end MathGKM.Markov
