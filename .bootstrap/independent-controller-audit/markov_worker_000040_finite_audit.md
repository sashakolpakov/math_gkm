# Worker 000040 finite-experiment observational audit

Request: `a3c53fa7bcea4aaf80795a13558baa99`. Scope: CHECK only. No repository files were written, no Lean command was run, and no worker/proposer was contacted. The two current Python scripts were copied unchanged to `worker40_finite_reproduction/` under this report directory and executed there with bytecode writes disabled. Their relative evidence paths therefore resolved only inside that temporary directory. `type_refinement_a3c5.py` imports only `core, poly` from `aggregate_a3c5.py`; the latter imports only standard-library modules and has a guarded main entry point.

## Reproduction

Both programs exited successfully. Both regenerated JSON objects exactly match the recorded objects after removing only `seconds`. Original script/evidence SHA-256 values were unchanged before versus after execution. The evidence hashes agree with `evidence/markov-a3c53fa7/artifact-hashes.json`:

- `type-refinement.json`: `6fabbcb413ed230396b8320bad608e082e7fa6ed89fc45f7a10b9862ae2bfe3d`
- `arbitrary-words.json`: `c899a75b0b540573d53fea826d097d652f64a597a295e19c5c40581ee6239ebb`

Current script hashes (not listed in the worker artifact manifest):

- `research/type_refinement_a3c5.py`: `f275be93795693ec70da324403fae1747ecfa3e3c4a3e42080a3ead4aabd6e2f`
- `research/aggregate_a3c5.py`: `70b2c33ce22544dc357a5fb34d2abf17a91bf560b44b25e23933d25646d07815`

## What 377,267 means

Lines 24–41 scan all **307** reduced pairs `1 <= a < b <= 31`, in increasing denominator then numerator order. Endpoint sources 0/1 and 1/1 are absent. The potential early stop requires failures in all three directions; it did not trigger.

For each mechanical core word, the code groups `(u exponent, v exponent, t exponent)` coefficients into polynomials `R_(i,j)(t)`. Line 29 checks their specialization at `t=1` against the imported positive recurrence `poly(w)`. This is not a direct comparison with the protected Lean source recurrence; that correspondence depends on the inherited bridges.

A counted triple is a spatial triple `(i,j), (i,j)+d, (i,j)+2d` with both endpoint row-polynomials nonempty. It contributes one count, regardless of its number of t-coefficients. The tested gap is `R_mid(t)^2 - R_low(t) R_high(t)`, using exact Python integers and convolution. A failure means at least one negative t-coefficient.

| Direction | Spatial triples | Failing triples |
|---|---:|---:|
| (1,0), horizontal | 123,589 | 0 |
| (0,1), vertical | 123,589 | 92 |
| (1,-1), diagonal | 130,089 | 16 |
| Total | 377,267 | 108 |

The failure counts are counts of triples, not counts of negative coefficients or failing sources. No unbounded conclusion follows from the zero horizontal count.

## Zeros, polygon, and bounds

The original script has no polygon predicate. It iterates nonzero low rows and skips missing high rows (lines 30–33), so zero-endpoint triples are not part of 377,267. Missing middle rows are retained as the zero polynomial; missing t-coefficients are treated as zero by convolution/default dictionaries. It does not discard an internal zero before testing. Terms absent from both convolutions are zero and immaterial.

A separate coverage tally over exactly the same 307 sampled polynomials found that each support equals the lattice points satisfying the pinned predicate `a*b <= b*i+a*j` and `i+j <= a+b-1`, with natural indices (`MathGKM/Markov.lean:40`). Thus all 377,267 tested triples lie inside that polygon, and their direction counts equal the counts of all polygon-guarded triples in this finite sample. There were no missing middles among tested triples. Counts of nonzero-low/missing-high candidates skipped were 19,253 horizontal, 19,253 vertical, and 12,753 diagonal. Zero-low cases are never enumerated. These are finite observations, not a new universal support or polygon theorem. Negative-y diagonal endpoints are absent and skipped; counted diagonal triples correspond to the root indexing `(i,j+2),(i+1,j+1),(i+2,j)`.

## Recorded type failures

The first vertical failure is source 10/11, positions `(10,0),(10,1),(10,2)`, with rows `1`, `20+9t`, `270+288t+84t^2`. The gap is `130+72t-3t^2`. At the actual weight t=1, the raw triple is `[1,29,642]` and the gap is **199**.

The first diagonal failure is source 11/21, positions `(0,21),(1,20),(2,19)`. Its gap is `-3t^16+72t^17+229t^18+220t^19+66t^20`. At t=1 the raw triple is `[1,40,1016]` and the gap is **584**. Both witnesses are inside their source polygons. Their negative type coefficients do not refute the raw source inequality.

## Arbitrary-word file

`aggregate_a3c5.py:29–35` exhausts every Boolean word of lengths 0 through 12: **8,191 words**. Its early stop likewise did not trigger. Counts are numbers of words with at least one raw directional failure, not counts of failing triples: zero through length 5; then `4, 4, 16, 30, 42, 94, 186` for lengths 6 through 12 (376 failing words total).

The first vertical witness is `[false,false,false,false,true,false]` at `(1,3)` in direction `(0,1)`. The first horizontal witness is `[true,false,true,true,true,true]` at `(3,1)` in direction `(1,0)`. Both have the raw triple `[4,6,10]`, gap `36-40=-4`. No diagonal failure occurs within this finite scan. Arbitrary words are not restricted to canonical reduced source words; these observations are not source counterexamples. The file has no polygon check.

Reproduction outputs, input hashes, and the finite coverage tally are in `worker40_finite_reproduction/`. No mathematical strategies or proof suggestions were supplied.
