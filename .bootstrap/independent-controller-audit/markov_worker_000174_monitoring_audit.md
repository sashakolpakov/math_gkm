# Closed worker 000174 — independent monitoring audit

Request `831d426f49894488b2803a879f0bf56a`. Archive: `/Users/sasha/math_gkm/.control/markov/workers/000174/artifacts`; retained evidence: `evidence/markov-831d426f`. The controller records **completed, return code 0, structured report delivered**, elapsed **1597.433841228485 seconds**. Mathematical resolution remains false. This audit does not change an earlier worker's outcome or observation window.

The material establishes new universal auxiliary results: the previously conditional positive boundary formula is now proved; every correction polynomial in the guarded numerator-three band has nonnegative coefficients and exact interval support; the boundary correction sequence is log-concave; and an augmented residual has a nonnegative factorization and exact support. **It does not establish a new unconditional universal raw-source log-concavity region.** The augmented residual's log-concavity remains a premise of its source transport. The original root remains open, with the inherited exact reduction `Conjecture63 ↔ ThreeBeyondThirdM964 ∧ OtherFourM9E2`.

Eleven final mathematical modules contain 67 theorems and twelve definitions. All eleven have matching retained successful compiler snapshots and source/object associations, one successful joint replay, and 67 permitted explicit theorem axiom prints. This is a static audit of those saved checks over inherited compiled imports. It is not a new execution, a fresh whole-source build, or a repair of old replay backlogs.

## Scope and receipt watch

The auditor read closed174 archive material first, then only explicitly named inherited/current counterparts and audit files. No project program, Lean/compiler, checker, replay, experiment, generator, CAS, finalizer or mathematical computation was executed or imported. No coefficients, binomials, signs, gaps, products, roots or certificate values were recomputed. Audit-owned scripts only hash, parse, compare literal records and count finite index domains. No research source, machinery or goal was changed; no proposer was contacted or helped. Active175 and later work was not read. Writes are confined to `/private/tmp/math_gkm_godel_20261013`.

The receipt-only watch made eight reads, seven absent and the final present at **04:26:37.526396 UTC**. Consecutive reads were at least sixty seconds apart. Each of seven requested waits was 59,000 milliseconds; the returned elapsed durations slightly exceed 59 seconds and remain below sixty. The exact receipt is 19,325 bytes, SHA256 **`cd8f0b1bdd5390230c189e1f69b52476e367b6c9158f1399641c79d951cf46cb`**. The watch is embedded in the source-hash support and seal. No174 mathematical source was read before the final receipt.

The eleven final mathematical files and their proof bodies were read. Five current experiment scripts were read statically, and explicit archived160 `MarkovPositiveRowsMDAB`/`MarkovDiagonalRowsMDAB` were read to verify the inherited finite-prefix and diagonal-operator interfaces. Older named sources, scripts and external library pairs were compared by identity. One diagnostic accidentally displayed the keys of the archived 21,142-entry initial map; the output was truncated. That operation read historical metadata names, not active/current source contents or a new broad current-tree enumeration. No completeness claim is made for that display.

## Exact mathematical correspondence

For the two actual numerator-three source families, write `r = false` for denominator `N = 3q+2` and `r = true` for `N = 3q+1`. Set `a = 1` in the false family and `a = 2` in the true family; the other positive weight is `3-a`. This auxiliary weight is not the source denominator. The correction band uses

`j = q+k+1`, `d = N-2j-1`, and `P(d,k,r) = Q(d+2k+a,r,k)`.

The new actual-source attachments require **`q ≥ 2` and the literal guard `2j+1 ≤ N`**. Under that guard, `d` is the intended nonnegative exponent and `q = d+2k+a`. Natural subtraction is not interpreted as a signed expression outside the guard. Actual-path classification still ranges over every numerator-three path with `q ≥ 1`; it does not remove `q ≥ 2` from these new band attachments. The auxiliary case `d=k=0, r=false` has `q=1` and is therefore outside the new actual-source bridge. The negative-exponent region is also outside it.

