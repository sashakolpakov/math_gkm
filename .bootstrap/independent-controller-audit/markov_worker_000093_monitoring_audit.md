# Independent monitoring audit: worker 000093

Request `cc599cf12cc74c9e84112aac7bc0f9ac`. Read-only review on 2026-10-15 of this timed-out worker's final mathematical sources and retained evidence. No project files, proofs, builds, replays, experiments or finalizers were changed, executed or completed. No proposer was contacted, no mathematical guidance was supplied, and no active successor was inspected. Independent calculations were restricted to text/JSON parsing, hashing and counting finite input/index domains. This is not a fresh whole-publication correspondence or historical-novelty audit.

**Mathematical result:** the actual raw first-shift inequality now includes the previously missing run length `n=4`, for every predecessor path of denominator at least five. A separate exact coefficient representation reaches all natural indices through `2n+2`. That representation is not a whole-block log-concavity proof; the gap and source-inequality drafts remain excluded. The exact residual still has an unproved conclusion. Local validation/finalization survived, but the controller outcome remains a timeout without a final agent report; the retained-record details are separated below.

## Actual raw inequality and index convention

For arbitrary `n : Nat`, `rest : List Bool`, write

```
path = replicate n true ++ false :: rest,
c = (frame rest).mid.b,   r = (frame rest).mid.a,
a = (frame path).mid.a,   P = (frame path).mid.p.
```

The source parameters obey `a=nc+r`, `b=(n+1)c+r`, and the reduced-frame theorem supplies `1≤r<c`.

`source_fourth_first_shiftCC` assumes exactly

```
c≥5,   n≥4,   i : Nat,   i+n+2=a+4,
```

and proves

```
coeff P i (n+2) · coeff P (i+2) n ≤ coeff P (i+1) (n+1)^2.
```

For the sequence `b_j = coeff P (a+4−j) j`, the ordered triple is

```
(b_n,b_(n+1),b_(n+2))
  = (coeff P (i+2) n, coeff P (i+1) (n+1), coeff P i (n+2)).
```

All three points have total degree `a+4`. The reversed order of the endpoint product changes nothing; this is not a triple starting at the coordinate pair `(i,n)`. The theorem has no polygon, positivity, nonzero-support, fitted-formula or auxiliary-gap premise. Zero coefficients remain included, and the original polygon-restricted cases follow. The predecessor and denominator are unbounded; the hypothesis `c≥5` remains essential to the claimed source scope.

The new mathematical case is **`n=4`**. The unified theorem delegates `n≥5` to the already proved worker-92 theorem. At `n=4`, the proof uses the exact convolution coefficients at indices `4,5,6`, not the inherited large-index shape at index four. The integer theorem `firstShift_four_lcCC` assumes only `1≤r<c`. It substitutes nonnegative slacks `C=c−r−1`, `R=r−1`, so `c=R+C+2` and `r=R+1`, and proves the corrected adjacent gap is an explicit 45-term polynomial with nonnegative coefficients. Its identity is checked by `ring` and sign by `positivity`. Static monomial counting confirms the 45 terms; the proof's validity comes from the retained Lean identity/sign checks, not that count.

The source adapter then invokes the inherited exact unshifted formulas at indices four and five and the corrected coefficient formula at six. All use the same scalar 24, which is canceled after applying the gap theorem. No correction or moment hypothesis is left undischarged. Together with worker 92's initial interval, the newly recorded proved region is `j<n ∨ (j=n ∧ n≥4)`. This does not establish the whole fourth diagonal, other directions or the full conjecture.

## Shift-linear identity: exact algebra and source scope

Let `F(N,Z,x;c,r)` denote `fourthNumeratorBC`. The local calculation is over an arbitrary commutative ring and assumes `Z²=0`, with `x` unrestricted. The third observable is checked for all eight Boolean triples. The fourth observable is split by its first two bits, each part checks all remaining bits, and the assembly exhausts the sixteen Boolean quadruples. The fourth expression then depends only on the first three bits. The split modules replace the unsuccessful monolithic attempt; the old timeout is not relabeled as a passing proof.

