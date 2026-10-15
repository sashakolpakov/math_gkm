# Fourth-slice truncation and its first shifted coefficient

Machine-authored live request `f2da221d241a479bb83492e861a09fd7`.
The full pinned Conjecture63 remains unresolved. Use final validation.json
for the exact accepted inventory and excluded attempts.

## Recovered interruption

Worker 91 timed out after starting its last union replay. Both replay receipts
survived and succeed; its final validation and artifact manifests do not exist.
The current worker checked 199 inherited hashes and recovered matching build
and replay records for 26 prior modules including their audit. It did not
overwrite those records or blindly rerun a possibly completed action.

## Initial interval

For the normalized fourth-slice numerator F(N,Z,x;c,r), naturality under ring
maps gives divisibility of F(N,Z,x)-F(N,0,x) by Z. The inherited square-zero
calculation gives divisibility by x². These factors must be combined before
setting Z=x^n; they cannot be multiplied merely because both divide the
specialized polynomial.

`eval_shift_productF2` works in Z[x][Z]. From Z|P and C(x^d)|P, cancellation
in the coefficient ring shows P=C(x^d) Z Q. Evaluation then gives
x^(n+d)|P(x^n). Applied with d=2, the initial numerator coefficients agree
through index n+1. Marking the large numerator definition locally irreducible
avoided unnecessary elaborator expansion; no mathematical definition changed.

The seven boundary convolution identities and five adjacent gap certificates
in MarkovFourthBoundaryF2 complete the small-index part of the compact formula.
Together with the inherited large-index shape inequality, they prove the
convolution inequality whenever c>=2 and H>=c(j+1)+1. For the actual source,
H=nc+r and r>=1, this holds whenever j<n.

`source_fourth_initial_allF2` therefore proves every raw fourth-slice triple
starting at j<n for every natural n and predecessor denominator c>=5.
`root_iff_coreF2` records an exact equivalence with the remaining root predicate.

## First shifted coefficient

Working modulo x³, both local third and fourth cumulants depend only on their
first two Boolean arguments. Their cyclic sums simplify to
c f(false,false)+r(f(true,true)-f(false,false)); the other statistic parameters
cancel. The checked cubic-zero calculation gives

    F(N,Z,x;c,r)-F(N,0,x;c,r)
      = Z x² · 16(c-r) K(K-1)(K-2),  if x³=0,
    K = Nc+r+c-2N-5.

Combining divisibility by Z and x³ in separate variables yields an exact
remainder divisible by x^(n+3). Consequently the source coefficient at j=n+2
is the compact initial convolution plus the stated cubic correction, with
the same scalar 24 on the raw source coefficient.
This identity is `source_fourth_next_convF2`.

The candidate first shifted log-concavity gap uses the inherited shape S:

    S(c,nc+r,n+1)²
      - S(c,nc+r,n) [S(c,nc+r,n+2)+315·16(c-r)K(K-1)(K-2)].

For n>=5, c>=5 and 1<=r<c, nonnegative coefficient certificates split into
r>=4, r=3, r=2 and r=1. The large r case is decomposed by powers of r-4 to
avoid the timed-out full expansion. `firstShift_logConcaveF2` proves the
parameter inequality. The source adapter `source_fourth_first_shiftF2` proves
the actual raw triple starting at j=n for n>=5 and c>=5.
`root_iff_coreNextF2` records the exact further residual. Final validation
binds these claims to matching build and replay receipts.

## Experiments and limitations

The finite exact experiment records 11,534 initial coefficient comparisons,
1,232 first-shift coefficient comparisons, 8,970 initial polygon-valid triples,
1,280 first-shift polygon-valid triples, and 5,972 comparisons to the literal
source recurrence. The initial checks include 415 positions from predecessor
cycles of length two through four. No failure was observed; these finite
checks do not extend the Lean theorem's c>=5 hypothesis.

Small predecessor cycles, n=4 at the first shift, further shifted blocks,
higher diagonals, and horizontal/vertical interiors remain separate obligations.
No complete new slope range or full-root resolution is inferred. Detailed
source-correspondence limits are in the companion correspondence report.
The full first-shift expansion timed out; rejected build snapshots and all
subsequent parser/elaboration repairs remain recorded as operational evidence.

Final validation compiled and kernel-replayed 26 mathematical modules and
their audit module, and checked all 72 theorem axiom closures. Only propext,
Classical.choice and Quot.sound occur. The single excluded mathematical draft
is MarkovFirstShiftGap0F2, whose full expansion timed out; its split replacement
is validated. Inherited compiled imports were reused. This is neither a fresh
whole-source rebuild nor the independent completion audit. All foreground
executions completed and the protected root remains unchanged.
