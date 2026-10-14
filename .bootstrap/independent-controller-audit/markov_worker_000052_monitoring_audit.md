# Independent monitoring audit: worker 000052

Worker request: `bf38fa192cd64d11804e5c1de553ef23`.
Audit date: 2026-10-14. Read-only examination of the completed worker's
archived artifacts under `/Users/sasha/math_gkm/.control/markov/workers/000052/artifacts`,
with final hashes compared to current files and the host receipt. No project
changes, experiment reruns, new Lean builds, proposer contact, mathematical
guidance, or completion of earlier pending replays were performed.

## Finding

The principal verified result is an exact recursive representation of the
second lower source slice, including all natural index positions and the
two-run correction. The source-word identification is actually proved and
discharges the generic formula's conditional premise. Scalar coefficient
recurrences and strict denominator descent are also proved.

No new unconditional source log-concavity theorem follows yet. The tail
inequality is an abstract parameter certificate; the claimed coefficient
and source-statistic identifications remain explicitly outstanding. The
universal order-dependence identity concerns auxiliary words and is not a
source counterexample. No material English–Lean mismatch was found in these
distinctions. The pinned root remains unresolved.

## Exact source coverage and meaning

The source objects remain `frame`, `sourceWord28`, and `central28`; the raw
coefficient is still `coeff (frame path).mid.p i j : ℤ`. Under the inherited
shear the slice parameter is `s=i+j−a`, not a normalized coefficient index.

`source_second_recursiveBF` states, for **every** finite Boolean path, one
of the following:

1. There exists `k` with `path=replicate k true` (the Pell branch).
2. There exist natural `n` and a path `rest` with
   `path=replicate n true ++ false::rest`, and for **every** natural `i,j`
   satisfying `i+j=(frame path).mid.a+2`,

   `coeff (frame path).mid.p i j = (secondSliceBF (sourceRunsBF n rest)).coeff j`.

Thus every path containing a false letter receives the exact source formula.
There is no path-length, numerator, or denominator cutoff, and no polygon,
nonzero-coefficient, adjacency-statistic, or log-concavity assumption in the
final equality. Its natural-index constraint is important: the theorem is
about the actual raw positions with `i+j=a+2`, not hypothetical negative
raw exponents. The all-true branch is explicitly separated and does not
pretend to prove a new Pell result. Root endpoint clauses are unchanged.

The generic `source_second_sliceBF` has a word-identification premise
`sourceWord28 path=ns.flatMap lowerRun487` and `2≤ns.length`. Both premises
are discharged in `source_second_recursiveBF`, rather than being hidden in
the final claim. Specifically,

`source_run_substitutionBF` proves

`W(true^n ++ false::rest)=lowerSub_n(W(rest))`,

where `lowerSub_n` replaces `A` by `AB^n` and `B` by `AB^(n+1)`.
`sourceRunsBF n rest` maps the **actual source word** `W(rest)` to the
corresponding run lengths. `source_runs_lengthBF` proves that the resulting
run list has at least two elements from the actual source-label bounds.
The shorter binary word is not an arbitrary palindrome or an experimentally
chosen ordering.

`source_run_indicesBF` proves, for `a0/b0` associated to `rest`,

`a=n b0+a0`, and `b=(n+1)b0+a0`.

`source_run_descentBF` proves `b0<b` for every such `n,rest`, including
`n=0`. This is a valid strict descent in a natural index. It does not prove
that any coefficient inequality is preserved by the substitution or itself
constitute a log-concavity induction theorem.

## Generic matrix identities and exceptional run counts

The block matrix is `M_n=T_A T_B^n`. The generic multiplication theorem is
over matrices of bivariate integer polynomials with `LowerShape487`:

`[x^0]M11=0`, `[x^0]M12=0`, `[x^0]M22=1`, and `[x]M12=1`.

These are genuine hypotheses on arbitrary matrices, proved for each actual
run block and retained under multiplication. With

