# Independent monitoring audit: worker 000010

Read-only review, 14 October 2026, request `f80fb8bcebd0420782ff3305c88ecadb`. Snapshot: `/Users/sasha/math_gkm/.control/markov/workers/000010/artifacts`. Reviewed the five final `Markov*F80.lean` modules, correspondence/checkpoint, partition-model note, final report, and `evidence/markov-f80fb8bc/validation-1791940248424180000.json`. No project edits, proposer contact, research advice, or interference with active worker 000011.

## Finding

The exact raw numerator representations and the balanced-word obstruction agree with their stated meanings. They provide a new checked representation and eliminate an enlarged candidate family; they prove no new universal coefficient inequalities for the actual source family. The protected Conjecture 6.3 remains unresolved. No substantive English/Lean mismatch was found, with the formal scope qualifications below.

## Ordered gaps and source coefficients

The new factorization B=AC is literal equality of the inherited raw polynomial matrices. Here A=H+diag(0,1), C=H+diag(1,0), H=[[v,1],[uv,u]]. `expand80` replaces each original B by AC, retaining order. `rawWord_pairs80` connects concatenation of the original source words to the exact paired Farey products; no arbitrary-word condition substitutes for that source identity.

`source_gas80` proves, for every finite source path, existence of a core word of length a+b−2 whose scalar `(v,1) product(core) (1,u)^T` equals the literal pinned numerator. The proof constructs this core from the source pair and removes only the verified initial A and final C. The variable t marks diagonal-projector choices; the source equality uses t=1. The general renewal identity is valid over every commutative ring for arbitrary core words and arbitrary t.

`gasCuts80` recursively enumerates both choices at every site as an ordered list of gaps. It uses list concatenation and mapping, not a set or deduplication. `gasCuts_length80` proves exactly 2^core.length entries, including zero-weight masks. Distinct contributions with the same resulting polynomial are still counted separately. `gasRow_cuts80` proves the complete weighted sum by induction, and `source_cuts80` transfers it to every source numerator.

At t=1 an empty gap contributes u+v; a nonempty all-A gap contributes u; a nonempty all-C gap contributes v; a mixed gap contributes zero. `cut_term80` proves that every mask weight is exactly zero or a term u^p v^q (u+v)^e. `source_block_coeff80` then gives one finite list of these terms whose coefficient sum equals the actual raw coefficient for every natural pair i,j. It has no support, denominator or path-length restriction, and does not discard zeros or normalize coefficients.

Formal granularity matters: the all-index theorem expresses the sum using literal coefficient extraction from the shifted-binomial polynomials. `block_binomial_coeff80` separately proves the on-diagonal closed form: if i+j=e, the coefficient at (i+p,j+q) equals choose(e,i). There is no separate new theorem displaying the full piecewise numerical formula for off-diagonal indices; these indices remain covered by the exact polynomial-coefficient sum. This does not invalidate the reported representation. The document also explicitly identifies its t-degree counting identity as a combinatorial deduction, not a proved general-t source theorem. The inherited homogeneous source result remains the formal bridge for the omitted w exponent.

These are existential source representations with constructive witnesses in their proofs. They do not claim that every arbitrary core or arbitrary list of binomial terms is a source polynomial. Log-concavity of individual binomial terms is not asserted to imply log-concavity of their sum.

## What the obstruction actually proves

`Balanced80` compares the counts of B in all contiguous subwords of equal length, with valid starting-position and length bounds. Its finite quantifiers cover all lengths 0 through the whole word. `badWord80` is ABAAAAB. The checked theorem proves its balance, coprimality of B-count 2 and total length 7, and failure of `GlobalLC18` for the upper-right entry of this word's raw matrix product.

`badWord_coeff80` explicitly proves coefficients 6,8,12 at (1,4),(1,5),(1,6). Thus the vertical inequality would require 72≤64. The proof expands the exact integer polynomial and uses ordinary kernel computation, without a numerical approximation or `native_decide`.

This word starts A and ends B but is not the canonical source word at 2/7. `actual_two_sevenths_word80` computes the source word on path LLR as AAABAAB. The source-versus-obstruction coefficient comparison is recorded as a separate finite experiment, not as an additional printed Lean theorem. I independently recomputed both matrix products with exact integer sparse-polynomial arithmetic: ABAAAAB gives [6,8,12], AAABAAB gives [4,8,12], and the latter satisfies 48≤64. I also independently checked the finite balance condition, coprimality, and LLR's index 2/7. All three points belong to that index's polygon.

Accordingly this is a genuine obstruction to balance plus coprimality and boundary letters as a sufficient replacement for the source word restriction. It is not a source counterexample and cannot be used as a refutation of Conjecture 6.3. The additional circular-word and summand-synchronization failures remain experiments, not new Lean claims.

## Matching verification evidence

The worker completed after approximately 1106.60 seconds. Each final source hash matches its archived bytes, the manifest and the controller's recorded artifact hash. Each corresponding successful receipt matches the archived receipt hash and the same source hash:

| Module | Source SHA-256 | Build receipt | Replay receipt |
|---|---|---|---|
| MarkovGasF80 | `062d482403817d7f9219f7220ab227f26f71e9d74b3df7197711fb51e98d1bbc` | `run-1791939672618633000.json` | `run-1791939730750133000.json` |
| MarkovRenewalF80 | `983f0d21ad5467b506a5149d82abe136c8f1d55e95b3dfd4b29ca3a1f4595bba` | `run-1791939851590497000.json` | `run-1791939872260664000.json` |
| MarkovCutsF80 | `b1b71a0c6e51d6107a6754d9baf62f9276f4b31c6023ad69df3c7521ccd6939a` | `run-1791939953736742000.json` | `run-1791940031369624000.json` |
| MarkovBlocksF80 | `79b2d9f0629658c355f6fb83858bb543a27a2794f1af7ca333bb2e850b0d2961` | `run-1791940194038637000.json` | `run-1791940226388526000.json` |
| MarkovObstructionF80 | `1bb4c8a9a06f442ceb93401fbb34ed47a8e888d17a4669c734cb981523924154` | `run-1791940030183287000.json` | `run-1791940141375809000.json` |

All receipts are under `evidence/markov-f80fb8bc/` and record successful compilation or `leanchecker` replay. Seven printed theorem closures use only `propext`, `Classical.choice`, `Quot.sound`, or a subset. Six rejected earlier compilations have exit code 1 and are separately retained. The root source still hashes to `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected recorded Lean verification against inherited compiled project imports; it did not independently rebuild the entire source dependency graph. The manifest records imported binary hashes and correctly avoids an independent completion claim.

The larger 489-source-fraction scan and 41-fraction mask comparison remain finite machine-recorded evidence. Apart from the small obstruction/source calculation described above, I did not rerun these experiments. Historical novelty is not assessed. This monitoring note is not a full-root proof/refutation certificate.
