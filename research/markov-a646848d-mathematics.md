# Mathematical checkpoint

Machine-authored live request a646848db8dc4dffbca4cc335370b378.
Full pinned MathGKM.Markov.Conjecture63 remains unresolved. Completion is null.
Source-bound compilation, union replay and axiom receipts govern the results.

## Closed first-correction horizontal row

MarkovCorrectionClosedMA64.first_correction_closedMA64 (namespace
MathGKM.Markov) proves, for every q≥1, both Boolean residues r and every
natural column i,

    threeRaw(q,r,i,q+1) threeRaw(q,r,i+2,q+1)
      ≤ threeRaw(q,r,i+1,q+1)^2.

There is no denominator bound or zero-coefficient exclusion. The inherited
small-column and tail results retain the q=1 exception. The new proof closes
the previously unresolved FirstCorrectionWindowM418 completely.

The direct source_lower_first_pathMA64 theorem states the raw inequality on
every actual frame path with numerator 3, for every i,j satisfying
3j≤b+3. This combines the previously closed lower region with one complete
additional row. The source denominator is b=3q+1 or 3q+2; the new row is q+1.

root_iff_beyond_correctionMA64 proves the exact equivalence

    Conjecture63 ↔ ThreeBeyondCorrectionM418 ∧ OtherFourM9E2.

Both residual predicates remain open. The first retains later horizontal
rows, unproved vertical ranges and unproved constant-i+j ranges. OtherFourM9E2
is unchanged. This is not a new complete source direction or a root proof.

## Quantitative complete-kernel margin

Write Q(j,t) for the inherited positive negative-binomial polynomial,
L_t(X)=Q(j,t;X+1), and L(t,m) for its coefficient of X^m. Thus L(t,m) is
exactly liftTermMAE9 j t m, including its zero tail. Let

    B_s = choose(t+s+j+3,j),
    N = B_1²-B_0 B_2,
    Z = L(t+2,0), M=L(t+1,0)²,
    U = 8(j-t-2)/(t+1), κ=j(t+j+5)/(t+5).

The inherited Q gap has all coefficients nonnegative. Its coefficient at
2j is exactly N. After X+1 substitution this gives the quantitative bound

    coeff_m(L_(t+1)²-L_t L_(t+2)) ≥ N choose(2j,m).

A general coefficient bound for a nonnegative polynomial P of degree at
most j gives coeff_m(P(X+1))≤coeff_0(P(X+1)) choose(j,m).
It also yields coeff_m(L_(t+1)²)≤M choose(2j,m).

For t≥4 and j≥t+3, the binomial lower bound
B_0≥(j+1)(j+2)(j+3)(j+4)(j+5)/120 supplies two scalar margins:

    2UZ+U² ≤ N,
    U κ M ≤ N L(t+1,1).

The two exact rational certificates have 229 and 107 nonnegative monomials
after t=4+x, j=t+3+g and B_0=choose(j+5,5)+z. Python proposes their Horner
expressions; ordinary Lean ring and positivity proofs check every identity
and inequality. No GAP output or external assertion enters the proof.

The first margin proves coefficientwise positivity after adding arbitrary
nonnegative constants a,b,c to L_t,L_(t+1),L_(t+2), provided a,c≤U.
It explicitly bounds both negative linear perturbations and the negative
constant product ac; increasing the central correction b is harmless.

## Quantitative cut transport and the border

MarkovQuantitativeCutMA64 proves a quantitative extension of the inherited
normalized-pair cut argument. If M≥0, A,B,C have nonnegative coefficients,
their PairOrder holds and N coeff(B²)≤M coeff(B²-AC) everywhere, then the
same inequality holds after applying a common lower cut to A,B,C.
The proof applies the inherited zero-safe finite-sum theorem to
M pairGap−2N pairDen. The N terms cancel from pair comparisons. Zero
denominators are retained and their signed terms are nonpositive.

The inherited, already proved uncorrected pair order therefore gives a
quantitative margin for every lift cut. At coefficient t+h, with h≤t,
one term in the middle square supplies

    M G(j,t,h;t+h) ≥ N L(t+1,1) L(t+1,t+1-h).

A coarse exact diagonal-step estimate proves, for n≥1 and n≤j,

    L(t+2,n+1) ≤ κ L(t+1,n).

Combining these with the second scalar certificate proves the entire border
margin. This avoids proving BorderDominanceMF8F or the much larger relaxed
normalized-edge rational expression. Those stronger candidates are not
asserted here and are no longer needed for the first correction row.

## Absorbed kernel and source transport

For 0≤c≤8, d>t≥4 and j≥d+2, the actual correction
alpha(d,t,c)=c*(d-t as natural subtraction)/(t+1) is bounded by U.
The correction at t+2 is treated with its actual zero clamp. Reflecting the
complete constant-perturbed kernel gives the full absorbed reversed kernel.
An exact shift identity relates its common cuts to absorbedLiftM418.
Above the cut border, omitted terms are nonpositive; below it, the old
uncorrected lift gap is unchanged. The border is handled as above.

absorbed_middle_generalMA64 proves all coefficients of all these cut gaps
nonnegative for every real c∈[0,8] and every j≥d+2. The source uses the
particular pairs j=d+2,c=4 and j=d+3,c=8. The inherited exact binomial-weighted
output and source-row identities then give the raw first-correction theorem.
AbsorbedMiddleM418, AbsorbedUncutMF8F and AbsorbedBorderMarginMF8F are now
proved. The new direct general proof also handles h=t without relying on
the predecessor's special boundary certificates for its positivity argument.

## Experiments and next-row observation

The source experiment checked 1,161 first-correction coefficient comparisons,
462 of them zero, and 1,144 raw triples at ten specified q values through 64.
The quantitative probe checked 1,190 scalar margins and 9,520 border bounds.
These passed and are experiments, not the universal proofs above.

The next-row probe checked 728 actual source coefficients and 688 raw triples
at j=q+2. In the nonnegative exponent ranges, 659 coefficients agree with
the inherited proposed identity

    P_row = lower_row + c0 X²(1+X)^d + c1 X³(1+X)^d,

where false residue has d=q−3,c0=24,c1=4q, and true residue has
d=q−4,c0=36,c1=8q−8. The universal source identity is still unproved.
The 184 tested scalar margins with U=c0(d-t)/(t+1)+c1 passed for 4≤t≤d.
The same formulas must not be extrapolated through negative exponents.

Mixed-gap negativity persists: on the actual 3/14 row j=6, the starting
column 2 split has lower [0,1092,9918], correction [24,40,16], and mixed
gap −150672, while the raw triple [24,1132,9934] is log-concave. This is a
finite diagnostic, not a formal refutation of any source inequality.
The over-relaxed bound U=36(j-t-5)/(t+1)+8j fails the sufficient scalar tests
at (j,t)=(9,4), and its full-gap test also fails at (10,4); it is not a
source counterexample. Actual residue-specific constants must be retained.
