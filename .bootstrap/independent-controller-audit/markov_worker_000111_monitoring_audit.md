# Independent monitoring audit: worker 000111

Request `13d40bd782864d0cb2e83d9cc50be607`. Archive-first read-only review of completed worker 111, under `/Users/sasha/math_gkm/.control/markov/workers/000111/artifacts/`. Only saved source, records and completed-worker evidence were inspected. No Lean, checker, replay, finalizer, source recurrence, coefficient experiment or gap calculation was executed. No project or collatz edits, proposer contact, research assistance or active successor inspection occurred. Audit output is confined to `/private/tmp/math_gkm_godel_20261013`.

## Finding and exact scope

The saved final source and its matching successful validation support a new actual-source result: for every generated path with `a=(frame path).mid.a ≥ 2` and `b=(frame path).mid.b ≥ 7`, the exact horizontal row `j=3` has a polynomial coefficient formula and satisfies raw adjacent log-concavity for **every natural starting index i**. `horizontal_third_formulaM13D` and `horizontal_third_rawM13D` in `MarkovHorizontalThirdSourceM13D` discharge the intermediate formula assumption. No auxiliary shape, support, nonzero-coefficient, gap or log-concavity premise remains in the final source theorem.

This is a row theorem, not a full-root result. It does not itself cover sources with `a<2` or `b<7`, other horizontal rows, the vertical direction or higher diagonal slices. The existing root residual is not proved. Full pinned `MathGKM.Markov.Conjecture63` remains open; completion is null. No new root equivalence is declared by these ten modules.

Worker 111 also repairs the selected-replay shortfall in worker 110: all 52 previously unreplayed built mathematical modules receive successful selected receipts in worker 111. Together with retained worker 110 successes this supplies selected replay coverage for all 58 old built modules. This is a new validation fact in worker 111's chronology; worker 110's timeout, stale index and missing replay at its cutoff are not rewritten.

## Literal row, six seed coefficients and uniform scale

Write `P=(frame path).mid.p`, `q=(2a-b)_+`, `t=min(b-a,(3a-b)_+)` and `z=(3a-2b)_+`. These positive parts are natural-number subtractions, taken before casting to integers or reals. The final integer-polynomial identity is

`6 * (Bivariate.swap P).coeff 3 = X^(a-2) * (1+X)^(b-7) * Q(X)`.

The ascending coefficients of `Q=h3seedM13D a b q t z` are:

| Degree | Integer coefficient |
|---|---|
| 0 | `24z` |
| 1 | `24t+(72a-120)q` |
| 2 | `27a^3-18a^2+21a-6+24(a+b-7)q` |
| 3 | `27a^3+27a^2b-114a^2+3ab+33a+6b-18` |
| 4 | `9a^3+18a^2b-54a^2+9ab^2-51ab+87a+3b^2-3b-18` |
| 5 | `(a+b-1)(a+b-2)(a+b-3)` |

The inherited `swap_coeff46` identifies the coefficient at `i` of this swapped row with `coeff P i 3`. Thus the final inequality is exactly

`coeff P i 3 * coeff P (i+2) 3 ≤ (coeff P (i+1) 3)^2`.

There is no diagonal reindexing or total-degree slice here. The three literal points are `(i,3),(i+1,3),(i+2,3)`. The factor 6 multiplies every coefficient equally and cancels as a positive common square in the inequality. No individual coefficient is divided out or rescaled by a position-dependent binomial/factorial. The theorem quantifies over all natural `i`; it consequently applies to all original polygon-valid triples on this row without changing or dropping the root's polygon definition.

## Thirteen charts, exact integer boundaries and zeros

`h3boundsM13D` proves seed bounds for all natural pairs `2≤a<b` and `7≤b`, without a coprimality restriction. `H3BoundsM13D` includes nonnegativity of coefficients 0 and 1, strict positivity of coefficients 2 through 5, and the four adjacent seed inequalities. The 13 real polynomial charts prove these bounds using explicit algebraic expansion and nonnegativity, with nonnegative chart coordinates. This audit inspected their saved proof structure, not a new expansion or proof run.

The natural-coordinate gluing partitions all pairs as follows; equality is deliberately assigned by the non-strict test in each row.

