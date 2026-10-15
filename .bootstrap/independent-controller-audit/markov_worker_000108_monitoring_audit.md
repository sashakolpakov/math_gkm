# Independent monitoring audit: worker 000108

Request `38ebef17ca8b4ee9b725755d9dcec986`. Archive-first read-only review of the machine-authored mathematical sources, correspondence and retained validation. Source base: `/Users/sasha/math_gkm/.control/markov/workers/000108/artifacts/`. No proof, checker, replay, finalizer or research experiment was executed; no project changes, proposer contact, proof assistance or active successor inspection occurred. Input/index enumeration below is an audit of finite domains, not a rerun of coefficient calculations.

## Mathematical finding

The new assembly proves the entire fourth lower diagonal for every natural run length and every actual predecessor with denominator at least five. Its numerical source bridge proves the same statement for every generated path whose source labels satisfy `a+5 ≤ b`. The exact raw coefficient normalization, three-point indexing, original polygon premises and natural-index zero conventions are preserved. No unproved formula, gap certificate or fitted source identity remains as a premise of these source theorems.

The residual fourth-diagonal parameters with `2 ≤ b-a ≤ 4` and `4*b < 5*a` necessarily have run length at least four and predecessor pair `(c,r)` among `(2,1),(3,1),(3,2),(4,1),(4,3)`. This is a classification of parameters, not proof of their remaining inequalities. It concerns the fourth diagonal only; horizontal and vertical interiors and higher diagonals still occur in the full conjecture.

The accepted exact root equivalence is `root_iff_coreAllM38E`, using the explicit solved-region predicate. The proposed equivalence with a numerical small-gap residual, `root_iff_coreSmallGapM38E`, is in a timed-out, unaccepted module. It must not be promoted to a checked theorem from its source text or the preceding classification.

The short-run quotient proofs for `n=0,1,2,3` are alternate proofs of previously covered source regions, as the worker's final correspondence acknowledges. Their assembly with the newly recovered long-run theorem makes an all-run and label-based statement explicit. Declaration counts do not measure the number of new source regions. The small-cycle correction formulas remain finite/interpolated candidates.

## Source labels, raw indices and constants

For `path = replicate n true ++ false :: rest`, let `c=(frame rest).mid.b` and `r=(frame rest).mid.a`. The source labels are `a=n*c+r`, `b=(n+1)*c+r`, hence `b-a=c`. Here `r` is the predecessor numerator, not the numerator `a` of the resulting source. Actual frames supply `0<r<c` and coprimality. No assumptions about an arbitrary empirical word or larger auxiliary polynomial family substitute for these actual source paths.

Write `A(i,j)=coeff (frame path).mid.p i j`. On the fourth lower diagonal, `i+j+2=a+4`; the raw triple is

`(i+2,j), (i+1,j+1), (i,j+2)`.

The inequality is `A(i,j+2)*A(i+2,j) ≤ A(i+1,j+1)^2`. “Start j” denotes the second-coordinate sequence, not a first point `(i,j)`. Every assembly uses this same convention. All indices are natural numbers. The statements do not assume coefficients are positive or nonzero and do not divide by coefficients. The common scale 24 in the quotient identities is cancelled as `24²`; it is not a position-dependent or factorial/binomial normalization.

`RunFourthLCM94 n rest` retains the three original polygon guards. The fixed-run source inequalities are stronger: they require just their source parameters and total-degree equation. The final all-path theorem reinstates all three polygon hypotheses, so neither source identity nor the root predicate silently expands or drops the intended guard conditions.

## The 24 quotient identities and their source interpretation

For each run `n=0,1,2,3` and each of the six strict ratio chambers, a `MarkovSmallQuot{n}_{ch}M38E` module defines an integral polynomial `Q` and proves an identity in `ℤ[X]` of the form

`chamberNumerator(n, X^n, C c, C r, X) = (1-X)^8 * Q(c,r,X)`.

