import MarkovRunScalarBDEE
/-! Machine-authored bdee9a64. Denominator-cleared run jet formulas.
Candidate generation is followed by universal Lean recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
set_option linter.unusedSimpArgs false

theorem run_base_3_0BDEE : runEntryBDEE 3 0=U^0*C (1) + U^1*C (1) := by
 change (lowerMatrix487 0).d=_
 norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,map_add,map_mul,map_pow,map_ofNat]
 <;> ring

theorem run_base_3_1BDEE : runEntryBDEE 3 1=U^0*C (1) + U^1*C (2 + 1*X) + U^2*C (1 + 2*X + 1*X^2) := by
 change (lowerMatrix487 1).d=_
 norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,map_add,map_mul,map_pow,map_ofNat]
 <;> ring

def jetClosed30BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (6 + -6*X)+X^n*(0)

theorem jet_closed_30BDEE (n : ℕ) :
 6*(1-X)^1*(runEntryBDEE 3 n).coeff 0=jetClosed30BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_3_0BDEE]
   norm_num [jetClosed30BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | one =>
   rw [run_base_3_1BDEE]
   norm_num [jetClosed30BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_zero_recurrenceBDEE 3 n
   have he : jetClosed30BDEE (n+2)=(1+X)*jetClosed30BDEE (n+1)-X*jetClosed30BDEE n := by
     simp only [jetClosed30BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)*h+(1+X)*ih1-X*ih
#print axioms jet_closed_30BDEE

def jetClosed31BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (6 + -30*X + 18*X^2 + 6*X^3 + 6*N + -12*N*X^2 + 6*N*X^4)+X^n*(12*X + -12*X^3)

theorem jet_closed_31BDEE (n : ℕ) :
 6*(1-X)^3*(runEntryBDEE 3 n).coeff 1=jetClosed31BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_3_0BDEE]
   norm_num [jetClosed31BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | one =>
   rw [run_base_3_1BDEE]
   norm_num [jetClosed31BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 3 n 0
   have hp := jet_closed_30BDEE (n+1)
   have he : jetClosed31BDEE (n+2)=(1+X)*jetClosed31BDEE (n+1)-X*jetClosed31BDEE n+
       (1-X)^2*(1+X)^2*jetClosed30BDEE (n+1) := by
     simp only [jetClosed31BDEE,jetClosed30BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^3*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_31BDEE

def jetClosed32BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (12*X + 60*X^2 + 48*X^3 + -48*X^4 + -60*X^5 + -12*X^6 + 3*N + -33*N*X + -21*N*X^2 + 63*N*X^3 + 33*N*X^4 + -27*N*X^5 + -15*N*X^6 + -3*N*X^7 + 3*N^2 + 3*N^2*X + -9*N^2*X^2 + -9*N^2*X^3 + 9*N^2*X^4 + 9*N^2*X^5 + -3*N^2*X^6 + -3*N^2*X^7)+X^n*(-12*X + -60*X^2 + -48*X^3 + 48*X^4 + 60*X^5 + 12*X^6 + -12*N*X + -12*N*X^2 + 24*N*X^3 + 24*N*X^4 + -12*N*X^5 + -12*N*X^6)

theorem jet_closed_32BDEE (n : ℕ) :
 6*(1-X)^5*(runEntryBDEE 3 n).coeff 2=jetClosed32BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_3_0BDEE]
   norm_num [jetClosed32BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | one =>
   rw [run_base_3_1BDEE]
   norm_num [jetClosed32BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 3 n 1
   have hp := jet_closed_31BDEE (n+1)
   have he : jetClosed32BDEE (n+2)=(1+X)*jetClosed32BDEE (n+1)-X*jetClosed32BDEE n+
       (1-X)^2*(1+X)^2*jetClosed31BDEE (n+1) := by
     simp only [jetClosed32BDEE,jetClosed31BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^5*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_32BDEE

def jetClosed33BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (-12*X + -150*X^2 + -462*X^3 + -510*X^4 + 18*X^5 + 510*X^6 + 438*X^7 + 150*X^8 + 18*X^9 + -1*N + 31*N*X + 150*N*X^2 + 164*N*X^3 + -158*N*X^4 + -390*N*X^5 + -128*N*X^6 + 164*N*X^7 + 135*N*X^8 + 31*N*X^9 + 2*N*X^10 + -21*N^2*X + -33*N^2*X^2 + 48*N^2*X^3 + 96*N^2*X^4 + -18*N^2*X^5 + -90*N^2*X^6 + -24*N^2*X^7 + 24*N^2*X^8 + 15*N^2*X^9 + 3*N^2*X^10 + 1*N^3 + 2*N^3*X + -3*N^3*X^2 + -8*N^3*X^3 + 2*N^3*X^4 + 12*N^3*X^5 + 2*N^3*X^6 + -8*N^3*X^7 + -3*N^3*X^8 + 2*N^3*X^9 + 1*N^3*X^10)+X^n*(12*X + 150*X^2 + 462*X^3 + 510*X^4 + -18*X^5 + -510*X^6 + -438*X^7 + -150*X^8 + -18*X^9 + 18*N*X + 96*N*X^2 + 120*N*X^3 + -96*N*X^4 + -276*N*X^5 + -96*N*X^6 + 120*N*X^7 + 96*N*X^8 + 18*N*X^9 + 6*N^2*X + 12*N^2*X^2 + -12*N^2*X^3 + -36*N^2*X^4 + 36*N^2*X^6 + 12*N^2*X^7 + -12*N^2*X^8 + -6*N^2*X^9)

theorem jet_closed_33BDEE (n : ℕ) :
 6*(1-X)^7*(runEntryBDEE 3 n).coeff 3=jetClosed33BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_3_0BDEE]
   norm_num [jetClosed33BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | one =>
   rw [run_base_3_1BDEE]
   norm_num [jetClosed33BDEE,U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 3 n 2
   have hp := jet_closed_32BDEE (n+1)
   have he : jetClosed33BDEE (n+2)=(1+X)*jetClosed33BDEE (n+1)-X*jetClosed33BDEE n+
       (1-X)^2*(1+X)^2*jetClosed32BDEE (n+1) := by
     simp only [jetClosed33BDEE,jetClosed32BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^7*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_33BDEE
end
end MathGKM.Markov
