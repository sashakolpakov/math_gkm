import MathGKM.Markov

/-! Machine-authored auxiliary representation, round-0002. Definitions only.
Variables 0,1,2 represent U,V,W; specialize sets W=1.
Source-family identification remains a separate obligation.
-/
namespace MathGKM.HomogeneousBridgeR2
noncomputable section
abbrev TriPoly := MvPolynomial (Fin 3) ℤ
def U : TriPoly := MvPolynomial.X 0
def V : TriPoly := MvPolynomial.X 1
def W : TriPoly := MvPolynomial.X 2
def S : TriPoly := U + V + W
structure Label where
  a : ℕ
  b : ℕ
  p : TriPoly
structure Frame where
  lo : Label
  mid : Label
  hi : Label
def initial : Frame :=
  ⟨⟨0, 1, 1⟩, ⟨1, 2, (U+V)^2 + U*W⟩, ⟨1, 1, U+V⟩⟩
def advance (f : Frame) (right : Bool) : Frame :=
  if right then
    ⟨f.mid, ⟨f.mid.a+f.hi.a, f.mid.b+f.hi.b,
      S*f.hi.p*f.mid.p - U^f.hi.a*V^f.hi.b*W^(f.hi.a+f.hi.b)*f.lo.p⟩, f.hi⟩
  else
    ⟨f.lo, ⟨f.lo.a+f.mid.a, f.lo.b+f.mid.b,
      S*f.lo.p*f.mid.p - U^f.lo.a*V^f.lo.b*W^(f.lo.a+f.lo.b)*f.hi.p⟩, f.mid⟩
def frame (path : List Bool) : Frame := path.foldl advance initial
def specialize : TriPoly →+* MathGKM.Markov.BiPoly :=
  MvPolynomial.eval₂Hom (Polynomial.C.comp Polynomial.C)
    (fun i => if i = 0 then MathGKM.Markov.U else if i = 1 then MathGKM.Markov.V else 1)
def specializeLabel (l : Label) : MathGKM.Markov.Label := ⟨l.a,l.b,specialize l.p⟩
def specializeFrame (f : Frame) : MathGKM.Markov.Frame :=
  ⟨specializeLabel f.lo, specializeLabel f.mid, specializeLabel f.hi⟩
def exponent (i j k : ℕ) : Fin 3 →₀ ℕ :=
  Finsupp.single 0 i + Finsupp.single 1 j + Finsupp.single 2 k
def coeff (p : TriPoly) (i j k : ℕ) : ℤ := MvPolynomial.coeff (exponent i j k) p
end
end MathGKM.HomogeneousBridgeR2
