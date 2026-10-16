# Worker 000125 independent monitoring audit

Request `ea4238fc86ab42dca04c21467d7fa66c`. Completed archive: `/Users/sasha/math_gkm/.control/markov/workers/000125/artifacts`. This audit reads completed saved material, exact named current counterparts and sealed predecessor evidence. It does not inspect active126 mathematics, contact or assist the proposer, edit either project, or execute Lean, proof/checker/replay, project code, experiments or finalizers. Auditor computations are static parsing, hashes and integer domain/index/polygon/word-prefix counts only. Audit files are written solely under `/private/tmp/math_gkm_godel_20261013`.

The retained evidence supports **universal interval-support, zero-slice, degree and leading-coefficient results for both actual coordinate residuals**, together with **conditional** adjacent-to-CrossLC and residual-to-raw LC adapters. All eight new mathematical modules,53 theorem closures and ten definitions have matching final compilation, selected-body replay and named axiom-print coverage. **No new unconditional raw LC region or new root equivalence is established.** The exact inherited reduction remains `Conjecture63 ↔ InteriorCore63MF8`; that residual and the full conjecture remain unproved.

The reported `1/7` witness is an obstruction to a pairwise inequality between two summands of a state update. It is not failure of the full update, a source residual, or a raw conjecture triple. The reported failures in an enlarged palindromic-core word family concern non-source horizontal residuals. Neither observation is a root refutation.

**Worker121's212 compiled-but-unreplayed modules remain unrecovered, but none is imported by this round's eight new targets.** The new support/endpoint dependency graph is smaller than the prior all-run raw-LC graph. Historical backlog status, the inherited root reduction's validation boundary and the imports used for these new theorems must be kept distinct.

## Pinned source, coordinate conventions and remaining root

The unchanged root source `MathGKM/Markov.lean` has SHA-256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Its coefficients are literal integers `coeff P i j=(P.coeff i).coeff j`. Write `a,b` for the actual `(frame path).mid` labels and `d=a+b−1`. Actual interior paths satisfy1≤a<b; endpoints0/1 and1/1 remain separate clauses of the root.

For horizontal statements, the raw slice is `((Bivariate.swap P).coeff j)` and its coefficient at i is `coeff P i j`. For vertical statements, the raw slice is `P.coeff i`, whose coefficient at j is `coeff P i j`. The new horizontal residual is `hresidualM511 X (sourceWord28 path) j`; the vertical residual is `vresidualM9E1 path i`. In the auxiliary bivariate state algebra, outer variable U is the row/order variable Y and inner V is the univariate coefficient variable x. These auxiliary matrix-state indices must not be read as unswapped raw P coordinates.

The unchanged polygon is `ab≤bi+aj ∧ i+j≤a+b−1`. The unchanged exact residual `InteriorCore63MF8` retains:

| Direction | Literal raw triple | Residual restrictions, in addition to all three original polygon guards |
|---|---|---|
| Horizontal | (i,j),(i+1,j),(i+2,j) | j≥5 and i+j+4≤d |
| Vertical | (i,j),(i,j+1),(i,j+2) | i≥4 and i+j+4≤d |
| Diagonal | (i,j+2),(i+1,j+1),(i+2,j) | i+j+8≤d, a+5≤i+j+2 and a+2≤b |

The diagonal total is i+j+2. All paths with a≥2, the inherited treatment of a=1, the endpoints, zeros and prior boundary reductions remain as before. Worker125 has no new residual definition or theorem reducing these remaining obligations. The new support theorems concern actual interior source paths, not an added assertion about endpoint labels with a=0. The global homogeneous/Laurent/source identification remains an inherited correspondence boundary; no fresh literature/source completion audit was conducted here.

## Positive horizontal state recurrence and support invariant

`hpairMEA423` associates to an actual integral horizontal matrix product M the pair

`F=M.a+M.c`, `H=M.b+M.d−M.a−M.c`.

