# Universal third lower diagonal

Machine-authored live research, request `8833a0fb588547db9bdf18872634da54`.
The exact pinned `MathGKM.Markov.Conjecture63` remains unresolved.

`source_third_lower8833` proves, for every finite source path, every natural
i,j with i+j+2=a+3, and the three original polygon guards,

    A(i,j+2) A(i+2,j) <= A(i+1,j+1)^2.

The coefficients are the literal integer numerator coefficients from the
pinned definition. This completes the third **lower** diagonal, not the third
upper diagonal and not all of Conjecture 6.3.

## Two-cycle correction and extraction

For a mixed path `replicate n true ++ false :: rest`, let
c=(frame rest).mid.b and r=(frame rest).mid.a. The established source indices
are a=cn+r, b=c(n+1)+r. When c=2, source reducedness forces r=1. Put F equal
to the inherited firstRunPolyADB2 and T equal to thirdRunPolyADB2. The
inherited source identity is

    6 * source third slice = T - 12 X^(2n+3) (F+1+X).

The previous large-cycle denominator identity cannot be applied unchanged:
T contains an additional 6 X^(2n+3) F term. Define

    cleanThird = T - 6 X^(2n+3) F.

`two_denominator8833` proves its exact denominator identity with the four
inherited bands starting at 0,n+2,2n+3,3n+4. Inverting (1-X)^6 in formal
power series and retaining the delays gives `two_extract8833`. The actual
corrected source polynomial is cleanThird - 6 X^(2n+3)(F+2+2X).
The required first-jet coefficients F_0=2n+2 and F_1=6n+2 are proved directly.

Consequently for every n>=4 the raw source coefficients at
(3,2n+1),(2,2n+2),(1,2n+3),(0,2n+4) are exactly

    440n-532, 120n-92, 22n-8, 2n.

The Lean formulas state these with the common factor six from the source
identity; it cancels from both sides of the squared comparison. The two
terminal gaps are nonnegative polynomial expressions in n-4. Together with
the inherited first two bands, these cover every i,j on the slice: its total
degree alone bounds the starting j by 2n+2. Runs 0,1,2,3 use their earlier
source results with all small-cycle corrections retained.

## Three-cycle families

When c=3, reducedness leaves r=1 or r=2. The extraction lemmas for the six
positions 2n+1 through 2n+6 are extended from n>=5 to n>=4 with the original
power-series proof. For each of the two values of r, the four crossing gaps
expand with nonnegative coefficients in n-4. The interior reversed-tail gaps
likewise expand with nonnegative coefficients in k-1, including k=1.
`MarkovThreeGaps8833.lean` checks these identities and signs with ring
normalization and positivity; the Python expansions are not premises.

The exact terminal raw coefficients, starting at j=3n+2, are

* r=1: 72,12,1;
* r=2: 292,72,12,1.

Here the final 1 is supplied by the inherited +6 X^b correction to the
six-times-source polynomial. Dropping that correction would give the wrong
endpoint. `MarkovThreeBridge8833` connects all these formulas and inequalities
to the corrected polynomial. `source_third_three_long8833` then transports
them to actual source coefficients for every n>=4.

## Global combination and remaining exact goal

The source path decomposition splits every path into a pure right run or a
mixed run. The pure-right case already has the inherited theorem
`right_raw_diagonal0618` for **every** diagonal, so it was not actually an
open third-slice obligation. For mixed paths, the new c=2,3 results combine
with the earlier c>=4 theorem and earlier run lengths 0,1,2,3. This yields
`source_third_lower8833` without a bound on a,b, path length, or run length.

`root_iff_interior8833` removes the now-proved third lower slice from the
previous residual. A further consolidation reuses, rather than reproves,
the inherited `first_six_raw05ef` and Pell theorem. The checked equivalence

    Conjecture63 <-> InteriorCore638833

retains both horizontal/vertical interior predicates and requires diagonal
inequalities only where the common total degree s=i+j+2 satisfies

    a+4 <= s <= a+b-7,    a+2 <= b.

This is an infinite, still-unproved predicate. No assumption that it holds
is introduced. The same slice combination proves all diagonal inequalities
for b<=10, as an algebraic consequence of the overlapping proven ranges;
this does not settle the horizontal or vertical directions even in that range.

## Validation and experiments

Authoritative build, replay, source hash and axiom receipts are bound in
`evidence/markov-8833a0fb/validation.json`. All rejected attempts are retained.
The initial eight-module union replay passed; a final union includes the
additional residual consolidation. The replay imports only the inherited
boundary, not the new modules before checking their constants.

Exact separate experiments checked 847 terminal positions, 27,104 backward
slice positions, 504 literal raw recurrence positions and 30,629 valid
triples, with no failures. The inputs are in `experiments.json`. These finite
checks are not universal proofs. A separate `fourth-lower-probe.json` records
the next slice's finite behavior and examples inside the remaining guard;
it establishes no fourth-slice theorem.

That probe covered 1,101 reduced fractions with b<=60, 12,866 valid triples
and 4,185 independent raw recurrence positions. There were no failures.
Its first recorded residual-core examples occur at 3/11 on the fourth lower
slice. This identifies concrete next obligations, not witnesses against the
conjecture or a proof of that next slice.

No historical novelty claim is made. Inherited compiled imports are reused;
this is not a fresh whole-source rebuild or independent completion audit.