| Region | Natural coordinates and pattern counts | Charts |
|---|---|---:|
| `3a≤b` | `q=t=z=0`; split `a=2,b≥7` from `a≥3,b≥3a` | 2 |
| `2a≤b<3a` | `x=b-2a`, `y=3a-b`; `a=x+y,b=3x+2y,q=0,t=y,z=0` | 4 |
| `b<2a`, `3a≤2b` | `x=2a-b`, `y=2b-3a`; `a=2x+y,b=3x+2y,q=x,t=x+y,z=0` | 4 |
| `3a>2b` | `x=b-a≥1`, `y=3a-2b`; `a=2x+y,b=3x+y,q=x+y,t=x,z=y` | 3 |

Both middle regions use the coordinate lower bounds `(x,y)≥(0,4),(1,2),(2,1),(3,0)`, whose union contains every natural solution of `3x+2y≥7`. The high region uses `(1,4),(2,1),(3,0)`, covering `x≥1,3x+y≥7`. The low charts use `a=2+x,b=3a+y+1` and `a=3+x,b=3a+y`; the actual gluing sends `a=2` to the former and `a≥3` to the latter. In particular `b=3a`, `b=2a`, `3a=2b`, `a=2` and `b=7` are not omitted. All cast/subtraction identities are discharged by natural arithmetic before the real chart is used.

`six_crossM13D` extends the six seed coefficients by zero to all integer indices. It proves nonnegativity, all adjacent inequalities and interval support. At the only possibly problematic internal location, positivity of coefficient 0 and of coefficient 2, together with their adjacent inequality, forces coefficient 1 to be positive. Thus the two possible leading zero coefficients do not conceal an assumed absence of gaps. Coefficients 2–5 are strictly positive. Negative and beyond-degree indices are explicitly zero.

`h3seed_crossM13D` then invokes the checked adjacent-plus-interval-support bridge. The inherited Pascal smoothing theorem transports CrossLC through multiplication by `(1+X)^(b-7)`, and multiplication by `X^(a-2)` shifts the full zero-extended sequence. The assumptions `a≥2,b≥7` make these natural exponents exact; equality cases yield exponent zero. Finally the raw coefficient identity and uniform factor 6 transport the inequality back to integers. Leading, trailing and any original raw zeros are retained throughout.

## Actual-source matrix and moment bridge

`hrowEvalM13D x` evaluates the outer raw variable `U` at the variable real number `x` and leaves the inner variable `V` polynomial. `hrowEval_coeffM13D` proves that its coefficient at `j` is the evaluation at `x` of the literal swapped row, for every bivariate polynomial. The argument does not specialize `x` to 1.

The inherited literal matrices are `rawA18=⟨V,1,UV,U+1⟩` and `rawB18=⟨VS,U+V,UV(S+1),US⟩`, with `S=1+U+V`. `hproj_letterM13D` conjugates their evaluated forms by explicitly inverse matrices and extracts scalar factors `x+1` and `x(x+1)`. The resulting two polynomial matrices have constant projection `diag(0,1)`, established by `hproj_shapeM13D`; it is not a final assumption. The conjugation and trace identities require `x≠0` and `x+1≠0` where division occurs.

`hword_scaledM13D` is an exact identity for every Boolean word and all polynomial orders. For the actual `sourceWord28 path`, the proved true-count and length are `a,b`. Inherited `sourceMatrix_exact_word487`, `sourceMatrix_trace025` and `source_word_exact3eda` then give the exact source bridge

`x^a(x+1)^b * T(V) = (x+1+V) * hrowEvalM13D x P`,

where `T` is the trace of the product of the normalized projection matrices. Neither the scalar `x^a(x+1)^b` nor the source factor `x+1+V` is discarded. An arbitrary Boolean word is not silently substituted for an actual source when its pattern counts are evaluated.

The new local third-moment expression keeps the factor `p.b.coeff 1` in its length-three term. This removes the special first-upper-right-coefficient premise present in the older local edge helper; the final generalized scans and generic cyclic moment bridge require only the proved common constant projection. `hsource_momentsM13D` requires `b≥4`, derives a central word of length at least two, rotates the trace cyclically, and applies the first, second and third generic moments. The actual cyclic scan is evaluated using inherited `source_tripleScanADB2`, with exact counts `b,a,q,t,z`. It yields `T₀=1,T₁=D,2T₂=D²+K,6T₃=D³+3DK+L`.

