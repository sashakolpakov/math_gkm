# A uniform linear cutoff via beta-binomial comparison

Machine-authored live request dcb64029. This is a written mathematical proof
route, not a completed Lean theorem. Scalar positivity, the universal normalized
beta moments, and the likelihood inward step are formalized in the MDCB modules.
The scalar-expectation assembly, full covariance comparison, symmetrized
antidiagonal identity, and source attachment are not yet Lean bridges.
No root completion is claimed.

Proposed theorem: for every natural i,d,r with r>=2 and d>=i+4r-1,
M_i(d,i+r) M_(i+2)(d,i+r) < M_(i+1)(d,i+r)^2.
The masses and their exact cleared-gap equivalence are already defined and
proved in MarkovTopTailRepresentationMDCB.

Put a=i+1, H=d+2i+9, Q=d+i+6. Let
c_k=choose(i+k,i) (H)_k/(Q)_k, and w_k=4(r-k) for 0<=k<r,
w_r=1, w_k=0 for k>r; (z)_k is the rising factorial. All denominators
are positive. The kernel row recurrence gives K_i(i+k)=K_i(i)c_k.
This is also the quotient of the formally proved tailNum/tailDen identity.

The scalar gap, divided by its positive common denominator, is the double sum
over k,l of w_k c_k w_l c_l times the symmetric scalar

 F(k,l)=(a+1)(a+4) A_k A_l - a(a+3)(A_k B_k+A_l B_l)/2,
 A_k=k(H+k), B_k=(k-1)(H+k+1).

This symmetrization leaves the total sum unchanged. Group by m=k+l, taking
k=0,...,m and w=0 outside 0,...,r. Only 0<=m<=2r contribute. The m=0,1
groups vanish. For m>=2 use the beta-binomial base weights

 W_k=choose(i+k,i) choose(i+m-k,i).

Their positive total is choose(2i+m+1,m), by the binomial-series convolution.
Relative likelihood is L_k=q_k q_(m-k) w_k w_(m-k), q_k=(H)_k/(Q)_k.

Both q and w are nonnegative, log-concave, and have interval support. For q,
q_(k+1)/q_k=1+(i+3)/(Q+k) decreases in k. For w, the interior linear
inequality is immediate, and the final nontrivial triple has weights 8,4,1,
so 4^2>=8. Multiplying preserves adjacent ratios on the support.
Consequently L_k is symmetric and nondecreasing for 0<=k<=floor(m/2),
including its initial zeros. This follows directly by comparing the two
successive ratios of the sequence q_k w_k. It does not use the false generic
log-concave-weight transform assertion from the inherited obstruction.

Let p=k(m-k). At fixed m, F is a quadratic polynomial in p with leading
coefficient (a+1)(a+4)-a(a+3)=2a+4>0. Its linear coefficient is

 (a+1)(a+4)(H^2+Hm)
 +a(a+3)(2m^2+3Hm+H^2-H-1).

This is positive for a>=1,m>=2,H>=9. Hence F also increases toward the
center. The elementary weighted covariance identity

 (sum W)(sum W L F)-(sum W L)(sum W F)
 = (1/2) sum_(k,l) W_k W_l (L_k-L_l)(F_k-F_l)

is nonnegative: symmetry makes both orders depend only on distance from the
center. Thus a positive base mean of F gives a positive actual weighted sum,
provided sum W L>0. That mass is positive for every m<=2r: choose any
k,l in [0,r] summing to m.

The factorial moments of the normalized beta-binomial base are

 E[(k)_under_u (m-k)_under_v]
   = (m)_under_(u+v) (a)_u (a)_v/(2a)_(u+v).

For u+v>m both sides are zero. One proof multiplies each binomial weight
by its falling factorial, shifts both indices, then applies the same
binomial-series convolution. Apply this for (u,v)=(1,1),(2,1),(2,2),
(2,0),(3,0),(4,0), using

 A_k=(k)_under_2+(H+1)k,
 A_k B_k=(k)_under_4+(2H+6)(k)_under_3+(H+2)(H+3)(k)_under_2.

The resulting base expectation is exactly

 E[F]=a^2(a+1)m(m-1)/[(2a)(2a+1)(2a+2)(2a+3)] * B(a,m,H),

 B=(2a+2)(2a+3)[H^2-(3a+7)H-5a-14]
   -4(m-2)(2a+3)[H+a^2+5a+7]
   -2(m-2)(m-3)[a^2+6a+7].

For a>=1,m>=2,H>=3a+2m+5, B>0. Substitute a=1+x,m=2+y,
H=3a+2m+5+z; the exact polynomial has strictly positive nonzero coefficients
and a positive constant term. MarkovTopBetaScalarMDCB checks this certificate
by ring normalization and positivity.

Finally d>=i+4r-1 and m<=2r imply H=d+2i+9>=3a+2m+5. Every nonzero
antidiagonal is therefore positive, proving the proposed strict inequality.

Uniform row consequence if all bridges are formalized: for T>=2 and
d>=4T-1, all high-column inequalities hold, since r=T-i and
i+4r-1=4T-3i-1<=4T-1. Zero tails are already formalized. Together with
the existing low-column results this would replace the enormous eventual
cutoff by n>=6t-13 for upper templates (T=t-3,d=n-2t), subject to the
unchanged sector hypotheses. This does not cover the entire upper sector,
nor the middle strip, vertical/diagonal directions, or other numerator families.