The inherited row identity remains

`rawRow(threePoly(q,r),j) = lowerRow(N,j) + X² (X+1)^d Q(q,r,k)`.

All source coefficients are the original integral raw coefficients. There is no factorial/binomial normalization or discarded zero sequence. Source statements retain all natural column indices. Casts to real polynomial coefficient sequences are exact and are used only for the existing CrossLC/Pascal interfaces.

### Closed Fibonacci coefficients and shape

`MarkovFibCoeffM831` proves a finite binomial-product coefficient identity for every natural `n,j,m`, including out-of-support indices. The statement retains **literal natural subtraction `n-j-1`** inside the binomial argument. It cannot be silently rewritten as an integer algebraic difference without the requisite inequality. The proof uses finite Vandermonde/choose splitting; the `m>j` case is handled by degree and binomial zero tails, not an extrapolation of an in-range formula.

`MarkovFibShapeM831` proves coefficient nonnegativity and positivity exactly for `m≤j`. Adjacent log-concavity follows from the two binomial sequences; exact support, including negative-index zeros in `CoeffSeq`, gives CrossLC. These are auxiliary Fibonacci-factor results. They do not independently prove a raw source row log-concave.

### Positive boundary formula, shifts and full-band support

The explicit boundary coefficient is

`2 choose(2m+2,m+1) [a choose(k+m+3,2m+3) + (3-a) choose(k+m+2,2m+3)]`.

`MarkovBoundaryPositiveM831` establishes its nonnegativity, its zero tail for `m>k`, and a cleared equivalence with the earlier boundary formula. The factor `2m+3` used for clearing is nonzero/positive. The full final assembly in `MarkovBandSumM831` proves both the new positive formula and the old `BandBoundaryFormulaM139` proposition for **all** natural `k,m` and both residues. The initial module's conditional implication is not the final status of the assembly. Conversely, this new proof does not rewrite worker173's historical status, where that formula was still an unproved premise.

The shift domain is widened: the Fibonacci shift needs `n≥j+1`, and the Q shift needs `q≥k+1`. The inherited generic diagonal operator, instantiated with the exact shifts and signed recurrence, proves

`P(d,k+2)-2P(d,k+1)+P(d,k) = 4 G(d+2k+a+2,k+2)`.

This is an exact polynomial identity, not a finite interpolation. The forcing coefficients are nonnegative; the initial constant polynomial and initial difference are nonnegative. Induction proves every coefficient of `P(d,k,r)` nonnegative and monotone in `k`. The inherited boundary-to-band reduction, now with its boundary premise discharged, also supplies the other monotonicity statement. Strict positivity through degree `k`, together with the old tail theorem, gives exact support `0..k` and no internal holes. The new Q positivity statements use the band guard; the auxiliary theorem need not assume `q≥2`, while its actual-source use does.

The positive representation is formally a **finite polynomial double-prefix identity**:

`P(d,k,r) = 4 [a doublePrefix(diagonalFib(d),k+1) + (3-a) doublePrefix(diagonalFib(d),k)]`.

The inherited `doublePrefix` weights are integer differences inside a finite sum. Two-step induction checks the initial polynomials and the exact diagonal second difference. At `d=0`, the closed Fibonacci coefficient and inherited weighted-choose identity evaluate the prefixes, with the required index inequality supplied. The documentation expands this into a single positive coefficient sum. That expanded display is an elementary prose expansion/finite experiment formula; there is no separate named Lean theorem for that exact display in the new modules. No exploratory lambda-series or Jacobi identification is credited as a formal bridge.

### Boundary log-concavity, full-band conditional shape

`MarkovBoundaryLCM831` proves adjacent log-concavity of every boundary coefficient sequence, for all natural starts. Exact rational ratio identities and positive denominators handle the supported range. The normalized scalar inequality uses `k=m+t+2` with nonnegative rational `m,t` and ordinary `ring_nf; positivity`. Outside the range, the zero endpoint gives the required inequality directly. The accepted proof does not use the generated 30-term candidate lists as unchecked certificates.

