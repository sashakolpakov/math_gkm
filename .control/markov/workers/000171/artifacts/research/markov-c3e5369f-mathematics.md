# Mathematical checkpoint

Machine-authored live request c3e5369fa14d43dbbe480d50598f6f6a.
Full pinned MathGKM.Markov.Conjecture63 remains unresolved. Completion is null.

## Closed second correction row

`MarkovSecondClosedMC3E.second_correction_closedMC3E` proves, for every q≥1,
both Boolean residues and every natural starting column i,

    threeRaw(q,r,i,q+2) threeRaw(q,r,i+2,q+2)
      ≤ threeRaw(q,r,i+1,q+2)^2.

There is no finite denominator limit, coefficient normalization or zero
exclusion. The q≤2 cases use the inherited first five horizontal rows; q=3
uses the inherited universal j=5 theorem. The new proof covers q≥4 directly.

`source_lower_second_pathMC3E` gives the literal raw coefficient inequality
on every actual frame path of numerator three for every i,j with 3j≤b+6.
`root_iff_beyond_secondMC3E` proves the exact equivalence

    Conjecture63 ↔ ThreeBeyondSecondMC3E ∧ OtherFourM9E2.

Both residual predicates remain open. The first retains later horizontal
rows and the unchanged unproved vertical and constant-i+j domains. The second
retains other numerator families unchanged. Endpoints stay in the original
root equivalence. This is not a full-root theorem.

## Exact source formula

At j=q+2 the actual row is the inherited lower row plus

    X²(1+X)^d(c0+c1 X).

For false residue: d=q−3, c0=24, c1=4q, requiring q≥3.
For true residue: d=q−4, c0=36, c1=8q−8, requiring q≥4.
`second_row_formulaMC3E` and `second_row_sourceMC3E` prove the polynomial and
raw-coefficient identities. The proof uses the exact discriminant recurrence,
the first correction row, and the ordinary Fibonacci rows 0 and 1. It cancels
the nonzero polynomial (X+1)² only after checking the source equation.
Every power has a nonnegative exponent in its stated range.

## Generic robustness theorem

Let L_t be the inherited complete positive lift polynomial of kernel size j.
Let N be its top binomial gap, M=L_(t+1)(0)² and κ=j(t+j+5)/(t+5).
The new `perturb_all_cutsMC3E` handles arbitrary last coefficients a,b,c≥0
bounded at the two endpoints by a common u≥0. With t+1≤j it assumes precisely

    2u L_(t+2)(0)+u² ≤ N,
    u κ M ≤ N coeff_1(L_(t+1)).

It proves every coefficient of every common lower-cut gap for
liftPoly(j,t)+a X^t, liftPoly(j,t+1)+b X^(t+1),
liftPoly(j,t+2)+c X^(t+2) is nonnegative. It uses complete-kernel reflection
and shift identities above the cut border, the quantitative uncorrected cut
bound at the border, and an exact unchanged-gap identity below it. Cuts above
t kill the left factor. No division by source coefficients or zero filtering
occurs. The central perturbation b has no upper bound.

For the actual second row set j=d+5 (false) or d+6 (true), and

    e_t = c0 max(d−t,0)/(t+1)+c1.

Binomial weighting gives exactly

    lowerOutput(d,j,t)+c0 choose(d,t+1)+c1 choose(d,t).

This holds for every t, including t=d and t>d. The e_t are nonnegative and
nonincreasing. For 4≤t≤d, the two scalar margins hold with u=e_t. For t>d
both correction coefficients vanish and the inherited lower-output inequality
applies. The source-weight bridge is `source_second_outputMC3E`.

The scalar proof uses B=choose(t+j+3,j)≥choose(j+7,7). After t=4+x and d=t+g,
with nonnegative x,g,z=B−choose(j+7,7), the two residues each have a checked
334-term complete-margin certificate and a 136-term border certificate.
Ordinary Lean ring and positivity check their exact rational identities.
The initially attempted weaker degree-five binomial base produced negative
certificate coefficients and was abandoned; that failure says nothing against
the source conjecture. The final source-bound receipts distinguish it.

For starting columns 2 through 6, exact rational column polynomials and
nonnegative gap polynomials close the remaining prefix. Columns 0 and 1
vanish in the polynomial-exponent ranges. The exceptional q values are covered
by the inherited source theorems described above.

## Experimental check

The separate direct-recurrence experiment at 11 specified q values through
64 checked 1,243 source coefficients, retaining 527 zeros, and 1,199 raw
triples (672 polygon-valid). In the valid exponent ranges, 1,174 coefficients
matched the new formula. No failure occurred. This is a finite experiment,
not the proof above. Evidence: evidence/markov-c3e5369f/source-experiment.json.

## Exact next-row identity and transport obstruction

The third correction row j=q+3 has now also been identified exactly, without
a log-concavity claim. `third_row_formulaMC3E` and `third_row_sourceMC3E`
give lowerRow plus X²(1+X)^d(c0+c1 X+c2 X²), with

* false: q≥5, d=q−5, c0=72, c1=28q−44, c2=2q(q−1);
* true: q≥6, d=q−6, c0=96, c1=44q−108, c2=4(q−1)(q−2).

The proof derives the second Fibonacci row from its exact recurrence and uses
the first and second correction identities in the discriminant equation.
The formula does not extrapolate through negative exponents.

At output index t=d+1, the coefficient at source column i=d+4 exceeds the
lower-row value by c2>0, although choose(d,t)=0. Consequently changing only
the last coefficient of liftPoly cannot reproduce that source output at this
index, regardless of the chosen real correction. The formal statement is
`third_no_single_slotMC3E`; it is an obstruction to that representation, not
a reversed raw log-concavity inequality and not a root refutation.

A proposed replacement adds c2 X^(t−1) for t≥1 as well as
(c0 max(d−t,0)/(t+1)+c1) X^t. The third-row finite experiment checked 487
source coefficients, 465 triples and 11 endpoint discrepancies, with no
formula or raw-LC failures. The two-slot cut-gap tests are recorded separately;
neither their universal positivity nor their source transport is asserted.
