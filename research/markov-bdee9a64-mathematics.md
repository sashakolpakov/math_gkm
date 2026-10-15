# Uniform run jets and the third lower slice

Machine-authored live request `bdee9a64cacb4562b1d69ef649d7da48`.
The full pinned `MathGKM.Markov.Conjecture63` remains unresolved.

## Reconciliation and choice of action

Worker 77 timed out after its finalizer had completed successfully. Its raw
event log has 271 events and no unmatched started items. All 155 recorded
artifact hashes and six inherited-input hashes match. Its 14 accepted modules
and 66 theorem closures are retained; the three uniform-interior timeout
attempts and the uncompiled conditional transfer were not accepted. I did not
rerun those attempts or overwrite any predecessor artifact.

The new action replaces finite interpolation as the route to a source formula
with a universal recurrence for the actual run matrices.

## Universal matrix coefficient formulas

Write `M_n=A B^n=lowerMatrix487 n`, and use U for the cut-count variable and
X for the coefficient variable. The proved scalar recurrence for every entry is

    M_(n+2) = (1+X+U(1+X)^2) M_(n+1) - X M_n.

This is an entrywise identity; no matrix order is changed. For each entry e
and coefficient index k, the corresponding jet satisfies

    J_(n+2,k+1) = (1+X)J_(n+1,k+1) - X J_(n,k+1)
                  + (1+X)^2 J_(n+1,k).

For k=0 the final term is absent. `MarkovRunJets0BDEE` through
`MarkovRunJets3BDEE` prove, for every natural n and k=0,1,2,3,

    6(1-X)^(2k+1) J_(n,k) = P_(e,k)(n,X) + X^n Q_(e,k)(n,X).

All sixteen explicit P,Q pairs are in those modules and in
`evidence/markov-bdee9a64/jet-candidates.json`. Each formula is proved by
two-step induction, with exact base polynomial expansions and ring-checked
recurrence identities. The 512 finite generation checks are not used as proof.

`MarkovRunFieldBDEE` embeds the integer polynomial ring injectively into its
fraction field and proves that 1-X is nonzero there. It identifies each actual
jet with its explicit rational expression, and proves that taking these
coefficients commutes with the constant cyclic gauge. This is not evaluation
at a numerical X, and the embedding loses no coefficient information.

## Exact all-run source expression

`closedThirdBDEE` contains only the explicit jet formulas, finite algebra,
natural parameters n,c,r, and the inherited exact source pattern counts.
There is no recursive run matrix or source-word input in that expression.
`correctedClosedThirdBDEE` retains the two- and three-block corrections.

`source_third_closedBDEE` identifies this expression with the image of the
entire polynomial 6 C3 for every path `replicate n true ++ false::rest`.
`source_third_closed_iffBDEE` proves that an integer polynomial has this image
if and only if it is exactly 6 C3. `source_third_closed_coeffBDEE` transports
that equality to six times the literal raw numerator coefficient at every
position i+j=a+3. There is no upper bound on n or the denominator and no
coefficient-support filter. Pure-right paths are not included in this mixed
path statement; inherited results concerning them remain separate.

## Auxiliary inequality, now checked

`thirdShapeBDEE` is the same explicit polynomial as worker 77's interpolated
candidate. The attempted monolithic gap proof is replaced by seven exact
certificates, one for each power of s=n-j-1. With t=j-5, u=r-1, v=c-r-1,
their coefficient counts are 252,224,196,168,140,112,84, all nonnegative.
Lean checks each identity by `ring` and its sign by `positivity`.

`thirdShape_lcBDEE` proves the candidate's inequality for every integer
n,c,r,j with 1≤r, r+1≤c, 5≤j, and j+1≤n. This resolves the predecessor's
abstract proof timeout. It does **not** establish a new unconditional source
inequality. `ThirdInteriorFormulaBDEE` remains an explicit unproved premise
in the conditional source transfer.

## Symbolic extraction and the remaining bridge

Exact Python rational arithmetic normalizes the new component formulas to

    (1-X)^6 T = K0(n,c,r,X) + X^n K1 + X^(2n) K2 + X^(3n) K3,

for the uncorrected c≠2 expression T. The complete 525-term numerator,
including all source statistics, is saved in `rational-normalization.json`.
The X exponent ranges in K0,K1,K2,K3 are respectively 0–9, 2–9, 3–10, 4–11.
K0 has 169 terms and is independent of the adjacent/triple source statistics.

Expanding (1-X)^(-6) gives the coefficient candidate

    sum_(l=0)^9 [X^l]K0 * binom(j+5-l,5).

Direct exact symbolic calculation identifies fifteen times that expression
with `thirdShapeBDEE` for j≥4. `thirdShape_chooseBDEE` in `MarkovShapeBinomialBDEE` formally proves this
auxiliary binomial identity for every natural j≥4, with no source premise.
The source-to-K0 normalization and the coefficient extraction from the
fraction-field source identity are still missing formal bridges. Python
normalization is not a Lean theorem. In particular, the conditional source
transfer does not discharge its own premise.

The first delayed band starts at X^(n+2), suggesting the coefficient formula
extends through j=n+1. Further exact gap expansions with n=j and n=j-1 also
have nonnegative coefficients, but these extensions were not formally proved.

The normalized expression matched 2,760 further coefficient positions.
Independent literal numerator and backward-cut recurrences on 360 sources
through denominator 36 matched 5,569 raw positions and 14,422 backward
positions, including small cycles, zeros, and 2,409 polygon triples. All these
checks are finite experiments, not universal proofs.

## Validation boundary

All accepted modules must have successful final-source builds, separate
kernel replay, and permitted axiom closures in `validation.json`. Rejected
base simplifications, a timeout, a premature dependent build, the lexical
`≤s` parsing failure, and repaired casts are retained in operational receipts.
Pinned inherited compiled imports were reused. This is not a fresh whole-source
rebuild or an independent completion audit. No root closure is claimed.