`MarkovHorizontalScaledM13D` proves compact rational identities for these three moments, with denominators respectively `(x+1)^2`, `x(x+1)^4` and `x^2(x+1)^6`. Their numerator expressions are explicit saved definitions. `hmoment_seedM13D` clears these denominators and identifies the resulting polynomial with `Q(x)` for arbitrary real scalar parameters; only afterward are the actual natural source counts substituted.

Comparing coefficients 0 through 3 of the exact source trace and eliminating the lower row coefficients gives

`6 x²(x+1)^7 * (hrowEvalM13D x P).coeff 3 = x^a(x+1)^b Q(x)`.

For every real `x>0`, both denominator side conditions hold. Equality on this infinite set yields an equality of real polynomials. The final proof cancels the nonzero polynomial `X²(1+X)^7`, using `a≥2,b≥7` for the exact power splits, and uses injectivity of the integer-to-real polynomial map to recover the integer identity. The temporary exclusions `x=0,-1` therefore impose no excluded raw coefficients or coefficient positions. This is an algebraic source proof, not interpolation from finite data.

The failed files `MarkovHorizontalMomentEvalM13D` and `MarkovHorizontalScaledDM13D` are superseded candidates with overlapping declaration names. Their presence is not accepted source coverage and they are not dependencies of the final compact scaled module.

## Finite records: independently counted domains only

The saved literal experiment loops over every coprime pair `2≤a<b`, `7≤b≤40`, and every `i=0,…,a+b+3`. It uses the inherited literal recurrence, asserts the exact labels returned by `path_for`, compares all row coefficients with the proposed uniformly scaled formula, and tests horizontal triples only when `i+5≤a+b-1` and `bi+3a≥ab`. For fixed row 3 these are precisely the three original polygon guards: the lower constraint is strongest at `i`, the upper constraint at `i+2`.

An independent enumeration of these integers, without importing or executing either research script, gives 444 fractions, 20,536 coefficient positions and 10,521 guarded triple starts. The polygon row interval is `ceil(a(b-3)/b)≤i≤a+b-4`. There are 6,019 tested positions below this interval and seven above it per fraction, or 3,108 trailing positions, totaling 9,127 exterior positions. This matches the recorded zero count. It is a domain/geometry accounting of the saved observation, not a new evaluation of coefficient support. There are 11,409 positions within the polygon interval. The four slope-region fraction counts are 126,79,79,160 respectively.

The separate seed experiment covers coprime `2≤a<b`, `7≤b≤150`; counting pairs gives 6,702, matching its receipt. Its saved script tests six coefficients and four adjacent gaps. Neither this finite coprime seed sample nor the literal source sample is substituted for the universal Lean theorem, which covers the larger natural parameter domain for the seed and all actual paths with the stated bounds for the source.

## Accepted versions, selected replay and named axiom closures

The validation supplement binds all ten new mathematical sources to their final successful build snapshots, object hashes, archived/current copies and successful selected replay receipts. Their explicit declaration count is 60 theorems and 30 definitions. There are 31 ordinary build attempts: 12 successes (ten mathematical modules and two Audit modules), 17 compiler errors and two timeouts. All 19 rejected attempts are retained and listed. Sixteen error snapshots differ from the corresponding final source bytes, including some versions of the still-unaccepted MomentEval draft. One timeout is superseded by the successfully accepted Scaled source. The remaining error and timeout match the final bytes of the two unbuilt candidate files. Those two drafts remain explicitly pending as research files; they are neither accepted modules nor active executions.

There are 22 successful union replay invocations and no rejected worker 111 replay. Eighteen are recovery unions selecting 56 old modules; four select the ten new modules as groups of seven, one, one and one. Each of the 66 targets is selected once within worker 111. The definition-only Seed module is explicitly selected and has eight definitions; its empty theorem list makes its named-axiom-audit flag vacuous. It does not provide eight printed theorem closures. The 60 new printed theorem closures are the disjoint union of 53 from `MarkovAuditPartialM13D` and seven from `MarkovAuditFinalM13D`; the Final output alone covers seven. All sets are within the permitted axioms: 49 use `propext,Classical.choice,Quot.sound`, nine use `propext,Quot.sound`, and two use `propext` alone.

