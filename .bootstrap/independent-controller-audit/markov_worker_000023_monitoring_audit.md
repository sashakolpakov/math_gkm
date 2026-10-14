# Independent monitoring audit: worker 000023

Request `05ef7fab4f78419f9b5c3aa251540484`. Read-only review of
`/Users/sasha/math_gkm/.control/markov/workers/000023/artifacts`.
No project edits, proof suggestions or proposer contact occurred. Worker 000024
was left undisturbed.

## Finding and host timeout

The retained theorem **first_six_raw05ef proves actual raw LC on the first six
upper diagonals for every source path**, including zeros, without numerator,
denominator, path-length or total-degree restriction beyond the diagonal equation.
The preceding worker's finite sixth-diagonal gap is genuinely closed.

The host invocation timed out after 1200.64 seconds and supplied no final
structured report. That operational outcome does not invalidate the completed
and archived theorem checks. The principal three diagonal modules compiled and
passed kernel replay before termination.

One additional replay completed after the manifest was written: the manifest
lists `MarkovHorizontalSource05ef` as compiled only, but archived receipt
`run-1791954976616136000.json` records its same-hash successful kernel replay.
It was written at 05:16:40.610 UTC, after the manifest at 05:16:35.444 and before
the host finished at 05:16:42.303 on 2026-10-14. Its bytes match the host archive,
and the event log records command completion. Thus seven modules ultimately
compiled and replayed; the manifest's earlier status understates this one result.
No history was rewritten in this audit.

`MarkovHorizontalTwo05ef` remains a failed, unaccepted transfer draft. Its
presence in source is not evidence of a new theorem. The accepted horizontal
identity work duplicates the earlier checked second-row result, as detailed
below. The full conjecture remains unresolved.

## Exact finite source classification and sixth diagonal

`sourceCore05ef` is computed from the actual Farey word pair by removing the
initial A and final B. `source_word_core05ef` proves its exact length b-2,
true-letter count a-1, and identification with the actual quotient polynomial.
The finite checks therefore concern actual source cores, not arbitrary balanced
words mislabeled by a numerator and denominator.

For 2≤a≤9 and b≤19, `source_core_good05ef` exhausts integer label possibilities
while retaining 0<a<b and coprimality from `frame_reduced`. There are 69 admissible
reduced pairs. In each surviving case it identifies the path with its displayed
canonical path using the checked `frame_path_injective_098`, whose hypotheses
are equality of the two actual source labels. It then checks the four exact
integer quintic coefficient inequalities by `decide +kernel`.

No path-length cutoff substitutes for the label classification, and neither
an external computation nor a native decision oracle is an assumption of the
finite theorem. The two timed-out enlarged-word enumeration attempts are not
used in the accepted proof.

`sixth_quotient_small05ef` links those checked core inequalities to the exact
inherited quintic identity and cancels the uniform factor 120. For b≤5 it instead
uses the exact zero-slice theorem at r=5. All larger finite cases have enough
letters for the generic word identity. `sixth_quotient_all05ef` then covers every
source with a≥2 by the exhaustive split:

- b≥20: the preceding long-word theorem;
- a≥10: the preceding large-numerator theorem;
- otherwise: the newly checked finite source classification.

The inequalities hold for every natural quotient index, including tail zeros.
The raw transfer uses the previously proved interval support and exact binomial
factorization; there is no residual LC or source-identification premise left.

The intermediate `sixth_raw05ef` assumes d=a+b-1≥10, which is the r=5 upper-half
factorization condition. `sixth_polygon05ef` removes that degree hypothesis for
the actual polygon triple. For a≥2, its checked small-degree contradiction keeps
coprimality explicitly; for a=1 it uses the inherited complete numerator-one
result. Thus small source degrees are not lost through a subtraction or an
unsupported polynomial division.

Finally, `first_six_raw05ef` assumes only a source path and natural r,i,j with

    r≤5 and i+j+2+r=a+b-1,

