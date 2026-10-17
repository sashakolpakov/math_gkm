# Exact linear-cutoff theorem and beta comparison

Machine-authored live request ca9709f2af7048a4813bd37d46ae4ce9.
Full pinned MathGKM.Markov.Conjecture63 remains open. All results below are
partial results, not a proof or refutation of the full root.

## Closed comparison argument

Keep the inherited raw kernel K_i(d,s)=C(s,i)C(d+s+i+8,i+3) and
M_i(d,T)=K_i(d,T)+4 sum_(s<T)(T-s)K_i(d,s).
For a=i+1,H=d+2i+9,Q=d+i+6, set q_0=1 and
q_(k+1)/q_k=(H+k)/(Q+k), and w_r(k)=4(r-k) for k<r, 1 for k=r,
and 0 otherwise. Let rho_k=C(i+k,i)q_k w_r(k).

MarkovTopBetaMeanMCA9 defines the doubled scalar

 F2(k,l)=2(a+1)(a+4)k(H+k)l(H+l)
         -a(a+3)[k(k-1)(H+k)(H+k+1)+l(l-1)(H+l)(H+l+1)].

For W_k=C(i+k,i)C(i+m-k,i), its exact beta expectation is

 (2a)(2a+1)(2a+2)(2a+3) sum W_k F2(k,m-k)
   =2a^2(a+1)m(m-1) B(a,m,H) sum W_k,

with the inherited explicit polynomial B=betaGapMDCB. The proof expands F2
into falling factorials and uses ten universal factorial moments; it includes
the small-order vanishing cases. No moment formula is assumed.

MarkovTopRadialCompareMCA9 proves a general finite covariance inequality for
two symmetric functions increasing toward the center, using min(k,m-k) to
compare arbitrary pairs. It retains zero weights. The scalar is increasing
toward the center for a>=1,H>=2: it is a quadratic in p=k(m-k) with
nonnegative coefficients except the constant term. The actual relative
likelihood q_k q_(m-k) w_r(k) w_r(m-k) is symmetric and inward-increasing by
the inherited CrossLC theorem. No arbitrary-log-concave-weight shortcut is used.

MarkovTopBetaComparisonMCA9 assembles this covariance with the positive base
mean. The actual pair mass is positive for every m<=2r, with witness k=min(m,r).
Consequently each weighted doubled-scalar antidiagonal is positive for
2<=m<=2r and i+4r<=d+1. Groups m=0,1 vanish exactly.

MarkovTopBetaGroupingMCA9 proves the finite antidiagonal regrouping with zero
extension, then the identity

 sum_m sum_(k+l=m) rho_k rho_l F2(k,l)
 =2[(i+2)(i+5)(sum rho_k k(H+k))^2
    -(i+1)(i+4)(sum rho_k)(sum rho_k k(k-1)(H+k)(H+k+1))].

MarkovTopBetaTransportMCA9 proves D_k C(i+k,i)q_k=P_k from the exact binomial
recurrence, then D_r rho_k=w_r(k)V_(r,k) for k<=r. Applying this to all three
sums identifies the right-hand gap with tailGapMDCB after multiplication by
D_r^2. The denominator is proved positive. All algebraic scaling is removed
before the raw conclusion; these are not normalized-coefficient inequalities.

Thus for all natural d,i,r, with r>=1 and i+4r<=d+1,

    M_i(d,i+r) M_(i+2)(d,i+r) < M_(i+1)(d,i+r)^2.

This closes the beta proof route from research/markov-dcb64029-beta-proof.md.

## Source consequences

MarkovTopLinearSourceMCA9 uses the established coefficient and source bridges.
The i=0 kernel triple was already strict without a cutoff. Combining it with
the new bound for i>=1 gives all kernel columns when 4T<=d+4, T>=2, including
the zero tails. This improves the initially proposed all-row bound by three.

For the upper template, n=b, T=t-3,d=b-2t. Every horizontal inequality is
proved when t>=5, 2t<=n, 3t<=n+5 and 6t<=n+16. For actual numerator-three
sources b=3q+1 or 3q+2, q>=1, 5<=t<=q+2, the first two inequalities follow
from the sector hypotheses. The source row is j=b+2-t.

The stronger per-column conclusion is strict for starting column c>=3,
c+1<=t and 6t<=b+3c+4. If c+2<=t, the whole triple is polygon-valid;
the formal polygon theorem states all three memberships. The c=t-1 case
also satisfies a strict zero-tail inequality but is outside the three-point
polygon range, so it is not called a valid source triple.

