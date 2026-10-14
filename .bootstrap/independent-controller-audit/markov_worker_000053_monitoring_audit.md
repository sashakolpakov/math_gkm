# Independent monitoring audit: worker 000053

Worker request: `446bbcdc58554542b733c6d1dac376bf`.
Audit date: 2026-10-14. Read-only examination of archived completed-worker
artifacts under `/Users/sasha/math_gkm/.control/markov/workers/000053/artifacts`,
with current final files and the host receipt used for hash comparisons.
No project edits, model contact, mathematical suggestions, experiment reruns,
fresh builds, or completion of pending verification work were performed.

## Finding

The machine closed the source-adjacency and count-compression gaps identified
in worker 52. It also proved an unconditional raw log-concavity result on the
second lower diagonal for the infinite subfamily `2a≤b`, with the original
polygon guards retained. The exact residual/root equivalence integrates that
result without asserting the residual proposition itself.

The two further polynomial inequalities are checked abstract algebraic
theorems; their higher-run raw-coefficient identifications remain unproved.
No material English–Lean mismatch was found in this distinction.

**All nine final modules have successful matching compilation and separate
kernel-replay records.** The last bounded replay completed successfully;
it is not pending or a timeout. Full Conjecture63 remains unresolved.

## Universal adjacency count

`bbCount446` counts consecutive true/true pairs in a finite Boolean word,
with a false initial predecessor. `source_bb_count446` proves for every
finite source path

`bbCount446 (sourceWord28 path) = 2a−b`,

where the subtraction is **natural subtraction**, hence `max(2a−b,0)`.
There is no denominator cutoff or unproved count hypothesis.

The proof handles all-true Pell paths explicitly and otherwise uses the
proved source substitution at the first false branch. The source word starts
with A and ends with B, so its closing cyclic edge contributes zero. Thus
the linear scan gives the cyclic long-long statistic needed later when
applied to the shorter actual source word.

The generic `cyclicEnergy446` helper is defined through a scan with A boundary
conditions. It is not silently identified with the usual cyclic adjacency
functional of an arbitrary word starting with B. The transport to actual
source words explicitly uses their initial A and exact central-word
description; the claimed source cyclic interpretation is justified.

## Count compression and literal source coefficients

For `path=true^n ++ false::rest`, let `c` and `r` be respectively the
denominator and numerator of the middle label of `rest`. Then `c≥2` and
`0<r<c`. The previous exact recursive source formula is preserved.

`source_second_compressed446` proves

`2·secondSliceBF(sourceRunsBF n rest) = secondCompressed446 n c r`.

The polynomial definition is exactly the doubled formula in the English
report, using `q=max(2r−c,0)`. Its components are justified by:

- the actual source adjacency theorem;
- the generic sum-of-values and pair-product identities for a binary word;
- the proved run-score recurrence, including the cyclic closing term;
- the inherited exact trace-to-source-slice subtraction.

The count-only description is valid here because it retains the exact
source-specific adjacency statistic. It does not contradict worker 52's
ordering-dependence identity for unrestricted cyclic run lists.

The two-run correction is `2y^(2n+3)` when `c=2`. In this actual source case,
the shorter central word is empty, the shorter source word is `AB`, and the
two run lengths are `[n,n+1]`. The proof handles that branch explicitly.
When the central word is nonempty, it proves `c≠2` and uses the at-least-three
run formula. No actual source with a one-run shorter word is admitted to the
compression theorem.

`source_second_raw_compressed446` identifies each coefficient with

`2·A(i,j) = [y^j]secondCompressed446(n,c,r)`

for all natural `i,j` satisfying `i+j=a+2` on the actual path. There is no
polygon or positivity premise in this identity, so zeros are retained. The
factor two multiplies the whole polynomial uniformly; it is not factorial,
binomial, or index-dependent normalization. Its use in log-concavity multiplies
both products by the same factor four, which is canceled in the final proof.

## New unconditional raw-source log-concavity

For `n=0`, `secondCompressed_zero446` identifies the complete doubled slice
with a polynomial whose coefficient sequence, extended by zero, is

```
[(c+r−1)(c+r−2),
 2(3r(c+r)−8r+2),
 9r²−5r+2,
 8 max(2r−c,0) + (if c=2 then 2 else 0)].
```

