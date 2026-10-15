# Independent mathematical monitoring audit: worker 000065

Request: `7d905904dcbe45a89408ca2cea9065c6`.
Project: `/Users/sasha/math_gkm`.
Snapshot: `.control/markov/workers/000065/artifacts`.
Evidence: `evidence/markov-7d905904`.

This audit inspects mathematical statements, source correspondence, and matching
recorded compilation/artifacts. No project files were changed, proposer was
contacted, mathematical advice supplied, checks rerun, or active worker touched.
The completed independent [replay-method audit](markov_worker_000065_replay_method_audit.md)
accepts the explicit-module driver's use of the pinned Lean default per-module
kernel replay for all five new and four named inherited modules. Its findings
are incorporated below; this does not change the official command timeouts,
reuse of imported objects, or outstanding full-root obligations.

## Finding and precise positive scope

All five final mathematical modules have matching successful ordinary Lean
compilation records and accepted alternate-driver kernel replay. Their stated
mathematical scope matches the final prose;
no substantive source/English discrepancy was found. The unconditional positive
advance is an auxiliary refinement on the already solved numerator-one family,
not a new region of full raw Conjecture 6.3.

For the exact word `A^n B`, corresponding to source `1/(n+2)`, every mask of
individual degree `d` has weight `(1+y)^d`. The proof initially allows a general
incoming state `p` and degree parameter with the explicit premise
`p+1=(1+y)^d`; the actual layer specialization discharges that premise at the
source initial state. The exact marked change of variables also changes the
incoming state: `y` becomes `z*(1+y)−1` and `p` becomes `z^d*(p+1)−1`.
It does not silently reuse the old state.

`fibonacci_layer_power7d` therefore identifies an entire degree layer with
its actual mask count times `(1+y)^d`, for all natural word lengths, cut counts,
and degrees. The count is the length of the original filtered mask list, so
equal mask polynomials retain their full multiplicities. The integer coefficient
identity is exactly `count * choose(d,j)` for every natural `j`.

`source_one_adjacent_layers_lc7d` quantifies over every actual source path
whose middle numerator is one, every natural `s,d,j`, and **integer** weights
`u,v≥0`. It proves coefficient log-concavity for

`u * layer(s,d) + v * layer(s,d+1)`.

The source hypothesis is resolved through the inherited complete numerator-one
path classification and `central_left7d`. No extra word-shape hypothesis remains.
Zero layers, too many cuts, zero weights, and coefficient tails are covered by
the unrestricted natural indices and counts. The theorem is for two adjacent
degree layers; arbitrary longer intervals and arbitrary real weights are not
its formal statement. Fixed cut count corresponds to the raw constant-total
direction. This theorem does not supply horizontal or vertical cross-cut
inequalities, or cover general rational sources. Root endpoint clauses are
untouched.

## Conditional diagonal tail theorem

`markedCoeff7d w s j` is the ordinary polynomial in `z` formed by summing each
original mask's `y^j` coefficient times `z` to its individual mask degree.
`markedCoeff_layer7d` identifies its ordinary coefficients with exact degree
layer coefficients. Evaluation at one recovers the full raw source coefficient
under `i+j=a+s`, with a proved cast/map bridge and no normalization.

Let `Q=M_(j+1)^2−M_j*M_(j+2)`. `CoeffTailNonneg7d Q` requires every suffix
sum of coefficients from index `r` through `Q.natDegree` to be nonnegative,
including `r=0` and the empty suffix `r=natDegree+1`. The zero polynomial is
included. The finite Abel theorem gives `Q(z)≥0` for every real `z≥1` under
this condition; signed coefficients are retained.

`source_diagonal_of_tail7d` assumes exactly `i+j+2=a+s` and this tail
condition, and concludes the literal integer raw inequality at
`(i,j+2),(i+1,j+1),(i+2,j)`. The middle and both endpoint source identifications
are discharged from the single index equality. No polygon premise is needed
for this conditional statement, and no coefficient support is filtered.