`fourMoment_threeCC` quantifies over every function `Bool → Bool → Bool → A` and natural `c,r`. It identifies the inherited four-letter moment of an observable independent of the fourth bit with its three-letter moment at the exact natural statistics `(2r−c)`, `min(c−r,3r−c)`, `(3r−2c)`. This is an algebraic identity about the defined moment expressions, not a claim about arbitrary words having source pattern counts. The subsequent linear-moment identities quantify over arbitrary ring-valued higher statistics and prove that those statistics cancel. The source branches are checked, rather than supplied as fitted assumptions.

`fourthNumerator_linearCC` consequently proves

```
F(N,Z,x;c,r) − F(N,0,x;c,r) = Z · G(N,c,r,x),   if Z²=0,
```

where `G=fourthShiftCC`, for all ring elements `N,Z,x` and natural `c,r`. Its definition combines exact first-order coefficients of the first through fourth moment expressions. The polynomial representation `fourthShift_polyCC` proves `G=shiftPolyCC`, with thirteen coefficients at powers `x^0,…,x^12` and the first two coefficients zero. The identity holds over arbitrary commutative rings; no denominator evaluation or analytic condition occurs. Claims about how higher powers of `Z` differ across chambers are exploratory symbolic observations, not an extra accepted theorem here.

Passing to the quotient by `(Z²)` proves that

```
R = F(N,Z,x;c,r) − F(N,0,x;c,r) − Z G(N,c,r,x)
```

is divisible by `Z²` without a square-zero assumption on the original ring. Separately, the inherited cubic-in-`x` numerator identity and the new exact identity `G=x²·shiftCorrection` modulo `x³` prove `x³|R`.

The generic `eval_shift_power_productCC` combines those divisibilities in **`ℤ[x][Z]` before substitution**. More generally, `Z^m|R` and coefficient factor `x^d|R` imply `x^(nm+d)|R(x^n)`: cancellation of the nonzero coefficient `x^d` forces each required low `Z` coefficient of the quotient to vanish. The proof does not multiply arbitrary specialized divisors. With `m=2,d=3`, this gives

```
x^(2n+3) | F(n,x^n,x;c,r) − F(n,0,x;c,r) − x^n G(n,c,r,x).
```

The earlier `x^(2n)` and `j<2n` identities are retained weaker formulations; the final accepted extension reaches `j<2n+3`. The natural cases `n=0,1,…` are not excluded from the coefficient identity.

## Exact raw coefficient and shape formulas

`source_fourth_block_extendedCC` quantifies over every natural `n`, actual predecessor `rest` with `c≥5`, and natural `i,j` satisfying

```
i+j=a+4,   j<2n+3.
```

It proves

```
24 · coeff P i j
  = convSeven(lowPoly(c,nc+r) + x^n G(n,c,r,x), j).
```

Thus the exact range is **`j≤2n+2`**, including natural zero coefficients, with no denominator cutoff. It is a finite coefficient sum using the coefficients of `(1−x)^(-8)`; the proof starts with the inherited actual-source binomial theorem and replaces each numerator coefficient in the finite sum. There is no convergence assumption or a nonzero specialization hidden in the extraction.

The shifted-convolution lemma removes the first `n` zero terms explicitly. The final shape adapter `source_fourth_block_shape_extendedCC` then requires

```
i+(n+k)=a+4,   5≤k<n+3,
```

and proves

```
7560 · coeff P i (n+k)
  = fourthShape(c,nc+r,n+k) + shiftShape(n,c,r,k).
```

The factor is uniformly `7560=24·315`. The falling-factorial conversion to `shiftShape` is proved only at indices at least five; the theorem keeps `k≥5` explicitly. It does not silently substitute that polynomial at small `k`. The broader convolution identity remains distinct from this restricted polynomial expression. Neither identity by itself is a log-concavity inequality.

## Residual and excluded claims

`InitialFourthRegionCC` uses the actual path decomposition, `c≥5`, the same triple equation `i+j+2=a+4`, and precisely `j<n ∨ (j=n ∧ 4≤n)`. `root_iff_coreCC` starts from the established `root_iff_coreN6604`, keeps the horizontal and vertical clauses unchanged, and removes only that proved region from the diagonal clause. It retains all three polygon guards and the old upper/lower degree and slope bounds. Its reverse implication fills the removed region using either `source_fourth_initial_allF2` or the unified first-shift theorem. Original endpoint clauses remain inherited through that exact equivalence. The residual is unproved; the block coefficient identities do not remove further points from it.

