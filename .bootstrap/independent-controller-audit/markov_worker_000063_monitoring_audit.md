# Independent monitoring audit: worker 000063

Request: `68a44d341d1c48e791034745c94024de`.
Project: `/Users/sasha/math_gkm`.
Completed snapshot: `.control/markov/workers/000063/artifacts`.
Evidence: `evidence/markov-68a44d34`.

Read-only inspection of final mathematics, correspondence, Lean sources,
recorded validation, experiments, and completed artifacts. No project changes,
proposer contact, fresh proof checks, or experiment reruns were made.

## Finding

The worker rigorously excludes a proposed auxiliary invariant on an infinite
family of actual sources. It does not refute the Markov coefficient conjecture.
For every natural `n ≥ 33`, the path `R^n L` has rational label
`(2n+1)/(2n+3)`. At the fixed individual-mask degree `n+6`, the constant
coefficients of layers with cut counts 4, 5, 6 fail log-concavity strictly.
The corresponding three full raw source coefficients are proved polygon-valid
and log-concave. Both conclusions are unconditional under the stated `n ≥ 33`.

The exact mixed-run counting formula is valid for arbitrary natural run lengths
and cut/degree indices, retaining empty sums and out-of-range zeros. No
substantive English/Lean mismatch was found. The vertical source example and
revised alignment observations are correctly separated from proved results.

## Exact statement correspondence

`oneAPath68 n = replicate n true ++ [false]` is the literal source path.
`oneA_word68` proves its extended central word is `B^n A B^(n+1)`;
`oneA_labels68` proves the labels `a=2n+1`, `b=2n+3`. Source membership is
constructed by `frame`, not assumed through a label or polynomial premise.
There is no enlargement to all palindromic or otherwise arbitrary words.

`degreeLayer07a7 y w s d` sums the original mask weights over the exact list
of `s`-cut masks filtered by individual degree `d`. The inherited degree theorem
identifies that marker with the mask polynomial's actual degree. The marker is
not the omitted homogeneous coordinate. Every mask has constant coefficient
one; extraction at `y=0` therefore counts masks, retaining multiplicities.

The exact source coefficient bridge has `i+j=a+s`. At coefficient index `j=0`,
cuts 4,5,6 correspond to raw horizontal positions `(a+4,0)`, `(a+5,0)`,
`(a+6,0)`. The layer is only part of each raw coefficient. The failure theorem
does not identify those parts with the full raw values.

For `n ≥ 2`, `source_count_456_formula68` gives the three layer counts

- `L = n * choose(n+1,2)`;
- `M = (n+1) * choose(n,3)`;
- `R = n * choose(n−1,4) + 2*choose(n,5) + choose(n−1,5)`.

For `n ≥ 33`, the checked rational polynomial identity is

`720*(L*R−M^2) = n^2*(n+1)*(n−1)*(n−2)*(4*n^3−143*n^2+413*n−220)`.

Writing `n=33+t`, the final cubic is
`4*t^3 + 253*t^2 + 4043*t + 1430`, strictly positive for `t≥0`.
Natural-subtraction casts used in converting the binomial formulas are guarded.
`source_fixed_degree_horizontal_failure_all68` transports this strict failure
to the exact source layer, with no upper bound on `n`. It proves failure for
all `n≥33`; it does not state an if-and-only-if threshold for every smaller `n`.

`source_full_raw_holds_all68` proves all three `InPolygon` assertions using
the actual labels and `n≥33`, then applies the inherited universal raw boundary
log-concavity theorem. This is an explicit valid-input check, not a new proof
of a previously unproved raw row. The natural indices are literal and positive
here; no endpoint or support entry is filtered away. The full root's separate
0/1 and 1/1 clauses are unchanged.

At `n=33`, source 67/69, the following are formal exact integer results:

| Quantity | Triple | Middle square minus endpoint product |
|---|---|---|
| Auxiliary degree-39 layer, cuts 4,5,6 | `[18513,185504,1862728]` | `−72949448` |
| Full raw coefficients at `(71,0),(72,0),(73,0)` | `[814385,10424128,109453344]` | `19525283006944` |

The full raw theorem also proves the exact labels and all polygon guards.
The source boundary formula used is `A_(a+s,0)=choose(b−1,s)`, valid for all
paths and natural `s`, including its ordinary out-of-range binomial zeros.

## Exact count formula and multiplicities

With `t=z+x*z^2` and `S_n(t)=sum_{k=0..n−1} t^k`,
`singleA_count_formula68` proves, in any commutative ring, the counting
specialization for `B^p A B^q`:

`1 + x*z*S_q + x*z^2*S_p + x*z*t^p + x^2*z^3*S_(p+1)*S_q`.

It is proved directly from the marked recurrence via an exact two-component
state identity. `marked_count_coeff68` identifies the outer `x` coefficient
at cut count `s` and inner `z` coefficient at degree `d` with the constant
coefficient of the actual layer over the integers. Evaluation and map identities
are formal, not empirical matching.

