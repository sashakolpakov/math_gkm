# Fourth lower diagonal: the four early shifted offsets

Machine-authored live request `96dea62b6a264d13939c64cc19dbe945`.
The exact pinned `MathGKM.Markov.Conjecture63` remains unresolved.
The matching source/build/replay/axiom inventory in
`evidence/markov-96dea62b/validation.json` determines final local validation status.

For an arbitrary actual predecessor path `rest`, write `c=(frame rest).mid.b`
and `r=(frame rest).mid.a`. The source path is
`List.replicate n true ++ false :: rest`, with labels `a=nc+r`, `b=a+c`.

`source_fourth_onsetM96` in `MarkovOnsetSourceM96.lean` proves the literal integer
inequality

    A(i,n+k+2) A(i+2,n+k) <= A(i+1,n+k+1)^2

for **all** `c>=5`, `n>=4`, `1<=k<=4`, and natural `i` satisfying
`i+n+k+2=a+4`. The predecessor numerator is unrestricted beyond the actual
source invariant `1<=r<c`. There is no finite bound on the run or predecessor,
and no coefficient is deleted because it vanishes. The theorem does not need
polygon guards, hence applies in particular when all three points are in the
pinned polygon. The boundary `n=4,k=4` is included.

`source_fourth_prefixM96` combines this with inherited results. Under `c>=5`
and `n>=4`, it covers every starting index `j<=n+4`, and additionally every
`j<=2n` when `r<=3`, on the same fourth lower slice. This is a contiguous prefix,
not the whole slice. `root_iff_coreOnsetM96` keeps the exact pinned root and
removes only these proved regions from its residual predicate. The residual
is not proved.

`lower_slice_polygon_iffM96` also proves the exact arithmetic equivalence
`InPolygon a (a+c) i j ↔ c*j <= d*(a+c)` on `i+j=a+d`, provided
`d+1<=a+c` so that the upper polygon guard is satisfied. No zero/support
claim is involved. Its source specialization `source_fourth_polygon_boundM96`
shows that every fourth-slice triple whose top point lies in the pinned polygon
has `j<=4n+5`. This holds for every actual predecessor and every n, including
small cycles; it is a position bound, not a coefficient inequality. It leaves
a finite number of shift blocks for each n, not a universal finite search bound.

## Exact coefficient bridge and certificate

The inherited `source_fourth_early_shapeM042` identifies `7560*A(i,n+k)` with

    fourthShapeK0B c (nc+r) (n+k)
      + 315 * convSevenK0B (shiftPolyCC (C n) (C c) (C r) X) k.

For `k=1,...,6`, the new six `onset_value` identities evaluate this **truncated**
convolution exactly. Terms of degree greater than k contribute zero. This
avoids the unproved/incorrect small-index substitution of a falling-factorial
formula valid only from k=5. The same positive integer 7560 multiplies every
coefficient in the triple; cancelling its square changes no coefficient weights.

For each k=1,...,4, the gap is certified on four charts:

* `n=N+4`, `r=R+4`, `c=R+C+5`;
* `n=N+4`, `r=3`, `c=C+5`;
* `n=N+4`, `r=2`, `c=C+5`;
* `n=N+4`, `r=1`, `c=C+5`.

Here N,C,R are nonnegative integers. These charts exhaust `n>=4,c>=5,1<=r<c`.
The three fixed-r gaps use direct positive polynomial certificates. The general
chart is decomposed first into coefficients in C,R, then assembled by columns
in C. Each scalar gap is an exact univariate polynomial identity with
nonnegative coefficients. Ordinary Lean `ring` and `positivity` check the
identities and inequalities; Python generation supplies no premise or axiom.
The failed direct and one-stage assembly attempts are retained and excluded.

## Validation and experiments

Workers 93 and 94 were reconciled by matching 481 inherited artifact hashes and
inspecting their final raw events. Their finalizers completed before the outer
timeouts. This invocation separately kernel-replayed all 18 algebra modules
that worker 94 had compiled but not finished replaying. No prior write was
blindly repeated.

Exact finite tests passed 4,896 onset coefficients, 3,264 polygon-valid triples,
and 8,251 literal recurrence coefficient comparisons. The input list is retained
in `experiments.json`. These counts are operational/experimental evidence, not
a universal theorem or proof-admission objective.

The exploratory `second-shift-probe.json` compares saved symbolic numerator
candidates. Z-degree zero and one are identical across the six slope chambers.
Z-degree two changes across r/c=1/2, first at X-degree 3; higher Z-degrees have
further chamber changes. Thus a universal continuation of the chamber-independent
first-shift shape would omit actual candidate corrections. This comparison is
an experiment, not a newly proved source formula or log-concavity result.

All local proof checking reuses inherited compiled imports and pinned Mathlib.
No fresh whole-source rebuild, independent completion audit, or root closure
is claimed. Higher shifted positions, small predecessor cycles, higher slices,
and horizontal/vertical interiors remain.

## Final local validation

All 60 accepted mathematical modules compiled and passed separate kernel replay. All 261 inventoried theorem closures use only propext, Classical.choice and Quot.sound. The 18 inherited replays left incomplete by worker 94 also passed. Five rejected build attempts (four timeouts and one rewrite error) and eight excluded alternate/draft modules are retained. All 490 baseline input hashes are unchanged. These checks reuse inherited compiled imports; they are not a fresh whole-source rebuild or independent completion audit. All foreground executions returned. Completion remains null.
