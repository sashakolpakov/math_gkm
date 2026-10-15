# Independent mathematical monitoring audit: worker 000067

Request: `320fe46fcee34a5a829606c8fa65b08e`.
Project: `/Users/sasha/math_gkm`.
Completed snapshot: `.control/markov/workers/000067/artifacts`.
Evidence: `evidence/markov-320fe46f`.

Read-only examination of ten new mathematical modules, their English statements,
the inherited Tail replay, successful records, archived/current hashes, and
finite evidence. No project edits, proposer contact, mathematical guidance,
new checks, proof repair, or experiment reruns were performed.

## Finding

The substantive positive result is correctly universal over every path
`R^n L rest`, every nonnegative nondecreasing real weight sequence, and every
natural coefficient index, at **one cut**. Exact mask enumeration and source
word identities connect the weighted polynomial to the manuscript's sources.
Zeros and small cases are retained. No substantive English/Lean discrepancy
was found in the final results.

All ten new modules have matching successful ordinary Lean compilations and
alternate-driver kernel replays. The unchanged inherited OneCutTail module
also completed replay in this worker. The new OneCutRaw320f module completes
the formerly unfinished universal raw triple and polygon bridge; this does
not retroactively change worker 66's timeout records or validate its old Raw
draft under its old name.

## Exact coverage and weights

`source_mask_weighted_all_lc320` assumes `w : ℕ → ℝ`,
`∀ k, 0 ≤ w k`, and `Monotone w`. For every natural `n,j` and finite Boolean
`rest`, it considers the exact one-cut masks of

`central28 (replicate n true ++ false :: rest) ++ [true]`.

The polynomial is the sum over that literal list of
`w(maskDegree 1 m) * maskWeight(X,X,1,m)`. Thus all masks in a degree layer
receive the same weight, and every original mask multiplicity is retained.
There is no arbitrary per-mask reweighting or change of the source numerator.
The theorem concludes `p_j*p_(j+2) ≤ p_(j+1)^2` for every natural `j`.

No log-concavity, strict positivity, finite support, or growth bound is assumed
for `w`. Only finitely many weights are used for each finite source word, so
there is no convergence premise. Zero weights and coefficient tails are allowed.

The paths are precisely those containing a left step: take the initial run of
right steps before the first left. This includes the entire left spine (`n=0`),
even though the English sometimes calls the class “mixed.” Pure repeated-right
paths, including the empty path, are outside this new arbitrary-monotone-weight
theorem. The statement has no path-length or denominator cutoff, but it does
not cover cut counts other than one. The zero/one rational endpoint clauses
of the root are unchanged.

## Actual source decomposition and all-index proof

`weightedOne_masks320` proves the recursive evaluator equals the literal mask
list, in a general commutative ring. The unique zero-cut suffix is counted
exactly once; its degree and weight identities discharge the recursion step.
`weightedOne_nonneg320` gives every coefficient's nonnegativity for nonnegative
weights using the actual mask factors.

`source_weighted_runs320` derives the polynomial from the inherited exact
source substitution, rather than assuming a run description. It is

`H_n + sum_(r in central28 rest) J_(n + bit(r))`,

where `H_n` is the initial weighted block plus the final run, and `J_n` is
the reset block. The separate `weighted_runs_counts320` identifies the two
multiplicities as the counts of false and true letters. The run formulas use
the actual reset/pure polynomials and their degree weights; ordering and
source identification are not replaced by an unproved arbitrary-word claim.

The proof uses **linear coefficient concavity**, not closure of arbitrary LC
polynomials under addition. The exact second differences of the basis
polynomials are established by `MarkovCurvature320f`; weighted sums give the
identities in `MarkovWeightedCurvature320f`. Nonnegativity and monotonicity of
`w` discharge their signs for each starting index `j<n`, including overlapping
small-index boundary cases.

`source_weighted_zero320` proves every coefficient with `j>n+1` vanishes,
without any weight hypothesis. Therefore:

- for `j<n`, coefficient concavity plus nonnegativity implies LC by the
  explicitly proved square-difference inequality;
- for `j≥n`, the right endpoint coefficient `p_(j+2)` is zero, and LC reduces
  to nonnegativity of a square.

This proves all natural indices, including `n=0`, where the interior case is
empty and every LC triple has a zero right endpoint. No support entries are
discarded or silently reindexed. The concavity assertion itself is limited
to triples entirely inside indices `0,...,n+1`; global concavity across the
zero extension is not asserted.

