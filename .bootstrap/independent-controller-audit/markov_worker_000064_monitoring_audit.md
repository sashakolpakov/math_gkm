# Independent monitoring audit: worker 000064
Request `6d2c5a67e4e14b3993f3b98af6bf0e61`, reviewed 2026-10-15. This was a read-only mathematical and recorded-evidence audit. No research source edits, proof advice, proposer/successor contact, experiment reruns, Lean compilation, replay retries, or checker changes were performed. Exact reviewed source/evidence bytes and hash/status comparisons are in `markov_worker_000064_audit_evidence/`. The separate static finite/obstruction audit is `markov_worker_000064_formula_audit.md`.

## Verdict

All **six mathematical modules, with 42 named theorems, compiled successfully**. The official pinned `leanchecker` directly replayed **two modules, with 12 named theorems**: interval aggregation and trimming. The other four official replays timed out. A separate experimental explicit-module driver also timed out and contributes **no accepted replay**.

The positive result has the advertised restricted scope: constant coefficients of actual-multiplicity sums over consecutive active degree-minus-cut layers on every source `R^nL`, `n>=1`. The interval bounds are explicit. Prefix intervals beginning at zero are handled by a separate theorem. There is no all-source or positive-original-coefficient-index theorem here.

The skipped-layer obstruction is genuinely source-connected for every `n>=6`, but applies to two nonconsecutive aligned grades, not the complete numerator. Its initial coefficient triple is `[1,3,14]`, gap −5. The checked full source 13/15 triple is `[1,14,91]`, gap +105. Signed grades, actual source paths, source coefficients, empty/out-of-range zeros, and the boundary distinction are handled correctly. No mathematical English/Lean mismatch was found.

All final source, build snapshot, official replay, compiled artifact, controller and archive hashes match. The final manifest includes the completed outcomes; no late receipt or stale progress mismatch was found. The worker completed its invocation but explicitly left Conjecture63 unresolved.

## Validation and provenance

| Mathematical module | Named theorems | Final compilation | Official direct replay |
|---|---:|---|---|
| `MarkovAlignedCount6d2c` | 10 | exit 0, 16.109 s | timeout, 90.007 s |
| `MarkovAlignedLC6d2c` | 4 | exit 0, 25.840 s | timeout, 90.006 s |
| `MarkovAlignedPrefix6d2c` | 9 | exit 0, 35.932 s | timeout, 100.006 s |
| `MarkovAlignedObstruction6d2c` | 7 | exit 0, 34.784 s | timeout, 100.006 s |
| `MarkovTrimLinear6d2c` | 5 | exit 0, 30.333 s | exit 0, 155.222 s |
| `MarkovAlignedInterval6d2c` | 7 | exit 0, 27.505 s | exit 0, 156.391 s |

Every final mathematical source matches the manifest SHA256, successful build snapshot, official replay snapshot, controller change hash, and archived bytes. Current `.olean` files match the artifact index, controller and archive. Every final-source official replay receipt is archived and hash-matched, including the four timeouts. There are no missing run records or mismatched artifact-index entries in the final state.

Successful printed main-theorem closures contain only `propext`, `Classical.choice`, and `Quot.sound`. Final mathematical modules contain no custom axioms, admissions, or native-decide proofs. Earlier failed elaborations are not accepted; their nonzero return codes and differing source hashes remain recorded. This audit inspected those recorded checks rather than independently rerunning every axiom closure or recompiling inherited imports. The worker reused inherited compiled dependencies, explicitly disclosed in its notes.

The experimental replay receipt was written at **23:55:06.611418Z** after 100.196 seconds with timeout and no successful output. The two official successful replays completed around **23:55:14.731Z**, before the final manifest at **23:56:27.693965Z** and controller completion at **23:56:45.019085Z** (all 2026-10-14 UTC). Archived finalization and verification events record 83 artifact hashes without mismatch, and the transcript ends `turn.completed`. There is no post-cutoff status change to reconcile.

The completed worker receipt has `completion: null` and `mathematical_resolution: false`; completed invocation does not mean completed conjecture.

### Experimental checker distinction

`research/ReplayKnown6d2c.lean` is a standalone operational driver using Lean's replay API with explicitly supplied module names. It is not one of the six mathematical modules and is not imported into their proofs. Its invocation is `lean --run ...`, distinct from the official pinned `leanchecker` commands. Its driver source hash, six mathematical source hashes, and six object hashes match the saved experimental receipt, but that receipt reports a timeout. The final validation leaves every `explicit_known_module_replay` field null.

No successful validation is inferred from the driver's source, attempted invocation, or claimed relation to the pinned replay body. The final validation does not replace the official checker with this experiment or label any module replayed on its basis; the two successful separate checks in this audit are the recorded official CLI checks. The operational driver's `unsafe` IO implementation is not a mathematical axiom or a proof dependency. This audit neither ran nor repaired that experiment.

### Final mathematical source hashes