The old 58-module inventory contains 402 theorems and 474 definitions. All 52 modules missing successful selected replay at the worker 110 cutoff are selected successfully now. Four of worker 110's six successful targets are selected again: `MarkovCycleGeFour41MCFC`, `MarkovCycleGeFour43MCFC`, `MarkovFourthAllCyclesMCFC`, `MarkovResidualFifthMCFC`. The remaining two, `MarkovCycleAssembly43MCFC` and `MarkovSmallNumerator43MCFC`, reuse their successful worker 110 receipts. Thus the new recovery selections comprise 56 modules, 374 theorems and 420 definitions; the two reused-only targets contribute 28 theorems and 54 definitions. No inherited mathematical source is rebuilt or freshly axiom-printed in worker 111. The old 402 closures reuse the three worker 110 Audit receipts. The old 16 unbuilt drafts remain excluded.

The last missing old-target receipt is `replay-1792104086879778000.json`, selecting SmallNumerator32, SmallNumerator41 and TwoGaps. Its estimated return is **2026-10-15 22:41:38.095358 UTC**, from its start stamp plus saved duration; its mtime is 22:41:38.096666. All 52 missing targets are covered by then. The ten new selections finish, respectively, at estimated 22:50:43.341228, 22:54:27.130057, 22:57:00.227039 and 22:58:21.010546 UTC. These timestamps belong to worker 111 and do not upgrade worker 110's original cutoff.

## Replay method and imported trust boundary

The retained method review finds no method weakening or new bypass. Every worker 111 replay invokes the inherited `ReplayWideMCFC` with `-s 131072`. The driver source hash remains `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2`, matching its worker 110 archive and before111/preservation records. Its already reviewed change is the original batch replay body called through a joined `IO.asTask`, with result/error propagation and the larger stack. No driver edit is recorded in worker 111.

The Python wrapper is rewritten and no longer includes a per-receipt driver hash. The driver binding consequently rests on the retained source/archive/before/preservation evidence, not a nonexistent receipt field. Worker 111 receipt filenames are stamped before invocation, whereas the reused worker 110 union names are stamped after invocation; this audit uses the proper convention for each. Wrapper acceptance does not itself require a build receipt or axiom policy before running replay; the supplementary audit independently checks those bindings for the accepted results.

The static resolved source graph has 1,420 local nodes, with no unresolved local source or cycle. Every selected union has a transitively target-free imported base, no explicit selected/base name collision and no duplicate selected declaration. Neither new unbuilt draft nor any old unbuilt draft enters a checked base. The seven-new-module union imports 100 local source nodes; SourceMoments, Scaled and ThirdSource import 73,105,109 respectively. These are imported source counts, not fresh replay counts.

The recovery scheduler uses alphabetical groups and concurrent processes, not dependency order. Thirteen of its 18 invocations begin while some imported recovery modules still lack their first successful replay. In particular the first seven-module recovery, which includes the public fourth-slice and root reduction assemblies, imports 47 such modules. All eventually receive selected coverage; the public assembly's early replay is not repeated after all those dependency replays finish. The four new-module unions have their relevant earlier replay dependencies completed at invocation. Eventual full selected coverage of the 58-module set and the imported trust boundary at each particular invocation are distinct facts.

As before, this is retained alternate Lean replay with inherited compiled imports, not a fresh rebuild of the complete source tree or an official checker result. Static source checks do not establish invocation-time binary import identity or enumerate every generated/private declaration. Existing replay limitations concerning constant-map overwrite, already-imported theorem matching and unsafe/partial/axiom handling remain; source/name checks find no explicit selected/base collision here, conditional on imported objects corresponding to the checked sources. No whole-root proof follows from this method evidence.

## Finalization, preservation and cutoff chronology

All 138 controller-recorded artifacts match archive and current bytes. The 136 indexed entries all match; the two deliberate exclusions are the index `artifact-verification.json` itself and `last-verification.json`. No extra current worker 111 artifact or replay receipt was observed. Reconciliation verifies all 328 inherited worker 110 artifacts, including the already separately preserved late closing documentation/interruption evidence, without changing their original timing classification.

