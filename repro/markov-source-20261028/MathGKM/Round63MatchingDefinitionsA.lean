import MathGKM.Round61FiniteA
import MathGKM.ResearchSemantics

/- Machine-authored round63 source recovery. Definitions only; this module has
not been compiled. No export of the rejected Round61SeparatorA is imported. -/
namespace MatchingSeparatorR63
noncomputable section
open scoped BigOperators

abbrev W := MvPolynomial ℕ ℤ
abbrev UV := Polynomial (Polynomial ℤ)
def w (e : ℕ) : W := MvPolynomial.X e
def u : UV := Polynomial.X
def v : UV := Polynomial.C Polynomial.X
def p (sigma : ℕ) (M : Finset ℕ) : ℕ :=
  (M.filter (fun e => (e+sigma)%2=0)).card
def q (sigma : ℕ) (M : Finset ℕ) : ℕ :=
  (M.filter (fun e => (e+sigma)%2=1)).card
def monomer (N sigma : ℕ) (M : Finset ℕ) : UV :=
  u^(p sigma M)*v^(q sigma M)*(u+v)^(N-2*M.card)
def C (N sigma i j : ℕ) : W :=
  ∑ M ∈ FiniteMatchingR61.matchings N,
    MvPolynomial.C (((monomer N sigma M).coeff i).coeff j) *
      ∏ e ∈ M, w e

/- The second presentation uses the unchanged ring-valued matching sum.
The connection between its coefficients and C is documented but unproved here. -/
abbrev WeightedUV := Polynomial (Polynomial W)
def wu : WeightedUV := Polynomial.X
def wv : WeightedUV := Polynomial.C Polynomial.X
def edge (sigma e : ℕ) : WeightedUV :=
  Polynomial.C (Polynomial.C (w e)) *
    (if (e+sigma)%2=0 then wu else wv)
def Z (N sigma : ℕ) : WeightedUV :=
  FiniteMatchingR61.finiteSum (wu+wv) (edge sigma) N
def exponent : ℕ →₀ ℕ :=
  Finsupp.single 0 1 + Finsupp.single 1 1 +
    Finsupp.single 2 1 + Finsupp.single 5 1
end
end MatchingSeparatorR63
