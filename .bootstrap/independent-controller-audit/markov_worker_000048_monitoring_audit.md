# Independent monitoring audit: worker 000048

Worker request: `58d2f4111d4e480ca66e64acbf12e225`.
Audit date: 2026-10-14. Read-only review of the completed worker's archived
artifacts in `/Users/sasha/math_gkm/.control/markov/workers/000048/artifacts`,
matching current final sources and evidence. No project changes, fresh builds,
experiment reruns, proposer contact, or mathematical guidance were performed.

## Finding

The retained work establishes an unconditional, unbounded partial result for
the actual source family: raw horizontal coefficient log-concavity for every
admissible triple whose rightmost point is on the top face of the Newton
polygon. Its final English description agrees with its Lean statement.
The earlier off-by-one auxiliary relation was corrected before the accepted
final source theorem was compiled and kernel-replayed. No material statement
mismatch or outstanding premise was found in this partial result.

This is not a proof of the full pinned Conjecture63. It does not establish
arbitrary interior horizontal triples or the other two directions.

## Exact mathematical scope

For any finite `path : List Bool`, write `(a,b,P)=(frame path).mid`, with
literal integer raw coefficients `A(i,j)=coeff P i j`. The inherited source
theorems give `0<a<b`, coprimality, and coverage of the intended rational
source family. Put `d=a+b−1`.

`source_top_horizontal_raw58` quantifies over every such path and all natural
`i,j`. Its only premises are

- `InPolygon a b i j`, namely `ab ≤ bi+aj` and `i+j ≤ d`;
- `i+j+2=d`.

It concludes

`A(i,j) A(i+2,j) ≤ A(i+1,j)^2`.

The other two polygon memberships follow mathematically from these premises:
increasing `i` preserves the lower polygon inequality, while the total
degrees are `d−2,d−1,d`. Thus the theorem covers precisely the advertised
top-ending horizontal triples, with no unproved support or source-identity
assumption and no bound on numerator, denominator, or path length.

For `2≤i+j`, `source_top_horizontal_ambient58` proves the stronger statement

`2(b−1) A(i,j) A(i+2,j) ≤ (b−2) A(i+1,j)^2`.

This stronger theorem has only the degree equality and `2≤i+j`; it does not
require polygon membership. Coefficient zeros are retained. The subtraction
in this inequality is integer subtraction after casting the source label,
and the algebraic proof temporarily casts coefficients to the reals. The
target is never replaced by normalized coefficients.

For the final raw theorem in this range, the proof derives `b≥3`, uses the
inherited nonnegativity of actual raw coefficients, and cancels the strictly
positive integer `b−2`. For `i+j<2`, the polygon premise forces `j=0`;
the proof invokes the already checked universal raw boundary inequality.
Consequently no low-degree cases remain conditional or omitted. The separate
`0/1` and `1/1` root endpoint clauses are unchanged inherited clauses; the
new path theorem does not claim to redefine them.

## Source identities and algebra

Let `D=i+j`, `N=b−1`, `B=a−1`, and `F=choose(D,i)`. The final source proof
derives `N+B=D+1`, `B≥0`, and `N≥B+1`. Its three exact identities are

```
(i+1) M = F [N(i+1)+Bj],
(i+1)(i+2) R = (D+1)(D+2) F,
2D(D−1) L = T F,
T = N(N−1)i(i−1) + 2(BN+N−3B−1)ij + B(B−1)j(j−1).
```

Here `L,M,R` are the three actual raw coefficients. The first and third
identities are proved by extracting coefficients from the inherited exact
first- and second-residual upper-slice formulas. The necessary range for the
second slice, `4≤d`, follows from `2≤D` and `d=D+2`; it is discharged in Lean.
The rightmost identity uses the exact top-binomial coefficient theorem.
The zero-retaining binomial lemmas split off `i=0`, `i=1`, and the analogous
small complementary indices, rather than assuming all binomial terms are
nonzero. These are actual source identities, not a substitution of arbitrary
matrix-word data for source polynomials.

The final certificate defines `n=D+1−B` and proves nonnegativity of

```
P = (N−1) D(D−1)(i+2) [N(i+1)+Bj]^2
    − N(i+1)(D+2)(D+1) T.
```

Its hypotheses are `B≥0`, `2B≤D`, and `2≤D`. They follow from the actual
source parameters. The certificate explicitly splits the cases `i≥2`,
`i=1`, and `i=0`, using respectively nonnegative variables `i−2,j`,
`j−1`, and `j−2`, together with `2B` and `D−2B`. The recorded expansions
have 108, 29, and 29 nonzero monomials, respectively. The polynomial
identities use `ring`; their nonnegativity uses ordinary order reasoning.
The Python symbolic expansions are not proof assumptions.

`top_triple_bound58` derives the scaled coefficient gap from the exact
identities. Its multiplier is `D(D−1)(i+1)^2(i+2)`, proved strictly positive
in the stated range. It does not cancel a coefficient or assume a positive
binomial value. The source theorem discharges every algebraic premise.

## Off-by-one history and corrected admission

The early certificate snapshot with hash beginning `17d69e5c83` defines
`n=D+2−B`; the early algebra snapshot with hash beginning `46fd7b2fcc`
assumes `N+B=D+2`. Those auxiliary statements did compile and replay,
but are not the final source result.

