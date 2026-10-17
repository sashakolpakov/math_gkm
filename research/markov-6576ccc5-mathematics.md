# Mathematical results

Machine-authored live request 6576ccc531a74d75b259fda7f71c9b95.
Full pinned Conjecture63 remains unresolved. No novelty claim is made.

Write c=1 for false residue and c=2 for true residue; a=c, b=3-c.
The numerator-three source has denominator n=3q+3-c. In the correction band,

    q=d+2k+c,  j=q+k+1=d+3k+c+1,  d≥0.

Source applications require q≥2. The underlying factor identities quantify
over every natural d,k, with neither a denominator bound nor a bound on k.
All coefficients below are ordinary raw coefficients; casts to rationals are
only used to prove equalities and inequalities.

## A positive coefficient formula after smoothing

Let Q=bandAtM139(d,k,r). MarkovBandLiftM657 proves

    [(1+X)^d Q]_t = T(d,k,t,r),

where

    T = 4 Σ_(m=0..t) choose(d,t-m) choose(t+m+1,m)
          [a choose(k+t+3,t+m+3)+b choose(k+t+2,t+m+3)].

This sum has t+1 terms even when k is arbitrarily large. Its proof uses the
inherited exact positive double-prefix formula, the actual smoothed Fibonacci
coefficient identity, Vandermonde, and the weighted hockey-stick identity.
It does not use interpolation or a formal-series assertion.

Let L(d,j,t)=liftOutputMAE9(d,j,t), the already proved positive lower-row
coefficient. MarkovBandOutputM657 proves for every t≥0

    A_(t+3,j) = L(d,j,t)+T(d,k,t+1,r).

The coefficients at columns 0 and 1 are zero; column 2 is Q_0.
MarkovBandPolynomialM657 proves the corresponding rational polynomial formula
for every fixed column, not merely those tested or subsequently certified.
Natural binomial zeros are retained through choose_poly_natM0D3.

## New raw-source inequalities

MarkovBandFirstGapM657 proves Q_0 Q_2≤Q_1² for every d,k and residue. It
uses the previously proved exact coefficients and a nonnegative polynomial
certificate. This auxiliary result alone does not prove source LC.

MarkovResidualLowM657 proves the first two coefficients of the lower factor H:

    H_0 = choose(j+3,3)+4 choose(j+4,5),
    H_1 = d[choose(j+3,4)+4 choose(j+4,6)]
          +5[choose(j+4,5)+4 choose(j+5,7)].

The exact augmented residual R=Q+XH therefore has coefficients
(Q_0,Q_1+H_0,Q_2+H_1). MarkovResidualFirstM657 proves their adjacent inequality
by exact polynomial arithmetic for all d,k. MarkovBandEdgeM657 proves that
the first inequality survives binomial smoothing, and attaches it to the
actual source columns 2,3,4.

The three MarkovBandColumn{3,4,5}M657 modules prove the raw inequalities
starting at columns 3,4,5. They expand the universal coefficient identity and
check nonnegativity by ring_nf and positivity. Python's exploratory rational
polynomials are not trusted certificates or inputs to those proof terms.

Beyond correction degree d+k+2, the source row equals the lower row, whose
LC was already proved. MarkovBandRegionM657 combines the new prefix with
this exact tail. Thus, in EVERY band row, all starting columns

    i≤5  or  d+k+2<i

are proved. This is a universal region statement, not a finite row scan.
The effective unresolved horizontal window in this band is 6≤i≤d+k+2.
The earlier complete lower and first three correction rows remain available.

root_iff_beyond_bandM657 proves the exact equivalence

    Conjecture63 ↔ ThreeBeyondBandM657 ∧ OtherFourM9E2.

Both predicates remain open. The first retains all previous vertical and
diagonal obligations and every horizontal position not covered by the old
results or the new band region. The second retains all other source families.

## A different sufficient route for the remaining band

MarkovTransposedKernelM657 defines correctionTermM657(k,t,m,r) as the bracketed
integer summand of T, including its factor 4 and choose(t+m+1,m), but excluding
choose(d,t-m). Write E for this term. Its kernel at source column s+3 is

    K_s = lowerKernel(j,s)
          + [E(k,s+1,0,r) max(d-s,0)/(s+1)] X^s
          + Σ_(h=0..s) E(k,s+1,s-h+1,r) X^h.

The coefficients are nonnegative. Weighting coefficient h by choose(d,h)
and evaluating at 1 gives exactly A_(s+3,j). The clamped term uses the
proved binomial identity at d≤s as well as d>s; no endpoint division is lost.

TransposedCutsM657 is the explicit, UNPROVED assertion that for every d,k,r,
every s≥3 and every tail cut h, the polynomial

    cut_h(K_(s+1))² - cut_h(K_s) cut_h(K_(s+2))

has nonnegative coefficients. Here cut_h RETAINS coefficient indices ≥h.
The generic inherited weighting theorem then proves LC of the weighted
output. band_middle_of_transposed_cutsM657 formally transports this candidate
to every remaining band column. The candidate is sufficient, not claimed
necessary, proved, or equivalent to the full root.

## Rejected shortcuts and experiments

The edge-ratio bound Q_1·6≥Q_0·77 fails for d=0,k=8,false: Q_0=1620 and
Q_1=20592, giving difference -1188. MarkovBandRatioObstructionM657 proves
that failure and the factor's actual first LC inequality. The corresponding
3/53 source triple [1620,594270,53436030] has positive gap 266590464300 in
the separate exact recurrence experiment. This is not a root refutation.

The source experiment compared 44,667 coefficients, retained 19,690 zeros,
and checked 43,759 raw triples, including 24,069 polygon-valid triples.
No failure occurred. These finite checks validate no universal conjecture.

The new kernel's tail-cut probe checked 1,005,750 coefficients in 4,500
parameter triples with no failures. A prior 265,560-check PREFIX-cut run
tested a different predicate and cannot support the tail-cut transport.
The corrected tail run is stored separately. A further mixed-gap test found
120,816 negative mixed coefficients and 1,581 negative correction-only gap
coefficients. Thus a termwise nonnegative decomposition is unavailable.
The complete kernel gap must be controlled. MarkovTransposedObstructionM657
proves a mixed-gap coefficient of -30888 at d=0,k=1,false,s=3, while the
same complete-gap coefficient is 87742248. These are auxiliary polynomial
coefficients, not raw-source reversals.

The broader forcing-prefix scan passed 48,321 mixed checks, but joint midpoint
concavity failed 2,188 checks and the edge-ratio shortcut failed 486 checks.
Expanded source-gap polynomials at columns 3–5 had nonnegative coefficients;
the unshifted column-6 false-residue and column-7 candidates had negative
coefficients. These latter failures are failures of a sufficient certificate,
not source inequalities. Exact programs and outputs are in this request's
evidence directory.

Validation is separate: inherited compiled imports are reused, and no fresh
whole-source rebuild or independent completion audit is claimed.
