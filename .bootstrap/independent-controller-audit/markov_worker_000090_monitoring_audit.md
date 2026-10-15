# Independent monitoring audit: worker 000090

Request: `bc8d3b6f136b465a886c6f157ae90136`. Reviewed 2026-10-15. This is a read-only mathematical/source/record audit of completed worker 90. No project code, proof, build, replay, experiment, finalizer, or active successor was executed, modified, completed, or advised. Independent computations were limited to parsing, hashing, and enumerating the recorded finite input/index domains. This is not a fresh audit of the entire published-source correspondence or a historical-novelty claim.

**Finding:** the accepted work proves exact denominator normalization and a raw binomial-sum coefficient formula for the fourth lower slice, for every natural run length and actual predecessor denominator at least five. It closes these representation obligations from worker 89 without assuming the desired coefficient identity. It proves **no new log-concavity region** and makes no root/residual change. The optional pre-shift numerator identification is excluded; the old experimental pre-shift coefficient/gap results therefore remain unconnected to the newly proved factored numerator. No material English/Lean scope mismatch was found.

## Exact source statements

For `n : Nat`, `rest : List Bool`, put

```
path = replicate n true ++ false :: rest,
c = (frame rest).mid.b,  r = (frame rest).mid.a,
(a,b,P) = the middle labels and numerator of frame path,
Q = fourthNumeratorBC (n : ℤ[X]) (X^n) X c r.
```

`source_fourth_clearedBC` assumes only `c≥5` and asserts the following **integer-polynomial identity**:

```
(1−X)^8 · (24 · actual fourth cut polynomial for path) = Q.
```

The cut polynomial is explicitly `cutCoeffA27 (X : ℤ[X]) X 1 (central28 path ++ [true]) 4`. The proof uses the inherited exact source identity, proved normalization of the actual closed expression, and injectivity of the integer-polynomial fraction-field embedding. There is no fitted coefficient, arbitrary-word/source-membership, support, positivity, chamber, or represented-polynomial premise in this final source theorem.

`source_fourth_binomialBC` adds `i,j : Nat` and `i+j=a+4`, and proves

```
24 · coeff P i j = Σ (k=0,…,j) Q.coeff k · choose(7+j−k,7).
```

This is the literal raw integer coefficient, with the common scalar 24 for the whole slice. The formula has no polygon or nonzero-support filter, so natural positions outside the support and zero coefficients are retained. The slice equation still matters: for the raw adapter it bounds `j` by `a+4`; there is no claim about negative `i` or arbitrary positions off this slice. There is no fixed numerical cutoff on `n`, `c`, path length, or the allowed indices. The theorem covers mixed paths of the displayed form; it does not assert a new formula for the pure repeated-right family or the separate root endpoints. The predecessor cases `c=2,3,4` are explicitly outside its scope.

No new inequality or root equivalence occurs in these modules. The inherited `InteriorCore63N6604`, all three principal directions and the original endpoint clauses remain as before. A signed coefficient-sum identity by itself does not establish log-concavity of that sum.

## Normalization is proved, not inferred from experiments

The eighteen run-jet normalization theorems cover coefficients zero through three of all four matrix entries and the additional fourth coefficients of entries 1 and 3. Each quantifies over every `n : Nat` and is proved by algebra from the previously proved exact run jets. Four gauge modules supply eleven normalized entries for each of the four Boolean pairs; the structured module separately proves that the required upper-right first coefficient is one. Thus the missing identity mentioned in a rejected local draft is actually supplied in the accepted proof.

Writing `D=1−X`, the gauge denominators are precisely:

| Entry | Denominator |
| --- | --- |
| a1 | 1 |
| a2 | D³ |
| b2 | D² |
| b3 | 2D⁴ |
| c1 | D³ |
| c2 | D⁵ |
| c3 | 6D⁷ |
| d1 | D² |
| d2 | 2D⁴ |
| d3 | 6D⁶ |
| d4 | 24D⁸ |

These equalities live in `FractionRing ℤ[X]`. The formal nonvanishing of `1−X` is an inherited proved fact, not a numerical evaluation hypothesis imposed on the source. Rational constants are cleared in this characteristic-zero fraction field. No real variable, analytic limit, convergence condition, or claim at a numerically specialized pole enters the final source identity.

`localThird_normalizeBC` and `localFour_normalizeBC` prove the scale identities `D^6 M3local = M3num` and `D^8 M4local = M4num` for all Boolean positions and all natural runs. The numerator definitions and their ring-map laws are polynomial algebra over arbitrary commutative rings; this generality concerns the polynomial expressions, not inversion of denominators in arbitrary rings. The first/second global normalizations prove `D²F=Fnum` and `D⁴S=Snum` with the stated `c≥5` hypothesis. The latter excludes the inherited two-cycle correction. Natural truncated counts such as `2r−c`, `min(c−r,3r−c)` and `3r−2c` remain explicit; no positivity or chamber case is silently assumed.