## Geometric and literal raw bridges

`source_onecut_geometric_lc320` specializes to `w_d=z^d` for every real
`z≥1`, proving the required nonnegative monotone weight conditions and using
the exact marked-evaluator identity. It is not a theorem for all positive
`z`, consistent with the earlier small-`z` deformation obstruction.

`source_onecut_raw_lc320` specializes to `z=1`, forgets the degree marker,
and invokes the actual source coefficient bridge. Its sole index premise is

`i+j+2 = a+1`.

The conclusion is the integer raw inequality at
`(i,j+2),(i+1,j+1),(i+2,j)`, with both endpoint identifications and the middle
identification derived from this premise. It needs no polygon premise and
therefore also holds for every polygon-valid triple on that one-cut slice.
There is no hidden coefficient formula or LC assumption. This raw one-cut
region was already known; the new content is its robustness under arbitrary
nonnegative nondecreasing whole-degree weights and the concavity proof.

Precisely, the inherited `source_cut_coeffA27` identifies cut count `s` with
raw total degree `i+j=a+s`; the auxiliary mask degree `d` used by the weights
is a different coordinate. Thus `s=1` is the **first lower diagonal**
`i+j=a+1`, not a new upper-diagonal region. The inherited theorem
`source_first_lower_diagonal487` in `research/MarkovLowerSource487.lean`
already proves exactly this diagonal inequality for every source path when
all three polygon guards hold. `root_iff_interior487` in
`research/MarkovInterior487.lean` already removes those inequalities from the
remaining root obligations. Worker 67's weight-one corollary drops those guards
on the mixed-path class by proving all coefficient indices, including zeros;
it adds no previously uncovered polygon-valid raw region.

The separate `oneA_raw_top320f` now supplies the previously unfinished exact
comparison for `n=m+3`, path `R^n L`, labels `(2n+1)/(2n+3)`:

- all three points `(n+3,n−1),(n+2,n),(n+1,n+1)` satisfy the root polygon;
- the integer raw coefficients are exactly `[20,12,4]`;
- the gap is exactly 64.

The source coefficient specialization and natural subtraction are explicitly
resolved. This theorem covers every `n≥3`, without a finite cutoff or an
unproved source-membership premise. The inherited marked formulas used by it
have the same final source hash as worker 66 and now a successful replay.

## Auxiliary counterexamples and their raw scope

For actual source 1/3, path `[false]`, the formal exact degree refinements at
cut counts 0,1,2 are `1`, `2z(1+y)`, and `z^3(1+y)^3`.
`source13_weighted_gaps320` proves the horizontal and vertical auxiliary gaps
are respectively `z^2(4−z)` and `z^2(4−3z)`. The checked arithmetic gives
gaps `−25` at `z=5` and `−8` at `z=2`, while their `z=1` gaps are 3 and 1.
The geometric weights are increasing in these counterexamples, but these
comparisons vary cut count and are outside the positive one-cut theorem.

`source13_polygon320` proves the source labels and all five required polygon
points: `(1,0),(2,0),(3,0),(1,1),(1,2)`. The raw interpretation follows from
the inherited source/forgetting bridge, the new exact refinements, and their
specialization at one. The new file packages the gap formulas, numeric
specializations, and guards separately; it does not assert a negation of the
raw conjecture. The independent literal recurrence also records raw triples
`[1,2,1]` and `[1,2,3]`.

The finite higher-cut example at source 1/42 uses three cuts and weights
`[1,1,10]` on degrees 1..3. Its weighted triple `[3228,342,40]` has gap
`−12156`; those weights are increasing but not LC. The complete raw triple
at the same polygon points `(3,1),(2,2),(1,3)` is `[3120,234,4]`, gap 42276,
verified by a separate literal recurrence computation. This example remains
experimental in this worker, not a Lean counterexample theorem and not a raw
source counterexample. It supplies no conclusion about increasing weights
that additionally satisfy LC.

## Final validation and exact hashes

Ten final sources match successful build/replay records, saved source snapshots,
compiled objects, current/archived files, host after-hashes, and artifact
manifest. The inherited Tail replay matches its unchanged worker 66 source
and object. All 72 selected artifact bindings matched. Twenty printed theorem
closures from accepted new builds contain only `propext`, `Quot.sound`, and,
where needed, `Classical.choice`. The source files contain no admissions or
custom axioms. Failed earlier build diagnostics are not used as evidence.