The identity is proved for arbitrary integer `c,r`; the chamber/source hypotheses are applied when identifying this numerator with the actual source cut. The source adapter uses the previously checked actual-source cleared-numerator equality and then cancels the **nonzero polynomial** `(1-X)^8` in the integral domain `ℤ[X]`. Nonzeroness is proved from the coefficient of `X` in `1-X`, followed by nonzeroness of a power. This is polynomial cancellation, not evaluation at a numerical `X`, and does not require an unstated hypothesis `X≠1` or a nonvanishing coefficient.

For every natural `i,j` with `i+j=a+4`, the resulting exact identity is

`24*A(i,j) = smallValue_n_ch(c,r,j)`.

The scalar function lists all coefficients from zero through a finite cutoff and is explicitly zero afterward. The coefficient theorem handles every natural `j`, including its tail. The cutoffs by chamber, ordered by increasing `r/c`, are:

| n | Cutoffs in the six chambers |
|---|---|
| 0 | 4, 5, 5, 6, 6, 7 |
| 1 | 8, 9, 9, 10, 10, 11 |
| 2 | 12, 13, 13, 14, 14, 15 |
| 3 | 16, 17, 17, 18, 18, 19 |

All 24 definitions have contiguous listed indices and an explicit default zero. Each source bridge cites the exact `source_cut_coeffA27` relation at degree `a+4`; no sampled coefficient list is admitted as an axiom. Python's rational candidate arithmetic is not a hypothesis of these Lean identities.

## All chambers, all short-run indices, and zero tails

The six ratio intervals are `(0,1/4)`, `(1/4,1/3)`, `(1/3,1/2)`, `(1/2,2/3)`, `(2/3,3/4)`, `(3/4,1)`. For adjacent fractions `p/q < s/t`, the scalar proof uses nonnegative integer coordinates

`c=q*(C+1)+t*(R+1)`, `r=p*(C+1)+s*(R+1)`.

The source adapters derive `C=s*c-t*r-1` and `R=q*r-p*c-1` from the strict inequalities and prove the substitutions exactly. They do not assume an additional lattice-solvability or representability condition. Actual reducedness and `c≥5` exclude equality with each of the five intervening fractions; the four run assemblies explicitly establish those exclusions before splitting into all six chambers.

Within a chamber the scalar difference `Q(j+1)^2-Q(j)*Q(j+2)` is identified exactly with a polynomial whose nonnegativity follows for the nonnegative coordinates. Every potentially nontrivial start through cutoff minus two has its own equality and nonnegativity proof. Above that range `Q(j+2)=0`, and the inequality follows from a square being nonnegative. Thus no tail, endpoint, zero or support-gap condition is left as an assumption.

The source adapters obtain all three coefficient identities at `(i+2,j)`, `(i+1,j+1)`, and `(i,j+2)`, apply the same positive factor 24 to each, and cancel it. `source_fourth_run0M38E` through `source_fourth_run3M38E` discharge every chamber premise from actual source data. `run_fourth_0M38E` through `run_fourth_3M38E` consequently prove the guarded whole-slice predicates. The scalar helper count is not additional source-family coverage.

## Long-run recovery and all-path numerical bridge

`run_fourth_allM38E (n : ℕ) (rest : List Bool) (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest` has no lower bound on `n`. Its proof splits `n≥4`, using the recovered `run_fourth_ge_fourM8B8`, from the four explicitly enumerated cases `n=0,1,2,3` above.

Worker107 had compiled its `n≥4` assembly without a selected replay, and its separately observed late union had covered only 22 supporting modules. The current worker's successful selected replay of `MarkovFourthFourCompleteM8B8` supplies that missing assembly check in **worker108's history**, not retroactively in worker107. The exact inherited/late/recovered receipt boundary is documented in the validation supplement. A new renamed `MarkovResidualFourM38E` proves the intermediate `n≥4`/onset-window root equivalence; the old worker107 residual draft is not silently relabelled as checked.

