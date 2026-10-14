# Independent monitoring audit: worker 000055

Request: `0d052acbcc6844ae8cbc5f5d5f8e5a55`. Read-only review of the preserved worker artifacts and matching final project files. No project changes, research assistance, new builds, kernel replays, or experiment reruns were performed.

## Finding

The principal new result is an unconditional theorem for the **actual raw second lower diagonal of every source Markov polynomial**, subject to the original polygon guards. There is no remaining slope or denominator bound in this theorem. The source theorem's final compilation and separate kernel replay both succeeded and match the preserved source hash.

Seven final modules compiled. Six have matching successful separate kernel replays. The seventh, `MarkovInteriorD052`, compiled and printed a standard axiom closure, but its separate replay timed out. No later successful replay was found. The full conjecture remains unresolved.

## Exact English meaning and source correspondence

Write `a,b,p` for `(frame path).mid` and `A(i,j) = coeff p i j`, the literal integer coefficient, without factorial or binomial normalization. The theorem `source_second_lower_diagonalD052` states that for every finite Boolean source path and natural `i,j`,

`A(i,j+2) * A(i+2,j) ≤ A(i+1,j+1)^2`

provided `i+j+2=a+2` and each of `(i,j+2)`, `(i+1,j+1)`, `(i+2,j)` satisfies the original `InPolygon a b` predicate. Thus the three coefficients have total degree **a+2**; the anchor condition is `i+j=a`, not `i+j=a+2`. The theorem retains all three polygon guards, uses weak rather than strict log-concavity, and does not assert positivity or divide by any coefficient.

The proof partitions every path into an all-true path or a first-false decomposition `replicate n true ++ false :: rest`. The all-true case uses the already proved entire constant-total direction for the Pell source family and the exact source-label identities. The other case uses `source_run_secondD052`, which is stronger: it has the degree equality but no polygon hypotheses, so it covers its natural-index zero cases as well.

For `n≥2`, the actual source coefficient bridge is `source_second_explicitE273`: `2*A(i,j)=secondExplicitE273 n c r j` at total degree `a+2`, where `c=(frame rest).mid.b` and `r=(frame rest).mid.a`. The required `0<r<c` follows from `frame_reduced rest`. This is an exact source identity, not an assumed identification. The factor 2 is uniform and cancels from the quadratic inequality. The cases `n=0,1` invoke the proved actual-source results `source_false_second_diagonal446` and `source_true_false_secondE273`.

## Assembly, transitions, and zeros

`second_explicit_lcD052` proves the explicit sequence inequality for every natural `j`, every `n≥2`, and every natural `0<r<c`. Its case partition is exhaustive:

- The tail starts at `j≥2*n+1`.
- For `n=2,3,4`, the remaining starts are respectively `j≤4,6,8`. The small-run lemmas prove polynomial inequalities for all admissible `c,r`; they are not finite samples of these parameters.
- For `n≥5`, the lower interior is `3≤j` and `j+2≤n`; the upper interior is `n+3≤j` and `j+2≤2*n+2`.
- The remaining starts are exactly `0,1,2,n-1,n,n+1,n+2`, covered by the seven transition inequalities. The final case split uses `omega` to discharge exhaustiveness.

The inherited lower- and upper-shape equalities connect the previously abstract inequalities to the exact explicit coefficient sequence. They clear fixed positive scalar factors, rather than assuming a coefficient formula or dividing by a potentially zero entry. The transition coefficient identities use the actual shifted-binomial formula, and their gap certificates are polynomial identities with nonnegative expressions under the stated parameter bounds. The natural quantity `(2*r-c : ℕ)` and the exceptional two-run correction are retained where they are relevant; there is no hidden assumption that the truncated subtraction vanishes.

The tail identifies the entries at `2*n+1`, `2*n+2`, and `2*n+3` exactly. The last is `8*max(2*r-c,0)+2*[c=2]`; the `c=2` case forces `r=1` and is handled separately. Entries at indices at least `2*n+4` are proved zero. The last nontrivial gap is proved for every `0<r<c`; all subsequent starts have a zero right endpoint and reduce to nonnegativity of a square. This is genuine zero-tail coverage, not a numerical degree cutoff.

