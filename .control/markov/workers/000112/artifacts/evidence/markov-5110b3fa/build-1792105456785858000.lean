import MarkovHorizontalScaledM13D
/-! Machine-authored request 5110b3fa. Exact fourth-row polynomial data. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false

def h4c0M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 96*z

def h4c1M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 -192*q+192*q^2-1056*u+288*a*u+192*w

def h4c2M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 1248*q-1392*a*q+432*a^2*q-480*t+288*a*t-1056*u+96*a*u+96*b*u+96*v

def h4c3M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 24-78*a+147*a^2-54*a^3+81*a^4+3456*q-2880*a*q+288*a^2*q-384*b*q+288*a*b*q-864*t+96*a*t+96*b*t

def h4c4M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 96-456*a+144*a^2-612*a^3+108*a^4+96*a*b+36*a^2*b+108*a^3*b+2688*q-720*a*q+48*a^2*q-720*b*q+96*a*b*q+48*b^2*q

def h4c5M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 144-96*a+1098*a^2-480*a^3+54*a^4-120*b-150*a*b-438*a^2*b+108*a^3*b+24*b^2+42*a*b^2+54*a^2*b^2

def h4c6M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 96-536*a+432*a^2-124*a^3+12*a^4+40*b+384*a*b-240*a^2*b+36*a^3*b-48*b^2-108*a*b^2+36*a^2*b^2+8*b^3+12*a*b^3

def h4c7M511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R :=
 24-50*a+35*a^2-10*a^3+a^4-50*b+70*a*b-30*a^2*b+4*a^3*b+35*b^2-30*a*b^2+6*a^2*b^2-10*b^3+4*a*b^3+b^4

def h4seedM511 {R : Type*} [CommRing R] (a b q t u v w z : R) : R[X] :=
 C (h4c0M511 a b q t u v w z)+
 C (h4c1M511 a b q t u v w z)*X^1+
 C (h4c2M511 a b q t u v w z)*X^2+
 C (h4c3M511 a b q t u v w z)*X^3+
 C (h4c4M511 a b q t u v w z)*X^4+
 C (h4c5M511 a b q t u v w z)*X^5+
 C (h4c6M511 a b q t u v w z)*X^6+
 C (h4c7M511 a b q t u v w z)*X^7

def h4vM511 (a b : ℕ) : ℕ := if 2*a≤b then min (b-2*a) (4*a-b) else 0

def h4wM511 (a b : ℕ) : ℕ := if 2*a≤b then 0 else if 3*a≤2*b then 2*a-b else b-a

def h4zM511 (a b : ℕ) : ℕ := 4*a-3*b

def H4BoundsM511 (a b q t u v w z : ℝ) : Prop :=
 0 ≤ h4c0M511 a b q t u v w z ∧
 0 ≤ h4c1M511 a b q t u v w z ∧
 0 ≤ h4c2M511 a b q t u v w z ∧
 0 < h4c3M511 a b q t u v w z ∧
 0 < h4c4M511 a b q t u v w z ∧
 0 < h4c5M511 a b q t u v w z ∧
 0 < h4c6M511 a b q t u v w z ∧
 0 < h4c7M511 a b q t u v w z ∧
 h4c0M511 a b q t u v w z*h4c2M511 a b q t u v w z ≤ (h4c1M511 a b q t u v w z)^2 ∧
 h4c1M511 a b q t u v w z*h4c3M511 a b q t u v w z ≤ (h4c2M511 a b q t u v w z)^2 ∧
 h4c2M511 a b q t u v w z*h4c4M511 a b q t u v w z ≤ (h4c3M511 a b q t u v w z)^2 ∧
 h4c3M511 a b q t u v w z*h4c5M511 a b q t u v w z ≤ (h4c4M511 a b q t u v w z)^2 ∧
 h4c4M511 a b q t u v w z*h4c6M511 a b q t u v w z ≤ (h4c5M511 a b q t u v w z)^2 ∧
 h4c5M511 a b q t u v w z*h4c7M511 a b q t u v w z ≤ (h4c6M511 a b q t u v w z)^2
end
end MathGKM.Markov
