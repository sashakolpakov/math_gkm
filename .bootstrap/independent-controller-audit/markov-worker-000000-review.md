# Independent mathematical audit: autonomous worker 000000

Audit date: 2026-10-14, Europe/Zurich. Worker request:
`098a5a660b784698a1c14a1849419cdd`.

This is a check-only review performed after the worker's final report and
receipt existed. The reviewer supplied no mathematical strategy, proof,
repair, source edit, or model invocation. Review used the archived sources
under `.control/markov/workers/000000/artifacts/` and matched their hashes
against the worker receipt. No fresh compiler run was performed by this
reviewer; the compilation and kernel-replay evidence described below is the
worker's recorded execution evidence.

## Finding

The reported indexing result matches the Lean statement. For all natural
numbers a and b satisfying 0 < a < b and gcd(a,b) = 1, there is exactly one
finite Boolean path whose actual recurrence frame has middle numerator a
and denominator b. These are equalities of the integer labels, not merely
equality of rational ratios. There is no bound on the denominator or path
length in the theorem. Together with the inherited reducedness theorem,
this gives a bijection between finite paths and reduced interior rational
labels. Neither coefficient inequalities nor any source-family identity
are hypotheses of this result.

## Exact statements and scope

* `weighted_coverage_098` proves reachability of every positive coprime
  weighted sum of the endpoint label vectors for any frame satisfying the
  existing `FrameIndices` predicate. Its explicit sum parameter n is
  universally quantified; it does not impose a fixed finite cutoff.
* `rational_coverage_098` specializes this statement to the protected
  initial frame and proves exact pair reachability for every 0 < a < b
  with `Nat.Coprime a b`.
* `weights_positive_098` and `weights_injective_098` prove positivity and
  injectivity of the auxiliary path-weight encoding.
* `weights_labels_098` connects that encoding to the existing frame
  recurrence's two integer labels. It makes no assertion that polynomial
  fields equal the source's Laurent polynomials.
* `frame_path_injective_098` states that equality of both middle integer
  labels forces equality of paths.
* `rational_unique_098` combines existence and injectivity, with exactly
  the positivity, strict-interiority and coprimality hypotheses above.
* `rational_range_098` states an equivalence: a pair is a middle label of
  some path if and only if it satisfies those three hypotheses. This also
  excludes endpoints and unreduced pairs from the path range.

The endpoints 0/1 and 1/1 remain the separate cases in `Conjecture63`.
There is no missing endpoint in this indexing assertion, because its
English and Lean scopes both specify interior rationals.

## Version and validation evidence

New source hashes:

* `research/MarkovCoverage098.lean`:
  `40029f8cacead72dacddb294dd74c96034f16eb607e31165701d435adbe7bc96`.
* `research/MarkovUnique098.lean`:
  `78cfad328e01cb2de24c310b3d5e365eaf6a4fff40218f3ed2863cc56c19fd15`.

Protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`;
inherited index module remains
`d31b4077de76ad7af7bd5c98df0e80367e38364d526541ed12dfd665db1f5e76`.

The recorded fresh build compiles the root, inherited index module and
coverage source with exit status zero. The selected successful uniqueness
compilation also exits zero and identifies the final source hash above.
Recorded `leanchecker` invocations for all four modules exit zero. Printed
axiom closures for the eight new theorems contain only `propext`,
`Classical.choice` and `Quot.sound`. The first failed uniqueness elaboration
is preserved and excluded from successful validation. Archived text
artifact hashes match the host worker receipt; current copies matched
the same hashes at review time.

The validation manifest is
`evidence/markov-098a5a66/validation.json`, archived with the worker.
The reported result is therefore supported by source inspection and the
recorded matching successful compilation/kernel evidence, not by a
finite numerical scan.

## Remaining mathematical scope

This result closes the rational-index coverage and uniqueness issue for
the exact existing recurrence. It does not establish equality of that
polynomial recurrence with the published mutation-generated Laurent
family; the homogeneous/raw-coefficient bridge; identification of the
Newton polygon; or any universal log-concavity inequality. It does not
prove or refute Conjecture 6.3. The worker's report and correspondence
document explicitly preserve these distinctions. No substantive
English-versus-Lean mismatch was found in the claimed indexing result.

This note is not a hash-bound completion audit for the root conjecture and
does not authorize changing its unresolved status.