`cubicSeq_lc446` proves adjacent log-concavity of this sequence for every
natural `c,r` with `0<r<c` and every natural starting index. The first two
nontrivial gaps are checked by exact positive polynomial certificates. The
second gap separately handles `c=2`, forcing `r=1`, and the branch where
`2r−c=0`. Remaining indices use the explicitly zero-extended tail. This
proves the full stated cubic-sequence result, not just interior positive
coefficients or a bounded set of `c,r`.

`source_false_second_diagonal446` transports it to every source path of
the form `false::rest`. For natural anchor indices `i,j` with
`i+j+2=a+2`, it proves

`A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)^2`.

This theorem has no polygon premise. To avoid an indexing ambiguity, the
three actual coefficient positions all have **total degree `a+2`**;
the theorem's anchor indices satisfy `i+j=a`.

`source_second_lower_low446` states the same raw inequality for **every**
source path with `2a≤b`, the total-degree equality, and all three original
`InPolygon` guards. Its first-branch classification is proved: in a first-false
decomposition, the exact label formulas and `2a≤b` force `n=0`. In the
all-true case, those label inequalities force the initial `1/2` possibility,
whose asserted total degree `a+2` exceeds the polygon's top degree; the
polygon premise excludes that case. Thus the endpoint of the ratio range
is handled rigorously rather than dropped.

This is one diagonal slice of one direction on an infinite subfamily.
It does not prove every slice for `2a≤b`, any complete horizontal or vertical
direction, or the second slice for every ratio. Some instances overlap earlier
partial results; no claim of published novelty follows from this audit.

## Exact residual/root equivalence

`Interior63446` universally quantifies over all source paths. Its horizontal
and vertical clauses retain all three polygon guards and the previous cutoff
`i+j+3≤d`, with `d=a+b−1`.

Its diagonal clause retains all three polygon guards and requires

```
i+j+5≤d,
a+2≤i+j+2,
(a+3≤i+j+2 ∨ b<2a).
```

The first two restrictions are inherited from the already checked top-layer
and first-lower-diagonal reductions. The final disjunction removes exactly
the newly proved case `i+j+2=a+2` and `2a≤b`. In the reverse proof, failure
of that disjunction, combined with the preceding bound, yields precisely
the hypotheses of `source_second_lower_low446`.

`root_iff_interior446 : Conjecture63 ↔ Interior63446` is a genuine two-way
equivalence, composed with the inherited exact root equivalence. It neither
assumes nor proves `Interior63446`. The unchanged root endpoint clauses are
handled through that inherited equivalence. No direction, polygon guard,
unbounded source quantifier, or low-slope exception is silently discarded.
As before, this residual is exact for the stated removals, not a claim that
every retained instance is still individually unproved.

## Further algebraic results and missing source bridges

`upperShape_lc446` is an integer-polynomial inequality for all integers
`c,r,t` with `r≥1`, `c≥r+1`, and `t≥1`:

`U(c,r,t−1) U(c,r,t+1) ≤ U(c,r,t)^2`.

Its `U` definition matches the English expression and its checked positive
gap certificate. The proposed coefficient formula
`3·(2F2_j)=8U(c,r,2n+2−j)` is **not** a theorem in this module. No source
coefficient is mentioned in the algebraic theorem's conclusion.

`lowerShape_lc446` proves, for integers `n,c,r,j` satisfying
`r≥1`, `c≥r+1`, `j≥4`, and `j+1≤n`,

`L(n,c,r,j−1) L(n,c,r,j+1) ≤ L(n,c,r,j)^2`.

The definitions of `L`, its `K` component, and its `H3` component match the
English formulas. The substitutions `j=t+4`, `n=t+s+5`, `r=u+1`,
`c=u+v+2` are exactly justified by the theorem's inequalities. The formal
proof checks the polynomial identity and nonnegativity; the symbolic
generator's reported 225 monomials are not trusted as proof premises.

The proposed raw coefficient formula `6F2_j=L(n,c,r,j)` is unproved here.
Neither algebraic theorem discharges the coefficient transitions between
the indicated ranges or the remaining exceptional cases. Successful
compilation and replay do not turn these abstract theorems into additional
unconditional raw-source inequalities. The final report makes that
limitation explicit.

## Compilation, replay, and final artifact binding

All nine final source hashes agree among current files, archived files,
host `changes.after`, manifest, and the selected build/replay source
snapshots. All eighteen selected records are successful, bind the expected
source and hash, and contain the expected `lean`/`leanchecker` command and
module. Their JSON files match the host-bound archived and current versions.
Final object hashes match archived and current objects, manifest, and host
receipt. The fifteen printed axiom closures exactly match final successful
build output and use only subsets of `propext`, `Classical.choice`, and
`Quot.sound`.

