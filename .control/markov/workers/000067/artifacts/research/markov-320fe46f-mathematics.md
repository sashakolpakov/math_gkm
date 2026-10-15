# Increasing one-cut weights on mixed sources

Machine-authored live request 320fe46fcee34a5a829606c8fa65b08e.
The full pinned Conjecture63 remains unresolved. No historical novelty or
independent completion audit is claimed.

## Universal positive result

For every n>=0, every finite Boolean rest, and every nonnegative nondecreasing
real sequence w, take the actual source path R^n L rest. Select its one-cut
masks with their original multiplicities. Multiply each mask polynomial by
w_d, where d is its exact polynomial degree. The resulting polynomial has
log-concave coefficients at every natural index, with zero extension retained.
There is no denominator, path-length, degree or coefficient-index bound.

The precise theorem is source_mask_weighted_all_lc320 in
research/MarkovIncreasingSource320f.lean. weightedOne_masks320 proves the
identity between the recursive weighted evaluation and the literal list of
one-cut masks. Thus these are weights on entire degree layers, and no masks
have been deleted or given artificial multiplicities. Monotonicity suffices;
the weights need not themselves be log-concave.

This covers exactly the paths containing a left step (all mixed source paths,
including the left spine). Pure repeated-right paths are excluded from the
new arbitrary-monotone-weight theorem. It addresses cut count one only.

The key property is stronger than adjacent log-concavity: the coefficients
are concave on indices 0,...,n+1. The curvature at every starting index j<n
is nonpositive. Beyond n+1 the coefficients vanish, which handles all the
remaining LC inequalities without deleting zeros. Nonnegativity and a
square-difference identity convert concavity into LC.

The exact source decomposition is

    H_n + sum_(r in central28 rest) J_(n+bit(r)),

where R_k=1+2y+...+2y^k, P_k=R_k+y^(k+1), and

    H_n=sum_(k<n) w_(k+2)(1+y)P_k+w_(n+1)P_n
          +sum_(k<=n) w_(k+1)(1+y)R_k,
    J_n=sum_(k<n) w_(k+1)(1+y)R_k+w_n R_n.

Every J_n and J_(n+1) has nonpositive curvature on the required common range,
as does H_n. Adding their curvatures is legitimate because curvature is linear.
This argument does not assume that sums of arbitrary LC polynomials are LC.
MarkovWeightedSource320f proves the decomposition from the exact source-word
substitution and also gives the two multiplicities as counts of Boolean letters.
MarkovCurvature320f and MarkovWeightedCurvature320f supply sparse second-difference
identities; MarkovIncreasingOne320f proves their signs from monotonicity.

Taking w_d=z^d gives source_onecut_geometric_lc320 for every real z>=1.
Taking z=1 gives source_onecut_raw_lc320, directly in the pinned integer
coefficient function, for every i,j with i+j+2=a+1. That raw one-cut diagonal
was already known in inherited work; the new content is robustness under all
nonnegative nondecreasing whole-degree weights and the linear concavity proof.

## Interrupted work reconciled

All 72 predecessor artifact hashes and all six inherited-index hashes matched.
The c416 worker ended without turn.completed. Its event log and final receipts
show an 18-second timeout of the raw bridge and an 18-second timeout of the
graded-tail replay. No Raw olean existed. Four earlier modules had both passed.

The inherited Tail module now passed separate replay. A new Raw320f copy was
compiled and replayed after explicit natural-subtraction normalization fixed
two elaboration errors exposed by a longer build. The accepted result proves
for all n>=3 that source (2n+1)/(2n+3) has the polygon-valid raw triple
[20,12,4] at (n+3,n-1),(n+2,n),(n+1,n+1), with gap 64. Prior files were preserved.

## Failed extensions and actual experiments

1. Cross-cut graded suffix positivity fails. At source 1/3, the exact degree
   refinements are 1, 2z(1+y), z^3(1+y)^3 for cut counts 0,1,2. Their horizontal
   and vertical gaps are z^2(4-z) and z^2(4-3z). Thus z=5 and z=2 give gaps -25
   and -8 respectively, even though geometric weights increase and are LC.
   MarkovCrossObstruction320f proves these formulas and the literal polygon
   guards. Degree-minus-cut alignment divides each gap by the common z^2 for
   z>0; it does not change its sign. At z=1 the raw gaps are 3 and 1.
2. Monotonicity without LC is insufficient at higher cuts. The exact finite
   experiment at source 1/42, three cuts, weights [1,1,10] on degrees 1..3
   gives [3228,342,40], gap -12156. These increasing weights are NOT LC.
   Independent literal recurrence gives the raw triple [3120,234,4], gap
   42276, at the same polygon positions (3,1),(2,2),(1,3). This auxiliary
   obstruction was not formalized in Lean and does not refute the root.
3. onecut-formula.json checks 40,456 coefficient identities, 15,448 concavity
   and 15,448 LC inequalities on 1,042 sources. No failure occurred.
4. monotone.json checks 35,055 one-cut and 468,315 higher-cut inequalities on
   758 listed sources with sampled degree intervals. The higher-cut failure
   above was retained. These finite interval tests exceed the proved scope:
   a weight truncated above an interval need not be globally nondecreasing.
5. cross.json retains the initially discovered horizontal and vertical tail
   failures at source 15/56, with signed grades, alongside positive raw gaps.
   minimal-cross.json records the subsequent smaller source 1/3 witness.

All experiments are exact integer computations, not universal proofs.

## Validation and limitations

See evidence/markov-320fe46f/validation.json for current-source build and replay
receipts. Printed axiom closures are checked against propext, Classical.choice,
Quot.sound. Rejected elaborations and timeouts remain operational evidence;
their diagnostic placeholder axioms are not accepted theorems.

The explicit-module replay driver uses the pinned LeanChecker replay body,
which was read and compared during this run. Inherited imports were reused;
this is not a fresh whole-source rebuild or an external kernel implementation.
Sage was unavailable; GAP was present but unused. Policy denies .scratch, so
unique research/evidence paths were used. No controller records were changed.

The published definitions and target were consulted live at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html
(equation (7), Definitions 6.1–6.2, Conjecture 6.3). No external result was
introduced as an axiom. Higher cuts, horizontal/vertical aggregation, and all
remaining root correspondence obligations remain unresolved.
