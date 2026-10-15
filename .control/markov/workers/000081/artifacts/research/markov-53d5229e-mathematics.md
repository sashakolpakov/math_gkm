# Reversing the third lower-slice tail

Machine-authored research for request `53d5229e9f134234a21bc350e491d476`.
Full pinned Conjecture 6.3 remains open. The final validation inventory governs
acceptance of all declarations named below.

## Reconciliation

Read MISSION.md and docs/DESIGN.md completely, the pinned root and contract,
inherited evidence index, the independent target/residual/mathematical audits,
latest research reports and worker 77–80 raw event logs. All 343 inherited
manifest checks passed. Worker 80 completed its repaired two-band source build
but stopped during its final union replay; that replay left no receipt. Its
audit inventory also predates the final source composition. No generator or
finalizer was blindly rerun and no predecessor file was changed.

A fresh 39-module union replay timed out at 150 seconds. This is not a failed
mathematical theorem. A smaller replay of `MarkovTwoBandsSource07F1` succeeded,
and a fresh axiom audit of the recorded inventory compiled with permitted
closures. The final report distinguishes these checks from a whole-source
rebuild or an independent admission audit.

## New identity

Let `T=thirdRunPolyADB2 n c r`, and set `q=max(2r-c,0)`. The existing exact
denominator identity has four delayed numerator bands. For `c≠2`, it reads

    (1-X)^6 T = K0 + X^(n+2) K1 + X^(2n+3) K2 + X^(3n+4) K3.

The new coefficient extraction retains K2. For `2n+5≤j≤3n+3`, put
`k=3n+3-j`. Then `15*T_j` equals `tailLow53D c r k` if `2r≤c`, and
`tailHigh53D c r k` if `c≤2r`. These are explicit quintic polynomials in k
and cubic polynomials in c,r. **The run length disappears after reversal.**

The identities follow from exact falling-factorial identities and inversion
of `(1-X)^6`; the experimental symbolic expansion is independently checked
by Lean's ring tactic. `MarkovTailCoefficients53D` proves the coefficient
identification for every natural n,c,r,j in its stated range.

## Inequalities and crossing coefficients

Positive-coefficient gap certificates use four exhaustive parameter cases:
low chamber with r=1 or r≥2; high chamber with c-r=1 or c-r≥2. The low tail
gap is proved for k≥2, with k=1 handled separately. The high tail gap is
proved for k≥0. The source adapter transports these to unnormalized raw
source coefficients for `2n+5≤j≤3n+1`, `c≥4`.

Six exact crossing coefficients at `j=2n+1,...,2n+6` connect to the previous
two bands. Sixteen chamber gap certificates address the four crossing triples.
The compiled and separately replayed composition `source_third_three_bands53D` covers all starting
indices `j≤3n+1` for n≥5 and c≥4. Its acceptance must be checked in the final
validation inventory, not inferred from the experiment or this description.

## Exact finite checks

`experiment_53d5229e.py` checked 672 sources, 11,760 identity positions,
396 positions against the independent literal polynomial recurrence, and
26,544 polygon-valid consecutive triples. No failure occurred in the claimed
ranges. These checks are not universal proofs.

At n=5,c=4,r=1, the source is 21/25. At j=19, outside the established range,
the uncorrected reversed-tail expression predicts -360 for the scaled
coefficient while the actual scaled coefficient is zero. The omitted fourth
band is essential. This refutes extrapolation of the formula, not Conjecture
6.3. The saved experiment includes further mismatches and every tested input.

## Remaining mathematics

The new Lean theorem source_third_remaining_terminal53D proves that any remaining polygon-valid starting index is exactly 3n+2 or 3n+3. Its proof uses c(j+2)≤3b and r<c. These far-end triples need the fourth-band
correction and polygon guards. The predecessor denominators 2 and 3 and runs
below 5 need their actual corrected formulas. Even a completed third lower
slice would leave all other residual slices and horizontal/vertical directions,
plus the root's correspondence obligations. No root closure is claimed.

## Operational limits

Sage and SymPy were unavailable; GAP was found but not invoked. Hosted live
source access succeeded. The higher-priority sandbox denies `.scratch`, so
new persistent research/evidence paths were used. Pinned dependencies were
not updated. Explicit chamber rewrites and restricted cast simplifications
repaired rejected coefficient adapters. Multiple simultaneous large builds
timed out; algebraic expansion was split into separate checked identities and
concurrency reduced. All rejected snapshots and receipts are retained.
