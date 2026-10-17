# Exact upper-row gaps, two edges, and a finite residual per depth

Machine-authored live request eb6a900170904ab59255de637301f446.
The pinned full Conjecture63 is unresolved. New results are local Lean theorems;
they are not a fresh whole-source completion package or a novelty claim.

## Recovered work and the exact coefficient object

The interrupted worker's ten M55C sources were retained unchanged and rebuilt
in this run. Its columns 2,3,4 certificate, moment reduction, exact residual,
parameter polynomial, and positive leading-coefficient theorem all compiled.
The raw event log ended after a successful Leading module build and read-only
search. All started actions had completion events; no prior mutation was replayed.

For the numerator-three source, write b=3q+1 or 3q+2, q>=1, and
j=b+2-t. In the upper sector 5<=t<=q+2 the inherited source-template identity
identifies each literal integer coefficient with the template coefficient.
Put T=t-3 and d=b-2t. For a high column i+3 the exact coefficient is

    M_i(d,T) = K_i(d,T) + 4 sum_(s<T) (T-s) K_i(d,s),
    K_i(d,s) = choose(s,i) choose(d+s+i+8,i+3).

Both parameters are natural here. The source sector implies T<=d+2.
These are raw coefficients. Rational polynomials and factorial clearing below
are auxiliary algebra, and every source conclusion returns to integer raw gaps.

## Explicit denominator bounds for every fixed depth

MarkovTopGapPolynomialMEB6 defines G_(T,i)(d)=M_(i+1)^2-M_i M_(i+2)
as a rational polynomial in d. Its exact evaluation theorem uses the inherited
parameter-polynomial identity, not interpolation. For i+1<=T its degree is
exactly 2i+8 and its leading coefficient is strictly positive, by the recovered
universal theorem about the top parameter coefficients.

For any rational polynomial P with positive leading coefficient, define

    N(P) = sum_(k<degree P) max(0,-[X^k]P),
    B(P) = ceil_nat(N(P)/leadingCoeff(P)) + 1.

MarkovPolynomialBoundMEB6 proves P(n)>0 for every natural n>=B(P).
The proof bounds each negative lower term by N(P)n^(degree-1), treating the
constant-polynomial case separately. The threshold is an explicit expression
in rational coefficients. It is not an assumed uniform constant, and no
unproved coefficient-positivity assertion is used.

Taking the maximum B(G_(T,i)) over i<T gives topRowThresholdMEB6(T).
The zero-tail theorem handles every remaining i. MarkovTopFiniteStripMEB6
and MarkovTopSourceRegionMEB6 consequently prove: for each fixed t>=5,
all horizontal inequalities at row b+2-t hold on every sufficiently large
numerator-three source denominator, both residues and every column, including
zeros. source_top_path_eventualMEB6 states this directly for every original
path with numerator three. A sufficient explicit path-denominator threshold is
3*(2t+topRowThresholdMEB6(t-3)+1)+2.

This is an unbounded theorem in t and denominators with a depth-dependent
cutoff, not a theorem that one cutoff works simultaneously for all depths.

## Two complementary short sums

MarkovTopVandermondeMEB6 proves for all natural d,T,i:

    M_i(d,T) = sum_(k=0)^(i+3) choose(i+k,i) choose(d+2i+8,i+3-k)
                 * [choose(T,i+k)+4 choose(T+1,i+k+2)].

Vandermonde's identity and choose(s,i)choose(s-i,k)=
choose(i+k,i)choose(s,i+k) prove the kernel equality. The triangular weighted
binomial sum then telescopes. Both s<i and all binomial zero cases are retained.
This representation has i+4 terms, independent of the row depth T.

MarkovTopTailKernelMEB6 proves the complementary representation

    M_i(d,i+r) = K_i(d,i+r)+4 sum_(k<r) (r-k) K_i(d,i+k).

Its proof discards only terms proved zero by their binomial factor. This
representation has r+1 terms, independent of the column i.

## First high triple, universally

At i=0 put T=h+2. The short sum expresses M_0,M_1,M_2 as finite rational
polynomials in h,d. MarkovTopThirdGapMEB6 proves their gap positive for all
h,d>=0 using an exact 99-term positive polynomial certificate. Ring
normalization checks the identity; positivity checks the displayed certificate.
Thus M_0 M_2<M_1^2 for all natural d and T>=2.

MarkovTopTwoEdgesMEB6 identifies this with the strict raw source triple at
columns 3,4,5 for every 5<=t<=q+2. This does not assume the moment bound.

## Last nonzero triple, universally

For T=i+2 only three kernel positions contribute. Set I=i, D=d and

    L=2(D+I+6)(D+I+7),
    v1=2(I+1)(D+2I+9)(D+I+7),
    v2=(I+1)(I+2)(D+2I+9)(D+2I+10),
    A=8L+4v1+v2,
    E=4(D+2I+10)v1+2(D+2I+11)v2,
    C=2(D+2I+11)(D+2I+12)v2.

The kernel ratio theorem and the inherited column-step theorem prove exact
denominator-free scaling identities for the three masses. The cleared gap is

    (I+2)(I+5) E^2 - (I+1)(I+4) A C.

MarkovTopTailScalarMEB6 proves it strictly positive for I,D>=0 by an exact
70-term positive integer polynomial certificate. MarkovTopTailClosedMEB6
transfers it using only positive factors and squares. Therefore
M_i(d,i+2) M_(i+2)(d,i+2)<M_(i+1)(d,i+2)^2 for all natural d,i.
The source attachment gives the last nonzero triple at columns t-2,t-1,t.
The two edges plus predecessor results also close the complete horizontal
upper rows of depths t=5 and t=6.

## Polygon, zeros, and the exact remaining conditions

source_top_polygon_iffMEB6 proves in the source sector that a position on row
b+2-t lies in the pinned polygon exactly when 1<=i<=t. This proves validity
of every new edge triple; no endpoint or zero is removed from WeakLC.

The open moment condition is now exactly equivalent to TopInnerFiniteStripMEB6:

    for every T,i,d with 1<=i, i+3<=T, T<=d+2,
    and d<B(G_(T,i)), require G_(T,i)(d)>=0.

For each fixed T this is a finite set of integer checks, because i is bounded
and each threshold is finite. T remains unbounded; no finite experiment closes
this universal residual. The first high triple, last triple, and zero tails
are proved separately in the equivalence.

MarkovTopFrontierMEB6 proves the exact full-root equivalence

    Conjecture63 <-> ThreeFrontierMEB6 AND OtherFourM9E2.

ThreeFrontierMEB6 excludes only the proved upper-row cutoff and edge regions.
The middle horizontal strip and both inherited vertical/diagonal residuals
remain. OtherFourM9E2 is unchanged. Neither residual is proved.

## Experiments, explicitly separate

The unshifted d-polynomial probe passed 1,225 gap polynomials and 50,225
coefficients at 2<=T<=50, all interior i. Short-sum identities passed 322
finite parameter-polynomial comparisons. For i=0..12, 26 two-variable Newton
basis tests (both unshifted d and d=T-2+e) had no negative coefficients.
For i=0..6, ordinary monomial tests in T=i+2+h,d also had no negative terms.
Only the i=0 ordinary certificate was promoted to a Lean theorem in this run.
Universal two-variable coefficient positivity for arbitrary i remains a lead.

Independent exact source recurrence checks passed 13,948 coefficient
comparisons, retaining 2,858 zeros; 3,546 short-sum comparisons; 1,076 new
edge triples; and 271,655 polygon-valid triples across all three directions.
The finite experiments are evidence about these inputs, not a proof of the
universal residual or the full source conjecture.
