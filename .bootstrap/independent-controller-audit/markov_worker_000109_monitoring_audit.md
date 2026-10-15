# Independent monitoring audit: worker 000109

Request `0a5fcabe0a82461493719b3bbf93f60a`. Archive-first read-only review of completed worker 109, its mathematical sources, correspondence and retained records. Source base: `/Users/sasha/math_gkm/.control/markov/workers/000109/artifacts/`. No Lean, checker, replay, finalizer, coefficient experiment or source recurrence was executed. No project changes, proposer contact, proof assistance or active successor inspection occurred. The finite-domain enumeration below examines saved inputs and index guards only.

## Mathematical finding and limits

The accepted new source identities establish the fourth-cut correction for every natural run length and every actual predecessor of denominator two, three or four. Combining those identities with the inherited large-cycle result gives an explicit corrected polynomial numerator and a binomial coefficient-extraction identity for every actual predecessor. These are universal source identities; the earlier finite/interpolated candidates are no longer needed as assumptions of these statements.

The new raw inequality proves the fourth-slice initial interval with **start index `5 ≤ j` and strict bound `j+2 < n`**, for every actual predecessor. The interval is nonempty only from `n=8`. It does not prove each entire small-cycle fourth slice. The exact accepted residual is `Conjecture63 ↔ InteriorCore63AllCyclesM0A5`; that residual remains unproved, and so do the full pinned conjecture and its negation. Horizontal/vertical interiors and higher diagonals remain among the obligations.

For `c≥5`, worker 108 already proved the whole fourth slice, including this interval. The additional interval coverage concerns `c=2,3,4`; the final all-cycle theorem also assembles those cases with the previously covered source family.

The accepted mathematical inventory has 17 modules, 53 named theorem declarations and 12 definitions. Named helper identities, source adapters, intermediate residuals and the final equivalence are included in that count; it is not a count of distinct newly solved coefficient regions. Retained validation and replay qualifications are supplied separately and summarized below.

## Exact source domain, indexing and raw normalization

Put `path = replicate n true ++ false :: rest`, `c=(frame rest).mid.b`, and `r=(frame rest).mid.a`. The inherited exact source labels are

`a=c*n+r`, `b=c*(n+1)+r`, hence `b-a=c`.

Here `r` is the predecessor numerator, rather than the resulting source numerator `a`. `frame_reduced rest` gives `0<r<c` and coprimality. Consequently **every actual predecessor has `c≥2`**. The all-cycle source assembly explicitly handles `c=2,3,4` and derives `c≥5` in its final case. It has no omitted denominator-zero or denominator-one actual predecessor. The words “all cycles” do not assert source identities for arbitrary nonreduced pairs, arbitrary empirical words, endpoint labels, or pure-right paths lacking this mixed-path decomposition. Auxiliary normalization identities may quantify over arbitrary natural parameters; their source interpretation still uses actual `rest` paths. The root equivalence retains the inherited treatment of the other path/endpoint cases.

Write `A(i,j)=coeff (frame path).mid.p i j`. The raw coefficient identity assumes `i+j=a+4`. The adjacent inequality assumes `i+j+2=a+4` and uses exactly

`(i+2,j), (i+1,j+1), (i,j+2)`.

Thus “start `j`” is the second-coordinate sequence `j,j+1,j+2`, not a first point `(i,j)`. All indices are natural. The source identities and new interval inequality do not require coefficient positivity, coefficient nonvanishing, or a polygon premise. They therefore apply in particular to every polygon-valid triple satisfying the stated interval and slice conditions. The root residual itself retains all three original polygon guards.

The common coefficient scale is exactly 24. The raw inequality transport applies the same factor to all three positions and cancels its positive square; it does not introduce factorial or position-dependent binomial normalization. No coefficient is divided out. `source_cut_coeffA27` identifies the cut coefficient with the raw bivariate coefficient under the exact total-degree equality. For a natural raw pair that equality implies `j≤a+4`; larger polynomial-tail indices in the experiments are separately described below.

## Universal small-cycle corrections

Let `T` be the actual fourth cut polynomial, `H=1+X`, `E=X^b`, `F=firstRunPolyADB2 n c r`, `S=secondCompressed446 n c r`, and `B=fourthExplicitRunBE n c r`. The three accepted source corrections state:

