# Exact scope of the rational coverage bridge

Worker request: 098a5a660b784698a1c14a1849419cdd. Machine-authored local
correspondence argument, not the independent audit required for root closure.
No proof or refutation of Conjecture63 is claimed.

## Source and target

The publisher source was retrieved live on 2026-10-13 UTC:
[Evans--Veselov--Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
Section 2 indexes the family by rational Farey mediants in [0,1]. The exact
protected Lean recurrence is unchanged. Its SHA256 is
8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
The inherited index module has SHA256
d31b4077de76ad7af7bd5c98df0e80367e38364d526541ed12dfd665db1f5e76.
New artifact hashes and executable validation are recorded separately in
evidence/markov-098a5a66/.

## Coverage proof

`weighted_coverage_098` works for any frame satisfying `FrameIndices`.
Given positive coprime weights x,y on the low and high endpoint vectors,
it produces a finite path whose middle vector is their weighted sum.
The proof uses strong induction on x+y. If x<y, take the right branch and
replace weights by x,y-x. If y<x, take the left branch and replace weights by
x-y,y. Positivity, coprimality and strict decrease are proved in Lean.
If x=y, coprimality forces x=y=1, so the empty path gives the mediant.

`rational_coverage_098` applies this to the initial endpoints (0,1),(1,1)
with weights b-a,a. The hypotheses 0<a<b guarantee positive weights and
coprimality of a,b supplies their coprimality. The weighted vector is exactly
(a,b). Thus this theorem covers all reduced interior rationals without a
denominator bound, approximate arithmetic or an equality only of ratios.

## Uniqueness proof design and local validation scope

`pathWeights098` assigns (1,1) to the empty path. A false initial branch sends
tail weights (x,y) to (x+y,y); a true branch sends them to (x,x+y).
Both entries stay positive. Therefore comparison of the two entries recovers
whether the path is empty, begins false, or begins true, and subtraction
recovers its tail weights. This proves injectivity of the encoding.
`weights_labels_098` connects these weights to the actual `foldl advance`
labels for all invariant frames, including their polynomial fields unchanged.
For the initial frame the label is (y,x+y), which determines both weights.
The resulting `rational_unique_098` combines path injectivity with coverage.
`rational_range_098` pairs coverage with inherited `frame_reduced`, identifying
the exact range of middle labels as the positive reduced fractions below one.
The final compilation and kernel replay of both new modules passed. All eight
new declarations have only the permitted axiom closure. Failed attempts are
retained, and the successful receipts are selected in validation.json.

## All root correspondence obligations

* Coverage: the new result is universal existence and uniqueness of the finite
  path with each exact reduced interior label.
* Source family: the theorem operates on the exact polynomial-bearing frames,
  but does not prove equality with mutation-generated Laurent polynomials.
  The paper-to-Lean family bridge remains open.
* Homogeneity and coefficients: neither the representation nor coefficient
  extraction is changed. No raw coefficient is rescaled. A formal proof that
  setting w=1 loses no coefficients of the appropriate homogeneous numerator
  remains open.
* Polygon: `InPolygon` is unchanged. Equality of that region with the actual
  Newton polygon is not proved here.
* Directions, zeros and endpoints: `WeakLC` retains every raw coefficient,
  zeros, and all three directions unchanged. These proofs assert no coefficient
  inequality. The interior coverage hypothesis excludes both endpoints;
  Conjecture63 separately includes exactly 0/1 and 1/1. Existing endpoint
  lemmas are `endpoint_zero` and `endpoint_one`, not reproved by this action.
* Assumptions: only ordinary pinned Lean/Mathlib and the existing definitions.
  The successful coverage build and kernel replay use only propext,
  Classical.choice and Quot.sound. The final receipt audits uniqueness as well.
* Proof scope: this discharges the rational indexing gap, not log-concavity.
  Every polynomial inequality and the remaining source bridges must still be
  established before the pinned root can close. There is no independent
  English/source completion audit in this worker's output.

## Reproduction and operational failures

Run `/opt/homebrew/bin/python3 research/validate_coverage_098.py` to freshly
compile the protected root, inherited indices and coverage module into the
new evidence directory, without using project build imports. Then run
`/opt/homebrew/bin/python3 research/check_extra_098.py compile` and use its
`kernel MODULE` mode for the new modules and the two rebuilt dependencies.
These are foreground processes with timeouts. No controller invocation or
package update is involved. Git system/global configuration is disabled.

The first uniqueness compilation failed: the arithmetic tactic treated
`initial` and its expanded frame as different atoms. The source and failure
receipt were preserved. Explicitly unfolding the same constant in both
hypotheses is the correction; no new mathematical assumption was introduced.
Lean's failed-elaboration diagnostic mentions its error placeholder axiom;
that run returned nonzero and is rejected. No placeholder is written in any
proof source or admitted as a result.

The shell heredoc capability failure is recorded in the checkpoint. No scan,
tool result, failed tactic or source retrieval is itself a proof of the root.
