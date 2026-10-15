# Worker 000083 independent mathematical monitoring audit

Read-only audit of request `fd72158c01ce41b48a159a8c0359decb`, completed on 2026-10-15. No project files were changed, proposer contacted, mathematical guidance supplied, active successor inspected, project code executed/imported, or proof, kernel or polynomial experiment rerun. Loop-domain/count arithmetic and source/receipt hashing are audit checks, not new research.

## Conclusion and exact source scope

The final Lean statements support the claimed partial result: **the complete polygon-valid third lower diagonal is proved for every actual mixed source path whose initial run has length two or three, without a predecessor-cycle restriction. Combined with inherited results, the same slice is proved for every source path with `a+4≤b`.** Neither result proves the complete conjecture.

Write `m=(frame path).mid`, and `A(i,j)=coeff m.p i j`. For natural `i,j`, the inequality is

`A(i,j+2)*A(i+2,j) ≤ A(i+1,j+1)^2`, with `i+j+2=m.a+3`.

These are literal integer coefficients of the pinned source numerator in squared variables, with the third variable specialized to one. There is no factorial, degree-dependent or index-dependent normalization. The source bridge uses one common scalar six and cancels it from the squared inequality. Zero entries remain present.

`source_third_small_allFD` assumes `path=replicate n true ++ false :: rest`, `n=2 ∨ n=3`, the slice equality, and **only the original first-endpoint guard** `InPolygon m.a m.b i (j+2)`. It quantifies over every finite Boolean list `rest`. It has no bound on the denominator, no assumed formula, chamber or positivity premise, and no experiment as a premise. It covers every three-guard instance of the root in this family, but is not an unguarded all-index source theorem outside the polygon.

`source_third_largeFD` instead takes an arbitrary source path, `m.a+4≤m.b`, the same slice equality and the same first-endpoint polygon guard. It does not assume a path decomposition or a numerical classification of sources.

Both results concern direction `(1,-1)` at total degree `a+3`, the third **lower** diagonal. They do not establish all diagonals or either horizontal/vertical direction. The endpoint fractions `0/1` and `1/1` are separate clauses of the unchanged root; the residual equivalence retains them through the inherited exact equivalence. No new global homogeneous-variable or rational-coverage theorem is asserted here.

## Exact coefficient and chamber proofs

For `path=replicate n true ++ false :: rest`, let `c=(frame rest).mid.b` and `r=(frame rest).mid.a`. The inherited, proved index identities are `a=cn+r`, `b=c(n+1)+r`, and `0<r<c`. For `c≥4`, the actual source coefficient bridge identifies six times `A(a+3-j,j)` (where the natural indices sum correctly) with the coefficient of `thirdRunPolyADB2 n c r`.

The two fixed-run factor identities are universal identities over integer parameters. They multiply the explicit degree-at-most-11 or degree-at-most-14 polynomial by `(1-X)^6` and identify the exact inherited numerator, including all delayed bands. The proof uses ring identities. `small_poly2FD` and `small_poly3FD` then cancel the nonzero polynomial `(1-X)^6`; the nonzero proof evaluates its constant coefficient. Their only cycle exclusion is `c≠2`. This is exact polynomial cancellation, not interpolation, numerical division or an analytic-series convergence claim.

The coefficient functions use natural truncated counts transported exactly to integers:

`q=max(2r-c,0)`, `t=min(c-r,max(3r-c,0))`, `u=max(3r-2c,0)`.

`small_lc2FD` proves the auxiliary coefficient inequality for all integer `c≥4`, `1≤r<c` with these exact count values and every natural starting index `j≤9`; `small_lc3FD` gives `j≤12`. In particular these parameter inequalities do not require coprimality; actual sources supply the required inequalities. Their coefficient adapters reach indices 11 and 14 respectively, including zeros. The source polygon lemma proves `j≤3n+3`, so those finite index ranges cover every guarded source triple for the two fixed runs, while the source parameters remain unbounded.

