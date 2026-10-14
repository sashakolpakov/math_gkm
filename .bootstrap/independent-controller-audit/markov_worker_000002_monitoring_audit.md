# Monitoring audit: autonomous Markov worker 000002

Reviewed 2026-10-14 Europe/Zurich. Request
`21afc5949a0649388be45f280b6747f2`; host outcome completed, 526.800 seconds.
The reviewer inspected archived outputs only and did not contact the proposer,
edit project files, supply repairs or strategy, or inspect active worker
000003's research. No independent Lean compilation was run in this audit.

## Mathematical scope

The completed result matches its English description:

* `degree_frame_21a` proves that every label (a,b,P) of every reachable frame
  has zero raw integer coefficients at all i+j > a+b-1. This is an upper
  bound, with no assertion that the upper degree is attained. The theorem
  includes the frame's endpoint labels and requires no positivity assumption.
* `homogenize21a d P` explicitly replaces each coefficient A_ij by the
  monomial A_ij u^i v^j w^(d-i-j). Raw coefficient recovery is exact; neither
  factorial factors nor other coefficient normalization is introduced.
* Natural subtraction in that construction is harmless for the generated
  family because the proved support bound excludes nonzero coefficients
  with i+j>d. The construction is homogeneous of degree d only with this
  bound; the generic injectivity and recovery theorems do not require it.
* Setting w=1 recovers P, and every homogeneous three-variable polynomial
  of the fixed degree is recovered from its specialization. Zero coefficients
  and the zero polynomial are included. Injectivity is restricted to a
  common degree in the homogeneous-specialization theorem.
* The signed Laurent exponent map is injective on (i,j), and its three
  exponents sum to one. This is an arithmetic theorem about an exponent map,
  not yet a formal Laurent-ring coefficient transport theorem.

No substantive English/Lean mismatch was found. The source-family identity
is still an explicit open connection: the generic reconstruction results
do not alone identify the constructed homogeneous polynomial with the
published numerator. No lower sloping support bound, convex-hull equality,
coefficient positivity, or universal log-concavity statement is proved here.

## Validation evidence

Archived final source hashes:

* MarkovDegree21a.lean:
  `8843c065a5ddfb009d774efee650ac8cce8aeec83b03cc8b9dfe57e9f7d4e73c`.
* MarkovHomogeneous21a.lean:
  `a74a22dc402bf98393a5019c285ba8fefb7dace86a7f90dc6aa932a01b788d41`.

Both have matching recorded successful compilation and leanchecker results.
The protected root and inherited indices also have successful fresh build
and kernel records. All 12 printed theorem axiom closures contain only the
permitted standard axioms. Three failed earlier source versions remain
preserved and rejected. Inspected archived text hashes agree with the host
receipt; the root's pinned hash is unchanged.

Manifest: worker archive
`artifacts/evidence/markov-21afc594/validation.json`.

## Matrix experiment

The polynomial matrices agree with the conjugation and w=1 specialization
of equation (35). The published construction identifies the appropriate
tree's upper-right entries with numerator polynomials; it does not state
that arbitrary binary words belong to that tree. See the
[primary article, Section 10](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).

The retained exact-integer experiment enumerates all 510 nonempty words of
length at most eight. In the enlarged family, AAAABB has upper-right-entry
coefficients 4,6,10 at (1,3),(1,4),(1,5), violating adjacent log-concavity
because 36<40. The reviewer independently recomputed this one matrix product
using exact dictionary polynomial arithmetic and obtained the same values.
This additional arithmetic check is finite audit evidence, not a Lean proof.

The word has natural count label (2,6), which is unreduced. It is not a
witness for the protected rational-index conjecture. The worker correctly
labels this as a failure in an enlarged matrix family, not a source Markov
counterexample. Agreement with the recurrence on 71 fractions of denominator
at most 15 remains a finite experiment, not a universal matrix/source bridge.

Conjecture 6.3 remains unresolved; the worker's completion field is null.
This note does not constitute a root-completion audit.
