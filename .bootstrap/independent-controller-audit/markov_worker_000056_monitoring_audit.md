# Independent monitoring audit: worker 000056
Request `7955df0c4dc1407e99579ba90e1017ab`, reviewed 2026-10-14. This is a read-only mathematical and recorded-evidence audit. No research source was edited; no proof advice, proposer contact, active-worker interference, numerical rerun, compilation, or replay retry was performed. Exact reviewed bytes, selected receipts, hashes, and event history are saved in `markov_worker_000056_audit_evidence/`. A separate static formula/finite-scope review is saved as `markov_worker_000056_formula_audit.md`.

## Verdict

All **six final modules, containing 28 named theorems, compiled successfully**. Three algebraic helper modules, containing **21 named theorems**, completed direct separate kernel replay. The literal coefficient-source module, final horizontal-source theorem, and exact residual equivalence have successful compilation but only timed-out separate replays. Both later coefficient-source and residual attempts completed as timeouts before the controller deadline; there is no omitted late replay success.

The new source theorem really establishes raw horizontal log-concavity for every generated source, on the slice whose **left point** has total degree `a+b−4`: equivalently `i+j+3=a+b−1`. It includes zeros and correctly handles the small-degree polygon cases. There is no denominator, slope, run-length, or finite-experiment restriction. The exact remaining-root equivalence removes that horizontal slice only, retaining the other directions, all original polygon guards, and inherited endpoint handling. It does not prove the remaining predicate or the full conjecture.

No mathematical English/Lean mismatch was found in the reviewed source translation. The finalizer's index and operation count are temporally incomplete, as detailed below; the accepted source/artifact hashes and the three-versus-six replay classification remain correct.

## Final validation status

| Module in `research/` | Named theorems | Final compilation | Direct separate replay |
|---|---:|---|---|
| `MarkovNextCertificate7955.lean` | 13 | exit 0, 211.073 s | exit 0, 135.717 s |
| `MarkovNextBinomial7955.lean` | 7 | exit 0, 49.395 s | exit 0, 69.709 s |
| `MarkovNextAlgebra7955.lean` | 1 | exit 0, 20.776 s | exit 0, 102.730 s |
| `MarkovNextSource7955.lean` | 4 | exit 0, 27.322 s | timeout, 130.010 s; timeout, 160.175 s |
| `MarkovNextHorizontal7955.lean` | 2 | exit 0, 47.851 s | timeout, 145.016 s |
| `MarkovInterior7955.lean` | 1 | exit 0, 33.979 s | timeout, 155.012 s |

For every final module, the source bytes match the final validation SHA256, successful build snapshot, controller change hash, and archived source. Every selected final-source replay snapshot and receipt also matches its source, controller hash, and archive, including the timed-out attempts. The current `.olean` bytes match the worker artifact index, controller hash, and archive. No validation filename collision appears in completed validator-command records; the module and mode are included in receipt filenames.