The path-level theorem source_top_path_linearMCA9 quantifies over every path
with numerator label 3 and proves the raw horizontal inequalities at every
column whenever t>=5 and 6t<=b+16. The inherited classification supplies
q and the residue; the new bound itself implies t<=q+2. No finite path or
denominator restriction appears in this theorem.

## Exact residual, not root closure

MarkovTopLinearResidualMCA9 proves

 TopMomentBoundM55C iff TopLinearStripMCA9,

where TopLinearStripMCA9 universally quantifies d,i,r satisfying
i>=1, r>=5, i+r<=d+2 and d+1<i+4r, and requires tailGapMDCB>=0.
Thus each fixed i,r has only a finite interval of d left, but i,r are unbounded.
This strip remains open. The newly enlarged source closed region includes
both the row bound and the column bound, together with every inherited region.

The exact full-root equivalence is

 Conjecture63 iff ThreeFrontierMCA9 and OtherFourM9E2.

ThreeFrontierMCA9 retains the middle horizontal strip and the unchanged
vertical and diagonal clauses. OtherFourM9E2 is unchanged. Neither residual
is proved. Source correspondence and independent completion audit obligations
remain separate, and no completion is claimed.

## Validation so far

Seven new modules compiled, jointly replayed over inherited imports, and
45 theorem closures had only propext, Classical.choice, Quot.sound:
evidence/markov-ca9709f2/validation.json. This reused compiled inherited imports;
it is not a fresh whole-source rebuild or independent completion admission.

## Stronger extension in the full upper-sector parameter domain

MarkovTopWeightedBetaMeanMCA9 defines the signed polynomial-weighted base sum

 S=sum_(k=0)^m W_k (r-k)(r-(m-k)) F2(k,m-k).

It proves an exact identity with 21 falling-factorial moments and a cleared
sixth-order beta denominator. The resulting 123-term reduced polynomial is
strictly positive for a>=2,m>=2,r>=m+1,H>=3a+r+4: substituting
a=x+2,m=y+2,r=m+s+1,H=3a+r+4+z yields a 176-term polynomial with positive
nonzero coefficients, checked in Lean by ring normalization and positivity.
The untruncated polynomial weights are not claimed nonnegative outside this
domain. The a>=1 expansion has three negative coefficients and is not used.

When m<r, the actual two endpoint-modified weights are exactly
16(r-k)(r-(m-k)) everywhere in the sum; neither singleton endpoint is reached.
MarkovTopLowerGroupsMCA9 uses the same radial covariance with q_k q_(m-k),
now taking W_k(r-k)(r-(m-k)) as the nonnegative base. It proves

 betaGroupMCA9(d,i,r,m)>0 whenever i>=1, i+r<=d+2 and 2<=m<r.

Thus these lower antidiagonals are closed throughout the full source-sector
domain, without the earlier linear cutoff. MarkovTopEndGroupsMCA9 separately
proves strict positivity at m=2r (r>=1) and m=2r−1 (r>=2), by pointwise
scalar positivity on their one- or two-point supports. It retains the zeros
outside that support explicitly.

The remaining sufficient condition CentralBetaMCA9 asks for nonnegative
groups only when i>=1,r>=5,i+r<=d+2,d+1<i+4r and r<=m<=2r−2.
MarkovTopCentralGroupsMCA9 proves this is equivalent to UpperHalfBetaMCA9
and sufficient for TopTailResidualMDCB, TopMomentBoundM55C, and every raw
upper-sector horizontal source inequality. CentralBetaMCA9 is not proved,
and it is not claimed equivalent to the full coefficient gap or the root.
Negative groups could in principle cancel in a positive total; the exact
remaining coefficient condition remains TopLinearStripMCA9.

MarkovTopPTiltObstructionMCA9 formally checks that a different p=k(m−k)
base tilt has sum −1340117822782233600 at a=4,m=98,H=65. These parameters
correspond to i=3,d=50,r=49 in the source-sector parameter domain. The actual
terminal antidiagonal is formally positive. This refutes an auxiliary shortcut,
not any raw source inequality.

Final validation extends the earlier receipt to twelve modules and 73 theorem
closures, with joint isolated kernel replay and only permitted axioms. See
evidence/markov-ca9709f2/validation.json. The same whole-source and independent
completion-audit limitations remain.
