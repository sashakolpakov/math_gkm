# Independent monitoring audit: worker 000095

Request `96dea62b6a264d13939c64cc19dbe945`. Read-only mathematical and retained-evidence review on 2026-10-15. No project source, proof, experiment, validation command, replay or finalizer was changed or executed. No proposer was contacted or advised, and no active successor was inspected. Independent computations were limited to parsing, hashing, declaration counts and finite input/index-domain counts. This is not a new publication-wide source-correspondence or historical-novelty audit.

**Mathematical result:** the actual raw fourth lower diagonal now satisfies the adjacent-triple inequality at offsets `k=1,2,3,4` for every source run `n≥4` and every actual predecessor of denominator `c≥5`, with **no restriction to small predecessor numerators**. The exact coefficient bridge, all four numerator cases and the boundary `n=4,k=4` are discharged in the source proof. This extends the known contiguous prefix, but does not prove the whole fourth diagonal or the conjecture. The new exact residual remains unproved. Separate replay records also recover worker 94's eighteen previously unreplayed algebra modules; their historical timeout records are not rewritten.

## Actual source, indices and zeros

For `rest : List Bool` and `n : Nat`, put

```
path = replicate n true ++ false :: rest,
c = (frame rest).mid.b,   r = (frame rest).mid.a,
a = (frame path).mid.a,   b = (frame path).mid.b,
P = (frame path).mid.p.
```

Inherited exact source identities give `a=nc+r`, `b=(n+1)c+r=a+c`; the actual predecessor has `1≤r<c`. The theorem `source_fourth_onsetM96` assumes exactly

```
c≥5,   n≥4,   i,k : Nat,   1≤k≤4,
i+(n+k)+2=a+4,
```

and concludes

```
coeff P i (n+k+2) * coeff P (i+2) (n+k)
  ≤ coeff P (i+1) (n+k+1)^2.
```

Thus, with `j=n+k`, the ordered adjacent coefficients are at

```
((i+2,j), (i+1,j+1), (i,j+2)),
```

all of total degree `a+4`. The starting coordinate pair is not `(i,j)`. The four covered starting second indices are `n+1,…,n+4`. This is the raw integer coefficient of the protected bivariate numerator at the omitted third variable equal to one, without factorial or position-dependent weights.

There is no polygon, positive-support, nonzero-coefficient, numerical-certification, auxiliary-gap or coefficient-formula premise in the source theorem. Natural zero coefficients are retained, and the raw theorem implies every corresponding polygon-guarded case. Actual-path invariants discharge the numerator bounds. There is no finite upper bound on `n`, `r`, `c`, source denominator or predecessor path. The theorem does not include `n<4` or `c<5`.

## Exact coefficient and inequality assembly

The imported `source_fourth_early_shapeM042` identifies `7560` times the actual coefficient at second index `n+t` with

```
earlyBlockValueM042(n,c,r,t)
  = fourthShapeK0B(c,nc+r,n+t)
    +315*convSevenK0B(shiftPolyCC(C n,C c,C r,X),t).
```

Its hypotheses are the exact slice equation, `c≥5`, `5≤n+t` and `t<n+3`. The new six `onset_value1M96` through `onset_value6M96` evaluate this expression exactly for `t=1,…,6`, for arbitrary integer parameters. Their proofs use the truncated-convolution identity, exact natural binomial evaluation, unfolding and `ring`; they do not extrapolate the falling-factorial formula whose separate offset premise is `t≥5`.

For the raw triple the source proof invokes that bridge at `t=k,k+1,k+2`. All three constraints follow from `n≥4` and `1≤k≤4`, including the last boundary `n=4,k=4,t=6<7=n+3`. The same positive integer `7560` multiplies all three coefficients. Rewriting the three identities into the certified gap and cancelling its positive square changes neither the coefficient weights nor the zero cases.

Each of the four auxiliary inequalities `onset_lc1M96` through `onset_lc4M96` holds for integer parameters `n≥4,c≥5,1≤r<c`. The parameter cases are exhaustive:

