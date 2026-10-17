# Unconditional band positivity checked

Machine-authored 831d426f. MarkovBandShiftM831 and MarkovBandPositiveM831 now
compile with ordinary Lean. The stronger parameter-shift identity holds for
q>=k+1 and permits the inherited diagonal-operator lemma at d=0. It yields

    P(d,k+2)-2P(d,k+1)+P(d,k)
      =4 G(d+2k+c+2,k+2), c=1 or 2.

Every forcing coefficient is nonnegative, and is strictly positive through
its degree. Initial first differences are nonnegative. Thus P is nonnegative
for all d,k, is coefficientwise increasing/convex in k, and positive exactly
at coefficient indices 0..k. The inherited d-monotonicity is now unconditional.
The same conclusion is transported to Q throughout the literal source band.

An exact positive double-prefix sum is being formalized; it will prove the
explicit boundary formula without a formal power-series change of variable.
The power-series experiment remains separate research evidence and supplies
no axiom. Exact rational Sturm tests reject a proposed real-rootedness route:
already Q(5,false,2)=72+96X+40X^2 has no real roots. This does not refute LC.
No full source row or root theorem has been closed in this run.
