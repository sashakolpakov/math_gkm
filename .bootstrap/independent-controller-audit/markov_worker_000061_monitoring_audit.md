# Independent monitoring audit: worker 000061

Request `9c20fccd3a9f4f1c9c9c9f443ef6f04b`. Read-only review of the archived sources, evidence, mathematical notes and events, together with matching current project files and the relevant inherited degree definitions. No project edits, proposer contact, mathematical guidance, fresh compilation, replay, or experiment reruns were performed.

## Finding

The new universal result is an actual aggregation theorem: **every fixed-degree one-cut layer of every finite Boolean word has log-concave ordinary coefficients**, at every natural index. Integer transport and exact extraction from the source degree-marked expression are proved. Empty layers, degrees zero and one, and coefficients beyond the degree are covered.

This does not establish summation over different degrees or arbitrary higher-cut layers. The two higher-cut obstruction examples correctly concern stronger auxiliary properties inside actual sources, not the original source sums. All five final modules compiled and completed matching successful direct kernel replay. No substantive English–Lean mismatch was found; the full conjecture remains unresolved.

## Exact theorem and source meaning

The inherited `degreeLayer07a7 y w s d` filters the exact `s`-cut mask list for masks whose `maskDegree07a7 1 m` equals `d`, then sums their unchanged polynomial weights. Distinct masks with equal weights remain separate terms. The inherited theorem `mask_natDegree07a7` proves that the combinatorial degree is exactly the polynomial's natural degree; it is not an assumed upper bound or a fitted statistic. Every mask polynomial is nonzero, as its constant coefficient is one.

`single_degree_layer_lc9c20` states, for **every** finite Boolean word `w` and naturals `d,k`,

`coeff(G_w(1,d),k)*coeff(G_w(1,d),k+2) ≤ coeff(G_w(1,d),k+1)^2`.

The cut count is exactly one. There is no source-membership premise, no degree or word-length bound, and no restriction to positive coefficients. The theorem applies in particular to the actual extended central word of every source path.

`single_degree_layer_integer_lc9c20` transports the result to literal integer polynomial coefficients by a proved polynomial ring map and its coefficient identity. `source_single_marked_layer_lc9c20` proves the same inequality for the coefficient of the auxiliary degree marker in the exact source one-cut expression. This extraction uses `degreeCoeff_layer07a7`; it does not normalize the coefficients.

The marker records individual mask degree. It is **not** the manuscript's omitted homogeneous coordinate. The inherited `source_degreeCoeff07a7` identifies the complete raw source coefficient only after forgetting the marker, with the natural-index condition `i+j=a+s`. The new source theorem concerns one degree layer of that expression. It must not be described as the whole raw source slice or a new full direction of Conjecture 6.3. The already proved source lower diagonals remain inherited results.

## Aggregation argument, cases, and multiplicities

`mask_noCuts9c20` proves that a mask with no selected cuts contributes its terminal state `q`. For a mask with exactly one selected cut, `mask_one_gap9c20` then identifies its weight as a preceding gap weight times the selected-letter factor, which is either 1 or `1+X`; all later skipped letters contribute one.

The inherited gap classification gives two families:

`R_n=1+2X+...+2X^n`, and `P_n=R_n+X^(n+1)`.

The new degree lemmas prove their exact degrees, including `R_0=1` and `P_0=1+X`, and prove multiplication by `1+X` raises the degree by one when the polynomial is nonzero. For `d≥2`, this classifies every degree-`d` one-cut term into exactly the four permitted shapes:

`R_d`, `P_(d-1)`, `(1+X)R_(d-1)`, `(1+X)P_(d-2)`.

`singleMaskSum_shape9c20` applies to **any finite list** of one-cut masks of common degree and expresses its sum as a mixture of these four shapes with nonnegative parameters. The induction increments a parameter for every list entry, preserving duplicates and actual multiplicities. It does not infer sum log-concavity merely from the log-concavity of the summands.

For arbitrary nonnegative real mixture parameters, `mixture_logConcave9c20` proves all adjacent inequalities by the exact coefficient formula and nonnegative quadratic expressions. Degree two has its own explicit coefficient formula and proof, rather than using the degree-at-least-three plateau formula outside its range. For degree zero or one, the main theorem proves the coefficient at `k+2` vanishes term by term and reduces the inequality to nonnegativity of a square. An empty filtered list yields the zero polynomial. All natural indices beyond the polynomial degree are included, and there is no division by a coefficient or assumption of real-rootedness.

The all-zero word, the empty word, absent degree layers, and zero-length skipped gaps require no additional hypotheses. In particular the empty word has no one-cut masks, so every such layer is zero. The natural subtraction in the four-shape classification is used under `d≥2`; low degrees are handled separately.

This proves closure for the specified one-cut degree layers. It does not imply closure after mixing different degrees, nor a corresponding unrestricted statement for three-cut or general higher-cut layers. Horizontal and vertical raw comparisons also change the cut count, unlike this fixed-cut layer inequality.

## Higher-cut obstruction at source 17/18

The actual path is `replicate 16 true`, with labels proved to be `17/18`. Its extended word has seventeen true letters. The two masks select sites `{0,1,16}` and `{3,9,16}`, using zero-based positions. `sameDegree_source9c20` proves both masks belong to the exact source three-cut list and both have degree 20.

