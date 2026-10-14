# Independent monitoring audit: worker 000059

Request `fe01d46b39b940a4b22745b021f8d61c`. Read-only review of archived worker sources, mathematical notes, evidence and events, together with matching current files. No project edits, proposer contact, proof guidance, fresh builds, kernel replays, or experiment reruns were performed.

## Finding

The worker proves an exact, universal decomposition of actual source coefficients into explicitly enumerated cut terms. Every individual term has nonnegative coefficients, constant coefficient one, interval support, and coefficient log-concavity at all natural indices. **Log-concavity of the sum remains unproved.** The source decomposition has its exact natural-index premise and does not hide an assumed aggregation inequality.

All eight final modules compiled and completed successful separate kernel replay with matching hashes. The final replay was incorporated into the final archived manifest before normal worker completion. Both obstruction examples have the advertised limited scope: one is a mixed contribution between genuine source summands; the other belongs to an explicitly excluded auxiliary family. Neither refutes Conjecture 6.3.

There is one minor English defect in an agenda sentence, detailed below; no formal statement or proof-scope defect was found.

## Enumeration and source equality

`cutMasksFe01 w s` enumerates selected/skipped masks over a Boolean word `w`. The new theorems establish its length `choose(length(w),s)`, absence of duplicate masks, original-word first components and exactly `s` selected second components, and an exact equality between the sum of mask weights and the inherited cut recursion. Distinct masks having the same polynomial weight remain separate list entries, preserving multiplicity.

For a source path with label `a/b`, `sourceTermsFe01 path s` uses the actual central word followed by the terminal true letter. That word has length `b-1`, so the list contains **choose(b-1,s) terms**. This binomial coefficient is a term count, not a coefficient normalization or an extra multiplier.

For every source path and natural `i,j,s` satisfying `i+j=a+s`, `sourceTerms_coeffFe01` proves

`(A(i,j) : ℝ) = coefficient_j(sum(sourceTermsFe01 path s))`,

where `A(i,j)` is the protected raw integer coefficient. The integer-to-real cast is supplied by an exact polynomial ring map; no factorial, binomial, or position-dependent rescaling is introduced. The integer version is separately established in `source_masks_coeffFe01` through the inherited exact source-cut bridge.

The equality is universal over paths and cut counts and does not require a polygon guard. It is nevertheless expressly an equality on **natural grid indices with `i+j=a+s`**. It does not silently extend the raw grid to negative first indices when `j>a+s`, or represent degrees below `a` by a negative cut count. The notes correctly retain these limits; inherited support results handle lower degrees when needed.

The edge cases are consistent with the exact recurrence and the universal statements. With zero cuts there is one all-skipped mask and its weight is 1. If `s>b-1`, the binomial count is zero and the term list is empty; its sum is zero, consistently with coefficients beyond the source degree when the index equality holds. Individual-term assertions are then vacuous membership statements, while the source sum identity remains meaningful. The empty word and zero-length skipped runs are explicitly covered by the recursive base cases.

## Individual terms: precise property and proof

`toeFe01 p a b` is the upper-triangular Toeplitz coefficient entry: `p.coeff(b-a)` when `a≤b`, and zero otherwise. `PolyPF2Fe01 p` requires nonnegativity of every ordered two-by-two minor. Its natural-index and zero conventions are explicit.

The new finite determinant identity sums products of two-by-two minors over ordered index pairs. `toe_mulFe01` proves the finite matrix product agrees with polynomial multiplication, with a sufficiently large finite range and explicit triangular zero cases. These facts give `polyPF2_mulFe01`. The adjacent minor yields exactly `p_k*p_(k+2)≤p_(k+1)^2`. There is no infinite sum, convergence condition, division, or assumed nonnegativity of individual matrix entries in the general determinant argument. Coefficient nonnegativity for the particular mask polynomials is proved separately.