`source_fourth_gap_ge_fiveM38E` quantifies over every generated `List Bool` path, with `a+5≤b`, the three original polygon conditions and `i+j+2=a+4`. `split_first_false487` exhausts the possibilities: a pure-right path or a path with an initial run and predecessor. For the pure-right case the proven labels give `b=a+1`, contradicting the hypothesis. In the other case the exact source-index equalities give `c=b-a≥5`, so the all-run theorem applies. There is no additional decomposition, representability, slope or lower-run-length premise in the final numerical source statement.

This remains a theorem about the generated source family used by the pinned target. The audit does not claim a new independent whole-paper reconstruction of that family's rational-index coverage or homogeneous numerator semantics.

## Five-family classification: precise quantifiers and limits

`fourth_small_gap_parametersM38E` assumes a generated path with

`a+2≤b`, `b≤a+4`, and `4*b<5*a`.

It concludes the **existence** of `n,rest` with that exact path decomposition, `n≥4`, and one of the five predecessor pairs `(c,r)=(2,1),(3,1),(3,2),(4,1),(4,3)`. The proof derives `2≤c≤4` from the source labels, the run lower bound from the strict slope, and excludes `(4,2)` using actual coprimality. The pure-right branch is impossible from the lower gap bound.

As a Lean statement this is a necessary decomposition/classification, not an iff with a family predicate, not a uniqueness assertion about `rest`, and not an inequality theorem for those families. The numerical guards are essential; it does not classify every remaining requirement of Conjecture 6.3. In the old exact residual these slope/gap conditions pertain to fourth-slice obligations; higher slices and horizontal/vertical interiors remain separately present.

## Accepted residual versus timed-out draft

`SolvedFourthRegionAllM38E path i j` is an explicit existential path decomposition with predecessor denominator at least five and `i+j+2=a+4`. `root_iff_coreAllM38E` rewrites the earlier checked root equivalence, retains both horizontal/vertical clauses and every existing diagonal polygon/interior/endpoint guard, and removes only this proved region. The reverse implication splits on that existential predicate and applies `run_fourth_allM38E` to discharge its true case. It does not assume the residual is true.

The candidate `MarkovResidualSmallGapM38E` instead attempts to express the fourth-slice exception by the numerical upper gap `b≤a+4`. Its build timed out and the module has no accepted object/replay. The source's plausible proof text, separately proved numerical source theorem and classification are not substitutes for its missing check. The final checkpoint and pending list correctly retain this exclusion; wording in the mathematics report conditioned on future acceptance must be read with that final status.

No root proof, root negation or all-direction completion follows from either the accepted equivalence or the finite experiments.

## Finite evidence and small-cycle candidates

The principal experiment ranges over `n=0,1,2,3`, `5≤c≤30`, and reduced `1≤r<c`. Independently enumerating those tuples and the saved index/polygon guards gives exactly 1,088 cases, 50,112 coefficient comparisons over `0≤j≤a+4`, 11,424 polygon-valid raw triples, and 1,720 literal recurrence comparisons restricted to `c≤9`. The saved input list matches exactly. No coefficient or inequality computation was rerun.

The recorded zero count is 36,512. Counting only the explicit definition tails above yields exactly 36,512 tested positions beyond the relevant scalar cutoff. This accounts for the saved zero count by index structure, without evaluating coefficient polynomials or certifying the numerical computations anew. Unlike the previous worker's scans, these finite lists do contain many zero-tail coefficient positions. The compiled scalar proofs separately handle all natural tail indices.

The small-cycle probe covers the five pairs above with `n=0..24`: 125 cases. Its coefficient loop is finite, `0≤j<4*n+8`. The normalized candidate data and fitted formulas are derived from those saved finite differences; the polynomial-in-n coefficients are interpolated from `n=6,7,8` and compared with the 25 recorded runs per family. Neither a loop description such as “retaining all coefficients” nor interpolation establishes an unbounded formal-series/source identity.

