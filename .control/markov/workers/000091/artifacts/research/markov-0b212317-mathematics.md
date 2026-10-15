# Compact initial fourth-slice formula

Machine-authored live request `0b212317001348aaa31bde36d93913b1`.
The full pinned root remains unresolved. Consult final validation.json for the
exact accepted inventory; draft filenames do not imply theorem status.

The structural observation is that `fourthNumeratorBC` is a polynomial expression
natural under ring maps. Evaluation at Z=X^n and Z=0 therefore differs by a
multiple of X^n. This proves equality of all initial coefficients k<n and gives
the corresponding exact raw coefficient convolution for j<n.

At Z=0, both the local third and fourth moments depend only on their second
Boolean entry. Their cyclic sums reduce to c f(false)+r(f(true)-f(false)),
without source-chamber splits. This yields the checked compact numerator
`fourthLowPolyK0B c (n*c+r) X`. It has thirteen coefficient polynomials in two
parameters c and H=n*c+r, replacing the earlier expanded n,c,r expression.

Finite convolution with choose(7+j-k,7), retaining zero terms, and the sevenfold
falling-factorial identity give a 92-term integer polynomial `fourthShapeK0B`.
For j>=5 in the proved initial interval, 7560 times the literal raw coefficient
equals this shape. This exact coefficient bridge is distinct from log-concavity.

The shape satisfies adjacent log-concavity whenever c>=2, j>=6, and H>=c*j+1.
The certificate substitutes c=C+2, j=J+6, H=(C+2)(J+6)+R+1 with C,J,R>=0.
The resulting gap has 465 nonnegative terms. To avoid an expensive full
expansion, the proof decomposes each shifted shape as a quartic in R and checks
the nine coefficient identities separately. These are exact integer ring
identities, followed by ordered-ring nonnegativity.

Additional candidate work addresses the five small-index gaps and the stronger
shift bound X^(n+2). The local square-zero identities show that the Z-dependence
in the lowest x-terms cancels in the cyclic moments. A quotient-ring argument
proves generic divisibility of the numerator difference by x². The final
validation inventory distinguishes this proved fact from any unfinished
combination with the Z factor. Failed full expansions and assembly attempts
are preserved with source snapshots and timeout/error receipts.

The exact experiment in `research/experiment_0b212317.py` compares the new
compact expression with the inherited independent lower-cut matrix recurrence.
It checks 7,293 coefficient positions, 4,173 shape values, and 5,829
polygon-valid triples. The first shifted position j=n+2 differs in 729 tested
cases, supporting the need to respect the initial-interval endpoint. These
finite checks are not universal proofs and are not used as Lean premises.

All source correspondence limitations are detailed in the companion
correspondence report. No historical novelty or full-root resolution is claimed.

Accepted source inequality: `source_fourth_initial_lcK0B` proves every fourth-slice triple starting at j with 5≤j and j+2<n, for every actual predecessor of denominator at least five and every natural n. All raw zeros remain. The boundary and stronger-shift assemblies did not finish; their intended larger interval is not claimed. `root_iff_coreK0B` records the reduced remaining predicate when admitted in final validation.
