# Mathematical record

Machine-authored request 81f80b2ddbc44c6e86d8079cfc7a8e81. Full Conjecture63
remains unresolved. Consult final validation.json for the checked module set.

The new general coefficient identity is unbounded in degree d. For natural
k,l,d,r with r<=d and d<=k+l, let F(x,d)=x(x-1)...(x-d+1). Then

    F(k+l,d) [X^k] (1+X)^(k+l-d) X^r
      = choose(k+l,k) F(k,r) F(l,d-r).

If r>k or d-r>l, the relevant factor vanishes. The proof handles these cases
before using factorial cancellation; no positive-coefficient assumption is
present. Degree 3, 5 and 7 instances transport the three actual source rows.

Set i=a-1+k, N=k+l=b-2 and C=choose(N,k). With the literal source seed
coefficients d_r,e_r,f_r of the second, third and fourth horizontal rows, set

    J=sum d_r F(k,r) F(l,3-r),
    H=sum e_r F(k+1,r) F(l-1,5-r),
    I=sum f_r F(k+2,r) F(l-2,7-r).

The raw identities are 2F(N,3)A(i,2)=CJ,
6F(N,5)(k+1)A(i,3)=ClH and
24F(N,7)(k+1)(k+2)A(i,4)=Cl(l-1)I.
Their direct clearing gives

    144 F(N,5)^2 (N-5)(N-6)(k+1)^2(k+2)
      [A(i,3)^2-A(i,2)A(i,4)] = C^2 l G,+    G=4(N-5)(N-6)(k+2)l H^2
       -3(N-3)(N-4)(k+1)(l-1) J I.

The clearing scalar is strictly positive for k>=0,l>=2,N>=7.
The remaining slope region b<=2a splits at 3a=2b and 4a=3b.
In each cone the numerator a is respectively (b+Q)/2, (2b+Q)/3,
or (3b+Q)/4, with Q>=0. Source min/truncated-subtraction statistics
are identified before applying the polynomial certificates.

For denominator s=2,3,4, scale J,H,I by s^2,s^3,s^4. The seven
coefficients in Q of s^6G have nonnegative polynomial certificates on
the covering charts k=K+1,l=L+9; k=0,l=L+9;
l=2,...,8 with k=K+max(7-l,1); and k=0,l=7 or 8.
This chart decomposition retains zeros and covers all natural k,l with
l>=2 and N>=7. Small b<=8 sources and outside-support columns require
separate source assembly. All other residual regions remain unresolved.
