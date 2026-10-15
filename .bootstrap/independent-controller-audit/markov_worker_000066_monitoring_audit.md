# Independent mathematical monitoring audit: worker 000066

Request: `c4169865f3444727be49165831b91f73`.
Project: `/Users/sasha/math_gkm`.
Retained worker snapshot: `.control/markov/workers/000066/artifacts`.
Evidence: `evidence/markov-c4169865`.

Read-only review of mathematical English, six final Lean sources, recorded
checks, artifact hashes, and finite experiments. No project files were changed,
proposer contacted, research guidance supplied, pending validation completed,
or active worker touched. No proof or experiment was rerun.

## Finding and validation status

The weighted repeated-right aggregation theorem and the precisely stated
mixed-source limitation have matching successful compilation and alternate-driver
kernel-replay records. The exact marked one-cut identity also passed both.
The later universal one-cut coefficient/deformation module compiled successfully
but its separate replay timed out. The final raw/source/polygon bridge has only
a build timeout, so it remains an unfinished draft, not an accepted universal
raw result.

There is no substantive English/Lean mismatch in the accepted weighted results.
There is a documentation status caveat: mathematics.md and correspondence.md
describe `MarkovOneCutRawC416` as connecting/proving the universal raw triple
and guards, although the manifest records it uncompiled. Mathematics.md adds
that universal claims hold only to the extent validated; that caveat and the
actual timeout must govern reporting. No inference from the attractive draft
statement or finite raw checks can replace its missing successful build.

The host outcome is **timeout**, not normal completion: 1202.63 seconds,
`report: null`, mathematical resolution false. The separate report.json is
absent. The retained source and evidence nevertheless support the scoped
results below.

## Exact weighted theorem

For a repeated-B word of length `ell`, let the positive cut count be `c=s+1`.
For natural `N`, the premise is `s+N<ell`, equivalently `c+N≤ell`.
For a real polynomial `q`, the weighted polynomial is exactly

`W(y) = sum_(r=0..N) q_r * layer(B^ell,c,2*c+N−r;y)`.

The weights act uniformly on every mask within the indicated layer, and every
mask retains its original multiplicity. The degree band is the active band
from `2*c` through `2*c+N`; the weight order is descending in degree. The
theorem assumes nonnegative coefficients of `q` and `CrossLC` for its full
zero-extended coefficient sequence. It is not a theorem for arbitrary adjacent
LC sequences with internal support gaps. There is no bound on the degree of
`q`; coefficients beyond `N` simply do not contribute.

`weightedRun_formulaC416` proves the exact aggregation identity with common
factor `(1+y)^(2*c)`. The remaining coefficient at `j≤N` is

`choose(j+s,s) * [t^(N−j)](nbPoly(s,N;t)*q(t))`,

and is zero when `j>N`. The finite convolution limits and subtraction guards
are explicit. Reflection of convolution, multiplication of nonnegative CrossLC
sequences, and binomial smoothing provide the LC inequality; the proof does
not infer LC merely by adding LC summands.

For path `R^n`, the actual extended source word is `B^(n+1)` and the labels
are `(n+1)/(n+2)`. The source premise is exactly `s+N≤n`. Every natural
coefficient index is included, with zero weights, zero coefficient tails, and
the maximal valid endpoint retained. There is no path-length or denominator
cutoff. The real theorem allows real weights; the integer version allows an
integer polynomial with CrossLC stated on its coefficientwise real cast.
That cast preserves the coefficients and introduces no normalization.

This is an auxiliary theorem at fixed cut count, hence within the source's
constant-total direction. It is a refinement of an already established raw
direction in the Pell/repeated-right family, not a new rational family or a
full horizontal/vertical result. The original root endpoints and polygon
definition are untouched.

## Exactly what the mixed-source obstruction excludes

The actual source 2/7 has path `[false,false,true]`. At two cuts its layers
of degrees 0,1,2 are `1`, `3+3y`, and `11+25y+14y^2`.
The new weight polynomial `q(t)=1+100t+10000t^2` is formally shown
nonnegative and CrossLC. Applying its coefficients in descending layer-degree
order gives `10311+325y+14y^2` with exact gap `−38729`.

`not_all_source_weighted_layersC416` is a literal negation of the unrestricted
principle quantified over every source path, natural `cuts,D,j`, and such a
weight polynomial, for `sum_(r=0..D) q_r*layer(cuts,D−r)`.
The witness uses `cuts=2,D=2,j=0`. It invalidates that precise principle.
It does **not** refute a narrower generalization retaining the repeated-B
lower degree `2*c=4`: the witness degrees are below that lower bound. The
formal negation itself makes no such restricted-band claim.

The separate theorem verifies actual source labels, all three raw polygon
points `(4,0),(3,1),(2,2)`, and the positive raw gap 574, using the inherited
raw triple `[15,28,14]`. This is the preceding worker's geometric obstruction
rescaled to integer layer weights and attached to a precise universal claim,
not a new raw-source counterexample or an asserted new discovery of 2/7.

## One-cut work: accepted identity, compiled deformation, unfinished raw bridge

`MarkovMarkedOneCutC416` has both successful compilation and alternate replay.
Its marked append law updates the skipped-run state and degree correctly.
For every natural `n` and real `z`, the exact source word `B^n A B^(n+1)`
has one-cut marked polynomial

`sum_(k<n) z^(k+2)*(1+y)*P_k + z^(n+1)*P_n`
`  + sum_(k≤n) z^(k+1)*(1+y)*R_k`,

where `R_k=1+2y+...+2y^k` and `P_k=R_k+y^(k+1)`.
The source word is identified through `oneA_word68`; no virtual polynomial
or source-membership hypothesis is inserted.

