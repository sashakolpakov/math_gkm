# Independent monitoring audit: worker 000092

Request `f2da221d241a479bb83492e861a09fd7`. Read-only review on 2026-10-15 of the completed worker's mathematical source, English account and retained validation. No project file, theorem, build, replay, experiment, finalizer, proposer or active successor was changed, executed, completed or advised. Independent calculations were limited to text/JSON parsing, hashing and counting the recorded finite input/index domains. This is not a fresh full published-source correspondence or historical-novelty audit.

**Finding:** the final statements genuinely enlarge the actual raw fourth-lower-diagonal region. They cover every initial triple with starting second-coordinate index `j<n`, and the first shifted triple `j=n` when `n≥5`, for arbitrary mixed source paths with predecessor denominator `c≥5`. The coefficient identities and gap hypotheses are discharged. They do not prove the whole fourth diagonal or the remaining root predicate. The exact coefficient indexing, scope and validation qualifications follow.

## Exact raw meaning and indexing

For arbitrary `n : Nat` and `rest : List Bool`, set

```
path = replicate n true ++ false :: rest,
c = (frame rest).mid.b,   r = (frame rest).mid.a,
a = (frame path).mid.a,   P = (frame path).mid.p,
s = a+4.
```

The actual source parameters satisfy `a=nc+r`, `b=(n+1)c+r`, and the inherited reduced-frame result gives `1≤r<c`. The statements do not replace `P` with an arbitrary cyclic word or fitted array.

`source_fourth_initial_allF2` has exactly the hypotheses

```
c≥5,   i,j : Nat,   i+j+2=s,   j<n,
```

and conclusion

```
coeff P i (j+2) · coeff P (i+2) j ≤ coeff P (i+1) (j+1)^2.
```

With `b_k = coeff P (s−k) k`, the sequence triple `(b_j,b_(j+1),b_(j+2))` is

```
( coeff P (i+2) j,
  coeff P (i+1) (j+1),
  coeff P i (j+2) ).
```

The endpoint product is merely written in reverse order. The starting coefficient is not `coeff P i j`. All three points lie on total degree `a+4`. There is no lower bound on `j` and no old `j+2<n` restriction. The statement quantifies over all natural `n`; for `n=0` its initial index range is empty.

`source_fourth_first_shiftF2` has exactly `c≥5`, `n≥5`, `i : Nat`, `i+n+2=s`, and concludes the same inequality with `j=n`. Thus the combined proved starting-index set is

```
j<n  or  (j=n and n≥5).
```

Neither raw inequality assumes polygon membership, coefficient positivity, nonzero support, an auxiliary formula, or an unproved gap bound. Natural zero coefficients remain part of the statement, and the polygon-restricted instances follow. There is no denominator or run-length cutoff. The initial region fills the small-index omissions of worker 91 and includes its old interval; the first shifted triple is an additional extension. This is a partial source-connected result, not a new complete slope range, all fourth-slice positions, other directions, or the full conjecture. In particular, no first-shift result for `n=4` or source result for `c=2,3,4` is asserted by these theorems.

## Separate-variable truncation and initial inequality

`eval_shift_productF2` is a statement in `ℤ[x][Z]`: if `Z` divides `F` and the coefficient polynomial `x^d` divides `F`, then `x^(n+d)` divides `F(x^n)`. It factors `F=x^d Q`, uses the vanishing constant coefficient in `Z` and cancellation of the nonzero `x^d` in `ℤ[x]` to deduce `Z|Q`, then evaluates. It does not multiply two arbitrary divisibility facts after specialization.

Applying this lemma to the numerator difference combines the inherited `Z` factor and generic `x²` factor to prove `fourthNumerator_shift_dvdF2`. The resulting coefficients agree for every `k<n+2`. This completes the mathematical combination left unfinished in worker 91; old excluded drafts are not retroactively treated as accepted. Through the inherited exact `source_fourth_binomialBC`, `source_fourth_convF2` proves

```
24 · coeff P i j = convSeven(lowPoly(c,nc+r), j)
```

for `i+j=a+4`, `c≥5` and `j<n+2`. No denominator evaluation, analytic convergence, cancellation of a possibly zero specialization, or omitted zero tail is assumed.

