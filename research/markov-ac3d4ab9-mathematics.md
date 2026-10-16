# Binomial mixtures, variance, and actual source regions

Machine-authored request ac3d4ab98366433dacc719574d5ff03e.
The full pinned Conjecture63 remains unresolved. The final validation inventory
is evidence/markov-ac3d4ab9/validation.json; this document is not independent
admission or a completion audit.

Let P have nonnegative real coefficients supported in [lo,hi], let w=hi-lo,
and Q=(1+X)^n P. All coefficients below are ordinary coefficients. Two proved
sufficient criteria for Q[k] Q[k+2] <= Q[k+1]^2 are available, under

    lo <= hi <= k,             k+2 <= n+lo.

The asymmetric mixed-pair criterion is

    w(w-1)(n+2) <= 2(k-hi+2)(n+lo-k).

Its proof factors the previous mixed-binomial numerator exactly as

    (a+b+t+3)[2(a+2)(b+2)-t(t-1)(a+b+t+4)].

For shifts r<=s, take t=s-r, a=k-s, b=n-(k-r+2). The bracket is controlled
uniformly by the support endpoints. Summing mixed inequalities gives the
raw coefficient assertion. Natural w-1 is harmless at w=0 because its
multiplier is zero; the exact real-cast identity is proved explicitly.

The stronger-in-many-regions variance criterion is

    (n+2) w^2 <= 4(k-hi+2)(n+lo-k).

This does not require each mixed pair to have nonnegative gap. Put H=n+2,
x_r=k-r+2, and, for r in [lo,hi],

    q_r = P[r] choose(n,k+1-r) / [x_r(H-x_r)].

The index hypotheses make both denominator factors strictly positive. No
coefficient or sum of weights is divided out. The three raw coefficients are
the sums of q_r x_r(x_r-1), q_r x_r(H-x_r), and
q_r(H-x_r)(H-x_r-1). These identities are proved by consecutive-binomial
recurrences, including zero coefficients.

Writing W=sum q, U=sum qx, V=sum qx^2, their gap is

    (H-1)[ U(HW-U) - H(WV-U^2) ].

For A<=x_r<=B, nonnegative weights satisfy the denominator-free variance bound

    4(WV-U^2) <= (B-A)^2 W^2.

This follows by summing q_r(x_r-A)(B-x_r)>=0 and using
(2U-(A+B)W)^2>=0. Also U(HW-U)>=A(H-B)W^2. Hence
H(B-A)^2<=4A(H-B) proves the gap sign. This is formalized in
MarkovVarianceMAC3.lean and MarkovBinomialVarianceMAC3.lean. The all-zero
seed is included. No seed log-concavity, real-rootedness, or positivity of a
selected coefficient is assumed.

The source adapters use inherited exact residual factorizations and prove
sharper lower support from the polygon itself. For a source label a/b:

* Horizontal row j: n=b-2j-1, lo=a-floor(aj/b), hi=a+j, provided 2j+1<=b.
* Vertical column i: n=a-2i-1, lo=b-floor(bi/a), hi=b+i, provided 2i+1<=a.
* Homogeneous diagonal depth r: n=a+b-1-2r, lo=0, hi=r.

The floor-support argument uses quotient/remainder arithmetic and the
already proved coefficientwise inequality P[k]<=((1+X)^n P)[k]. If
k<a-floor(aj/b), then bk+aj<ab, so the raw source coefficient vanishes;
nonnegativity forces the residual coefficient to vanish as well. The
vertical argument exchanges a,b. This improves the previous coarser support
bounds without adding a source assumption.

At diagonal depth r, the variance region has the particularly simple form

    i+j+2+r=a+b-1,     r<=i, r<=j,
    (a+b-1-2r+2)r^2 <= 4(i-r+2)(j-r+2).

The pair criterion replaces the last line by
r(r-1)(a+b-1-2r+2)<=2(i-r+2)(j-r+2).
Both yield exactly A(i,j+2) A(i+2,j)<=A(i+1,j+1)^2.

MarkovVarianceWitnessMAC3.lean supplies an unbounded actual-source family
that satisfies the variance criterion and fails both the prior square-margin
criterion and the new mixed-pair criterion. For every s>=5, take

    n=4s^2+2s+1, path=R^n L,
    a=2n+1, b=2n+3,
    r=2s, i=2s^2+2s, j=14s^2+4s+5.

All three polygon guards and every prior diagonal residual guard are proved.
The pair-criterion failure reduces to a positive polynomial. With t=s-5,
its reversed-gap difference is

    8t^4+136t^3+784t^2+1614t+442 > 0.

This failure is a failure of a sufficient auxiliary criterion, not of raw
source log-concavity: the variance theorem proves that raw inequality.

The exact theorem root_iff_interiorMAC3 proves
Conjecture63 <-> InteriorCore63MAC3. The residual retains all MF1E guards
and excludes only the two newly proved regions. Its complement is unproved.
No fixed-row, fixed-denominator, or fixed-depth result is substituted for
the full root.

The exact finite experiment independently compared 241 source polynomials
through denominator 28, verified 3,570 residual support factorizations, and
checked 1,908 source triples in eight larger examples. Of those, 1,474 were
inside the previous residual and 352 meet the variance criterion but not the
pair criterion. Generic tests checked 44,536 triples, including 4,487 zero
triples, from seeds that include 498 non-log-concave instances. These are
experiments, not universal proofs. The full counts, inputs, examples and
source bindings are in evidence/markov-ac3d4ab9/experiments.json.

The published target was retrieved at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . Limited
live searches supplied no theorem used as an axiom; they establish neither
historical novelty nor exhaustive literature coverage.