The initial preservation inventory has 2,602 entries because setup accidentally included this worker's newly created checkpoint. That checkpoint was absent from before111 and its creation/update events are retained. The first finalizer correctly rejected its changed bytes. The corrected finalizer records that own checkpoint separately in `own-checkpoint-updates.json` and verifies all **2,601 prior inputs** unchanged; it does not exempt a prior artifact. Both subsequent successful finalizer outputs match the final summary. This is an inventory repair, not a new proof check or an ignored inherited change.

The root source remains SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The canonical contract hash remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc` using sorted compact JSON with `ensure_ascii=True`; the raw contract bytes hash to `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`. These are different specified hash domains, not a contract change. The 19 explicitly checked inherited mathematical/semantic source boundaries all match before111; ten new source hashes match archive/current/validation. Inherited imports are not thereby freshly rebuilt.

Controller timing, UTC on 2026-10-15:

| Event | Time |
|---|---|
| Worker start | 22:29:30.215185 |
| Last new selected replay, estimated return | 22:58:21.010546 |
| Last verification artifact mtime | 22:58:59.857108 |
| Final report file mtime | 22:59:14.466466 |
| Worker finish | 22:59:30.043701 |
| Nominal 1,800-second deadline | 22:59:30.215185 |

The outcome is completed, elapsed 1799.828516 seconds, about 171.484 milliseconds before deadline. A final JSON report and `turn.completed` are retained. There is no late proof receipt, post-deadline artifact or unmatched foreground invocation in the observed records. The activity byte count 765,147 equals 764,913 event bytes plus 234 stderr bytes from a failed documentation patch; it is not an unexplained event tail. No OS process state is inferred beyond those retained event records. The final validation stability pass found zero changes across 3,474 inputs at 23:08:51.053521 UTC, and the method pass found zero changes across its 143 hashed inputs.

Worker 110's missing replay is therefore settled by subsequent successful source-bound selections. Its historical six-pass cutoff, timeout/report-null outcome, rejected and interrupted larger attempts, stale finalizer and separately preserved late closing files remain as previously audited. The full conjecture remains unresolved.

## Audit evidence bindings

The mathematical review is a static source/correspondence audit; the finite supplement counts domains only. Retained compilation, alternate replay and named axiom-print results are reported from saved records, not freshly executed by this audit. The inherited mathematical/root scope from the worker 110 main audit is retained at SHA256 `74da40c9f02765c9cfcf0320121963e729d7385290d19ebe8e8c2df791115832`.

All following files are under `/private/tmp/math_gkm_godel_20261013/`:

| Supplement | SHA256 |
|---|---|
| `markov_worker_000111_mathematical_source_hashes.json` | `2864ba844a44d25b81ee653fbad164db5017a40c78be1e57d8c9e651de0e6507` |
| `markov_worker_000111_source_structure_audit.json` | `19da21c2883d5b974fad1447651dc3a70b9a27f5a25548c98046f78fdf4e85fa` |
| `markov_worker_000111_finite_domain_audit.json` | `1c66bf815e5853d0432eb51bc643b9cd5517134cac655e6d567c8a3bf9ce280f` |
| `markov_worker_000111_validation_audit.md` | `9024ce246f1e2852109abebff122ef03af9010bd9dffde359c53d0685f90ba9f` |
| `markov_worker_000111_validation_evidence.json` | `dde75ab371911d3136529932f9f6d1849f1379a997050e15ed25da370391f7b6` |
| `markov_worker_000111_replay_method.md` | `82eea20f1cd241493575458977ec33eacc04fecd9c92c8038a37f0881097fabd` |
| `markov_worker_000111_replay_method_evidence.json` | `60d33c73a7b3dd6ca8dfab8ae637f6a12f6901128b4023d07adc4bc9c7670bfa` |

The final assembled source `research/MarkovHorizontalThirdSourceM13D.lean` has SHA256 `38f08f2abf323197dc06b57341c746e9572e64057ad649555fd31a5491133234`. These hashes identify the exact artifacts reviewed; they do not assert a whole-source rebuild or full-root completion.