| Numerator case | Nonnegative chart parameters |
| --- | --- |
| `r≥4` | `N=n−4`, `R=r−4`, `C=c−r−1`; hence `n=N+4,r=R+4,c=R+C+5` |
| `r=3,2,1` | `N=n−4`, `C=c−5`; the unused argument `R` is set to zero |

The twelve fixed-numerator certificates use exact expanded polynomial identities and nonnegative coefficients. The four general-numerator certificates assemble exact expansions of the six values into powers of `C` and `R`; all nine `C`-coefficients of each gap are included. The scalar identities and nonnegativity statements have no experimental premise. The final `onset_early_lcM96` exhausts the four natural values of `k` and translates the six exact value identities. The raw adapter then supplies the actual source parameters.

The reported 261 names are an all-helper theorem count, not 261 source regions: 180 scalar-gap nonnegativity statements, 36 column-gap statements, 12 fixed-numerator gaps, four general-numerator gaps, six value identities, six expansions, six column expansions, five combined auxiliary inequalities, one raw onset theorem, one prefix theorem, one residual equivalence, and three polygon-arithmetic statements. The 60 accepted mathematical modules contain 344 definitions; `OnsetDefs` and `OnsetParts` are definition-only modules. No separate mathematical finding is inferred from those inventory counts.

## Prefix and exact residual

`source_fourth_prefixM96` assumes `c≥5,n≥4`, the same raw slice equation `i+j+2=a+4`, and

```
j≤n+4  or  (r≤3 and j≤2n).
```

It proves the same raw adjacent-triple inequality. Its proof uses the already established initial range `j<n`, the first-shift case `j=n`, the new offsets `1,…,4`, and worker 94's longer block `5≤j−n≤n` only when `r≤3`. This is a contiguous prefix; it is not a proof of later indices. At `n=4`, `n+4=2n`, so no gap is introduced by the empty longer block.

`InitialFourthRegionOnsetM96` records an actual run decomposition, `c≥5`, the slice equation and exactly four branches:

```
j<n;
j=n with n≥4;
j=n+k with r≤3 and 5≤k≤n;
j=n+k with n≥4 and 1≤k≤4.
```

The initial branch retains its earlier arbitrary-`n` scope; the residual is therefore not merely a reformulation of the prefix theorem's blanket `n≥4` premise. The small-numerator restriction remains on the inherited longer block and is absent from the new onset branch.

`root_iff_coreOnsetM96` starts from the existing exact `root_iff_coreN6604`. Its horizontal and vertical clauses remain unchanged. The diagonal clause preserves all three original polygon guards, `i+j+8≤a+b−1`, `a+4≤i+j+2`, `a+2≤b`, and `a+5≤i+j+2 ∨ 4b<5a`, adding only the negation of that exact removed region. The reverse implication fills the four removed branches with the corresponding proved source inequalities. Endpoint clauses are inherited through the exact equivalence; no root or index boundary is weakened. The residual itself is still an obligation, not a proved statement.

## Polygon arithmetic has a separate scope

For natural `a,c,d,i,j`, `lower_slice_polygon_iffM96` proves

```
i+j=a+d,   d+1≤a+c
  ⇒ (InPolygon a (a+c) i j ↔ c*j≤d*(a+c)).
```

The assumption on `d` supplies the upper-degree polygon bound. The one-way bound uses polygon membership directly and needs no such extra assumption. Neither statement claims coefficient support, positivity, saturation or log-concavity.

`source_fourth_polygon_boundM96` applies to every actual run `n` and predecessor, without `n≥4` or `c≥5`. It assumes the raw triple's slice equation and only the polygon guard at its top point `(i,j+2)`, and proves `j≤4n+5`. Any fully polygon-valid triple satisfies this premise. The result is a necessary index bound depending on the run length; it is not a coefficient inequality or a finite test resolving all source paths.

## Finite evidence, independently counted but not rerun

