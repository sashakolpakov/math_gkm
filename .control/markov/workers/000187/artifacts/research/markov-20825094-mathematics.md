# Actual-weight generator and a new raw source strip

Machine-authored live request 2082509481ba44c7bfe6fb10865a70b1.
Full pinned Conjecture63 remains unresolved.

Put a=i+1,H=d+2i+9,Q=H−a−2 and
t_k=C(i+k,i)(H)_k/(Q)_k, W_k=t_k t_(m−k), p=k(m−k).
Here the rising-factorial quotient is exactly betaQSeqMDCB; no probability
law is assumed. The new density recurrence proves detailed balance for

B(k)=(a+k)(H+k)(m−k)(Q+m−k−1),
D(k)=k(Q+k−1)(a+m−k)(H+m−k).

Define Lp(k)=B(k)(m−2k−1)+D(k)(2k−m−1). Finite reindexing, including
B(m)=D(0)=0, proves sum W_k Lp(k)=0. This uses the actual q-tilted base,
not the earlier q-free comparison that failed at large parameters.

Let F2 be the inherited doubled scalar betaScalarMCA9. Explicit polynomials
E,F,C0,Cp satisfy

Lp=F+E p−(8a+14)p²,
(4a+7)F2=−2(a+2)Lp+C0+Cp p.

Set den=(8a+14)m²−4E and define R by
C0*den+4Cp*F=a m(m−1)R. The checked pointwise certificate is

den(4a+7)F2 + [2(a+2)den+4Cp]Lp − a m(m−1)R
 = Cp(8a+14)p(m²−4p).

The right side is nonnegative for 0<=k<=m when Cp>=0. Positive coefficient
expansions after a=x+2(y+2),m=y+2,H=3a+m/2+4+z prove den,Cp,R positive
for m>=2,a>=2m,2H>=6a+m+8. These are ring-checked identities over ℝ,
not external symbolic assertions. The three certificates have respectively
19,46,80 nonzero terms; those counts are audit data only.

Multiplying the identity by W and summing gives strict positivity of the
untruncated actual-q base in this wedge. Radial covariance then attaches the
literal cut weight w_r(k)w_r(m−k), where w_r(r)=1,w_r(k)=4(r−k) for k<r,
and w_r(k)=0 otherwise. Thus every group 2<=m<=2r is strictly positive
when i+r<=d+2 and 4r<=i+1. Groups 0 and 1 remain exactly zero.

Positive-scale transport proves tail_gap_wedge_positiveM208 and the raw
kernel inequality at every r>=1. For the source upper template T=t−3,
d=b−2t,i=c−3,r=t−c, the new condition is 4t+2<=5c. The path/source
theorems and polygon theorem are in MarkovTopSteinSourceM208. They preserve
raw coefficients and give an unbounded source strip beyond the old bound.

The exact remaining upper scalar condition is TopWedgeStripM208:
i>=1,r>=5,i+r<=d+2,d+1<i+4r,i+1<4r, requiring tailGap>=0.
top_moment_iff_wedge_stripM208 proves exact equivalence to the inherited
upper moment condition. root_iff_frontierM208 retains the full remaining
ThreeFrontierM208 and OtherFourM9E2; neither is closed.

## Exact correction identity outside the wedge

For f(k)=w_r(k)w_r(m−k), let mass=sum Wf,
spread=sum Wf p(m²−4p), and
energy=sum_(k<m) W_k B(k)[f(k+1)−f(k)](m−2k−1).
Finite summation by parts proves sum Wf Lp=−energy. Both spread and energy
are nonnegative, including the zero and modified endpoint weights. Hence

den(4a+7)*betaGroup = a m(m−1)R*mass
 +Cp(8a+14)*spread+[2(a+2)den+4Cp]*energy.

This exact identity is proved in MarkovTopSteinCorrectionM208. Its first
coefficient can be negative. Dropping spread looked promising in 420 small
exact cases but failed 66 of 1,767 larger floating cases. Exact arithmetic
confirmed failure at a=20,r=1000,m=1100,H=1064: the mass coefficient is
−376694379937954818432000 and the energy-only expression is negative,
while the actual group is positive. This is not a raw-source refutation.

The simpler unrestricted untruncated actual-q positivity claim is formally
refuted at d=4,i=1,r=5,m=7. MarkovTopSteinObstructionM208 proves its negative
base and the positive actual cut group. The arithmetic sector constraints
are also checked.


## First-central follow-up, separate from the checked raw wedge

MarkovTopBetaMassLowerM208 proves the actual beta base is symmetric and
inward-increasing, hence every weight is at least its endpoint weight and
sum W >= (m+1)W0. The proposed endpoint-corrected margin at m=r has an
exact positive symbolic expansion. Its source and full attachment draft are
not counted as accepted theorems without successful final validation; see
the operational report and final validation.json. This follow-up does not
remove any clause of TopWedgeStripM208.
