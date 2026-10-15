# Worker 000079 independent mathematical monitoring audit

Request `fddabb33d2704cfe80b4fa474cf8edc1`, audited read-only on 2026-10-15. This note checks final mathematical statements against their English descriptions and retained individual validation records. No project files were changed, project code imported or executed, proofs or experiments rerun, missing checks completed, proposer contacted, or successor inspected. It supplies no research guidance.

## Conclusion

**There is a new unconditional raw-coefficient inequality on a restricted part of the third lower diagonal.** The missing coefficient-identification premise from worker 78 is genuinely discharged. For every actual mixed source path `replicate n true ++ false :: rest`, the result holds whenever `4 ≤ j`, `j + 2 ≤ n`, and `i + j + 2 = a + 3`. It concerns the ordinary integer coefficients at `(i,j+2)`, `(i+1,j+1)`, `(i+2,j)`, with no polygon, positivity, denominator cutoff, or unproved formula premise. A second result gives an exact coefficient formula on the entire third lower diagonal; that formula is **not** a proof of log-concavity throughout the diagonal.

The 23 mathematical modules and final axiom audit have matching successful final-source compilation and alternate-driver kernel-replay records. All 68 named theorem closures use only permitted standard axioms. **Aggregate finalization failed** because an import-only diagnostic probe lacked its own replay record. The claimed `validation.json` and aggregate manifests do not exist. This reporting defect must remain visible alongside the individually validated mathematics. The controller outcome remains `timeout`, and the full conjecture remains unresolved.

## Exact raw theorem and coverage

Write `A(i,j)` for the original squared-variable numerator coefficient of the source returned by `frame (replicate n true ++ false :: rest)`, and `a,b` for that source's numerator and denominator indices. The theorem `source_third_interiorFDDA` states:

> For every natural `n,i,j` and every Boolean list `rest`, if `4 ≤ j`, `j+2 ≤ n`, and `i+j+2 = a+3`, then
> `A(i,j+2) * A(i+2,j) ≤ A(i+1,j+1)^2`.

Its conclusion is the actual raw `(1,-1)` inequality, not an inequality of auxiliary matrix, normalized, interpolated, or sampled coefficients. Its proof applies the inherited conditional source theorem with the newly proved `third_interior_formulaFDDA`. Thus the earlier identification assumption is supplied by a theorem rather than retained as a hypothesis or hidden in a renamed predicate.

The stated range is essential. It is the strip `4 ≤ j ≤ n−2`; in particular qualifying indices require `n ≥ 6`. The theorem has no upper bound on run length or source denominator, but does not assert an inequality at every position for each small run length. All natural coefficient indices in its stated range are included, whether inside or outside the Newton polygon; zero coefficients are not removed. Pure repeated-right paths and endpoint clauses are not newly covered by this mixed-path theorem. Horizontal and vertical directions are not conclusions of this work.

The raw region is a genuine addition to the previous whole-third-lower-diagonal result restricted by `3a ≤ 2b`. For example, the actual path with `n=6` and empty `rest` gives `a/b=13/15`; `i=10,j=4` yields the triple `(10,6),(11,5),(12,4)` of total degree 16. All three points satisfy the original polygon conditions. Here `3a > 2b`, and the diagonal lies 11 levels below the top degree 27, outside the already proved first six upper diagonals. This is a coverage comparison, not a new coefficient computation or a claim of publication novelty.

There is no new exact root-equivalence theorem in this batch, nor a proof or refutation of `MathGKM.Markov.Conjecture63`. The unrestricted remainder of this third lower diagonal, all other outstanding source inequalities and the root's endpoint requirements remain separate obligations.

## The coefficient premise is proved

`third_run_interior_coeffFDDA` is stronger in parameters than the source application:

> For all natural `n,c,r,j`, with `4 ≤ j ≤ n+1`,
> `thirdShapeBDEE n c r j = 15 * (thirdRunPolyADB2 n c r).coeff j`.

No source-admissibility condition on `c,r` is needed for this polynomial identity. The natural truncations in the count expressions are retained before coercion: `q = 2r−c`, `t = min(c−r,3r−c)`, `u = 3r−2c`, with subtraction in `ℕ`. The subsequent source theorem uses the actual predecessor parameters `(frame rest).mid.b` and `(frame rest).mid.a` and the existing source identities. It does not assume arbitrary parameters describe an actual source.

The proof has substantive, connected algebraic stages:

1. Sixteen rational normal forms for the four jets of the four run-matrix entries are proved equal to the inherited all-run formulas. The eight Boolean local cubic cases are all identified with their actual closed local expressions. Generic fraction-field certificates explicitly assume `1−x ≠ 0`; actual adapters discharge that assumption for the polynomial indeterminate.
2. First, second and cubic moment contributions are expanded in the variable representing `X^n`. Four independently proved band identities establish their composition. The four retained polynomials contain 169, 164, 128 and 64 written terms, respectively, totaling 525; these are checked algebraic expressions, not an assumed symbolic-computation result.
3. The low band is identified in `ℤ[X]` with the ten-term `lowNumeratorPolyFDDA`. The later bands have exact factors `X²`, `X³`, `X⁴`. Injectivity of the polynomial embedding converts the fraction-field equality back to the polynomial identity

   `(1−X)^6 * thirdRunPolyADB2 n c r = lowNumeratorPolyFDDA n c r + X^(n+2) * delayedRFDDA n c r`.