`MarkovBandCrossM831` establishes nonnegativity and interval support for the integer-index coefficient sequence of every `P(d,k,r)`, and an equivalence between CrossLC and all natural adjacent inequalities. **For general `d`, those adjacent inequalities are still unproved.** At `d=0`, the new adjacent theorem discharges them, so boundary CrossLC and its nonnegative-binomial smoothing consequences are unconditional. The full raw source is a lower row plus the correction. Boundary correction CrossLC alone does not prove that sum log-concave.

### Actual-source comparisons and remaining budget conditions

`source_band_above_lowerM831` proves every guarded actual source coefficient is at least its lower-row comparison. The path-level version first classifies every actual numerator-three path, then retains the `q≥2` and band hypotheses in its conclusion.

`source_band_lc_budgetM831` removes the older explicit nonnegativity hypothesis on Q. It still requires **`s≤j`, `c≥0`, every coefficient budget `Q_(m+1)≤c choose(j,m)`, and the exact scalar robustness margin**. The resulting raw triple is `(s+3,j),(s+4,j),(s+5,j)`. The two `let` expressions defining B and U in the margin were retained in the statement audit; they are not parser-dropped hypotheses. No new universal budget or margin assertion is proved.

On the boundary, the exact source correction is `boundaryBinomial(k,i-2,r)` **only if `2≤i`**, and zero otherwise. This guard is essential: natural subtraction at `i=0,1` must not alias the constant coefficient. The boundary source identity also keeps `q=2k+a≥2`, so the false `k=0` case is not newly attached to an actual source.

### Augmented residual and its conditional transfer

`MarkovBandResidualM831` defines `R(q,k,r)=Q(q,r,k)+X rowH(N,j)`. It proves the exact factorization

`bandRow(q,k,r) = X² (X+1)^d R(q,k,r)`.

Under the band guard, R is nonnegative, strictly positive through index `q+k+2=j+1`, and zero above that degree. The shifted lower factor supplies the positive interior, while Q supplies the constant term. The tail identity itself is auxiliary and stronger in its range; this does not remove guards from actual-source identities. The formal source coefficient formula holds for all natural columns with `q≥2` and the band guard.

The generic polynomial transport assumes **CrossLC of R** and transfers it through `(X+1)^d` and the `X²` shift. The actual source theorem additionally uses the source guards and proves all natural raw horizontal starts, including leading zeros and zero tails, **conditional on that CrossLC premise**. Nonnegativity, exact degree and interval support are proved; CrossLC of this augmented residual is not. There is no hidden general sign theorem, and there is no new vertical or diagonal theorem.

### Auxiliary obstruction and unchanged root

`MarkovBandObstructionM831` formally proves `P(0,2,false)=72+96X+40X²`, strictly positive evaluation at every real argument, and a positive coefficient adjacent gap. This is an obstruction to a proposed real-rootedness route for the auxiliary factor. It is not a raw source counterexample, not a negative log-concavity gap, and not a root refutation. Documentation relates its parameters to the existing source band; the module does not add a new actual-path/raw-triple witness theorem.

The retained exact root remains `Conjecture63 ↔ ThreeBeyondThirdM964 ∧ OtherFourM9E2`, both predicates unproved. The inherited unconditional numerator-three horizontal result is **all natural starts and zeros with `3j≤N+9`**. Worker174 does not enlarge that universal raw region. The numerator-three residual retains horizontal rows `q<j`, excluding `j=5,q+1,q+2,q+3`; vertical obligations outside the union of `((i=3 or 4) and j+1≤q)` and `(5≤i≤8 and j+2≤q)`; and diagonal obligations outside `3≤i≤6, j+2≤q`, with literal diagonal indices `(i,j+2),(i+1,j+1),(i+2,j)`. `OtherFourM9E2` retains the numerator-at-least-four source obligations. All three original polygon memberships, endpoints and natural zeros remain. The fully proved numerator-two three-direction milestone remains historical152.

## Retained validation and unsuccessful versions