| Actual predecessor | Exact source identity |
|---|---|
| `c=4` | `24*T = B + 24*E` |
| `c=3` | `24*T = B - 48*(F+H)*E` |
| `c=2`, necessarily `r=1` | `24*T = B + 24*(3*F^2+4*F*H+3*H^2-S)*E + 36*E^2` |

Each theorem quantifies over all natural `n` and actual predecessor `rest` with the indicated denominator. For `c=4`, actual reducedness excludes `r=2`, leaving `r=1,3`; for `c=3`, `r=1,2`; for `c=2`, `r=1`. The literal short source words come from the inherited `source_short_wordBE`, not from fitting finite samples.

The four- and three-cycle modules expand the corresponding cyclic fourth statistic on those exact source words, identify its local moment, and use the inherited source fourth trace with determinant terms. The two-cycle module explicitly retains the missing third look-ahead term in `cyclic_four_run_twoM0A5`; it then combines the source product's second coefficient with the source first/second cut identities and the exact determinant monomial. Its final correction is not obtained by silently applying a long-cycle identity to a two-cycle word. The local projection hypotheses in intermediate statements are supplied by the actual-source shape theorem before they reach the final source corrections.

In the four-cycle raw identity, the correction is 24 exactly when `j=b`, zero otherwise. Since `b=a+4` here, the affected natural fourth-slice position is `(0,a+4)`. This is now an all-run source theorem; the corresponding worker 108 observation was only a finite candidate. No failure of an uncorrected auxiliary formula is being promoted to a counterexample to raw log-concavity.

## Common polynomial and exact coefficient adapter

Define `S0=S-2*X^(2*n+3)` when `c=2`, and `S0=S` otherwise. For actual `c=2`, `r=1`, this exponent is exactly `b`. The common polynomial `plainFourthM0A5`, denoted `G`, uses the uncorrected local third/fourth moment expressions and this `S0`. The accepted algebraic source assembly gives

| Actual predecessor | `24*T-G` |
|---|---|
| `c=2` | `12*(2*F^2+4*F*H+6*H^2-S0)*E` |
| `c=3` | `-24*(F+2*H)*E` |
| `c=4` | `24*E` |
| `c≥5` | `0` |

The second normalization removes its two-cycle term explicitly. It does not assume the correction vanishes. `plain_fourth_clearedM0A5` proves `(1-X)^8*G = fourthNumeratorBC(n,X^n,X,c,r)` for arbitrary natural parameters. The first and second polynomial normalization statements are likewise exact identities. Their rational-function implementation establishes the nonzeroness of the formal element `1-X`, and the result is transported back by the injective polynomial embedding. This is not numerical evaluation or an unstated assumption about a coefficient or chosen value of `X`.

`source_plain_allM0A5` combines the four source cases without extra run, slope, positivity or empirical-formula hypotheses. `correctedFourthValueM0A5(n,c,r,j)` is `fullFourthValueM06(n,c,r,j)` plus the coefficient of the explicit small-cycle correction. `source_fourth_all_valueM0A5` identifies this value with `24*A(i,j)` for every natural raw pair on the fourth slice. `source_fourth_all_lc_iffM0A5` is an exact equivalence between the raw adjacent inequality and the adjacent inequality for these corrected values. It does **not** assert that either inequality holds everywhere.

The polynomial correction is divisible by `X^(c*(n+1)+r)` for every natural parameter tuple; `small_correction_belowM0A5` therefore proves its coefficient is zero for every `j<b` on actual source parameters. This is a proved zero-coefficient statement, with no positive-support restriction.

## Explicit corrected numerator and binomial formula

Put `D=1-X`, `f=firstNumBC(n,X^n,c,r,(2*r-c:ℕ),X)`, and `s=secondNumBC(n,X^n,c,r,(2*r-c:ℕ),X)`. The explicit numerator `correctedFourthNumeratorM0A5` is the inherited fourth numerator plus:

| Parameter case | Numerator correction |
|---|---|
| `c=2` | `12*E*D^4*(2*f^2+4*f*H*D^2+6*H^2*D^4-s)` |
| `c=3` | `-24*E*D^6*(f+2*H*D^2)` |
| `c=4` | `24*E*D^8` |
| otherwise | `0` |

The source theorem proves `D^8*(24*T)=correctedFourthNumeratorM0A5(n,c,r)` for every natural run and actual predecessor. Its right-hand side has parameter polynomials and explicit finite moment definitions, rather than an unevaluated literal source-word trace or fitted correction list. The natural truncated subtraction in moment parameters is retained as defined; it is not silently interpreted as signed subtraction before the cast.