and concludes the literal raw integer inequality

    A_(i,j+2) A_(i+2,j) ≤ A_(i+1,j+1)^2.

It uses the inherited first-five result when r≤4. For r=5, either the first
endpoint is inside the actual polygon and the new theorem applies, or that
coefficient is zero and the inequality is 0≤a square. There is no polygon guard
in the final theorem and no filtering of zero coefficients. The omitted
homogeneous exponent is r, so this is exactly the first six upper diagonals.
The separate endpoint clauses remain inherited; this does not establish all
remaining diagonal levels or coordinate directions of the full root.

## Horizontal work is duplicate, with one unfinished draft

The accepted horizontal modules give a raw j=2 row identity, factorization,
statistic bound and cubic criterion. The source-statistic restriction also has
the late successful replay noted above. In the new notation

    A = 4*(adjacent BB count)+2*(first B)+2*(last B),

which is twice `stat8934` in the earlier checked work. Its cubic constant 2A
therefore equals the earlier 4*stat8934, and the remaining three coefficients
are the same after expansion. The source support argument forcing A=0 when
n>2m likewise reproduces the earlier restriction.

This is an alternate derivation of already established mathematical content,
not new horizontal-row coverage. `horizontal_two_raw8934` already proves the
raw j=2 inequality for every source path and natural index, including small
denominators. The latest `horizontal_two_raw05ef` draft has no successful build
and is excluded from accepted results. Its failure neither disproves nor
reopens the existing stronger theorem.

## Recorded verification inspected

Manifest: `evidence/markov-05ef7fab/validation.json`, supplemented only for this
audit by the independently inspected late archived replay receipt above.
All eight source hashes match the manifest, host archive and live source bytes:

| Module | SHA-256 | Actual retained status |
|---|---|---|
| MarkovFiniteQuintic05ef | a3d9e82bcf070474ea8b9dd5a39d6b2d8164f6cbbaa2ee916c369e35d2c66649 | Compiled/replayed |
| MarkovSourceFinite05ef | 7728997e3c2444f99f5f66e09f5c8bf4b76445a73a74a9ad80fcb1d614c9b334 | Compiled/replayed |
| MarkovSixthAll05ef | 6e4779f91f7248edb359f2f46b1ec127db5e2b090843a43061df613e063251d3 | Compiled/replayed |
| MarkovHorizontalJet05ef | 50351bc811d3a5587b0a156bcc5566d689c4613b3d5a12e80fd11e6a19d06372 | Compiled/replayed |
| MarkovHorizontalWord05ef | 1c114f009ee3c45e44afa67893621a7a575d120ac98130d375be725f2abe20a1 | Compiled/replayed |
| MarkovHorizontalFactor05ef | 34d1e3e3a798ae93b17ae69676b84fe489fc9f3f05d78bffc75541107216c9c8 | Compiled/replayed |
| MarkovHorizontalSource05ef | aedc097bf5d7ae511ea2b3ec72fe2f877970057e16c43f53392d9f85c31e8a94 | Compiled; late replay passed |
| MarkovHorizontalTwo05ef | 8d9fc7dca96afe94d5360f2841ab654d75386ac298bccd4e36c49cf5a14430ff | Failed/unaccepted draft |

Seven compilation and seven kernel-replay receipts have return code 0, matching
source hashes and matching archived host receipt-byte hashes. Thirteen printed
theorem closures contain only `propext`, `Classical.choice` and `Quot.sound`;
one helper's closure lists only `propext`. The finite predicate/cast module has
no separate print but is replayed and used by the printed classification theorem.
All listed direct-import binary hashes matched at audit time.

Eleven rejected compilation attempts remain code-1 records. Two earlier
compilation attempts at broader finite-word checks timed out after about 150
seconds and are not accepted proof evidence. The final failed horizontal draft
is explicitly separate from the seven successful modules.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host and saved records do not claim mathematical resolution or a completion
certificate. This audit inspected source meaning and recorded named-module
checks with inherited compiled imports; it did not run a fresh full-source
rebuild. No discrepancy requiring one was found.