`hpair_mulMEA423` proves by ring identities that **right multiplication**, or appending a Boolean letter, agrees with the displayed positive recurrence. With h=1+x and Y the row variable:

`A: F'=Y(hF+xH), H'=F+H`,

`B: F'=Y(h²F+x(x+2)H)+Y²(h³F+xh²H),`

`   H'=x(F+H)+Y(h²F+xhH)`.

The algebraic identity is quantified over an arbitrary matrix M; positivity is separately proved for the generated pairs starting from (F,H)=(1,0). It does not assert positivity for arbitrary signed matrices. No fitted coefficients or finite experiment enter this identity.

`HGoodMEA423 c p` consists of three explicit properties: all coefficients of p are nonnegative; any positive coefficient at position i in row r implies positivity at every k with i≤k≤r+c; and every coefficient with i>r+c is zero. The parameter c is an endpoint offset, not invariably the source numerator. The invariant allows an entire zero row and does not claim that the support begins at0 or provide an exact lower endpoint.

The seven basic support lemmas handle zero, one, addition at a common endpoint, multiplication by V, multiplication by U with the matching offset change, and multiplication by V+1 or V+2. `hgood_stepMEA423` combines them with the row shifts in the recurrence. `hpair_word_goodMEA423` quantifies over **every Boolean word**, using reverse-list induction for appending letters, and gives both states HGood with offset `w.count true`.

For an actual source word, the inherited `source_word_counts28` identifies this true-letter count with a. The H-state is exactly the inherited residual state through `hresidual_diffM511`. Consequently `horizontal_residual_goodMEA423`, `horizontal_residual_filledMEA423` and `horizontal_residual_boundMEA423` hold for every path and every natural row/order r, without numerator, denominator, word-length or moment-order bounds. A nonzero row has positive coefficients from any positive position up to r+a and zero coefficients above r+a. This proves interval support, not adjacent LC.

## Atomic expansion and vertical source correspondence

The atomic state operations use `M=hF+xH`:

`A(F,H)=(YM,F+H)`, `C(F,H)=(F+YhM,M)`.

`atomic_BMEA423` proves `C(A(z))=hstep(z,true)`. The C update contains the lower-endpoint term F, so a common-endpoint addition lemma alone would be insufficient. The new `hgood_lower_addMEA423` keeps an explicit extra top-positivity premise for this situation. That premise is discharged by the strengthened `PairGoodMEA423 n c` invariant:

- both states are HGood with offset c;
- F has outer-row bound n+1 and H has outer-row bound n;
- F's entire row0 is zero;
- F has a positive coefficient at r+c for1≤r≤n+1;
- H has a positive coefficient at r+c for0≤r≤n.

The checked initial pair is the state after A, `(U*(V+1),1)`, with parameters n=c=0. A preserves PairGood with n increased by1 and c unchanged; C increases both by1. In C's proof the row0 and outer-degree restrictions control the lower term, and the other summand supplies its missing upper endpoint. Thus the final actual-source theorem does not retain an unproved top-coefficient or shape assumption.

For the vertical matrices, `vpairMEA423` instead uses

`F=M.c+M.d`, `H=M.a+M.b−M.c−M.d`.

`vpair_mulMEA423` is a **left multiplication** identity: prepending original A applies atomic C, while prepending original B applies atomic A followed by C. `vpair_lastMEA423` supplies the checked last-letter B base. `vertical_pair_word_goodMEA423` proves PairGood for every word `w++[true]` by right-to-left construction, with parameters `n=w.length+w.count true+1` and `c=w.length+1`.

Actual source words end in true because `sourceWord_central28 path` gives `(false::central28 path)++[true]`. Their length is b by `source_word_counts28`. Instantiating the word theorem therefore supplies HGood offset b for the exact vertical residual state; no arbitrary-word/source identification is assumed. `vertical_residual_filledMEA423` and `vertical_residual_boundMEA423` cover every path and every natural order, with endpoint r+b. The stronger PairGood parameters and generic support hypotheses are fully discharged in this source bridge.