4. The delayed polynomial retains the two-cycle contribution as well as the three delayed normal bands. No off-by-one shift or small-cycle term is dropped. Consequently the remainder vanishes in coefficients below `n+2`, giving the claimed extraction through index `n+1`.

These source equalities have no unresolved coefficient or moment premise. The old worker-78 auxiliary log-concavity theorem can therefore be used on the restricted raw strip. The factors six and fifteen in the bridge are uniform positive scalars, not index-dependent coefficient normalization.

## Formal extraction and complete-slice identity

`inverseSixFDDA` is the formal power series `(1−X)^(−6)` over `ℤ`, with coefficients `choose(j+5,5)`. Its inverse identity is proved in the formal power-series ring. There is no numerical evaluation at `X=1`, analytic convergence assumption, or division by a coefficient that might vanish.

`extract_delayedFDDA` has explicit hypotheses `(1−X)^6 P = K + X^N R` and `j < N`. It proves that coefficient `j` of `P` equals the corresponding coefficient of the inverse-series product with `K`. Monomial extraction handles out-of-range coefficients using zero binomial values. The lower bound `j ≥ 4` ensures all ten low-numerator monomials fall within the auxiliary binomial identity's required range. The actual `source_denominatorFDDA` supplies the normalization hypothesis.

Separately, `extract_allFDDA` proves the complete finite convolution identity for every natural coefficient index whenever `(1−X)^6 P = K`:

`P_j = sum_{l+m=j} K_l * choose(m+5,5)`.

The sum uses the natural antidiagonal, so it includes endpoints and zero terms without arbitrary index truncation. `correctedNumeratorFDDA` retains the actual cycle corrections multiplied by `(1−X)^6`:

- for `c=2`, `−12 X^(c(n+1)+r) * (firstRunPolyADB2 n c r + 1 + X)`;
- for `c=3`, `+6 X^(c(n+1)+r)`;
- otherwise zero.

The theorem `source_third_all_coeffFDDA` then states, for every actual mixed path and all natural `i,j` with `i+j=a+3`,

`6 * A(i,j) = sum_{l+m=j} correctedNumeratorFDDA(n,c,r)_l * choose(m+5,5)`.

This is an unconditional exact formula for the entire slice, including zeros and both exceptional cycle lengths. The numerator in this representation may have signed coefficients. The theorem does not assert positivity of each summand, a convolution-preservation hypothesis, or log-concavity outside the separately proved restricted strip.

## Finite evidence

The saved experiment scans `6 ≤ n ≤ 24`, `2 ≤ c ≤ 10`, `1 ≤ r < c`, `gcd(c,r)=1`, giving exactly 589 distinct parameter triples and source fractions. Its recorded assertions include:

- 7,657 coefficient positions `4 ≤ j ≤ n+1`, comparing the extraction formula with the backward-cut calculation;
- 198 literal raw-coefficient comparisons from the subset `n ≤ 9`, `c ≤ 5`;
- 5,890 polygon-valid raw log-concavity triples with `4 ≤ j ≤ n−2`.

The saved failures list is empty. I independently checked the stored input set and these counts against the loop domains without recomputing coefficients or rerunning experiments. These are finite checks; the universal assertions above rest on the recorded Lean proofs, not these counts.

## Validation, archives and the finalization defect

The supporting read-only validation audit is [markov_worker_000079_validation_audit.md](/private/tmp/math_gkm_godel_20261013/markov_worker_000079_validation_audit.md), SHA-256 `c71fbeef47b3bb69bd38fcb92ea43c8509a2bc0e55492bf1de258ac478276f5a`. Its [evidence JSON](/private/tmp/math_gkm_godel_20261013/markov_worker_000079_validation_audit_evidence.json), SHA-256 `68540357df9c89235739a76390922367ef80e89f650fd8181e35620103af61ac`, records 560 input hashes and detailed comparisons.

