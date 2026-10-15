# Independent monitoring audit: worker 000096

Request `8067e0c51ab944db8a1a44fb7403351d`. Read-only mathematical and retained-evidence audit on 2026-10-15. No project sources, proofs, research programs, builds, replays or finalizers were changed or executed. No proposer was contacted or advised, and no active successor was inspected. Independent computations were restricted to parsing, hashing, declaration counts and finite input/index-domain counts. This is not a fresh publication-wide correspondence or historical-novelty audit.

**Mathematical result:** the actual raw fourth lower diagonal now satisfies the adjacent-triple inequality throughout the first shifted block `5≤k≤n`, for every actual predecessor with denominator `c≥5`, **without the earlier restriction `r≤3`**. The exact coefficient identities and all chart inequalities are discharged in the source theorem. Combined with prior results, this proves the raw prefix through starting index `j=2n` for `n≥4,c≥5`. Its root/residual equivalence is exact, but the residual remains unproved. Later-block, transition, small-run and tail certificates are retained experiments without formal source bridges; they are not additional proved raw regions.

## Actual source, raw indices and endpoints

For natural `n` and `rest : List Bool`, write

```
path = replicate n true ++ false :: rest,
c = (frame rest).mid.b,   r = (frame rest).mid.a,
a = (frame path).mid.a,   b = (frame path).mid.b,
P = (frame path).mid.p.
```

The actual source identities give `a=nc+r`, `b=(n+1)c+r=a+c`, and the actual reduced predecessor satisfies `1≤r<c`. The final `source_fourth_blockM806` assumes exactly

```
c≥5,   i,k : Nat,   5≤k≤n,
i+(n+k)+2=a+4,
```

and concludes

```
coeff P i (n+k+2) * coeff P (i+2) (n+k)
  ≤ coeff P (i+1) (n+k+1)^2.
```

For `j=n+k`, the ordered triple lies at `((i+2,j),(i+1,j+1),(i,j+2))`, all of total degree `a+4`. The starting coordinate pair is not `(i,j)`. The starting second indices are `n+5,…,2n`, including `2n`. For `n<5`, this block is empty; no additional lower bound on `n` is hidden. The unrestricted predecessor numerator refers to `r`, not the final numerator `a`.

There is no finite bound on run length, predecessor denominator, numerator or path. The theorem has no polygon, positive-support, nonzero-coefficient, fitted-parameter, source-formula or auxiliary-gap hypothesis. It keeps natural zero coefficients and implies its original polygon-guarded instances. The only coefficient scaling used internally is the same positive constant at all three positions; the conclusion uses unweighted integer coefficients.

## Complete parameter and source assembly

The auxiliary `blockValue_logConcaveM806` holds for integer `n,c,r,k` under `c≥5`, `1≤r<c` and `5≤k≤n`, with

```
blockValue(n,c,r,k)
 = fourthShapeK0B(c,nc+r,n+k)+shiftShapeCC(n,c,r,k).
```

For `r≥4`, the proof substitutes

```
C=c−r−1,  R=r−4,  J=k−5,  E=n−k,
```

all nonnegative. Thus `c=R+C+5`, `r=R+4`, `n=J+E+5`, and the three offsets are `J+5,J+6,J+7`. The remaining positive integer cases `r=3,2,1` use the inherited fixed-numerator charts at `C=c−5` and dummy `R=0`. These are exhaustive cases; no conjectured inequality remains as a formal premise.

The new general chart is constructed from exact identities, rather than an assumed source expansion. `block_stageM806` first expands the value under `c=R+C+5,r=R+4`, leaving the integer run and offset free. Fifteen scalar coefficient polynomials are then identified, at all three offsets, by **45** exact substitution identities. The three full value identities and their three column rearrangements are recombined by ordinary algebra. Each of the nine coefficients in powers of `C` in the gap is proved nonnegative through its scalar coefficients in `R`. All nine are included in `blockLChartM806`; no lower-degree group or sign premise is missing.