The complete polynomial identities are proved over arbitrary commutative rings. At coefficient indices 5,6,7 their triples are `[63,64,64]` and `[423,648,887]`; Lean proves their mixed expression is

`2*64*648-63*887-423*64 = -9`.

This is a failure of pairwise mixed-gap nonnegativity even with equal cut count and degree. It is not a failure of the full source slice or a claim that the sum of the two terms fails log-concavity.

`full_source_still_lc9c20` separately proves the original polygon guards at `(15,5),(14,6),(13,7)` and the raw source inequality, using the inherited entire Pell diagonal theorem. It proves the inequality, **not** the numerical values `[168840,221200,259800]` or their gap `5064808000`; those remain exact finite experimental records, independently cross-checked by the worker's literal numerator recurrence.

## Reweighting obstruction at source 21/22

The actual path is `replicate 20 true`, with labels `21/22`. Two masks selecting `{0,1,20}` and `{6,13,20}` are proved members of the exact three-cut source list and have degree 24. Their coefficient triples at indices 6,7,8 are `[64,64,64]` and `[688,1005,1365]`. The theorem `weighted_sameDegree_failure9c20` proves that **the auxiliary polynomial `26*p+q`** has coefficients `[2352,2669,3029]` and gap `-647`.

The weights 26 and 1 are intentional nonnegative reweighting of two selected masks. They are not claimed to be the multiplicities of the full source layer, which retains every eligible mask exactly as specified by its enumeration. The witness therefore refutes unrestricted nonnegative reweighting closure in that equal-degree, equal-cut family, while leaving the original layer's sum unresolved.

`weighted_source_raw_lc9c20` separately proves the full raw source triple at `(18,6),(17,7),(16,8)` satisfies all three original polygon guards and log-concavity. As in the other example, the exact full-source values `[508560,630648,725568]` and gap `28722037824` are experimental values, not constants asserted by this Lean theorem. No pinned coefficient inequality is reversed in either example.

## Matching verification evidence

All five final source hashes agree among current files, archived worker sources, host change receipts, and the final artifact manifest. Selected successful compilation and replay records, their saved source snapshots, and the compiled objects agree as well: 30 source/record/snapshot/object bindings were checked. The 11 printed theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`.

| Module | Final source SHA-256 | Compilation and direct replay |
|---|---|---|
| MarkovGapMixture9c20 | `7cb754dd2579a66f6e6f7fa92bb4dd821aee2cc15fba30023b15cafbf726a35f` | Both passed |
| MarkovSingleLayer9c20 | `ec1674872af555f5386ebb38ee04e0cb0f46ba7bf7de8d3c12dd37aa1346cdde` | Both passed |
| MarkovSingleLayerInteger9c20 | `6816eb7197b9c6b5ce9d0437cf030d57d4ac2874dd6481c6d22394b5937edf1b` | Both passed |
| MarkovSameDegreeObstruction9c20 | `138f9444e8b987fbfb0949050f7340c83c752b04143ef70e6e2823341ca1e0e0` | Both passed |
| MarkovWeightedDegree9c20 | `7180128f353a9b99198f56e75662fa4a4e59a777ad698757fae80a9567a0bd5a` | Both passed |

The main real-valued layer replay, `run-MarkovSingleLayer9c20-replay-1792018534331446000.json`, completed after 152.987 seconds at **2026-10-14 22:58:07.318631 UTC**. The weighted-obstruction replay also completed at approximately 22:58:07 UTC. The last replay, `run-MarkovSingleLayerInteger9c20-replay-1792018694698628000.json`, returned code 0 after 65.540836 seconds at **22:59:20.239464 UTC**. The host completed normally at **23:00:10.593447 UTC**, after 988.1755 seconds, with a final report and `mathematical_resolution:false`.

The final archived manifest and mathematical/checkpoint/report documents match current files and the host hashes. Archived finalizer event 107 records all five compilations and all five replays successful; subsequent final artifact verification reports 73 hashes without mismatch. There are no current-only later replay receipts. Fifteen validation attempts comprise ten successes and five rejected compilations; no validation timeout is being upgraded to a successful replay.

The protected root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; canonical goal SHA-256 remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. These were recomputed. The worker reused inherited compiled imports. This audit inspected matching recorded checks and did not independently rebuild or replay the entire inherited development.

## Finite experiments and remaining scope

`degree-limited.json` records 108,097 layer inequalities on 84 structured/seeded word inputs, using seed 920 and cut counts at most five. These include auxiliary words not asserted to be source words. `marked-source.json` records 24,803 polygon-guarded marked-diagonal tests on 430 inputs representing **408 distinct source pairs**, again with cut count at most five. The tested condition is coefficient nonnegativity after substituting the marker by `1+t`; no universal marked-gap theorem is proved by these tests.

The truncated-transfer validation records 76,821 explicit masks and 51,811 coefficient comparisons across all 511 words of length at most eight. The same-degree pairwise scan records 1,104,703 tests over 101 source cases before its failure. The two complete raw-source numerical triples are separately recorded from the literal numerator recurrence. These counts and computations were inspected as existing finite evidence, not rerun or treated as universal proofs.

The advance is a universal one-cut degree-layer aggregation theorem with exact integer/source-marker interpretation, together with precise limits on stronger higher-cut assertions. Summing over degrees, the original higher-cut layers, and the remaining three-direction conjecture are still unproved. No novelty or literature-completeness claim is made by this monitoring audit.
