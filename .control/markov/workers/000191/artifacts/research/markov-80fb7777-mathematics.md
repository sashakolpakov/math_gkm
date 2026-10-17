# Middle-coefficient research for the pinned root

Machine-authored live request 80fb7777cca84604a67221c353b91e37. Accepted local
scope is determined by evidence/markov-80fb7777/validation.json. Until that
receipt exists, build/replay status must be read from the individual receipts.
Full Conjecture63 and its negation remain unproved.

Write b=3q+epsilon, epsilon=1 for r=true and epsilon=2 for r=false. The actual
source row is j=b+2-(q+3+k). The working middle domain is

    q>=1, k<=q, 2(q+3+k)<=b.

Equivalently q>=2k+5 for r=true, or q>=2k+4 for r=false. Both denominator q and
depth k are unbounded. These conditions do not include every middle/central row.

## Exact correction and raw gaps

The inherited identity is row=topTemplate(b,q+3+k)+D(q,r,k). New Lean induction
proves exact rational-polynomial expressions for D's coefficients 0 through 6,
for every q>=1 and k<=q. No interpolation premise is used: the proof checks the
initial rows and the actual signed recurrence. Its forcing coefficients are
identified with guarded natural binomials, then cast to falling-factorial
polynomials by the inherited choose_poly_nat theorem. All natural subtraction
bounds and the zero coefficient case are explicit.

For example D1=12k+8 (true) or 12k+4 (false), and

    D2(true)  = 2k-10k^3+2qk+6qk^2,
    D2(false) = -2k+12k^2-10k^3-2qk+6qk^2.

The raw source coefficient at column two simplifies algebraically to
2(q-k)(q-k+1)^2 for true and 2(q-k+1)^2(q-k+2) for false. This displayed
factorization is an algebraic reading of the checked expression, not a separate
named Lean theorem. The source axes at columns zero and one cancel exactly.

The total gaps at starting columns c=2,3,4 have strictly positive polynomial
expansions after q=x+2k+5 (true) or q=x+2k+4 (false), with x,k>=0. The
certificates contain the correction's self-gap AND every template/correction
cross term. They do not use an invalid closure of LC under addition. The
cleared gap expansions have respectively 66, 120 and 190 nonzero terms in each
residue, checked by Lean ring normalization and positivity.

The resulting source statements are strict raw horizontal inequalities at
(c,j),(c+1,j),(c+2,j) for c=2,3,4 throughout the displayed middle domain.
The explicit polygon bridge proves membership of all three points. Raw axes
are zero, so starting columns zero and one satisfy the non-strict inequality
as well. Additional inherited small-column certificates are transported at
5<=c<=8 wherever k+1<c, because the actual correction has degree at most k+1.

The path attachment uses source_three_rawM9E2. The exact remaining root is

    Conjecture63 <-> ThreeAfterJetsM80F AND OtherFourM9E2.

The vertical and constant-i+j clauses are copied unchanged from the predecessor
residual. Neither residual is proved. The endpoint clauses remain in the
unchanged root and no finite parameter bound replaces its universal scope.

## A uniform positive sum, beyond fixed columns

Let Ck=D(d+2k+2,r,k), and let

    Wk = sum_{0<=s<k} (k-1-s) G(d+2s+4,r,s+2).

The new exact polynomial identity is

    Ck = (8 if true else 4)X + 12k X
         + k(8(d+3) if true else 4(d+4))X^2 + 4X Wk.

Its proof uses the inherited diagonal second difference and an exact weighted-
sum recurrence. Every summand has nonnegative coefficients; the last weight is
zero and remains included. Substitution d=q-2k-2 attaches this formula to the
actual source correction for q>=2k+2. This supplies a uniform finite-sum object
for further work, but does not prove that the sum with the template is LC.

MarkovMiddleTwoSumM80F also attaches this to every raw column c+3, with c
unbounded. Put d0=q-(2k+2). In the middle domain the exact rational cast is

    A(c+3,j) = topShort(b-2(q+3+k),q+k,c)
       +4 sum_{0<=s<k} (k-1-s) gainJet(d0+2s+4,s,r,c+2).

gainJet is explicitly a sum of products of ordinary binomial polynomials,
proved equal to the original gain coefficient at these natural parameters.
This is a uniform two-sum representation, not a conditional identity or a
fixed-index interpolation. It keeps the terminal zero weight. Controlling
the total coefficient gap of these two sums remains open in general c.

## Limits discovered by larger experiments

Exact symbolic experiments through starting column 9 show why an unrestricted
coefficient-positive real-parameter extension is unsuitable. Without support
bounds, the false-residue gap at c=8 has 30 negative monomial coefficients;
the true-residue gap at c=9 has 35. These counts are finite symbolic evidence.

The separate Lean auxiliary obstruction proves

    topShort(1/2,9/2,6)^2
      - topShort(1/2,9/2,5)*topShort(1/2,9/2,7)
      = -522352793324732739191537 / 288230376151711744.

This has nonintegral parameters outside the relevant support. It is NOT a
source-family witness or a refutation of Conjecture63. All-column arguments
must retain the support restriction and integrality instead of extrapolating
the successful first few continuous polynomial certificates.

A support-aware experiment decomposes T=x+3k+base>=c-1 using
K=max(0,ceil((c-base-1)/3)), base=4 or 5. For k>=K, substitute k=K+h;
for each integer k<K, substitute x=max(0,c-base-1-3k)+y. All resulting gap
coefficients were nonnegative through c=9, with positive constants. This is
finite evidence only; a uniform-in-column proof is open. Reproducible programs
and exact results are in general_jets_probe_80fb7777.py,
extended_jets_probe_80fb7777.py and polygon_shift_probe_80fb7777.py.

The independent direct source recurrence experiment checked 9,000 correction
jets, 20,324 source coefficients retaining 1,975 zeros, 1,185 strict middle
triples and 452,569 polygon-valid triples across all directions without failure.
These computations are not proof premises and do not close the root.