| Module | Final source SHA-256 | Build suffix | Replay suffix |
|---|---|---|---|
| MarkovAdjacency446 | `c9b70d86dc6aef00271627e6d4514b0c339b5d09ff8ffcb6105f7168932a28d8` | `1792008238698388000` | `1792008279339865000` |
| MarkovBinaryEnergy446 | `c84be96cdd25189e8ddc5eac039d442f1687830f267bb9dbf5aa4bea1fd31e32` | `1792008279339861000` | `1792008356992067000` |
| MarkovCubicBounds446 | `78a04b266700337dbe12db7dbdea2c4c55cfd56aa9d357dda1d6aa524b0af411` | `1792008547382022000` | `1792008584552445000` |
| MarkovInterior446 | `aed0a08878e0af83cf03113c05fbb78993ec3a55b9e7f6448d74562145dc81ae` | `1792008856945381000` | `1792008889356265000` |
| MarkovLowerShape446 | `5a00356541dc7e543653a7c5df430ad2d5543e0ae48d52f5758d5a93ea95bcf0` | `1792008983025931000` | `1792009065584983000` |
| MarkovRunCompression446 | `571bb78dbf08d8512799b08af4a66eab84ba62248f5aa95cc2fa3000cfb777b2` | `1792008370890838000` | `1792008429092871000` |
| MarkovSecondCompressed446 | `d81fe15acfe7c10ceaed3724b8e9114ae3133dd5e4ed14111c882dfffefca282` | `1792008427930205000` | `1792008503117097000` |
| MarkovSecondLowSource446 | `1cb7ba3b5cad12227e478c13e60a224c1136101c0678a0f33d31632b95df7b93` | `1792008654479603000` | `1792008705229978000` |
| MarkovUpperShape446 | `e9ef575fe55a2594e409eb0c942c22fa6a5bceab36c4a4a22c37e3dc4be8eef7` | `1792008883129337000` | `1792008942456941000` |

Record paths are `evidence/markov-446bbcdc/run-<suffix>.json`.
Seven rejected elaborations are retained among the 26 attempt records;
their error-recovery declarations and any printed `sorryAx` are excluded.
An additional unselected successful record is not needed to establish the
eighteen selected final checks above.

In particular, `MarkovLowerShape446` compiled successfully in 70.465 seconds,
finishing at 20:17:33.491 UTC. Its separate final replay returned zero after
53.530 seconds, finishing at **20:18:39.115 UTC**. Thus earlier prose saying
that this bounded replay had just been launched describes an intermediate
state; the final receipt resolves it as successful. Nothing was completed
or retried by the independent reviewer.

The final manifest is timestamped 20:19:10.544 UTC; the host completed
normally at 20:19:23.016 UTC after 1088.017 seconds. Its final report has
`completion:null` and `mathematical_resolution:false`. Final report,
mathematics, correspondence, checkpoint, and manifest hashes match their
host-bound archived and current versions.

The independently recomputed protected root and canonical contract hashes
remain respectively
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe` and
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
Inherited compiled imports were reused. This is inspection of matching
recorded checks, not an independent fresh whole-source build or replay.

## Finite experiments

The Python scripts and saved outputs were read without rerunning them.

- The 62,491 upper-range checks evaluate the proposed coefficient formula
  for `n=2..24`, `c=3..21`, `0<r<c`, and `n+3≤j≤2n+2`, using
  `q=max(2r−c,0)`. They compare against the inherited Python compressed
  slice calculation. They are parameter evaluations, not 62,491 distinct
  source fractions, independent Laurent-recurrence computations, or a
  universal coefficient-identification proof.
- The 52,877 lower-range checks analogously use `n=3..24`, `c=3..21`,
  `0<r<c`, and `3≤j≤n`. Their proposed formula is checked finitely;
  the formal lower-shape inequality has the narrower centered-triple
  range `4≤j≤n−1`. No transition-position theorem is inferred.
- Fixed-run symbolic exploration covers `n=0..4`. It provides candidate
  nonnegative gap expansions after count substitutions. Only the `n=0`
  case is fully connected to actual source coefficients by the new
  unconditional source theorem. The finite and symbolic explorations do
  not establish all higher-run source cases.

The substantive verified advance is exact source count compression plus
raw second-lower-diagonal log-concavity on `2a≤b`, integrated into an exact
remaining-root equivalence. The complete conjecture and the higher-run
coefficient bridges remain open in these artifacts.
