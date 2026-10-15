# Mathematical research, request 8b851864

Machine-authored live experimental research. The exact pinned Conjecture63 and its negation remain unproved. The source-bound validation inventory, not the presence of a candidate file, determines accepted results.

Write c=(frame rest).mid.b, r=(frame rest).mid.a, and path=replicate n true ++ false::rest. The fourth lower slice has total squared-variable degree (frame path).mid.a+4.

## General central interval

`source_fourth_middleM8B8` in `MarkovMiddleSourceM8B8.lean` proves the literal integer coefficient inequality for every actual predecessor with c>=5 and every 2n+6<=j<=3n, subject to the slice equality. There is no restriction to predecessor numerator 1, 2, or c-1. The interval itself implies n>=6.

Set J=j-2n-6 and E=3n-j. Then J,E>=0 and n=J+E+6. If 2r<c and r>=2, set C=c-2r-1 and R=r-2. If 2r>c and c-r>=2, set C=c-r-2 and R=2r-c-1. Both charts express the scalar gap as a polynomial with nonnegative integer coefficients in C,R,J,E. The checked coefficient identities assemble in two stages. The cases r=1 and r=c-1 use inherited checked boundary charts. Coprimality and c>=5 exclude 2r=c. The canonical source bridge identifies the three scalar values with 120960 times the three raw coefficients; a common positive scale is canceled.

`run_fourth_allM8B8` combines this central inequality with inherited prefix/onset/final results and proves the whole fourth lower slice for n>=7,c>=5. All original polygon guards are retained. `root_iff_coreM8B8` is an exact equivalence to an unproved residual.

## Strengthened onset and run six

`secondOnset_lcM8B8` proves all five scalar onset inequalities for n>=3,c>=5, 1<=r<c and 2r!=c. The inherited gap coefficients, originally written using N=n-7, are shown nonnegative for N>=-4 by exact positive expansions in N+4. No numerical approximation is used.

`source_fourth_onsetM8B8` transfers all five starts 2n+1 through 2n+5 for n>=4. The stronger `source_fourth_onset_windowM8B8` additionally covers n>=3 provided n+5<=j<=3n+1. Thus at n=3 it proves the starts j=8,9,10. The new coefficient adapter explicitly states the window n+5<=2n+k<=3n+3. The excluded n=3 endpoints do not satisfy that formula in the exact experiment; these are failures of an extrapolated formula, not counterexamples to the conjecture.

`run_fourth_iff_shortM8B8` reduces the whole fourth slice for n>=4,c>=5 exactly to starts satisfying 2n+6<=j, 3n<j<=3n+6. For n=4,5,6 these are respectively 14..18, 16..21, and 19..24.

`run_fourth_ge_sixM8B8` in `MarkovFourthSixCompleteM8B8.lean` completes n>=6. The six starts at n=6 are proved by 36 exact polynomial gap certificates over the six predecessor chambers. Their source adapters identify the scalar values with 7560 times the raw coefficients. The coefficient adapters actually hold for all n>=5. No positivity of a raw coefficient is needed for cancellation.

## Final short-run candidates

The fixed n=4 and n=5 gap polynomials also have nonnegative coefficients, even though translating the entire n>=7 family to some smaller continuous parameter thresholds produces negative expansion coefficients. New candidates check these fixed-run identities directly. For n=4 only starts 3n+2 through 3n+6 are needed, since 3n+1 is already in the proved onset interval. Its seven required coefficient adapters were strengthened to n>=4. Acceptance of the full `run_fourth_ge_fourM8B8` assembly is recorded in the final validation inventory and final checkpoint; do not infer it from the candidate generation alone.

## Experiments and limits

The central, small-onset, and run-six exact experiments are recorded separately in evidence/markov-8b851864. They test raw coefficients, preserve zeros, check the original polygon predicates, and compare selected coefficients against the literal recurrence. They are finite computations, not proofs. Symbolic threshold probes are also experiments until their identities and nonnegativity are checked in Lean.

Small predecessor denominators, smaller runs as applicable, higher slices, and horizontal/vertical interiors remain unresolved. No fresh whole-source rebuild or independent completion audit occurred; inherited compiled dependencies were reused.