The four slope chambers are `3r≤c`, `2r≤c≤3r`, `c≤2r ∧ 3r≤2c`, and `2c≤3r`. Both middle chambers use two nonnegative parameters with shifts `(2,0)`, `(1,1)` or `(0,2)`; `c≥4` supplies the exhaustive small-parameter alternatives. Each outer chamber separates its boundary parameter equal to one from the parameter at least two. The combines explicitly prove all max/min branches, cast equalities and shifted-parameter nonnegativity. Equality cases are included, not discarded.

The 20 certificate modules contain 230 specific adjacent-gap identities: ten starting indices for each of ten run-two parameter regions and thirteen for each of ten run-three regions. Their statements quantify over nonnegative integer parameters. Each displayed gap is proved equal by `ring` to a polynomial with nonnegative coefficients, whose nonnegativity is proved in Lean; the chamber theorem then enumerates the finite starting index. These are universal parameter certificates rather than 230 numerical examples. The executable symbolic search that produced them is not a formal premise.

## Exceptional predecessor cycles

When `c<4`, `0<r<c` exhausts exactly `(c,r)=(2,1),(3,1),(3,2)`. `source_third_small_allFD` performs this branch explicitly. It uses the inherited all-cycle source identity for `correctedThirdRun8BBB`, rather than using the large-cycle identity outside its hypotheses.

The actual corrections are retained:

- for `c=2`, subtract `12*X^b*(firstRunPolyADB2 n c r+1+X)` from `thirdRunPolyADB2`;
- for `c=3`, add `6*X^b`;
- for larger `c`, no correction.

The new identities `small_poly_all2FD` and `small_poly_all3FD` also retain the additional term in the uncorrected `c=2` polynomial, respectively `6*firstRunPolyADB2*X^7` and `6*firstRunPolyADB2*X^9`. Thus the small source cases do not silently drop either layer of correction.

Six exact corrected polynomials are proved. Their degrees are 8, 10, 11 for run two and 10, 13, 14 for run three, ordered by `(2,1),(3,1),(3,2)`. The corresponding inequalities quantify over **every natural `j`**. Explicit coefficients handle the finite range; beyond it, the right endpoint coefficient is proved zero, so the inequality follows from a square being nonnegative. The all-cycle transport supplies all source coefficient identities without a leftover hypothesis. The final source theorem still states its common polygon guard, although these exceptional branches prove more than that guard requires.

## From paths to the source condition and coverage accounting

`source_third_largeFD` invokes the proved `split_first_false487` decomposition. A pure-right path has `b=a+1`, so it cannot meet `a+4≤b`. For a mixed path, the proved index identities give `b-a=c`, hence the source condition gives `c≥4`. The proof then handles `n=0,1` by inherited source results, `n=2,3` by this batch, and `n≥4` by worker 82. There is no unproved classification or formula between the path premise and the conclusion.

The substantive gain over the recent complete-slice theorems is the missing run-two/run-three source families with unbounded predecessor denominator; these were excluded by worker 82's `n≥4` restriction and the earlier low-slope theorem. The large-source statement provides a simpler combined source-index condition. This accounting does not label every one of the 281 local declarations, every fixed exceptional source, or every auxiliary coefficient as a new raw region. In particular the two `c=2` cases have source indices `(5,7)` and `(7,9)`, putting the third lower slice at previously covered upper-diagonal depths three and five. Their explicit corrected certificates consolidate those cases. This is not a publication-novelty assessment or an exhaustive comparison with all earlier finite cases.

## Exact residual and remaining obligations

`ShortMixedFD path` is the purely combinatorial predicate

`∃ n rest, path=replicate n true ++ false::rest ∧ (n=2 ∨ n=3)`.

It contains no coefficient inequality or conjecture. `Interior63FD` retains the inherited horizontal/vertical clauses, original three polygon guards, top-degree bound and previous diagonal lower-degree/low-slope restrictions. Its only additional diagonal antecedents are

`a+4≤i+j+2 ∨ b≤a+3`, and `a+4≤i+j+2 ∨ ¬ShortMixedFD path`.