| Module | Final source SHA-256 |
|---|---|
| MarkovCrossObstruction320f | `fc4818ef5afb6c196d293460230a8208cdeffedc521647fafd0e5cae591c45cb` |
| MarkovCurvature320f | `eac1ebe813147fa8810a2dab042f39bf3fcdaf1741cde0ee2469654457d64d0f` |
| MarkovIncreasingOne320f | `c7fde6dea531f30eb6060e0c148de077c5c72bf7bc06a55ba1308814f7d44182` |
| MarkovIncreasingSource320f | `66ea878cf14d76bf25f8104987435d40df053b43c2d8d29a1288caae7e484e2f` |
| MarkovOneCutRaw320f | `32980b0f32ecafd91bc02c65d057a891faa7c45be14543babd694cbcd851b286` |
| MarkovWeightedCurvature320f | `c6ace155017e446c32138d32c9e218e55bfa3fb69011f5aaa6c01228a18548f6` |
| MarkovWeightedMasks320f | `b9188f2c14dd817f5428a10cd1c8bf49d8b23d0873463a025632fffcca6e51f7` |
| MarkovWeightedOne320f | `8289085cf76a03782c0ba3a8e6b5a592e4fa4af614c4df28b820e5599df55fd9` |
| MarkovWeightedSource320f | `763a34214ea4d9ed7f98c2122d49eb8ed5a0183647d4d5ea2cc613839576fe1c` |
| MarkovWeightedSupport320f | `59b0914f33dc1641fd5afb37df72da3f0a90ab4d7489f413c5dc308b6601763f` |

All ten table entries passed ordinary compilation and alternate-driver replay.
The inherited `MarkovOneCutTailC416` source remains
`9f6eacf1d22f691566182f3b7410d6e7c451b14d44778c7d69dff152dea1cb40`;
its successful new replay record is
`run-MarkovOneCutTailC416-replay-1792024635995248000.json`.

Every accepted replay has child return code zero, exact expected module
begin/pass output, and the intended source hash. All use the unchanged
`ReplayKnown6d2c.lean` driver, hash
`18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
Its accepted assurance is the pinned default per-module kernel procedure,
as established in the independent
[worker 65 method audit](markov_worker_000065_replay_method_audit.md).
These are alternate-driver successes, not official `leanchecker` CLI successes;
imported dependencies are reused, not freshly rebuilt/replayed here.

There are 30 validation attempts: ten successful compilations, eleven successful
alternate replays including inherited Tail, eight rejected builds, and one
build timeout. The final manifest selects only checks matching current sources.
An earlier IncreasingSource build overlapped a source edit and failed; the
later current-source build and matching object replay are the accepted pair.
All run records match the completed archive. No late or unfinished check is
being counted as passed.

Last accepted replay ended at 2026-10-15 00:54:08.302391 UTC, before normal
host finish at 00:55:04.787668 UTC. The host records `completed`, return code
zero, 1134.15 seconds, mathematical resolution false, and completion null in
its embedded final report. There is no separate report.json, which is not a
missing host report in this worker.

Protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`;
canonical contract hash remains
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
No fresh whole-source rebuild or independent root-completion certificate is
claimed by these checks.

## Finite experiment limits and remaining obligations

Saved scripts and records, inspected without recomputation:

- 40,456 coefficient identity comparisons and 15,448 each of concavity and
  LC checks on 1,042 distinct mixed-source inputs with denominators 3 through
  60, using eight sampled monotone weight sequences per source. These are
  finite checks of the independently proved formulas, not their proof.
- 35,055 one-cut and 468,315 higher-cut weighted checks on 758 distinct source
  inputs in a shuffled denominator-3-through-64 list; the finite time-limited
  scan records the higher-cut failure above. It samples intervals, potentially
  repeatedly. Upper truncation of a weight can destroy global monotonicity,
  so some finite interval tests exceed the formal positive theorem's scope.
- The initial cross-cut suffix failures at 15/56 are finite diagnostics with
  positive complete raw gaps. The smaller 1/3 degree-refinement formulas and
  guards are formalized separately.

The new result proves robust one-cut aggregation for all paths with a left
step, and completes the specified inherited raw bridge. Higher-cut aggregation,
the remaining horizontal/vertical raw inequalities, and full Conjecture 6.3
remain unresolved. No published novelty claim is assessed or asserted here.
