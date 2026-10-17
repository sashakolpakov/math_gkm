# Revisable next actions — ca9709f2

Full Conjecture63 remains open. Read the final mathematical and correspondence
reports and validation.json before using these suggestions.

The predecessor beta-binomial linear-cutoff route is now complete. Do not
repeat its missing-bridge work: MarkovTopBetaTransportMCA9 proves the raw-kernel
bound, MarkovTopLinearSourceMCA9 transports it to source/path rows, and
MarkovTopLinearResidualMCA9 gives the exact reduced root.

Two remaining targets are available:

* TopLinearStripMCA9 is exactly equivalent to the upper-sector moment condition:
  i>=1,r>=5,i+r<=d+2,d+1<i+4r, requiring tailGapMDCB>=0.
* CentralBetaMCA9 is a stronger sufficient condition: the same parameters and
  r<=m<=2r−2, requiring betaGroupMCA9>=0. Lower groups 2<=m<r, zero groups 0,1,
  and final groups 2r−1,2r are now proved. CentralBeta is not claimed equivalent
  to the full coefficient gap. All parameters remain unbounded.

An exact telescoping representation may help the central groups, but a simple
bound initially suggested by small tests FAILED at larger parameters. Set
a=i+1,m=r+n,L=r−n, and W_k=C(a+k−1,a−1)C(a+m−k−1,a−1). For
g(k)=(r−k)(k−n)F2(k,m−k), the numerical/symbolic solver constructs a polynomial
P of degree 5 and scalar C with

 g(k)=C+(a+k)(m−k)P(k+1)−k(a+m−k)P(k).

The actual q-free base group, for n<r, has the experimentally verified identity

 16 C sum_(k=n)^r W_k
 +8 W_n [L F2(n,r)−4n(a+r)P(n)].

6,061 finite exact cases passed this identity. The bracket was negative in
every tested case. Merely replacing sum W_k by (L+1)W_n is NOT enough
universally: a=100,r=1000,m=1500,H=1304 gives the normalized lower-bound
numerator −21833322687517732148000000/79663. The mean C is still positive
there. The larger stress found 28 failed cases among 120 inputs, including
eight with nonpositive C itself. For example a=1000,r=10000,m=15000,H=13004
has C=−1592519153009714433976254000000000/535736401. These are
failures of a sufficient comparison, not negative actual groups or raw gaps.

Artifacts: stein_probe_ca9709f2.py, stein_symbolic_ca9709f2.py,
evidence/markov-ca9709f2/stein-probe.json, stein-symbolic.json,
stein-stress.json, stein-large-stress.json. The cleared symbolic identity agrees
exactly with the already formalized weighted-mean polynomial, but the
telescoping identity itself has not been proved in Lean. The shifted cleared
mean and proposed lower-bound polynomials contain negative coefficients;
a greedy square decomposition did not close them. Do not treat either as a
positive certificate. A sharper mass/endpoint ratio estimate or another
representation is needed if pursuing this route.

The simpler p=k(m−k) tilt also fails: see the formal
MarkovTopPTiltObstructionMCA9, which simultaneously proves the actual terminal
group positive at that witness. Do not revive this shortcut as a universal base.

Retain the middle horizontal strip, vertical and diagonal residual clauses,
and unchanged OtherFourM9E2. The exact full-root equivalence is
Conjecture63 iff ThreeFrontierMCA9 and OtherFourM9E2, both open. Discharge
all correspondence obligations and obtain a fresh whole-source rebuild and
independent hash-bound audit before claiming completion.