Since the retained lower bound is `a+3≤i+j+2`, these remove exactly the newly proved third-slice cases: either `a+4≤b` or a short mixed path. They do not delete other degrees or directions. The inherited `LongLargeE2` cases are included by the new large-source condition through the proved index identities.

`root_iff_interiorFD : Conjecture63 ↔ Interior63FD` is an exact equivalence. The forward implication restricts the old residual. The reverse implication splits on the degree being `a+3`, the large-source condition and the short-mixed predicate; it uses the corresponding proved raw source theorem for the excluded cases, and the residual premise otherwise. No branch assumes the root, the residual's truth, or an unproved source formula. The residual is still unproved. This is not a proof or refutation of the full conjecture, nor a claim that the predicate is the minimal possible list of all historically unresolved inequalities.

## Finite evidence and unproved two-cycle tail

I matched the recorded small-run experiment's parameter list and counted only its loop domains, without evaluating any polynomial. For `n∈{2,3}`, `4≤c≤40`, `1≤r<c`, `gcd(c,r)=1`, the saved list has exactly 972 distinct source inputs, 82,500 formula-coefficient positions, 10,206 triples satisfying the three polygon guards, and 1,472 literal-recurrence coefficient positions in the `c≤10` subrange. All counts match and the saved failures list is empty. Many formula checks concern zero tails; they are still finite checks, not separate theorem claims.

The symbolic output records exactly the 230 chamber/index combinations described above, each with zero negative monomial coefficients. Their later Lean certificates, not this file alone, establish the formal inequalities.

The two-cycle tail probe concerns `(a,b)=(2n+1,2n+3)` and proposes four raw coefficients `440n-532`, `120n-92`, `22n-8`, `2n` at `(3,2n+1)`, `(2,2n+2)`, `(1,2n+3)`, `(0,2n+4)`. It records symbolic gap expressions after the substitution `n=N+4`, 148 backward-source comparisons for `4≤n≤40`, and 20 literal comparisons for `4≤n≤8`. The prose and saved output explicitly say the universal actual-source coefficient extraction is **unproved**. No new source theorem for this tail is admitted in this batch. Positive symbolic gaps and finite agreement are not substituted for that missing identification. This audit supplies no completion argument or next-step advice.

## Validation and provenance

The independent [validation audit](markov_worker_000083_validation_audit.md) and [replay-method audit](markov_worker_000083_replay_method.md) confirm all final claims below from retained records; no validator or replay was rerun.

- All **191** controller after-hashes match current bytes and worker-83 archive bytes. All **189** manifest entries also match. The manifest and its verification file are the two additional controller entries. All 33 final source and object bindings match. No worker-83 file is late or unarchived, and no pending command item remains.
- All **32 mathematical modules plus Audit** have successful final-source builds. Five successful unions cover the mathematical modules exactly once in groups of **4/11/11/3/3**; the Audit separately passes the established individual replay driver. Every selected target build precedes its union. `MarkovResidualFD` is explicitly a target of the final group, not just an imported dependency.
- The **44 ordinary receipts** comprise 33 successful builds, ten failed builds and one successful Audit replay, with no timeouts or redundant successful build versions. Rejected Poly2/3 and Cycles2/3 attempts are retained and superseded by matching final-source successful checks. Saved receipt snapshots and event payloads match, with only the documented stdout/stderr prefix truncation.
- All **281** source theorem names directly match the inventory, individual `#print axioms` requests, full successful Audit output and validation entries. Every closure is a subset of the standard `propext`, `Classical.choice`, `Quot.sound`. This is direct named-theorem coverage, not a count extrapolated from a few transitive closures.
- All **110** preservation rows and 23 initial reconciliation rows match. Worker 82's separately checked 127-entry manifest also still matches. These lists overlap and are not additive counts of distinct preserved inputs. The pinned root and canonical contract remain unchanged; mathematical resolution is false and completion is null.

