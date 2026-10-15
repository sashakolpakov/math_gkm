import MarkovQuarticLCF650
/-! Machine-authored request 13d40bd7. Candidate third-row seed definitions.
No actual-source coefficient identity is assumed as an axiom. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def h3c0M13D {R : Type*} [CommRing R] (u : R) := 24*u
def h3c1M13D {R : Type*} [CommRing R] (a q t : R) := 24*t+(72*a-120)*q
def h3c2M13D {R : Type*} [CommRing R] (a b q : R) :=
 27*a^3-18*a^2+21*a-6+24*(a+b-7)*q
def h3c3M13D {R : Type*} [CommRing R] (a b : R) :=
 27*a^3+27*a^2*b-114*a^2+3*a*b+33*a+6*b-18
def h3c4M13D {R : Type*} [CommRing R] (a b : R) :=
 9*a^3+18*a^2*b-54*a^2+9*a*b^2-51*a*b+87*a+3*b^2-3*b-18
def h3c5M13D {R : Type*} [CommRing R] (a b : R) := (a+b-1)*(a+b-2)*(a+b-3)
def h3seedM13D {R : Type*} [CommRing R] (a b q t u : R) : R[X] :=
 C (h3c0M13D u)+C (h3c1M13D a q t)*X+C (h3c2M13D a b q)*X^2+
 C (h3c3M13D a b)*X^3+C (h3c4M13D a b)*X^4+C (h3c5M13D a b)*X^5

def H3BoundsM13D (a b q t u : ℝ) : Prop :=
 0 ≤ h3c0M13D u ∧ 0 ≤ h3c1M13D a q t ∧ 0 < h3c2M13D a b q ∧
 0 < h3c3M13D a b ∧ 0 < h3c4M13D a b ∧ 0 < h3c5M13D a b ∧
 h3c0M13D u*h3c2M13D a b q ≤ h3c1M13D a q t^2 ∧
 h3c1M13D a q t*h3c3M13D a b ≤ h3c2M13D a b q^2 ∧
 h3c2M13D a b q*h3c4M13D a b ≤ h3c3M13D a b^2 ∧
 h3c3M13D a b*h3c5M13D a b ≤ h3c4M13D a b^2

end
end MathGKM.Markov
