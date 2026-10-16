# Vertical strip starting at j=1 in the low-slope cone

Machine-authored live request b9d0d3410a1644b6b35ab712bbfc87f7.
The exact pinned Conjecture63 remains unresolved. Six modules compiled and passed isolated kernel replay; 21 theorem closures
use only permitted axioms. The source-bound evidence/markov-b9d0d341/validation.json
inventory records these checks;
drafts and probes outside that inventory are not admitted mathematical evidence.

The new source statement is `source_strip_all_lowMB9D`:
for every finite source path with 3a<=b, and every natural i,

    A[i,1] A[i,3] <= A[i,2]^2.

The a=1 family uses the inherited all-source Fibonacci theorem. For a>=2,
the only possible b<7 case in this cone would be a=2,b=6, excluded by
coprimality. The remaining proof is `source_strip_lowMB9D`.

It has no denominator upper bound, polygon guard, or deletion of zero positions.
It concerns the vertical direction only. The first-row factorization implies
A[i,1]=0 for i<a; polygon support implies A[i,3]=0 for i+3>a+b-1.
The remaining positions have i=a+k, b=k+l+2 with k>=0 and l>=2.

## Exact source formulas

The inherited third horizontal formula depends on
q=max(2a-b,0), t=min(b-a,max(3a-b,0)), u=max(3a-2b,0).
All three vanish when 3a<=b. The second-row statistic is exactly 2q.
Write R_j(X)=sum_i A[i,j] X^i. The new adapters specialize the established
source formulas to

    R_1 = X^a (1+X)^(b-3) [(3a-1)+(a+b-1)X],
    2 R_2 = X^a (1+X)^(b-5) [D+E X+F X^2],
    6 R_3 = X^a (1+X)^(b-7) [C2+C3 X+C4 X^2+C5 X^3],

where D=9a^2-5a+2, E=6a^2+6ab-16a+4, F=(a+b-1)(a+b-2),
and Cr=h3crM13D(a,b,0) for r=2 (or h3crM13D(a,b) for r=3,4,5).
The inherited definitions give their exact integer polynomial expressions.
Polynomial swapping and coefficient maps are explicit; no variable or
coefficient normalization is silently substituted.

Put N=k+l=b-2, C=choose(N,k), and c_r=A[a+k,r]. Define

    T=(3a-1)l+(a+b-1)k,
    J=D(l-1)(l-2)+Ek(l-1)+Fk(k-1),
    H=C2(l-2)(l-3)(l-4)+C3k(l-2)(l-3)
      +C4k(k-1)(l-2)+C5k(k-1)(k-2).

The binomial identities are

    N c_1 = C T,
    2N(N-1)(N-2)c_2 = C l J,
    6N(N-1)(N-2)(N-3)(N-4)c_3 = C l(l-1) H.

These follow from inherited degree-two and degree-three falling-factorial
coefficient identities and the elementary binomial downshift relation. They
include zeros near both degree endpoints; no division by a coefficient occurs.

## Polynomial gap

The scalar gap is

    G=3(N-3)(N-4)l J^2 - 2(N-1)(N-2)(l-1) T H.

Four charts cover a>=1, k>=0, l>=2, k+l>=5:
(a,k,l)=(A+1,K,L+5), (A+1,K+3,2), (A+1,K+2,3), (A+1,K+1,4).
The expansions have respectively 255,45,45,45 positive coefficients.
The accepted scalar proofs use Lean `ring_nf` and `positivity`; the Python
expansions are only exploratory evidence. The chart coverage is proved with
natural arithmetic. The exact positive-scalar transfer is

    12[N(N-1)(N-2)]^2 (N-3)(N-4)(c_2^2-c_1 c_3) = C^2 l G.

N>=5 makes the left scalar strictly positive. This returns the raw integer
inequality after casting back from the reals.

## Residual and experiments

The exact residual `InteriorCore63MB9D` retains every condition from
`InteriorCore63MAA6` and adds only `(2<=j or b<3a)` to its vertical clause.
Its root-equivalence proof uses the source adapter above. Horizontal
rows and deeper diagonals remain unchanged and unproved.

The exact subtractive source recurrence scan for b<=40 tested 489 fractions,
489 whole-polynomial comparisons with the positive word recurrence, 21,621 raw
strip triples (9,977 containing a zero), 32,793 general scaled identities, and
6,416 low-slope scaled identities. No failures occurred. These are finite
experiments, not universal proofs.

An additional exact symbolic probe substituted a=(k+l+2+t)/3, q=u=0 into the
general cleared gap. All 18 tested parameter charts had nonnegative polynomial
coefficients, suggesting an extension to 2a<=b<=3a. The quartic source adapter,
Lean identities and chart coverage for that extension are NOT proved here.
The other slope regions remain pending as well. No source counterexample was found.