`MarkovFourthBoundaryF2` proves the exact convolution values at indices `0,…,6`, plus five adjacent gap identities with nonnegative polynomial certificates. For starting indices `j=0,…,4`, their centers are `1,…,5`; for `j≥5`, the proof invokes the inherited strong shape inequality at center `j+1`. The assembled `fourthLow_convolution_lcF2` quantifies over all integers `c,H` and natural `j`, assuming only `c≥2` and `H≥c(j+1)+1`.

In the source adapter `H=nc+r`. From `j<n` and `r≥1`, the required bound follows. The three convolution identities apply at `j,j+1,j+2`, since all are below `n+2`. The proof cancels the common factor 24. Thus the boundary certificates have an actual source bridge; the final theorem does not retain their parameter hypotheses separately.

## First shifted coefficient and inequality

The local cubic calculations work over an arbitrary commutative ring with `x³=0`. They check all Boolean cases and prove that the third/fourth local expressions depend only on their first two bits. The third moment statement allows arbitrary ring-valued statistics `c,r,q,t,u`; the fourth moment statement uses natural `c,r` and checks all branches of the inherited moment formula. The statistics other than `c,r` cancel algebraically. These are polynomial identities, not empirical cyclic-frequency assumptions.

Define

```
K = Nc+r+c−2N−5,
Δ(N,c,r) = 16(c−r)K(K−1)(K−2).
```

`fourthNumerator_cubicF2` proves `F(N,Z,x;c,r)−F(N,0,x;c,r)=Zx²Δ(N,c,r)` when `x³=0`. Passing to the quotient by the ideal `(x³)` gives a generic `x³` divisibility statement for the corrected difference. Combining that factor with `Z` before specialization gives a remainder divisible by `x^(n+3)`. This yields coefficient equality including index `n+2`, with a correction supported at that one numerator degree.

`source_fourth_next_convF2` then proves the **actual raw** coefficient identity

```
24 · coeff P i (n+2)
  = convSeven(lowPoly(c,nc+r), n+2) + Δ(n,c,r),
```

under `c≥5` and `i+(n+2)=a+4`, for every natural `n`. The convolution kernel at the correction's own degree is one. The correction is added to the scaled coefficient; it is not an index-dependent normalization or a deletion of zeros.

`firstShift_logConcaveF2` is an integer parameter theorem for `n≥5`, `c≥5`, `1≤r<c`. Its inequality is

```
S(c,nc+r,n) · (S(c,nc+r,n+2)+315Δ(n,c,r))
  ≤ S(c,nc+r,n+1)^2.
```

For `r≥4`, the proof substitutes nonnegative slacks `N=n−5`, `C=c−r−1`, `R=r−4`, proves the three exact quartic-in-`R` expansions, and assembles the nine gap coefficients, each proved nonnegative. The remaining cases `r=3,2,1` have separate exact identity/nonnegativity certificates with `n−5,c−5` nonnegative. This split exhausts the stated integer range; neither coprimality nor an unproved coefficient inequality is an additional premise. The monolithic `MarkovFirstShiftGap0F2` attempt is excluded; the accepted split identities are distinct validated sources.

The final source adapter uses the two unshifted coefficient identities, the corrected third coefficient identity, and the inherited `315·convSeven=S` conversion (valid at indices at least five). Consequently the common raw scalar is `7560=24·315` at all three positions; only the third shape expression gains `315Δ`. It supplies `1≤r<c` from the actual reduced frame and cancels the uniform scale. This explains the genuine `n≥5` premise and discharges all parameter/correction hypotheses.

## Exact residual, retained boundaries and limitations

The intermediate `InitialFourthRegionF2` removes precisely `j<n`. The final `InitialFourthRegionNextF2` uses the exact path decomposition, `c≥5`, unchanged equation `i+j+2=a+4`, and `j<n ∨ (j=n ∧ 5≤n)`.

