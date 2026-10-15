# Worker 000087 independent mathematical monitoring audit

Read-only review of completed request `be5676f95b2a42969d21ef1f51f30bc6`, 2026-10-15. No project source/evidence was edited, no proposer or active successor was contacted or inspected, and no mathematical advice was supplied. No project program, experiment, Lean build, replay or finalizer was executed. This audit used source/receipt reading, hashing and independent arithmetic counting of the recorded experiment domains.

## Mathematical gains and exact scope

Two substantive claims are supported by the final statements and their proof structure:

1. An **exact parameter-only fourth-lower-slice coefficient formula for every mixed source path**, every natural run length, and every actual predecessor size, including sizes two, three and four.
2. **Unconditional actual raw log-concavity on the entire fourth lower diagonal for every source satisfying `3a≤2b`**, with the original three polygon guards and no denominator bound. This extends the previous `2a≤b` coverage through slope two thirds.

These are distinct results. The first is an identity for all runs, not an all-run log-concavity theorem. The new inequality proof specializes to run one and combines it with the earlier run-zero and pure-right results. The complete conjecture, slopes above two thirds, higher lower slices and the horizontal/vertical interiors remain unresolved. No publication novelty is asserted.

Precisely, `source_fourth_lower_two_thirdsBE` quantifies over every `path : List Bool` and `i,j : ℕ`. For `m=(frame path).mid`, `a=m.a`, `b=m.b`, and literal integer coefficient `A(i,j)=coeff m.p i j`, it assumes

- `3a≤2b`;
- `i+j+2=a+4`;
- the original `InPolygon a b` guards at `(i,j+2)`, `(i+1,j+1)` and `(i+2,j)`.

It proves

`A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)^2`.

The coefficient points have total degree `a+4`; the start variables satisfy `i+j=a+2`. There is no fitted moment, auxiliary inequality, positivity, finite search or altered support premise. No coefficient-dependent normalization is used. The large-predecessor run-one theorem holds at every natural index on the slice without polygon restrictions; the final arbitrary-path theorem retains all three original guards and includes all guarded small cases.

## Arbitrary four-letter functions: precise averaging meaning

`MarkovFourMomentBE` works over any commutative ring and an arbitrary four-Boolean function `f`. It defines

`P(p,q,r)=f(p,q,r,0)+f(q,r,0,0)+f(r,0,0,0)`,

`H(p,q,r,s)=f(p,q,r,s)-P(p,q,r)+P(q,r,s)`.

The key identity `H(p,q,r,0)=f(0,0,0,0)` is proved by ring arithmetic. The canonical function splits into this constant, a three-bit term vanishing at its last bit zero, and a four-bit term vanishing at either endpoint zero. The inherited exact source three-bit and four-bit statistics therefore compute its scan from `c,r` alone. `fourMomentBE` is a **cyclic sum**, not an arithmetic mean divided by `c`; no division or positivity assumption is used.

`source_four_canonical_momentBE` covers every source path, including short paths, for the inherited `fourCyclic897` convention applied to the canonicalized function. The separate `source_four_rotatedBE` treats the original arbitrary function `f` under an explicit actual-source word shape

`false :: r :: s :: (w ++ [t,true])`.

The proof telescopes the boundary potential exactly, verifies that the final triple equals the initial triple, and rotates the canonical scan using its constant last-zero value. Thus the trace application does not silently assume that the dummy-initialized scan is periodic for an arbitrary function on an arbitrary short word. The full trace assembly uses this shaped-word lemma only at predecessor length at least five. Actual shorter traces are handled separately below.

The mathematical docs' general four-letter construction corresponds to these proved definitions. No fitted polynomial is used as a Lean premise, no reversal symmetry is assumed, and arbitrary words with the same letter counts are not substituted for actual source words.

## All-run trace assembly and coefficient formula

For a mixed source

`path = replicate n true ++ false :: rest`,

