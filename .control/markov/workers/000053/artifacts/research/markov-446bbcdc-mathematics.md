# Exact compression and the low-slope second lower diagonal

Machine-authored live request 446bbcdc58554542b733c6d1dac376bf.
Full Conjecture63 is unresolved. See validation.json for actual compilation
and replay status. No novelty or independent-validation claim is made.

## Universal source adjacency

For every path with middle label a/b, MarkovAdjacency446 proves that the
number of consecutive B-B pairs in sourceWord28 is max(2a-b,0), represented
by natural subtraction. The source word starts A and ends B, so the closing
cyclic edge adds zero. The proof uses the existing exact decomposition into
AB^n and AB^(n+1), with the shorter binary word itself an actual source word.
It handles every path, including all-true Pell paths.

## Exact second-slice polynomial

For path=true^n ++ false::rest, let c and r be the denominator and numerator
of rest's middle label. Thus c>=2 and 0<r<c. Put q=max(2r-c,0),
h0=H_n, h1=H_(n+1), k0=K_n, k1=K_(n+1), b=2(y+...+y^n), d=2y^(n+1).
The new checked identity says twice the second lower-slice polynomial is

    2((c-r)k0+r k1) + ((c-r)h0+r h1)^2 - ((c-r)h0^2+r h1^2)
      +2((y-1)(cb+rd)+y(cb^2+2rbd+qd^2))
      -2(1+y)((c-r)h0+r h1-1-y) + [c=2] 2y^(2n+3).

The factor two multiplies the entire equality; coefficients are not
index-normalized. source_second_raw_compressed446 identifies each coefficient
with twice the literal raw numerator coefficient at i+j=a+2. This removes
the inherited count-compression and adjacency gaps. The two-run correction
is retained; no actual source case with c=1 enters this formula.

## Unconditional new raw-source inequality

When n=0, the doubled coefficient list is

    [(c+r-1)(c+r-2), 2(3r(c+r)-8r+2), 9r^2-5r+2,
       8 max(2r-c,0)+[c=2]2],

with zero extension. Both nontrivial adjacent inequalities have explicit
positive-coefficient polynomial gap certificates, checked in Lean. The c=2
case forces r=1 and is treated separately. The zero tail is included.

source_false_second_diagonal446 proves the raw diagonal inequality on
i+j=a+2 for every path starting false, at all natural positions on that
slice. source_second_lower_low446 restates the result for EVERY source path
with 2a<=b and all original polygon guards. It proves the needed first-branch
classification from the exact index recurrence; the exceptional all-true
case is excluded by the polygon bound. This is one slice of one direction
on a specified infinite subfamily, not full Conjecture63.

## Upper-slice candidate

For n>=2 and n+3<=j<=2n+2, put t=2n+2-j and

    U(c,r,t)=(t^3-t)c^2+6t(t+1)cr+6(t+1)r^2
               -6t(t+2)r-(t^3-4t)c.

The candidate identity is 3*(2F2_j)=8U(c,r,t). It matched 62,491 exact
coefficient computations for n=2..24, c=3..21 and 0<r<c. This coefficient
identity is NOT yet a Lean theorem. MarkovUpperShape446 separately attempts
to prove U(t-1)U(t+1)<=U(t)^2 for r>=1,c>=r+1,t>=1 by a positive-term
certificate. Its eventual validated algebra theorem must not be reported
as a source inequality without the missing coefficient bridge.

The fixed-run symbolic exploration n=0..4 also finds nonnegative gap
certificates after appropriate count substitutions. Only the n=0 source
inequality is established by the new source theorems so far.

## Lower-interior candidate

For 3<=j<=n, define

    K(N,j)=8(j-1)(N-j+1)^2+8(j-2)(N-j+1)+4(j-1),
    H3(N,M,j)=12((N+1)(M+1-j)+(M+1)(N+1-j))
      +36(N(M+2-j)+M(N+2-j))+48(N+1)(M+1-j)(j-3)
      +24(N-M+j)((j-2)(j-1)-2)-8((j-2)(j-1)(2j-3)-6),
    L(n,c,r,j)=6(c-r)K(n,j)+6rK(n+1,j)
      +(c-r)(c-r-1)H3(n,n,j)+2(c-r)rH3(n,n+1,j)
      +r(r-1)H3(n+1,n+1,j)+24c(j-2)
      -24(2(cn+r)-c(2j-3)).

Here H3 is three times the proposed H_N H_M convolution coefficient in
this range. The candidate identity is 6F2_j=L(n,c,r,j). It matched 52,877
exact computations for n=3..24,c=3..21,0<r<c,3<=j<=n. The symbolic gap
L(j)^2-L(j-1)L(j+1) has 225 positive monomials after the substitutions
j=t+4,n=t+s+5,r=u+1,c=u+v+2 with nonnegative t,s,u,v. The generated
MarkovLowerShape446 proof checks the resulting abstract integer-polynomial
inequality when compilation succeeds; validation.json is authoritative.
Neither this coefficient formula nor the transition positions between the
lower and upper ranges have been formally bridged here. These candidates
must not be counted as universal source log-concavity results.

The current lower-shape module compiled successfully at 20:17 UTC with only
the permitted axioms. A bounded separate replay was then launched; its
outcome is recorded in validation.json. The upper-shape module has both a
successful current-source compilation and a successful separate replay.
The final lower-shape replay also succeeded in 53.53 seconds. All nine new
current-source modules have successful compilation and separate replay.

## Exact remaining root

root_iff_interior446 is a checked equivalence, with successful kernel replay,
between the unchanged Conjecture63 and Interior63446. The latter retains
both infinite horizontal/vertical residuals and all remaining diagonal
residuals; it excludes the second lower slice only when 2a<=b. Its new
premise remains unproved. This is a reduction, not root closure.
