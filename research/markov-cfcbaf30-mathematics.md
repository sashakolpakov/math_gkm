# Mathematical report, request cfcbaf30

Machine-authored live experimental research. The pinned `MathGKM.Markov.Conjecture63` and its negation remain unresolved. Source-bound validation receipts, not the presence of a candidate file, determine which declarations passed compilation, kernel replay and axiom inspection. See `evidence/markov-cfcbaf30/validation.json` once finalized.

## Reconciliation and representation

Read MISSION.md and docs/DESIGN.md completely, the pinned contract and actual request, the inherited index and the independent target-definition, residual-scope and mathematical audits. Checked all 153 changed artifact hashes in completed worker 109's receipt, its 265 raw events, and all six inherited index entries. There were no unfinished commands. Worker 109 had already reconciled interrupted worker 108; its preserved reconciliation and inputs were checked, and no old generator or potentially completed side effect was replayed.

The source is the actual path `replicate n true ++ false :: rest`. Put `c=(frame rest).mid.b`, `r=(frame rest).mid.a`; then its indices are `a=cn+r`, `b=c(n+1)+r`. On the fourth lower slice `i+j=a+4`, the inherited cut-polynomial coefficient equals the literal raw source coefficient. Only the five predecessor pairs `(c,r)=(2,1),(3,1),(3,2),(4,1),(4,3)` remained after the inherited large-cycle proofs.

The new specialized numerators are derived from the checked `correctedFourthNumeratorM0A5`, including every short-cycle correction. For each pair there is an exact identity

`(1-X)^8 (24 T) = sum A[s,k](n) X^(s*n+k)`.

Here T is the actual source fourth cut, and the displayed finite polynomials `A[s,k]` are explicit integer polynomials in n. For c=2,3,4 the maximum run-shift s is respectively 2,3,4. The denominator-two and denominator-three source defects cancel the extrapolated higher-shift blocks. The identity is proved by ordinary ring arithmetic from the source correction theorem, not inferred by interpolation.

`source_small_value21MCFC`, `source_small_value31MCFC`, `source_small_value32MCFC`, `source_small_value41MCFC`, and `source_small_value43MCFC` identify 24 times every raw coefficient with the corresponding `smallValue` sum. Each summand is

`A[s,k](n) * (if s*n+k <= j then choose(7+j-(s*n+k),7) else 0)`.

The guard precedes natural subtraction, so out-of-range coefficients are zero and cannot collapse onto the constant coefficient. No raw coefficient is divided out.

## Inequality certificates and exhaustive coverage

For n>=7, partition the start index j into intervals between consecutive shifts s*n and the short transition windows. The exact binomial identity `5040 choose(m,7)=m(m-1)...(m-6)` converts each active block into an integer polynomial. A falling-factorial polynomial also handles the first seven zero binomials beyond a shift, under its checked range hypothesis. Inactive blocks remain literally zero.

Each coefficient chart uses the same scale: `5040 smallValue = 16 chart`, equivalently `7560 raw = chart`. Thus the subsequent cancellation uses a positive constant shared by all three positions, with no factorial or binomial normalization depending on j.

For a chart interval `s*n+L <= j <= (s+1)*n+U`, introduce the nonnegative distances `x=j-(s*n+L)` and `Z=(s+1)*n+U-j`. Then `n=x+Z+L-U`. The adjacent gap expands into an explicit polynomial in x,Z with nonnegative coefficients. For each transition window, j=s*n+t has fixed t and the gap is a polynomial in n-7 with nonnegative coefficients. `ring` checks the exact identities, and `positivity` proves the resulting sums nonnegative. No experimental certificate is admitted as an axiom.

The interval starts, ends and transition windows cover every natural `0<=j<=cn+r+2`. This is exactly the bound supplied by `i+j+2=a+4`; no polygon point is dropped. For c=2,3 the n=0,...,6 complements, and for the required c=4 range the n=4,5,6 complements, use `interval_cases` and exact `norm_num` arithmetic on the same checked coefficient formula. They are finite proof components within a proof for every natural n, not an experimental inference from a bounded scan.

The three `MarkovCycleComplete21MCFC`, `MarkovCycleComplete31MCFC`, and `MarkovCycleComplete32MCFC` modules assemble all run lengths for c=2,3. For c=4 the focused `MarkovCycleGeFour41MCFC` and `MarkovCycleGeFour43MCFC` candidates assemble n>=4; these suffice because the inherited remaining slope condition 4b<5a forces n>=4. The broader all-run c=4 candidates remain unfinished and must not be counted as proved. `MarkovFourthAllCyclesMCFC` combines the required cases with the inherited large-cycle theorem, retaining both b>=a+2 and 4b<5a. The excluded b=a+1 family is already removed in the inherited exact residual, not silently discarded. `MarkovResidualFifthMCFC` proposes the resulting exact equivalence with `InteriorCore63FifthMCFC`, whose lower diagonal clause starts at a+5. That residual itself remains unproved; both horizontal and vertical interiors remain.

## Experiments and limitations

`research/experiment_cfcbaf30.py` tested all five pairs for n=0,...,50. It checked 23,868 corrected coefficient identities, 24,332 chart identities, 21,565 polygon-valid inequalities, and 567 comparisons with the literal bivariate source recurrence. It retained 1,797 zero positions. All finite checks passed; none is used as a proof of the universal result.

Sage and SymPy were unavailable. GAP was found on PATH but not used. `/bin/ps` was denied by the sandbox; no escalation or retry was attempted. The higher-priority policy denies `.scratch`, so work files were placed under `research/work-cfcbaf30` without accessing the denied directory. Failed compiler attempts, including a missing coefficient rewrite, binomial normalization failures and an overloaded-notation parsing error, are preserved as immutable source snapshots and receipts.

Inherited compiled imports are reused. This work is not a fresh whole-source rebuild and has no separate independent hash-bound English/source completion audit. Final compiler, replay, axiom and preservation status is recorded in the final validation and integrity receipts. Full root completion is not claimed.

Operational revision: the first union replay failed on the kernel recursion-depth guard in small_numerator_expand43MCFC. The unchanged replay body passed that module when run in a joined Lean task with a 128 MiB thread stack. This changes resource allocation only, not kernel checking or axioms. Two c=4 short-run compilation batches timed out. A split batch was explicitly interrupted, with two -2 compiler receipts retained, to focus on n=4,5,6 required by the exact residual. All final mathematical claims remain subject to validation.json.

Final scope: all 58 mathematical modules compiled; all 402 named theorem axiom closures passed. The final five-module source/reduction union passed kernel replay, as did the previously recursion-limited specialized numerator. The 33-module union timed out at 300 seconds; the second 20-module union was interrupted at the worker deadline and is not counted as passed. Full local replay coverage is incomplete and explicitly listed in validation.json. The exact residual equivalence is checked, but its residual is not proved. All foreground executions ended.