The gap classification has two explicit families: coefficient lists `[1,2,...,2]` and `[1,2,...,2,1]`. Both are proved to satisfy the full Toeplitz minor condition for every natural run length, including length zero. A reverse-word induction classifies an arbitrary skipped gap into one of them. Every selected site contributes either 1 or `1+X`. Induction over arbitrary masks, using multiplication closure, proves `mask_pf2Fe01`; the source-term theorem follows by membership in the exact list. Thus the individual-term property is proved even for arbitrary Boolean masks, without pretending arbitrary words are source words.

`mask_coeff_nonnegFe01` proves all coefficients nonnegative by the positive recursive operations. `mask_coeff_zeroFe01` proves the constant coefficient equals one. `mask_no_gapsFe01` states that positivity at any natural index `k` implies positivity at every `j≤k`. With finite polynomial support this is an initial interval of positive coefficients. The adjacent inequalities hold at **all natural indices**, including the zero tail, rather than only at nonzero coefficients. Constant-one and gap-free support are not inferred from numerical experiments.

None of these theorems asserts that adding the source terms preserves their minor inequalities or log-concavity. At fixed cut count `s`, varying the coefficient exponent corresponds to the source constant-total-degree direction. Horizontal and vertical raw comparisons also change `s`. No entire remaining direction or root completion is proved here.

## Exact obstruction scopes

For actual source `3/4`, path `[true,true]`, the proof checks membership of two masks with one selected site. Their weights are `p=(1+X)^2` and `q=(1+X)^2*(1+X+X^2)`. The mixed expression at center index 3 is proved to equal

`2*p_3*q_3-p_2*q_4-q_2*p_4 = -1`.

The full source slice is proved to be `3+8X+8X^2+4X^3+X^4`. Its actual raw triple at `(2,2),(1,3),(0,4)` is `[8,4,1]`, with all three original polygon guards and gap `4^2-8*1=8`. Consequently the negative mixed contribution is not a failure of the full source inequality. It refutes the assertion that every pair of these source summands has nonnegative mixed contribution.

The auxiliary central word `[true,false,true,true,true,true,true,true,true,false,true]` is palindromic, has nine true letters and length eleven, and therefore has virtual label `10/13`. The proof establishes coprimality and membership of `(9,2),(8,3),(7,4)` in the corresponding polygon, while its associated raw-word polynomial has coefficients `[28,20,16]`, giving gap `400-448=-48`. The general raw-word coefficient bridge and the explicit slice identity are checked; this is not a sample in which virtual counts are assumed to identify a source.

`guardedBad_not_sourceFe01` proves that this central word differs from the central word of **every source path**, using exact source counts and the inherited mechanical-word identity. The further module checks actual path `[true,true,true,false,false]` has source label `10/13`, with slice `12+29X+28X^2+16X^3+4X^4`. Its raw coefficient at `(8,3)` is 16, versus 20 in the auxiliary polynomial. By source identification, `guardedBad_not_source_polyFe01` excludes equality with the polynomial of every source path **labeled 10/13**. That polynomial exclusion has the stated label hypotheses; it is not a theorem quantifying over arbitrary differently labeled source polynomials without hypotheses.

The auxiliary failure only shows that palindromicity, reduced counts, and these polygon guards are insufficient for an enlarged-family claim. It neither contradicts the original source family nor weakens the pinned target.

## Minor wording issue

The durable report's first agenda entry says that “individual term log-concavity and pairwise compatibility do not suffice.” Read literally as assuming both properties, this is incorrect: nonnegative individual gaps and nonnegative mixed pair contributions do imply a nonnegative total gap. The checked example establishes that pairwise compatibility **fails**, not that it is insufficient when present. The main mathematics note correctly says pairwise synchronization is unavailable on these source terms, and its scope discussion does not use the inaccurate agenda sentence as a premise. This is an English reporting defect, not a defect in the formal results.

## Recorded compilation, replay, and hashes