`root_iff_coreNextF2` starts from `root_iff_coreN6604`. It keeps both horizontal and vertical clauses unchanged. In the diagonal clause it keeps all three original polygon guards, `i+j+8≤a+b−1`, `a+4≤i+j+2`, `a+2≤b`, and `a+5≤i+j+2 ∨ 4b<5a`; it adds only the negation of the new proved-region predicate. The forward implication restricts the original inequality. The reverse implication splits on that region and invokes one of the two actual source theorems there, with the same index convention. Endpoint clauses remain inherited through the exact older equivalence. There is no replacement of the root by a weaker target or silent shift of a boundary.

The residual itself remains unproved. Small predecessor cycles, later shifted positions, the `n=4` first-shift position, higher diagonals, and horizontal/vertical interiors are not removed by the new theorems. Their finite examination is not an additional universal claim. No novelty relative to current literature is asserted here.

## Finite evidence and its domain

No research computation was rerun. Reading the experiment and independently counting only its input/index domain gives exactly **1,282 cases**: every coprime `1≤r<c`, `2≤c≤20`, with `n` in `0,1,2,3,4,5,6,8,13,21`, plus `n=32,64,100,127` at `(c,r)=(5,2),(7,3),(11,7)`. The saved input list matches this domain exactly.

The record reports no failures. Its **11,534** initial coefficient comparisons cover `j<n+2`; **415** of them have `c<5`. The **1,232** first-shift coefficient comparisons use `c≥5` but include `n<5`, consistent with the coefficient identity's broader scope. The finite LC loops test all polygon-valid starts through `j=n`, giving **8,970** initial and **1,280** first-shift triples. These loops also include smaller `c,n` than the raw theorem. All six counts match independent domain enumeration; the larger finite range does not extend a theorem hypothesis.

The arithmetic evaluator uses the exact lower-cut matrix recurrence on mechanical source words and the stored compact numerator coefficients. It does not execute Lean terms. When `b≤40`, it separately constructs the literal source recurrence via its rational path and compares the full fourth-slice coefficients, including zeros: **5,972** positions. This literal comparison is confined to that finite subdomain, not all 1,282 cases.

The symbolic first-shift probe records a 43-term correction, a 424-term unspecialized gap, and eight candidate expansions from bases `n=4` and `n=5`. Each base has a 585-term `r≥4` candidate and three 117-term small-`r` candidates, with zero recorded negative coefficients. Those generated records are not Lean proofs by themselves. Only the accepted `n≥5` identities/assembly establish the stated theorem; the `n=4` probe is not an accepted first-shift extension.

## Validation and preservation

The independent supporting audit found **174 controller/current/archive bindings** and **172 manifest entries**, all matching. All **26 final mathematical modules plus Audit** have matching successful source builds, retained objects and successful union membership. The **42 ordinary build receipts** comprise 27 final successes, 14 failed earlier source versions and one timeout. The latter is the explicitly excluded monolithic `MarkovFirstShiftGap0F2` (120.203645291 seconds), with no retained object or accepted check. No excluded attempt is counted as a theorem. No obsolete successful source is selected.

Two completed successful alternate kernel unions cover four mathematical modules first and then **all 26 mathematical modules plus Audit**. Their completed event lines are 121 and 257; overlapping targets have identical final hashes, and matching builds precede each replay. These are 31 selections and 27 distinct targets including Audit, not 31 independent modules. Final source/inventory/Audit-request/printed closure sets agree exactly on **72 named theorems**, all using only subsets of `propext`, `Classical.choice`, `Quot.sound`. The 46 explicit definitions and generated helpers are distinct from that theorem count. Successful event output is length-only, while the complete output, including all 72 printed closures, remains in the hash-bound receipts.

Both replay drivers remain unchanged. Each union's source-level inherited base contains 501 local modules, with no selected target, explicit-name collision or source cycle. Audit has no explicit declaration; its 26 mathematical imports are all selected in the final union. The base includes 23 retained worker-91 mathematical dependencies, but neither its `MarkovResidualK0B` nor its `MarkovAuditK0B`; the new residuals explicitly use `MarkovResidualN6604`. The wrapper checks source hashes and matching builds before replay and hashes the driver afterward. It does not freeze files or record invocation-time object digests.

