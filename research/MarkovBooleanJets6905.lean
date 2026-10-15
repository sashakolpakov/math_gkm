import MarkovProjectionJet6905
/-! Machine-authored request 6905e489. Exact A/AB gauged blocks and local
moment contractions. These are ring identities, not source moment sums. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false
variable {R : Type*} [CommRing R]

def bit6905 (p : Bool) : R := if p then 1 else 0
def localA6905 (y : R) (q : Bool) := y+bit6905 q*(y^2-y)
def localD6905 (y : R) (p q : Bool) := 1+2*bit6905 p*y+bit6905 q*(1+y)
def localC6905 (y : R) (p q : Bool) :=
 y+2*bit6905 p*y^2+bit6905 q*(-2*y-2*bit6905 p*y^2+2*bit6905 p*y^3)
def localB26905 (y : R) (q : Bool) := bit6905 q*(1+y)^2
def localD26905 (y : R) (p q : Bool) := bit6905 q*(1+2*bit6905 p*y)*(1+y)^2
def localC26905 (y : R) (p q : Bool) := -y*localD26905 y p q

def booleanGauge6905 (p q : Bool) : Mat16 BiPoly :=
 gauge75 (C (2*bit6905 p*X)) (C (2*bit6905 q*X))
   (lowerMatrix487 (if q then 1 else 0))

theorem booleanGauge_formula6905 (p q : Bool) :
 booleanGauge6905 p q=
 ⟨U*C (localA6905 X q)-U^2*C (X*localB26905 X q),
 U+U^2*C (localB26905 X q),
 U*C (localC6905 X p q)+U^2*C (localC26905 X p q),
 1+U*C (localD6905 X p q)+U^2*C (localD26905 X p q)⟩ := by
 apply Mat16.ext <;> cases p <;> cases q <;>
   simp [booleanGauge6905,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     ambientWord5c,ambientT5c,mm16,U,V,bit6905,localA6905,localD6905,
     localC6905,localB26905,localD26905,localC26905,map_ofNat] <;> ring

theorem booleanGauge_jets6905 (p q : Bool) :
 (booleanGauge6905 p q).a.coeff 1=localA6905 X q ∧
 (booleanGauge6905 p q).b.coeff 1=1 ∧
 (booleanGauge6905 p q).c.coeff 1=localC6905 X p q ∧
 (booleanGauge6905 p q).d.coeff 1=localD6905 X p q ∧
 (booleanGauge6905 p q).b.coeff 2=localB26905 X q ∧
 (booleanGauge6905 p q).c.coeff 2=localC26905 X p q ∧
 (booleanGauge6905 p q).d.coeff 2=localD26905 X p q ∧
 (booleanGauge6905 p q).d.coeff 3=0 := by
 rw [booleanGauge_formula6905]
 simp [U,Polynomial.coeff_add,Polynomial.coeff_sub,Polynomial.coeff_X_mul,
   Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,Polynomial.coeff_X_pow_mul,
   Polynomial.coeff_one,Polynomial.coeff_X,Polynomial.coeff_X_pow_mul']

def localK6905 (y : R) (p q : Bool) : R :=
 2*localD26905 y p q+2*localC6905 y p q-(localD6905 y p q)^2
def localL6905 (y : R) (p q r : Bool) : R :=
 2*(localD6905 y p q)^3-6*localD6905 y p q*localD26905 y p q+
 6*(localC6905 y p q*localB26905 y r+localC26905 y p q)-
 6*localC6905 y p q*(localD6905 y p q+localD6905 y q r)+
 6*localC6905 y p q*localA6905 y r

theorem localK_expand6905 (y : R) (p q : Bool) :
 localK6905 y p q= -1+2*y-bit6905 q-4*bit6905 q*y+bit6905 q*y^2-
 4*bit6905 p*y+8*bit6905 p*bit6905 q*y^3 := by
 cases p <;> cases q <;>
   simp [localK6905,localD26905,localC6905,localD6905,bit6905] <;> ring

theorem localL_expand6905 (y : R) (p q r : Bool) :
 localL6905 y p q r=
 2-12*y+6*y^2+12*bit6905 r*y^3+2*bit6905 q+18*bit6905 q*y-
 18*bit6905 q*y^2-10*bit6905 q*y^3-24*bit6905 q*bit6905 r*y^3+
 12*bit6905 p*y-12*bit6905 p*y^2+4*bit6905 p*y^3+
 24*bit6905 p*bit6905 r*y^4-120*bit6905 p*bit6905 q*y^3-
 96*bit6905 p*bit6905 q*y^4-24*bit6905 p*bit6905 q*bit6905 r*y^4+
 24*bit6905 p*bit6905 q*bit6905 r*y^5 := by
 cases p <;> cases q <;> cases r <;>
   simp [localL6905,localD26905,localC6905,localD6905,localB26905,
     localC26905,localA6905,bit6905] <;> ring

#print axioms booleanGauge_formula6905
#print axioms booleanGauge_jets6905
#print axioms localK_expand6905
#print axioms localL_expand6905
end
end MathGKM.Markov