```
MarkovAlignedCount6d2c d16a93d37682338a3d88cdfd7f2dec0fed2bdfaad58f92ef32c55c635b87db70
MarkovAlignedLC6d2c 94c6e22984f5ea8e950fdb3456fc19d91846e888b9b6020f9375a681a8959310
MarkovAlignedPrefix6d2c 23e9a2e08a39be4552d813543cfcc42ab02445c44ed2694069d3ede406debac5
MarkovAlignedObstruction6d2c 83f846a42560be8e29ae36886314c997f37c2f12f0340b9b5edabffe9b8eff47
MarkovTrimLinear6d2c e3229fefd49df95c40816141c11f83bad5f07ee2664168739c31a06d94b42f0b
MarkovAlignedInterval6d2c fc85489a8ba1e061d83ee54158af0546742b6937118299666d8caee13c214864
```

## Actual source family and aligned constant counts

The inherited `oneAPath68 n` is exactly `List.replicate n true ++ [false]`, i.e. `R^nL`. Its checked extended word is `B^n A B^(n+1)` and its label is `(2n+1)/(2n+3)`. The new source theorems use this actual path and protected frame numerator, with no enlargement to arbitrary words or palindromes.

Let `c_n(s,d)` be the **constant coefficient in the original sheared variable y** of `degreeLayer07a7` for that word. Every mask has constant coefficient one, so these are actual mask counts with their multiplicities. The new generating variable t records the cut count s. The aligned grade is `e=d−s`; fixing e means the selected mask degree changes with s. It is not fixed-degree aggregation and is not the paper's omitted homogeneous exponent.

`source_aligned_count6d` proves

`c_n(s,s+e) = [t^s] H_e(t)`

for all natural `n,e,s`. Its proof is an exact coefficient bridge through the inherited source count formula, not a definition chosen independently of the source. Atoms include the explicit condition `r<=s` before natural subtraction; polynomial and binomial coefficients outside range are zero. The rectangular finite sum counts all contributing atoms, retaining multiplicity. There is no division by a variable, formal rational substitution, or numerical interpolation.

For `n>=1`, the resulting polynomial identities are exactly:

- `e=0`: `H_e=1+t`.
- `1<=e<n`: `H_e=t(1+t)^(e−1)(2+(e+1)t)`.
- `e=n`: `H_e=t(1+t)^(n−1)(3+(n+2)t)`.
- `e>n`: `H_e=max(2n+2−e,0)t^2(1+t)^(e−1)`.

The final maximum is implemented by natural subtraction before casting to integers; it is not a negative scalar beyond the active range. In particular every `e>=2n+2` layer in this constant-count representation is zero. The positive family results require `n>=1`; the special `n=0` case is not silently included in the first formula.

The source negative-alignment theorem separately states **the constant coefficient** is zero whenever natural `d<s`, for every n. This justifies omitting negative e for this family's constant counts. It does not assert negative grades vanish for arbitrary source words or all coefficient indices. General finite experiments retain signed integer `e=d−s`; there is no universal truncation at zero.

## Single-layer and prefix inequalities

The single-layer inequality compares `c_n(s,s+e)`, `c_n(s+1,s+1+e)`, and `c_n(s+2,s+2+e)` for every natural s and e, `n>=1`. Its proof specializes a proved nonnegative binomial-times-linear coefficient inequality and handles the zero scalar case beyond support. It does not assume the desired layer log-concavity as a premise.

The prefix polynomial `P_E=sum_(e=0..E) H_e` telescopes to

- `(1+t)^E(1+(E+1)t)` when `E<n`;
- `(1+t)^E(1+(2n+2−E)t)` when `n<=E<=2n+1`;
- `(1+t)^(2n+2)` when `E>=2n+1`.

The adjacent coefficient inequality holds for every prefix length E and cut count s, `n>=1`. Its source version sums the actual degree layers at d=`s+e`, each at y coefficient zero. This is proved aggregation for those cumulative layers by exact polynomial identities; it is not an unsupported general claim that sums of log-concave sequences remain log-concave. The terminal prefix agrees with all constant counts, consistent with the inherited raw boundary binomial formula.

## Consecutive active intervals and trimming hypotheses

`alignedInterval6d n L U` sums the integer polynomials over the inclusive integer interval `[L,U]` via `Finset.Ico L (U+1)`. The main interval result explicitly assumes

`n>=1`, `1<=L`, `L<=U`, and `U<=2n+1`.

It proves the raw adjacent coefficient inequality for every natural starting cut count s. The source bridge preserves exactly the sum of y-constant coefficients at mask degrees `s+e`, for `e=L..U`, without rescaling. Intervals beginning at zero use the separate prefix result. Empty/outside-active intervals are not covertly included in the statement of this active-interval theorem; the polynomial definitions and proved terminal zeros describe them separately.

For active E, write `C_E=E+1` if `E<n`, otherwise `2n+2−E`. The proof establishes the exact factorization

`P_U−P_(L−1) = (1+t)^(L−1) [(1+t)^(U−L+1)(1+C_U t)−1−C_(L−1)t]`.

The arithmetic bound `C_(L−1)<=U−L+1+C_U` supplies the needed nonnegative remaining linear coefficient in the bracket. All exponents and subtractions are justified by the stated interval bounds; no unintended natural subtraction is used outside its domain.

