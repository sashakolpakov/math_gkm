# Independent monitoring audit: worker 000062

Request: `6d34d54ad28c46a8a04b48ac176196b1`.
Project: `/Users/sasha/math_gkm`.
Completed worker snapshot: `.control/markov/workers/000062/artifacts`.
Evidence: `evidence/markov-6d34d54a`.

This is a read-only mathematical and recorded-validation audit. No project files
were changed, no proposer was contacted, and no proof, experiment, compilation,
or kernel replay was rerun. The conclusions below concern the inspected final
sources and matching recorded checks, with inherited compiled imports reused.

## Finding

The worker proves an exact higher-cut refinement for the repeated-right/Pell
source family: summing any consecutive interval of active individual mask
degrees, at a fixed positive cut count, gives a log-concave coefficient sequence.
The original mask multiplicities are preserved. All natural coefficient indices,
including zero tails, are covered. The final integer theorem has no denominator
or path-length cutoff.

No substantive English/Lean mismatch was found in the final mathematics,
correspondence, or report. This does not prove the full Markov conjecture or add
a new rational source family. The entire Pell constant-total raw direction was
already proved in worker 000026; this is a stronger decomposition-level result
within that family. No published novelty claim is assessed here.

## Exact quantifiers and endpoints

Let the repeated-B word have length `N`, let the positive cut count be
`c = s + 1`, and choose natural `L, width`, writing `H = L + width`.
The hypothesis of `runDegreeInterval_formula6d34` and its LC consequence is

`s + L + width < N`, equivalently `0 ≤ L ≤ H ≤ N − c` with `1 ≤ c ≤ N`.

The polynomial is the sum of exact mask-degree layers with degrees
`2*c + L, ..., 2*c + H`, inclusive. These are consecutive **active** degrees
for that cut count. The theorem does not state unrestricted interval endpoints
or a zero-cut theorem. Width zero and the maximal active upper endpoint are
included; all natural coefficient indices `j` satisfy

`p.coeff j * p.coeff (j+2) ≤ p.coeff (j+1)^2`.

For a source path consisting of `n` right steps, `central_right0618` identifies
the extended source word as `B^(n+1)`. Its rational label is
`(n+1)/(n+2)`. The final theorem
`sourceRun_degreeInterval_integer_lc6d34` assumes exactly
`s + L + width ≤ n`; the change from a strict to a weak inequality is explained
by the extra letter. There is no hidden source-membership or LC premise.

These polynomials are auxiliary sub-sums of one actual source slice, whose cut
coordinate is `i+j = a+c`. The degree marker tracks the degree of an individual
mask polynomial, not the omitted homogeneous variable. The new theorem does
not identify an arbitrary partial interval with the full raw source slice.
It supplies no horizontal or vertical comparison, since those change cut count.
The root's polygon predicate and separate endpoint clauses are untouched.

## Formula and source correspondence

The single active layer with degree `2*c+m` is proved equal to `(1+X)^(2*c)`
times a residual polynomial with coefficient at `j` equal to

`choose(j+c−1,c−1) * choose(m−j+c−1,c−1)` for `j ≤ m`, and zero otherwise.

For the interval `m=L..H`, the residual coefficient is, for `j ≤ H`,

`choose(j+s,s) * sum_{r=0..width, j+r≤H} choose(H−j−r+s,s)`,

and is zero for `j>H`. The upper-bound tests are explicit in the Lean
coefficients; natural subtraction does not silently wrap a negative index.
These negative-binomial coefficient formulas are unnormalized exact identities,
not probability distributions or rescaled coefficient sequences.

The inspected proof chain establishes the necessary identifications:

- `maskSum_snoc6d34` partitions masks by the final cut decision, retaining
  multiplicities. Appending an unselected letter preserves the old weight and
  degree. For repeated B, the selected-last masks have the exact common degree
  `N+s+2`.
- The resulting layer recurrence and above-degree vanishing yield
  `layer_run_exact6d34`: once the word is long enough, an active layer is an
  exact difference of two complete cut polynomials.
- `cut_run_raw6d34` uses the inherited exact source cut/raw coefficient bridge
  under its explicit natural-index equality. `runPrefix_exact6d34` identifies
  the whole cut polynomial, using the inherited exact raw Pell sum inside
  support and explicit degree/choose vanishing outside it. The separate
  out-of-range-cut case is also proved, not inferred by dropping coefficients.