The general-source tail condition remains unproved. In particular, its `r=0`
case is already `Q(1)≥0`, which is exactly the desired raw inequality after
the bridge. Thus the conditional raw conclusion is not an independently
discharged reduction of the open problem. The additional Abel content is the
stronger conclusion for every `z≥1` when all suffix inequalities hold.
The report correctly leaves that source-wide hypothesis open.

For fixed cut count `s`, aligned signed grade `e=d−s` shifts every degree of
the gap by `−2s`; it does not truncate negative grades. This explains the
stated correspondence with the finite signed-grade experiments. No such
uniform fixed-cut interpretation is imposed on horizontal/vertical gaps.

## Source-connected auxiliary obstructions

`source_slanted_count_gap7d` applies to all natural `n≥3` on the exact path
`R^n L`, with labels `(2n+1)/(2n+3)` from the inherited source theorem.
It compares cut/aligned-grade pairs

`(n−1,n−2), (n,n−1), (n+1,n)`,

whose individual degrees are `2n−3,2n−1,2n+1`. The respective constant
coefficients are `n−1,n,n+2`, derived from the inherited exact aligned-count
identities. The resulting gap is exactly `2−n<0`. All natural-subtraction
premises are discharged by `n≥3`. These are differing grades and cut counts,
not a common aligned interval or a full raw coefficient triple.

`source_slanted_raw7d` separately proves that `(3n,0),(3n+1,0),(3n+2,0)`
are all in the actual source polygon and satisfy raw LC, using the inherited
boundary theorem. These are exactly the raw positions corresponding to those
cuts. The actual labels and polygon guards are proved, not assumed. At `n=3`
the stated raw values `[28,56,70]` and gap 1176 are saved literal-recurrence
experiment values; the new universal Lean theorem proves their raw inequality
and guards, not those three numerical identities explicitly.

For source 2/7, path `[false,false,true]`, the new formal marked identity is

`1 + 3*z*(1+y) + z^2*(11+25*y+14*y^2)`

at cut count two. Its `y^0,y^1,y^2` gap is exactly
`z^2*(−5+108*z+471*z^2)`. At `z=1/100` it is formally proved equal to
`−38729/100000000`; the same gap is formally nonnegative for every `z≥1`.
At `z=1`, the new identity returns the ordinary cut polynomial. The inherited
`full27_raw07a7` supplies the actual polygon points `(4,0),(3,1),(2,2)`,
their raw coefficients `[15,28,14]`, and gap 574. The fixed source and previous
degree-coordinate obstruction are inherited; the new assertion is the exact
deformation behavior. It excludes unrestricted positive geometric grading
weights, not the raw conjecture or the condition restricted to `z≥1`.

## Compilation, artifact binding, and accepted replay scope

All five final sources match successful compilation records, archived copies,
host after-hashes, artifact hashes, successful build snapshots, and compiled
objects. The two successful custom replay receipts bind the same five source
and object hashes. Thirty-three selected artifact bindings match. Fifteen
printed theorem dependency closures use only `propext`, `Quot.sound`, and,
where required, `Classical.choice`; several elementary grading identities use
only `propext`. No final mathematical source admission was found.

| Module | Final source SHA-256 | Ordinary compilation |
|---|---|---|
| MarkovFibonacciGrading7d90 | `680251811e64d9320b9c46688f0539a310439afc02108bec07a540bb95eac3cd` | passed |
| MarkovFibonacciLayers7d90 | `1ebd71415f745ac0237b552ccbf1060184d4d4ba9c7f36f701924d3e3483b811` | passed |
| MarkovGradingObstruction7d90 | `d519c60d6211b8a62e5464f0e27d7ec282039b1729e92eb8f3a86a1b47e6e747` | passed |
| MarkovDegreeTail7d90 | `4d56daa5fa58fc371dbb3915804db7add862e804e0d034b356e112aa7ad9ffa2` | passed |
| MarkovAlignedSlope7d90 | `b9db1339e4b2bfb14e063b257ae7da04eef453987e734601b4f6c713ebd8e599` | passed |