```
b(M)=[x^0]M21,
H(M)=[x]M22+b(M),
delta(M)=[x]M11-b(M),
beta(M)=[x^2]M12-[x]M22,
K(M)=[x^2]M22+[x]M21,
L(M)=beta(M)+delta(M),
```

`second_run_mulBF` proves the advertised product identities. In particular,

`K(MN)=K(M)+K(N)+H(M)H(N)+b(M)L(N)`.

For actual run blocks, the inherited first-coefficient formulas give
`b_n=2(y+...+y^n)` and `delta_n=y^(n+1)`, including `n=0`.
The new `lowerMatrix_second_relationBF` proves
`L_n=y−1+y b_n` for every natural `n`.

For at least three runs, `run_trace_secondBF` is expressed using the
explicit `runScoreBF` recursion and the closing term
`L(first) b(last)`. The recursion adds each `K`, every pair product `H_iH_j`,
and the nonclosing terms `b_i L_(i+1)`. It therefore matches the English
cyclic formula, without imposing commutativity of the matrix product or
permutation invariance of its coefficient.

The exact `runTraceTwoBF` definition distinguishes empty, one-run, two-run,
and at-least-three-run lists. For two runs the trace includes the additional
`delta_n delta_m=y^(n+m+2)`. For one run it retains the direct matrix
coefficient. `run_trace_formulaBF` proves all cases; no exceptional case is
filled with an unproved generic formula.

The actual source slice is

`secondSliceBF = runTraceTwoBF − (1+y)(runHsumBF−1−y)`.

This subtraction is derived from the inherited exact identity
`tr(T_W)=(1+x(1+y))F`, by extracting coefficients of `x` and `x²`.
It is not omitted in the source transfer. For an actual two-run source,
the sum of run lengths is its numerator `a`, so the correction described
in the correspondence as `y^(a+2)` agrees with the explicit delta product.
All coefficient identities retain zeros.

## Universal order dependence

For every natural `n`, `adjacent_run_order_gapBF` proves the polynomial
identity

```
[x²]tr(M_n M_n M_(n+1) M_(n+1))
 − [x²]tr(M_n M_(n+1) M_n M_(n+1)) = 4y^(2n+3).
```

This is not merely a handful of evaluated examples. It follows from the
generic four-block formula and the checked first-coefficient run identities.
It rules out a count-only description for these unrestricted cyclic words.
The theorem supplies no source-path witness for either word, reverses no
raw log-concavity inequality, and is correctly not described as a
counterexample to Conjecture63.

## Scalar recurrences and the conditional tail inequality

The scalar definitions are exactly

```
C_0=y, D_0=0,
C_(n+1)=yC_n+2yH_n+y−y²+2y^(n+2),
D_(n+1)=D_n+(1+y)(C_n+H_n−2R_n),
R_n=y+...+y^n.
```

`lowerMatrix_scalar_jetsBF` identifies them with `[x]M21` and `[x²]M22`
for all natural `n`. `runK_scalarBF` consequently gives `K_n=D_n+C_n`.
These are polynomial coefficient identities, not formulas inferred from
evaluation at selected `x,y`. The displayed closed coefficient formulas
for `K_n` in the report are not proved by a separate new Lean theorem.

`second_tail_boundBF` proves, for **real** `r,c,q` with
`r≥2`, `0≤c≤2r`, and `0≤q≤r−1`,

`4q[16r(c+r)+4c−24r] ≤ (8r²)²`.

Its proof checks the displayed polynomial certificate and all needed order
conditions. No integrality or actual source witness is assumed. Conversely,
the theorem does not identify its three expressions with raw coefficients,
prove the proposed source adjacency count, or establish that all source
parameters satisfy the requisite hypotheses. The report correctly leaves
these connections outstanding. It is therefore not a new unconditional
log-concavity theorem for the source tail.

The compressed formula in terms of run count `c`, long-run count `r`, and
cyclic long-long count `q`, the proposed equality `q=max(2r−c,0)` for
sources, the closed `K_n` coefficients, and the three tail coefficients
are distinguished as derivations/finite checks awaiting formal bridges.
The source recursion alone does not silently discharge these obligations.

## Verification records and provenance