## Interval support, conditional LC, zero slices and leading coefficients

The natural interval lemmas state that a coefficient between two positive residual coefficients is positive. The proof bounds the right endpoint by r+a or r+b and applies filled support. Mapping integer coefficients to real coefficients and using the inherited zero extension gives `IntervalSupport774 (CoeffSeq ...)` on **all integer indices**, with negative indices zero. Empty support for a zero polynomial is allowed. Leading and internal zeros have not been deleted.

The inherited `zeroSeq_cross_iff725` requires both coefficient nonnegativity and interval support to equate CrossLC with the full collection of natural adjacent inequalities. Worker125 discharges those two support premises for each actual residual. The resulting `horizontal_residual_cross_iffMEA423` and `vertical_residual_cross_iffMEA423` are equivalences between two inequality predicates; they do not prove either predicate. In particular, adjacent LC is not silently promoted to CrossLC without the no-gap condition.

The new raw transfer theorems have the following explicit hypotheses:

| Theorem | Required range and unproved inequality premise | Conclusion |
|---|---|---|
| `horizontal_raw_of_residual_adjacentMEA423` | 2j+1≤b, and **every natural adjacent inequality** for horizontal residual row j | all-natural raw triples (i,j),(i+1,j),(i+2,j) |
| `vertical_raw_of_residual_adjacentMEA423` | 2i+1≤a, and **every natural adjacent inequality** for vertical residual column i | all-natural raw triples (i,j),(i,j+1),(i,j+2) |

The low-index factors used are the inherited integral identities

`raw_horizontal_j=(1+X)^(b−2j−1) R_horizontal_j`, when2j+1≤b,

`raw_vertical_i=(X+1)^(a−2i−1) R_vertical_i`, when2i+1≤a.

After the support-based CrossLC equivalence, the proof applies the valid forward Pascal/binomial smoothing theorem. Exponents are natural and their stated inequalities justify the subtractions. There is no coefficient-dependent normalization or removal of zero coefficients. Equality in either range gives exponent0 and the same polynomial. Outside those ranges the forward raw-transfer theorem does not apply.

The universal cleared relations remain

`(1+X)^(2j) raw_horizontal_j=(1+X)^(b−1) R_horizontal_j`,

`(X+1)^(2i) raw_vertical_i=(X+1)^(a−1) R_vertical_i`.

The new high-index theorems prove the opposite-direction polynomial identities:

`R_horizontal_j=(1+X)^(2j+1−b) raw_horizontal_j`, when b≤2j+1,

`R_vertical_i=(X+1)^(2i+1−a) raw_vertical_i`, when a≤2i+1.

They use cancellation of a nonzero **polynomial** factor in an equality. They do not cancel an LC inequality or infer raw LC from a smoothed residual. Both high-index identities include equality and all zero slices; they have no hidden restriction that the order be≤d.

The zero-slice results are exact for all natural indices:

`R_horizontal_j=0 ↔ d<j`, `R_vertical_i=0 ↔ d<i`.

For the nonzero direction, the cleared identity would force the raw slice to vanish, contradicting the inherited positive top-diagonal coefficient at `(d−j,j)` or `(i,d−i)`. For indices>d, all raw slice coefficients are outside the original polygon, and the nonzero binomial factor in the cleared relation forces the residual to vanish. This uses inherited support/top facts, not a numerical nonvanishing test.

For j≤d and i≤d, the new exact residual degrees are respectively **a+j** and **b+i**. The upper support bound and positive endpoint establish both inequalities for `natDegree`. These equalities are explicitly restricted to nonzero slices. The raw-degree lemmas give only the upper bounds `natDegree(raw_horizontal_j)≤d−j` and `natDegree(raw_vertical_i)≤d−i`, with natural subtraction even beyond d; they must not be confused with the residual degree equalities or ordinary degree of the zero polynomial.