The relevant low-`R` scalar gaps are thirty unchanged source files inherited from worker 94 and compiled/replayed in this invocation. The higher-degree scalar gaps and fixed-numerator charts are inherited established results. Their source names, roles and validation scope are distinguished from newly authored declarations below. The identities use ordinary `ring`, and nonnegativity follows by ordinary order reasoning from explicit coefficients; generated expressions and numerical scans are not axioms.

The raw adapter invokes `source_fourth_block_shape_extendedCC` at offsets `k,k+1,k+2`, obtaining the actual three coefficients scaled by **7560**. Its `5≤offset<n+3` requirements follow from `5≤k≤n`. At `k=n`, the last offset is `n+2<n+3`, so the end case is retained. The slice equations for `(i+2),(i+1),i` follow from the one stated equation. `frame_reduced rest` supplies `1≤r<c`. Rewriting the three identities into the auxiliary inequality and cancelling the common positive square yields the raw conclusion without an index-dependent weight or discarded zero.

## Prefix and exact residual

`source_fourth_prefixM806` assumes `c≥5,n≥4`, natural `i,j`, `j≤2n`, and `i+j+2=a+4`. It proves the same raw adjacent-triple inequality. If `j≤n+4`, it uses worker 95's established prefix; otherwise `k=j−n` satisfies the new block conditions. There is no longer an `r≤3` restriction on this prefix. At `n=4`, `2n=n+4`, and the old onset theorem supplies the whole claimed prefix.

`InitialFourthRegionM806` records an actual run decomposition, `c≥5`, the same slice equation, and exactly these alternatives:

```
j<n;
j=n with n≥4;
j=n+k with 5≤k≤n;
j=n+k with n≥4 and 1≤k≤4.
```

The third branch removes the old small-numerator restriction using the newly proved source theorem. The earlier initial branch still permits arbitrary `n`; the residual does not silently impose the prefix theorem's `n≥4` hypothesis on that older coverage.

`root_iff_coreM806` starts from the unchanged `root_iff_coreN6604`. Horizontal and vertical clauses are unchanged. The remaining diagonal clause preserves the three original polygon guards, `i+j+8≤a+b−1`, `a+4≤i+j+2`, `a+2≤b`, and `a+5≤i+j+2 ∨ 4b<5a`, and adds only the negation of `InitialFourthRegionM806`. The reverse implication fills each removed branch with its exact proved source theorem; the forward implication restricts the old conclusion. The original endpoint requirements remain inherited through that equivalence. No root, polygon or slice boundary is weakened. **`InteriorCore63M806` is not proved.**

## Experimental statements are not additional source theorems

The later computations use the six saved worker-89 normalized numerator candidates. This invocation does not prove their full chamber-dependent identification with the actual fourth-slice numerator. A nonnegative candidate gap, even one recorded symbolically, therefore does not give a new universal source inequality here.

The saved experiments distinguish the following domains:

| Record | Candidate scope |
| --- | --- |
| Second block | `j=2n+k`, `6≤k≤n`; two shapes separated by `2r<c` versus `2r>c`, four nonnegative-parameter charts |
| Third block | `j=3n+k`, `7≤k≤n`; six Farey chambers, with candidate values recorded independent of `J=k−7` after substitution |
| Tail | `j=4n+k`, values `k=0,…,7`, adjacent gaps starting `k=0,…,5`, under stated `n≥7`; candidates recorded independent of `n` |
| Transition onsets | Six chambers each for second-block offsets `1,…,5` and third-block offsets `1,…,6`, with `n=N+7` |
| Fixed small runs | Six chambers at each `n=4,5,6`, starts `2n+1,…,4n+5` |

The second-block records have four gaps with no recorded negative terms. The third-block records have six. The remaining probe has twelve onset-chart records and eighteen fixed-run records. Tail records retain all six gap positions, including identically zero polynomials; no support-based filtering is used. These descriptions report saved symbolic data and code scope, not independently rerun polynomial identities or accepted Lean theorems.

The Farey boundaries are `0,1/4,1/3,1/2,2/3,3/4,1`. The prose explicitly treats arithmetic chamber coverage as separate from the missing source identities and gap formalization. It does not claim that the mere absence of a reduced denominator-`≥5` boundary case completes those bridges. The inherited polygon bound `j≤4n+5` is a positional bound, not proof of every remaining coefficient inequality.

