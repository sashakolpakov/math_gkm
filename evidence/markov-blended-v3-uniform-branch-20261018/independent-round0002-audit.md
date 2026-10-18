# Study-0004 round0002: English–Lean source and admission audit

Observed 2026-10-18T21:45:49.322433+00:00. Independent read-only audit of the completed own researcher report and its source-bound files. No proof fixes, source edits, mathematical suggestions, private evaluation/task/answer inspection, compiler/test/model calls or researcher contact.

## Fixed candidate provenance

Study: `/Users/sasha/math_gkm/.scratch/paired-v3-live-20261018-study-0004`.
Own final receipt: `arms/exploration/jobs/round-0002/receipt.json`, SHA256 `0700903f0993d84beb406a2bfd676b8ee99cf883f8a9a111b6deaf712a51dd7b`, outcome completed.

Relevant proof sources match its immutable after inventory:

- Original `MathGKM/Markov.lean`: `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
- Existing coefficient-target definitions: `9b73de0a3ab0d182b6741c03508633c29d000b85c024b3774b338996912427b3`.
- Prior accepted export `MathGKM/Accepted95a4e0482c798d7a5531cd05.lean`: `ccacb12f30f6e3929b372e10423740afce1269a1bef05ddf837d90567235f7ca`.
- `MathGKM/MarkovLeftCoefficients0002.lean`: `7f77a52880bc68e418c0dd9b0084798daabe50bc0e6311310ec6c0aae6012850`.
- `MathGKM/MarkovLeftFormulaLC0002.lean`: `d2218a92ca227536c0ee4030d9e458fabc85d2d15fd9caf4fb6734574041a779`.
- `MathGKM/MarkovLeftWeakLC0002.lean`: `723c945ae37444fa99a91dd47a7869bb74db99e932b4ddd32902e479417c8636`.

At this source-audit snapshot the official round0002 validators had not yet produced FINISHED records. The following is exact candidate correspondence, not admission or trusted axiom-closure approval. The researcher's local compilation/axiom reports remain distinct evidence.

## Candidate1: coefficient formula on every natural input

Submitted identity `markov-leftcoeff0002-coefficient-bridge`, theorem `MathGKM.Markov.LeftBranch0001.coefficient_bridge`.

Exact Lean proposition:

```
∀ n i j : ℕ,
  MathGKM.Markov.coeff (MathGKM.Markov.LeftBranch0001.Q n) i j =
  MathGKM.Markov.LeftBranch0001.rawFormula n i j
```

English: for every natural polynomial index n and every pair of natural coefficient indices i,j, the raw coefficient of U^i V^j in Q(n) is given by the following piecewise INTEGER formula:

- If i=0, it is 1 when j=n, and 0 otherwise.
- If i>0 and i+j≤n, it is `choose(i+j,j) * choose(n-j-1,i-1)`, with each natural binomial coefficient cast to ℤ before multiplication.
- If i>0 and i+j>n, it is 0.

All subtractions in binomial arguments are Lean natural truncated subtraction; the positive-i support condition protects the in-support formula's ordinary meaning. There is no positivity assumption on n, no bound such as n≤80, no interior-only condition and no omitted boundary/zero case. Q(0)=1 and Q(1)=U+V are included. The i=0 line and outside-total-degree zeros are explicit. The degree boundary i+j=n is included in the binomial case, rather than discarded. This is a coefficient formula for the previously defined Q sequence; original path membership is provided by the separately accepted structural bridge, not by silently changing the original coefficient definition.

Original coefficient convention remains `(P.coeff i).coeff j`, with outer variable U and inner variable V, over integer polynomials, original third squared variable set to1. There is no factorial/binomial normalization of coefficients and no index swap. The source proves universal coefficient recurrences and their formula analogues, then uses two-step induction with n=0 and n=1 base cases. The source does not postulate a new coefficient identity or retain the former bridge as a premise.

Classification if admitted: unbounded exact coefficient description, not by itself a log-concavity theorem or full rational-path result.

## Candidate2: formula log-concavity in all three original directions

Submitted identity `markov-leftcoeff0002-formula-weakLC`, theorem `MathGKM.Markov.LeftBranch0001.formula_weakLC`, with exact type the EXISTING `FormulaWeakLC`.

English: for every natural n≥1, and every natural i,j for which all three points of a respective lattice triple belong to the original polygon with labels (1,n), the INTEGER formula values satisfy first×last≤middle² in each of these directions:

1. `(i,j), (i+1,j), (i+2,j)`.
2. `(i,j), (i,j+1), (i,j+2)`.
3. `(i,j+2), (i+1,j+1), (i+2,j)`.

For this label the original polygon means `n ≤ n*i+j` and `i+j ≤ n`. ALL original polygon premises are retained. There are no additional coefficient-positivity assumptions, excluded zeros or boundaries, large-index threshold, strict inequality or normalization. The formula-LC source proves its arithmetic ingredients and explicitly resolves the diagonal i=0 case; horizontal/vertical uses derive positive i from the unchanged polygon premises rather than adding i≥1 to the public theorem. The helper functions' support assumptions are internal proof obligations, not extra assumptions on FormulaWeakLC. The source comment about a bounded research attempt is a time-budget description, not a bound on n or theorem scope.

The earlier round0001 conditional lemma required BOTH CoefficientBridge and FormulaWeakLC. Here this candidate supplies the second antecedent as a theorem; it does not merely restate that antecedent, invoke an unproved ratio-to-coefficient bridge or cite the previous unadmitted rational-inequality candidate. The source imports its new coefficient proof, not MarkovLeftRatios0001.

Classification if admitted: unbounded LC of the explicit formula, using the original complete polygon convention. Its transport to original Q polynomials is separate and explicit in Candidate3.

## Candidate3: original WeakLC for every all-false path

Submitted identity `markov-leftcoeff0002-all-false-weakLC`, theorem `MathGKM.Markov.LeftBranch0001.all_false_weakLC`.

Exact Lean proposition:

```
∀ k : ℕ,
  let m := (MathGKM.Markov.frame (List.replicate k false)).mid
  MathGKM.Markov.WeakLC m.a m.b m.p