The generic `cleared_leadingMEA423` extracts the highest common degree in a binomial-cleared polynomial equality, under explicit degree bounds and equality of total degrees. Binomial factors are monic, so the two endpoint coefficients agree. For actual source slices, the required bounds and degree balance are discharged using the new support bounds, actual a,b positivity and order≤d. The inherited `top_raw_coeff1998` then yields

`[X^(a+j)] R_horizontal_j = choose(d,d−j)` for j≤d,

`[X^(b+i)] R_vertical_i = choose(d,i)` for i≤d.

The horizontal value equals choose(d,j) by the usual binomial symmetry, while the Lean statement is literally choose(d,d−j). These are exact leading coefficients of the integral residuals, not normalized raw coefficients or an interpolated formula. No new residual LC inequality follows merely from interval support and these endpoints.

## Finite domains and obstruction scope

No experiment was rerun. The audit reads the three experiment sources, their aggregate saved JSON records and the named inherited helper, and counts loop/index domains only. Raw coefficient, recurrence, matrix, polynomial and inequality-gap values are not recomputed.

The coordinate scans use all reduced1≤a<b with2≤b≤38 horizontally and2≤b≤32 vertically. There are449 and323 fractions, respectively. The vertical fraction set is a subset of the horizontal set, so the sum is **772 coordinate/fraction cases but449 distinct fractions**. Each scan constructs the mechanical word from successive integer prefix floors and separately compares its residual scaling identity with the literal recurrence-defined source polynomial.

The source-coefficient comparison counter counts stored coefficient positions in the **cleared scaling identity**, not that many distinct raw P coefficients. Horizontally it compares `(1+x)^(2j)*raw_horizontal_j` with `(1+x)^(b−1)*R_horizontal_j`; vertically it compares `(1+x)^(2i)*raw_vertical_i` with `(1+x)^(a−1)*R_vertical_i`. Static geometric-index counting matches the reported sizes: for row/order r, the lower index is `max(0,ceil((ab−ar)/b))` horizontally and `max(0,ceil((ab−br)/a))` vertically; after clearing, the upper index is d+r. These are index-domain counts, not a reconstruction of the polynomial dictionaries or verification of their values.

Residual row arrays run from index0 to a+j or b+i inclusive, for orders0 throughd. Adjacent comparisons use starts strictly below array length−2; no padded trailing starts are added. The counts are:

| Scan | Fractions | Slice indices | Residual array positions | Cleared-identity positions | Residual adjacent starts | Leading positions matching saved zero count |
|---|---:|---:|---:|---:|---:|---:|
| Horizontal b≤38 |449|17301|673953|1064166|639351|91614|
| Vertical b≤32 |323|10563|464420|548836|443294|48182|
| Combined coordinate cases |772|27864|1138373|**1613002**|**1082645**|**139796**|

The saved coefficient/adjacent comparisons have no failures; both same-row F/H mixed scans retain empty failure lists. Recorded zero totals agree with the polygon-derived leading-index counts. The audit does not independently establish the saved numerical values or no additional zeros from those counts. Residual triples are auxiliary sequences, so these1,082,645 checks must not be relabeled as guarded raw-root triples. Universal support and transfer theorems are justified by the retained Lean sources/receipts, not these finite scans.

The separate mixed probe uses127 actual source states with b≤20. For each state it scans rows0 througha+b, all six unordered pairs of four B-update summands, and starting indices0 througha+r+1. This exactly recounts **366288 mixed comparisons**. Only the first ten failing comparisons are stored, so ten is not the total number of failures.

At actual source1/7, row2, starting exponent1, stored term indices1 and2 are **x H₂** and **h² F₁**. Their recorded triples are `[0,3,18]` and `[2,5,4]`. The source narrative records mixed gap−6. These are different rows of different state components in the update, unlike the same-row F/H scan that found no failure. The initial word is the actual six-A/one-B source word; the tested object is a pair of terms after appending B to that state. The complete new word or complete sum is not asserted to fail, and appending a letter is not silently treated as an actual-source operation. This is a finite obstruction to the particular pairwise summand condition, not a failure of raw or residual LC for source1/7. The gap was not recomputed by the auditor.

