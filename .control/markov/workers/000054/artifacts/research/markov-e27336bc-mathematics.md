# Arbitrary-run coefficient kernels and second-slice bridges

Machine-authored live request e27336bcd7374c768840a75b2276fcb8.
Full Conjecture63 remains unresolved. Current-source build and separate
kernel-replay outcomes are recorded in evidence/markov-e27336bc/validation.json.
No historical novelty or independent-validation claim is made.

## Exact arbitrary-run kernels

Write x for the slice variable, z=x^(n+1), and d=1-x. Let H_n=lowerH487 n,
C_n=runCOneBF n, D_n=runDTwoBF n and K_n=C_n+D_n.
MarkovRunKernelsE273 proves, for EVERY natural n,

    d² H_n = h(n,x,z)
    d³ C_n = c(n,x,z)
    2d⁴ D_n = e(n,x,z)
    2d⁴ K_n = e(n,x,z)+2d c(n,x,z),

where

    h(N,x,z)=N(1-x)(1+x)²+(1+x)(1-3x)+4xz,
    c(N,x,z)=2Nx(1-x)(1+x)²+x(1-x)³-8x²(1+x)
              +z[2N(1-x)(1+x)²+8x(1+x)].

The explicit integer polynomial e is in dKernelE273 and kernels.json. The
proofs use the actual checked scalar recurrences and induction on n. They
do not infer identities from finite coefficient matches.

## Exact second-slice inversion

For a non-Pell source path true^n ++ false :: rest, let c and r be the
denominator and numerator of rest, and q=max(2r-c,0). The inherited compressed
polynomial F=secondCompressed446 is twice the actual second-slice polynomial.
MarkovSecondKernelE273 proves the cleared polynomial identity

    (1-x)^4 F = secondKernelE273(n,c,r,q,x,x^(n+1))
                 + [c=2] 2x^(2n+3)(1-x)^4.

It also proves its coefficient inversion using the formal power series
with coefficient binomial(j+3,3), whose product with (1-x)^4 is one. This
uses no analytic convergence assumption and no division by a coefficient.

MarkovSparseKernelE273 decomposes the cleared numerator into precisely
17 terms a_sk(n,c,r,q) x^(s(n+1)+k): seven for s=0, five for s=1, and five
for s=2. The explicit coefficients are saved in sparse-kernel.json and
defined in the Lean source. Therefore EVERY coefficient is exactly

    2 A_(i,j) = sum_(s,k) a_sk * B(j,s(n+1)+k)
                 + [c=2 and j=2n+3] 2,
    B(j,k) = binomial(j-k+3,3) if k<=j, and 0 otherwise,

provided i+j equals the source numerator label a plus 2. This is a fixed-
length formula, not a finite-range scan. All shift guards and zeros are
explicit. The c=2 correction survives inversion unchanged.

## Previously conjectural shape bridges are now checked

MarkovShapeBridgeE273 proves the coefficient identification missing from the
immediate predecessor's upper/lower algebra inequalities:

* For 3<=j<=n, 6 A_(i,j)=lowerShape446(n,c,r,j).
* For n+3<=j<=2n+2, 6 A_(i,j)=8 upperShape446(c,r,2n+2-j).

Both statements quantify over every natural n and every actual source rest
word. In particular c=2 is allowed; no correction is silently discarded.
The proof derives 6B(j,k)=(j-k+1)(j-k+2)(j-k+3) whenever k<=j+3, including
the first three zero positions, and then checks exact polynomial identities.

MarkovSecondInteriorE273 transports the inherited shape inequalities to raw
source triples with starting j in either 3<=j and j+2<=n, or n+3<=j and
j+2<=2n+2. See validation.json for successful whole-module validation; failed
elaborations are not accepted evidence.

## One-run source family and larger slope band

The n=1 doubled coefficient list is the following quintic, zero-extended:

    [ (2c+r-1)(2c+r-2),
      4-16r+6r²-16c+18cr+12c²,
      2-45r+17r²-5c+34cr+9c²,
      -40r+24r²+8c+24cr,
      16r²,
      8 max(2r-c,0)+[c=2]2 ].

MarkovQuinticE273 proves this literal polynomial identity and every adjacent
inequality for 0<r<c. The first three gaps use positive polynomial
certificates; the fourth splits c=2 and the two signs of 2r-c. Tail zeros
remain in the sequence. MarkovSecondBandE273 transfers this to actual source
coefficients and combines it with n=0 and the established Pell result:
every source with 3a<=2b satisfies the second-lower-diagonal inequality.
There is no denominator bound. All three original polygon guards occur in
the slope-band theorem. MarkovInteriorE273 gives an exact remaining-root
equivalence excluding this newly proved slope band on that single slice.

## Remaining transition calculations

For n>=5, the open shape regions leave starting positions
0,1,2,n-1,n,n+1,n+2 and the final tail to examine. The first seven gap
polynomials, obtained symbolically from the 17-term formula, have only
nonnegative coefficients after n=t+5,c=u+v+2,r=u+1. Each has 75 monomials.
Exact candidate expressions are saved in transition-certificates.json.
They are NOT new Lean source inequalities. The bridge, gap verification,
small run lengths n=2,3,4, and the final-tail/support cases remain to be
completed before claiming universal second-slice log-concavity.

Finite verification of the 17-term formula checked 133,980 coefficients and
124,740 adjacent triples over n=0..21,c=2..21,0<r<c, with no failures. The
two-run correction was included. These are exact finite parameter tests,
not universal proofs and not additional source-family witnesses.

Other lower slices and the horizontal/vertical interior directions remain
unresolved. Nothing here closes the pinned root or its negation.

The newly proved shape formulas also give the final three doubled coefficients, for n>=2, as [32r(c+r)-48r+8c, 16r², 8q+[c=2]2]. The last entry still needs its explicit-formula bridge in Lean; this is advice for the next worker, not an established new source-tail theorem. The inherited second_tail_boundBF is relevant after treating c=2 and q=0 explicitly.
