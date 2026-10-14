# Second cyclic run coefficient

Machine-authored live request bf38fa192cd64d11804e5c1de553ef23.
The pinned Conjecture63 remains unresolved. Compilation and replay status is
recorded in evidence/markov-bf38fa19/validation.json. No novelty claim is made.

## Exact identities

Write M_n=T_A T_B^n in the inherited ambient coordinates x,y, where
s=i+j-a is the x exponent and j is the y exponent. For any block matrix M
having the inherited LowerShape487, define

    b(M)=[x^0]M_21, H(M)=[x]M_22+b(M),
    delta(M)=[x]M_11-b(M), beta(M)=[x^2]M_12-[x]M_22,
    K(M)=[x^2]M_22+[x]M_21, L(M)=beta(M)+delta(M).

MarkovSecondRunBF proves the exact multiplication identities

    b(MN)=b(N), delta(MN)=0, beta(MN)=L(M),
    K(MN)=K(M)+K(N)+H(M)H(N)+b(M)L(N).

For an individual run, let R_n=y+...+y^n, including R_0=0. Then

    b_n=2R_n, delta_n=y^(n+1), L_n=y-1+y b_n.

The existing H_n is retained without normalization. Its coefficients are
H_n(0)=n+1, H_n(1)=3n and H_n(j)=4 max(n+1-j,0) for j>=2.

For a cyclic list of c>=3 runs the checked recursive formula expands to

    [x^2]tr(M_n1 ... M_nc)
      = sum_i K_ni + sum_(i<j) H_ni H_nj + sum_cyclic b_ni L_n(i+1).

The actual Lean statement uses runScoreBF, an explicitly defined recursion
for the first two sums and the nonclosing adjacency terms, plus its closing
term. This is not a presumed independence or permutation-invariance rule.
For two runs there is the additional term delta_n delta_m=y^(n+m+2).
For one run the exact matrix coefficient is retained separately.

In particular, the universally proved ordering identity is

    [x^2]tr(M_n M_n M_(n+1) M_(n+1))
      - [x^2]tr(M_n M_(n+1) M_n M_(n+1)) = 4 y^(2n+3).

Thus run counts alone do not determine the second coefficient. These words
are auxiliary objects; this is not a source counterexample to log-concavity.

## Actual source and coefficient bridges

MarkovSecondSourceBF proves the exact recursion

    W(true^n ++ false :: rest) = lowerSub_n(W(rest)),

where lowerSub sends A to AB^n and B to AB^(n+1). Consequently the sequence
of short/long runs is itself an actual source word, not an arbitrary binary
word or palindrome. MarkovRunRecurrenceBF also identifies the new labels as

    a = n b_0 + a_0, b = (n+1)b_0+a_0,

and proves b_0<b. This supplies a genuine well-founded index descent for
future induction, without asserting that log-concavity is preserved.

The inherited polynomial identity tr(T_W)=(1+x(1+y))F gives

    [x^2]F = [x^2]tr(T_W) - (1+y)(sum_i H_ni -1-y).

secondSliceBF includes this subtraction and the two-run correction exactly.
source_second_recursiveBF states, for EVERY non-Pell path and EVERY natural
i,j with i+j=a+2, that the literal raw coefficient A(i,j) is the jth
coefficient of this secondSliceBF. No support-zero removal or polygon
restriction is needed for the equality. The other disjunct explicitly records
path=true^k; existing Pell results remain separate dependencies.

Scalar recurrences eliminate the remaining block matrix derivatives:

    C_0=y, D_0=0,
    C_(n+1)=y C_n+2y H_n+y-y^2+2y^(n+2),
    D_(n+1)=D_n+(1+y)(C_n+H_n-2R_n), K_n=D_n+C_n.

These recurrences are proved as coefficient identities, not inferred from
specialized evaluations. Their negative terms do not imply negative actual
coefficients.

## Count compression and next inequality

For c runs of lengths n,n+1, with r long runs and q cyclic long-long pairs,
the cyclic expression expands (for c>=3) to

    T2 = (c-r)K_n+rK_(n+1)
       + choose(c-r,2)H_n^2+(c-r)r H_n H_(n+1)+choose(r,2)H_(n+1)^2
       + (y-1)(c b_n+r d)+y(c b_n^2+2r b_n d+q d^2),
    d=2y^(n+1), F2=T2-(1+y)((c-r)H_n+rH_(n+1)-1-y).

The count-compression algebra is derived here and checked independently in
Python; there is not yet a separately named Lean count-compression theorem.
Actual sources experimentally have q=max(2r-c,0). That equality has NOT been
proved here. The weaker envelope tested was c>=3, 0<r<c,
max(2r-c,0)<=q<=r-1, and q=0 if 2r<c. Every coefficient, including zero,
was retained. All 3,138,496 adjacent tests passed for n=0..15, c=3..60.
This is finite evidence, not a universal inequality.

For n>=2 the proposed final three coefficients of F2 are

    [16r(c+r)+4c-24r, 8r^2, 4q].

The coefficient identity was checked on 871 source inputs, not formally
proved. The abstract parameter inequality for this triple WAS proved in
second_tail_boundBF when r>=2, 0<=c<=2r and 0<=q<=r-1. The certificate is

    (8r^2)^2-4(r-1)(48r^2-16r)
      =64r((r-2)^3+3(r-2)^2+4(r-2)+3).

Its coefficient and source-statistic bridges are outstanding, so it is not
reported as a new unconditional source log-concavity theorem.

The independently tested closed K_n coefficients, useful for a subsequent
symbolic proof, are K_0=y, K_1=1+5y+3y^2 and for n>=2:

    K_n(0)=n(n+1)/2,
    K_n(1)=3n^2-n+3,
    K_n(2)=(17n^2-31n+24)/2,
    K_n(j)=8(j-1)t^2+8(j-2)t+4(j-1), t=n-j+1, for 3<=j<=n,
    K_n(n+1)=4n-2, and K_n(j)=0 for j>n+1.

These closed formulas are derived from the displayed scalar recurrences in
the working analysis and passed 5,454 finite coefficient checks; the closed
form itself is not yet a Lean theorem. The scalar recurrences are the checked
formal foundation for proving it.

## Recorded experiments and limits

cyclic-probe.json compares all binary run orderings at n=0..3 and c=3..8;
60 count-parameter cases have ordering dependence. source-second-probe.json
checks 2,944 coprime sources with b<=100 and b-a>=2, matching 111,312
coefficients and finding no failure among 105,424 adjacent tests. Of these,
84 small sources were also compared with the independent scalar transfer
implementation. This is not an independent original Laurent-recurrence scan.
The exact Lean coefficient bridge is what identifies the source coefficients.

The initial envelope implementation was interrupted because it recomputed
identical jets; its bytes are preserved. The corrected implementation caches
the shared jets and q-independent expressions, and completed in 8.72 seconds.
This operational optimization makes no controller or utility-improvement claim.

No complete diagonal aggregation proof, horizontal proof, vertical proof,
root theorem or root refutation has been obtained. The inherited infinite
interior residual remains unproved.