The enlarged-word probe separately tests37 words `A B A^n B B`,1≤n≤37. The full word need not be a palindrome; its interior `B A^n B` is. The saved failures are fourteen words n=24 through37. The first, n=24, has counts(a,b)=(3,28), horizontal residual row4 and exponents1,2,3 with recorded values4,56,799 and recorded violation `56²<4*799`.

Admissibility is checked from saved word metadata, not inferred from counts or a palindromic interior. Every reported failing word has true-letter count3, length n+4, and first two letters[A,B] with one true letter. The inherited actual-source prefix theorem requires the number of true letters in that prefix to be floor(6/(n+4))=0. Thus **every recorded failing word violates the actual source-prefix requirement**; the first has reduced labels3/28, demonstrating that coprime counts alone do not make it a source word. This is static integer prefix counting using the retained `source_prefix_floor28` theorem. It does not evaluate a matrix or new polynomial. The failed object is also a residual rather than the pinned raw polynomial. No conjecture refutation follows.

The37 enlarged-word tests and366288 mixed-summand comparisons are separate from the reported coordinate totals. Their outputs do not establish a universal failure or success beyond the scanned domains, and they are not premises of the new mathematical modules.

## Exact new inventory, rejected versions and byte bindings

| New module, suffix MEA423 | Theorems | Definitions |
|---|---:|---:|
| MarkovHorizontalSupport |7|3|
| MarkovHorizontalPair |6|2|
| MarkovHorizontalInterval |6|0|
| MarkovAtomicSupport |10|4|
| MarkovVerticalPair |6|1|
| MarkovVerticalInterval |6|0|
| MarkovResidualEndpoints |8|0|
| MarkovResidualLeading |4|0|
| Total |**53**|**10**|

All eight mathematical sources are final compiled, selected-replayed and named in successful axiom output. There are no new unbuilt, compiled-only, definition-only or import-only mathematical targets. The three disjoint Audit groups cover5/1/2 modules and35/6/12 closures, with4/1/2 successful replay unions. The first group contains all ten definitions. Seven replay unions select eight distinct modules in eight occurrences; their63 explicit declarations are53 theorems+10 definitions. All53 printed rows are distinct expected names and all report only `{propext,Classical.choice,Quot.sound}`.

There are19 compiler receipts and19 immutable snapshots: eleven successful final-source builds (eight mathematics and three Audits) and eight returncode1 failures. There is no compiler/replay timeout, interruption code, receiptless snapshot, unsuccessful numeric replay or successful superseded source version. Every failed snapshot differs from the final accepted source. The errors concern HorizontalPair once, HorizontalInterval twice, AtomicSupport once, VerticalInterval once, ResidualEndpoints once and ResidualLeading twice.

The two Leading failures share obsolete source SHA-256 `5b56e71f69f31025b02aad5077f9f60cd8dd7f51a9ab308f131912caddf8475f`, first with missing Endpoints object and later with an arithmetic tactic failure after the prerequisite became available. Final Leading has SHA `0ee717ab31ca20b2e7d431eec491c38c1c0c9d92a1dd21d4bf14bea278823f6e` and its own successful build/replay/print. Textual header comparison finds no changed binders or premises across rejected and final declarations; the sole header-text difference is whitespace around `<` in a HorizontalPair bound theorem. Later changes repair proof text. This static comparison does not elaborate rejected statements or upgrade their failed receipts.

All26 numeric compiler/replay outcome summaries bind to event output. Each selected source has an earlier matching successful build; replay source maps, final validation pointers, object hashes and stored theorem inventories agree with the final sources. All99 controller artifacts match archived and exact current bytes; all97 index entries match. The only index exclusions are manifest and last-verification, separately bound by the controller. The archive contains12 final Lean sources (eight mathematics, three Audits, one driver),19 compiler snapshots,11 objects,42 JSON,nine Python and six Markdown files.

