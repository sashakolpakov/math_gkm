# Uniform fourth-slice normalization and coefficient extraction

Machine-authored live request `bc8d3b6f136b465a886c6f157ae90136`.
The exact pinned `MathGKM.Markov.Conjecture63` remains unresolved.
Only modules in final `evidence/markov-bc8d3b6f/validation.json` are accepted
local proof evidence. Drafts and experiments are not theorems.

## Mathematical construction

Write `D=1-X`, `L=1+X`, and `Z=X^n`. The inherited exact run jets were
normalized as polynomials in `n,Z,X` divided by powers of D. The eighteen
identities in `MarkovJetNorm0BC` through `MarkovJetNorm3BC` cover the first
four coefficients of every matrix entry and the two fourth coefficients
needed for the fourth moment. They hold for every natural run length.

The four `MarkovGaugeNorm*BC` modules identify the eleven gauge entries used
in the moment formulas. Their denominators have the explicit pattern

    a1:1, a2:D³, b2:D², b3:2D⁴,
    c1:D³, c2:D⁵, c3:6D⁷,
    d1:D², d2:2D⁴, d3:6D⁶, d4:24D⁸.

`MarkovLocalStructuredBC` assembles these polynomial numerators without
expanding the large rational expression. It proves that `D^6` times the
actual closed local third moment equals `localThirdNumBC`, and that `D^8`
times the fourth equals `localFourNumBC`. These definitions are polynomial
expressions over an arbitrary commutative ring, and their ring-map laws are
proved. The dependence on four Boolean positions remains explicit.

`MarkovFirstNormBC` and `MarkovSecondNormBC` give `Fnum=D² F` and
`Snum=D⁴ S`, for arbitrary n and c>=5. `MarkovMomentScaleBC` proves the
linearity needed to transport these denominators through the exact cyclic
moment formulas. All natural truncated counts remain explicit; no chamber
inequality or source constraint is silently assumed.

The simplifying algebraic observation is that the inherited formula

    fourth = M4 + 6 L⁴ + 4 F T + 3 S² - 12 F² S + 6 F⁴,
    T = 3 F S - 2 F³ - 2 L³ + M3

reduces to

    fourth = M4 + 6 L⁴ + 4 F M3 - 8 F L³ + 3 S² - 2 F⁴.

Consequently the candidate `fourthNumeratorBC` is the following ordinary
polynomial, with all moments computed from the normalized local numerators:

    M4num + 6 L⁴ D⁸ + 4 Fnum M3num
      - 8 Fnum L³ D⁶ + 3 Snum² - 2 Fnum⁴.

The final assembly module is `research/MarkovFourthBinomialBC.lean`.
Its compiled source theorem is

    (1-X)^8 * (24 * actual fourth cut polynomial) = fourthNumeratorBC.

It uses the inherited `source_fourth_closedN6604` and the injective
integer-polynomial embedding. It does not identify the source by finite
evaluation or by an arbitrary-word assumption.

## Exact coefficient extraction

`MarkovBinomialExtractBC` proves a general identity: whenever ordinary
integer polynomials satisfy `(1-X)^(d+1) P=Q`, for every natural j,

    P.coeff j = sum_{k=0}^j Q.coeff k * choose(d+j-k,d).

The proof maps the cleared identity to formal power series and uses the
proved inverse series of `(1-X)^(d+1)`. It keeps every coefficient, including
zeros and finite polynomial tails. This is an exact convolution identity,
not a coefficient normalization or an inequality theorem.

Applied with d=7, `source_fourth_binomialBC` identifies 24 times
the literal raw numerator coefficient at every position on `i+j=a+4`, for
every mixed source path `replicate n true ++ false :: rest` with predecessor
denominator at least five. Final kernel replay and axiom closure are recorded in validation.json.

## Experiments and limitations

`evidence/markov-bc8d3b6f/experiments.json` records 484 exact source/run cases,
15,654 coefficient comparisons, and 14,991 polygon-valid log-concavity
triples. No failure occurred. The four largest selected runs were 32, 64,
100, and 127. These are finite computations and prove no universal inequality.

The expanded local-normalization approach timed out and is excluded. The
optional zero-Z identification in `MarkovFourthLowBC.lean` also timed out
after 100 seconds; it is an excluded draft, not an accepted identity. A
third-local draft also failed because the unit upper-right first coefficient
had not been supplied; the accepted structured assembly supplies that
identity explicitly. Other rejected attempts concerned numeric Fin reduction,
opaque `runXBDEE`, overbroad unfolding, and no-progress simplification.
Every attempted build has a retained source snapshot and receipt.

The inherited experimental 411-term pre-shift numerator, its coefficient
shape, and its nonnegative gap certificates are not yet identified with the
new factored numerator by accepted Lean theorems. Thus no new arbitrary-run
log-concavity range follows here. Small predecessor cycles c=2,3,4, shifted
blocks, remaining fourth-slice inequalities, higher diagonals, horizontal
and vertical interiors, and the complete source-correspondence audit remain
explicit obligations. No historical novelty is claimed.

Final validation compiled and kernel-replayed 14 mathematical modules and
the audit module, and inspected all 100 named theorem closures. Only
`propext`, `Classical.choice`, and `Quot.sound` occur. All foreground
executions ended. Twenty rejected build attempts are retained.

Inherited compiled imports were reused. This is not a fresh rebuild of the
entire source closure or an independent completion audit. Construction and
Agoh were not changed.