## Finite evidence: domains independently counted, values not rerun

Independent enumeration of the code's input/index domains matches every retained input list and count below. No coefficient recurrence, candidate polynomial evaluation or log-concavity test was rerun by this audit.

| Record | Inputs | Coefficient comparisons | Polygon-valid triples | Literal comparisons | Inputs with literal comparison |
| --- | ---: | ---: | ---: | ---: | ---: |
| First block | 462 | 5,122 | 4,198 | 5,214 | 91 |
| Second-block candidate | 240 | 2,516 | 2,036 | 2,978 | 50 |
| Third-block candidate | 240 | 2,334 | 1,854 | 2,639 | 43 |
| Full-fourth candidate | 768 | 40,320 | 37,632 | 9,611 | 173 |

For the full-fourth check, inputs are exactly all coprime `1≤r<c`, `5≤c≤18`, at `n=4,5,6,7,8,11,17,31`. The coefficient loop is `0≤j≤4n+7`; it compares the convolution of the selected saved normalized numerator with **24** times the low-cut source coefficient. This candidate normalization differs by the documented constant factor from the formal first-block shape's scale **7560**; neither changes raw coefficient weights. The triple loop is `0≤j≤4n+5`, with all three exact polygon guards. Literal bivariate source comparisons cover all fourth-slice positions for final `b≤80`. The retained record reports **1,152 zero coefficient values**; this is an experimental value count, not independently reevaluated in the domain-only audit.

The first-block inputs have `5≤c≤17`, runs `5,6,8,12,20`, plus selected large runs `51,102,211`. Second/third-block inputs have `5≤c≤14`, runs `6,8,12,20` or `7,8,12,20`, plus selected runs `41,101`. These code-specific finite lists do not introduce any upper bound into the proved theorem or prove the unformalized candidate bridges.

The tail additionally has **270** retained inputs with `5≤c≤17`, runs `7,12,31`, and eight positions each, matching **2,160** saved comparisons. All retained finite failure lists are empty. These overlapping checks are not counts of independent theorems, and their success does not extend formal coverage past the prefix.

## Retained proof and artifact validation

The independent retained-evidence audit finds all **405 controller/current/archive bindings** and all **404 entries of the artifact-index file map** matching. The map omits only itself. Every final inventoried source matches its successful build receipt, captured source snapshot, indexed object and successful individual replay receipt. No current extra, unarchived or late artifact was found. All **456 worker-95 artifacts** remain unchanged against their old controller, archive and before-worker-96 snapshot. All **470 preservation** and **461 reconciliation** comparisons match, with overlap between those sets.

There are exactly **131 successful actual receipts**: 65 mathematical-module builds, one Audit build and 65 individual mathematical-module replays. There are no failed builds, timeouts, skipped attempts, unsuccessful replays, union receipts, superseded successful source versions or excluded M806 draft modules. This exclusion count does not classify every old draft or experimental candidate in the project. Every attempt has a matching completed command event; batch child statuses were checked individually rather than inferred from an outer batch exit. Full output is retained in hash-bound receipts even when events show output lengths.

All **96** final named theorem closures match the source inventory, Audit requests, printed names and validation axiom map. They use only subsets of `propext`, `Classical.choice`, and `Quot.sound`. Audit's build retains 8,366 stdout characters, imports all 65 mathematical modules and declares no mathematical constant. It is compiled only; its imports are not counted as replay targets. Every mathematical target has its own matching successful direct replay, including StageDefs, Source, Prefix and Residual; the corresponding successful build precedes each replay.