There is one successful finalizer invocation, events 224–225, with no failed or interrupted finalization. A rejected documentation patch and its successful corrected replacement are separately recorded; neither is a mathematical or finalizer failure. Manifest verification is timestamped **2026-10-15 09:37:07.619799 UTC**, 236.084674 seconds before the deadline. The final agent JSON and turn-completed event are retained. `final.json` equals the controller report and final agent JSON; the more detailed `evidence/.../final-report.json` is separate wording with its own matching hash. Controller outcome is **completed** at **09:37:37.283641 UTC**, elapsed **1593.579169 seconds**, with 206.420832 seconds remaining. There is no timeout qualification for this worker.

The validation is **alternate-driver kernel replay**, not official-CLI success or a fresh whole-source rebuild. The established individual driver and union driver are unchanged. Static source-import/name checks on all five groups find no selected target in the imported base, duplicate target name, explicit target/base collision, source cycle or forbidden-token occurrence. The final residual group is included. Imported earlier-group results and inherited compiled dependencies remain trusted imports. The union driver collects all available target constants, including helper definitions and generated declarations, rather than selecting only the 281 theorem names.

The worker-83 wrapper hashes target sources **before** invoking replay and requires a successful matching build receipt; it records the unchanged driver hash afterward. This differs from workers 81–82's source-after-run wrappers. No invocation-time object digest, binary import-table inventory or private/generated-constant listing is supplied. The accepted replay behavior still skips unsafe/partial declarations, admits axiom declarations as axioms, and can skip the proof-body comparison of an already imported equal theorem; static closure/name checks found no selected-target route to that last behavior here. Pending recursion does not turn unfinished declarations into proof assumptions. These checks support the retained per-group procedure under its import boundary, not a fresh binary proof of every inherited dependency.

Supporting audit hashes:

| File | SHA-256 |
|---|---|
| `markov_worker_000083_validation_audit.md` | `12b853a1be1097729f342ab9783a7cf823b0e0fab27710a53465c8d07e8b80d1` |
| `markov_worker_000083_validation_evidence.json` (541 stable input hashes) | `d9efec955f7587ce30483d300c4d6bef517c6ed21499359b9c4c3cb07c339480` |
| `markov_worker_000083_replay_method.md` | `87455188c068f946edf602ee031e53423886b5a75a584e977185c437f69a3848` |
| `markov_worker_000083_replay_method_evidence.json` (364 input hashes) | `e762f6dd7033a40b95ee751e91d6f2c8c5b6b22dde5a808dffefcd3e02879ca5` |

## Principal final-source hashes

All 33 live `Markov*FD.lean` sources match their worker-83 archives: 32 mathematical modules and the Audit. Principal SHA-256 values:

| File | SHA-256 |
|---|---|
| `MarkovSmallAllFD.lean` | `2d1ff61ab6e6389e66db3537066cf39dc6ed6ce714d6c4a65587a566c7c4d286` |
| `MarkovSmallSourceFD.lean` | `75b2a39627accae24d230f050e6be278055c87c429d8174500ea82309f7bf703` |
| `MarkovThirdLargeFD.lean` | `12b9878c055af1a55b22cbae4e6fbe5b67443dcfe9b2d2978f8685e800bb7af7` |
| `MarkovResidualFD.lean` | `3a83bd555efdd19e8b1a2d39fd4f08cd04995835ec2f204fb1d4ddc581cf5989` |
| `MarkovSmallPoly2FD.lean` | `1139f5b96739e2aed4094a830e139537c2f7026950f8ff8ed1dec4134fedd0f9` |
| `MarkovSmallPoly3FD.lean` | `77bd5846f5e929ce5cc53e2a9759ac8b8ee3fc7d10243e372d5607b051700c84` |
| `MarkovSmallCycles2FD.lean` | `f81825dff3befbc6a9efcb8267db763a9540913eaf339e9ad5bbbae9c06cd23c` |
| `MarkovSmallCycles3FD.lean` | `ae92df4ece7c8e62f09f7adeda5f3e9a6bccf003ed4841fafc213aed8ebc4276` |
