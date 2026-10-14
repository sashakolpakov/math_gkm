# Independent monitoring audit: worker 000013

Read-only review, 14 October 2026, request `02592c7b8f3c40b1a93a75e7a7278494`. Snapshot: `/Users/sasha/math_gkm/.control/markov/workers/000013/artifacts`. Reviewed all six final `Markov*025.lean` modules, checkpoint/correspondence/mathematical note, final report, and `evidence/markov-02592c7b/validation-1791943596785973000.json`. No project edits, proposer contact, mathematical advice or interference with active worker 000014.

## Conclusion

The recorded claims accurately describe checked proof components. The residual CrossLC, smoothing, actual source matrix identities, source block decomposition and explicit single-block jets are proved. The final i=1 source formula remains unassembled, so this round does **not** prove an unconditional new vertical-row inequality, even for source numerators a≥3. The source cases a=1,2 also remain outside the proposed completed transfer. No substantive English/Lean mismatch was found, and neither the root nor its negation is claimed.

## Residual and conditional transfer

`rampSeq025` is a zero-extended real sequence. For 0≤k<q it has coefficient 4(ak+r); at q it has 3(aq+r)−1; at q+1 it has a(q+1)+r−1. `ramp_crossLC025` proves CrossLC for every real a≥3, r≥0 and natural q≥1. It proves nonnegativity, adjacent inequalities and interval positivity before invoking the established adjacent-to-CrossLC implication. Thus no support-gap hypothesis is silently omitted. The q=1 case and the possible initial zero when r=0 are included; neither r<a nor a finite q bound is needed for this inequality theorem.

`rampPoly_coeff025` and `rampPoly_coeffSeq025` identify the literal polynomial coefficients with that sequence. `shifted_ramp_crossLC025` transports CrossLC through arbitrary nonnegative powers of X and X+1, including zero powers, retaining zero extension. This is a universal inequality for the specified residual family, not an assertion that every source row belongs to that family.

`vertical_one_of_formula025` quantifies over a source path and natural representation parameters a,b,q,r, assumes a≥3, q≥1 and the exact equality between the actual mapped coefficient polynomial [u]P and X^(b−q)(X+1)^(a−3) times that residual, and concludes the raw integer vertical inequality at every natural j. The equality premise is explicit and remains unproved for general source paths in these modules.

In particular, this conditional theorem does not itself require a and b to equal the source labels or q,r to be quotient/remainder data. They are free representation parameters for the assumed equality. Identifying the intended source parameters and proving that equality are part of the documented outstanding assembly. The conditional transfer is mathematically sound, but it cannot be counted as an unconditional line result.

## Actual source bridges

`sourceMatrix025` is exactly the inherited paired Farey raw matrix product. `sourceMatrix_trace025` and `sourceMatrix_det025` prove its trace and determinant identities for every source path. `sourceMatrix_shape025` proves the required constant-coefficient matrix shape by connecting the actual source matrix to a word ending in B.

`columnJet_mul025` proves the additive first-coefficient identity under the explicit matrix-shape hypotheses; `columnJet_scaled_mul025` gives its cleared scalar form. These are polynomial identities rather than inequalities or approximate expansions.

`source_vertical_jet025` proves the actual source identity

    (v+1)^2 [u]P = K(M) − [u^0]M_11,

where K(M)=(v+1)[u]M_11+[u]M_21, for every source path with numerator a≥2. The determinant first coefficient vanishes under that explicit a≥2 condition. The nonzero constant coefficient required for cancellation is proved from the inherited vertical boundary formula. This is a genuine source/raw connection, but it does not yet identify K(M) with the candidate residual expression. Calling this bridge unconditional is appropriate only relative to its stated a≥2 hypothesis; it has no remaining conjectural identity premise.

`source_blocks025` proves an exhaustive disjunction for every path: either the path consists entirely of left steps, or the actual source matrix is the raw word obtained by substituting A^n B and A^(n+1) B into a finite block list containing both block types. The proof derives this from the first right step and the actual Farey concatenation recursion. It does not assert that arbitrary block lists are source words, nor that n+1 has already been formally identified with floor(b/a). The all-left branch remains explicitly separate.

`run_jet025` proves the stated exact first lower-left coefficient and K expression for each individual block A^n B, for every natural n including zero. The formulas use finite ordinary polynomial sums; there is no numerical approximation, coefficient normalization or unproved block recurrence.

The companion document correctly labels the final passage from these block identities to the source formula as unfinished. Formal identification of the relevant block counts and source parameters, the final formula assembly, and the small-numerator cases are not discharged by the accepted declarations reviewed here.

## Matching verification records

The worker completed after approximately 1121.44 seconds. The six final source hashes match the archived bytes, validation manifest and controller-recorded artifact hashes. Each successful compilation/replay receipt matches its archived hash and the same final source hash:

| Module | Source SHA-256 | Build receipt | Replay receipt |
|---|---|---|---|
| MarkovVerticalRamp025 | `b13d772e63a18cf725aa58029edb98c3a53e81f7cb4e47bf8ffb2eb8fe2a618b` | `run-1791942944405657000.json` | `run-1791943198294690000.json` |
| MarkovVerticalPoly025 | `a75c498363aeb3e251fabc8a4ec3fe8109c13e2717353def96819be446aaa855` | `run-1791943096328318000.json` | `run-1791943199480155000.json` |
| MarkovVerticalJet025 | `215cda13b49279b58afcbe7fba3f7814129746a5d0575505fbfb9f873f9220ff` | `run-1791943039296486000.json` | `run-1791943200694146000.json` |
| MarkovVerticalSource025 | `22b2b1a26476462bfa1a81b0f06c5d51c8be6f7e4adc63a3a7935a8674cddadf` | `run-1791943197108037000.json` | `run-1791943334612970000.json` |
| MarkovVerticalBlocks025 | `52bf5c02adb8a8387ee85c0c2d169684af79aa2fa19e9438f7531e3b7604c8b3` | `run-1791943333429622000.json` | `run-1791943378570353000.json` |
| MarkovVerticalRun025 | `d604fa6cc0185d7dfb45b79243abc3f19a0db648f7a96cc431f61e27c0a7a6d6` | `run-1791943492274756000.json` | `run-1791943555333278000.json` |

All receipts are under `evidence/markov-02592c7b/` and exit successfully. Twelve printed theorem closures use only `propext`, `Classical.choice`, `Quot.sound`. Seven earlier rejected compilations each have exit code 1 and are not accepted proof evidence. The root source hash remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

These are inspected recorded named-module builds and kernel replays against inherited compiled imports. This audit did not independently rebuild the complete source graph. The manifest expressly records that limitation and no independent completion audit.

## Remaining scope

The 561-source-fraction check of the candidate formula is finite experimental evidence, not a substitute for the missing formula theorem. The accepted components impose no denominator bound where they are universal, but they do not yet close the first interior vertical line. General other rows/columns/diagonals and the full conjecture remain open. This monitoring note is not a full-root proof/refutation certificate and makes no historical novelty claim.