write `c=(frame rest).mid.b`, `r=(frame rest).mid.a`. The inherited source labels give `a=cn+r`, `b=c(n+1)+r` and `0<r<c`, hence `c≥2`.

`runLocalFourBE` is defined using the actual gauged run matrices at three consecutive letter transitions. `run_four_localBE` proves that the inherited fourth local expression on the longer matrix tail equals this four-letter function for **every natural `n`**, every five Boolean inputs and every remaining tail. The contraction uses the inherited fact that the upper-right matrix entry has linear coefficient one; the variable named matrix entry `b` here is distinct from the source denominator. It is not an extrapolation from the tested run lengths.

`openFour_runBE` proves the list identity with its exact tail term. `cyclicFour_runBE` identifies the cyclic trace expression with the closed four-letter scan, accounting for the appended first three matrices and cancelling the tail. `source_fourth_run_momentBE` then uses actual source shape/projection facts and the previous trace identity to prove, for all `n,rest` with `c≥5`,

`logFour01F(tr16(ambientWord5c U V (sourceWord28 path)))`

`= fourMomentBE (runLocalFourBE n) c r`.

`logFour01F` is the explicit integral polynomial in trace jets

`24t₄−24t₁t₃−12t₂²+24t₁²t₂−6t₁⁴`,

not an analytic logarithm. The inherited determinant contribution is removed only after the length-five condition is established.

With `F=firstRunPolyADB2`, `S=secondCompressed446`, and `T=correctedThirdRun8BBB`, the long-cycle fourth polynomial is

`M + 6(1+X)^4 + 4FT + 3S² − 12F²S + 6F⁴`,

where `M=fourMomentBE(runLocalFourBE n)c r`. The inherited source identities supply the first slice, twice the second slice, and six times the corrected third slice. `source_fourth_explicitBE` and `source_fourth_explicit_rawBE` then identify respectively the polynomial and each literal raw coefficient. The uniform factor 24 is common to the entire slice and later cancels from its quadratic comparison.

## Every short cycle, with corrections retained

`source_short_wordBE` proves that, whenever the **actual predecessor denominator `c≤4`**, its word is

`shortSourceWordBE c r = replicate (c−r) false ++ replicate r true`.

The proof uses the existing initial/final source-word form, length and true-bit counts, and reducedness. The central word has length at most two; the two possible `c=4,r=2` words are excluded by coprimality. This is an exhaustive classification of the five reduced predecessor pairs `(2,1),(3,1),(3,2),(4,1),(4,3)`, not a replacement of all longer mechanical words by one ordered block.

`fourthParamTraceBE` uses the **literal gauged matrix-product trace on this short word** when `c≤4`, and the proved moment formula otherwise. `source_fourth_parameter_traceBE` connects both branches to the actual source trace. Thus the determinant corrections at lengths two, three and four are retained implicitly in an exact trace computation, rather than omitted or incorrectly set to zero.

`fourthParamPolyBE` inserts this trace in the preceding polynomial expression, with the **corrected** third-slice polynomial still present. The final theorem

`source_fourth_parameter_rawBE (n : ℕ) (rest : List Bool) (i j : ℕ)`

has only the slice hypothesis `i+j=a+4` and concludes

`24*A(i,j) = (fourthParamPolyBE n c r).coeff j`.

There is no lower or upper bound on actual `c`, no restriction on `n`, no polygon guard, and no unproved source-identification premise. It covers every mixed source and all natural coefficient indices on that slice. It does not claim that arbitrary invalid parameters `c,r` correspond to a source, that pure-right sources have this mixed decomposition, or that the resulting sequence is log-concave for every `n`.

## Run-one inequalities and exhaustive small-case assembly

`runLocalFour_oneBE` checks all 16 Boolean values and identifies the actual run-one local function with `oneLocalFourBE` by exact matrix/jet expansion. Each of six `fourth_one_moment_...BE` lemmas resolves the truncated counts on its strict predecessor-slope chamber and proves equality with its explicit moment. Each `fourth_one_expand_...BE` further identifies the full fourth polynomial, using the inherited first/second/third formulas with their relevant correction exclusions justified by `c≥5`.