- A Pascal identity, with its small case treated separately, gives the single
  layer formula. `intervalPoly_sum6d34` then gives the interval formula by exact
  summation and reindexing.
- Finite truncated negative-binomial coefficient sequences satisfy CrossLC;
  convolution, reflection, and pointwise product have the required sign and
  zero-extension hypotheses supplied. Binomial convolution gives the factor
  `(1+X)^(2*c)`. No infinite-series convergence is assumed.
- The integer conclusion follows from coefficientwise map/cast identities,
  not numerical evaluation or a sampled equality.

## Recorded validation and hashes

All seven final sources have successful matching compilation and separate
`leanchecker` records. For each, I checked current source, archived source,
host-receipt after-hash, artifact manifest, successful build and replay source
snapshots, record files, and compiled object. The 50 selected artifact bindings
(42 module-related plus eight final documentation/experiment records) matched.

| Module | Final source SHA-256 | Build / replay |
|---|---|---|
| MarkovWindowLC6d34 | `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` | passed / passed |
| MarkovWindowFormula6d34 | `1947511373607ed250ba1e8174f4f7d6536394f877985705afb97e528fb491ef` | passed / passed |
| MarkovRunDegree6d34 | `77302c57d3728fa3158e882bb41c0106e1336888c76abcd961d320ca61677708` | passed / passed |
| MarkovRunLayer6d34 | `fefcd6836aae459b79c7730685ab4a80574a62b87a5928b0664a5e081927a4f4` | passed / passed |
| MarkovRunPrefix6d34 | `a1f962c56d8a4a7c53529f220a56aed43bbeb83cc2e0c08d4ef6765e2e99ccb7` | passed / passed |
| MarkovRunLayerLC6d34 | `9c496c57184a5565304dee6c38f65af3101172c6c721312680a4e5dc08b34660` | passed / passed |
| MarkovRunInterval6d34 | `107a68075f164d2255d8214e98e6804ea80ce35f7db31b53e0288f01adf50437` | passed / passed |

Fourteen printed theorem dependency closures contain only `propext`,
`Quot.sound`, and, where used, `Classical.choice`. The source final-degree
identity uses only the first two. This confirms the recorded printed closures;
the manifest's per-module axiom lists are unions, not identical lists for every
theorem. No final source admission was found.

There are 23 recorded validation attempts: 14 successful checks and nine
rejected builds. Earlier errors are not accepted as proofs. The final interval
replay took 43.050023 seconds and ended at 2026-10-14 23:17:55.909490 UTC.
All successful validation records were present before the normal worker finish
at 23:18:25.817738 UTC; no late pending replay is being promoted to success.
Current validation records match the completed snapshot. The host reports
`completed`, return code zero, 1084.65 seconds, and mathematical resolution false.

The protected root source remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`;
the canonical goal-contract hash remains
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
There was no fresh whole-source rebuild or independent full-root completion
certificate. The report correctly leaves completion null.

## Finite experiments and remaining scope

The exact-integer scan records are evidence only; I inspected their saved data
and loop scope without recomputation:

- Source scan: 89,888,933 degree-interval coefficient inequalities, at cut
  counts at most five, over 534 input records representing 498 distinct source
  words/rationals. Recorded denominators range from 41 to 100, but enumeration
  stopped after about 140 seconds, so this is not exhaustive coverage of that
  denominator range. There are no recorded failures.
- Arbitrary-word scan: 536,015 **single-degree layer** inequalities over 274
  records representing 272 distinct words, lengths 3 through 120, at cut counts
  at most five. Unlike the source scan, it does not test all consecutive degree
  intervals. There are no recorded failures; the saved run is finite.
- Formula checks: repeated-B lengths 1 through 32, 5,984 layer identities,
  52,360 interval identities, and 1,612,688 coefficient identities. These are
  separate finite checks, not the justification for universal quantifiers.
- Saved complete-layer witnesses for sources 17/18 and 21/22 have positive LC
  gaps, contrasting with the inherited failures for selected or reweighted
  pairs of masks. The listed integer values are experimental; the new universal
  theorem proves the corresponding complete-layer inequality with width zero.

General mixed mechanical words, aggregation beyond the proved repeated-B
family, horizontal/vertical comparisons across cut counts, and the full pinned
Conjecture 6.3 remain unresolved. The finite observations do not discharge any
of these obligations.