`count_atom_coeff68` handles a shifted term `x^r*z^h*t^N`: the coefficient is
`choose(N,s−r)` precisely when `r≤s` and `h+N+(s−r)=d`, otherwise zero.
`singleACount68` retains the constant term, both finite geometric sums, the
single extra atom, and the full rectangular double sum. No summand is merged
without its multiplicity.

For the source specialization `p=n, q=n+1`, the double sum becomes square.
Its diagonal multiplicity is exactly
`max(min(n,N)+1−max(N−n,0),0)`, represented by natural subtractions in Lean.
The general coefficient extraction is zero-safe, and the specialized
`n≥2` formulas explicitly discharge the subtraction/index premises. The
subsequent stronger condition `n≥33` is sufficient for strict failure.

## Final validation and recorded retries

All five final modules match successful recorded compilation and separate
`leanchecker` replay. I checked current/archived sources, host after-hashes,
artifact manifest, successful source snapshots and records, and compiled
objects; all 45 selected artifact bindings match. The successful printed
closures of ten theorems use only `propext`, `Quot.sound`, and
`Classical.choice`. No final source admission was found.

| Module | Final source SHA-256 | Build / replay |
|---|---|---|
| MarkovCountTransfer68a4 | `b87700c844c99a02657c37d8e701d3e3ce06e1b4ca0a31648fe0cea7c213a1f0` | passed / passed |
| MarkovCountCoeff68a4 | `861d026bc38ff51696dba572169d14b91d46c3bd6eb5f73b91d89aaf46b3769b` | passed / passed |
| MarkovCountDiagonal68a4 | `4e4b5f5ccbeaff84db6a9eb707a126dee80729e233d48bf66e787973c84ab6d9` | passed / passed |
| MarkovSourceCount68a4 | `f89c611c9ac03d21e3dd2b2ca637d75ab23155b93dc056dc0cbb81f3224f20d9` | passed / passed |
| MarkovCountGap68a4 | `f46fb23c831221b958e46826a7ef00ad8d7142aa5d0ba972236f0ba2f04dfebc` | passed / passed |

There are 22 validation attempts: 13 successful records, seven rejected builds,
and two initial replay timeouts. Earlier SourceCount and Gap successes must
not substitute for later changed sources; the manifest selects successful
checks at the final hashes. The initial Diagonal timeout was at its final
source hash and was followed by a successful retry. The initial SourceCount
timeout was at an earlier hash; its final changed source has both a successful
build and a successful replay. The final Gap replay took 50.882410 seconds,
ending 2026-10-14 23:36:43.798066 UTC, before the normal host completion at
23:37:33.491044 UTC. No pending or late incomplete check is counted as passed.
Current records match the completed worker snapshot.

The host records `completed`, return code zero, 1141.39 seconds, and
mathematical resolution false. The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`;
the canonical contract hash remains
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
Checks reuse inherited compiled imports. This audit is not a fresh whole-source
rebuild or a full-root completion certificate.

## Experimental claims and remaining limits

The saved experiment scopes agree with the final prose:

- The count formula was checked at 28,899 finite coefficient positions for
  `0≤p,q≤12` and cut counts through eight, including coefficient zeros.
  The universal theorem is established separately.
- The first source horizontal failure was found after 73,707 tests over
  237 distinct source inputs. This scan stops on that failure; it is not a
  universal claim or an exhaustive classification.
- The arbitrary-word enumeration lists all 32,767 distinct binary words of
  lengths 0 through 14. Horizontal testing stopped for that direction after
  its first failure (143,841 tests); vertical and diagonal tests continued,
  reaching 2,674,604 and 6,598,525 with no failure, with cut count at most five.
  The separate 164-word stress run found horizontal and vertical failures in
  the enlarged arbitrary-word family. None of this proves source-wide results.
- At actual source 79/81, fixed degree 45 and cuts/exponents 4,5,6, the saved
  auxiliary vertical triple is `[20255130,1530059524,115703332360]`, gap
  `−2503891401900224`. The complete raw triple at `(79,4),(79,5),(79,6)` is
  `[1052700916,106849324804,8979215652392]`, gap
  `1964349668836093647344`. A separately implemented literal source recurrence
  reproduces these full raw values and polygon guards. This vertical example
  is experimental only, not a new Lean theorem.
- The literal recurrence also reproduces the already formally checked 67/69
  raw values. This independent implementation is not an independent proof of
  the full conjecture.
- The revised degree-minus-cut alignment has 35,750 saved identity checks and
  30,250 inequality checks for `1≤n≤50`, cut bound 12. Its general derivation
  is not claimed as a new Lean theorem. The separate polynomial certificate
  file likewise retains its experimental status; the accepted universal gap
  proof is the actual identity in `MarkovCountGap68a4`.

The new result rejects fixed-degree cross-cut log-concavity as a universal
source invariant. It leaves mixed-source diagonal aggregation and all remaining
raw inequalities unresolved. Full Conjecture 6.3 and its negation remain
unproved; completion is correctly null. No claim of published novelty is made.