The six chambers have endpoints `0,1/4,1/3,1/2,2/3,3/4,1`. For adjacent endpoints `p/q < s/t`, the coefficient inequalities hold for **all nonnegative integers `x,y` and every natural index `j`**, at

`c=q(x+1)+t(y+1)`, `r=p(x+1)+s(y+1)`.

The explicit sequences have last listed index respectively **8,9,9,10,10,11**. There are **51** nontrivial adjacent-gap certificates, distributed `7,8,8,9,9,10`; each is an exact polynomial identity followed by a nonnegativity proof. At all larger starting indices the right endpoint is explicitly zero and the inequality reduces to nonnegativity of a square. The finite number of coefficient positions follows from the proved polynomials, not a finite bound on source parameters.

The source transports derive the required nonnegative coordinates from the strict inequalities, rewrite the moment/coefficient identities, and cancel the common factor 24. They have no unknown `hM` hypothesis. The inherited coprimality lemma excludes each internal boundary when `c≥5`, so all predecessors in this range are covered.

For run one and `c≤4`, every case other than `c=4,r=3` has resulting source denominator `b≤10`; the guarded fourth lower slice belongs to the inherited first six upper diagonals. The exceptional predecessor produces the actual source **`a/b=7/11`**. Its source word and cut-list identity are proved first. `fourth_one_34_polyBE` then gives the exact raw slice polynomial, whose coefficients in increasing second exponent are

`210,1596,5380,10579,13426,11496,6752,2720,744,136,16,1`.

`fourth_one_34_lcBE` proves all natural-index inequalities, checking the ten nontrivial starts and retaining the zero tail. The source transport has no polygon or numerical hypothesis beyond its source labels and slice equation. The final coefficient one is part of the proved literal polynomial; it is not lost by applying the long-cycle formula. The saved `24X^11` discrepancy against the naive long-cycle moment is a separate finite diagnostic, not a premise of this proof.

Finally all source paths are split into pure-right or mixed. Pure-right paths use the inherited Pell theorem. In the mixed case `3a≤2b`, the exact label identities and `0<r<c` force `n≤1`; run zero uses worker 86's result and run one uses the new result. The boundary slope two thirds is retained, not replaced by a strict inequality. This proves the asserted entire slice over an unbounded source subfamily.

## Exact residual equivalence

`root_iff_coreBE : Conjecture63 ↔ InteriorCore63BE` is derived from worker 86's exact root equivalence. Its horizontal and vertical interior clauses are identical. The diagonal clause retains all three original polygon guards and

`i+j+8≤a+b−1`, `a+4≤i+j+2`, `a+2≤b`,

but its final condition is now

`a+5≤i+j+2 ∨ 2b<3a`.

Writing `s=i+j+2`, the old total-degree range `a+4≤s≤a+b−7` remains. Only the now-proved fourth lower slice at slope at most two thirds is omitted. The reverse implication supplies that exact omitted case from the new source theorem; all other cases are passed to the residual assumption. The forward implication correctly implies the older `b<2a` clause from `2b<3a`. Both root endpoint clauses remain supplied by the inherited exact equivalence.

This is an equivalence to an **unproved** remaining predicate, not a proof of the root, its negation or a weaker surrogate. The root coefficient/polygon definitions are unchanged. Rational coverage and the full homogeneous/source correspondence remain inherited and are not newly certified by this local monitoring audit.

## Finite experiments and their limits

I read the scripts and saved JSON and independently counted only their input domains, without recalculating matrices, source polynomials, local statistics or inequalities:

- For runs `n=0,1,2,3,4,7`, reduced predecessors `5≤c≤20`: **732 source/run cases**, **832 literal raw coefficient positions** in the `c≤7,n≤3` subrange, and **11,590 polygon-valid fourth-diagonal triples**.
- For every five reduced predecessor pairs of denominators two through four and `n=0,...,8`: **45 cases**, **228 literal raw positions** in the `n≤3` subrange and **775 polygon-valid triples**.
- Totals: **777 cases, 1,060 literal coefficient positions and 12,365 valid triples**, matching the records. Saved failure lists are empty. These totals remain finite observations; the sources of the theorem proofs are separate.

