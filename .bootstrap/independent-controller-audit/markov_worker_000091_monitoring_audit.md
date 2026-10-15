# Independent monitoring audit: worker 000091

Request: `0b212317001348aaa31bde36d93913b1`. Reviewed 2026-10-15. Read-only review of the completed/timed-out worker's mathematical statements and retained records. No project file, proof, build, replay, experiment, finalizer, proposer or active successor was changed, run, completed or advised. Independent calculations were limited to source/JSON parsing, hashing and counting the recorded finite input/index domains. This is not a fresh full published-source correspondence or historical-novelty audit.

**Mathematical finding:** the final source proves the actual raw fourth-slice inequality on the interval of second-coordinate indices `j,j+1,j+2` with `5≤j` and `j+2<n`, for every mixed source with predecessor denominator at least five. All formula and gap premises are discharged. A precise residual equivalence removes exactly this region. The lower indices and larger proposed interval are excluded drafts, not consequences of their written proof attempts. Execution/finalization status has a separate timeout boundary, detailed below; no full-root completion is asserted.

## Exact raw indices and scope

For arbitrary `n : Nat`, `rest : List Bool`, let

```
path = replicate n true ++ false :: rest,
c = (frame rest).mid.b,  r = (frame rest).mid.a,
a = (frame path).mid.a,  P = (frame path).mid.p,
s = a+4.
```

`source_fourth_initial_lcK0B` assumes precisely

```
c≥5,   i,j : Nat,   i+j+2=s,   5≤j,   j+2<n,
```

and concludes

```
coeff P i (j+2) · coeff P (i+2) j ≤ coeff P (i+1) (j+1)^2.
```

To fix the indexing unambiguously, write `b_k = coeff P (s−k) k` on this natural slice. The sequence triple `(b_j,b_(j+1),b_(j+2))` is exactly

```
( coeff P (i+2) j,
  coeff P (i+1) (j+1),
  coeff P i (j+2) ).
```

The theorem displays the endpoint product in the opposite order, which is the same inequality. Its starting coefficient is **not** `coeff P i j`. All three points have total degree `a+4`. The strict upper bound is `j+2<n`; neither `j<n` alone nor `j+2<n+2` is the accepted raw-inequality scope. The interval is nonempty only once `n≥8`.

The theorem has no polygon, positivity, nonzero-support, fitted coefficient, assumed source-membership or auxiliary inequality premise. Natural zero coefficients remain included. It therefore applies to all polygon-valid triples in this stated interval. It has no fixed bound on `n`, predecessor path, numerator or denominator. Its restriction to mixed paths and `c≥5` remains explicit; it does not establish all fourth-slice positions, `c=2,3,4`, all directions or the full conjecture. This is genuine progress beyond the previous bounded-run fourth-slice coverage, not merely another conditional coefficient formula.

## Completed mathematical chain

`fourthNumerator_sub_dvdK0B` proves, over any commutative ring, that changing the polynomial-expression argument from `Z` to `W` changes the numerator by a multiple of `Z−W`. It uses the already proved ring-map law and ordinary polynomial evaluation. Consequently `fourthNumerator_coeff_initialK0B` proves equality of the `Z=X^n` and `Z=0` numerator coefficients for every `k<n`. Combining this with the actual source binomial theorem gives `source_fourth_initial_binomialK0B` for `j<n`, under the same actual-path, `c≥5` and total-degree conditions. No analytic specialization or extra nonzero denominator is assumed.

The zero-`Z` local third/fourth numerator theorems quantify over arbitrary commutative rings and all Boolean positions. They prove dependence only on the second bit. The moment lemmas then reduce the exact Boolean moment to `c f(false)+r(f(true)−f(false))`, without assuming chamber statistics or reducedness. `fourthNumerator_zeroK0B` proves the compact identity

```
fourthNumeratorBC N 0 x c r = fourthLowPolyK0B c (N*c+r) x
```

for arbitrary ring elements `N,x` and all natural `c,r`. The right side has thirteen explicitly defined coefficient polynomials in `c` and `H=Nc+r`. This is a proved compact zero-`Z` representation, not acceptance of an earlier timed-out draft merely because it had a similar intended statement.

The convolution lemmas retain the zero terms: `chooseShiftSevenK0B j k` is zero for `k>j`. The falling-factorial identity requires `k≤j+7`; since the compact numerator has degree at most twelve, `j≥5` is exactly the sufficient stated bound used in the shape conversion. `fourthShape_convolutionK0B` proves the constant factor 315, and the raw source bridge then proves

```
7560 · coeff P i j = fourthShapeK0B c (n*c+r) j
```

for `i+j=a+4`, `c≥5`, and `5≤j<n`. The factors `24`, `315` and `7560=24·315` are constant across the slice, not coefficient-index-dependent normalizations. The polynomial shape is over ℤ and has 92 explicit terms.