| Mathematical module | Theorems | Definitions |
| --- | ---: | ---: |
| FibCoeff | 2 | 0 |
| FibShape | 6 | 1 |
| BoundaryPositive | 5 | 2 |
| BandShift | 5 | 0 |
| BandPositive | 11 | 0 |
| BandSum | 10 | 1 |
| BoundaryLC | 7 | 5 |
| BandSource | 5 | 0 |
| BandCross | 7 | 1 |
| BandObstruction | 3 | 0 |
| BandResidual | 6 | 2 |

Every name has prefix `Markov` and suffix `M831` in the saved inventory. There are **26 build receipts: twelve successes (eleven mathematical modules plus Audit), fourteen return-code-1 rejections, and no compiler timeout**. Every selected module has one successful final-source version. There is no extra compile-only selected candidate, no unbuilt current mathematical module, and no superseded successful source. Failed snapshots and diagnostics remain evidence of rejected versions only.

All fourteen rejected snapshots retain the same declaration names and import lists. Thirteen normalized theorem-header comparisons agree; BandCross repairs punctuation spacing, with identical literal strings after removing whitespace. The body repairs are explicitly retained in the method/validation supports. No general semantic equivalence claim is made from whitespace comparison, and no unsuccessful body receives final proof credit.

The preparation script initially lists ten modules; a later retained event appends BandResidual, yielding the final eleven. This is one final validation stage, not an earlier successful ten-module stage. One joint replay binds all final source hashes and **79 explicit declarations (67 theorems plus twelve definitions)**. One Audit binds exactly 67 print requests, raw compiler print rows and axiom JSON declarations. Sixty-six closures use `propext`, `Classical.choice`, `Quot.sound`; `boundary_binomial_tailM831` uses only `propext`, `Quot.sound`. Definitions are replayed but are not extra theorem-closure prints.

Replay receipt: `replay-1792210973832355000.json`. Audit compiler receipt: `build-1792210973835987000.json`; axiom record: `axioms-1792210983290374000.json`. The isolated checker SHA256 is **`e569fe2194ef2900bd249a7947321d713c070c0a60182343bad74cccb9af6d0a`**. Checker and validate/Audit wrappers are exact worker173 request/suffix retags; the finalizer additionally changes the initial filename to `input-hashes.json`. The setup changes materially and is treated separately below.

The checker constructs an inherited environment excluding selected modules, rejects every collected matching name already present there, rejects unsafe/partial matching declarations, and performs ordinary declaration replay. Its guarded-name count agrees with all 79 explicit current declarations. The redundant suffix disjunction does not change that condition. Its ordinary replay body matches the retained worker110 implementation after removing the later guard. Differently named generated/private constants and optional binary parts retain the method's documented limits. A success line is not an enumeration/authentication of every private/server part. Axiom printing is also not imported-body replay.

Compiler snapshots, final source hashes and later object associations agree. No same-module overlap or source-mtime race was observed, and dependencies have earlier successful matching builds. Nevertheless, a snapshot before invoking a live filename is not an atomic record of the compiler's actual byte read, and object hashes are sampled by finalization rather than independently digested by each compiler receipt. These unchanged evidentiary limits remain explicit.

## Inherited imports and unrecovered backlogs

The selected replay base has **2,688 inherited source/object pairs**, comprising the 2,675 sealed173 base plus thirteen accepted M139 modules. The source closure has 2,699 local nodes, or 2,700 including Audit. Nine explicit inherited imports plus implicit Init give ten direct imports. The endpoint inherited counts are 2,543 for four endpoints, 2,545 for five, and 2,688 for BandSource/BandResidual. The separate pair map binds expected identities to prior evidence/controller-before records rather than inventing expectations from current bytes.

All eleven endpoints inherit **all 212 unreplayed worker121 modules, including the 195 subset, plus the separate nineteen historically accepted modules**. The 195 are not additional to the 212. Nothing in the current eleven-module replay recovers that backlog. WindowLC/Abel remain inherited compiled bodies with their original limited retained checker/print evidence: two explicit historical prints each, not newly authenticated stronger helper prints. No fresh whole-source rebuild or transitive replay is claimed.

