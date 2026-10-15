import MarkovRunScalarBDEE
/-! Machine-authored bdee9a64. Denominator-cleared run jet formulas.
Candidate generation is followed by universal Lean recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
set_option linter.unusedSimpArgs false

theorem run_base_2_0BDEE : runEntryBDEE 2 0=U^1*C (1*X) := by
 change (lowerMatrix487 0).c=_
 norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,map_add,map_mul,map_pow,map_ofNat]
 <;> ring

theorem run_base_2_1BDEE : runEntryBDEE 2 1=U^0*C (2*X) + U^1*C (3*X + 2*X^2) + U^2*C (1*X + 2*X^2 + 1*X^3) := by
 change (lowerMatrix487 1).c=_
 norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,map_add,map_mul,map_pow,map_ofNat]
 <;> ring

def jetClosed20BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (12*X)+X^n*(-12*X)

theorem jet_closed_20BDEE (n : ℕ) :
 6*(1-X)^1*(runEntryBDEE 2 n).coeff 0=jetClosed20BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_2_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed20BDEE]
   <;> ring
 | one =>
   rw [run_base_2_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed20BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_zero_recurrenceBDEE 2 n
   have he : jetClosed20BDEE (n+2)=(1+X)*jetClosed20BDEE (n+1)-X*jetClosed20BDEE n := by
     simp only [jetClosed20BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)*h+(1+X)*ih1-X*ih
#print axioms jet_closed_20BDEE

def jetClosed21BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (6*X + -66*X^2 + -30*X^3 + -6*X^4 + 12*N*X + 12*N*X^2 + -12*N*X^3 + -12*N*X^4)+X^n*(48*X^2 + 48*X^3 + 12*N*X + 12*N*X^2 + -12*N*X^3 + -12*N*X^4)

theorem jet_closed_21BDEE (n : ℕ) :
 6*(1-X)^3*(runEntryBDEE 2 n).coeff 1=jetClosed21BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_2_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed21BDEE]
   <;> ring
 | one =>
   rw [run_base_2_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed21BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 2 n 0
   have hp := jet_closed_20BDEE (n+1)
   have he : jetClosed21BDEE (n+2)=(1+X)*jetClosed21BDEE (n+1)-X*jetClosed21BDEE n+
       (1-X)^2*(1+X)^2*jetClosed20BDEE (n+1) := by
     simp only [jetClosed21BDEE,jetClosed20BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^3*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_21BDEE

def jetClosed22BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (66*X^2 + 294*X^3 + 444*X^4 + 276*X^5 + 66*X^6 + 6*X^7 + -84*N*X^2 + -132*N*X^3 + 24*N*X^4 + 120*N*X^5 + 60*N*X^6 + 12*N*X^7 + 6*N^2*X + 12*N^2*X^2 + -6*N^2*X^3 + -24*N^2*X^4 + -6*N^2*X^5 + 12*N^2*X^6 + 6*N^2*X^7)+X^n*(-66*X^2 + -294*X^3 + -444*X^4 + -276*X^5 + -66*X^6 + -6*X^7 + -6*N*X + -72*N*X^2 + -126*N*X^3 + 126*N*X^5 + 72*N*X^6 + 6*N*X^7 + -6*N^2*X + -12*N^2*X^2 + 6*N^2*X^3 + 24*N^2*X^4 + 6*N^2*X^5 + -12*N^2*X^6 + -6*N^2*X^7)

theorem jet_closed_22BDEE (n : ℕ) :
 6*(1-X)^5*(runEntryBDEE 2 n).coeff 2=jetClosed22BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_2_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed22BDEE]
   <;> ring
 | one =>
   rw [run_base_2_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed22BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 2 n 1
   have hp := jet_closed_21BDEE (n+1)
   have he : jetClosed22BDEE (n+2)=(1+X)*jetClosed22BDEE (n+1)-X*jetClosed22BDEE n+
       (1-X)^2*(1+X)^2*jetClosed21BDEE (n+1) := by
     simp only [jetClosed22BDEE,jetClosed21BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^5*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_22BDEE

def jetClosed23BDEE (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 (-84*X^2 + -750*X^3 + -2526*X^4 + -4374*X^5 + -4302*X^6 + -2442*X^7 + -762*X^8 + -114*X^9 + -6*X^10 + 1*N*X + 123*N*X^2 + 612*N*X^3 + 1084*N*X^4 + 558*N*X^5 + -630*N*X^6 + -1036*N*X^7 + -564*N*X^8 + -135*N*X^9 + -13*N*X^10 + -3*N^2*X + -57*N^2*X^2 + -132*N^2*X^3 + -12*N^2*X^4 + 222*N^2*X^5 + 186*N^2*X^6 + -36*N^2*X^7 + -108*N^2*X^8 + -51*N^2*X^9 + -9*N^2*X^10 + 2*N^3*X + 6*N^3*X^2 + -16*N^3*X^4 + -12*N^3*X^5 + 12*N^3*X^6 + 16*N^3*X^7 + -6*N^3*X^9 + -2*N^3*X^10)+X^n*(84*X^2 + 750*X^3 + 2526*X^4 + 4374*X^5 + 4302*X^6 + 2442*X^7 + 762*X^8 + 114*X^9 + 6*X^10 + 4*N*X + 126*N*X^2 + 600*N*X^3 + 1072*N*X^4 + 576*N*X^5 + -612*N*X^6 + -1048*N*X^7 + -576*N*X^8 + -132*N*X^9 + -10*N*X^10 + 6*N^2*X + 54*N^2*X^2 + 120*N^2*X^3 + 24*N^2*X^4 + -204*N^2*X^5 + -204*N^2*X^6 + 24*N^2*X^7 + 120*N^2*X^8 + 54*N^2*X^9 + 6*N^2*X^10 + 2*N^3*X + 6*N^3*X^2 + -16*N^3*X^4 + -12*N^3*X^5 + 12*N^3*X^6 + 16*N^3*X^7 + -6*N^3*X^9 + -2*N^3*X^10)

theorem jet_closed_23BDEE (n : ℕ) :
 6*(1-X)^7*(runEntryBDEE 2 n).coeff 3=jetClosed23BDEE n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_2_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed23BDEE]
   <;> ring
 | one =>
   rw [run_base_2_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [jetClosed23BDEE]
   <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE 2 n 2
   have hp := jet_closed_22BDEE (n+1)
   have he : jetClosed23BDEE (n+2)=(1+X)*jetClosed23BDEE (n+1)-X*jetClosed23BDEE n+
       (1-X)^2*(1+X)^2*jetClosed22BDEE (n+1) := by
     simp only [jetClosed23BDEE,jetClosed22BDEE,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^7*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
#print axioms jet_closed_23BDEE
end
end MathGKM.Markov
