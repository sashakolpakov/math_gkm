# Binomial mixtures and source interiors

Machine-authored request f1e4fe3b99d84d70bd218f29dcffcb3c.
Full pinned Conjecture63 remains unresolved. Check validation.json for the
final source-bound compilation, replay and axiom status of every module.

For a nonnegative real polynomial P supported in [l,u], write w=u-l and
Q=(1+X)^n P. The proved uniform statement is raw coefficient LC at the
starting index k whenever

    u+w² <= k,       k+2+w² <= n+l.

No bound on n, degree, coefficient size, or seed gap is imposed. P may have
internal zeros and need not be log-concave. The proof works by summing mixed
two-shift inequalities. For shifts r<=s, put t=s-r, a=k-s,
b=n-(k-r+2). The four consecutive-binomial recurrences reduce the mixed gap
to the numerator

    D=2(a+2)(b+2)(a+t+2)(b+t+2)
      -(a+t+1)(b+t+1)(a+t+2)(b+t+2)
      -(a+1)(b+1)(a+2)(b+2).

For a=t²+x, b=t²+y, it is exactly

    24+20t+35t²+16t³+11t⁴+2t⁵
    +(x+y)(20+11t+17t²+4t³+2t⁴)
    +(x²+y²)(4+t+t²)+xy(14+4t+6t²)+2xy²+2x²y.

Every term is nonnegative for x,y,t>=0. This is a sufficient criterion;
outside it there is no asserted sign. The general finite-mixture argument
sums both ordered cross terms, preserving arbitrary zero coefficients.
The clearing factors are strictly positive; no source coefficient is divided
out or normalized.

For a source label a/b, the source adapters use the inherited nonnegative
residual factorizations. Horizontal row j has n=b-2j-1, upper seed degree
u=a+j, and lower support l=max(a-j,0), in the forward range 2j+1<=b.
Vertical column i has n=a-2i-1, u=b+i, and l=max(b-ci,0) for any natural
c with b<=ca, in the range 2i+1<=a. The lower support is proved from the
actual polygon and coefficientwise nonnegativity, by bounding each seed
coefficient by the corresponding coefficient after binomial smoothing.

On a diagonal at omitted homogeneous depth r, the seed degree is <=r,
lower support is 0, and n=a+b-1-2r. The sufficient criterion becomes simply

    r+r² <= i,       r+r² <= j,
    i+j+2+r=a+b-1.

This concerns precisely the raw triple (i,j+2),(i+1,j+1),(i+2,j). All three
source adapters compiled and passed isolated kernel replay and permitted
axiom audits. The exact reduced residual also compiled. Final validation.json
binds the completed checks to the source bytes.

The exact equivalence `root_iff_interiorMF1E` removes only the displayed
middle regions from the prior MF25 residual, by case splitting on their
explicit predicates. It keeps all old polygon, depth, direction, and slope
guards. The new residual itself remains unproved.

The checked nonvacuity construction takes, for every r>=6,
n=r²+r+1 and path R^n L. Its labels are a=2n+1, b=2n+3. The starting offsets
i=r²+r, j=3r²+2r+5 have depth r and meet both middle bounds, all three
polygon guards, and all the prior diagonal residual guards. This addresses
unbounded depth, not merely a finite collection of added diagonal lines.

The exact finite experiment compares 179 source polynomials through b=24
against an independent positive-matrix implementation. Larger cases cover
new interior triples relative to the inherited MF25 residual in each of the
three directions. This is computational evidence only. The general seed
probe includes 181 non-log-concave seeds and retains zero triples.

The 350 larger source triples are: horizontal rows 5 and 6 at 50/251 and
101/401; vertical columns 4 and 5 at 321/641 and 501/751; and diagonal
depths 8, 9, 10 at 79/101, 123/151, 149/173. Every one lies in the previous
MF25 residual's guards. Their numerical agreement is not a universal proof.

A simple boundary obstruction is P=1+100X², n=2, whose raw initial triple
is [1,2,101]. Its gap is -97. This is an arbitrary-mixture example outside
the sufficient region, not an actual-source witness or root refutation.

The primary published target was retrieved live:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . Targeted
searches on coefficient log-concavity and binomial smoothing supplied no
theorem used as an axiom. No historical novelty or exhaustive-search claim
is made. The computation and proof here are independent of search snippets.

Final validation passed all five mathematical modules, separate isolated
kernel replays, and 20 permitted-axiom theorem closures. The diagnostic
standalone helper is excluded. No closed proof or negation of the pinned
root is claimed; no fresh whole-source rebuild or independent completion
audit occurred. All exact checked bytes are bound in validation.json.
