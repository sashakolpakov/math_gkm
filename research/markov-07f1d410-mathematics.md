# First two coefficient bands of the third lower slice

Machine-authored live request `07f1d4107cd9444f9e7c04207d4f33d9`.
Full pinned Conjecture 6.3 remains unresolved. Final acceptance is recorded
in `evidence/markov-07f1d410/validation.json`.

## Reconciliation

Read the full mission/design, pinned contract, inherited index, independent
target/residual/mathematical audits, latest reports and raw worker logs.
Workers 77 and 78 had finalized successfully. Worker 79's finalizer failed
because it demanded a kernel replay for an import-only diagnostic module.
Its 23 mathematical modules and final axiom audit have matching successful
build/replay receipts, and all 68 named theorem closures are permitted.
The diagnostic has no mathematical declarations and is explicitly excluded.
No predecessor generator or finalizer was replayed. The 343 earlier manifest
checks passed; predecessor files and pinned inputs were hashed for preservation.

## Exact coefficient identities

Write `T=thirdRunPolyADB2 n c r`. The inherited denominator identity is

    (1-X)^6 T = K0 + X^(n+2) D.

The new first-coefficient module extracts `T_0,...,T_5` exactly. Four separate
ring certificates prove their consecutive gaps nonnegative under `1≤r<c` and
the appropriate run-length bounds. Seven further certificates extend the
inherited uniform interior shape inequality from center `j≤n-1` to `j≤n`.
The source adapter proves the actual raw inequality for every starting index
`j+1≤n`, without the inherited restriction `4≤j`.

For the next band, the exact denominator is reorganized as

    (1-X)^6 T = K0 + X^(n+2) K1 + X^(2*n+3) R2.

`K1=tailPoly07F1 n c r` has eight explicit coefficients. The formal inverse
series of `(1-X)^6` yields an explicit polynomial `secondShape07F1` satisfying

    secondShape07F1 n c r j = 15*T_j

for all natural parameters and `n+4≤j≤2*n+2`. This is proved using the exact
falling-factorial/binomial identity and the inherited injective denominator
identity. The coefficients are not inferred from interpolation.

Four crossing certificates handle centers `n+1,...,n+4`, including the two
positions where the general falling-factorial expression is not yet valid.
Within the second band, set `n=t+s+4` and center `j=2*t+s+9`. For `r≥2`, use
`r=u+2,c=u+v+3` and split the gap by powers of `s`. The nine nonzero resulting
coefficient polynomials have nonnegative coefficients. The `r=1,c≥3` case
uses a smaller split by powers of `c-3`; `c=2,r=1` is separate. All splits are
exact ring identities, not numerical positivity claims.

The intended final composition `source_third_two_bands07F1` has hypotheses
`4≤n`, `j≤2*n`, and `i+j+2=a+3` for the actual mixed source path. Its admission
is determined by the final inventory, not by this prose. All positions beyond
this range remain outside this theorem.

## Finite independent checks and a range obstruction

The exact experiment checked 744 sources, 20,553 coefficient positions,
375 positions against the literal raw numerator recurrence, and 19,065
polygon-valid triples, including 2,604 crossing triples. No failures occurred
inside the claimed ranges. These computations are not universal proofs.

At `n=4,c=2,r=1`, the source fraction is `9/11`. At coefficient index `j=11`,
the truncated two-band expression predicts the scaled coefficient 552, while
the actual scaled raw coefficient is 480. This is outside the proved range
`j≤2*n+2=10`. Additional examples show both signs of the omitted correction.
It refutes unrestricted extrapolation of the two-band formula, not Conjecture
6.3. The saved experiment includes the exact inputs and mismatches.

## Operational evidence

Initial low-coefficient builds needed explicit reduction of natural binomial
numerals. Four generated inequalities initially hit Lean's `≤s` graph token;
spacing repaired them. Two adapter proofs needed explicit coercion reductions.
Monolithic `r=1` proof attempts timed out; smaller exact coefficient certificates
resolved that bottleneck. Failed receipts and their source snapshots remain.
No rejected declaration or error-recovery axiom is admitted.

The active sandbox denies `.scratch`; unique persistent paths were used.
Sage/SymPy availability and the shell here-document failure are recorded in the
capability/operational artifacts. No package updates or protected edits occurred.
The inherited compiled imports were reused. Kernel replay checks new constants,
including a union replay over the inherited import boundary; this is not a
fresh whole-source rebuild or independent completion audit.