All5388 prior inputs are preserved from a5390-entry initial map. Its two exclusions are this round's own setup and own checkpoint; the checkpoint legitimately changes during the round and both versions are distinguished. All485 predecessor124 artifacts and1355 worker121 artifacts are preserved with matching controller/archive/before/current hashes. The interrupted reconciliation retains worker121's timeout/reportnull and unchanged228-event log. No old action is replayed or historical cutoff upgraded.

The raw contract SHA remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; sorted compact ASCII canonical JSON SHA remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request. This is a serialization distinction, not a changed mathematical contract.

## Replay mechanism and current inherited boundary

The retained driver `ReplayIsolatedMEA423.lean` has SHA-256 **`239de8f6041251722c4cbc99f3e697832733f526339f940a3aa56d6cd510a1b3`** and exactly matches worker124 after MF8→MEA423 retagging. All seven receipts record this hash. Compiler, replay, selected-module and axiom wrappers retain their behavior; the finalizer also updates the predecessor-manifest path. Compiler uses `-j1`; replay retains stack131072, ordinary `env.replay` and joined-task failure propagation. No checker guard is weakened.

The guard checks collected names starting `MathGKM.Markov.` and ending `MEA423`, requiring absence from the imported environment and neither unsafe nor partial. All63 explicit selected declarations satisfy the namespace/suffix predicate. Actual batches are source-import antichains with no selected target in their transitive imported base and no explicit selected/base name collision. Generated/private and inherited names outside the predicate still receive ordinary Lean.Replay handling; duplicate-map, pre-imported declaration and axiom-admission qualifications remain outside this strengthened explicit-name guard.

The wrapper uses direct-import levels, chunks of at most eight, three threads and180-second replay limits, without completion barriers between levels. Four invocations begin before an imported new dependency finishes its own replay. Every required matching new compilation precedes invocation and all eight new bodies ultimately pass. The final overwritten replay-plan contains only Endpoints and Leading singleton levels, not all seven receipt groups. It is metadata, and the retained `mode=='replay'` filter excludes it from replay outcomes.

Checker-source hashes are recorded after subprocess return. Source/object preservation does not reconstruct invocation-time loaded binaries or every generated/private constant. Reused Boolean flags and finalizer field-presence predicates remain weaker than the independently checked final-source/name/hash coverage: the finalizer can restore a replay flag from a successful source-matching receipt containing a checker-hash field without itself comparing that hash to the expected driver or enforcing exact name identity. No missing new coverage results here, because the actual independent comparisons establish it. Finalizer exit status alone would not suffice.

There is no new saved worker125 dependency inventory. The reconstructed local source graph has **74 nodes=11 new mathematics/Audits+63 inherited**, driver separate. The Endpoints/Leading root union has **71 nodes=all eight new mathematics+63 inherited**; Leading imports Endpoints. There are no unresolved local imports or cycles. Mathlib and implicit Lean/toolchain imports remain external to this local graph.

All63 inherited source/object pairs were independently hashed at exact named current paths and matched sealed prior124 bindings and before125 pins during04:51:36.016237–04:51:36.055994 UTC. This is auditor reconstruction and preservation, not a saved worker125 dependency receipt, whole-source rebuild or replay of inherited bodies. No newly accepted124 MF8 module is imported by these targets. No MAE2 module is imported either: intersections with worker121's212 backlog,195 Half subset,19 previously imported accepted modules and298 unbuilt modules are all empty.

Accordingly **the historical212 backlog is unrecovered and absent from this round's replay bases**. The inherited full-root reduction's older validation boundary is unchanged, but it is not part of the new support/endpoint dependency closure. This audit establishes neither a complete inherited-body replay nor official-checker admission, independent loaded-binary verification or full mathematical completion.

Earlier supervisor-reported byte-identical retained-storage COW consolidation is operational history only. Hash identity, not inode/ctime identity, governs the comparisons. That history grants no proof upgrade, and this audit neither inspects successor mathematics nor changes any live source/object.

## Finalizers, reports, deadline and late evidence

