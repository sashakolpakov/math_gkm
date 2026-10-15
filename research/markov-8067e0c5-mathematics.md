# General first shifted block of the fourth lower slice

Machine-authored live request `8067e0c51ab944db8a1a44fb7403351d`.
The pinned `MathGKM.Markov.Conjecture63` remains unresolved. The source-bound
inventory `evidence/markov-8067e0c5/validation.json` records final local checking.

For an actual predecessor path `rest`, put c=(frame rest).mid.b and
r=(frame rest).mid.a. The run source is `replicate n true ++ false :: rest`,
with a=nc+r and b=a+c. Its fourth lower slice has i+j=a+4.

`source_fourth_blockM806` proves

    A(i,n+k+2) A(i+2,n+k) <= A(i+1,n+k+1)^2

for every actual predecessor with c>=5, every natural n and k with 5<=k<=n,
and every natural i with i+n+k+2=a+4. There is no restriction r<=3 and no finite
bound on n, c, or the predecessor path. Zero coefficients are retained. Polygon
guards are unnecessary for this theorem, so its guarded source instances follow.
The endpoint k=n is included.

`source_fourth_prefixM806` combines this with the inherited initial/onset
theorems. For c>=5 and n>=4 it proves the raw inequality at every starting
index j<=2n on that slice. The n=4 boundary uses the inherited onset theorem.
`root_iff_coreM806` proves the exact equivalence

    Conjecture63 <-> InteriorCore63M806.

The residual retains the original three polygon guards, all remaining slices,
both axial directions, and the uncovered fourth-slice positions. It is not
proved. This equivalence is not root closure.

## Proof construction

The inherited exact source bridge `source_fourth_block_shape_extendedCC` gives

    7560 A(i,n+k) = fourthShapeK0B c (nc+r) (n+k) + shiftShapeCC n c r k

for 5<=k<n+3. It applies to all three coefficients when 5<=k<=n. The multiplier
7560 is the same positive integer at each position; cancelling its square is
not a change of coefficient normalization.

The earlier general chart had timed out when substituting all parameters at
once. Here the predecessor substitution c=R+C+5, r=R+4 is performed first,
leaving the run N and offset K free. `block_stageM806` proves the resulting
quartic expansion in C,R. Its fifteen coefficient polynomials each have 36
terms in N,K. Forty-five scalar identities then substitute N=J+E+5 and
K=J+5, J+6, or J+7, identifying the inherited coefficient polynomials.
The value identities are recombined without expanding their scalar contents.

The gap coefficients in C,R are assembled in two steps. For each C-degree,
the coefficient is a polynomial in R whose coefficients are the inherited
nonnegative scalar gap certificates. Then the nine nonnegative C-columns are
assembled. All identities use ordinary Lean `ring`; inequalities use the
explicit nonnegative coefficients and ordinary order reasoning. Python-generated
expressions are inputs to those proofs, never axioms.

The r>=4 chart uses C=c-r-1, R=r-4, J=k-5, E=n-k, all nonnegative. The inherited
r=3,2,1 charts supply the other cases, so these charts exhaust c>=5, 1<=r<c.
The source adapter obtains 1<=r<c from `frame_reduced` on the actual path.

## Experiments beyond the proved region

These observations are exact Python calculations, not new source theorems.
The saved six-chamber normalized numerators from worker 89 are still candidate
expressions for these calculations; their full chamber-specific identification
with `fourthNumeratorBC` has not been supplied here.

* `second-block-probe.json` has nonnegative gap coefficients on four charts for
  j=2n+k, 6<=k<=n. Its two coefficient shapes distinguish r<c/2 and r>c/2.
* `third-block-probe.json` has nonnegative gap coefficients on six Farey charts
  for j=3n+k, 7<=k<=n. After substitution n=J+E+7, k=J+7, each candidate value
  is independent of J: it depends on E=n-k and the predecessor parameters.
* `tail-probe.json` gives run-independent candidate values at j=4n+k,
  0<=k<=7, for n>=7. All candidate gaps at starting offsets 0<=k<=5 have
  nonnegative chart coefficients, including identically zero gaps. The retained
  coefficients are not filtered according to support.
* `remaining-probe.json` completed all twelve second/third-block onset charts
  and eighteen fixed-run charts for n=4,5,6. Every recorded gap has nonnegative
  coefficients. These certificates remain experiments, not formal proofs.

The strict Farey chambers have endpoints 0,1/4,1/3,1/2,2/3,3/4,1. Each reduced
fraction with c>=5 lies in one such open chamber: all chamber-boundary reduced
denominators are at most four. For adjacent endpoints p/q<s/u, the chart is
c=q(C+1)+u(R+1), r=p(C+1)+s(R+1). The inherited `reduced_chamber_boundary897` and chart inversions in
`MarkovFourthThreeSourceN6604` can supply the arithmetic coverage. They still
need to be connected to newly proved candidate/source identities and gap
certificates before these experiments become source inequalities.

Finite checks retained in the evidence directory:

| Region | Coefficient identities | Polygon-valid triples | Literal recurrence comparisons |
| --- | ---: | ---: | ---: |
| First shifted block | 5,122 | 4,198 | 5,214 |
| Second-block candidate | 2,516 | 2,036 | 2,978 |
| Third-block candidate | 2,334 | 1,854 | 2,639 |

The tail candidate additionally passed 2,160 coefficient comparisons. No
universal conclusion follows from these finite checks. Input lists and code
are retained, including larger selected runs.

## Remaining mathematical work

Small predecessor denominators c=2,3,4 require their own corrections. Later
shift blocks, their transitions, and the full fourth slice are not formally
closed by this invocation. Higher diagonals and horizontal/vertical interiors
remain independent parts of the exact root. Whole-family source correspondence
and the required independent completion audit are not replaced by these results.

All local checking reuses inherited compiled imports and pinned Mathlib. There
is no fresh whole-source rebuild, independent completion audit, or certified
controller switch claim.

## Final local validation

All 65 accepted mathematical modules compiled and passed separate kernel replay. All 96 inventoried theorem closures use only propext, Classical.choice and Quot.sound. Thirty unchanged inherited split gap sources were checked in this invocation. There were no rejected Lean builds or kernel replays. Inherited compiled imports were reused; no fresh whole-source rebuild or independent completion audit occurred. All foreground executions returned. Completion remains null.

The full-fourth finite audit also passed 40,320 candidate coefficient identities (including 1,152 zero values), 37,632 polygon-valid triples and 9,611 literal recurrence comparisons. Its exact input list is in `evidence/markov-8067e0c5/full-fourth-checks.json`. This verifies candidate computations on that finite input set only.
