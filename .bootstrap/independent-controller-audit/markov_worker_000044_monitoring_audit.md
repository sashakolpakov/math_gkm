# Independent monitoring audit: worker 000044

Request: `863a748264774e87895cba827a773f3c`.

Read-only inspection of the completed worker's archived output under
`/Users/sasha/math_gkm/.control/markov/workers/000044/artifacts`,
corresponding current final sources/compiled objects, and retained receipts.
No project changes, mathematical advice, proposer contact, or interference
with the active successor. No fresh Lean build or mathematical scan was run.

## Finding

The new distance-two comparisons and three-charge aggregation are genuine
universal theorems for the specified Pell summand array. Both ordered
distance-two orientations include all support zeros. The aggregate argument
proves coefficientwise nonnegativity for a fixed block of three consecutive
charge classes without assuming closure under arbitrary summation.

The full-gap and moving-cutoff results have narrower conclusions:
the former fixes auxiliary coefficient 2; the latter fixes coefficient
`2r+2` in the polynomial truncated at charge `r`. Varying `r`
also varies that polynomial, so the latter does not prove every even
coefficient of a single fixed gap.

No material English/Lean mismatch was found. Full Conjecture 6.3 and the
unrestricted sum inequality remain unresolved.

## Exact array, quantifiers, and source connection

For positive excess `S≥1`, use

`H(a,j,S,q)=choose(a-q,S)*choose(S+q-1,q)*choose(2S,j-q)`,

with the explicit zero convention for `q>j` and vanishing out-of-range
binomials. Its Lean representation is
`horizontalTerm9a72 a j q (S-1)`.

The final summand theorems quantify `a,j,q,s : ℕ`; their English excess
is `S=s+1`. There are no hidden interior-support assumptions, positivity
hypotheses on summands, or bounded numerator/denominator ranges. The auxiliary
array permits `a=0`; this is not a claim that zero is an interior source
numerator.

The inherited exact source bridge
`right_horizontal_sum_fixed9a72` identifies the sum over `0≤q≤a`
with the literal raw coefficient of source `a/(a+1)`, using
`a=n+1`, `S=s+1`, `s≤n`, and
`i+j=n+s+2=a+S`. These bridge conditions are not erased by the new
array inequalities. The three-charge polynomials are auxiliary restrictions,
not new source polynomials.

All coefficients remain raw integers. Rational quantities in intermediate
proofs serve denominator clearing only. The charge variable is distinct
from source coordinates and the omitted homogeneous variable.

## Both distance-two midpoint comparisons

Theorems `horizontal_forward_two863` and
`horizontal_reverse_two863` prove respectively

`H(a,j,S,q)*H(a,j,S+2,q+2) ≤ H(a,j,S+1,q+1)^2`,

`H(a,j,S,q+2)*H(a,j,S+2,q) ≤ H(a,j,S+1,q+1)^2`.

The proofs separately handle `q+2>j` using the summand guard, and
`q+2>a` using the zero first binomial. In the remaining branch,
`a-q-2` and `j-q-2` have the required natural-number interpretation.
The binomial lemmas also treat their own out-of-support zero cases.

Intermediate comparisons use reciprocal positive scalar factors that
cancel: the reverse and forward orientations have different factors,
as the English derivation states. The final result does not assume that
each individual binomial factor is log-concave in the required mixed
indices. Explicit rational polynomial certificates and binomial recurrence
identities supply the needed bounds; positivity hypotheses for cancellation
are discharged.

These theorems cover charge separation two only. They do not contradict
or supersede the inherited obstruction to individual midpoint domination
at larger separation.

## The three-charge aggregate is proved separately

Let

`L_i=H(a,j,S,q+i)`,
`M_i=H(a,j,S+1,q+i)`,
`R_i=H(a,j,S+2,q+i)`.

`horizontal_three_mixed863` proves

`L_0 R_2 + L_1 R_1 + L_2 R_0 ≤ M_1² + 2 M_0 M_2`.

This is not obtained by adding two bounds that both spend `M_1²`.
The general integer lemma `three_product_bound863` takes
`x,y,z≤c`, `b≥0`, `xy≤b²`, `xz≤bc`, and `yz≤bc`,
and proves `x+y+z≤c+2b`.

Here `x=L_0R_2`, `y=L_2R_0`, `z=L_1R_1`,
`b=M_0M_2`, and `c=M_1²`. The new distance-two bounds,
inherited same-charge bounds, and preceding neighboring-charge bounds
discharge all hypotheses. Nonnegativity needed when multiplying inequalities
is proved directly for the summands. No additional aggregate inequality
is assumed.

For

`P_s(T)=Σ_(i=0)^2 horizontalTerm9a72 a j (q+i) s*T^(q+i)`,

`three_fiber_gap863` proves

`[T^k](P_(s+1)^2-P_s*P_(s+2))≥0`

for every `a,j,q,s,k : ℕ`. Its five possible nonzero gap coefficients
are at `2q,…,2q+4`. They use same-charge, neighboring-charge,
the new aggregate, neighboring-charge, and same-charge comparisons.
All other coefficients and all vanishing summand cases remain included.

