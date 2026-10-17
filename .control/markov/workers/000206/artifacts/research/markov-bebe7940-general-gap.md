# A coefficientwise route for the remaining numerator-three diagonals

Machine-authored live request bebe7940cb4f488b90ea3d92a8e3f199.
This is a research derivation and an open proposal, not a proof of Conjecture63.

Write B=3q+δ, with δ=1 for r=true and δ=2 for r=false, and e=3−δ.
Use the ordinary binomial polynomial C(z,n)=z(z−1)…(z−n+1)/n!.
The following finite polynomials have rational coefficients:

L(d,j,t) = Σ[m=0..t] C(d,t−m) binom(t+m+3,m)
  (C(j+t+3,t+m+3)+4 C(j+t+4,t+m+5)).

S(H,T,t) = Σ[l=0..t+3] binom(t+l,t) C(H,t+3−l)
  (C(T,t+l)+4 C(T+1,t+l+2)).

A(e,a,b,J,H) = Σ[l=0..b] binom(a+l,a) C(H,b−l)
  (e C(J+a+1,a+l+1)+3 C(J+a+1,a+l+2)).

The new formal identities `lower_liftMBEB`, `lower_shortMBEB`, and
`affine_shortMBEB` identify these with the inherited kernels on their explicit
natural domains. The sum over s in the affine kernel is eliminated by
Vandermonde and the ordinary and weighted hockey-stick identities. In
particular, A equals affineKernel(e,a,b,J,K) when H+J=K+b. No term is deleted.

For diagonal starts i=c+3, let J=j−q−1 and K=B−q−i−j−2.
Inside the part where all three corrections are present, J,K≥0.
There are two regions. All x,h,c below are arbitrary natural numbers.

1. J=x, K=x+1+h. Then q=2x+h+c+7−δ,
   j=3x+h+c+8−δ. For t=0,1,2 the proposed common expression for the actual
   coefficient at (c+t+3,j+2−t) is

   L(c+h+2t,j+2−t,c+t)
   +4 A(e,c+t+2,c+t+1,x+2−t,c+h+2t).

2. K=x, J=x+h. Then q=2x+h+c+6−δ,
   j=3x+2h+c+7−δ, and k=3x+h+c+8−δ. The expression is

   S(c+h+4,k+c+t,c+t)
   +4 A(e,c+t+1,c+t+2,x,c+h+4).

For c=0 these exact source attachments are proved in MarkovThreeMassMBEB.
Their full total gaps have formal coefficientwise-nonnegative certificates in
MarkovThreeCertificateMBEB. The crossing rows j=q−1 and j=q are separately
represented in MarkovCrossMassMBEB and certified in MarkovCrossCertificateMBEB.
Consult validation.json for final actual build/replay status; filenames alone
are not verification receipts.

For general c, the displayed formulas follow on paper from the same universal
kernel identities and arithmetic reindexing. This run has NOT supplied a Lean
source wrapper for arbitrary c. The exact source experiment checked 18,276
coefficient values for c=1..8 against the recurrence, with no mismatch; that is
finite evidence, not the missing wrapper proof.

An open sufficient condition is that, for every c, each polynomial
F₁(x,h)²−F₀(x,h)F₂(x,h) from the two expressions has nonnegative ordinary
monomial coefficients. The exploration scripts expand these polynomials over
exact rational arithmetic. See general-column-probe*.json for the ranges that
actually finished. No interpolation is used to assert a universal conclusion.
Even a proof of this condition would still need the general source wrappers,
the correction-entry rows, the smaller diagonal starts, the remaining vertical
direction, and OtherFourM9E2. It is not itself a replacement root.

The signed absorption inequality also passed the c=0 coefficient expansion,
but the new formal certificates use the complete total gap. Negative mixed
contributions have not been assumed nonnegative or replaced by absolute values.

The completed general-column experiment covered c=0..20, both residues and
both regions: 84 exact rational polynomial expansions, with no negative
coefficient reported. This does not prove a statement universal in c. The
separate diagonal-unsigned-polynomial-probe.json covered c=0..8 (36 expansions)
for the stronger gap D₁²−D₀D₂−D₀E₂−D₂E₀ and also found no negative coefficient.
This latter proposal is specific to these diagonal regions. The inherited
vertical unsigned bound is formally false at source 3/20 and must not be
revived as an all-direction hypothesis.