The direct procedure remains `ReplayKnown6d2c`, SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The retained batch driver is also unchanged, `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; it was not used to produce union evidence here. The request-specific validator matches worker 95's after request-name substitution. Static source graphs exclude each selected target and its explicit declarations from that target's imported base, with no selected-name collision or source cycle. Every new source imported by another new check also has its own successful replay. The inherited split-source names introduce no collision in the inspected bases.

These are **alternate per-module kernel replays relative to retained compiled imports**, not official CLI checking or a fresh simultaneous whole-source reconstruction. The wrappers capture source before invocation but do not freeze or record the exact loaded object bytes or an invocation-specific driver digest. Final object hashes establish retained equality. Before/current driver agreement and static source graphs do not independently establish binary import tables or private/generated names. Ordinary imported-declaration, axiom, unsafe/partial and already-imported-theorem behavior remains qualified; no explicit-source selected-target shortcut was found. No missing check was executed by this audit.

One finalizer invocation succeeded at events 223–224. Event 226 displays the recorded counts and status; it is not a separate artifact rehash. The independent audit supplies the comparison of all 404 indexed files against live, archived and controller bytes. The final index mtime is **15:43:46.940979 UTC**, **170.901255131 seconds before** the **15:46:37.842234** deadline. The controller completed at **15:44:55.576796**, elapsed **1697.734561682 seconds**, with **102.265438318 seconds** remaining. Final agent JSON, controller `final.json` and controller report agree; the turn-completion event is retained. There is no pending invocation or late effect. These recorded intervals are not separate exact kernel-return timestamps.

The root remains pinned, with completion null and mathematical resolution false. Full local replay and successful reporting do not prove the residual or complete publication correspondence.

Supporting reports read for this audit are [the validation audit](markov_worker_000096_validation_audit.md), SHA-256 `bb018ac7aba1ab9bc41f4498cea24946e00041d100d3cc083b86481a39367514`, and [the replay-method audit](markov_worker_000096_replay_method.md), SHA-256 `6a7d8eec4cde00dfd0e99db1a5d05b44628eaeaaf9297c3c146040bbcb3ad6f2`. Their companion evidence hashes are respectively `3f82e5c3c0534a53b916f542294f364e7912978367c4861cccf16308d08a917d` and `48734f3d459834d099e96e3e8e5829719914d857affb92e158c2e2d8ea04ee6b`. All **2380** combined supporting inputs were stable at **2026-10-15 15:59:29.026920 UTC**.

The inventory count has a scope distinction: **65 mathematical targets** means **35 new M806 modules (66 theorem declarations, 42 definitions)** plus **30 unchanged inherited SplitLG source modules (30 declarations, 30 definitions)**. The thirty inherited checks are a subset of 65, not thirty additional new targets. Their sources also match worker-94 archived bytes; their successful worker-96 builds/replays do not rewrite their earlier exclusion. The total 96 declarations include 45 scalar substitution identities and 30 scalar gap lemmas, not 96 distinct actual-source regions. `MarkovBlockStageDefsM806` contains definitions only.

Selected independently read source hashes:

| Source | SHA-256 |
| --- | --- |
| `MarkovBlockSourceM806.lean` | `f699dab56a38f674540ce1dc9158d7fa5aa5d18e7d88d11b5466d7b053e50974` |
| `MarkovBlockLCM806.lean` | `82ae161cf15719eb14bf20e53a1804f7a83c878dfaaa0eedc97c571b9f3564d4` |
| `MarkovPrefixM806.lean` | `ccefb1a4c2e7767692274612a79c771d49280d390dcfcefcea895e09c4c27e63` |
| `MarkovResidualM806.lean` | `616cc3cbbd9f95df838766da2c7df6c65ee26bbd8c956d1690b05e39d7a3f607` |
| `MarkovBlockChartM806.lean` | `437e2c72c30f8eb35c8037b0d625cb8f36ab271fab81d74c81f83e4d5784d6c8` |
| `MarkovBlockStageM806.lean` | `5f608c5bfb67c7ec5a36cdae7d719b81410037e43c9ba666b8d944659aaf728f` |
| `MarkovBlockValue0M806.lean` | `f29db9f0a011ed447d5cba82a7665992d68ad1a7a612638ebc08956be6e2a851` |
| `MarkovBlockValue2M806.lean` | `47448b6933943243c92775de14c2f518d62a39a2594830bb675d97cb3d3a4184` |

The new verified mathematical scope is the unrestricted-numerator first shifted block and its exact prefix/residual integration. No full fourth-diagonal theorem, whole conjecture proof or refutation is supplied by the additional candidate experiments.
