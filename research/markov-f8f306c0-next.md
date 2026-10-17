# Revisable next actions

Machine-authored f8f306c0. Full pinned Conjecture63 remains open.

The inherited h=t absorbed-cut boundary is now proved, including d=t+1.
Do not rerun the two old unvalidated boundary certificate modules. The new
validated boundary is MarkovBoundaryClosedMF8F.absorbed_boundary_sourceMF8F
(namespace MathGKM.Markov); its twelve scalar certificates and four exact
parameter bridges are included in this run's validation selection.

The most direct remaining route is now:

    AbsorbedUncutMF8F and AbsorbedBorderMarginMF8F.

Their conjunction is proved equivalent to AbsorbedMiddleM418 in
MarkovAbsorbedBorderMF8F. The first tests only uncut gaps at t<=k<=2t+2.
The second asks whether the old lift-cut gap at the single coefficient t+h
dominates alpha(d,t,c)*L(j,t+2,t+2-h), for h<t. All other cut coefficients
follow by the proved low-coefficient identity or by removing nonpositive
summands from the uncut gap.

An alternative sufficient candidate BorderDominanceMF8F compares these old
gap/terminal-coefficient ratios to the already closed h=t ratio. It is
independent of the source correction and is proved to imply the required
border margin. The exact rational finite probe found the ratios increasing
as m=t+2-h increases. There is no universal proof of this monotonicity.

Another possible route uses the complete perturbed reversed kernel and
normalized pair order. Finite tests passed. Only the outermost normalized
pair step is made harder by adding a positive coefficient at reversed index
zero; the adjacent n=1 step is improved and n>=2 steps are unchanged. This
last observation is algebraic reasoning, not a new formal transport theorem.
The relaxed n=0 candidate in pair_edge_f8f306c0.g has positive GAP numerator
and denominator coefficients, but the expression has 24,434/22,589 terms.
Its gcd reduction timed out after 60 seconds. Do not blindly repeat that
expansion or assert its source transport/Lean positivity has been proved.
The two-test reduction avoids needing this large certificate.

Retain FirstCorrectionWindowM418, ThreeBeyondCorrectionM418 and OtherFourM9E2
in full. No new entire source direction, numerator>=4 family, or full root
has been closed. All coverage, source-family, homogeneous/raw-coefficient,
polygon, direction/zero/endpoint and assumption obligations still govern any
completion claim, together with a fresh whole-source rebuild and the separate
independent hash-bound English/source audit.
