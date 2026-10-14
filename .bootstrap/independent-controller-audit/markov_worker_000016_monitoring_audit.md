# Independent monitoring audit: worker 000016

Request: `3556cd95416f4d45a52269fa60ee7779`.

Read-only review of the completed worker snapshot at
`/Users/sasha/math_gkm/.control/markov/workers/000016/artifacts`.
No project sources were changed, no mathematical guidance was supplied to the
proposer, and worker 000017 was not contacted or disturbed.

## Finding

The completed work establishes raw vertical log-concavity at the fixed horizontal
index **i = 2 for every actual source polynomial with numerator a = 2**. It does
not establish that column for arbitrary numerator, or the remaining columns and
directions for the entire numerator-two family. The full published conjecture
remains unresolved. The English correspondence and final report preserve this
restriction correctly.

## Exact mathematical scope

Let `F_n = fib6 n` denote the previously checked numerator-one polynomial family.
`source_two_squares3556` states that every source path with a = 2 has some q ≥ 1
with b = 2q + 1 and exactly

    P_(2/(2q+1))(u,v) = F_(q+1)(u,v)^2 + v F_q(u,v)^2.

This is an identity for the actual unnormalized source numerator. It follows in
the checked source from the preceding exact source product identity and the
new Cassini identity, not from an assumed log-concavity closure principle.

The coefficient calculations concern the polynomial `[u^2]P`. The exact cleared
identity is

    (1-v)^4 [u^2]P = (1+v) - 8 v^(q+1)(1+v) + v^(2q+1) T_q(v),

where

    T_q(v) = (2q+3)(q+1) + (-2q^2+5q+14)v
             + (-2q^2-13q-4)v^2 + (q+1)(2q+1)v^3.

The subsequent power-series identity is formal; it requires no analytic
convergence assumption. For j ≤ 2q it yields an exact coefficient expression
as the difference of shifted cubic polynomials. Multiplication by the common
factor 6 is a denominator-clearing identity; the final inequality is for raw
coefficients, with no coefficient-dependent normalization.

The first/second jet identities handle n = 0,1 with integer subtraction after
casting, not incorrectly truncated natural subtraction. The later natural
subtraction j-q-1 is used only in the branch where q+1 ≤ j. The overlap of the
two cubic descriptions is explicitly checked using their vanishing values at
-1 and -2.

`source_two_vertical_two3556` has precisely the hypotheses `path : List Bool`,
`(frame path).mid.a = 2`, and `j : Nat`, and concludes

    A_(2,j) A_(2,j+2) ≤ A_(2,j+1)^2.

There is no denominator bound and no surviving polynomial-formula hypothesis.
The two integer cubic inequalities discharge the interior range. Outside that
range the actual Newton-polygon support theorem proves the right endpoint
coefficient zero, so all natural j, including boundary zeros, are covered.
The smallest q = 1 source is included.

The second concrete result concerns the actual path `[false,false,true]`,
representing 2/7. Its raw diagonal i+j = 4 has generating polynomial

    X^2 (14 + 28 X + 15 X^2).

`source_diagonal_nonreal3556` proves that
`(-14 + I sqrt(14))/15` is a zero with nonzero imaginary part. This is a genuine
source diagonal, not an arbitrary matrix-family example. It rules out the
universal real-rootedness assertion for these diagonals. It is **not** a
log-concavity counterexample: the nonzero coefficients satisfy 14*15 ≤ 28^2.
The zero coefficients preceding them are retained by the raw slice definition.

The 3,900 reported finite coefficient comparisons remain numerical evidence;
the universal coefficient identity and restricted LC claim have separate Lean
proofs. No historical novelty conclusion is made in this audit.

## Recorded verification checked

Manifest: `evidence/markov-3556cd95/validation-1791946972437403000.json`.
Each of the following final source hashes matches both that manifest and the
worker host receipt's archived change hash:

| Module | SHA-256 |
|---|---|
| MarkovSquares3556 | 9467b50b2103ed6c1e9954bce7dce876bea1a04ee08f6be0f23fb2d22fb45edf |
| MarkovFibJets3556 | 848d8657c0639af47aa7315a73231c5cb8b9c86dbb99d917d977b94e373657d3 |
| MarkovSecondColumn3556 | 6bdc874a8f4808fbf6a0f863d34e52ae3c300b044e521e04f4e1d375bfd56808 |
| MarkovSeries3556 | 162e3f447bfa5c7f6d7c6a6521b247cb28a060c73731f576a6b02240865ab335 |
| MarkovCubicLC3556 | df704afbfeceafa424c7a36ba0ab1f88851839d70c426b0164cc1ca2033c1411 |
| MarkovVerticalTwo3556 | 975bf9783295e3f47e53d16eb9af806d2e024d30c9beb923e4a29ed6ea020d2d |
| MarkovDiagonalExample3556 | bc0f2f6a050b90cd2fc6e198494674e1a73ab793f6541bc857ac188818b4d55e |

For all seven modules, the manifest points to a successful Lean compilation and
a successful `leanchecker` replay with the same source hash. All fourteen
receipt byte hashes match the archived host receipt. The twelve printed theorem
axiom closures list only `propext`, `Classical.choice`, and `Quot.sound`.
The eight separately recorded rejected attempts have return code 1 and were not
counted as successful final evidence. Every listed direct-import binary hash
also matched at audit time.

The root `MathGKM/Markov.lean` hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host records completion after 1106.33 seconds, mathematical resolution false,
and no completion certificate.

This is an independent inspection of source meaning and matching recorded
validation, not a fresh independent rebuild. The recorded validation uses
inherited compiled imports, as its manifest explicitly states. No discrepancy
requiring a full rebuild was found.