- All **194 controller-listed retained artifacts** match current bytes, controller after-hashes and archived bytes. This includes all 25 FDDA source files: 23 mathematical modules, one final axiom-audit module, and one import-only diagnostic probe. My separate source comparison also found all 25 live sources equal to their worker archives.
- There are **62 run receipts**: 50 successful checks, nine failed builds and three timeouts. The latest final-source selection consists of 23 mathematical build/replay pairs, the final Audit pair, and the diagnostic probe's build: 49 receipts. One additional successful Extract build is on an older, superseded source. All substantive final checks are successful and correctly ordered. Failed and timed-out attempts are not counted as proof evidence.
- All **68 named mathematical theorem declarations** correspond exactly to inventory entries, individual `#print axioms` requests and full saved output. Their closures are subsets of `{propext, Classical.choice, Quot.sound}`. Static final-source inspection found no admissions, custom axioms, native evaluation proof bypasses or unsafe declarations. The import probe and Audit add no mathematical theorem declarations.
- Nine event displays contain deliberate 6,000-character stdout prefixes rather than complete receipt output; 53 show complete payloads. The full saved Audit stdout has 6,571 characters and supplies all 68 closure records. Complete saved receipts match archive/controller hashes, so the display truncation does not remove the retained evidence.
- The driver `ReplayKnown6d2c.lean` remains SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. These are **alternate-driver per-module kernel replays** using the previously audited pinned replay procedure, with inherited compiled imports reused. They are not official `leanchecker` CLI receipts or a fresh whole-dependency rebuild. Receipts bind source snapshots; final object binding relies on controller/archive hashes and chronology, not invocation-time object digests.

Finalizer event 258 exits with `AssertionError ('MarkovImportProbeFDDA', 'replay')` before its first aggregate output write. The probe contains only imports and one `#check`; it compiled but was never separately replayed. Its lack of mathematical declarations does not permit relabeling another module's replay as a probe replay. **`validation.json`, `artifacts.json`, `artifact-verification.json`, `preservation.json`, and `operational-observations.json` are absent.** There is no successful finalization to cite.

The mathematics/correspondence documents' references to a completed `validation.json` are therefore inaccurate. The checkpoint's “24 mathematical modules” separately replayed also overcounts: it includes the import-only probe and asserts its missing replay. The accurate statement is **23 mathematical modules plus Audit individually compiled and replayed, with an additional compiled-only diagnostic and failed aggregate finalization**. These are provenance/reporting mismatches, not an identified discrepancy between the accepted raw theorem and its mathematical English statement.

The supporting auditor independently found 351 reconciliation/pin hashes unchanged, including 344 represented in the controller-before inventory; the seven others lack baseline entries rather than conflict with them. These are observer checks, not a worker-generated preservation certificate. No missing replay or finalization was performed by either auditor.

## Timeout and acceptance boundary

Controller start was 07:07:08.729066 UTC, deadline 07:37:08.729066 UTC, finish 07:37:11.688953 UTC. The authoritative outcome remains `timeout`, with `mathematical_resolution: false`, no structured `final.json`, and no `turn.completed`. The final Audit build completes at event 250; its replay starts at 251 and passes at 254. The last check is estimated to finish 16.952942 seconds before the deadline. Finalizer failure is event 258, and all 123 started items have completion events; there is no pending recorded command to presume eventually successful.

The last activity record, 0.615401 seconds before the deadline, reports 714,949 bytes, exactly the retained event-stream size. Together with the earlier event-file modification time, this supports retention of the failed finalization before cutoff. Individual events have no wall-clock timestamp, so this audit does not invent an exact finalizer time. No late successful finalization or missing probe replay is evidenced.

## Principal source hashes

The complete module/hash/receipt mapping is preserved in the supporting evidence. Principal final-source SHA-256 values are:

| Source | SHA-256 |
|---|---|
| `MarkovInteriorSourceFDDA.lean` | `1382e051fcb8bea7bb1ceae76d6f2bab6cfc28f734c9bbcf39fcfd5dc7ff7aee` |
| `MarkovAllCoefficientsFDDA.lean` | `c735efbf3b49cbc3fd816ca3160199a3420c8fd18d6bf5ec1aa82506c583470a` |
| `MarkovExtractFDDA.lean` | `ac8b449476e813ac54448b9ae0d919122b954b4460fe74d73d82ef1dd2ca20f0` |
| `MarkovExtractAllFDDA.lean` | `5dcd6cc421a72a21c9e01bf366870e02ec07f1b72c0f7d6658367b5e0ad242e6` |
| `MarkovNormalSourceFDDA.lean` | `e83c2f7da8c759d528cb6ab01abf49064f38a62c6f812a070a8d814e81beb8dd` |
| `MarkovNormalSourcePartsFDDA.lean` | `a4c99b89d1fc80c55be51147a9b9601efe9bc2b2ebbb7e1d5a5712cad9dc74ab` |
| `MarkovNormalCombineFDDA.lean` | `d20c95150f645cc865fbb36eb095cddd46011d671b7e7831061689ce2ffa7e07` |
| `MarkovNormalJetsFDDA.lean` | `3e21eaaf737298f53611b6b1f3e35de5244a26b6b18e12e0a42ce0feabdb036c` |
| `MarkovAuditFDDA.lean` | `11fc8c8b404c18decb2b374241dddd1c549d0d60571cd5a44bdfc943dfac2efe` |
| `MarkovImportProbeFDDA.lean` | `f433f75ebebe0e4c7472ce1f00f0c6916f0377d9ef18b44e02ca9e328c31c913` |

The accepted mathematical gain is the unconditional restricted third-lower-diagonal strip and exact whole-slice coefficient representation. Full third-slice log-concavity, the full conjecture and aggregate worker acceptance remain unestablished by this batch.