The saved experiment has **816** inputs, exactly all coprime `1≤r<c`, `5≤c≤21`, at `n=4,5,6,8,12,20`, plus `n=51,102,211` for `(c,r)=(5,1),(5,4),(7,3),(13,8)`. Independent enumeration of those input and index domains matches the retained list and reported counts:

- **4,896** exact comparisons of the six onset polynomials with `7560` times the low-cut recurrence coefficient at offsets one through six.
- **3,264** polygon-valid adjacent triples, four per input, at offsets one through four.
- **8,251** literal bivariate source-recurrence coefficient comparisons across the complete fourth slice for the **150** inputs with final denominator `b≤80`, including zeros.

These are overlapping checks; no research recurrence or polynomial evaluation was rerun by this audit. The saved failures list is empty. The finite checks do not replace the universal Lean statements or enlarge their parameter scope.

The second-shift probe compares six **saved candidate numerator polynomials**, divided by slope boundaries `0,1/4,1/3,1/2,2/3,3/4,1`. It records agreement of the `Z`-degree-zero and degree-one parts; degree two first changes between the chambers adjacent to `r/c=1/2`, at `X`-degree three. There are nine nonzero adjacent-chamber differences across `Z` degrees two through four. This is a retained symbolic comparison, not a newly proved source coefficient identity, a source counterexample, or a proof of later-shift log-concavity.

## Retained validation and recovery

The independent retained-evidence audit finds all **456 controller/current/archive bindings** and all **455 entries of the single artifact-index file map** matching. The map omits only itself. Every final selected source matches its successful build receipt, captured source snapshot, indexed final object and individual replay receipt. No current extra, unarchived, late or pending artifact was found. All **490 preservation** and **481 initial reconciliation** comparisons match; these overlapping sets are not distinct-file totals.

There are **145 actual attempt receipts**: 67 builds and 78 successful individual replays. The builds comprise **62 successes, one failed earlier Polygon source and four excluded timeouts**. The 62 successes are the final 60 mathematical modules, Audit, and excluded alternate `MarkovOnsetLChecked4M96`. Of the eight excluded alternates/drafts, that one has a successful build/object but no replay; four have timeout records, and three were never invoked. Exclusion is therefore not synonymous with compilation failure. The revised final Polygon source has its own matching successful build and replay.

All 145 attempts have completed command events with matching records. Of these, 136 are child records embedded in batch output; the independent audit compared each child status and receipt rather than relying on a batch wrapper's return code. Successful output is abbreviated to lengths in those events, with full output preserved in hash-bound receipts. The final Audit's 25,296-character output prints exactly all **261** new theorem closures, each using only a subset of `propext`, `Classical.choice`, and `Quot.sound`. Audit itself compiled, has no mathematical declaration, and is not a replay target.

The **78 distinct successful direct targets** comprise all **60 new mathematical modules (261 theorems, 344 definitions)** and exactly the **18 old A/B/D modules (39 theorems, 72 definitions)** previously left unreplayed by worker 94. There are no union receipts or failed replay records. Every new matching build precedes its corresponding replay. Prefix, Polygon and Residual are explicit replay targets, as are the two new definition-only modules. The 39 recovered theorem closures retain their unchanged worker-94 axiom audit; the new Audit does not claim to print all 300 old-plus-new names.

The recovery invocations are recorded in worker-95 evidence, with start-plus-duration estimates spanning **14:54:25.803793–14:58:12.464725 UTC** on 2026-10-15. All **328 worker-94 artifacts** match their original controller, archive, worker-95 before snapshot and current bytes. Its timeout outcome, four union timeouts, nine successful selected modules and `kernel_replay_complete: false` are unchanged. Worker 95 supplies later successful selected-module checks for the eighteen dependencies; it does not backdate them or transform the worker-94 finalization into a complete historical replay.

