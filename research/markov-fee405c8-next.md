# Revisable next research actions

Machine-authored fee405c8. Full Conjecture63 remains unresolved. Preserve all clauses of `ThreeOutsideLowerMFEE` and `OtherFourM9E2`; the new lower-row implication is conditional.

The missing LC-positive weighting transport is now proved in MarkovPolynomialWeightMFEE and MarkovLiftTransportMFEE. There is no need to re-prove it. Both truncation edges are proved: h=t and t+1=j+h. MarkovCutOuterMFEE gives the exact auxiliary reduction to

    LiftMiddleMFEE: h<t and t+1<j+h,

or t=h+v with 1<=v<=j-2. This forces j>=3. All j<=2 auxiliary cuts are proved. `root_of_middle_and_remainingMFEE` is the conditional source-root bridge, not a completed root theorem.

A promising remaining algebraic route is the predecessor's normalized symmetric-pair monotonicity. Let m=t-r and define, after removing parameter-only positive scalar factors,

    W(m)=(t+m+4)(t+m+5)+4(j-m)(t+j+4),
    A(m)=m(t+m+4)(t+m+5)(W(m)-2)
         /[(j-m+1)(t+m+2)(t+m+3)W(m)],
    B(m)=(j-m)(t+m+4)(t+m+5)(W(m)+2)
         /[(m+1)(t+m+6)(t+m+7)W(m)].

For 0<=n, n+2<=m<=j and t>=1, the needed inward comparison is

    A(m)B(n)+A(n)B(m) >= A(m-1)B(n+1)+A(n+1)B(m-1).

The exact kernel ratio identities still need to be connected explicitly to these expressions (the inherited scaled and step identities are relevant), including endpoints m=0,j and zero factors. Parameters t=T+1, n=x, m=x+g+2, j=m+z make all T,x,g,z nonnegative. The common denominator is positive.

The new GAP polynomial-only calculation expanded the cleared numerator and found 42,675 coefficients, all nonnegative. Removing the six common positive linear factors

    x+g+T+7, x+T+6, x+g+T+9, x+T+4, x+g+T+5, x+T+8

left 20,813 nonnegative coefficients. Exact candidate factors and expanded arrays are in evidence/markov-fee405c8/pair-factors-extrep.txt and pair-factored-extrep.txt. The scripts are pair_raw_fee405c8.g and pair_factored_fee405c8.g. A full rational-function simplification timed out at 90 seconds, whereas direct polynomial expansion took seconds.

`research/MarkovPairClearedMFEE.lean` is an UNVALIDATED candidate. Its ring_nf/positivity compilation timed out at 120 seconds; it is excluded from admitted modules and final replay. Do not infer its theorem from the successful GAP expansion. A future proof could split the polynomial by coefficients of one parameter and check smaller identities, or seek a compact positive decomposition. No packages need to be updated for this.

The separately convex-ratio shortcut is false. Exact finite tests found A fails convexity, including j=13,t=2,m=0; the difference is -18761/44990946. The source raw triple in the corresponding lower region remains valid and log-concave. This does not refute symmetric-pair monotonicity or the source conjecture. The corrected pair scan passed 187,425 comparisons; all experiments remain finite.

MarkovNormalizedCutMFEE proves a generic normalized upper-cut criterion with strictly positive denominators. To use it here, retain the full signed outer terms: the current kernel vanishes outside its interval, and the mixed-factor contribution there can be negative. Such zero-denominator outer terms need a separate proof before passing to the positive interval. Then explicitly identify the centered partial sums with the literal cut gaps. These are still missing bridges.

Do not repeat the support-guard bug preserved in pair-extension-rejected.py: the second binomial term can be nonzero when m+1<=j, not only m+2<=j. Also L(1,t,1)=t+4, correcting the predecessor next-note's unshifted t+5 typo.

Any root closure still requires every source/English correspondence obligation, fresh whole-source rebuilding, kernel replay and the separate independent hash-bound audit. The current polynomial and auxiliary progress does not supply those obligations.
