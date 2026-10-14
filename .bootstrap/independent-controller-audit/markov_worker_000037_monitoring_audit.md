# Independent monitoring audit: worker 000037

Request: `0c12f51d13954e288fe0129642b586e0`.

This is a read-only audit of the completed worker's archived output in
`/Users/sasha/math_gkm/.control/markov/workers/000037/artifacts`, its retained
verification records, and corresponding current source hashes. No project
source was changed, no proposer was contacted, and no mathematical advice was
supplied. No fresh Lean build was performed.

## Finding

The worker establishes a restricted but unconditional strict log-concavity
inequality for actual raw source coefficients across an infinite family.
It also proves an infinite obstruction to a particular single-summand-pair
comparison, while proving that the relevant aggregate comparison succeeds.
These are different statements. Neither refutes nor proves full Conjecture 6.3.

I found no material mismatch between the final English correspondence and
the four final Lean modules. The English report explicitly acknowledges the
restricted source triple and the unresolved root.

## Actual raw source inequality

For every source path with labels `a/(a+1)` and `a ≥ 7`, write `A(i,j)`
for the raw integer coefficient of the actual source numerator. The theorem
`source_near_one_corner0c12` proves

`A(1,a+3)^2 > A(0,a+3) * A(2,a+3)`.

It does not quantify over every horizontal starting index or every row.
It adds no unrestricted vertical or diagonal statement and does not cover
the analogous selected triple for `a < 7`.

The source calculation uses `a=m+7`, `m : ℕ`, and the genuine source path
`List.replicate (m+6) true`. Exact source-label identification transfers
the result to arbitrary paths with those labels. The literal coefficients are

- `L = choose(m+6,2)`;
- `Z = 5*choose(m+5,3) + 8*choose(m+6,3)`;
- `R = 21*choose(m+4,4) + 60*choose(m+5,4) + 45*choose(m+6,4)`.

The proof establishes the exact rational polynomial certificate

`72*(Z²-L*R) = 149*m^6 + 4491*m^5 + 55919*m^4 + 367965*m^3 + 1349732*m² + 2618064*m + 2099520`.

All coefficients on the right are positive. The rational calculation clears
a positive constant denominator; it does not replace the raw coefficient
predicate with a factorial-normalized one.

`source_corner_polygon0c12` proves that all three points
`(i,a+3)`, `i=0,1,2`, satisfy the protected polygon condition for
labels `(a,a+1)`. Thus the selected inequality is an actual instance of the
root's horizontal condition, not a comparison between unrelated coefficients.
These points have positive coefficients; this theorem does not claim to
settle all boundary/zero cases of the full conjecture. Root endpoint sources
remain separate inherited obligations.

## Moving fiber and single-pair obstruction

For clarity, write the worker's positive-excess summand as

`H(a,j,s,q) = choose(a-q,s) * choose(s+q-1,q) * choose(2*s,j-q)`,

with its original guards and zero conventions retained. Its Lean
representation is `horizontalTerm9a72 a j q (s-1)`. The argument fixes
`j=a+3`, middle excess `s=4`, and auxiliary charge `k=2*a-9`.
This auxiliary charge is not a Newton-polygon coordinate.

With `a=m+7`, the selected endpoint product and middle-pair product are

`E = 60*choose(m+6,2)*choose(m+5,4)`,

`M = 40*choose(m+5,3)*choose(m+6,3)`.

The two middle factors are at summand indices `m+2` and `m+3`.
They contribute two ordered products to the square.

The final modules prove exact identities

`36*(E-M) = 5*(m+6)*(m+5)^2*(m+4)*(m+3)*(m-14)`,

`36*(2*M-E) = 5*(m+6)*(m+5)^2*(m+4)*(m+3)*(7*m+46)`.

Accordingly, for every `a ≥ 22`, `M < E`; for every `a ≥ 7`,
`E < 2*M`. The subtraction in the polynomial identities is rational,
not truncated natural subtraction.

`moving_pair_bound0c12` bounds every middle summand pair at this charge by
`M`, using proved support zeros. Therefore
`no_single_pair_domination0c12` excludes domination of the selected endpoint
product by any one such middle summand pair for every `a ≥ 22`.
This excludes that particular whole-summand comparison. It does not exclude
aggregating pairs, splitting counted objects, or other comparisons. The
proved inequality `E < 2*M` expressly shows why the single-pair failure is
not a raw log-concavity counterexample.

For every natural truncation cutoff `r`, `moving_fiber_identity0c12`
identifies the coefficient of auxiliary degree `2*m+5` in the relevant
truncated middle square minus endpoint product as

`(if r ≤ m+2 then 2*M else 0) - (if r ≤ m+1 then E else 0)`.

`moving_fiber_nonneg0c12` proves this is nonnegative for all `m,r : ℕ`.
The reduction to these terms is supported by formal zero/support lemmas.
It retains the cutoff guards and includes zero truncations. It proves one
moving family of fiber coefficients for all cutoffs, not the full fiber
goal over all rows, excesses, and auxiliary charges. No unproved universal
fiber assumption is used to assert the actual source-corner theorem.

## Verification evidence

The final manifest is
`evidence/markov-0c12f51d/validation.json`, timestamp
`2026-10-14T15:11:04.109101+00:00`.
The host receipt records a completed attempt lasting approximately
1097.94 seconds, with resolution false and completion null.

All four final source hashes agree among archived source, current source,
the final manifest, and the host's recorded resulting files. The successful
compilation and kernel replay records refer to the same final source hashes.
The replay commands invoke the pinned Lean 4.32.2 `leanchecker`.
Recorded receipt-file hashes agree with the host archive, and the recorded
final compiled-object hashes agree with current compiled objects.

| Module | Final source SHA-256 | Successful build receipt | Successful kernel replay receipt |
|---|---|---|---|
| MarkovMidpoint0c12 | `42035b7b04037653648c0a7f14d345f6e9fd1014108683808e6dfa6a3207e81f` | `run-1791990314846118000.json` | `run-1791990337867582000.json` |
| MarkovMovingFiber0c12 | `390b4cab1ed29d5030d39d6b53a5ba4e36de6226cdfa7d32edaee3a7a5de368f` | `run-1791990406961834000.json` | `run-1791990453394373000.json` |
| MarkovSourceCorner0c12 | `ca52d791c620f5d4accea8e6011737eb1045349ac1fec460b77e3f74a3c7931b` | `run-1791990453393809000.json` | `run-1791990518558749000.json` |
| MarkovPairObstruction0c12 | `e4370c1f6dcc47579f3685a68fcd226e47404c72df7293224de17c826f480170` | `run-1791990490505084000.json` | `run-1791990592759464000.json` |

All eight listed records return exit code zero. The eleven printed final
axiom closures contain only `propext`, `Classical.choice`, and
`Quot.sound`. Seven rejected elaborations are preserved separately
(four midpoint drafts, two source-corner drafts, one moving-fiber draft);
they are not counted as accepted proofs. Diagnostics from failed drafts
do not establish an axiom in the final accepted declarations.

The protected target source remains at SHA-256
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This review inspected recorded successful compilation/kernel replay and
their source binding. It did not perform an independent fresh transitive
rebuild. The source bridges reuse inherited compiled results. No general
novelty claim is made: the defensible progress is the exact restricted
inequality and the formal comparison obstruction described above, not
resolution of the published conjecture.

