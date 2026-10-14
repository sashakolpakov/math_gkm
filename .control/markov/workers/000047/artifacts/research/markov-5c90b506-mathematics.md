# Positive ambient transfer and the Pell kernel

Machine-authored request 5c90b5063976426b9c5577badcc55c00. No novelty claim.
The full pinned Conjecture63 remains unresolved. Formal status is determined
by the final validation manifest, not by the existence of a draft file.

## Exact all-source change of exponents

Set u=x, v=xy. For the source a/b let c be its inherited exact central A/B
word (length b-2, B-count a-1). The new denominator-free gauge calculation
proves

    P_(a/b)(x,xy) = x^a F_c(x,y),
    F_c = (y,1) T_c (x(1+y), 1+x(1+y))^T,
    T_A = [[xy,x],[xy,1+x]],
    T_B = [[y+xy(1+y),x(1+y)],
           [2y+xy(1+y),1+x(1+y)]] .

Both transfers are linear in x with nonnegative coefficients. Their linear
parts are H and (1+y)H, where H=[[y,1],[y,1]] and H^2=(1+y)H.
The constant parts are D_A=[[0,0],[0,1]] and D_B=[[y,0],[2y,1]].
This is an exact polynomial identity at x=0 as well: the proof multiplies
through the diagonal gauge and cancels only the nonzero polynomial X, never
a real value or a raw coefficient.

For s=i+j-a >=0 the literal coefficient identity is

    A(i,j) = [x^s y^j] F_c.

With i,j natural and i+j=a+s, the polygon condition is exactly

    s <= b-1,  (b-a)j <= b s.

The natural original index also retains j<=a+s. The three original
directions become respectively (1,0), (1,1), and (0,1) in (s,j). In
particular, a horizontal-only argument in these new variables does NOT
establish the original vertical or diagonal clauses.

## A broader sufficient horizontal target

For an arbitrary A/B word w let N=length(w)+1 and C_w(s,j)=[x^s y^j]F_w.
The proposed assertion is

    (s+2)(N-s) C_w(s,j) C_w(s+2,j)
       <= (s+1)(N-s-1) C_w(s+1,j)^2,   s+2<=N.

The new reduction connects this explicitly unproved all-word assertion to
the actual source ambient bound and hence raw horizontal inequalities.
It does not assume arbitrary-word vertical or diagonal log-concavity.

The exact enumeration extends earlier no-adjacent-C experiments to the
ambient bound: 28,656 gas cores of length 1 through 21, beginning and ending
in A and with no CC, give 4,415,699 nontrivial horizontal triples without
failure. Every such core is expand(w)A for a unique original A/B word w.
Zero endpoint products are omitted only from the nontrivial count; they
satisfy the tested inequality because all coefficients and both scalar
weights in range are nonnegative. This is finite evidence, not a proof.

## Exact Pell generating kernel

For c=B^(a-1), write Q_a=F_c and Q_0=1. The new formal recurrence is

    Q_1=1+x(1+y)^2,
    Q_(a+2)=(1+y+x(1+y)^2)Q_(a+1)-y Q_a.

As an ordinary formal power series in z, it gives the checked equation

    [(1-z)(1-yz)-xz(1+y)^2] sum_(a>=0) Q_a z^a = 1-yz.

The exact source coefficient bridge retains every natural i,j,s satisfying
i+j=a+s. This supplies the source interpretation of the ambient kernel.
The recurrence also gives the checked Cassini identity

    Q_a Q_(a+2)-Q_(a+1)^2 = x y^(a+1)(1+y)^2.

Its sign concerns the FAMILY index a, not any pinned coefficient direction.
It must not be used as a coefficient log-concavity assertion.

Writing K_s(z)=sum_(a>=0) [x^s]Q_a z^a, the extracted recurrence is

    (1-z)(1-yz) K_(s+1) = z(1+y)^2 K_s,
    (1-z) K_0 = 1.

MarkovAmbientSlices5c90 proves these equations over every commutative ring,
then proves by induction the denominator-cleared form of

    sum_(a>=s) [x^s]Q_a z^a
      = z^s(1+y)^(2s)/[(1-z)^(s+1)(1-yz)^s].

The extracted identity is therefore checked as an ordinary formal-power-series
equation, including s=0, with no division or convergence assumption. Its
positive binomial expansion is compatible with the inherited exact binomial
sums. None of these identities proves the aggregate coefficient inequality;
global horizontal aggregation remains open.

## A source obstruction to a tempting shortcut

For c=A (actual source 1/3), the new exact identity is

    F_A(x,y)=1+2x(1+y)+x^2(1+y)^3.

At y=1 this is 1+4x+8x^2, strictly positive for every real x and of degree
two. Thus even the sheared total-degree polynomial need not be real-rooted.
The exact source identity and strict positivity are proved in Lean; the
Sturm probe independently records zero real roots. This rules out blanket
real-rootedness of F_w(x,y) at positive y. It does not refute either the
ambient coefficient bound or the published raw inequalities. In particular,
evaluating y=1 sums many coefficient rows, whereas the horizontal target
extracts one fixed y coefficient.

An additional independent implementation of the two new transfers checked
2,047 full polynomial identities against the earlier gas representation,
then tested 200 seeded words of lengths 20,40,60,100 with various B densities.
Across all 2,247 words there were 929,901 nontrivial ambient inequalities and
no failure. The random words, seed 590, and exact counts are retained in
ambient-transfer.json. These tests also verified the constant x coefficient
1 and top x coefficient (1+y)^(length(w)+count_B(w)+2) on those words only.

## Operational evidence

The immediate predecessor completed and all 62 changed research/evidence
hashes match its receipt. No side effect was replayed. Earlier interrupted
work was already reconciled by completed successors. Higher-priority
permissions prohibit .scratch reads; durable research/evidence paths were
used instead. A shell here-document failed before file creation. Sage and
SymPy are unavailable; GAP is discoverable but was not needed. All proof
attempts are foreground executions, and rejected elaborations are retained.

Hosted primary-source reading used the published target at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . Literature
searches supplied no theorem used as an axiom or proof premise.