The saved short-cycle correction at `n=1,c=4,r=3` is exactly `24X^11`. The separate Python comparison reports agreement of 18 previously fitted moments for `n=1,2,3`, six chambers each, with expressions from the new local statistic. Those named chamber specializations are checked in Lean here for **run one**; no run-two or run-three coefficient inequality follows from the comparison alone. The further symbolic nonnegative gap expansions for runs two and three remain outside this batch's accepted Lean inequalities. General all-run source-moment correctness is proved, but these further specialized gap conclusions are not.

No English/Lean scope mismatch was found. The mathematical docs correctly distinguish the all-run identity, the through-two-thirds inequality, and the remaining experimental higher-run inequalities.

## Validation and completion boundary

The completed [validation audit](markov_worker_000087_validation_audit.md) and [replay-method audit](markov_worker_000087_replay_method.md) find **no final-source, receipt or archive discrepancy**. No missing project check was executed by either auditor.

- All **103** controller/current/archive bindings match; all **101** manifest entries match those bindings. All 15 final source/object pairs are covered. There are no late/unarchived worker-87 files, changed archived files, pending command items or leftover temporary files.
- **Fourteen mathematical modules plus Audit** have matching successful final-source builds. The **22 ordinary receipts** are 15 successful builds, six failed obsolete-source builds and one successful Audit replay, with no timeouts. Each rejected source is distinct from its later successful source and remains excluded; none is promoted to proof evidence.
- The first successful union, `kernel-union-1792063121662108000.json`, covers 11 mathematical modules / 94 named theorems. The later `kernel-union-1792063395010606000.json` covers all **14 / 108**, retaining the first eleven at the same hashes and adding the all-cycle identity, source inequality and residual modules. These are 25 overlapping selections, **14 distinct mathematical modules**. Every final build precedes its selected union; Audit has a separate matching build and direct replay. Event payloads, snapshots and receipt hashes match, allowing only the recorded 8,000-character output-prefix truncation.
- All **108** source theorem names equal the inventory, explicit Audit requests and individually printed complete axiom closures. Every closure is a subset of `propext`, `Classical.choice`, `Quot.sound`. The final source inequality, all-cycle raw formula and root equivalence are directly covered, not merely present as trusted imported statements in an Audit replay.
- All **85** preservation comparisons and **76** initial reconciliation comparisons match. They overlap and are not additive counts of distinct files. The root, raw contract and canonical contract hashes remain pinned. No old finalizer was invoked and no interrupted predecessor's missing effects were reclassified as completed.

The finalizer runs once successfully at events 196–197. Artifact verification is written at **2026-10-15 11:25:03.948545 UTC**, **266.154840 seconds before** the **11:29:30.103385** deadline. The final agent JSON, `final.json`, controller report and `turn.completed` are retained and agree. Controller outcome is **completed** at **11:25:40.387116**, elapsed **1570.283731 seconds**. Its mathematical resolution is false and completion is null, correctly preserving the open root.

