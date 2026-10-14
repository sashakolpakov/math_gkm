# Independent monitoring audit: worker 000026

Request: `061840e8bcb9466891906a9db3f46cc3`.

Read-only review of the retained snapshot at
`/Users/sasha/math_gkm/.control/markov/workers/000026/artifacts`, six final
Lean modules, their mathematical/correspondence/checkpoint notes, validation
manifest, recorded builds and kernel replays, host receipt, and archived event
tail. No project files were changed, no proposer was contacted, and the active
next worker was not disturbed. No fresh Lean rebuild was performed.

## Conclusion

The worker completed a genuine universal subfamily result: every source
polynomial indexed by `a/(a+1)`, `a≥1`, satisfies every polygon-guarded adjacent
raw log-concavity inequality in direction `(1,-1)`. This includes unbounded
degree, denominator, and diagonal depth; it is not another fixed number of
upper diagonals. The exact source identity and the conditions of the raw
transfer theorem are discharged. No substantive English/Lean mismatch was found.

The host outcome is `timeout` after 1200.53 seconds, with no returned final
report. Nevertheless, all six retained final modules have matching successful
compilation and kernel-replay records. In particular, the final raw inequality
module finished its replay before that timeout. It is incorrect to classify
the mathematics as merely compiled or unfinished because of the host outcome.

Only one direction of this subfamily is covered by the new result. It proves
neither the remaining two directions for that whole family nor any such
universal statement for all rational sources. The pinned conjecture remains
unresolved and completion is null.

## Coefficient formula and exact source bridge

`matchPair0618 u v n` is defined by the positive recurrence

```
E_0 = P_0 = 1
P_(n+1) = E_n + u P_n
E_(n+1) = P_(n+1) + v E_n.
```

For every natural `n,i,j`, `match_coeff0618` proves

```
[u^i v^j] E_n = choose(n-j,i) * choose(n-i,j)
[u^i v^j] P_n = choose(n-j,i) * choose(n-i-1,j).
```

Subtractions are natural subtraction, as explicitly stated in the English
report. The theorem includes `n=0`, out-of-range exponents, and zero
coefficients. It is proved from the recurrence; the alternating-path matching
interpretation is explanatory and is not used as an unproved external premise.

`match_diagonal0618` proves for all natural `n,i,j` that

```
P_n[i,j+2] * P_n[i+2,j] ≤ P_n[i+1,j+1]^2.
```

The interior binomial-product inequalities and the zero boundary cases are
both present. It does not claim horizontal or vertical log-concavity of the
raw source numerator.

`shear0618` sends the original monomial `u^i v^j` to `t^(i+j) x^i`.
`shear_coeff0618` proves literal coefficient transport, without factorial,
binomial, or other numerical rescaling. The variables change roles in the
nested polynomial representation, but the English exponent map is correct.

`source_quotient_central0618` identifies the pinned source quotient with the
actual central source word for every path. `central_right0618` identifies the
central word on a repeated-right path, and `right_quotient0618` proves that
the quotient for `replicate n true` is exactly the sheared `P_(n+1)`.
Consequently `right_quotient_coeff0618` is an unconditional actual-source
coefficient identity, rather than an assumed formula for a candidate family.

## Raw diagonal scope and boundary conditions

`right_residual_lc0618` proves adjacent log-concavity of every quotient slice
for every natural `n,r,i`. When the tested coefficient index exceeds the
slice's degree bound, the proof uses the established exact zero statement.
Thus there is no omitted support condition, positivity restriction, or finite
range of slices hidden in this intermediate theorem.

The repeated-right source has labels `a=n+1`, `b=n+2`, degree `2n+2=2a`.
For any polygon point, the literal lower polygon inequality forces its total
degree to be at least `a`; the upper inequality bounds it by `2a`. The final
proof discharges the upper-half condition of the inherited factorization and
the exact diagonal-index relation. It invokes the established natural-adjacent
to CrossLC and binomial smoothing bridge, whose interval-support premise had
already been proved. No lower-half inverse-smoothing argument is asserted.

The exact final theorem is `source_near_one_diagonal0618`: for every source
path satisfying `b=a+1` and every natural `i,j`, if all three points

```
(i,j+2), (i+1,j+1), (i+2,j)
```

belong to the unchanged `InPolygon a b`, then

```
A[i,j+2] * A[i+2,j] ≤ A[i+1,j+1]^2.
```

