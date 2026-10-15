# Fourth-slice onset and the central coefficient representation

Machine-authored live request `722898f8801743d7b87c8028ab0979f7`.
The pinned Conjecture 6.3 remains unresolved. Successful source-bound build,
replay and axiom receipts determine accepted statements; generated files alone
are not mathematical results.

For an actual predecessor `rest`, write c=(frame rest).mid.b and
r=(frame rest).mid.a. The run path is `List.replicate n true ++ false :: rest`.
Let a be its actual middle numerator label. All new inequalities concern the
fourth lower slice i+j=a+4, direction (1,-1), with raw integer coefficients.

## Completed onset assembly

`source_fourth_onsetM722` covers the six starts j=3n+k, 1<=k<=6, for
n>=7 and c>=5, with unrestricted actual predecessor numerator. The six
Farey chambers cover every such reduced predecessor: equalities at the five
interior chamber boundaries are excluded by coprimality. The thirty inherited
polynomial certificates are used through exact source coefficient adapters.
The last ten previously missing certificate replays were completed here.

`source_fourth_after_middleM722` combines this with the inherited tail and
proves the raw inequality at every 3n<j<=4n+5. It needs no polygon guard,
but does require i+j+2=a+4. `run_fourth_iff_middleM722` consequently reduces
the polygon-guarded fourth-slice claim exactly to 2n<j<=3n, for n>=7,c>=5.
`root_iff_coreM722` retains all other root obligations in an exact equivalence.
Its residual proposition is not proved.

## Two central shapes

The six inherited exact coefficient formulas `middleValue[ch]M00` all reduce
to one polynomial below slope 1/2 and a second above it. The six identities
`middle_shape[ch]M722` have been compiled and replayed. Named predecessor
monomial blocks make the definitions manageable for elaboration without
changing any coefficient. Two earlier large-definition attempts timed out;
their exact source snapshots and receipts are retained.

The combined canonical source adapter states

    120960 * coeff P i j = middleRawValueM722 n c r j

for every actual c>=5, 2n+6<=j<=3n+3 and i+j=a+4. The function selects
the first shape when 2r<c, and the second otherwise. Its acceptance status
must be read from validation.json. The natural-index bounds are used before
any subtraction-to-integer conversion. All coefficient positions are retained.

For log-concavity in 2n+6<=j<=3n, introduce J=j-2n-6 and E=3n-j.
Then J,E>=0 and n=J+E+6. Four nonnegative predecessor charts cover the
strict low/high cases:

| Case | c | r |
| --- | --- | --- |
| low, r>=2 | 2R+C+5 | R+2 |
| low, r=1 | C+5 | 1 |
| high, c-r>=2 | 2C+R+5 | C+R+3 |
| high, c-r=1 | R+5 | R+4 |

The generated gap certificates split by powers of C and R. Each remaining
coefficient is a polynomial in J,E with nonnegative integer coefficients.
Every coefficient identity, including zero columns through total degree 8
in C,R, must be checked by Lean; Python generation is not a proof.

Within this worker's time bound, the two extreme-predecessor charts were
prioritized. General-chart candidates remain available but their queued
inequality builds were deliberately skipped. No unrestricted central-interval
inequality or five-position reduction is claimed merely from those files.

## Experiments and unresolved scope

The finite exact experiment tested 342 triples (n,c,r), with c from 5 through
19, reduced r, and n in {7,11,23}. It checked 3990 middle coefficient
identities, 2964 polygon-valid adjacent triples and 164 literal recurrence
coefficients; no failures occurred. These are experiments, not universal
proofs. The complete inputs and counts are in evidence/markov-722898f8/experiments.json.

The five starts 2n+1,...,2n+5, general predecessor central inequalities,
small runs, small predecessor cycles, higher slices and axial interiors remain
outside the completed onset result. All seven source-correspondence obligations
and a fresh whole-source rebuild remain required for any full-goal completion.