For `c=4,r=1 or 3`, the candidate says the extrapolated `c≥5` formula misses one raw boundary coefficient at `(0,a+4)`, equivalently a defect `24*X^b` with `b=a+4`. It is only an observed finite candidate here; there is no universal Lean source correction or resulting LC theorem for it. The `c=2,3` rational correction candidates likewise remain unproved. Failures of the extrapolated large-c identity are not counterexamples to the original raw log-concavity conjecture.

The finite-domain audit is saved as `markov_worker_000108_finite_domain_audit.json`, SHA-256 `d30443c05dd4b040b23d89fbbeb87233404cc6d36f801af7ebae732cdee459a5`. Selected source hashes are saved as `markov_worker_000108_mathematical_source_hashes.json`, SHA-256 `1642e471a5ff3aa3ba38669cef60d181a6401c6caf4f9103a2e1eef304b53b48`.

## Retained validation supplement

The independent binding/method audit is recorded separately beside this note. No missing validation or finalization was completed by this review.


All 344 controller-listed artifacts match current and archived bytes, and all 341 indexed entries match their recorded hashes. The three archived/controller-bound files outside the index are the index itself, `final-check.json`, and the retained `research/work-38ebef17/MarkovSmallQuot0_0-attempt2.lean` attempt. The sole unaccepted mathematical module is the timed-out `MarkovResidualSmallGapM38E`; its source is retained without a successful object or selected replay.

The final accepted new mathematical inventory has 56 modules, 385 theorem declarations and 304 definitions: 24 quotient/source modules, 24 scalar-gap/source modules, four short-run assemblies, and four all-run/source/residual modules. All have matching successful final-source builds and selected alternate replay records. The 252 fixed-position gap lemmas and other helpers are included in the 385-name count; it is not 385 new source regions.

There are 85 ordinary build invocations: 60 successes (56 new mathematical modules, three Audit builds and an unchanged inherited `MarkovFullChamber0FA` rebuild), 24 compiler errors and one timeout. Eight union invocations comprise seven successful groups and one rejected duplicate-declaration group. Successful groups contain 76 overlapping selections and 57 distinct targets: the 56 new modules and the inherited `MarkovFourthFourCompleteM8B8` recovery. No direct per-module replay was used. The failed union mistakenly selected the unchanged inherited FA module while it was also in the imported base; its failure is retained, and later corrected groups explicitly select the new modules. A successful dependency rebuild alone is not an additional new theorem or a successful selected replay of that inherited module.

The three executed Audit builds are Recovery (five names), Third (386 names) and Final (388 names), totaling 779 printed rows and 393 distinct standard-axiom closures. The distinct set is the 385 new names, five recovered FourComplete names and three inherited FA names. The final recovery metadata's 1,013-name axiom map is reconstructed from the old 1,008-name audit plus five new prints; it does not mean that 1,013 names were freshly printed in worker108. The other generated audit inventories are not additional executed Audit results.

### Historical recovery boundary

The 239 predecessor recovery rows decompose into 216 modules replayed in worker107's archived history, 22 modules covered only by its separately observed late receipt, and one newly selected worker108 replay of FourComplete. The 1,055 old worker107 controller artifacts are unchanged. The old `ResidualFourM8B8` draft remains part of that old unbuilt history; worker108 instead builds its own `ResidualFourM38E` module.

The late worker107 receipt is still absent from both workers' artifact archives. Its hash is bound by worker108's before-inventory and current bytes, but it is not included in worker108's 1,596-entry initial/preservation list either. It is preserved independently at

`markov_worker_000107_late_evidence/kernel-union-1792097744398600000.json`,

SHA-256 `66ecffb1baecb754015b125b7fa1a21533cdf07faf1ec302db65ed4c490ddb59`.

That snapshot remains necessary to the durable audit bundle. Reuse of this later evidence does not transform it into a pre-deadline worker107 result, a worker108 re-execution of those 22 checks, or a fresh whole-tree rebuild.

### Finalization and outer timeout