Generic scaling and ring-map lemmas transport these polynomial numerators through the exact third/fourth Boolean moments. For `c≥5`, the two- and three-cycle corrections vanish by proved arithmetic. Substitution into the inherited fourth-moment formula yields the exact numerator

```
M4num + 6(1+X)^4 D^8 + 4 Fnum M3num
       − 8 Fnum (1+X)^3 D^6 + 3 Snum^2 − 2 Fnum^4.
```

`fourth_normalizeBC` proves this identity for all formal natural `n,c,r` with `c≥5`; source interpretation is then supplied by the actual predecessor path. It requires no additional assumed `r<c` or arbitrary coefficient formula. The final integer-polynomial theorem follows by the injective ring embedding. The new compact numerator is thereby accepted; equality with every earlier expanded experimental representation is not automatically accepted.

## General coefficient extraction

`coeff_of_one_sub_mulBC` and its range-sum form assert, for any `P,Q : ℤ[X]` and `d,j : Nat`,

```
(1−X)^(d+1) P = Q  →
P.coeff j = Σ (k=0,…,j) Q.coeff k · choose(d+j−k,d).
```

They include `d=0`, `j=0`, arbitrary signs, zero polynomials, and indices beyond polynomial degree. The only premise is the displayed cleared identity. The proof maps it into formal power series over ℤ and uses the Mathlib theorem that the series with coefficients `choose(d+k,d)` multiplied by `(1−X)^(d+1)` equals one. Multiplication and coefficient convolution give the antidiagonal sum, then the standard antidiagonal/range equivalence gives the displayed finite sum. Within that range `k≤j`, so natural subtraction is the intended ordinary difference. This is formal algebra, with no analytic convergence or extra nonzero assumption.

The source adapter applies this theorem with `d=7` to the **proved** cleared source identity and the inherited exact source/cut coefficient identity. This removes the earlier need to hypothesize an integer polynomial's equality to the closed fraction before extracting its coefficients. The binomial factors are inverse-series convolution weights; they do not change the definition or normalization of the source coefficients.

## Excluded drafts and finite evidence

`MarkovFourthLowBC` contains a proposed `Z=0` numerator identification, but its attempted build timed out and it has no accepted proof/replay status. The pending/excluded inventory also includes sixteen expanded fourth-local normalization drafts and eight expanded third-local drafts. They are not imported as accepted source identities. The accepted structured assembly proves its own local normalization independently of those failed expanded modules. The saved expanded composite draft is also not accepted evidence.

Consequently, the inherited 411-term low numerator, 202-term coefficient shape, support/truncation statements and nonnegative gap certificates are not yet connected by an accepted theorem to `fourthNumeratorBC`. Nothing here proves a new pre-shift inequality or expands the already proved slope bound. Small predecessor corrections and the remaining fourth/higher/other-direction inequalities retain their own outstanding scopes. The notes state these limitations explicitly.

The finite script and JSON were inspected without executing the research computation. Its exact input domain is all coprime `1≤r<c`, `5≤c≤18`, with `n∈{0,1,4,8,17}`, plus `(n,c,r)=(32,7,2),(64,5,3),(100,7,5),(127,11,7)`. Independent domain/index counting reproduces **484 cases, 15,654 coefficient comparisons, and 14,991 polygon-valid triples**. The four large-run coefficient sets contain 69, 79, 84 and 84 distinct indices after deduplication, combining fixed positions and the seeded random choices. They do not exhaust all coefficients for those cases. Polygon-valid triples are enumerated over the stated slice positions for each selected case.

An evidence distinction matters: these numerical coefficient comparisons read **worker 89's expanded experimental chamber numerators** and compare their binomial extraction against the mechanical-word cut recurrence. They do not independently evaluate the new Lean factored definition, and they do not invoke the original literal bivariate source recurrence. The retained successful experiment supports those finite comparisons; the new source formula is established by its Lean proof. The finite log-concavity checks establish no universal inequality. Candidate JSON tables and successful generation are likewise not substitutes for accepted proof receipts.

## Validation and preservation

The completed separate validation and replay-method notes were read. All **162 controller/current/archive bindings** and **160 manifest entries** match. The final **14 mathematical modules plus Audit** have 15 matching successful builds and one successful 15-target alternate kernel union replay, with each final build preceding that replay. All **100 named theorem closures** are requested and individually printed, using only subsets of `propext`, `Classical.choice`, and `Quot.sound`. The final source formula module is explicitly selected and audited. No missing check was run by this auditor.

There are 35 ordinary build receipts: 15 successes, 15 return-code-1 failures and five wall timeouts. Thus the reported **20 rejected builds includes the five timeouts**. Every success matches a final accepted source; there is no obsolete successful extra. GaugeNorm00 and GaugeNorm10 first time out on their final source hashes, then successfully compile and receive explicit replay coverage. Those earlier timeouts remain rejected attempts. All 25 excluded drafts have no object or successful check; only four were attempted, while the other 21 have no invocation receipt.

