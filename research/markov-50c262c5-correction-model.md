# New global correction candidate: unproved source bridge

Machine-authored request 50c262c5afce4cf0a717cbef7a352e92. This document records
a representation discovered by exact experiments. It is not a universal proof.

For nonnegative a,b,j,k define

    K^epsilon_(a,b)(j,k)
      = sum_{s=0}^{min(j,k)} (3s+epsilon) binom(j-s+a,a) binom(k-s+b,b).

Set K=0 whenever either j or k is negative. Use the inherited D kernel with
weights w(0)=1,w(s)=4s for s>0, also zero-extended in its two coordinates.
For source denominator B=3q+delta, put epsilon=3-delta: delta=1/epsilon=2
for r=true, delta=2/epsilon=1 for r=false. The candidate identity is

    A(i,j) = D_(i-3)(j, B+2-i-j)
           + 4 K^epsilon_(i-1,i-2)(j-q-1, B-q-i-j),   i>=3, q>=1.

All coefficients are literal raw numerator coefficients. Both shifted kernel
coordinates must be checked BEFORE conversion to naturals: silently truncating
a negative coordinate to zero would make this formula false. This candidate
does not describe columns i=0,1,2.

research/correction_model_50c262c5.py checked the formula against the original
source mutation recurrence for q=1..44,51,63, both residues, all tested i>=3
and j through four rows beyond total degree. It passed 364,860 comparisons,
including 27,968 source zeros, 33,778 positive corrections, and 331,082 zero
corrections. The exact result is evidence/markov-50c262c5/correction-model.json.
This is finite evidence, not an attached universal coefficient theorem.

## How the candidate was found

The difference E=A-D appeared supported on q<j and i+j<=B-q. Divide by
4u^3 v^(q+1), defining tentative H_q(u,v). Finite source computations suggested
that H_q-(u+v+1)H_(q-1)+v H_(q-2) is independent of u. The observed coefficient
of v^j in that forcing was

    sum_{s=0}^{min(j,n-j)} (3s+epsilon)(j-s+1),

with n=q-2 in the false residue and n=q-3 in the true residue. Summing this
suggested the following generating function for H, with q marked by z:

    false: z^2(1+2vz^2) / F,
    true:  z^3(2+vz^2) / F,
    F=(1-z)(1-vz)^2(1-vz^2)^2((1-z)(1-vz)-uz).

Expanding the final factor as a geometric series in uz and then extracting
u^c v^j z^q gives the displayed K formula. The generating function itself has
not been proved equal to the source difference; this derivation explains the
candidate, not a completed bridge. The raw finite H and forcing lists are in
evidence/markov-50c262c5/correction-recurrence-probe.json.

## Relevance and obstruction

The correction is expressed as another positive binomial convolution, with
parameters c+2,c+1 and affine weights 3s+epsilon. This may permit a uniform
argument for the remaining middle region if the source bridge is first proved.
Separate adjacent log-concavity of the correction passed the finite probe but
has not been proved here. Even proving it would not by itself prove LC of A.

Mixed terms in the sum's gap are negative in all three directions, including
actual valid source triples. At 3/8 the first vertical mixed gap is -32 and the
diagonal mixed gap is -520; the full source gaps are positive. Any attachment
must control the total gap and the boundary-crossing triples. It cannot discard
these negative terms or equate adjacent LC with CrossLC in the presence of zeros.