Worker166 contributes CorrectionFactor but not its seven compiled/printed unreplayed prefixes; those remain outside and unrecovered. Worker156's timeout remains separate from worker157's twelve-module/44-closure recovery. Failed or unbuilt KernelLimit160, Column0/161, PairCleared163, older164 candidates and the combined168 boundary attempt keep their historical status. Corrected145 Scalar remains the inherited version. The successful MF25 replacement does not retroactively validate the older M81F candidate. The old212 and WindowLC limits apply even where the current source theorem is universal.

The source-hash support additionally pins **491 named older mathematical sources (336 imported and 155 outside the current graph), 181 historically pending/other sources, two operational source records, 63 older scripts and sixteen external source/object pairs**. These named external pairs are not an exhaustive fresh Mathlib/Lean rebuild. Thirteen M139 modules enter the current import graph; the older BandBudgetObstruction, BandQuadratic and BandSourceWitness remain preserved comparisons outside it.

## Changed inventory, finalizer and preservation scope

Setup now records `input-hashes.json` by recursively selecting suffixes `.lean`, `.py`, `.md`, `.json`, `.toml` from research, evidence and MathGKM, excluding the current evidence directory. It has **21,142 entries: 7,118 research, 14,004 evidence, twenty MathGKM**. There is no request-basename exclusion, and both its own setup source and first checkpoint are included and checked. No owned-input exemption is applied. The actual map has no `.toml` entry despite the accepted suffix. Objects, caches and `.g/.sing/.txt` files are excluded by that filter.

Unlike the predecessor setup, this map does not append top-level mission/toolchain/lake files, contracts/ or docs/. Protected root/canonical/raw-contract bindings and inherited observations are separately retained and compared; this is not a whole-tree preservation assertion. The setup computes six binding flags and predecessor mismatches but no longer asserts their success before proceeding. Actual flags are all true and mismatches empty. The finalizer independently enforces predecessor hashes. Its old comment saying setup excluded the owned request prefix is stale; the actual exemption set is empty.

The finalizer includes any research file containing the tag/suffix **or absent from the initial map**. In combination with the new suffix filter, this pulls historical bytecode and other script extensions into the current manifest. Accordingly:

| Inventory | Count | Meaning |
| --- | ---: | --- |
| Controller/archive paths | 113 | Closed worker changed-file archive |
| Final manifest entries | 334 | Expanded finalizer selection, not all newly produced |
| Common manifest/archive paths | 111 | Indexed archived artifacts |
| Archive-only paths | 2 | `manifest.json`, `last-verification.json` |
| Manifest-only paths | 223 | Separate retention required |
| Exact-request current scope initially observed | 114 | Archive113 plus one opaque cache |

The 223 manifest-only paths comprise **212 `.pyc`, nine `.g`, one `.sing`, one `.txt`**, totaling **2,036,289 bytes**. Exactly **222 match already sealed173 hashes**. Eleven older noncache paths also match controller-before174; 211 older caches were omitted from that controller map, so omission is not a mismatch. The remaining exact-request path is `research/__pycache__/validate_831d426f.cpython-314.pyc`, **5,808 bytes**, SHA256 **`d4a78e5f734bcacc64fc028f542ce64f2b1a47a0b6473ce471ccbb6d6675a569`**. The 222 historical files are not described as newly created or late174 work.

All 223 exact files have been copied, without interpretation or execution, into the separate temporary `markov_worker_000174_manifest_only_bundle/` preserving their relative paths. Bytes, mode, uid, gid and mtime match the observed originals. The companion bundle metadata is `markov_worker_000174_manifest_only_bundle.json`, SHA256 **`5f35f59e27e9c3d5e8355ab4aa6b28c48dea79f68725f5a12d40f9c4c2102b9e`**; the companion observation is `markov_worker_000174_manifest_only_observation.json`, SHA256 **`d9f2ffd75f29c7b11d24c58064c6f854e8815e147fe7754d648a1dc5d1eefcce`**. Copy window: **04:29:50.640469–04:29:50.683317 UTC**. Later discovery/copy is not later creation; no producing-process, source-version or successor attribution is made. Caches are not disassembled or reconstructed. Archive/index/history remain unchanged, with no validation upgrade.

