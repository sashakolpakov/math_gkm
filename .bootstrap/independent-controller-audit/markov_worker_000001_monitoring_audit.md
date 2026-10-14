# Monitoring audit: autonomous Markov worker 000001

Reviewed 2026-10-14 Europe/Zurich. Request:
`2d1cb04012e444d0bf81aa075e38674a`.

Read-only review of retained artifacts after termination. No source edits,
proof suggestions, model calls, contact with the proposer, or inspection
of active worker 000002's developing research occurred. This reviewer did
not rerun the compiler: compilation claims below refer to inspected,
hash-matched recorded execution evidence.

## Operational outcome

The host receipt classifies the attempt as `timeout`, after 600.158 seconds,
with `report: null`; there is no final.json. The attempt is not a completed
worker report or a completed root proof. Nevertheless, before termination
it retained successful proof validation, a detailed scope note, a final
checkpoint, and a validation manifest. Those artifacts can support partial
mathematical results independently of the missing final response.

## Defensible mathematical progress

For every finite path of the existing protected recurrence, write its
frame polynomials as (L,M,H), and the low/high monomial weights as A,B.
`exchange_frame_2d1` proves the exact polynomial invariant

    M² + B L² + A H² = (u+v+1) L M H.

The branch theorems prove the subtraction-free product identities

    L N_right = M² + A H²,
    H N_left  = M² + B L².

These are equalities in the actual nested integer polynomial ring, not
bounded numerical checks. They do not assert quotient positivity or
log-concavity.

`source_specialization_2d1` then proves, for every field and nonzero x,y,
that evaluating and normalizing each label (a,b,P) as

    xy P(x²,y²)/(x^a y^b)

commutes with every finite iteration of the explicitly defined Vieta
recurrence, with parameter (x²+y²+1)/(xy) and seed triple

    (x, ((x²+y²)²+x²)/y, x²+y²).

The definition handles the endpoint a=0 without interpreting a negative
exponent as truncated natural subtraction. The evaluation homomorphism
is constructed, rather than assumed to exist.

`source_full_evaluation_2d1` proves the corresponding projective statement
for arbitrary fields and nonzero x,y,z: evaluate at (x/z,y/z), multiply
all three entries by z, and obtain exactly the Vieta iteration with
parameter (x²+y²+z²)/(xyz) and seed

    (x, ((x²+y²)²+x²z²)/(yz²), (x²+y²)/z).

The hypotheses on the coordinates are explicit. The English scope note
accurately describes an evaluation/recurrence bridge. It does not claim
a formal identity of Laurent coefficient representations or use these
evaluation identities to infer coefficient inequalities.

## Checked evidence and versions

Final archived sources:

* MarkovExchange2d1.lean:
  `827dd6f77968f1321a538b768bedb07f1ebba11f493c0754382b2f3e1f1f5610`.
* MarkovLaurent2d1.lean:
  `7343d6bb7ccf90448af5973ec2d3b42460b2155312dd6fad43ebf4b7e151e9af`.
* MarkovProjective2d1.lean:
  `dca57b148cf6bec17c31f70641f1f9252df11e0ca76ab9dcafc92841de7505f5`.

For each final source, the selected compile and leanchecker records have
matching source hashes and exit status zero. The root and inherited
indices were also freshly built and kernel-replayed. The 23 printed new
theorem closures contain only propext, Classical.choice, and Quot.sound.
All inspected archived text hashes agree with the host receipt.

The first exchange compilation and first projective compilation failed;
their source snapshots and diagnostics remain preserved. Their diagnostic
`sorryAx` closures belong to rejected elaborations, not to the successful
final sources or selected theorem closures. A receipt containing an earlier
failed exchange compilation also contains successful root/index builds;
validation correctly selects individual per-module records.

Manifest: worker archive
`artifacts/evidence/markov-2d1cb040/validation.json`.

## Limits and blockers

The evidence supplies useful universal algebraic bridges despite the worker
timeout. No unfinished compiled claim was found among the three final
sources, and no substantive English/Lean mismatch was found in their
stated scopes. The observed operational limit was the 600-second ceiling
and missing final worker response, not a retained unresolved compiler error.

Formal Laurent/coefficient correspondence, degree/homogeneity and polygon
identification, and the universal raw inequalities in all three directions
remain unproved by this attempt. The protected root remains unchanged and
Conjecture 6.3 remains unresolved. This is not a root-completion audit.