The auxiliary `fourthShape_logConcaveStrongK0B` proves adjacent log-concavity for arbitrary integers `c,H,J` under `c≥2`, `J≥6`, `H≥cJ+1`. Its weaker corollary uses `H≥c(J+1)`. The proof substitutes nonnegative slacks `C=c−2`, `R=H−cJ−1`, `T=J−6`; decomposes the three shape values as quartics in `R`; proves nine exact coefficient identities; and proves their nonnegativity. Static counting of the explicit certificate monomials gives `117+96+77+60+45+32+21+12+5=465`, with no negative literal coefficient. This count is bookkeeping, not a replacement for the retained Lean identity/nonnegativity proofs.

The final source theorem applies the shape bridge at the three second-coordinate indices `j,j+1,j+2`, uses center `J=j+1`, and discharges `H≥c(j+2)` from `H=nc+r`, `j+2<n` and natural nonnegativity. It then cancels the common factor 7560. It does not leave the shape formula, slack conditions, gap identity or source classification as assumptions.

## Residual and unfinished stronger claims

`InitialFourthRegionK0B path i j` is the existential predicate giving the **same** actual path decomposition and the same conditions `c≥5`, `i+j+2=a+4`, `5≤j`, `j+2<n`. There is no change from starting index to center index inside this definition.

`root_iff_coreK0B` rewrites the previously proved exact `root_iff_coreN6604`, retains its horizontal and vertical clauses unchanged, and adds only `¬InitialFourthRegionK0B path i j` to the remaining diagonal clause. All original polygon guards, upper/lower total-degree bounds, `a+2≤b` and `(a+5≤i+j+2 ∨ 4b<5a)` remain. The reverse implication fills the excluded region by the new raw theorem; the forward implication merely restricts an existing inequality. Thus it is an exact equivalence with an **unproved** residual, preserving all endpoint clauses through the inherited equivalence. It does not prove the residual or the root.

Four sources remain explicitly pending/excluded: `MarkovFourthBoundaryK0B`, `MarkovFourthGapK0B`, `MarkovFourthShiftK0B`, and `MarkovFourthSourceK0B`. Their written intended statements cannot enlarge the accepted interval. In particular, `source_fourth_initial_allK0B` in the last draft would cover `j<n` without the lower bound, but it is not an accepted result here.

Accepted square-zero local/moment identities and `fourthNumerator_xsq_dvdK0B` in `MarkovFourthDivBaseK0B` do prove divisibility of the numerator difference by `x²` in an arbitrary commutative ring. This is separate from combining that result with the `Z` factor to obtain `X^(n+2)` after substitution. The latter combination and shifted coefficient/source adapters are in the excluded Shift source. The DivBase module's copied heading mentions degree `n+2`; its actual accepted declaration proves only the generic `x²` divisibility. The main mathematical prose correctly distinguishes the unfinished combination, and this audit does not adopt the stronger heading as a theorem.

## Finite evidence

The experiment reads the newly generated compact coefficient/shape tables and compares them with the inherited exact lower-cut matrix recurrence on mechanical source words. It does not directly evaluate Lean terms or rerun the original literal bivariate source recurrence. No research computation was rerun in this audit.

The recorded input list agrees exactly with all coprime `1≤r<c`, `5≤c≤17`, runs `0,1,2,4,7,8,12,20`, plus runs `32,64,100,127` at predecessor pairs `(5,2),(7,3),(11,7)`. Independent enumeration gives **732 cases, 7,293 coefficient positions, 4,173 shape comparisons and 5,829 polygon-valid triples**, matching the records. The coefficient comparisons range through `j<n+2`, which is wider than the accepted initial coefficient theorem; the finite LC comparisons use starts `j<n`, also wider than the accepted raw theorem.

The saved experiment records 729 differences at the first shifted coefficient position `j=n+2`. These are failures of the uncorrected compact pre-shift formula at that position, **not counterexamples to raw log-concavity or the source conjecture**. They establish no universal first-shift assertion. Boundary gap and alternative-slack symbolic probes remain finite/generated certificate evidence except where particular identities have their own retained successful Lean checks. No accepted source theorem is inferred from the count or generation of a certificate alone.

## Retained execution boundary

The independent retained-record audit found **193 controller/current/archive hash bindings**, all matching, with no unarchived current files or post-controller-finish changes. The **52 ordinary build receipts** comprise 28 successes, 17 failed builds and seven wall timeouts. The successes are 26 final selections (25 mathematical modules plus Audit) and two superseded versions (old Audit and old GapPart4). All final mathematical sources have matching successful builds; final Audit directly prints all **51 named theorem closures**, using only subsets of `propext`, `Classical.choice` and `Quot.sound`. The four excluded drafts have no object or successful final check. No rejected attempt is counted as an accepted theorem.

The first successful union receipt, `kernel-union-1792070466611789000.json`, covers **24 final mathematical modules / 50 theorems plus old Audit**, including the actual raw inequality. Its completed event is 256, before the deadline. Audit was rebuilt concurrently to add Residual, so the old source hash alone does not bind the object read by this first run. However, the driver reports **two** deduplicated inherited imports, matching the old Audit header; the known final header would produce **three** and transitively reimport twenty selected modules. This retained header count is strong evidence against that specific contamination route under ordinary source-to-object correspondence. It is not an invocation-time object digest or load timestamp, and no immutable old Audit object is retained. The other selected mathematical source/object versions were stable. The source base for the old-Audit interpretation contains 121 local modules without selected target/name overlap or cycles.