The attempted source transfer recorded in
`run-1792003221339204000.json` failed at the false equality
`N+B=D+2`, despite correctly having `i+j+3=a+b`. Its diagnostic axiom
prints contain `sorryAx` after the elaboration error. This rejected record
is not admitted as a proof or confused with the final axiom closure.

The final certificate and algebra use `N+B=D+1`. The final certificate
source is `2410aa399d08514f3d5b71566ac6cf974adacb7f1fb6f2256a23680d6fc1c225`;
the final algebra source is
`c4f3c449e566cb6fee15aa3202858cc84accb34e193edc959311632512a522bf`.
The source-transfer and final horizontal modules were then compiled and
replayed against the corrected artifacts.

Two corrected-certificate compilations overlapped. The earlier one started
at 18:41:11.311 UTC and finished at 18:41:54.538; the final selected one
started at 18:41:46.932 and finished at 18:42:21.179. The later build
therefore finished last. The selected final certificate replay began
at 18:42:41.843 and succeeded. Final object hashes and snapshots agree;
the audit found no stale earlier certificate substituted for the final one.

## Verification records inspected

All five final source SHA-256 values agree among current files, archived
files, the host receipt's `changes.after`, the manifest, and the selected
build/replay source snapshots. All ten selected build/replay records have
return code zero and the expected `lean`/`leanchecker` command and module.
Their JSON files themselves match the host receipt. Final object hashes
match the archived and current objects, manifest, and host receipt.

| Final module | Source SHA-256 | Build record suffix | Replay record suffix |
|---|---|---|---|
| MarkovTopCertificate58d2 | `2410aa399d08514f3d5b71566ac6cf974adacb7f1fb6f2256a23680d6fc1c225` | `1792003306932291000` | `1792003361842831000` |
| MarkovTopBinomial58d2 | `cfa02911abf20d2c1dec84f7afc876fcd5f0e70d338f2dd711754ca1d0989b3d` | `1792003050139177000` | `1792003170194343000` |
| MarkovTopAlgebra58d2 | `c4f3c449e566cb6fee15aa3202858cc84accb34e193edc959311632512a522bf` | `1792003359531510000` | `1792003415923670000` |
| MarkovTopSource58d2 | `69300fbe8459720dba6f312cd88a52fa0ad098e891c7c826a0a8dc4d2610ba87` | `1792003360670573000` | `1792003417116189000` |
| MarkovTopHorizontal58d2 | `4131578da6f1edcd78c4043142f5882563fbc45a7a2ef0326504c66fa2ea8e3f` | `1792003414746292000` | `1792003437693377000` |

Record paths are `evidence/markov-58d2f411/run-<suffix>.json`.
The nine manifest axiom-print lines exactly match final successful build
outputs; each closure is limited to `propext`, `Classical.choice`, and
`Quot.sound`. Imported compiled dependencies were reused. This was a
read-only inspection of matching recorded checks, not an independent fresh
whole-source compilation or replay.

The protected Markov root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The canonical goal-contract hash remains
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
Both were independently recomputed during this audit.

## Timeout and durable results

The host classifies this worker as `timeout`, elapsed 1201.168 seconds,
finishing at 18:45:33.160 UTC; its structured `report` is null and
`mathematical_resolution` is false. This classification is preserved.

Nevertheless all selected final checks completed before that deadline.
The last three replays finished by 18:45:08.148 UTC. The final validation
manifest is timestamped 18:45:26.125. The durable `report.json`, final
checkpoint, correspondence, mathematics note, manifest, sources, and
verification records are all present in the worker's archived snapshot
and bound by its host receipt. Their hashes also match current files.
Thus the mathematical artifacts do not depend on accepting an unverified
post-timeout claim. The host did not receive a normal final report, but
the useful checked partial result was retained before the timeout.

There are 27 retained build/replay attempts: nine failed elaborations,
one earlier 100-second timeout, and seventeen successes including superseded
auxiliary checks. Only the ten selected final checks above support the
five-module final admission described here.

## Finite experiments and limits

`top-probe.json` reports 277,139 exact finite top-crossing tests across
2,924 reduced fractions with `a≤80`, `b≤100`, with no failure of the
stronger bound. The script ranges over `1≤a<b`, natural top-ending
triples, and the actual lower polygon inequality. One low-degree case
outside its third-layer formula range is explicitly counted separately.
For `b≤20`, 2,332 triples additionally compare the three formula
coefficients with an independent positive transfer calculation. These
are finite experimental observations, not the basis of universal admission.
The script and recorded output were inspected without rerunning the scan.

The fixed-row root probe stopped after 52 tests at word `ABA`, `j=2`,
with row `x²(14+28x+15x²)`. The worker explicitly identifies this as a
rediscovery of the inherited source `2/5` real-rootedness obstruction.
It is not a new source counterexample to raw log-concavity or a novelty claim.

The new verified coverage crosses the top three total-degree layers in
the horizontal direction. It should not be conflated with previously
proved log-concavity *along* the upper diagonals. No claim of new published
novelty, complete interior aggregation, or full root closure is warranted
by this audit.