The exact raw extraction theorem is

`24*A(i,j) = sum_{k=0}^j correctedFourthNumeratorM0A5(n,c,r).coeff(k) * choose(7+j-k,7)`

under `i+j=a+4`. The inherited extraction lemma takes the polynomial identity `D^(d+1)*P=Q` as its only premise and is applied with `d=7`. Since the finite summation has `k≤j`, its natural `j-k` does not introduce an unintended underflow. The binomial weights perform coefficient extraction from the common denominator; they do not redefine the target's raw coefficients. Zero coefficients and natural tail conventions remain present.

## Initial interval and residual preservation

The auxiliary convolution inequality `fourthLow_lc_ge_fiveM0A5` assumes integer parameters `c≥2`, `h≥c*(j+1)+1`, and natural start `j≥5`. Its use of the inherited shape inequality shifts the center to `j+1`, matching the raw three-point start convention. These auxiliary conditions are all discharged for the actual source value `h=n*c+r` using `c≥2`, `r≥1` and the strict interval bound.

`source_fourth_conv_allM0A5` first uses the correction's proved vanishing below `b`, then the inherited numerator truncation lemma at every coefficient index `k<n`. It requires `j<n`. The final inequality applies this adapter at `j,j+1,j+2`, hence its precise requirement **`j+2<n`**. It uses the checked weaker truncation lemma; the unsuccessfully rebuilt inherited stronger shift/source modules are not premises of the accepted interval proof. No auxiliary gap inequality is left assumed at source level.

The numeric residual excluded in worker 108 has been implemented and accepted under the new name `MarkovResidualSmallGapM0A5`. That new module proves `root_iff_coreSmallGapM0A5` from the inherited exact root equivalence and worker 108's checked `source_fourth_gap_ge_fiveM38E`. It retains the higher-diagonal branch `a+5≤i+j+2`; on the fourth slice it restricts the still-needed branch to `4*b<5*a` and `b≤a+4`, together with the existing `a+2≤b`. This new success does not change the old draft's timeout history or make its old object exist.

`InitialAllCycleRegionM0A5` is an existential assertion of the exact mixed-path decomposition, `5≤j`, `j+2<n`, and `i+j+2=a+4`. The final root residual adds only the negation of this proved region to the already checked small-gap residual. Its reverse implication splits on that predicate and discharges its true case with `source_fourth_initial_all_cyclesM0A5`. It does not assume the new residual true.

Both horizontal and vertical interior clauses are preserved verbatim. The diagonal clause retains all three original polygon conditions, `i+j+8≤a+b-1`, `a+4≤i+j+2`, `a+2≤b`, the higher-slice/small-gap disjunction, and the four inherited initial/final/middle exclusion predicates. The new exclusion is confined to total degree `a+4`. No higher diagonal or axial inequality is removed by the new interval theorem. The intermediate four-cycle-only residual is checked too, but is superseded in scope by the final all-cycle equivalence.

The five small predecessor families remain `(c,r)=(2,1),(3,1),(3,2),(4,1),(4,3)` under the inherited fourth-slice classification. This round provides their exact source formulas and an initial subinterval inequality, not their complete fourth-slice inequalities. It adds no fresh whole-paper reconstruction of rational path coverage, numerator homogeneity or endpoint semantics beyond the inherited target and correspondence chain.

## Finite-domain evidence, without an experiment rerun

The saved experiment examines the five small predecessor pairs above and `n=0..80`, exactly 405 tuples. The saved input list agrees exactly with independent enumeration. The coefficient loop is `0≤j≤max(a+8,4*n+24)`, which equals `0≤j≤4*n+24` throughout this finite domain. It records 74,925 corrected-numerator/coefficient comparisons. The inequality loop sets `i=a+2-j`, ranges `0≤j≤a+2`, and checks only triples satisfying all three raw polygon predicates. Its exact domain contains 53,695 triples.

The initial subinterval contains 13,505 tested polygon-valid triples, of which 5,402 have `c=4`. Literal bivariate recurrence comparisons are restricted to `n≤8`, with `0≤j≤a+4`, giving exactly 873 positions. The larger coefficient scan uses the cut dynamic program and extrapolated saved rational numerator data plus the explicit correction; it is not 74,925 independent literal bivariate recurrence calculations.

