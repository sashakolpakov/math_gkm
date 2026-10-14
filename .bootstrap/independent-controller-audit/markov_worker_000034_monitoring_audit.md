# Independent monitoring audit: worker 000034

Request: `3979f3c739b946f2a07319e5c9795bce`.

Read-only review of the completed worker snapshot under
`/Users/sasha/math_gkm/.control/markov/workers/000034/artifacts`, both final
Lean modules, correspondence/mathematical/checkpoint notes, the validation
manifest, build and kernel-replay receipts, and host receipt. Relevant
inherited excess-series definitions and exact source coefficient bridges
were inspected to check the meaning of the new statements. No project files
were changed, no research advice or proposer contact occurred, and the active
successor was left undisturbed. No fresh Lean build was run.

## Conclusion

The worker proves the Pell family's entire zero-excess vertical boundary
case and two precisely delimited obstructions to stronger summation or
preservation assertions. Both obstructions use explicit valid inputs for
the properties they actually test. Neither gives a raw Markov-source
counterexample, and neither proves the remaining interior inequalities.
No substantive English/Lean scope mismatch was found.

Both final modules have matching successful compilation and separate kernel
replays. The host outcome is `completed` after 1193.34 seconds; mathematical
resolution is false and completion is null.

## Actual raw source boundary result

`bottom3979 n j` is an exact rational cast of the protected source coefficient
at `(n+2,j)` for the path `replicate (n+1) true`, whose actual source labels
are `(n+2)/(n+3)`. It is not a free polynomial or normalized coefficient.
For every natural `n`, Lean proves the exact values

```
A(n+2,0) = 1
A(n+2,1) = 3n+5
A(n+2,2) = (17n²+23n+12)/2.
```

`bottom_polygon3979` proves all three coordinates belong to the unchanged
source polygon for every such `n`. Their raw log-concavity gap is
`(n²+37n+38)/2`, and `bottom_raw_vertical3979` proves the raw integer
inequality. All formulas come from the literal source coefficient/excess
identities rather than an assumed combinatorial interpretation.

`right_bottom_vertical3979` separately includes the source 1/2, whose
rightmost tested coefficient is zero. `excess_vertical_zero3979` proves
the full `s=0` instance of the inherited `ExcessVertical00b3` predicate for
every natural `n,i,j` with `i+j=n+1`. When `j=0`, it uses the actual raw
boundary theorem; when `j>0`, the left endpoint is exactly zero.

This is the bottom excess band. It does not prove all positive-excess
vertical comparisons, all coordinates in the Pell family, or the general
rational-source conjecture. It is distinct from the previous starting
band `i+j=a+1`: here the starting total is `i+j=a`.

## Exact cumulative-mixture threshold

`bottomSum3979 N j` is the unweighted sum of those literal source coefficients
over `n=0,...,N-1`. The three sums are proved exactly:

```
N,
(3N²+7N)/2,
(17N³+9N²+10N)/6.
```

The polynomial identity for twelve times endpoint product minus center
square is `N²(7N²-108N-127)`. From it, `bottom_sum_lc_iff3979` proves

```
bottomSum(N,0) bottomSum(N,2) ≤ bottomSum(N,1)²  iff  N≤16.
```

This includes `N=0`, where all sums vanish. `bottom_sum_failure3979` proves
the strict reversed inequality for every `N≥17`, without a finite upper
bound. Every component triple is independently proved polygon-valid and
log-concave. The theorem is therefore a genuine obstruction to inferring
this inequality by arbitrary summation across these source labels.

At `N=17`, the aggregate is `17,493,14382`, with reversed gap `1445`.
The corresponding gap at `N=16` is `-1344`. These threshold values were also
independently evaluated arithmetically during this audit. The aggregate
combines different source polynomials and different source-indexed positions;
it is not identified with any single source or a triple required by
Conjecture63. It cannot serve as a refutation of that conjecture.

## Geometric-prefix preservation failure with a proved input property

The inherited formal excess series is

```
E_s(x,y) = (x+y)^(2s) / ((1-x)^(s+1) (1-y)^s),
```

understood as a product of formal geometric series with integer coefficients.
Its coefficient/source correspondence is literal when the source index and
excess degree have their stated relation.

`prefixSeries3979 s` is explicitly `E_s` multiplied by one additional
geometric factor in `x`. `prefix_coeff_sum3979` proves the transformed
coefficient is the exact finite prefix sum in the first coordinate, including
zero terms. No analytic convergence or informal summation interchange is
used in the theorem.

The final `zero_slice_preservation_failure3979` proves both sides needed for
the claimed counterexample to preservation:

1. For every natural `i`, the input coefficients satisfy
   `E_0[i,0] E_2[i,2] ≤ E_1[i,1]²`.
2. The corresponding property fails for the transformed series.

The input assertion includes `i=0`, handled by a proved zero coefficient,
and all positive `i`, handled by the actual-source boundary theorem.
Thus the counterexample does not merely exhibit a bad output while leaving
the stated input condition unverified.

At `i=10`, the transformed cross-strip coefficients are exactly `11,155,2202`;
Lean proves `155² < 11*2202`, with positive reversed gap `197`.

The input property is specifically the zero-excess vertical slice above.
The result does not prove that the input satisfies every possible stronger
cross-strip hypothesis, refute ordinary fixed-sequence convolution closure,
or identify the transformed series as a source. The English report explicitly
retains these limits. This is a precise preservation obstruction, not a full
root counterexample or an obstruction to every possible transfer argument.

## Experiments and remaining scope

The generalized-kernel scans, finite symbolic gap expansions at excess
degrees one through six, and enlarged-word horizontal scans remain
experiments. They do not establish arbitrary-excess inequalities, omitted
boundary cases, or a full enlarged-family theorem. The explanatory matching
model and literature discussion are not used as unverified Lean assumptions.
This audit does not make a historical novelty claim.

## Recorded verification

| Module | Final source SHA256 |
| --- | --- |
| MarkovPellMixture3979 | `469223febb91f497452b09b2b172e15fa16f9845cd62990e8bee5650dd1139f2` |
| MarkovPellKernelObstruction3979 | `7d0b38c1b4103fe90f115869719eaf2a0c3b100d0a683dcc88915cfb15227619` |

Each final source matches the archived snapshot, current source, manifest,
and host change receipt. Both listed builds and both listed kernel replays
return zero, bind the exact final source hashes, and themselves match the
archived host receipt hashes. The replay commands use Lean 4.32.2
`leanchecker` on the named modules.

The decisive final kernel receipts are
`run-1791986918382995000.json` for Mixture and
`run-1791987145134952000.json` for KernelObstruction, both under
`evidence/markov-3979f3c7/`.

There is also an earlier successful KernelObstruction build/replay with a
different hash. It is not substituted for final validation: the version
containing the explicit valid-input preservation theorem was rebuilt and
replayed, and the manifest points to that final version.

All eight printed theorem dependency closures in the final build outputs
contain only `propext`, `Classical.choice`, and `Quot.sound`. One earlier
Mixture elaboration failed and is correctly retained as rejected. Successful
intermediate versions are distinguishable by their different source hashes.

The checks reuse inherited compiled imports. The manifest does not provide
a separate direct-import binary hash table; this is matching named-source
build/replay evidence, not an independently rebuilt transitive dependency
closure. No full rebuild was needed for the scoped monitoring audit.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
Full conjecture completion is not established.