The established drivers are unchanged: direct `ReplayKnown6d2c` hash `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`, batch `ReplayBatch07F1` hash `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The union wrapper hashes selected sources and requires matching successful builds before replay; its driver hash is recorded afterward. Static source-import/name review finds no selected-target contamination, source cycle, explicit-name collision/duplicate or baseline mismatch. Imported local base closures are **98** modules for the first union, **401** for the final union and **415** for Audit. Neither union base contains its selected targets; Audit imports the fourteen new modules and introduces no explicit mathematical declaration.

The method collects all selected object constants, including definitions/helpers (108 explicit theorems and 32 definitions in the final sources), not only the named theorem list. Standard replay qualifications remain: unsafe/partial declarations are skipped, axioms admitted, duplicates overwrite and already-imported equal theorems may skip proof-body comparison; source analysis found no selected-target route to those skips. Pending recursion does not introduce assumptions. The Audit replay itself does not recheck imported mathematics; union replay provides that separate coverage.

Actual binary import tables and generated/private-constant inventories are not supplied by the saved outputs. Inherited compiled Mathlib/project dependencies remain trusted; invocation-time object digests and frozen-during-execution source/driver bytes are not recorded. These are accepted **alternate kernel-replay records**, not official-CLI receipts or a fresh whole-source rebuild. Final object/archive bindings and chronology support the stated retained-check claim within that boundary.

Supporting audit hashes:

| File | SHA-256 |
|---|---|
| `markov_worker_000087_validation_audit.md` | `76e0fdcb0eca942eb040a5d9f9721314716c1ae97389a9ce10dceda4e28b529e` |
| `markov_worker_000087_validation_evidence.json` | `ebba91a7b6e5877c76d7de6761537ceb9364bd60ecd97f3515f0703f0aa6c1b8` |
| `markov_worker_000087_replay_method.md` | `7ebb909ed10cff382dbf251720898dd3dbf88e510b157f89abf3054ad81930ec` |
| `markov_worker_000087_replay_method_evidence.json` | `c6bf08dd4c982396dec7f93e566168a17df6d4e2470d5f4eb153b7c6227eda10` |

## Final-source hashes

SHA-256 of the inspected final sources:

| Source | SHA-256 |
|---|---|
| `MarkovAuditBE.lean` | `e69053b79eafe4be99046c2c770ccce019ddf36d6e6424f451651672ecddd3db` |
| `MarkovFourMomentBE.lean` | `192451f02c7d9fdf36aca43c19b2de5124bb53c8d96fd26a373e71f88a16a73f` |
| `MarkovFourthAllCyclesBE.lean` | `5fe116a1a467d99e94a37b28e5b881ffdc7f7897ce217b67cbb7af1f4456afb8` |
| `MarkovFourthOne0BE.lean` | `38ec60eb86eecace5277933ebbe64657fcbd12b28d0452e6725b63785a4b75db` |
| `MarkovFourthOne1BE.lean` | `88cca0e825df77647c2a02ee1074bd73720275f1c8a713cace802757ada9acdd` |
| `MarkovFourthOne2BE.lean` | `8c0852f03d05d7f8b1e63795a826a5372188773856798e5b71534a7a5e707239` |
| `MarkovFourthOne3BE.lean` | `c4e12dc35ad93f78a780557bbf686b46709ea8ecfb234d9502804da236f9c899` |
| `MarkovFourthOne4BE.lean` | `3e02960663467383bea792deea0c0625dbd46a546caa8ec8c7eb201d9dd4e7b4` |
| `MarkovFourthOne5BE.lean` | `d66c9a4c830e07c85bb338074c2264fa56f2c88a9ff97ea565c2e4615573ce08` |
| `MarkovFourthOneLocalBE.lean` | `49bba59b8eb27d256313d6b0bb418667c0a95d5d4cdb25ea85c89aec5b9a22ae` |
| `MarkovFourthOneSmallBE.lean` | `0afc41ccfd504069b076278983414ea16bfa2eb112e5a7d41997abcffe3cf0ca` |
| `MarkovFourthOneSmallPolyBE.lean` | `06d4da939da9d88c053a14dc6ecf5031680ee6a8fb93e6f7b863e613c442248a` |
| `MarkovFourthOneSourceBE.lean` | `a221abc30e95d12e3a4163bbea3ef551e88e58b18fa9274f29d2c7af136ed849` |
| `MarkovFourthRunMomentBE.lean` | `c13a0ce85d6ab9423f15a533dbe6dce0558488e7cd9109c19f973b82518174d9` |
| `MarkovResidualBE.lean` | `7e35f4a9dff75510fe569c4be863fa0220dc9f4bafd41cf199f2960738ff0181` |