The saved zero count is 20,424. Index geometry gives 20,412 tested positions with `j>a+4`, outside a natural raw pair on this slice, and 12 further natural-slice positions outside the polygon. The latter are the six positions of each `n=0` case `(c,r)=(2,1),(3,1)`, whose fourth slice lies above the source total-degree bound. These counts sum to the recorded zero total. This checks the domain and its agreement with the recorded count, without evaluating the coefficient recurrence or independently recomputing which coefficients vanish. No recorded coefficient values or inequalities were rerun.

The 20 saved correction samples are four runs `n=0,4,20,80` per family. Neither those samples nor the whole finite test establishes universal validity by itself. The universal source corrections and initial interval instead have the separate compiled/replayed theorem evidence described above.

Supporting domain evidence: `markov_worker_000109_finite_domain_audit.json`, SHA-256 `18f7e0c67877ae1305c5155bdf95aa756b668b2bf497a39667fcde70b4e74c74`.

The 17 new mathematical source files match their archived/current/validation hashes. Seventeen explicitly inspected inherited source/script files match worker 109's before-map. Supporting source bindings: `markov_worker_000109_mathematical_source_hashes.json`, SHA-256 `cba545912c482b86ed6a6bc6cd326b0d05dd0936f3d909540fa6999965b761b1`.

## Retained validation supplement

The separate retained-validation and replay-method audits confirm the following bindings. This review has not completed, rerun or repaired any worker validation step.

All 153 controller-listed artifacts match archived and current bytes. All 150 final artifact-index entries match their recorded/controller hashes. The three controller artifacts outside the index are the index itself, `final-check.json`, and the later `last-verification.json`. All 1,940 initial/preservation entries and 344 worker 108 reconciliation artifacts match their retained bindings. The pinned root hash remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

There are 48 completed validation invocations: 38 ordinary builds and ten successful unions. The builds comprise 20 successes (17 accepted mathematical modules, two Audit modules and the redundant local diagnostic), 13 compiler errors and five wall-clock timeouts. Every accepted module has a matching final-source successful build, retained object and explicit successful replay selection. The ten unions select the 17 accepted modules exactly once each; no failed union or direct replay is recorded.

`MarkovFourCycleLocalM0A5` successfully compiled, but its three theorem declarations duplicate the first three in `MarkovFourCycleM0A5`. It is excluded from the final accepted inventory and every successful replay target/import base. Its retained build does not add three distinct accepted names or an additional successful replay.

The 18 rejected compiler attempts are not all superseded-source failures. Twelve errors are on changed sources; the thirteenth is an unchanged inherited `MarkovFourthSourceK0B` import failure caused by the missing `MarkovFourthBoundaryK0B.olean`. The FourCycle and AllCycleValue timeout sources differ from their accepted versions. The SecondNorm and checkpoint-Audit timeouts use exactly the final source bytes and are followed by successful builds of those same bytes. The fifth timeout is the unchanged inherited `MarkovFourthShiftK0B`, with no successful worker 109 object/rebuild/replay. Both unsuccessfully rebuilt inherited sources match worker 91's archive and before109 hashes, and neither occurs in any successful worker 109 imported source base. Their retained failures do not contaminate the accepted interval proof's separate inherited truncation dependency.

The successful checkpoint and final Audit outputs contain 39 and 53 rows, totaling 92 printed rows and exactly 53 distinct named theorem closures. The final list exactly covers all accepted theorem names. Each closure reports `propext`, `Classical.choice`, and `Quot.sound`. This is separate from selected replay coverage and from the 12 definitions.

### Finalization, contract check and deadline chronology

Four finalizer invocations are retained. The first reports 13 modules, 39 closures, four pending candidates and 130 indexed artifacts. The next two report 17 modules, 53 closures, no pending candidates and 149 artifacts. The last reports 17/53, no pending candidates and 150 indexed artifacts after the verifier script was added. Earlier pending lists do not override the completed final inventory.

The first ad-hoc integrity check failed because it compared the canonical JSON contract identifier with a raw-file hash. This is an operational failure separate from the 18 compiler rejections. The correction records both representations: raw bytes hash to `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, unchanged from initial preservation; sorted compact JSON with ASCII escaping hashes to the requested `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Parsed contract content agrees with the request, and no contract mutation occurred. The successful corrected verifier's event output matches `last-verification.json`.