The second successful receipt, `kernel-union-1792070481020777000.json`, covers **Residual plus final Audit**, adding the residual equivalence. Its SHA-256 is `403638969d37d89491557873a28afebdab5e3517c26ded4dfefcf3bf037f5480`. This receipt is already present in the controller index and original archive. The command starts at event 257, but no completed event follows. Its filename timestamp is **13:21:21.020777 UTC**, **0.321796 seconds after** the **13:21:20.698981** deadline and 5.983321 seconds before controller finish; its mtime is 0.322297 seconds after the deadline. These are receipt-writing times, **not a separately recorded Lean-return time**: the record establishes a post-deadline retained success receipt, but does not establish on which side of the exact deadline Lean itself returned. Its source base has 502 local modules and no selected target/name overlap or cycles; expected and observed inherited-import count is 26. This is the sole post-deadline artifact, not a late unarchived result.

The controller finishes with a timeout at **13:21:27.004098 UTC**, elapsed 1806.305117 seconds. The finalizer was **never invoked**. The evidence directory has no `validation.json`, `preservation.json`, `operational-observations.json`, `source-review.json`, `artifacts.json`, `artifact-verification.json` or `report.json`; controller `final.json` and a `turn.completed` event are also absent. The worker's proposed finalization text does not create these records. All 166 initial reconciliation checks match; the supporting auditor also found all 175 initial hashes unchanged, but that overlapping observer check is **not** a worker-produced final preservation receipt. No missing check or finalizer was completed by the auditors.

Both replay drivers remain unchanged. These are alternate kernel union replays, with the retained race/timing qualifications above, rather than official CLI success or a fresh whole-source rebuild. The driver collects all selected object constants, including helpers and definitions, and uses the existing kernel replay machinery; the usual unsafe/partial skips, axiom handling, duplicate-map behavior and possible imported-theorem body skips remain material. The source import checks exclude the identified target contamination routes, but do not enumerate the actual binary/generated/private constant inventory. Imported compiled dependencies remain trusted. Source hashes and matching builds are checked before invocation; driver hashes are recorded afterward; per-invocation object digests are absent.

Supporting audits, read for this mathematical report:

- [Retained-validation audit](markov_worker_000091_validation_audit.md), SHA-256 `eb8086c4a5d6bc41fd5def5f773b9cf08accf31cce3212ed08f62df21559260a`.
- [Validation evidence](markov_worker_000091_validation_evidence.json), SHA-256 `cc165284a11281e746460023856c941d8fadc9191b82cba0af93e79fd3cd377c`.
- [Replay-method audit](markov_worker_000091_replay_method.md), SHA-256 `fe9372befcbfec830d2369be8111b6e60fc76f7e08f1885975a9ccec2cb822f2`.
- [Replay-method evidence](markov_worker_000091_replay_method_evidence.json), SHA-256 `21edc5e2014899a1b1d779c45128d3a7e60bc9bcb677fbe542431899f080b667`.

The supporting auditor rechecked 1040 combined input hashes unchanged at `2026-10-15T13:35:25.026366Z`. These reports are an independent reconstruction of retained evidence, not replacement worker manifests or controller admission.

Selected final source hashes read independently in this audit:

| File | SHA-256 |
| --- | --- |
| `MarkovFourthInitialLCK0B.lean` | `b6e16b10faef775fa3bdb06740daa8bebb5db7f1bb593ca07f35ddb1f8b0eff6` |
| `MarkovFourthTruncateK0B.lean` | `4655f7539a217f8c865363e50383e5c061d380eca3c258b7c802feeb3d58a7ec` |
| `MarkovFourthLowK0B.lean` | `214096f2431231d8aad4e3b440d9d4f8fadc89346e9c238dc7b4c099f56f14e1` |
| `MarkovFourthShapeK0B.lean` | `16cc3e765fced473c57d3ffa8246bd7d908f76e1eff434b1aba5e14f9e53ef75` |
| `MarkovFourthGapFactK0B.lean` | `47dee96ce2b111ff9a49a6929d0bcb4c5f97ca34cd311c08a231d49f8f4f3b54` |
| `MarkovFourthGapStrongK0B.lean` | `155279573a57db3107c815596c97f3ab2ceb0e8f3abf5828e9fb950b212ca65c` |
| `MarkovResidualK0B.lean` | `bf2763f6ae940e43cdb05a1dddbdaf9afd0e5c67dc98d6c392a2a15c70630f7a` |
| `MarkovFourthDivBaseK0B.lean` | `a232ed261b6b0ddf286559d22dd054e5cad9f84aa0629a742ee264282d53df94` |

The accepted mathematical scope is a restricted but unbounded source-connected inequality and supporting identities, not the full conjecture. No proof strategy, repair or proposer feedback was supplied.