```

English: for EVERY natural k, including zero, take the midpoint of the ORIGINAL pinned frame after k false moves. Its ORIGINAL raw coefficients satisfy the ORIGINAL complete WeakLC predicate in all three directions. This covers labels (1,k+2), hence every denominator k+2 in that all-left path family, with no finite cutoff or additional condition on coefficients/indices. It is an unbounded family theorem candidate, not a numerical sample or one finite 1/3 case.

Actual source composition is explicit:

- `restricted_weakLC : RestrictedWeakLC` is proved by `coefficient_targets_suffice coefficient_bridge formula_weakLC`. Thus neither former conditional antecedent remains an assumption of the resulting helper theorem.
- `all_false_weakLC` applies `Accepted95a4e0482c798d7a5531cd05.obligation k`, rewrites all three midpoint label/polynomial equalities from that EXISTING accepted export, and applies `restricted_weakLC (k+2)` with its proved positive-index fact.

This is actual prior-lemma use in the source, not an inference from importing Q or the bridge module. The accepted export's source hash is unchanged from its independently admitted record. A future successful trusted closure inspection is still needed to certify this actual dependency through the official gate. The submissions omit explicit `dependencies`/`required_constants`; therefore no mandatory-use request or automatic delayed-use ledger edge should be invented from metadata alone. If its final checked closure contains the accepted obligation, that is valid observed declaration reuse despite the empty requested dependency list.

## Root and coverage limits

The original full root also requires the separately specified endpoint obligations and WeakLC for EVERY Boolean path, including paths with true moves and mixtures. Candidate3 quantifies only `List.replicate k false`; it does not replace that quantifier with arbitrary paths or show full Conjecture63. The source's `restricted_weakLC` helper covers Q(n) for n≥1, but no new full-root proof is submitted. There is no changed WeakLC predicate, changed root, assumption of the desired family result, or numerical bound hidden in these public types.

Independent equivalence with the published Evans–Veselov–Winn polynomial family and mathematical novelty remain outside this source/type audit. No new axioms, proof placeholders or theorem assumptions are apparent in the fixed proof sources; actual standard-axiom closure must be taken from completed trusted validators, not local self-report. No full-root or self-improvement/model-refinement certification is inferred.

## Admission status

PENDING at this initial source audit. Only the prior round0001 structural bridge was main accepted knowledge. Append actual FINISHED/result/catalog/source bindings, exact capacity failures and committed accepted-state membership as official checks complete; never relabel local compilation as admission.

## Official Candidate1 result: capacity failure, not admission

Observed 2026-10-18T21:49:34.143542+00:00. Finished attempt:
`arms/exploration/rounds/0002/checks/math/0-7bba8ce9dbf542744415a269496d69326d7032e3113f94c966284cb3c6c4dc4a/307236e2bc8ddb5e70bc2e24a528846bff6614f0ddf6d9eec653822bbf7d4b02`.

Result SHA256 `5d666b2b71792fd2c69b3f764492141fd948789f3165e6da01ed78e65746e51f`.
FINISHED SHA256 `e4436c5433bb228497648995cac4c18ce343f5de21132a82910254683314112e`.
All 15 FINISHED-bound files independently stream-hashed and verified. Original root, left-branch definition, target definitions and new coefficient-proof source copies match the completed own receipt hashes listed above.

Six fresh compilations, six independent kernel replays and the trusted-inspector process returned zero. However the complete generated declaration artifact is 169,111,686 bytes, exceeding the 33,554,432-byte parser limit by 135,557,254 bytes. Artifact SHA256 `9c122b24291d2ee3aa28ca7539819b33e6b9a025e088e1c18b32b7b1500ffa9a`. It was hashed in64KiB blocks, not loaded as JSON. The official result is checked=false/status=invalid_comparison/failure='malformed or oversized inspector artifact', elapsed261.4250312920012seconds. The FINISHED bundle remains below its separate256MiB cap and exists; a FINISHED failed check is not an admission.

This is the same operational reporting/inspection-capacity boundary seen earlier, not evidence that the universal coefficient proof failed elaboration or kernel replay. Full parser/premise/source admission did not complete, and no independent gate waiver is inferred from local proof success. The remaining two candidates continue through the unchanged official checks. No source, cap or parser changes or researcher contact by reviewer.

## Independent mathematical proof-status metadata audit, separate from admission

Observed 2026-10-18T21:52:15.406899+00:00. At the parent's explicit request, independently streamed ONLY the trusted finished coefficient-candidate inspector's small axiom metadata. No full catalog JSON load, parser replacement, cap change, compiler/model call or gate override.

Read blocks64KiB; maximum scan window69,632bytes; complete artifact SHA256 reconfirmed `9c122b24291d2ee3aa28ca7539819b33e6b9a025e088e1c18b32b7b1500ffa9a`. Using the known frozen inspector's three-row JSON structure, extracted axiom keys and matching row-end declaration names in order. Exactly three summaries occur:

- StudyObligation: [Classical.choice, Quot.sound, propext], metadata offset2, row-name offset169110115.
- StudyInterface: [], metadata offset169110144, row-name offset169110547.
- StudyTransport: [], metadata offset169110575, row-name offset169111659.

Their order and non-overlapping row boundaries match the frozen inspector declarations. The real trusted inspector itself returned0 after its guarded full dependency traversal; it would reject an encountered nonstandard axiom. This metadata is actual independently retained process evidence, not the researcher's printout or assertion.

The FINISHED-bound frozen target is exactly foralln,i,j:Nat,coeff(Qn)i,j=rawFormula(n,i,j). Interface and Transport are True, each witnessed byTrue.intro. StudyObligation supplies the actual coefficient_bridge declaration. Combined with six fresh real kernel replays, the source/type/condition audit and exact source hashes, this establishes the presence of completed Lean proof text for the universal coefficient formula under only the recorded standard axioms. It is stronger evidence than self-report or mere local compilation.

Limits: this independent mathematical-status reading does NOT change official checkedfalse or insert the item into accepted main state. It does not complete the full artifact parser, catalog semantic/version validation or remaining object/source/binary/post-inspection checks that the official function skipped after its capacity failure. Those gates remain unchanged and unwaived. It does not supply a coefficient-familyLC proof, fullConjecture63, published-source equivalence or novelty audit. The two other candidate checks retain their own actual outcomes; no success is inferred for them from this formula proof.

## Official Candidate2 result: memory guard infrastructure stop

Observed 2026-10-18T22:01:26.726802+00:00. Finished attempt:
`arms/exploration/rounds/0002/checks/math/1-780b919a4e053d31f957389cb483539da116e41a7d4e55caf5ed3948471066ab/9e6616701b84507639ad91a2c929644db75e185c554700201ab9405530137bf6`.

Result SHA256 `2a8f28d64860422b90cc58df28e318fa8bc184d9a2eb078b8fb115de4f2cc601`.
FINISHED SHA256 `0c038896c63096e105d15125a490fb94d099882a2bfc4db5af593074ec4aedb1`.
All15 FINISHED-bound files independently stream-hashed and verified. Seven fresh compilations and seven independent kernel replays returned0. The trusted inspector then ran approximately497.02seconds before recorded return−9/termination `resource_guard: footprint_sustained`, operationally_incomplete=true. Peak observed charged physical footprint5,110,831,840bytes, peak observed RSS6,339,624,960bytes. The recorded termination cause is the configured sustained4GiB footprint guard, not an emitted proof error, traversal-fuel report, parser-size rejection or wall-budget expiry. Total task elapsed694.4751371250022seconds within its900second allowance. No declarations.json or axiom metadata was emitted.

The actual result fields are checked=false, status='validator_infrastructure_failure', infrastructure_failure=true, failure='trusted premise inspector failed'. This is explicitly classified as infrastructure in contrast to earlier generic invalid_comparison capacity statuses. It remains unadmitted. Successful real kernel replays establish completed proof-text execution under the imported environment, but this item lacks a completed independent trusted premise-closure report; do not infer its axiom arrays from Candidate1, local printouts or source syntax alone. The exact English/predicate source audit above remains applicable to the frozen candidate. No operator/reviewer source change or additional attempt is injected; the third official check continues under the same protocol.

## Official Candidate3 result and committed round0002 outcome

Observed 2026-10-18T22:13:27.688266+00:00. Finished attempt:
`arms/exploration/rounds/0002/checks/math/2-f4c504292ee43a585b4ca428c5001963a87b8d12bd542c478730aed161852432/3e0519f833521b129375ad944a1acd2839d9fc3a714b15e106e6843172476ad1`.

Result SHA256 `750daa9fc6d2b52c4903578abd79c0b1858259e3916991ce87051b3dcb73539d`.
FINISHED SHA256 `4412ef84bff5b2ebe2a0b21311a7c109934ebea53732c0a670f1958c3bc21d2a`.
All18 FINISHED-bound files independently stream-hashed and verified. Ten fresh source compilations and ten independent kernel replays returned0, including originalMarkov, left-branch definition, coefficient-target definitions, new coefficient/formula-LC proofs, the ORIGINAL accepted bridge target, the unchanged accepted export, the new WeakLC consumer, new exact target and StudyCheck. No previous proof object was substituted for the required fresh rebuild/replay.

The previous accepted export's source hash remains `ccacb12f30f6e3929b372e10423740afce1269a1bef05ddf837d90567235f7ca`; the new consumer hash remains `723c945ae37444fa99a91dd47a7869bb74db99e932b4ddd32902e479417c8636`, matching the completed own receipt. Its final wrapper actually supplies all_false_weakLC to the exact frozen target; source proof explicitly applies Accepted95a4e0482c798d7a5531cd05.obligation k and rewrites its equalities. This is real source-level prior-theorem reuse with actual fresh kernel replay of the dependency and consumer, not merely an unused import. No completed full inspector/declaration-closure result or mandatory-use metadata check is inferred.

Trusted inspector ran approximately388.64seconds before return−9/termination `resource_guard: footprint_sustained`, operationally_incomplete=true. Peak observed charged footprint4,847,950,464bytes; peak observed RSS6,571,868,160bytes. Total elapsed715.5637334579988seconds within900secondallowance. No declarations.json/axiom metadata emitted. Actual result checked=false,status='validator_infrastructure_failure',infrastructure_failure=true,failure='trusted premise inspector failed'. The source/type/English mapping passes this review, but full allowed-premise closure cannot be independently approved from a stopped inspector. This does not constitute a mathematical counterexample or a Lean compilation/replay failure.

Top-level main state has committed round0002 and advanced to round3. Its state-envelope canonical hash independently verifies. At this snapshot SHA256 `2a076403f1949c6250272a4230b610a1b84cc38a7907ca537957af6f8d820be8`, accepted knowledge is EXACTLY the prior structural bridge, components0, resolutionNone. None of the three new round0002 candidates was officially admitted. Their actual gate outcomes remain: coefficientformula proof replays and completed standard-axiom inspector metadata but artifact size beyond parser cap; formulaLC and all-false-familyLC proofs freshly replay but inspector stopped by sustained-memory guard before complete closure metadata.

Final mathematical-status boundary: the autonomous researcher produced closed universal coefficient, formula-LC and original all-false-path LC proof text, with actual independent kernel replays and explicit prior accepted-bridge source use. Candidate1 additionally has independently stream-confirmed trusted standard-axiom metadata. Full official acceptance and independent allowed-premise closure for the two LC items remain unavailable because of operational inspection limits. These results are an unbounded numerator-one family, not all paths/fullConjecture63, numerical evidence, publication-family equivalence or a novelty certificate. No premise, boundary or zero-coefficient omission was found in the fixed statement/source correspondence. Reviewer supplied no proof idea, diagnosis feedback, cap/parser change, extra execution or researcher contact.

## Finalized cutoff

Finalized 2026-10-18T22:13:59.636943+00:00. This file is a closed round0002 audit cutoff. No subsequent run outcomes or findings will be appended here; any future audit must use a separate file. No additional Lean execution, proof fix, gate/cap change or machine contact was performed by this reviewer.