All times are UTC on2026-10-16. Numeric receipt stamps denote invocation starts; estimated returns add retained durations and are not separately timestamped exit events. The three groups' last replay estimates are04:38:01.862485,04:39:58.143589 and **04:45:51.970558**. Endpoints starts04:45:42.457317 and returns04:45:51.907217; Leading starts04:45:42.457535 and returns04:45:51.970558. All new selected coverage is complete before finalization.

Three direct finalizers at events187–188,192–193 and196–197 return0 with8 compiled/8 validated/53 closures,5388 prior inputs,483 inherited index entries,eight unsuccessful compiler receipts,zero actual replay failures and no pending scope or preservation failures. Their verified indices are96,96,97. Events181–182 only create the finalizer source. Documentation changes190–191 precede the second pass; addition of `report.json`194–195 precedes the third. Unlike worker124's interim state, every worker125 finalizer already has complete new mathematical validation. There is no partial-validation interim record or replay-plan failure misclassification in this round.

The indexed draft report is saved at04:47:46.404944 with SHA **`b692c091101f66e45cdcb834f6a5085eff69d9f956475aedfe2b4296f1c49a04`**. It differs from the final report in actions, agenda, observations and summary. Both have the same request, null completion and unresolved-root scope; the draft states the conditional transfer bounds and enlarged-family failure more explicitly, while the final report condenses observations and includes97 verified artifacts. They are retained as distinct versions.

Final validation mtime is04:47:46.470018; compiled inventory04:47:47.004306; final-check04:47:47.004372; manifest04:47:47.016448; and last-verification04:47:47.018647. Last-verification follows the manifest intentionally, is the latest controller-bound project artifact and reports97 hashes with no failures. All final index hashes match; no stale final index or unexplained post-finalization project artifact is observed.

Final report event198 parses identically to `final.json` and controller report; event199 is turn.completed. Final JSON SHA is **`a73dd420c1a3ee9bdc04658e42e5d0dfa44867a8bfaeaba77430b5e50c74729b`**, with mtime04:47:59.988382. It retains null completion, explicitly says no new unconditional raw LC region was closed and acknowledges compiled-import reuse and no whole-source rebuild.

Controller start is04:21:36.864064; nominal deadline04:51:36.864064; completed finish04:48:24.589336, returncode0. Retained elapsed is **1607.72527217865 seconds**, **192.274728 seconds before deadline**. All observed mathematical receipts, project artifacts and final report precede deadline and controller finish. The auditor's later hash observations do not change this cutoff.

The199 events comprise93 starts,103 completions and three thread/turn events, with no unmatched start. The769170-byte event log exactly matches activity accounting; stderr is empty. Event-log mtime04:47:59.280793, activity time04:47:59.481846, final JSON and receipt mtime04:48:24.589551 follow ordinary completion bookkeeping. No independent system-wide process census is claimed. No late receipt, extra completed-request evidence file or missing counterpart was observed, and no separate late preservation is required.

## Supporting files and limits

Final validation stability rehashed8681 observed inputs during04:53:53.555702–04:54:01.886585 UTC and found zero changes. The final completed-request observation at04:54:01.886595 found no extra or missing files. Method stability checked134 exact inputs at04:54:21.957862. These observations concern completed material only.

Seven companion files preserve mathematical source hashes, static declarations and exact theorem statements, finite-domain counts and copied witness metadata, independent validation and its evidence, and replay method and its evidence. This main file and those seven supports are sealed in `markov_worker_000125_integrity.json`. The mathematical hash supplement independently binds the eight new archive/current sources and eleven named inherited sources, including the pinned root and unchanged MF8 residual; the broader63 imported-object comparisons are in validation/method evidence.

The completed result is universal support and endpoint information for actual residuals, with explicitly conditional LC transport. It does not prove residual LC, close a new unconditional raw LC region, repair the historical replay backlog or complete/refute Conjecture63. No missing validation was executed and no proof/source/research assistance was supplied by this audit.
