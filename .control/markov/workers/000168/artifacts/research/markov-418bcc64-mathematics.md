# Mathematical report

Machine-authored live request 418bcc643df14f6f8cfd3b6b16eb3aef. Full pinned Conjecture63 remains unresolved. Final source-bound validation.json determines which generated modules are validated; filenames and tool success messages alone do not establish mathematical results.

## First correction source region

For numerator-three sources, write b=3q+1 in the true residue class and b=3q+2 in the false class. At j=q+1 and q>=2, put d=q-2,c=8 in the true class and d=q-1,c=4 in the false class. The inherited exact formula is

    A(0)=c,
    A(t+1)=L(d,j,t)+c*choose(d,t+1),
    source coefficient at (t+2,q+1)=A(t).

The source correction is zero once the column exceeds d+2. MarkovCorrectionTailM418 transports the proved universal lower-output LC to every triple starting past that bound. MarkovCorrectionColumnsM418 proves exact polynomial formulas for raw columns 2 through 8, uniformly in q>=2 and both residue classes. MarkovCorrectionGapsM418 proves five exact rational gap identities in x=q-2; their Horner coefficients are nonnegative for x>=0. These give every horizontal triple starting at columns 2 through 6 on the first correction row. Integer casts transport back to literal raw coefficients; there is no source normalization.

MarkovCorrectionRegionM418 includes columns 0 and 1 using their actual zeros, and q=1 using the inherited small-row theorem, not a truncated exponent. It proves all first-correction inequalities outside

    7 <= i <= d+2,

and therefore all columns when 1<=q<=5. The right-hand zero tail is universal, not finitely enumerated. A direct path theorem transfers these strips to the actual recursively generated polynomial.

MarkovCorrectionRootM418 proves the exact equivalence

    Conjecture63 <-> FirstCorrectionWindowM418
                   AND ThreeBeyondCorrectionM418 AND OtherFourM9E2.

All three predicates remain open. ThreeBeyondCorrectionM418 retains every unresolved upper/correction horizontal row other than the isolated first correction, every unresolved vertical and constant-i+j inequality, and all inherited exclusions only where their actual proofs are available. OtherFourM9E2 remains completely unchanged. This is not a proof of an entire new source direction.

## Weighted obstruction and changed representation

The earlier augmented polynomial construction remains too strong even after applying the actual binomial weights. With j=7,d=4,c=8 its first three weighted polynomials are

    8,
    1968+32X,
    18150+16104X+48X^2.

Their gap is 3727824-2880X+640X^2. The coefficient at X is negative, whereas evaluation at 1 is positive. MarkovWeightedObstructionM418 proves the polynomial identity and the corresponding actual source witness: the 3/19 path threePathM9E2 5 true, row 7, columns 2,3,4 has coefficients [8,2000,34302], valid polygon membership, and raw gap 3725584. This refutes an auxiliary criterion, not Conjecture63.

Instead define the absorbed kernel

    B(d,j,c,t;X)=liftPoly(j,t;X)+alpha(d,t,c)*X^t,
    alpha(d,t,c)=c*max(d-t,0)/(t+1).

Here max(d-t,0) is natural subtraction before casting. The elementary exact identity choose(d,t)*alpha=c*choose(d,t+1) holds even outside the binomial support. MarkovAbsorbedKernelM418 proves that binomial weighting followed by evaluation at 1 gives exactly A(t+1), proves nonnegative coefficients for c>=0, and identifies the tail with the original lift polynomial. It proves transport from all lower-cut coefficient gaps to raw adjacent-output LC.

MarkovAbsorbedReductionM418 proves cuts above the support and the complete t>=d tail. It isolates AbsorbedMiddleM418: source-related parameters j=d+2,c=4 or j=d+3,c=8, with 4<=t<d and h<=t, all gap coefficients k. This condition remains unproved. It implies FirstCorrectionWindowM418 and all first-correction raw inequalities, including q=1 through the separately proved prefix/small case. A conditional implication into the exact root retains both other residual predicates explicitly; its antecedents are not claimed established.

## Boundary diagnostic and exact bridges

At h=t the cut gap has only three possibly nonzero coefficients after factoring X^(2t). MarkovAbsorbedBoundaryBridgeM418 proves this identity and the conditional reduction to three scalar inequalities. It also proves choose(t+j+3,j)>=j+1. MarkovAbsorbedBoundaryModelM418 identifies those three coefficients with rational expressions using the exact inherited normalized lift values and the added correction.

GAP found that the corresponding rational numerators have nonnegative coefficients after t=4+T, B=j+1+Z, with T,G,Z>=0, separately for d=t+2+G and d=t+1 and both residue classes. The weaker lower bound B>=1 does not give that certificate: the third numerator has negative coefficients. These remain symbolic experiments. The initial expanded-denominator Lean attempt timed out at 180 seconds, and the factored-denominator attempt timed out at 150 seconds. MarkovAbsorbedBoundaryCertificateM418 is unvalidated. MarkovAbsorbedBoundarySourceM418 is a generated source-parameter bridge that was not compiled because its certificate dependency did not build. Neither is included in final validation or used by any selected theorem. The h=t positivity band remains open.

## Experiments

The original recurrence check q=1,...,64 passed 13,545 coefficient comparisons (5,040 zeros), 13,312 first-correction horizontal triples, 8,256 polygon-valid triples, and 3,481 triples in the remaining window. This is finite source evidence only.

The clamped absorbed-kernel probe d=0,...,40 checked 1,394,328 lower-cut gap coefficients and 5,658 exact weighted-output identities without failure. A separate exact polynomial-in-G calculation for d=t+2+G, t=0,...,12 checked 3,458 gap polynomials and 76,804 rational coefficients without a negative coefficient. It excludes the d=t+1 clamp boundary and is not a universal theorem. The pre-composition Q-polynomial shortcut failed: its nonconstant gap coefficients can also be negative, so positivity cannot be inferred before composition.

All experiments, failed candidates, and exact build snapshots are preserved under evidence/markov-418bcc64. They are not external axioms or proofs.

Final local validation: ten selected modules jointly kernel-replayed; 61 theorem closures audited with only the permitted axioms. The separate independent completion audit was not performed.