All checks use unchanged `ReplayKnown6d2c` (SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`). The retained unused batch driver also remains unchanged (`502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`). The request-specific validator matches its predecessor after request-name substitution. Static import/name checks find no selected module or explicit declaration imported into its own checking base, no selected-name collision and no source cycle. Every new module imported by another new check also has its own successful direct check. Excluded duplicate SplitAG helpers occur in none of these inspected closures.

These are **alternate per-module kernel replays relative to retained compiled imports**, not official CLI validation or a fresh simultaneous rebuild of the entire environment. The direct receipts capture source bytes before invocation but omit invocation-specific driver and loaded-object digests; before/current source and final object equality do not prove precise loaded bytes/times. Binary import tables and generated/private declaration inventories were not reconstructed. The method's ordinary imported-declaration, axiom, unsafe/partial and already-imported-theorem behavior remains qualified; no explicit-source shortcut is found in these targets. Missing checks were not completed by this audit.

Two finalizer invocations succeeded: the first indexed 454 files, the second 455 after contract-binding metadata and documentation updates. Event 173 independently rechecked all 455 hashes and asserted replay completeness while leaving root completion null. The final index mtime is **15:15:35.509322 UTC**, **310.943717718 seconds before** the **15:20:46.453040** deadline. The controller finished **15:16:26.623697**, elapsed **1540.170656681 seconds**, with outcome **completed**. Final agent JSON, controller `final.json` and the controller report agree; a turn-completion event is retained. No pending, extra or late effect was found. These timestamps establish the recorded completion boundary, not separately logged exact kernel-return times.

The root and contract remain pinned, with mathematical resolution false and completion null. Successful finalization and all selected replays do not prove the residual or constitute full publication correspondence.

Supporting reports read for this audit are [the validation audit](markov_worker_000095_validation_audit.md), SHA-256 `b824c460a9f3db7ba4070cd413a075182db97eb1c43b831bc974a8b91e19c5f9`, and [the replay-method audit](markov_worker_000095_replay_method.md), SHA-256 `c9e987b8d796952d333c86c365293f87aeb981f5f36a375aac296586784f46ae`. Their companion evidence hashes are respectively `e3ceb1d7d3d13de990635784157c789a3560c0ae78869bfbc5e111213306e0e2` and `e1417c3f73157857529d42b8af550d15adb4e2f2e4ccc2560655dbc366a0a602`. All **2273** combined supporting inputs were stable at **2026-10-15 15:29:15.350328 UTC**.

Selected independently read source hashes:

| Source | SHA-256 |
| --- | --- |
| `MarkovOnsetSourceM96.lean` | `cf79a1781947264b166d3ab1497b97e030b814755dea2eab82fbe4698e136784` |
| `MarkovOnsetM96.lean` | `4579adeac18c3a5fa69496bbc64bb08792a4feab59ab36a746c77f0b8eafb6cf` |
| `MarkovPrefixM96.lean` | `9958dd8706f1274909d96091ae90d8ba30d8b9e990c38db53e0f16334ede9980` |
| `MarkovResidualOnsetM96.lean` | `f900cf24d37e236c0be0b3d150c44c4142d1a022d2cd2cca1623d7795ec9e70c` |
| `MarkovFourthPolygonM96.lean` | `c8daf9cb8836dea0f2f2d3225e49dd2fb7dbe7ba32b4fd169834a00077a756b5` |
| `MarkovOnsetLFinal1M96.lean` | `a086554c0f258dd6157e1e1715cc0d1219add9ce4b639f5185c0770dab6657b1` |
| `MarkovOnsetLFinal4M96.lean` | `8ea497c4bb7c4c149c2d220fdc433d7066ee3b1d9e48e716410fd71de457e92d` |
| `MarkovOnsetValue1M96.lean` | `f04eb424adbc7ee12e3722179d8f91b35f2ee309f7f0c2f9e86631dad6c6d9e8` |
| `MarkovOnsetValue6M96.lean` | `1f4e212af631023e8cdca806797f3dacd91a8eb68ff5b008d2217f359cc92c43` |

The meaningful new content is an unbounded actual-source onset theorem and its exact prefix/residual integration. The general-numerator longer block, later shifts and the full residual/conjecture remain unresolved.
