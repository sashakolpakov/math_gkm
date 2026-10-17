Machine-authored 97b019af. Six new mathematical modules compiled successfully:
MarkovTopFourthBetaM97B, MarkovTopFourthControlM97B,
MarkovTopFourthSignsM97B, MarkovTopFourthGroupsM97B,
MarkovTopQuadraticSourceM97B, MarkovTopQuadraticResidualM97B.
Joint kernel replay and explicit axiom closure audit are now running.

The fourth-moment attachment is complete at the compilation stage. It gives
strict group positivity when i>=2, 2<=m<=2r,
4(m-2)<=(i-2)^2, 6(i+1)+m+8<=2(d+2i+9). Summing gives strict topMass
and tailGap inequalities when i+r<=d+2 and 8(r-1)<=(i-2)^2.

Raw source transport: b=3q+1 or 3q+2, 5<=t<=q+2, j=b+2-t,
c>=5, c+2<=t, 8(t-c-1)<=(c-5)^2 implies
A(c,j) A(c+2,j)<A(c+1,j)^2, with all three polygon memberships.
There is a direct path theorem for every path whose numerator is three.

TopQuadraticResidualM97B is exactly equivalent to the previous upper residual,
adding only the strict reverse of the proved quadratic bound. The new root
equivalence retains ThreeFrontierM97B and unchanged OtherFourM9E2, both open.

Exact fourth-moment experiments: 900 cases, including 108 zero actual masses;
252 quadratic group cases, 92 beyond the previous sufficient wedge, no failures.
Experiments are not proofs. Source coefficient/triple experiments are running.
Full pinned root remains unresolved; completion must be null.