Sixteen whole-block/certificate/source-LC draft modules are excluded. They include `MarkovBlockPartsCC`, `MarkovBlockSmall1CC` through `Small3CC`, nine `MarkovBlockGap0CC` through `Gap8CC` modules, `MarkovBlockLCCC`, `MarkovBlockThreeLCCC`, and `MarkovBlockSourceLCCC`. Their written proof attempts or generated coefficients do not establish a universal whole-block gap or its source transfer. No active successor work is used to upgrade their status.

## Finite evidence and precise counting

Reading the experiment and independently enumerating only its domain gives **604 cases**, exactly matching the saved input list: every coprime `1≤r<c`, `5≤c≤16`, with `n=4,5,6,7,8,10,13,21`, plus `n=32,64,100` at `(c,r)=(5,1),(5,4),(7,3),(11,7)`.

The recorded evaluator compares the compact low numerator plus the stored shift-linear polynomial against the exact lower-cut recurrence on mechanical source words. It records **14,332 coefficient checks** for `0≤j≤2n+2`. The reported **5,052 shape positions** are a counted subset of those checks satisfying `j≥n+5`: the script does **not separately evaluate the explicit `shiftShape` polynomial** there. This is a scope qualification of the experimental label, not a defect in the separately proved Lean shape identity.

The experiment also records **3,844** polygon-valid raw LC triples with starts `n+5≤j≤2n`, and **74** valid run-four first-shift triples. The block triple tests exceed the accepted inequality scope and remain finite evidence. For sources with `b≤60`, it independently constructs the literal bivariate recurrence via the rational path and compares **3,844 full-slice coefficient positions**, including zeros. The equal numerical totals for block triples and literal coefficients are different tests, not the same set or a count of distinct sources. All five saved counts match independent domain enumeration. No coefficient computation was rerun in this audit.

The whole-block symbolic gap record contains 2,482 terms before substitution. Its four proposed nonnegative expansions have 4,095 terms for `r≥4`, and 819 each for `r=3,2,1`, on the declared domain `5≤k≤n`, `c≥5`, `1≤r<c`. These generated records are not accepted Lean gap proofs. The `run-four-probe.json` record is also an experiment; one of its candidate formulas was separately proved in the accepted n=4 theorem.

The recorded failure of the proposed factor `16(c−r)x²` for the **entire** shift-linear polynomial is exact symbolic experimental evidence rejecting that proposed simplification. It is not a source-conjecture counterexample or a new Lean refutation theorem. The accepted onset correction still has that factor at its own degree; the two statements concern different expressions.

## Retained validation, timeout and finalization

The retained-record audit finds **147 controller/current/archive bindings**, all matching, and **145 entries** in the `artifact-verification.json` file map, all independently matching. The two controller entries outside that map are the index itself and the archived temporary `compact-defs.lean`; this is an explicit inventory difference, not a hash mismatch. There is no separate `artifacts.json`. The worker's finalizer computes the file-map hashes once; the independent read-only audit provides the later comparison rather than crediting a second verification pass to the finalizer.

All **16 final mathematical-module entries plus Audit** have matching successful builds. One selected module, `MarkovFourLinearDefsCC`, contains only definitions. The actual **27 build receipts** comprise 17 successes, three failures and seven timeouts. Two successful alternate kernel unions select `MarkovFirstShiftCC` first, then all sixteen mathematical modules, including `MarkovResidualCC`: 17 selections but sixteen distinct targets. Audit is **not** replay-selected and has no direct replay receipt; it compiles and prints all **41 named theorem closures**, matching source/inventory/request sets and permitted standard axioms. Its printed output is distinct from the replay of the mathematical modules.

There is one minor bookkeeping error in the worker's operational summary: its `failed_builds=11` list includes `run-four-probe.json`, an experiment with no build return code. The actual rejected build count is **ten** (three failures plus seven timeouts). This does not add or remove an accepted mathematical module. All sixteen excluded draft modules remain outside the accepted inventory.

The unchanged replay drivers inspect source-level bases of 168 and 525 local modules for the two unions, respectively. No selected target, explicit-name collision, source cycle or before-run inherited-source mismatch was found. Recorded direct inherited-import counts are two and six, matching the source headers plus implicit `Init`. All selected current source hashes agree with the receipts, including the overlapping first-shift module. The source/build checks precede replay and the driver hash follows it. Actual loaded-object digests, compiled import tables and private/generated constant inventories are not independently enumerated. The usual unsafe/partial skips, axiom handling, duplicate-map and imported-theorem-body behavior remain relevant; the static checks found no selected-source route to those skips. Reused compiled dependencies remain trusted. This is alternate kernel replay, not official CLI replay or a fresh whole-source rebuild.

