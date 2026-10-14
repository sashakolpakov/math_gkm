# Independent monitoring audit: worker 000017

Request `3af43e697b6b47c785aedffc7f2fb037`. Read-only review of the retained
snapshot `/Users/sasha/math_gkm/.control/markov/workers/000017/artifacts`.
Worker 000018 was not contacted or disturbed. No project sources, mathematical
repairs or proof suggestions were supplied.

## Finding and timeout classification

This worker timed out at 1200.32 seconds; its host receipt has `report: null`
and `mathematical_resolution: false`. Nevertheless, the retained snapshot
contains seven complete source modules with matching successful compilation
and kernel-replay receipts. Their mathematical content can be credited within
the recorded validation scope. A host timeout is not a failed theorem check.

The terminal event log records completion of the last two replays, the finalizer,
the report/checkpoint writes, and a final JSON validation command. The final
manifest was written at 03:23:12 UTC; the report/checkpoint at 03:23:43; the host
finished at 03:23:50.717 on 2026-10-14. These documents are present in the host
snapshot with matching receipt hashes and are unchanged in the live project.
Thus the late durable effects are already part of the archived timeout result;
no post-timeout proof completion needs to be inferred from an unrecorded process.

## Exact mathematical result

Write `P_q = F_(q+1)^2 + v F_q^2`, using the previously checked source family.
For every q ≥ 1 this is the raw numerator at 2/(2q+1), with an explicit canonical
path consisting of q-1 left steps followed by a right step. The converse source
adapter covers every path with numerator a = 2. The auxiliary P_0 is correctly
excluded from actual source obligations.

The new recurrences hold for every natural q:

    P_(q+2) = (S^2-2v)P_(q+1) - v^2 P_q - 4u v^(q+2),
    P_(q+3) = (S^2-v)P_(q+2) - v(S^2-v)P_(q+1) + v^3 P_q,

where S = u+v+1. The inhomogeneous correction is retained; it is not discarded
under an unjustified positivity argument.

`family_generating3af` is an exact identity D H = N for the formal series
H(t) = sum P_q t^q. Its Lean numerator is expressed using P_0, P_1 and P_2.
The denominator factorization

    D = (1-vt)((1-t)(1-v^2 t)-u(u+2v+2)t)

is separately proved. The mathematics note explicitly distinguishes its
simplified displayed numerator from the seed-form Lean statement. No analytic
convergence or log-concavity assumption enters these identities.

For C_i(q) = [u^i]P_q and G_i(t) = sum C_i(q)t^q, the exact column identity is

    (1-t)(1-v^2t)G_(i+2)
      = C_(i+2)(0) + t(2(v+1)G_(i+1)+G_i),  i ≥ 0.

The checked inverse kernel has coefficient sum_(r=0)^q v^(2r) at t^q.
It is positive but has gaps. `column_kernel_gap3af` explicitly proves the
adjacent log-concavity failure 0^2 < 1*1 in its q = 1 coefficient 1+v^2.
This concerns the auxiliary kernel, not a valid Markov source counterexample.

The new inequality `two_column_monotone3af` has no hidden cutoff: for all
natural q, i, j,

    [u^(i+2)v^j]P_q ≤ [u^(i+2)v^j]P_(q+1).

Its induction uses the exact initial difference and subsequent differences,
with raw coefficient nonnegativity proved for the entire auxiliary family,
including q = 0. The source adapter gives every actual a = 2 path an actual
next path with denominator b+2 and this inequality for all i,j simultaneously.
It preserves raw coefficients, natural indices and zeros, without normalization
or polygon truncation. The restriction to horizontal indices at least 2 is real.

This is **monotonicity across different polynomials**, not adjacent
log-concavity within one polynomial. It proves no new horizontal, vertical or
diagonal direction of Conjecture 6.3.

`root_iff_two_family_and_large3af` proves the exact equivalence

    Conjecture63 iff
      (forall q ≥ 1, GlobalLC18(P_q)) and
      (forall source paths with a ≥ 3, GlobalLC18(actual source polynomial)).

Both residual conjuncts remain unproved. Numerator-one sources and endpoint
clauses are discharged only through the previously checked exact root
reduction. The new equivalence keeps all three raw directions and natural
indices; the inherited global/guarded equivalence handles outside-polygon
zeros. It does not silently drop remaining numerator-two directions.

The additional proposed positive expansion and increment-LC scans remain
finite experimental evidence. The note correctly marks the expansion's
universal coefficient bridge as unformalized. Synchronization failures are
obstructions to the tested closure argument, not source LC counterexamples.
No historical novelty assertion is made in this audit.

## Verification inspected

Manifest: `evidence/markov-3af43e69/validation-1791948192937312000.json`.
All seven final source hashes match the manifest, host snapshot and live bytes:

| Module | SHA-256 |
|---|---|
| MarkovFamilyRecurrence3af | 55a23709a1cf6747f9f6c51413b10dd6d0ccd8ff89276152629c7f748498813b |
| MarkovFamilyEquation3af | a8e4441ddd28ec63aebcc0cb55827c12879068da5a25abf2bcccf3c9eaae807a |
| MarkovGenerating3af | 69c444d9478df929c6b728eceedb7851366b6d87cfab7797198d39a1832c7504 |
| MarkovColumnSeries3af | f90e0b70f30ad8116df37c0bfd96405d94b32f71535b46242b3f34450c6074f3 |
| MarkovColumnMonotone3af | dd51b0124cdaff9ac4b9d5be8453771d3e805289fe6c3212fec1efdb5d06c775 |
| MarkovPositiveKernel3af | e1f6d5e0f42efd22192e1d17019f4292c508377f19f290d6fcb135ee58e0de29 |
| MarkovSourceReduction3af | 6c77e034e129aa3baa7495b2cfb364671001189a3b297afa6fd40d35575b598c |

Each final module has one successful compilation and one successful
`leanchecker` receipt bound to its exact source hash. All fourteen receipt byte
hashes match the host archive. The thirteen printed axiom closures contain only
`propext`, `Classical.choice`, and `Quot.sound`. The nine separately retained
rejected elaborations have return code 1 and are not admitted evidence.
Every listed direct-import binary hash matched at audit time.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The final report and manifest both keep `completion: null`.

This audit inspected source meaning and matching recorded checks; it did not
perform a fresh independent rebuild. The checks use inherited compiled imports,
as the manifest states. No discrepancy requiring a full rebuild was found.