Successful printed main-theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`. The final sources contain no admissions or custom axioms. Some rejected elaborations printed `sorryAx` because their proofs failed; those records have nonzero exit codes and different source hashes, and are not selected as successful results. This audit reviewed the recorded checks; it did not independently rerun exhaustive axiom closure or kernel checks. The worker explicitly reused inherited compiled imports rather than rebuilding all inherited source.

### Late timeout receipts and stale finalizer index

The saved manifest and artifact index were finalized around **21:18:24–25Z**, before three additional replay outcomes:

- Horizontal source replay: timeout after **145.016 s**, record written **21:18:44.484441Z**, archived event 179.
- Residual equivalence replay: timeout after **155.012 s**, record written **21:19:57.601493Z**, archived event 185.
- Coefficient-source second replay: timeout after **160.175 s**, record written **21:20:21.349570Z**, archived event 188.

All three are present in the controller archive and match its change hashes. All precede the controller timeout at **21:20:29.731078Z**. The coefficient-source first replay had already timed out at 130.010 seconds. Thus no further successful replay was hidden by the finalizer cutoff.

`operational-observations.json` and `report.json` count seven rejected/timed-out attempts as of finalization; there are now **ten** such saved records after adding the three late timeouts. Their records are absent from the earlier `artifacts.json` hash index. The progress note and finalizer script were also updated after that index, so their current hashes differ from that particular index; their final bytes do match the controller archive and receipt. The last script update added an explicit sentence identifying unreplayed modules, but no subsequent finalizer invocation appears in the event log, so that sentence is absent from the generated report. The report already distinguishes compilation from replay and leaves completion null.

These are stale ancillary bookkeeping snapshots, not mismatched accepted Lean sources or a successful result falsely classified as complete. The final progress sentence says the two replays are still running because it predates their timeout receipts. The controller recorded `outcome: timeout`, elapsed 1202.673 seconds, `report: null`, and `mathematical_resolution: false`, even though its subprocess return code is zero.

### Final source hashes

```
MarkovNextCertificate7955 f643df4c10d10c27603917a4df7fc9bbac9e7bfcc16554181d05897da1d4572c
MarkovNextBinomial7955 257787fd9e899cd66c6dfbd1cb690ab437b03a30e5af11f5309aa62c90c05ede
MarkovNextAlgebra7955 5c7925e34d55e9ff277d2f9f1c0f1a3520376b78a60b524c8c440d175d435888
MarkovNextSource7955 c91ca1b72bad13c6e4ea1d815781235a06302a659d56e87183bba2c2150505f1
MarkovNextHorizontal7955 df9f8e0cba31bf8d392a75e4ec916d7e723f2187d9404c11e8ff07d8b5d59cac
MarkovInterior7955 7870d4e6525a844416ceda4939afdbf4811608ea62ea3f880a8da0287c2dcaf8
```

## Exact mathematical statement and source meaning

Let `(a,b,P)=(frame path).mid`, and let `A(i,j)=coeff P i j` be the original integer coefficient in the squared variables. Put `d=a+b−1`. The new theorem is

`A(i,j) A(i+2,j) <= A(i+1,j)^2`

for every finite Boolean source path and natural `i,j`, under the original left polygon guard and `i+j+3=d`. The right endpoint consequently has total degree `d−1`; this is not a diagonal comparison within one homogeneous slice. The original omitted homogeneous exponent remains `d−i−j`. No alternative source word, normalized coefficient sequence, or filtered positive-support sequence is substituted.

Only the left polygon guard is needed in `source_next_horizontal7955`. Increasing `i` preserves its lower polygon inequality, and the slice equality implies both other points remain below the upper degree bound. The exact residual nevertheless retains all three original guards. `source_next_horizontal_large7955` is stronger: for `i+j>=3` its source inequality requires no polygon premise at all, only the exact slice relation.

The proof is genuinely universal over the source recurrence. It uses the inherited source upper-slice identities and the exact fourth-source quotient identity to derive coefficient formulas. It does not assume horizontal log-concavity as a premise or promote a finite symbolic scan to a source theorem.

## Coefficient bridge, signs, and cancellation

Set `D=i+j`, `N=b−1`, `B=a−1`, and `F=choose(D,i)`. For `D>=3`, the source module gives the exact identities in real casts of the original integer coefficients:

- `6D(D−1)(D−2) A(i,j) = F T(s)` for an actual natural switch count `s`.
- `2D(i+1) A(i+1,j) = F Q`.
- `(i+1)(i+2) A(i+2,j) = (D+1)F [N(i+2)+Bj]`.

The `Q` and `T` expressions agree with the displayed mathematics document. The final identity for the right coefficient is valid without the `D>=3` premise; the lower and middle bridge statements retain it. In the lower bridge, the inherited source identity provides natural `n,m,s` with `n+2=b`, `m+1=a`; these are translated to `N−1,B,s`. Its switch count is source-linked. No freely chosen artificial count is used to fit the coefficient.

From the actual reduced source labels, `B>=0`, `N>=B+1`, and `N+B=D+2`. Consequently `2B<=D+1`. The new algebra theorem proves the inequality for real values satisfying those exact coefficient identities and `s>=0`; it does not require positivity of `F` or of any raw coefficient.

The replacement `T(s)<=T(0)` is justified by the exact difference `12 s i j(j−1)`. Here `i,j` are naturals, so `j(j−1)>=0`, including `j=0` and `j=1`. This sign argument is not asserted for arbitrary real indices. The remaining multiplier has the appropriate nonnegative sign because `N,B` satisfy their stated bounds.

After the certificate for the zero-switch gap, the actual gap is multiplied by

`12 D^2 (D−1)(D−2)(i+1)^2(i+2)`.

The proof explicitly shows this factor is strictly positive under `D>=3`, and cancels only that factor. `F^2` stays on the nonnegative side; neither `F` nor a possibly zero source coefficient is divided out. Hence zero coefficients are retained rather than assumed absent.

The four exact polynomial certificates cover `i>=3`, `i=2`, `i=1`, and `i=0`, using the corresponding nonnegative shifts `i−3,j` or `j−1,j−2,j−3`. Their ring identities and sign proofs are Lean theorems in the directly replayed Certificate module. The symbolic Python artifact is not the sole evidence for these equalities.

## Binomial zero cases and small source degrees

The binomial bridges use natural polynomial exponents and explicit coefficient bounds. For shifts one, two, and three, insufficient `i` is handled by coefficient-zero cases; for the constant/low shifts, insufficient `j` is handled explicitly using choose-equals-zero. `next_coeff_three7955` even holds without the total-degree lower bound, because its small-degree cases vanish. The other coefficient identities retain `D>=3`, preventing truncated natural subtraction from silently turning an intended negative polynomial exponent into an unjustified formula.

When `D<3`, the source theorem does not use the positive-factor cancellation. The original polygon lower guard and `a<b` imply `a<=D`. If `a` were not one, the remaining degree constraints force `(a,b)=(2,4)`, contradicted by the actual source coprimality theorem. Therefore `a=1`, and the proof invokes the inherited universal numerator-one source theorem with all three polygon guards. Under these constraints the actual nonvacuous cases have `D=1` or `D=2` (labels `1/4` or `1/5`). Degree zero is excluded by the polygon guard and positive numerator. This is a source argument, not a deletion of small-index cases.

## Exact residual equivalence

`Interior637955` has these clauses for every source path:

- Horizontal: all original three guards, with `i+j+4<=d`.
- Vertical: all original three guards, with `i+j+3<=d`, unchanged.
- Diagonal: all original three guards, with `i+j+5<=d` and `a+3<=i+j+2`, unchanged.

`root_iff_interior7955 : Conjecture63 ↔ Interior637955` follows from the inherited `root_iff_interiorD052`. In the reverse implication, a formerly remaining horizontal triple satisfies `i+j+3<=d`; either the new deeper condition holds or integrality forces equality `i+j+3=d`, exactly the new theorem's domain. No horizontal case is lost between the two ranges. The forward implication simply restricts the root inequalities. Both endpoint clauses are retained through the inherited equivalence, rather than silently removed from the original root.

The residual predicate remains infinite and unproved. The equivalence itself compiled with the permitted printed axioms, but its direct separate replay timed out. There is no proof or refutation of the protected full conjecture.

## Finite observations and vertical envelope

The saved numerical/symbolic experiments are finite supporting observations, not additional Lean conclusions. The abstract envelope scan counts 253208 direction evaluations over 126604 parameter tuples; only 126604 are horizontal evaluations, with the other half vertical. The worker records 1259 source fractions through denominator 64, 231942 coefficient-identity comparisons, and 77183 raw comparisons in each of the horizontal and vertical directions. The source scan covers every proper reduced fraction through denominator 64, but its coefficient identities use only `D=a+b−4>=3`: 77314 positions, each with three identities. The lower polygon guard selects 77183 triples per direction. The separate follow-up vertical parameter scan has no coprimality restriction: 374452 guarded samples evaluated at each of `s=0,2`, for 748904 evaluations; its first zero-switch failure `2/6` is not a reduced-source witness. These counts were independently checked from loop bounds, without rerunning any polynomial/transfer routine. The separate static formula audit records the complete parameter bounds and candidate-certificate scope.

The switch-zero vertical envelope has negative cleared gaps, including the virtual parameter example `D=3,B=1,i=1,j=2` and an actual source `2/7` example at `(1,4)` with raw vertical coefficients `[4,8,12]`. The latter raw inequality holds: `8^2−4*12=16`. The negative quantity belongs to the auxiliary zero-switch envelope, not to the raw source gap. This distinction is explicit in the documents and report. The later vertical symbolic cases and bounded switch-two tests are labelled candidates; none of the six new modules asserts a new universal vertical inequality.

## Final scope

The new horizontal strip is an actual source theorem, with correct raw coefficients, zeros, polygon interpretation, small-degree treatment, and universal path scope. Direct replay is complete for its algebraic helpers, incomplete for the three source/residual modules. The finalizer has the specific late-record and two-file hash-index omissions documented above; the exact accepted Lean source and compiled artifact provenance is consistent.

The protected `MathGKM/Markov.lean` remains at SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Full Conjecture63 remains unresolved.

Final comparison at **2026-10-14T21:27:55.139612+00:00**: all **77** saved active inputs still match their reviewed hashes. The completed formula subaudit found no discrepancy; its only count qualification is that 253208 includes both directions. No additional compilation, replay, or numerical experiment was performed.