The theorem concerns exactly three **consecutive** charge indices and
log-concavity as the excess parameter varies. It does not state closure
for arbitrary charge blocks or arbitrary sums of such polynomials.

## Full and truncated gaps: precise distinctions

For the full polynomial

`F_s(T)=Σ_(q=0)^(n+1) horizontalTerm9a72 (n+1) j q s*T^q`,

`full_fiber_quadratic863` proves

`[T²](F_(s+1)^2-F_s*F_(s+2))≥0`

for every `n,j,s : ℕ`. This coefficient involves charges 0,1,2.
There is no `s+2≤n` hypothesis, so the small-parameter and zero cases
are covered as an array theorem.

`truncated_coeff_unbounded863` removes the finite summation-range test
from the coefficient formula by proving that the summand is zero when its
charge is outside that range. It is not an assumed extension of the finite
polynomial.

For the tail-truncated polynomial

`F_(s,r)(T)=Σ_(q=0)^(n+1) [r≤q] horizontalTerm9a72 (n+1) j q s*T^q`,

`truncated_three_boundary863` proves, for every `n,j,s,r : ℕ`,

`[T^(2r+2)](F_(s+1,r)^2-F_(s,r)*F_(s+2,r))≥0`.

The convolution is formally reduced to charges `r,r+1,r+2`.
Terms below the cutoff, or whose partner lies below it, are proved zero.
Cutoffs beyond support are included through the unbounded coefficient
identity and vanishing summands.

The cutoff `r=0` gives the full quadratic coefficient. For `r>0`,
the polynomial has changed; the theorem makes no assertion about the
corresponding coefficient of the untruncated gap. Neither result supplies
all coefficients of the full gap, all coefficients for a fixed cutoff,
or nonnegativity at evaluation `T=1`. Thus the existing full-source
horizontal transfer still has an unproved universal fiber premise.

The pinned source polygon, all remaining source rationals, vertical and
diagonal directions, and root endpoints remain unaffected.

## Finite experiments

The retained `aggregate_probe_863a.py` tests
`3≤a≤44`, `0≤j≤2a`, `1≤S≤a-2`, and `0≤q≤a-2`.
It reports 1,814,428 three-charge middle-gap tests without a failure.
I checked the archived record hash and independently counted these loop
indices, obtaining the same number, without rerunning comparisons.

Within `a≤30`, the script additionally tests symmetrized midpoint
comparisons at distances 3 through 6 when the second charge lies in range.
Their absence of failures is finite evidence, not a theorem of arbitrary
separation.

The recorded ratio
`23569504/17068095>1` at `(a,j,S,q)=(44,24,20,9)`
concerns the sum of the two distance-two endpoint products divided by the
single middle square. This experiment is consistent with the separate
aggregate proof, which also includes `2M_0M_2`; it is not a source
log-concavity counterexample. No new scan or historical novelty assessment
was performed during this audit.

## Final verification evidence

Final manifest: `evidence/markov-863a7482/validation.json`, timestamp
`2026-10-14T17:28:15.485137+00:00`.
The host reports completed, approximately 1149.12 seconds,
mathematical resolution false, completion null.

| Module | Final source SHA-256 | Build receipt | Kernel replay receipt |
|---|---|---|---|
| MarkovDistanceTwo863a | `3544a89d6e9fec674edbe98e171a9dcb0f9167af9d6c723f9808f77de43db75d` | `run-1791998107516850000.json` | `run-1791998391392581000.json` |
| MarkovDistanceForward863a | `cf10ee285e9918ca924d1a421a2ae6ad58b353252b4244c9af303a16766a3d99` | `run-1791998390185997000.json` | `run-1791998467559116000.json` |
| MarkovDistanceFiber863a | `74e1aaee997549b6a78f5c3ab28a384fbc8a70831f1c0d585b1d826974c98957` | `run-1791998434196439000.json` | `run-1791998576894847000.json` |
| MarkovThreeCharge863a | `2383f902ae61b9a9d061432417f25d84a39d9ae114955d7aa6059a661c27e2bb` | `run-1791998641261867000.json` | `run-1791998735461815000.json` |
| MarkovTailThree863a | `57632623c221536de3f98c0e3d98dbc3d6abfc7ee1fe57c1a6b53f6ae551f785` | `run-1791998735463006000.json` | `run-1791998843265031000.json` |

All five final source hashes match current source, archived source, the final
manifest, host changes, and the final build/replay snapshots. All ten listed
records return zero, bind the same final source hash, and use the corresponding
pinned Lean 4.32.2 compiler or `leanchecker` module command. Receipt hashes
match the host archive; archived/current compiled-object hashes match the
manifest and host record.

The sixteen printed final axiom closures match successful build output and
contain only `propext`, `Classical.choice`, and `Quot.sound`.
Five failed elaborations are kept separately: one distance-two draft,
two forward drafts, and two distance-fiber drafts. They are not accepted
proof evidence.

The protected root remains at SHA-256
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected matching recorded compilation/kernel replay; it did
not perform an independent fresh transitive rebuild. Inherited compiled
imports remain part of the verification boundary. The results strengthen
the local aggregation theory but do not complete the full conjecture.

