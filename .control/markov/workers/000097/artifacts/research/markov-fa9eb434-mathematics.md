# Full natural-count fourth numerator expansion

Machine-authored live research request `fa9eb434c31049be8cbf0c087d85105d`.
The exact pinned `MathGKM.Markov.Conjecture63` remains unresolved.

The accepted source-bound inventory is `evidence/markov-fa9eb434/validation.json`.
Only modules in that inventory are accepted local results. Failed drafts are
retained with their attempt sources and diagnostics; their presence is not proof.

## Mathematical result

For an actual predecessor path `rest`, set `c=(frame rest).mid.b` and
`r=(frame rest).mid.a`. For every natural run length `n`, the source is
`replicate n true ++ false :: rest`. Its indices satisfy `a=nc+r`, `b=a+c`.
The fourth lower slice has `i+j=a+4`.

`fourthNumerator_fullFA` proves an exact identity in every commutative ring
between the inherited normalized numerator `fourthNumeratorBC` and the new
explicit degree-four polynomial `fullNumeratorFA` in the shift variable Z.
It retains the actual natural pattern counts

    q = 2r-c,  t = min(c-r,3r-c),  u = 3r-2c,

where all displayed subtractions in these counts are natural subtractions.
No chamber assumption or replacement of a truncated count by a signed
expression enters that theorem.

Writing H0,...,H4 for the explicit polynomials in `MarkovFullCoeff*FA`, the
new formula is

    H0 + Z H1 + Z² H2 + Z³ H3 + Z⁴ (H4 + 96(1-x)^8 K),

where the exact piecewise natural-count correction K is

* `min(c-2r,4r-c) x^5` when `2r<=c`;
* `2(2r-c) x^6` when `2r>c` and `3r<=2c`;
* `2(c-r) x^6` when `3r>2c` and `4r<=3c`;
* `2(c-r) x^6+(4r-3c)x^7` otherwise.

`source_fourth_full_clearedFA` identifies this expression at `N=n`, `Z=X^n`
with `(1-X)^8` times 24 times the actual source cut polynomial, for every
actual predecessor with `c>=5`. `source_fourth_full_coeffFA` proves the
corresponding finite binomial convolution for each literal raw coefficient:

    24 A(i,j) = sum_{k=0}^j [X^k] fullNumeratorFA(n,X^n,X,c,r)
                                  * choose(7+j-k,7).

The index restriction is exactly `i+j=a+4`. There is no finite bound on n,
c, r, j, or the predecessor path. The scalar 24 is uniform; zeros remain.
This is an explicit coefficient identity, not a log-concavity theorem.

The proof first expands all eight three-letter and sixteen four-letter local
expressions. It then computes their source moments using the inherited exact
pattern-count theorem. The four-letter correction is proved to have only
shift degree four. Expansion is staged by shift degree and then run degree;
ordinary ring proofs check the component identities. Compact final definitions
for H0 and H1 avoid a large elaboration bottleneck. Python-produced polynomial
expressions are theorem inputs and never mathematical axioms.

## Saved chamber candidates and remaining work

`MarkovFullChamber0FA` and `MarkovFullChamber1FA` prove algebraic
specializations of H2,H3,H4 to the first two saved chamber polynomials.
These are ring identities with signed scalar parameters. The natural-count
source adapters in `MarkovFullSourceChamber*FA` did not complete validation;
they are excluded. Chamber modules 2 through 5 timed out and are excluded.
The optional exact inequality transport `MarkovFullCoefficientLCFA` also
timed out and is excluded. Do not import these drafts as accepted results.

The complete six-chamber identification of the saved 1,394–1,420-term
numerators is therefore still unfinished. The new universal natural-count
formula is proved independently of those unfinished specializations. Later
block falling-factorial/binomial evaluations and nonnegative gap certificates
still require proofs. No new log-concavity range was established, and the
inherited `InteriorCore63M806` remains unproved. Small cycles c=2,3,4,
higher diagonals, and the horizontal and vertical interiors remain open.

## Exact finite experiments

`research/experiment_full_fa9eb434.py` evaluated the new natural-count
expression on 726 source/run cases, including n=0,1,2,3 and larger runs.
It passed 726 numerator comparisons with the saved chamber candidates,
29,700 coefficient comparisons with source cuts, 11,335 comparisons with the
literal recurrence, and 25,707 polygon-valid fourth-slice inequalities.
The coefficient checks included 2,541 zeros. Inputs and results are retained
in `evidence/markov-fa9eb434/experiments.json`. These are finite exact
computations, not universal identities or inequalities.

Local compilation, replay, rejected attempts, and axiom closure are recorded
in the validation inventory. Inherited compiled imports and pinned Mathlib
were reused. No fresh whole-source rebuild or independent completion audit
was performed. Tool outcomes are operational evidence, not mathematical results.

## Final local validation

All 49 accepted mathematical modules compiled and passed union kernel replay over the inherited import boundary. All 79 inventoried theorem closures use only permitted axioms. There were 18 timed-out attempts, 4 other failed Lean builds, and 12 deliberately superseded checks. No failed draft is admitted. All 419 recorded preservation checks passed. All foreground executions completed; completion remains null.