The explicit-module receipts are `known-replay-1792023062604884000.json`
and `known-replay-1792023229585059000.json`; both return zero and report
each selected new module passed. They name driver `ReplayKnown6d2c.lean`,
SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
The latter receipt also names four inherited modules. This mathematical audit
checks the new source/receipt correspondence; the completed independent method
audit additionally verifies all nine targets against matching successful builds,
objects, controller archives and receipts, and exact child process outcomes.

The independent reviewer compared the driver body with pinned Lean 4.32.2's
`LeanChecker.replayFromImports`, finding them identical after comments and
whitespace normalization. It invokes the same `Environment.replay` and checked
`Kernel.Environment.addDeclCore 0` operation on each target's constant map.
Accepted wording is therefore **alternate-driver kernel replay of five new and
four inherited modules**, covering 22 new and 30 inherited named theorems as
part of the complete module replay. It is not an official CLI success or a
fresh replay of all transitive imports. Standard replay's unsafe/partial and
axiom handling is separately documented in the method audit; the reviewed
mathematical sources contain no such unsafe/partial declarations or extra
axioms, and the accepted axiom evidence remains standard only.

The method audit also records that the Python wrapper does not propagate a
child failure to its outer shell status. That limitation does not cause a false
pass here: both saved child return codes are genuinely zero, and matching
source/object hashes and complete target pass output were independently checked.
The assurance rests on those records and the inspected checking operation,
not on an outer shell exit code or the driver's success messages alone.

The ordinary run records include six successful compilations (five final plus
an earlier success), five rejected builds, two build timeouts, and two official
`leanchecker` timeouts. No official replay success is recorded for these five
new modules. Those timeouts remain timeouts; custom-driver successes are a
different recorded check. The last custom receipt ended at
2026-10-15 00:14:49.170644 UTC, before normal host completion at
00:15:49.199472 UTC. The completed snapshot and current records match.

Host status is `completed`, return code zero, 1133.00 seconds, mathematical
resolution false. Root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`;
canonical contract hash remains
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
Inherited compiled dependencies are reused. Neither this audit nor the worker
performed a fresh whole-source rebuild or a full-root completion audit.

## Unformalized derivation and finite evidence

The separate Fibonacci interval document explicitly leaves its complete count
formula and factorial/convolution transport unformalized. Its special cases
are stated: for word length `N=n+1` and `s<N`, the count is
`choose(N−s−1,s−d)*choose(s+1,d)` on `0≤d≤s`; `s=N` has the single
degree `N+1`, and `s>N` has no masks. The support and ratio arguments are
restricted to positive support, so no division by zero is asserted. This
paper derivation must not be counted as a new Lean all-interval theorem.

Saved finite evidence, inspected without rerunning:

- 32,766 masks for lengths 1 through 14; 789,820 coefficient comparisons
  through length 40; 13,032,096 interval inequalities with no failure. These
  validate finite instances, not the universal unformalized count/interval
  argument.
- 11,529,188 full diagonal suffix checks on 440 listed source inputs, no
  failure. The scan stopped near its 110-second limit and does not establish
  exhaustive coverage through denominator 40. Other directional/orientation
  checks stop upon their own first failure.
- 2,896,302 interval suffix sums across 335,288 degree intervals, on the
  178 reduced-rational inputs with denominators 3 through 24, cut count at
  most six, restricted to polygon-valid triples. No failure is saved. The
  formal source tail theorem concerns the complete marked sum; there is no
  separately packaged interval-source theorem in this worker.
- Coefficientwise graded-gap failures in all three directions and the
  prefix/suffix horizontal/vertical failures are experimental diagnostics.
  Negative signed grades are preserved by the scripts.
- Literal numerator recurrence checks reproduce the 2/7 raw triple and the
  slanted family's raw triples for `n=3..15`; these finite computations do
  not establish universal statements.

General-source suffix positivity, arbitrary interval aggregation, and the
remaining raw inequalities are still open. Neither Conjecture 6.3 nor its
negation is proved, and completion is correctly null.
