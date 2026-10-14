import MarkovSquares3556

/-! Machine-authored request 3556cd95. Denominator-cleared exact low-u jets. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem fib_zero_jet3556 (n : ℕ) : (fib6 n).coeff 0=(X:Polynomial ℤ)^n := by
  induction n using Nat.twoStepInduction with
  | zero => norm_num [fib_zero6,Polynomial.coeff_one]
  | one => simp [fib_one6,U,V]
  | more n ih ih' =>
    rw [fib_rec6]
    simp only [S,U,V,Polynomial.coeff_sub,Polynomial.mul_coeff_zero,
      Polynomial.coeff_add,Polynomial.coeff_X_zero,Polynomial.coeff_C_zero,
      Polynomial.coeff_one_zero,zero_add,ih,ih']
    ring

theorem fib_jet_rec3556 (n i : ℕ) :
    (fib6 (n+2)).coeff (i+1)=(fib6 (n+1)).coeff i+
      (X+1)*(fib6 (n+1)).coeff (i+1)-X*(fib6 n).coeff (i+1) := by
  rw [fib_rec6]
  simp [S,U,V,add_mul,Polynomial.coeff_X_mul,Polynomial.coeff_C_mul]
  ring

theorem fib_first_cleared3556 (n : ℕ) :
    (1-X)^2*(fib6 n).coeff 1=
      1-C (n+1 : ℤ)*X^n+C (n:ℤ)*X^(n+1) := by
  induction n using Nat.twoStepInduction with
  | zero => norm_num [fib_zero6,Polynomial.coeff_one]
  | one => norm_num [fib_one6,U,V,Polynomial.coeff_X,Polynomial.coeff_one]; ring
  | more n ih ih' =>
    rw [show 1=0+1 from rfl,fib_jet_rec3556,fib_zero_jet3556]
    have h : (1-X)^2*((fib6 (n+1)).coeff 0+
      (X+1)*(fib6 (n+1)).coeff 1-X*(fib6 n).coeff 1)=
      (1-X)^2*(fib6 (n+1)).coeff 0+
      (X+1)*((1-X)^2*(fib6 (n+1)).coeff 1)-X*((1-X)^2*(fib6 n).coeff 1) := by ring
    rw [fib_zero_jet3556] at h
    rw [h,ih,ih']
    push_cast
    simp only [map_add,map_sub,map_mul,map_natCast,map_intCast,map_one,map_ofNat,pow_succ]
    ring

theorem fib_second_cleared3556 (n : ℕ) :
    2*(1-X)^4*(fib6 n).coeff 2=
      C (2*((n:ℤ)-1))-C (2*((n:ℤ)+2))*X+
      C (((n:ℤ)+1)*((n:ℤ)+2))*X^n-
      C (2*((n:ℤ)-1)*((n:ℤ)+2))*X^(n+1)+
      C ((n:ℤ)*((n:ℤ)-1))*X^(n+2) := by
  induction n using Nat.twoStepInduction with
  | zero => norm_num [fib_zero6,Polynomial.coeff_one]; ring
  | one => norm_num [fib_one6,U,V,Polynomial.coeff_X,Polynomial.coeff_one]; ring
  | more n ih ih' =>
    rw [show 2=1+1 from rfl,fib_jet_rec3556]
    have h : 2*(1-X)^4*((fib6 (n+1)).coeff 1+
      (X+1)*(fib6 (n+1)).coeff 2-X*(fib6 n).coeff 2)=
      2*(1-X)^2*((1-X)^2*(fib6 (n+1)).coeff 1)+
      (X+1)*(2*(1-X)^4*(fib6 (n+1)).coeff 2)-X*(2*(1-X)^4*(fib6 n).coeff 2) := by ring
    rw [h,fib_first_cleared3556,ih,ih']
    push_cast
    simp only [map_add,map_sub,map_mul,map_natCast,map_intCast,map_one,map_ofNat,pow_succ]
    ring

#print axioms fib_first_cleared3556
#print axioms fib_second_cleared3556
end
end MathGKM.Markov
