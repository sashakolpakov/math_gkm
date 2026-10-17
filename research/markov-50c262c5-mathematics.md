# Research results and remaining target

Machine-authored live request 50c262c5afce4cf0a717cbef7a352e92. The exact root
Conjecture63 and its negation remain open. Local validation receipts determine
which statements below have been checked; this document is not an independent audit.

Write b=3q+delta, q>=1, delta=1 for r=true and delta=2 for r=false. Let A(i,j)
be the unchanged raw coefficient threeRawM9E2 q r i j. The inherited convolution is

    D_c(j,k) = sum_{s=0}^{min(j,k)} w(s) binom(j-s+c+3,c+3) binom(k-s+c,c),
    w(0)=1, w(s)=4s for s>0.

The omitted homogeneous exponent is k=b+2-i-j, and c=i-3. No source coefficient
is normalized. The old upper source model required j+q>=b; the new model extends
to an unbounded part of the middle strip, including its crossing rows.

## Template identity and domain

An unrestricted identification of the auxiliary top template with D is false.
The finite probe's first failure was n=5,i=3,j=0: template coefficient -15 versus
D_0(0,4)=1. This does not concern a source-family reversed inequality.

The new proved identity, for every c,d,k>=0, is

    coeff(topTemplate(c+d+2k+1,c+k+3),c+3)=D_c(k+d,k).

The proof starts with exact template boundary coefficients. For t<=n+2,
topTemplate(n,t) has no coefficient beyond t and leading coefficient binom(n+2,t).
Writing H_t=topTemplate(n,t)-topDelta(n,t), H_t has zero coefficient in degree>=t
and coeff(H_(t+1),t)=4 binom(n,t). This proves the needed penultimate coefficient.

The diagonal recurrence then identifies the coefficient with the finite ramp sum
topLinear(k,f), where

    f(s)=binom(c+s,c) binom(c+d+s+3,c+3).

Reversing that finite sum gives D_c(k+d,k). These are kernel-checkable finite-sum
identities with unbounded parameters, not interpolation from a numerical scan.
The resulting template model requires i>=3, i+j<=n+2, and n+2<=i+2j. The last
condition says k<=j; the proof does not silently extend it.

## Complete correction through crossing rows

The inherited signed middle correction formula is extended from depth l<=q to
l<=q+delta. Its original recurrence and gain terms are unchanged. The extended
range reaches j=q-1, precisely the lower crossing row in the residual.
The proof also extends the correction's degree bound to degree<=l+1.

Consequently the actual coefficient equals the top template when q<=j+1 and
b<i+j+q, inside total degree b+2. The correction is removed only by this exact
proved vanishing condition. Combining this with the template identity proves

    A(i,j)=D_(i-3)(j,b+2-i-j)

when i>=3, q<=j+1, b<i+j+q, i+j<=b+2, b+2<=i+2j.

## Source inequalities and root reduction

The inherited row/column/minor inequalities for D now give every raw vertical
triple when q<=j+1, b<i+j+q and b+2<=i+2j. For i<=3 an inherited complete-column
theorem applies. For i>=4, parameter variation gives every raw diagonal triple
when q<=j+1, b<i+j+q+2 and b<=i+2j. The earlier upper-half proof also covers i=3
when b<=2j and b<i+j+q+2. Degree tails use literal zero coefficients.

The zeroth diagonal start is proved for all rows: either its first coefficient
is outside the polygon and zero, or the triple is on one of the top three
diagonals already covered by the inherited theorem.

An immediate all-row consequence is vertical LC at every column i>=q+delta+4,
and diagonal LC at every starting column i>=q+delta+2. These thresholds grow
with q; there is no fixed denominator bound. All numerator-three horizontal
triples were inherited as closed. Path wrappers identify q=b/3 exactly, and
polygon wrappers imply the guarded inequalities of the unchanged root.

root_iff_triangleM50C states

    Conjecture63 iff ThreeTriangleResidualM50C and OtherFourM9E2.

The first proposition retains all remaining middle transverse triples, including
low starting columns and all boundary cases not covered above. The second retains
every path with numerator at least four and every direction. Both remain open.

## Investigated but unresolved central correction

A finite experiment formed E=A-D for i>=3, interpreting D as zero beyond degree.
Across 164,500 coefficients, no negative E or nonzero E outside q<j and i+j<=b-q
was observed. Tested adjacent inequalities of E in all three directions passed.
These are exploratory observations only: the global E identity, positivity,
support and log-concavity have not been proved by this run.

The simple proposed proof by separately nonnegative mixed terms fails. At actual
source 3/8, the vertical triple has A=[8,34,108], D=[8,34,104], E=[0,0,4]. Its mixed
gap is -32 while the full raw gap is +292. The diagonal triple at (3,3),(4,2),(5,1)
has A=[108,179,130], D=[104,179,130], E=[4,0,0]; its mixed gap is -520 while the full
raw gap is +18001. MarkovMiddleMixedDiagnosticM50C formalizes these values, their
actual path and polygon membership. They refute this gluing shortcut only.
Any further total-gap argument must keep these negative contributions.