The directly replayed trimming theorem is substantive and conditional: for a nonnegative real sequence f satisfying `CrossLC`, replacing every index `k<=0` by zero and replacing `f(1)` by c preserves `CrossLC` provided **`0<=c<=f(1)`**. `CrossLC` means `f(i)f(j+1)<=f(i+1)f(j)` for all integer `i<=j`, including zero and negative indices. The proof checks the affected indices explicitly. It does not claim preservation after arbitrary coefficient subtraction.

In polynomial form, it removes the constant coefficient and decreases the linear coefficient by D, with **`0<=D<=p.coeff 1`**. Applied to `(1+t)^N(1+Ct)`, the hypotheses are `C>=0`, `D>=0`, and `D<=N+C`. The interval factorization supplies precisely those conditions. Pascal multiplication by `(1+t)^(L−1)` preserves the resulting `CrossLC`; coefficientwise integer-to-real mapping then yields the stated integer inequality. All zero entries are retained. The interval proof's use of this lemma does not assume interval log-concavity in advance.

These are constant-index contribution inequalities across cut counts. They are not general vertical or diagonal inequalities for complete source coefficients. The actual raw coefficient correspondence is `i+j=a+s`; at j=0 the cut-count direction corresponds to the raw horizontal boundary direction only when the full layer sum is used.

## What the skipped-layer counterexample says

For every `n>=6`, selecting only aligned grades e=0 and e=5 gives the exact polynomial

`1+3t+14t^2+36t^3+44t^4+26t^5+6t^6`.

Thus `[1,3,14]` is its **initial triple**, not its complete coefficient list. Its gap is `3^2−1*14=−5`. The source theorem uses the actual degree-layer constants at d=s and d=s+5, not two fixed degree numbers independent of the cut count. It disproves arbitrary-subset aggregation on an infinite actual-source family. It does not contradict the consecutive-interval theorem, since grades 1 through 4 have been skipped.

At `n=6`, the full protected source has label 13/15. `source_skipped_full_triple6d` checks all three original polygon guards at `(13,0),(14,0),(15,0)`, the literal raw values `[1,14,91]`, and gap `14^2−1*91=105`. No normalization or removal of zeros is involved. These obstruction declarations compiled; their own direct replay timed out. They are not a root refutation.

## Finite observations and limits

The accompanying static subaudit checks exact input bounds, indexing, loop guards, and stored artifacts without rerunning project computations. The large completed all-cut interval scan has 394 reduced interior source inputs with `3<=b<=36`, all cut counts, signed grade intervals between the minimum and maximum active grade, and all three polygon-guarded directions. It records 52516538 horizontal, 52516538 vertical, and 54824267 diagonal inequalities: **159857343** total, with no saved failure. Empty exterior interval extensions add only zero layers. These finite observations do not establish the universal interval statement beyond the proved restricted family.

The separate 302-source larger scan uses cut counts at most seven and 987176 tests per horizontal/vertical direction. It is a selected, time-truncated input sequence with denominators 9 through 90, ending at 83/90; it does not exhaust every reduced source up to 90 or reach the later exhaustive small-source batch in its input generator. The notes correctly refer to its saved actual input list rather than universal coverage.

The literal numerator recurrence comparison records 88357 coefficient positions over all 240 reduced interior source inputs with `3<=b<=28`, excluding source 1/2 and the two endpoints. It first sums over degree, then compares the union of raw polynomial supports with missing coefficients treated as zero. It therefore checks aggregate raw polynomials, not each individual degree layer. It is an independent finite implementation comparison, not the universal formal source bridge. The final recurrence-based 13/15 example agrees with the Lean raw triple. Rejected earlier experiment code is preserved separately and supplies no accepted mathematical conclusion.

The smaller-cut `aligned-intervals.json` has an older status/schema than the final script: it lacks the `all_cuts` field the final default branch writes. Its described scope agrees with the smaller-cut branch, but its metadata should not be claimed as an exact reproduction from the final script. No coefficients were rerun during this audit.

Arbitrary-word and proposed matroid-exchange failures concern stronger auxiliary assertions. The source 2/5 exchange diagnostic does not rule out every possible matroid representation. Endpoint fractions 0/1 and 1/1 remain in the protected root; finite interior scans and these family theorems do not redefine or erase those clauses.

## Final scope

The new proof is a valid restricted aggregation result for actual constant-coefficient contributions, with exact active endpoints, signed-grade limitations, source words, multiplicities, and zero cases. The infinite skipped-layer obstruction has the correct narrower meaning. The official replay distinction is truthful, and the attempted standalone replay experiment is not counted as success.

The protected root remains at SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The all-source, all-original-coefficient-index interval property and full Conjecture63 remain unresolved.

Final comparison at **2026-10-15T00:12:24.448128+00:00**: all **86** saved active inputs still match the reviewed hashes. The completed finite/obstruction subaudit found no mathematical discrepancy and documents the stated coverage/schema qualifications. No additional compilation, replay, or experiment was performed.