The finalizer **did complete successfully**, at event 208, writing local validation, preservation, operational and artifact-index records. It records 189 matching preservation comparisons; 207 initial reconciliation comparisons also match, with overlapping inputs. All 174 predecessor-worker-92 artifacts remain unchanged. No predecessor validation effect was replayed or rewritten.

Final artifact verification has mtime **14:19:30.546328 UTC**, **34.677823 seconds before** the **14:20:05.224151** deadline. The controller nevertheless finishes at **14:20:09.474898 UTC** with a **timeout**, elapsed **1804.250747 seconds**, a null report, and no final agent JSON, controller `final.json` or `turn.completed`. Thus “final reports completed” can accurately describe the retained local validation/finalization records, **not a completed agent final response or successful controller turn**. No late indexed artifact or pending command was found. The mathematical claims are supported by their retained checks without upgrading the controller outcome.

The retained failures are not uniformly mathematical rejections: the LinearMoments attempt used its eventual accepted source hash but lacked a compiled import at that point; it later passed. FourLinearDefs likewise passed later at the same source after a timeout, while the monolithic FourLinear attempt was replaced by split proofs. The excluded BlockParts/Small modules account for five other timeout attempts; twelve excluded drafts have no build receipt. None has an accepted final object or replay. These distinctions are documented without running any retry.

No mathematical English/Lean scope mismatch was found. The experimental shape-count qualification and operational rejected-build overcount above are retained explicitly. Supporting reports, read for this audit:

- [Validation audit](markov_worker_000093_validation_audit.md), SHA-256 `0523514e9dde49e1fac34cf597cbcc60b254e9851067646afc9e8e584ba09389`.
- [Validation evidence](markov_worker_000093_validation_evidence.json), SHA-256 `9bcf44a146f09286da604acd0d8d2d2c499d32385f93e8350f7c875bd7d8d8ae`.
- [Replay-method audit](markov_worker_000093_replay_method.md), SHA-256 `2dc8319bf48928e416d0256e74cb4e94aaa54d9389566db478e619a9daea16c1`.
- [Replay-method evidence](markov_worker_000093_replay_method_evidence.json), SHA-256 `1c343d580f9aeec4c9ca19150f21ec0d99b4bc2f763ac38d329004ed76b2a80a`.

The supporting auditor rechecked 1174 combined input hashes unchanged at `2026-10-15T14:31:55.650052Z`. No missing validation, finalization or final response was completed by either auditor.

Selected independently read final source hashes:

| Source | SHA-256 |
| --- | --- |
| `MarkovFirstShiftCC.lean` | `c842d1697f8077c3b0a68e31a057b669157f879281063f30d036021d19559070` |
| `MarkovResidualCC.lean` | `a7455f46fe6de5469287155f0da7e740b69db3716f0bb7ebab8ba61e079abb85` |
| `MarkovLinearMomentsCC.lean` | `3fa9fad94ec86a0cb3e1eee3ce3ba67b80d93eb8a72d6dc295ce855400cadb76` |
| `MarkovLinearDerivativeCC.lean` | `11e365872c1f16b49786f641733a565b6c4cf35b7e5d1781d99e8f06a0a687c2` |
| `MarkovLinearBlockCC.lean` | `27106dc56734b6d7ca4c7519eb8dae841817b2cb00b8896f5913d44dc4566689` |
| `MarkovBlockExtendedCC.lean` | `b0bd7fd8767b5d75b6ced5f13c3a157bbd0ebdd2242327209339ca6c3a875de6` |
| `MarkovShiftShapeCC.lean` | `50bc124471a2d121244e75494b1189fb612a46b056fc4048293f4af14bd40725` |
| `MarkovBlockSourceExtendedCC.lean` | `b0849be4b69078ee3fea90af7e97e2e52310c0429bc344b1e84a6333a3e70d27` |

The actual mathematical gain is the n=4 source inequality and an exact enlarged coefficient representation. The whole-block gap and the full conjecture remain unresolved.