The shifted-binomial convention is zero below its shift. The cubic polynomial identity is used only under its checked guard, including its first three zero positions; farther-out entries use the explicit zero lemma. No gap in the range partition or omitted small-run case was found.

## Residual equivalence: checked compilation, replay incomplete

`root_iff_interiorD052 : Conjecture63 ↔ Interior63D052` removes this second lower diagonal from the remaining obligations. Its horizontal and vertical clauses retain the three polygon guards and `i+j+3≤a+b-1`. Its diagonal clause retains the three guards and `i+j+5≤a+b-1`, and now requires `a+3≤i+j+2`. There is no remaining slope disjunction.

The reverse implication uses the inherited exact root equivalence, splits whether the total degree is at least `a+3`, and otherwise obtains total degree exactly `a+2` and invokes the new theorem. The source endpoint clauses remain accounted for through the inherited equivalence. This is a reduction of the full conjecture, not a proof of the residual predicate. The final source compiled successfully, and its printed axiom closure is standard; the separate replay remains incomplete, as detailed below.

## Verification evidence

All seven current final source hashes match the archived worker snapshots, manifest, and host change receipt. Their selected build records, source snapshots, and compiled object hashes agree. All six selected successful replay records also agree with the corresponding final source and artifact. The 11 printed theorem axiom closures are limited to `propext`, `Classical.choice`, and `Quot.sound`.

| Module | Final source SHA-256 | Compilation | Separate replay |
|---|---|---|---|
| MarkovTransitionFormulasD052 | `36a15f9feca341e197198102b59d4f4dc781955855aaa6b4838f1c7157c26417` | Passed | Passed |
| MarkovTransitionGapsD052 | `831a37ca4196e2fe52d09a2abb24e55526436a6ac5fc9906f0eb6922bc0d1b0a` | Passed | Passed |
| MarkovSecondTailD052 | `98025e1cc5ba6a4197d0b9d09a68ce9aa1839666edfe6e9c2376b0bb7864bfc4` | Passed | Passed |
| MarkovSmallRunsD052 | `212fc18e651b1a30f87e0ed759fcd78f6bf6e421c426e411dd7b9870713a8402` | Passed | Passed |
| MarkovSecondAllD052 | `902c06b957351efc0b268ae9b4d18bea93f6de369a4a302f1541e1244d00c2ce` | Passed | Passed |
| MarkovSecondSourceD052 | `e7f9b24f7cb28b674896bd911264be390855af1a35a53b9b92f14d4fa0dcf97c` | Passed | Passed |
| MarkovInteriorD052 | `2ad90fa7419fa7907b7e4891edf385797e4a246240f9b687f6d75268abc66bc6` | Passed | Timed out |

The successful final source replay is `run-MarkovSecondSourceD052-replay-1792011294871786000.json`, completed at **2026-10-14 20:57:22.777029 UTC**. The residual module compiled at **20:57:37.390537 UTC**. Its replay `run-MarkovInteriorD052-replay-1792011465076834000.json` timed out after about 110.36 seconds at **20:59:35.436451 UTC**, with no successful return code. The manifest at **20:59:43.458776 UTC** correctly records seven compiled and six replayed modules. The host worker timed out at **20:59:49.346944 UTC**, after about 1202.58 seconds, and its top-level report field is null; a matching durable report is nevertheless present in the archived artifacts.

The 18 recorded attempts comprise 13 successes (seven compilations, six replays) and five rejected or timed-out attempts. Earlier failed source versions are not substituted for the final files. All recorded attempts ended before the final manifest and host timeout; comparison with the current evidence directory found no late current-only replay receipt. Accordingly, the source theorem's success is durable despite the worker timeout, while the residual replay must not be upgraded from timeout to success.

The pinned root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; canonical goal-contract SHA-256 remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. These were checked. The worker reused inherited compiled imports, as the manifest explicitly states; this audit did not rebuild the entire inherited development.

## Scope and limits

This is substantive progress beyond the earlier slope-restricted second-lower-diagonal theorem: that entire source diagonal is now covered for every source path. It does not prove all diagonal slices or either full horizontal or vertical direction, and it does not resolve Conjecture 6.3. Symbolic certificate generation and any finite scans were not treated as proofs on their own; the claims above rest on the final formal statements and matching recorded checks. No new claim of published novelty was assessed in this monitoring review.