The two successful finalizers (events253–254 and267–268) report the same validation hash, eleven modules, 67 closures and fourteen rejected builds. The manifest count increases from332 to334 after the interruption-reconciliation record, operational prose edit and validation document. The two new paths explain the count increase; the first full manifest/last-verification bytes are not separately retained. Their earlier hashes/counts remain event evidence. There is no invented earlier full manifest or script snapshot.

The finalizer's generic predicates require successful matching-source compiler evidence, successful replay source coverage and permitted current-source theorem-name subset prints; they do not by themselves require singleton compiler maps, one joint replay, checker-hash equality, success-marker stdout or exact print-name equality. Those stronger associations are independently checked for the actual saved records. Comment-stripping forbidden-token checks are lexical, not a complete Lean parser. Version return code is recorded rather than asserted and is actually zero. There is no future-write lock.

Immediate predecessor173 remains completed with its 142 manifest identities preserved. The separate interruption record revisits171 and agrees with original171/retained172 raw-event evidence: 280 events, final four events, 127 artifact entries and raw event SHA. **Worker171 stays `missing_or_malformed_report / return1 / nullreport`**, not timeout or completed. Successful earlier mathematical finalization is distinct from successful report delivery. No research side effects were rerun to reconcile it.

## Finite evidence — domains only independently counted

| Saved exploration | Independently counted index domain | Qualification |
| --- | --- | --- |
| Actual source scan | 46 families;388 rows;39,809 coefficient positions;39,033 raw starts;21,524 polygon triples;2,541 factor-adjacent positions | q2..20 plus24,32,50,73; both residues and permitted k. Saved17,509 zeros/no failures are not recomputed. |
| Positive coefficient comparison | 3,271 positions if the old Q list has length k+1 | Code uses `zip` without a length assertion; value-dependent list length not recomputed. Formal support theorem is separate evidence. |
| Boundary formula/equivalence | 122 rows;3,782 positions each | k0..60, both residues, m0..k. Saved values/signs not recalculated. |
| Exploratory convolution | 442 rows | Both residues,d0..12,k0..16; lambda series truncated at16, seven prefixes retained. No formal generating-function bridge inferred. |
| Ratio candidate | Two lists of30 terms | Syntax/length comparison only; accepted Lean proof uses ordinary normalization, not unchecked literal lists. |
| Rational Sturm diagnostic | 160 cases | k1..16,d0/1/2/5/20,both residues. Saved126 nonreal classifications/zero repeated entries counted as records only. |
| Augmented residual scan | 2,214 auxiliary rows;175,275 adjacent positions | d0..24 plus50,100;k0..40;both residues. One q1 row is outside actual q≥2 bridge. |

The augmented scan additionally covers 42,120 Q-adjacent and173,061 H-adjacent index positions. Its **46,494 negative mixed-term records** and first five displayed examples are saved numerical evidence, not independently recomputed signs. Empty augmented/Q/H failure arrays are capped-first-ten failure collectors; no universal theorem follows from their emptiness. A mixed sufficient term can fail while the full residual or raw source remains log-concave. No source/root refutation is inferred.

Full saved results and output projections are bound in the finite/validation supports. Current script hashes plus event commands/results are not atomic attestations of Python bytes at execution. The scripts were never imported: source/boundary-positive have main guards, while the ratio/roots/augmented scripts execute at top level if run. Historical script dependencies are pinned without invocation. Saved source-consultation metadata was read as a worker record only; no independent literature search or novelty claim was made.

## Timing and report binding

Controller start: **03:59:52.211517 UTC**; nominal deadline: **04:29:52.211517**. Host finish: **04:26:29.645357**, about **202.566159725 seconds before deadline**. Stored elapsed1597.433841228485 differs from the saved timestamp subtraction1597.4338402748108 by about0.954 microseconds. Those float fields are preserved as recorded, not asserted to be exactly equal.