All final source hashes agree among current files, archived worker sources, host change receipts, and the final artifact manifest. Their selected successful build/replay receipts, saved source snapshots, and compiled objects agree as well: 48 source/record/snapshot/object bindings were checked. The 27 printed theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`.

| Module | Final source SHA-256 | Compilation and direct replay |
|---|---|---|
| MarkovCutMasksFe01 | `c7a336a25642028182fd22df7855d3146242c88b388e5ad060e40157aa4c9090` | Both passed |
| MarkovConvolutionFe01 | `95e803ce8bf78bbf59fe1ac33d6eb83394ba1c3006d0ff38674c290d9c501638` | Both passed |
| MarkovCutTermFe01 | `8aba2537066855aeb0cdbe5f19681f52e520f07dd7b3084d4b147bd091926db5` | Both passed |
| MarkovCutSourceFe01 | `ff2aab7692978e83e5f85cdc806e957a757d198c09683632321a371efb72669e` | Both passed |
| MarkovCutMixFe01 | `928c890c8ce808160a276c5d5b7f1f36697c27b8dc7820c03f77f7c5cf5693c8` | Both passed |
| MarkovGuardedPalindromeFe01 | `2fb0335ffd08164ab2ef9f939611d40528e69edf6a6fba33dd4ce8032f3e7bf2` | Both passed |
| MarkovCutPositiveFe01 | `a5c963f1a2e14096f6383547cd26455c989d2dfb2ef44263edc7ffa5f897f597` | Both passed |
| MarkovGuardedSourceFe01 | `838ad7f296004527707689c4181afc66e98ed1a624b24535f8a6ef5acc55464f` | Both passed |

The main source decomposition replay `run-MarkovCutSourceFe01-replay-1792016120772471000.json` completed at **2026-10-14 22:16:11.511059 UTC**. The positivity/support replay completed at **22:21:45.423306 UTC**. The last replay, `run-MarkovGuardedSourceFe01-replay-1792016520747106000.json`, returned code 0 after 40.763213792 seconds, at **22:22:41.510320 UTC**. This is a completed check, not a pending replay inferred from a draft.

Archived event item 97 records an interim manifest with the last replay unconfirmed. Item 98 then records its successful completion; item 101 updates the notes; item 102 regenerates the final manifest with all eight replays successful; item 103 checks all 81 final artifacts without mismatches. The final manifest and notes match current/archive/host hashes. The host completed normally at **22:23:12.513400 UTC**, after 1130.595 seconds, with a final report and `mathematical_resolution:false`. There are no current-only later replay receipts.

Twenty-three validation attempts comprise sixteen successes—eight compilations and eight replays—and seven rejected compilations. No timed-out validation attempt is present in this worker's records. Rejected elaborations and their placeholder output are excluded from accepted evidence.

The protected root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; canonical goal SHA-256 remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Both were recomputed. The controller contract's raw-file hash also matches the worker's recorded `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`.

Inherited compiled imports were reused. This audit inspected matching recorded checks and did not independently replay Lean or rebuild the entire inherited development.

## Finite evidence and limits

The cut experiment covers the 71 coprime sources with `2≤b≤15`. It compares 252,442 individual mask polynomials against the direct selected-site expansion and checks 2,353,612 adjacent inequalities within their stored coefficient arrays. It records no failures of those two tests. Its pairwise synchronization scan finds the displayed source obstruction after 19 comparisons. The finite checks do not replace the universal Lean proofs, and their interior-array loop should not be described as independent exhaustive testing of every zero-tail index.

The separate aggregation-budget experiment stops after 94 checks at source `5/6`, cut count one, center index three: individual gaps sum to 10, negative mixed contributions have mass 13, positive mixed contributions have mass 19, and the full gap is 16. This is an experiment only, not an additional Lean theorem. The reduced-palindrome experiment tests an enlarged auxiliary family—165 words and 41,961 triples by its final record—and is not a source scan.

The useful progress is a universal decomposition with rigorously controlled individual summands and checked limits on stronger aggregation assertions. Summation and the remaining three-direction conjecture remain open; no new novelty or literature-completeness claim is made.