All four final source hashes agree among current files, archived files,
host `changes.after`, final manifest, and the selected build/replay source
snapshots. All eight selected records return zero, bind the expected source
and hash, and use the expected `lean`/`leanchecker` command and module.
Their JSON files match the current and archived host-bound artifacts.
Final object hashes agree among current objects, archived objects,
manifest, and host receipt.

| Module | Source SHA-256 | Build suffix | Replay suffix |
|---|---|---|---|
| MarkovSecondRunBF | `007f58fab4f8c9581e95a086aff845ffb2787dfe6db2bfb62ee553b36201bf76` | `1792007381659829000` | `1792007442687529000` |
| MarkovCyclicSecondBF | `1f9b0b62284fa35209172685a04ed79f4740aa5932a1279d3c4e13a7c0e87c2e` | `1792007549225931000` | `1792007608694882000` |
| MarkovSecondSourceBF | `555c20ce95d070b4f4b403f747942524f1ff9df5fec87a94bb5ab9ce74b7acfd` | `1792007607470178000` | `1792007700047469000` |
| MarkovRunRecurrenceBF | `8b880e3e04dc7651c3c91228e6ecb01ba1fd15e8496a426865613319ff3d3eee` | `1792007839939054000` | `1792007966798385000` |

Record paths are `evidence/markov-bf38fa19/run-<suffix>.json`.
All thirteen manifest axiom-print lines match successful final build output
and contain only subsets of `propext`, `Classical.choice`, and `Quot.sound`.
Three earlier failed elaborations are retained and excluded from accepted
evidence, including their error-recovery `sorryAx` prints.

Final replays ended at 19:52:16.277, 19:54:37.896, 19:56:03.812, and
20:00:34.312 UTC. The manifest timestamp is 20:00:41.152; normal host
completion is 20:01:01.721 UTC after 1034.637 seconds. The host report
has `completion:null` and `mathematical_resolution:false`. Final report,
checkpoint, correspondence, mathematics note, and manifest hashes also
match their archived host-bound and current versions.

The independently recomputed protected root and canonical contract hashes
remain respectively
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe` and
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

These are inspected matching recorded checks, not an independently rerun
whole-source build. Inherited compiled dependencies were reused. The
predecessor's reported replay timeouts are not reclassified as successful
standalone records by this audit, and no pending replay was completed by
the reviewer.

## Finite experiment interpretation

The scripts and saved outputs were read; the experiments were not rerun.

- The cyclic probe enumerates binary run orderings for `n=0..3` and
  `c=3..8`, recording 60 count-parameter cases with order dependence.
  This is separate from the universal Lean identity above.
- The source probe covers 2,944 reduced fractions with `b≤100` and
  `b−a≥2`. Its 111,312 coefficient comparisons check the proposed
  count-compressed expression against an exact truncated matrix-trace
  calculation, including zero padding. Its 105,424 adjacent comparisons
  test those slice arrays; they are not all separately polygon-admissible
  triples. For 84 small sources (`b≤18`), it also compares the arrays
  with the independent scalar-transfer implementation. This is not an
  independent original Laurent-recurrence scan. The new Lean source
  bridge supplies the rigorous identification with raw coefficients.
- The proposed source adjacency statistic is checked on those finite
  inputs only. The 871 tail checks and 5,454 closed-`K` coefficient checks
  remain experiments; the latter use `n=0..100` and `j=0..n+3`.
- The artificial envelope tests use `n=0..15`, `c=3..60`, `0<r<c`,
  `max(2r−c,0)≤q≤r−1`, additionally imposing `q=0` when `2r<c`.
  They record 3,138,496 adjacent tests with no failure, retaining zero
  coefficients. These parameter choices need not be actual source
  witnesses. The initial slow implementation was interrupted; the
  completed cached implementation took 8.72 seconds and is the reported
  finite result. Its optimization is not a proved controller improvement.

The useful new mathematical content is the exact source-aware recursive
formula and its checked scalar structure. No complete new direction,
all-source second-slice inequality, root proof, or root refutation is
established in this worker.
