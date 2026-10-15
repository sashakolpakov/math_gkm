# Fourth-band endpoints on the third lower slice

Machine-authored research for `e2cd486cc57d40438212692fe73d38ca`.
The pinned `MathGKM.Markov.Conjecture63` remains unresolved. Final-source
acceptance is recorded in `evidence/markov-e2cd486c/validation.json`.

## Reconciliation

Read the full mission/design, pinned root/contract, inherited evidence index,
independent target/residual/mathematical audits, latest full reports and raw
events for workers 77–81. Worker 81 completed its audit replay and finalizer
before the externally reported timeout. All 165 inherited artifact/input
checks passed. Worker 80's unfinished union replay remains an operational
failure already distinguished from its successful smaller replay. No old
generator, finalizer or other side effect was blindly replayed.

## Terminal coefficient extraction

Put `T=thirdRunPolyADB2 n c r`, where the mixed source path has indices
`a=cn+r`, `b=c(n+1)+r`. The inherited exact denominator identity has bands
starting at `0,n+2,2n+3,3n+4`. This work retains the fourth band rather than
extrapolating the third-band tail.

Its first two numerator coefficients are

    R0 = 24t+48q-72r+24c
    R1 = 24u-144t-480q+744r-96rq+192r²-288c+96cq-288cr+96c²,

where `q=max(2r-c,0)`, `t=min(c-r,max(3r-c,0))`, `u=max(3r-2c,0)`.
At indices `3n+4` and `3n+5`, the correction to the previous expression for
`15T_j` is respectively `15R0` and `15(6R0+R1)`. The formal proof uses the
power-series inverse of `(1-X)^6`; it makes no analytic convergence assumption.

The resulting four terminal coefficients at `3n+2,...,3n+5` are independent
of n. For `c/3≤r≤c/2` they are

    (2880r²+1440r+360)c + 2880r³-8640r²-1800r,
    960r³+120r,
    1080r-360c,
    0.

For `c/2≤r<c`, the first three are

    -2880c²+(2880r²+5760r+14760)c+2880r³-5760r²-30600r,
    -1440c²+(1440r+8640)c+960r³+2880r²-17160r,
    (-1440r+2520)c+2880r²-4680r.

The fourth is zero when `3r≤2c`, and `1080r-720c` when `2c≤3r`.
These formulas describe `15T_j=90A_(a+3-j,j)` for the actual source when
`c≥4`, not an index-dependent normalization.

The first experimental middle-chamber formula used the wrong branch for t.
The independent backward recurrence rejected it at n=3,c=5,r=3,j=13:
the predicted scaled coefficient was 3600, while the actual raw coefficient
was 32 and hence scaled coefficient 2880. The correct threshold for t is
`c=2r`. Initial data and the failure are preserved. No source theorem using
that incorrect specialization was accepted. Final-source theorem hashes and
replays, not initial build receipts, determine acceptance.

## Polygon and inequality composition

On the third lower slice, the original polygon guard implies

    c(j+2) ≤ 3b.

The two remaining starting indices from the predecessor therefore require
`c≤3r` at `j=3n+2` and `2c≤3r` at `j=3n+3`.
Seven exact polynomial gap certificates cover the relevant integer chambers,
including their boundaries. All coefficient zeros remain in the identities.

`source_third_long_largeE2` establishes the entire third lower diagonal for
every mixed path with n≥5 and predecessor denominator c≥4. The run-four
extension uses sixteen exact crossing-gap certificates, together with the
inherited first/second bands and the terminal results. The compiled final
composition `source_third_ge_fourE2` lowers n≥5 to n≥4. Its final-source replay
and the residual equivalence are recorded in validation.json. The residual
retains all other obligations of the pinned root explicitly.

## Experimental and validation boundary

Exact independent terminal experiments cover 1,274 sources, 3,380 coefficient
identities, 168 literal raw recurrence positions and 1,274 polygon-valid terminal
triples. These are finite checks, not universal proofs. A separate run-four
experiment and all its inputs are in `run4-experiments.json`.

New accepted mathematical declarations are compiled and separately kernel
replayed, with axiom closures recorded in validation.json. Inherited compiled
imports are reused. This is not a fresh whole-source rebuild or an independent
completion audit. Failed Lean elaborations, the chamber mistake and the shell
heredoc capability failure remain operational/development evidence.

The remaining third-slice families include runs two and three and predecessor
denominators two and three. Other residual slices, horizontal and vertical
directions, and all root correspondence obligations remain. No root theorem
or exact root refutation is claimed.