`source_near_one_path650`, inspected in its inherited source, proves that the
path condition really identifies precisely a repeated-right path; it is not
an extra classification hypothesis. The case `n=0` (source 1/2) is included.
There is no lower bound on `a` beyond actual source positivity and no upper
bound on degree or denominator.

The displayed final theorem has the exact polygon guards of this direction
of the pinned target. It is not itself an unguarded `GlobalLC18` theorem or
an assertion of all three directions. The existing outside-zero and support
results remain unchanged, and the intermediate matching/residual theorems
explicitly retain zero cases. Endpoint clauses 0/1 and 1/1 are not replaced
by the partial-family result. Two unused polygon-hypothesis warnings in the
raw transfer proof are harmless: the other endpoint's polygon bounds already
supply the transfer's total-degree constraints.

## Strategy obstructions

`site_source0618` proves that the site-weight model with every weight equal
to one reproduces the actual source polynomial. `siteBad_core_source0618`
identifies the three-letter A core with the actual 1/4 source core.

The counterexample instead uses site weights `2,1,2`. Lean proves exact raw
vertical coefficients `4,4,5` at `(1,0),(1,1),(1,2)` and the resulting failure
of `GlobalLC18`. The positive symmetric weights change the polynomial; the
uniform weights remain the actual source. Therefore this is a checked
obstruction to a stronger weighted-class assertion, not a source counterexample.

The arbitrary gas-core scan, refined sitewise pair-count tests, weighted finite
scan, and 54,858 numerical checks of the coefficient formula remain finite
experiments. They are not universal premises in the accepted proof. The
worker makes no historical novelty claim; this monitoring audit does not
establish novelty or independently review its additional literature discussion.

## Verification and interruption reconciliation

Every archived final source hash matches its manifest, host change receipt,
and current source. Each listed successful build and kernel receipt binds
that final source hash and itself matches the host's archived receipt hash.

| Module | Final source SHA256 |
| --- | --- |
| MarkovPellMatching0618 | `0758cc1a03890ff3b996e55a5ac7a15258387ffb9a8a2026921d779c2fd87415` |
| MarkovPellShear0618 | `60cb82f2d51c4e289a41a8e1b727ddfa45deba49e1e81937858d8bd48ef4ccea` |
| MarkovPellDiagonal0618 | `14dafe96434731705c5e4b845c4389a27da653f2d32a80c3e8541ea4b791ffbf` |
| MarkovPellSource0618 | `1831e57d6497ed5464b285d2559f8dffaf8bc1c03a9c3fd0d3c1a7abcf27bbd5` |
| MarkovPellRawLC0618 | `5e5f7f144a3210160f47973b3834130ea0bb45a2c1346c996462dae6da16aef7` |
| MarkovSiteObstruction0618 | `0719bb2de0b88e638928763b3af0b196d06635449f85a2e9fd0ff3502fda4793` |

All six final builds and all six listed Lean 4.32.2 `leanchecker` runs returned
zero. The 12 printed declaration closures in the successful build outputs
contain only `propext`, `Classical.choice`, and `Quot.sound`, and exactly match
the manifest's axiom-output fields. All nine distinct recorded project-local
direct-import binary hashes match. This uses inherited compiled dependencies,
not a fresh full-source dependency rebuild.

The decisive final replay is
`evidence/markov-061840e8/run-1791958455525342000.json`, which binds the final
`MarkovPellRawLC0618` hash above and records a 37.7466-second successful
`leanchecker MarkovPellRawLC0618` run. Its timestamp plus recorded duration
places completion at approximately 06:14:53.272 UTC on 14 October 2026.
The host timeout occurred at 06:15:11.899 UTC.

The archived event tail independently records the final replay command
completing with code zero, followed by the finalization command completing
with code zero and reporting all six modules as compiled and kernel-replayed.
The archived manifest already includes this last replay; there is no stale
compiled-only status to upgrade by inference. A durable local report and final
checkpoint exist even though the controller's returned-report field is null.

Seven earlier failed elaborations remain rejected: one Matching, two Shear,
two Source, one SiteObstruction, and one RawLC attempt. Their files and failed
receipts are retained and correctly listed as rejected; none is substituted
for the final successful evidence.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The source-family directional theorem is accepted at the recorded verification
scope; full conjecture completion is not established.
