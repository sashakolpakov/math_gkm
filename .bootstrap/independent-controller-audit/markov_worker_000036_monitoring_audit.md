# Independent monitoring audit: worker 000036

Request: `65c4dfb883e140b0a62fddbffe247137`.

Read-only review of the archived worker snapshot, three final Lean modules,
mathematical/correspondence/checkpoint notes, validation records, host receipt,
event tail, and finite-probe scripts/results. The cited primary literature was
checked for the stated relationship. No project changes, mathematical research
instructions, proposer contact, or active-worker interference occurred. No new
Lean build was run.

## Conclusion

All three final modules compiled and completed separate kernel replay before
the host timeout. The results are a general finite Abel transfer, an exact
conditional source implication, and an unbounded-parameter certificate for
one refined horizontal fiber. The universal truncated-fiber inequalities
remain unproved, as do full horizontal Pell log-concavity and the full Markov
conjecture. No substantive English/Lean correspondence defect was found.

## Exact mathematical scope

`tail_weight_nonneg65c4` proves that a finite sequence of signed real terms
with every tail sum nonnegative has a nonnegative weighted sum whenever the
weights start nonnegative and are nondecreasing. The empty and one-term sums
and zero weights are covered. Tail nonnegativity is an explicit hypothesis,
not a proved property of all Markov/Pell summands.

`crossLC_center_weights65c4` proves that products `f(q)f(t-q)` increase toward
the center under the project's full CrossLC hypothesis. Consequently
`centered_weight_nonneg65c4` applies the Abel result to centered signed layers
with a nonnegative CrossLC weight sequence. It does not substitute ordinary
adjacent LC while silently discarding a support/no-gap condition: CrossLC
is required directly, and nonnegativity is separately assumed.

`truncatedFiber65c4` retains only the inherited source-connected horizontal
summands with auxiliary index `q≥r`, inside the fixed finite range. The
cutoff index is not a source polygon coordinate. `truncated_coeff65c4` gives
the exact coefficient with both range and cutoff guards, and
`truncated_gap_coeff65c4` proves the full unsymmetrized convolution identity,
including zero terms.

`TruncatedHorizontalGoal65c4` asks for nonnegative coefficients of every
truncated fiber gap, with the explicit parameter condition `s+2≤n`.
`fiber_of_truncated65c4` obtains the previous untruncated goal by taking
cutoff zero. `source_horizontal_of_truncated65c4` then proves the exact raw
horizontal source inequality for every path with `b=a+1`, retaining the
original endpoint polygon guards. Its first argument remains the unproved
truncated goal. The source identification and transfer are exact; the
required universal auxiliary inequality has not been discharged.

The English centered-layer/truncated-polynomial equivalence is accurately
labeled an elementary derivation rather than a separately completed Lean
equivalence. The formal convolution theorem does not silently upgrade that
derivation or the finite centered-tail tests into a universal proof.

## Concrete and unbounded single-fiber results

For `a=3`, horizontal coordinate `j=2`, center excess degree two, and combined
auxiliary index two, Lean checks the signed outer and center layers are
`-15` and `64`. The individual negative layer is not a negative coefficient
or a reversed source inequality. All truncations of this particular fiber
have nonnegative gap coefficients; the total is 49.

The third module generalizes this one fiber to every `a=m+3`, `m≥0`, keeping
`j=2`, center excess two, and combined index two fixed. If `O(m)` and `C(m)`
are its outer and center layers, it proves

```
2(O(m)+C(m)) = 31m^4+199m^3+435m^2+365m+98.
```

The center layer is nonnegative by the already proved individual-summand
inequality. Hence both centered tails are nonnegative for all `m`. For real
`x,z≥0` and `xz≤y²`, the module also proves `O(m)xz+C(m)y²≥0`. The statement
does not require `y≥0`, since only its square occurs. This includes the
nonnegative log-concave three-weight case described in the comments.

This is an unbounded refined-fiber theorem, not a theorem for all combined
indices, all excess degrees, or all source rows. The relevant raw row had
already been covered by inherited results; this round proves a stronger
auxiliary comparison for one fiber, not a new complete source-direction
result.

## Literature correspondence

[Wang–Yeh, Log-concavity and LC-positivity, Lemma 2.1 and Section 2](https://arxiv.org/html/math/0504164v7)
give the stated finite Abel principle and centered coefficient interpretation
of truncated arrays. The new general theorem proves its nonnegativity
consequence, including degenerate finite lengths. Their framework still
requires the relevant tail inequalities. No result in the audited code
proves those hypotheses for the full Pell array or imports them as axioms.

[Chen–Sun, Log-concavity and unimodality of cluster monomials in fan coordinates
of type A_n](https://arxiv.org/html/2610.09312v1) treats laminar interval
products and the particular exponent map
`(k1,...,k(n+1)) ↦ (k1+k2,...,kn+k(n+1))` for fan coordinates. The worker
correctly reports that it has not identified the pinned Markov fibers with
that setting. No application or general Markov theorem is claimed.

## Finite evidence

The inspected exact probe covers `a=3,...,35`, the reported coordinate/excess
ranges, and 286,187 nonzero fibers. It retains zero layers when testing tail
sums and removes zeros only for the separate sign-order statistic. The
recorded larger probe has seed 6504, 1,500 trials, 703 nonzero fibers, and
largest sampled parameter 499. Neither reports a tested failure.

The rational polynomial experiment covers excess indices one through eight,
combined indices zero through 18, and 19,080 centered tails after the stated
shift `a=s+k+1+X`. The script tests ordinary polynomial coefficients, not
normalized source coefficients. Its finite parameter ranges and the excluded
smaller-a region remain explicit. None of these experimental records proves
universal tail positivity or the truncated goal.

## Recorded verification and interruption

| Module | Final source SHA256 |
| --- | --- |
| MarkovAbel65c4 | `c2b2cc87d1da49be68a3e298daafdbeca19858151165a23bab4267a357e9080b` |
| MarkovTruncatedFiber65c4 | `5de11ade106c4aed11263dd9f87e04552bbf53fe440f316fcbd66eeb1714e65d` |
| MarkovFiberPolynomial65c4 | `2fa30b189b50edb4e5cac64fb47a24cc17ad1f51d21f6c53ce45954bc999710a` |

All final source hashes match the archived snapshot, current source,
validation manifest, and host change receipt. The three build receipts and
three separate Lean 4.32.2 `leanchecker` receipts return zero, bind the exact
source hashes, and themselves match the archived host hashes. All ten printed
theorem closures contain only `propext`, `Classical.choice`, and `Quot.sound`;
the manifest's axiom-output fields exactly match the successful build output.

Abel replay completed at approximately 14:48:13.121 UTC. The last two replays
completed at approximately 14:52:42.84 UTC, before the host timeout at
14:53:19.159 UTC on 14 October 2026. The archived event tail records successful
finalization and a subsequent successful check of the saved report and all
three build/replay records. The timeout does not erase these completed
mathematical checks or turn them into merely compiled statements.

Four earlier failed elaborations are retained: two Abel drafts and two
TruncatedFiber drafts. They are not accepted proof evidence. Verification
reuses inherited compiled imports and is not a fresh whole-source dependency
rebuild. The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
No full conjecture proof or refutation has been established.