All times here are UTC on 2026-10-15. Worker 109 started at `21:27:22.934895`, with nominal deadline `21:57:22.934895`. The last selected union, for ResidualAllCycles, is timestamped `21:53:44.797762`; the final Audit's estimated return is `21:53:48.000845`. The final artifact index and final-check have mtimes `21:56:21.721309` and `21:56:21.721640`. The subsequently produced and accounted-for `last-verification.json` is the latest project artifact, at `21:56:21.951117`.

The complete 265-event log, including the final agent report and `turn.completed`, has mtime `21:57:12.689856`. `final.json` has mtime `21:57:13.673804`, about 9.261 seconds before the deadline; its content matches both the event report and controller receipt. The last activity record accounts for all 608,429 event bytes before the deadline. There is no unmatched command, extra receipt, pending final candidate, post-deadline project artifact or unaccounted post-finalization file.

The controller nevertheless finishes at `21:57:42.636956`, records elapsed **1,819.7020618915558 seconds**, and labels the outcome **completed**, return code zero. Thus its finish is approximately 19.702 seconds after the nominal budget, while the retained validation, complete turn and final report all precede the deadline. Both facts are preserved. Unlike worker 108, this worker has an actual final report and completed-turn event. It still records `completion:null` and `mathematical_resolution:false`; successful local finalization does not prove the residual.

### Import/replay qualifications and prior history

The static method audit resolves 1,358 local source nodes. Every one of the ten successful imported bases is transitively free of its own selected targets, with no explicit target/base name collision, duplicate selected name, unresolved local source or resolved-source cycle. Their local base sizes in receipt order are 1,337/113/124/175/194/1,347/128/177/201/1,352. Under retained receipt-stamp timing estimates, every imported new module completed its successful replay before the dependent invocation began. Worker 109's explicit foreground groups do not exhibit worker 108's concurrent dependency-replay ordering gap.

The unchanged replay drivers retain their pinned hashes. The copied direct wrapper equals its predecessor after the request-tag substitution. Its unused `current` branch still refers to a nonexistent worker 109 inventory named `MarkovAuditM38E-inventory.json`; all ten observed invocations give explicit targets, so no observed result depends on that branch. The wrapper itself does not require a matching-build receipt; the independent retained-source/build/object audit establishes that binding for these selections.

This is alternate replay of selected declarations, with source-import and explicit-name checks. It is distinct from official checker verification and from a fresh whole-source rebuild, neither of which occurred. The source graph does not reconstruct every compiled import header, generated/private declaration, immutable invocation-time wrapper/binary, or object actually loaded. The established replay driver can overwrite duplicate constant-map keys, bypass already-imported matching theorem bodies, skip unsafe/partial declarations, and admit axioms. The successful static target exclusion and named-axiom closure checks are separate safeguards, conditional on the inherited compiled imports corresponding to their source bindings. Those imports remain trusted.

The 344-artifact reconciliation does not add predecessor replays. Worker 107's late 22-target receipt remains outside worker 109's artifact archive and 1,940-entry initial/preservation list. Before109, current bytes and the independently preserved snapshot agree at SHA-256 `66ecffb1baecb754015b125b7fa1a21533cdf07faf1ec302db65ed4c490ddb59`. None of those 22 targets is reselected here. Its separate durable preservation and worker 107 deadline classification remain necessary; no historical result is retroactively upgraded.

### Final supporting records

- `markov_worker_000109_validation_audit.md`: SHA-256 `2443d433b5a5610a181206bc02851bb8007669dee0e41503ae3a678be6e68199`.
- `markov_worker_000109_validation_evidence.json`: SHA-256 `fd1d8951478c5a5285355501e569e27b8cd80c7ce9982086e7798e4c4548c675`.
- `markov_worker_000109_replay_method.md`: SHA-256 `5016c4688b442d9ae48e405df111606e13703c1f1da8d6ebf285947007111e4d`.
- `markov_worker_000109_replay_method_evidence.json`: SHA-256 `584d49424a597fb86b26c690a28d650afc705e851eab1a12e203b395227ee2ce`.

The supporting validation review records 2,612 stable hashed inputs with zero changes at `2026-10-15T22:04:35.062253Z`; all mismatch lists are empty. No mismatch was found between the accepted source statements and the scoped English claims. Universal identities, the precise initial inequality interval, the still-unproved residual, finite experiments, alternate replay/import trust, rejected attempts and historical deadline boundaries remain distinct.