The last selected mathematical build ends at estimated04:22:45.109542. Joint replay runs **04:22:53.832355–04:23:04.147367**; Audit compilation runs **04:22:53.835987–04:23:03.286121**. These estimated intervals come from receipt filename epochs plus elapsed fields. Audit and replay overlap; the later axiom JSON filename is not the Audit compiler start.

Original validation, manifest and last-verification mtimes are04:25:25.656162,04:25:28.659913 and04:25:28.669444. Event-log mtime04:25:57.782788, activity-content timestamp04:25:58.388966 and final.json mtime04:25:58.659196 all precede host finish and deadline. Report event269 agrees with final.json and the receipt; turn.completed270 follows. There are270 events,128 started items,92 command starts,520,288 event bytes and empty stderr. Archive-copy mtimes are separate metadata, not execution times. No explanation is inferred for the remaining interval between report delivery and host finish.

## Audit records and final observation

Seven supports accompany this main: mathematical source hashes, source structure, finite domains, validation note/evidence and replay-method note/evidence. The inherited pair map, audit-owned static helper and seal helper are separately bound. The 223 manifest-only copies plus their two companion files are mandatory supplements. **Expected preservation is237 files including the integrity seal: twelve core records and225 supplements.** The seal gives every exact path/hash; preservation must not omit bytecode through ordinary repository exclusions.

Audit-helper refinements remain separate from research: the first own parser stopped before outputs on a term proof; the second stopped before outputs when a historical `.g` path was absent from the new suffix-filtered input map. The final parser retains the full statement-level `let q` and budget B/U hypotheses, and the historical nonselected script is bound through sealed173 plus the current manifest. An initial text-substitution typo in the audit helper was corrected before execution. Reviewer helper stops and corrected schema predicates are retained in their evidence. None changes project sources or runs a proof.

## Final audit observation

Project reads are closed. The method reviewer checked **401 named inputs unchanged from 04:40:01.451485 to 04:40:01.516013 UTC**; its absence observation at 04:40:01.516020 is explicitly not applicable, with no paths. The validation reviewer checked **24,730 named inputs unchanged from 04:40:25.861946 to 04:40:50.574945 UTC**. Its final exact174 inventory/supplement observation is **04:40:50.601120 UTC**: archive 113, current 114, manifest 334, union 336; the same sole exact-request cache; no missing-current, extra-archive or missing-archive entries; all **446** source/copy byte-and-metadata comparisons pass. No new mathematical object-absence check applies.

The reviewers agree on **77 shared fields, all 2,688 inherited pairs and 384 shared input hashes**, without mismatch. Their temporary audit input pins number 248 for validation and 246 for method, including the supplementary copies. The final sealer only rechecks these temporary files; it does not extend either project observation window.

The final validation note is 20,625 bytes, SHA256 `bd4255058c84f12ad6f94601b4065c95247e7a71abf374ffa6c4eeac66f29c83`; its evidence is 18,327,036 bytes, SHA256 `9e6b73b88da4ae57cdd439c7a5e6c898bd0b95b23d0e6e65b73550c216faa14b`. The final method note is 23,152 bytes, SHA256 `e88c9f3200966f7efacb8e59bbe6c5515f4c925a5dc9ce24cef84b52e14a606b`; its evidence is 18,232,182 bytes, SHA256 `028bebd50790a378d7a1aa073c507bfd7d3414de2eb0f09edbabe8d6900594b9`. The 2,484,988-byte pair map SHA256 is `a67979b277ae59e29e121f2be51308b632238dc9ac54b056a4aa1026e5f89376`. All other final support and helper hashes are bound in the integrity record.

Both reviewers' final audit-files-only concurrence is required before the integrity file is written. No missing research validation is performed, no full conjecture completion is claimed, and no historical failed or partial status is upgraded. The 237-file preservation set includes the 223 exact supplemental files and both companion manifests; its exact paths are enumerated in the seal.