These are alternate kernel union replays using the established driver, not official CLI replay or a fresh whole-source rebuild. The method collects selected object constants, not only the named theorems. Standard unsafe/partial skips, axiom handling, duplicate-map behavior and potential imported-theorem body skips remain relevant; the static target/import checks found no selected-source route to those skips. Actual binary import/generated-private inventories are not independently listed. Retained compiled dependencies remain trusted.

The finalizer ran once successfully at events 260–261. It binds all 172 artifacts and records **208 matching preservation checks**; **199 initial reconciliation checks** also match, with overlapping inputs. Root and canonical/raw contract digests remain unchanged. Artifact verification was written at **13:49:19.663622 UTC**, 141.213600 seconds before the **13:51:40.877222** deadline. The controller completed at **13:49:57.688853**, elapsed 1696.811632 seconds, 103.188369 seconds before deadline. Final agent JSON, controller `final.json` and report agree; `turn.completed` is retained. No late/unarchived worker-92 artifact or pending command was found. Completion is null and the mathematical-resolution flag is false. There is no separate local `report.json`, and none was required or counted.

All 193 old worker-91 controller bindings still match its old archive, the worker-92 before snapshot and current bytes. The recovered 26 prior source/build/replay references match retained records; this is reconciliation, not a new replay or finalization of worker 91. Its seven missing aggregate/report files remain absent. Its second union retains the post-deadline receipt/no-completion-event distinction, and its first union retains the old-Audit object-overlap/header-count qualification. Worker 92 does not retroactively upgrade either historical boundary.

The mathematical and retained-validation reviews found no English/Lean scope mismatch or artifact discrepancy within these stated limits. Supporting notes, read for this report:

- [Validation audit](markov_worker_000092_validation_audit.md), SHA-256 `2a7b1fd99e9693cc580db8c426349c23b33b24caba29fcb6e7e8ad4e90f16ffe`.
- [Validation evidence](markov_worker_000092_validation_evidence.json), SHA-256 `048710a90c4f9d10a1d308cf2021a796cc3259b7e3b2992b73bcb706399560d4`.
- [Replay-method audit](markov_worker_000092_replay_method.md), SHA-256 `ae0e3285a9fed76829473a10799274b4312c5c2bfe4cdcb21f97997df3def665`.
- [Replay-method evidence](markov_worker_000092_replay_method_evidence.json), SHA-256 `ac843c24032af94435adc302da5947fdbc268a8ac7f21f1123dd213429cdedfe`.

The supporting auditor rechecked 1245 combined input hashes unchanged at `2026-10-15T14:01:45.841720Z`. No missing check or finalization was completed by either auditor.

Selected independently read final source hashes:

| Source | SHA-256 |
| --- | --- |
| `MarkovShiftProductF2.lean` | `18d451d7653a9d3f020339b2b4614c98170536d51103aa2b71553f698e8e5408` |
| `MarkovFourthBoundaryF2.lean` | `4d7dd2a422362d6b43d6428809f521692a6491cd8cce298251bb791561b72248` |
| `MarkovFourthSourceF2.lean` | `f28323fb813528e32e43807de96e207bc8686c19594bf468f7ee0e6ba28af519` |
| `MarkovCubicNumeratorF2.lean` | `2bd2765603a1ed4a375c97f713d5b283b5be726d94f0ccc968a5bfb8673f2f04` |
| `MarkovFirstShiftCoeffF2.lean` | `3a11e89615e74978e80ea6bf361ac26e7763abdfdd88631d869348f8a5637dce` |
| `MarkovFirstShiftLCF2.lean` | `670362eac09d180fbac9f501d2cd3ed9ee6da12a24783897ec9c66d077c2aba8` |
| `MarkovFirstShiftSourceF2.lean` | `f52560bc65155e0d96664e7d574fdc3d0ec727c67f3dee45f607c79f23922963` |
| `MarkovResidualNextF2.lean` | `532f59bec0d08ac19f1910490ca65850ffceb6cfe2d72eec6c8c8bdc6391debe` |

This audit identifies a verified-model source-connected extension subject to the retained validation qualifications, not a resolution of Conjecture 6.3. No mathematical guidance or repair was provided to the independent machine.