Worker108 began at `2026-10-15 20:56:11.553645 UTC`, with nominal deadline `21:26:11.553645 UTC`. Its retained finalizer completed at the last event, 311. `final-check.json` has mtime `21:25:46.552465 UTC`, and the complete event stream has mtime `21:25:46.602924 UTC`. The activity record at `21:26:11.048770 UTC` accounts for the entire 849,134-byte event stream. Thus the validation/preservation/index/final-check outputs and finalizer completion are retained before the nominal deadline.

The controller nevertheless records a timeout and null report, finishing at `21:26:42.997672 UTC`, approximately 1,831.444 seconds after start. There is no final agent JSON or completed turn. Finalization records are not a final agent report, and a null final report does not erase the earlier completed, source-bound checks. No pending started command, extra current worker108 evidence file or post-deadline project artifact was found.


The supervising agent records that the late107 receipt and its byte-identical audit snapshot were already preserved separately in local checkpoint `5364e31`, alongside the worker106–107 archives and audits. Neither historical artifact archive was altered. This is a reported preservation action, not an additional replay or an independently rerun Git check in this audit.

### Replay-method qualification

The successful checks use the unchanged alternate union replay driver, not an official LeanChecker CLI result or a fresh rebuild/replay of the full imported source tree. Static source-import/name checks find all seven successful target sets free of their own targets and explicit name collisions in the imported base. The rejected FA group is separately contaminated and remains a failure; its later suffix-filter correction does not rewrite that receipt. The numerical residual draft and old unbuilt worker107 residual are absent from successful bases and target sets.

The two-worker batch scheduler orders modules topologically but does not wait for dependency replay completion. One successful 19-target group began before 18 new quotient dependencies had a successful replay, while their concurrent first group failed. A later 25-target LC group began while 25 imported new-module replays were unfinished. All those dependencies eventually passed in worker108; the final selected coverage is complete, but the stronger claim that each imported dependency had already been replayed at the start of every dependent invocation is unsupported.

The unchanged rebuilt inherited `MarkovFullChamber0FA` remains an imported dependency boundary, rather than a successfully reselected module. Pre-run source hashes, retained objects, printed closure lists and post-run driver hashes are distinct evidence. They do not independently identify every actual loaded binary/generated/private constant or immutable invocation-time wrapper/object bytes. The established replay procedure's handling of duplicate imported theorems, unsafe/partial declarations and axioms is retained; source-level target-free checks and permitted printed closures are separate safeguards. No fresh whole-tree check, full conjecture proof or retroactive completion is inferred.


### Final support links and hashes

The validation audit confirms the new FourComplete recovery's successful union receipt at `21:02:54.649549 UTC`, the last FourthGap union at `21:24:07.574890 UTC`, and the numeric residual's recorded timeout before the finalizer. No missing check was completed by this audit. There are 93 actual validation invocations and 26 rejected attempts, all retained; the final selected source versions supersede earlier erroneous versions without rewriting their history.

- `markov_worker_000108_validation_audit.md`: SHA-256 `6443bb8dd5cad91dbadda66139351e1cdf2b882e78bf6879b25df353538e6795`.
- `markov_worker_000108_validation_evidence.json`: SHA-256 `e2aaba89f10b2b0d340d63734ca152949acdf00e4e94322c1dc7907d41176dbe`.
- `markov_worker_000108_replay_method.md`: SHA-256 `015077f3df9b6f3ff70dffdbb53703d94da36e7f96c0431908553dd848a6fd76`.
- `markov_worker_000108_replay_method_evidence.json`: SHA-256 `78c9a5542e0f3f242a8469a69ebb635353649e299c6860ad16e4f4d3609d95ea`.

The supporting review records 3,370 stable hashed inputs at `2026-10-15T21:36:08.479798Z`, with no source/object/archive mismatch. No mismatch was found between the accepted Lean statements and the scoped English claims. The unresolved full conjecture, excluded numerical residual, finite small-cycle candidates, alternate-replay/import limitations, and worker107/108 historical boundaries remain explicit.
