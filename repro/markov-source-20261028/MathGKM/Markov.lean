import Mathlib

/-! Raw squared-variable numerator coefficients for Evans--Veselov--Winn 6.3.
The outer polynomial variable is u=x², the inner one v=y²; w=z² is set to 1.
Homogeneity recovers its exponent a+b-1-i-j. No factorial normalization.
-/
namespace MathGKM.Markov

noncomputable section

abbrev BiPoly := Polynomial (Polynomial ℤ)
def U : BiPoly := Polynomial.X
def V : BiPoly := Polynomial.C Polynomial.X
def S : BiPoly := U + V + 1
def coeff (P : BiPoly) (i j : ℕ) : ℤ := (P.coeff i).coeff j

structure Label where
  a : ℕ
  b : ℕ
  p : BiPoly

structure Frame where
  lo : Label
  mid : Label
  hi : Label

def initial : Frame :=
  ⟨⟨0, 1, 1⟩, ⟨1, 2, (U + V)^2 + U⟩, ⟨1, 1, U + V⟩⟩

def advance (f : Frame) (right : Bool) : Frame :=
  if right then
    ⟨f.mid, ⟨f.mid.a + f.hi.a, f.mid.b + f.hi.b,
      S * f.hi.p * f.mid.p - U^f.hi.a * V^f.hi.b * f.lo.p⟩, f.hi⟩
  else
    ⟨f.lo, ⟨f.lo.a + f.mid.a, f.lo.b + f.mid.b,
      S * f.lo.p * f.mid.p - U^f.lo.a * V^f.lo.b * f.hi.p⟩, f.mid⟩

def frame (path : List Bool) : Frame := path.foldl advance initial

def InPolygon (a b i j : ℕ) : Prop :=
  a * b ≤ b * i + a * j ∧ i + j ≤ a + b - 1

def WeakLC (a b : ℕ) (P : BiPoly) : Prop :=
  (∀ i j, InPolygon a b i j → InPolygon a b (i+1) j →
    InPolygon a b (i+2) j →
    coeff P i j * coeff P (i+2) j ≤ coeff P (i+1) j ^ 2) ∧
  (∀ i j, InPolygon a b i j → InPolygon a b i (j+1) →
    InPolygon a b i (j+2) →
    coeff P i j * coeff P i (j+2) ≤ coeff P i (j+1) ^ 2) ∧
  (∀ i j, InPolygon a b i (j+2) → InPolygon a b (i+1) (j+1) →
    InPolygon a b (i+2) j →
    coeff P i (j+2) * coeff P (i+2) j ≤ coeff P (i+1) (j+1) ^ 2)

/-- Full path-indexed target, not asserted as a theorem. The initial endpoint
0/1 has P=1 and a singleton polygon; 1/1 has P=u+v. -/
def Conjecture63 : Prop :=
  WeakLC 0 1 1 ∧ WeakLC 1 1 (U+V) ∧
  ∀ path, let m := (frame path).mid; WeakLC m.a m.b m.p

end
end MathGKM.Markov