`MarkovOneCutTailC416` compiled successfully at its final hash. It parameterizes
`n=m+3`, so it covers every `n≥3` without a hidden upper bound. It computes
the coefficients at `n−1,n,n+1` as

`z^(n−1)*(3+7z+10z^2), z^n*(3+9z), 4*z^(n+1)`.

Their exact gap is `z^(2*n)*(−3+26z+41z^2)`, and the strict failure at
`z=1/100` is a compiled theorem for every `m`. This module's separate replay
timed out; do not report it as successfully replayed. The identities concern
the altered degree weighting, not original raw coefficients. The unweighted
specialization and nonnegative coefficient-suffix observations in prose do
not contradict the previous candidate suffix criterion.

`MarkovOneCutRawC416` attempts to prove the complete raw triple `[20,12,4]`,
gap 64, at `(n+3,n−1),(n+2,n),(n+1,n+1)`, including labels and all polygon
guards for `n=m+3`. Its source bridge is explicit in the draft. Its only build
record timed out, with no successful printed closures or accepted replay.
I do not certify this final universal raw theorem from its intended proof.
The retained finite literal-recurrence checks for `n=3..18` are separate
evidence only.

## Final hashes and recorded checks

All six final source hashes match current and archived files, host after-hashes,
and artifact manifest. For each accepted build/replay I also checked its saved
source snapshot, record, and compiled object where present. All 38 selected
artifact bindings matched. The fifteen successful-build printed theorem
closures contain only `propext`, `Quot.sound`, and `Classical.choice`; the last
three belong to the compiled-only OneCutTail module. No final source admission
was found, but this does not promote the uncompiled Raw draft to an accepted
proof.

| Module | Final source SHA-256 | Compilation / separate replay |
|---|---|---|
| MarkovWeightedWindowC416 | `18728d740273d4e5edeb10ebe475a1ec1c4da43202355eeb2ddb8123e71412bd` | passed / alternate driver passed |
| MarkovWeightedRunC416 | `0ebe3bdcb5167ca365c6e73376650d5e675de74ed4f20cbd590650aea25f1632` | passed / alternate driver passed |
| MarkovWeightedObstructionC416 | `20f6a917ade396b6a57272ec463bbd06cef3c15ed91a498a5bad7ab76754916e` | passed / alternate driver passed |
| MarkovMarkedOneCutC416 | `7b2913ec3f6d675ad22ed119afd889612d05fd490b014efa18bec47eb62e9a2f` | passed / alternate driver passed |
| MarkovOneCutTailC416 | `9f6eacf1d22f691566182f3b7410d6e7c451b14d44778c7d69dff152dea1cb40` | passed / timeout |
| MarkovOneCutRawC416 | `2b0bc26680f4285531d136ff8a9c9c95b708c9f2f14d4fc96c3f55345599d622` | timeout / no accepted record |

The four successful replay commands invoke `lean --run ReplayKnown6d2c.lean`
with the intended module name, child return code zero, and exactly the expected
begin/pass output. The driver remains SHA-256
`18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`,
the unchanged driver accepted in the independent
[worker 65 replay-method audit](markov_worker_000065_replay_method_audit.md).
The wrapper places this worker's evidence directory first on `LEAN_PATH`,
followed by recorded inherited imports. This supports alternate-driver default
per-module kernel replay, not successful official `leanchecker` CLI runs or
a fresh replay of all imports. No official checker attempt is recorded here.

There are 21 validation attempts: five successful final compilations, four
successful alternate replays, nine rejected builds, two build timeouts, and
one replay timeout. The earlier OneCutTail build timeout is superseded by its
successful final build; its final replay timeout is not superseded. The last
successful check, that final compilation, ended at 2026-10-15 00:35:28.233423
UTC. The final 18-second Tail replay and Raw build timeouts were both retained
before the host stop at 00:36:02.153546 UTC. All current run records match the
archived snapshot; no later successful receipt was found in this worker's
evidence. The preliminary operational-observations list predates the last two
timeouts; the individual records and manifest determine the final statuses.

Protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`;
canonical contract hash remains
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
There is no fresh whole-source rebuild or full-root completion certificate.

## Finite evidence and unresolved mathematics

Saved scripts/data, inspected without rerunning, support only their recorded
finite domains:

- All 8,190 nonempty Boolean words through length 12 were visited; 3,763,099
  fixed-layer tests had no failure. Broader whole-word raw and suffix claims
  fail already for `B A B^6` with one cut. This arbitrary word is not presented
  as a source counterexample.
- A shuffled sample of 49 higher-denominator sources, cuts at most five,
  produced 2,224,339 suffix checks and 1,057,590 fixed-layer checks without
  failure, stopping near the 90-second budget. No denominator exhaustiveness
  follows.
- Increasing-weight tests cover 602 source inputs through denominator 44,
  cut counts at most seven, twelve sampled intervals per cut count and five
  specified weight families, for 2,559,660 polygon-guarded inequalities.
  Sampled intervals can repeat; this is not all intervals or all weights.
- The one-cut scan stopped at source 7/9 with descending weights and triple
  `[30710,309,4]`, gap `−27359`. These are experimental weighted values.
- Independent literal recurrence checks give `[20,12,4]`, gap 64, and guards
  for sixteen sources `n=3..18`. Repeated-B finite tests through length 14
  check 54,880 coefficient identities and 50,400 weighted inequalities.

General-source suffix positivity, general-source increasing-weight aggregation,
the remaining raw inequalities, and the full conjecture remain unresolved.
No full-root proof or refutation is claimed or established.
