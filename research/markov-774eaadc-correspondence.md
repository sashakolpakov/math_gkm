# Source correspondence and remaining scope, worker 774eaadc

This is a machine-authored research audit, not an independent completion audit.
The pinned MathGKM.Markov.Conjecture63 is unchanged. Completion is null.
The latest validation-*.json in evidence/markov-774eaadc determines which exact
source hashes compiled and passed kernel replay; rejected attempts are retained.

The new slice theorem uses the inherited literal homogeneous numerator P, its
raw diagonal adapter, and the explicit source-linked quotient. Put d=a+b-1,
s=1+x, D_r=[w^r]P(x,1,w), and Q_r=[t^r]q(x,1,t). It proves

    D_r*s^(2r)=s^d*Q_r.

Consequently D_r=s^(d-2r)*Q_r when 2r<=d. Every coefficient of Q_r is a
nonnegative integer by the checked positive matrix representation. For 2r>=d
the proved identity is Q_r=s^(2r-d)*D_r, with no deconvolution inequality.
The equality case is included in both statements. Zero polynomials are retained.

MarkovCross774 proves that nonnegative adjacent-log-concave sequences whose
positive support is an interval satisfy CrossLC. This explicitly supplies the
general implication missing in the independent residual audit; it does not
assert interval support or adjacent inequalities for every source residual.
MarkovTransfer774 then gives exact conditional transport into the literal raw
third-direction inequality. No coefficient normalization is introduced.

The word-state calculation uses A w B with k=length(w), m=count_B(w). The
universal quadratic formula and exact source label bridge give k=b-2,m=a-1.
The intended resulting residual is

    Q_2=(a-1)(a-2)/2 +(ab-4a+2)*x +(b-1)(b-2)/2*x^2.

MarkovThird774 combines this identification with the inherited checked quadratic
gap inequality. All six new modules compiled and passed kernel replay; the
final manifest is evidence/markov-774eaadc/validation-1791936997767029000.json.
Its raw theorem concerns all paths with a>=3 and triples with i+j+4=d. These
are exactly the r=2 homogeneous slices (third upper diagonals); the coefficients
at (i,j+2),(i+1,j+1),(i+2,j) each have omitted exponent two. It does not prove
other slices, and its inequality should not be reported as full Conjecture 6.3.

Correspondence obligations:

* Coverage: inherited checked rational coverage and uniqueness are available.
  All new source statements quantify over every finite path, with no bound.
* Source family: literal source seeds and recurrence enter through the inherited
  homogeneous numerator and quotient bridges. New word counts are tied to this
  paired Farey construction. Enlarged-family experiment failures are not root
  counterexamples and the palindromic word is not silently declared a source word.
* Homogeneity/coefficients: inherited total degree and homogeneous reconstruction
  are used; diagonal_raw_coeff_on16 identifies the exact raw integer coefficients.
  Mapping to real polynomials is coefficientwise integer inclusion; multiplication
  by two and cancellation by two do not change the coefficient normalization.
* Polygon: no full lower support or Newton-polygon equality is proved here.
  The stated raw slice inequalities are stronger than requiring polygon membership
  on those particular slices, but the full source polygon bridge remains open.
* Directions/zeros/endpoints: the new inequality is solely the constant-i+j
  direction on r=2 for a>=3. General transfers retain negative-index and terminal
  zeros. Horizontal and vertical interior inequalities are still open. The 0/1
  and 1/1 endpoints retain their existing vacuous proofs and are not altered.
* Assumptions: pinned Lean/Mathlib only; successful printed theorem closures must
  use only propext, Classical.choice and Quot.sound. Failed diagnostic placeholder
  axioms are rejected evidence. Builds use recorded inherited compiled imports,
  not a fresh source rebuild of all dependencies or an independent closure audit.
* Proof scope: no proof or negation of the exact pinned root is supplied. The
  generic residual CrossLC/interval hypotheses, lower-half transport, general
  three-direction inequalities and full polygon correspondence remain unresolved.

Live primary-source retrieval and the experiment's exact non-source obstructions
are documented in markov-774eaadc-word-analysis.md and the experiment JSON files.
No external mathematical assertion was installed as an axiom, and no controller,
protected source, prior evidence, dependency or permission was edited.

Next research may use the row-state recurrence to investigate higher quotient
slices, while retaining the actual Farey-word restriction. The r=2 formula also
suggests treating a=1 and a=2 directly (the constant quadratic coefficient is
zero); those cases are not claimed by third_raw_logConcave774. Proving every
upper residual LC would still leave lower-half transport and the other two
raw directions as separate obligations.
