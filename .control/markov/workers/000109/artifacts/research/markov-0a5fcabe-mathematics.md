# Mathematical checkpoint, request 0a5fcabe

Machine-authored live experimental research. The pinned `MathGKM.Markov.Conjecture63` and its negation remain unproved. Consult `evidence/markov-0a5fcabe/validation.json` for source-bound compilation, replay and axiom status; a candidate file alone is not accepted evidence.

## Reconciliation and exact residual

Worker 108 was reported as timed out, but its raw event log shows its final inventory command completed successfully. All 344 changed artifact hashes matched, and the inherited index was checked against current bytes. No incomplete side effect was replayed. The only pending mathematical candidate was the numeric residual equivalence. Its missing whitespace also exposed overloaded Mathlib notation during compilation. A new, corrected module `MarkovResidualSmallGapM0A5` compiled and passed kernel replay. It proves `Conjecture63 ↔ InteriorCore63SmallGapM0A5`, with that residual still unproved. The fourth-slice portion retains the five small predecessor families; higher slices and horizontal/vertical interiors remain.

## Universal small-cycle source corrections

Write `path = replicate n true ++ false :: rest`, `c=(frame rest).mid.b`, `r=(frame rest).mid.a`, `a=cn+r`, `b=c(n+1)+r`, `H=1+X`, `E=X^b`, `F=firstRunPolyADB2 n c r`, and `S=secondCompressed446 n c r`. Let T be the actual fourth cut polynomial, so `[X^j]T` is the raw coefficient at `(i,j)` when `i+j=a+4`. Let B be the inherited `fourthExplicitRunBE n c r`, which already uses corrected second and third moments.

The new checked source identities are:

- c=4: `24 T = B + 24 E`.
- c=3: `24 T = B - 48(F+H)E`.
- c=2 (necessarily r=1): `24 T = B + 24(3F²+4FH+3H²-S)E + 36E²`.

These hold for every natural n and every actual predecessor path with the indicated denominator. They are derived from the literal source trace and its determinant, not from interpolation. The fourth cyclic statistic is expanded on cycles of lengths four, three and two. In the two-cycle case the missing third look-ahead contributes `-24 c₁ E`, which is combined with the determinant and second trace identities. This is why simply extrapolating the large-cycle moment is incorrect.

The source declarations are in `MarkovFourCycleM0A5`, `MarkovThreeCycleM0A5`, and `MarkovTwoCycleM0A5`. Their successful source versions passed kernel replay.

Define `S₀=S-2E` for c=2 and `S₀=S` otherwise. The new `plainFourthM0A5` is

`G = M₄ + 6H⁴ + 4F M₃ - 8F H³ + 3S₀² - 2F⁴`,

where M₃ and M₄ are the inherited local moment expressions. Algebraic assembly gives the particularly simple source defects:

- c=2: `24 T-G = 12(2F²+4FH+6H²-S₀)E`.
- c=3: `24 T-G = -24(F+2H)E`.
- c=4: `24 T-G = 24E`.
- c≥5: the defect is zero.

`MarkovPlainFourthNormM0A5` proves `(1-X)^8 G = fourthNumeratorBC(n,X^n,X,c,r)` for all natural parameters. The first moment normalization is unrestricted; the second normalization explicitly removes its c=2 correction instead of assuming it absent. This is a uniform polynomial identity, not division by any coefficient.

## Inequalities and remaining scope

`source_fourth_initial_fourM0A5` proves the raw fourth-slice adjacent inequality for c=4 and `5≤j`, `j+2<n`. This is an infinite new region with both r=1 and r=3 retained. The statement needs only the slice equality, so it also applies to every polygon-valid triple in that region. `MarkovResidualCyclesM0A5` proves an exact root equivalence excluding this solved region; its residual remains unproved.

The all-cycle extensions compiled. `source_fourth_all_valueM0A5` identifies 24 times every raw fourth-slice coefficient with `fullFourthValueM06` plus the exact correction coefficient, for every run and actual predecessor, with no lower bound c≥5. `source_fourth_all_lc_iffM0A5` is the exact adjacent-inequality equivalence for this corrected value; it does not prove that inequality in general. The correction coefficient is zero at every j<b.

`source_fourth_initial_all_cyclesM0A5` proves the same initial interval `5≤j`, `j+2<n` for **every predecessor cycle**, extending the new four-cycle result to denominators two and three as well. `root_iff_coreAllCyclesM0A5` is an exact root equivalence excluding that region; its residual remains unproved. Final replay and axiom status is recorded in validation.json.

For a fully explicit numerator, put D=1-X, f=firstNumBC(n,X^n,c,r,...,X), and s=secondNumBC(n,X^n,c,r,...,X). The polynomial `correctedFourthNumeratorM0A5` is the inherited fourthNumeratorBC plus:

- c=2: `12 E D⁴ (2f² + 4f H D² + 6H² D⁴ - s)`;
- c=3: `-24 E D⁶ (f + 2H D²)`;
- c=4: `24 E D⁸`;
- c≥5: zero.

`source_corrected_numeratorM0A5` proves `D⁸(24T)=correctedFourthNumeratorM0A5`. `source_corrected_binomialM0A5` extracts every coefficient as the exact convolution against `choose(7+j-k,7)`. This replaces the inherited interpolation candidates by checked identities and contains no unevaluated trace or source word on its right-hand side.

The complete remaining five small-cycle fourth slices are not proved. Neither higher lower slices nor the remaining axial interiors are resolved. No end-to-end root proof or refutation is claimed.

## Experiments

`research/experiment_0a5fcabe.py` checks all five small predecessor families for n=0..80. It passed 74,925 coefficient identities, retained 20,424 zero positions, checked 53,695 polygon-valid inequalities and compared 873 coefficients with the literal bivariate recurrence. All 405 cases passed, including 13,505 tested triples in the newly proved all-cycle initial interval. The correction test uses the extrapolated large-cycle numerator plus the explicit derived correction. The results are finite exact observations, not universal proofs.

## Operational limits

No packages were changed. Sage, GAP and SymPy availability is recorded in capabilities.json. The higher-priority policy denies `.scratch`; temporary work used `research/work-0a5fcabe` without accessing the denied directory. A zsh heredoc failed because it attempted to create a forbidden temporary file; subsequent edits used the file-edit tool. Compiler timeouts, missing inherited compiled modules and rejected drafts are retained. The initial-interval proof uses the already checked weaker truncation lemma rather than the uncompiled stronger shift candidate. Inherited compiled imports were reused; this is not a fresh whole-source rebuild or independent completion audit.

## Final validation

All 17 mathematical modules passed source-bound compilation and kernel replay. All 53 named theorem closures have only propext, Classical.choice and Quot.sound. All 1,940 tracked input hashes are unchanged. Eighteen rejected attempts, including five wall-clock timeouts, are retained. No pending new mathematical candidates remain; the duplicate local-only diagnostic module is excluded. All foreground executions ended. No root completion is claimed.