The optional `MarkovFourthLowBC` final source hash is `bb2d5cc539adb75f4a33bef74bde413d66f8e02811e705e8376faf5abcea6f6e`. Its build times out after 100.132784 seconds at event 209, **after** successful union event 207 but **before** either finalizer. It was excluded from the accepted inventory throughout. Therefore the successful union is not evidence for this draft, and no unfinished process or late proof is inferred from its source text.

All successful build events record output lengths instead of the output bytes. The full 9,420-character Audit output is saved and hash-bound in its receipt, archive and manifest; its 100 closures are not merely inferred from the event's length. The union receipt and completed event payload agree. Final object hashes are bound by preserved artifacts, not by per-invocation object digest fields.

The unchanged batch driver has SHA-256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The one union takes 20.868387 seconds and selects all new mathematical objects and Audit. There are no direct individual replay receipts or official CLI invocation. The checked source import base has 107 local modules and no new worker-90 target; no source-level target contamination, explicit-name collision or source cycle was found. The selected sources contain 100 explicit theorem declarations and 78 definitions; the method collects selected object constants, including helpers and definitions, rather than only the listed theorem names.

This is **alternate kernel replay over retained compiled imports**. The standard method's unsafe/partial, axiom and already-imported matching-theorem behavior remains qualified in the method note; no source-level target route to such skips was found. Static source imports and names do not enumerate the actual binary import tables or generated/private constant inventory. Invocation-time object hashes, independent per-declaration binary witnesses and a fresh full inherited-source rebuild are absent. These limitations are separate from the directly retained permitted axiom-closure evidence.

Both finalizer invocations succeed: the first indexes 159 artifacts; after documentation updates and addition of the local report, the second indexes 160 and a separate rehash of all 160 succeeds. The **169 preservation** and overlapping **160 initial reconciliation** checks match. Local `evidence/report.json` has wording/list differences from the final response but agrees on request, summary, null completion and substantive scope. Final agent JSON, `final.json` and controller report agree exactly.

Final artifact verification is at **12:50:48.414976 UTC**, 105.373755 seconds before the deadline. The controller successfully completes at **12:51:14.613914 UTC**, elapsed 1720.825182 seconds and 79.174818 seconds before deadline. A final response and turn completion are retained. No late/unarchived file, unmatched started item, unfinished optional process or pending finalizer effect is observed. Root and contract pins are unchanged; mathematical completion is null/false.

Supporting files under the same temporary audit directory:

* `markov_worker_000090_validation_audit.md`: SHA-256 `205a34dbffdb4c0704f79a9537231889cac9373e27ec522167c8f58b8772d1b6`.
* `markov_worker_000090_validation_evidence.json`: `0b2fef38b504d98c33d4c0a38632889c34ce323fb84026373baf39f82d6b0a9b`.
* `markov_worker_000090_replay_method.md`: `d3f57ea51061c72847aa713579b72e1cfccf98e7c5586b7d7136054db3ba556f`.
* `markov_worker_000090_replay_method_evidence.json`: `754befd5fac3db95116d2251e0ab9afde82d81ac1737ba43d653d204c8bc86b7`.

The supporting audit rechecked 611 combined input hashes as unchanged at 13:00:00.448613 UTC. No unresolved validation discrepancy was found.

Selected final source hashes independently read here:

| File | SHA-256 |
| --- | --- |
| `MarkovFourthBinomialBC.lean` | `655ec7d6852c66069d71e2b87af861dfbe1ed0bfffa9d40a39e45725df967fe9` |
| `MarkovBinomialExtractBC.lean` | `5ba0e8d46292c00557d0954b4e73743d908cdcf26562ae6a27d44415f2e55d2d` |
| `MarkovLocalStructuredBC.lean` | `a222ec8b7a8923b9b1228820e02630c49d868edc07c7cb1490ba7d3e45092b08` |
| `MarkovMomentScaleBC.lean` | `ad16a5681675baaa9b168b6afdb733f27ee9d123d9ab27d118c8ea87ffda35a0` |
| `MarkovFirstNormBC.lean` | `e3aa011bdae23e010918adee8734a0a8af84fc192ec70fe15ab857d8d7b9b869` |
| `MarkovSecondNormBC.lean` | `be20e3c29b5f6054fc8f4b3eb5239d3416384e8654b9108e2564df8300916e58` |

The 100 named theorems comprise 18 jet identities, 44 gauge identities, 27 structured coefficient/map/local identities, three moment transports, two first/second normalizations, two extraction lemmas, and four final numerator/source statements. They are not 100 new inequalities or conjecture-level results.

**Disposition:** accept the proved uniform cleared source identity and exact raw binomial-sum expression at their stated scopes, while retaining every outstanding pre-shift identification, inequality, full correspondence and root-completion obligation. No research guidance or repair was provided.
