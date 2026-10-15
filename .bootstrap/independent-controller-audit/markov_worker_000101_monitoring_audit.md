# Independent mathematical audit: worker 000101

Request `00a02b28b63542b5b3888c4b2b6f03ff`. Read-only review of the completed worker's archived mathematical sources, English descriptions, finite experiment domains and retained validation. No proof, Lean, replay, finalizer or research experiment was executed. No project file was changed, no proposer was contacted or assisted, and active worker 103 was not inspected. Worker 102 is a separate history, reviewed in its own note.

## Finding and exact gain

The accepted source theorem is restricted: for an actual run source with `n≥7`, predecessor denominator `c≥5` and **`3r<2c`**, it proves raw fourth-lower-slice log-concavity for every natural starting index **`3n<j≤4n+5`**. The new source coverage is the five starts `j=3n+1,...,3n+5` under that predecessor restriction; the sixth offset and the rest of the terminal interval are inherited. The restriction is on the predecessor ratio `r/c`, not on the final source ratio `a/b`.

The final source theorem has no remaining coefficient-formula, gap, positivity, fitted-count or polygon premise. Zero coefficients are retained. The six additional middle-slice coefficient identities are exact source identities, not additional log-concavity results. The general all-chamber source assembly remains unbuilt, and the proposed new exact root equivalence timed out. Neither may be counted as accepted. The full conjecture is unresolved.

The English mathematics file begins and ends with explicit scope corrections consistent with these facts. Its intervening intended all-chamber construction and residual paragraphs describe unfinished work. Reading those paragraphs without the final qualification would overstate the result.

## Actual raw indices and hypotheses

For `rest : List Bool`, define

```
c = (frame rest).mid.b,   r = (frame rest).mid.a,
path = List.replicate n true ++ false :: rest,
a = (frame path).mid.a = n*c+r,
b = (frame path).mid.b = (n+1)*c+r,
A(i,j) = coeff (frame path).mid.p i j.
```

These are the original raw integer numerator coefficients in the established squared-variable convention, with the third variable set to one. `source_fourth_after_middle_lowM00` assumes natural `n,i,j`, actual `rest`, `7≤n`, `5≤c`, `3r<2c`, `3n<j≤4n+5` and `i+j+2=a+4`, and concludes

```
A(i,j+2) * A(i+2,j) ≤ A(i+1,j+1)^2.
```

The ordered direction `(1,-1)` triple is `((i+2,j),(i+1,j+1),(i,j+2))`. It does not start at `(i,j)`. All three positions have total degree `a+4`. There is no denominator, degree or path-length cutoff, positive-support filter, or nonzero coefficient requirement. Natural indices and the stated degree identity are essential; the claim is not about arbitrary negative integer coordinates.

`source_fourth_onset_lowM00` proves the same inequality with `j=3n+k`, `1≤k≤6`, and the same `n,c,r` conditions. For the terminal-interval theorem, starts `j≥3n+6` use the previously accepted all-predecessor theorem. Smaller permitted starts use `k=j-3n`, with the necessary natural subtraction identities proved from `3n<j`.

## Chamber coverage and the accepted chain

Actual source predecessors have positive coprime labels `0<r<c`. The four accepted source adapters cover the strict predecessor chambers

```
(0,1/4), (1/4,1/3), (1/3,1/2), (1/2,2/3).
```

The assembly excludes the internal equalities `4r=c`, `3r=c`, `2r=c` using coprimality and `c≥5`; the upper bound is supplied explicitly by `3r<2c`. Thus the actual reduced predecessor cases under that hypothesis are exhausted. This does not establish the two higher chambers.

For each of these four chambers and each offset `k=1,...,5`, the staged column proof establishes the onset gap as a polynomial in nonnegative integers `N,C,R`, with `n=N+7` and the chamber's exact positive Farey coordinates. Individual coefficient identities and nonnegativity are proved for powers 0 through 14, including the zero/high-power cases. The actual source adapter constructs these coordinates from `c,r`, proves their nonnegativity, and substitutes the inherited source coefficient identities. The scale is the same positive integer `7560` at all three positions; no factorial or position-dependent normalization is substituted for raw log-concavity. Offset 6 uses the inherited theorem.

All 30 staged column modules eventually compiled. The 20 modules used by the four lower-chamber source adapters have retained successful separate replay evidence. The ten modules for chambers 4 and 5 are compiled-only in worker 101. The final restricted source proof does not import those ten as a hidden unverified branch.

## Exact middle extraction, with no inequality conclusion

`penFallingM00` is an integer expression formed from the eleven inherited reflected penultimate-block coefficients `penPart[d]`, `d=0,...,10`, multiplied by the seven-factor falling product at `e+7-d`. `pen_convolutionM00` proves

```
5040 * convSevenK0B(penPoly,j) = penFalling(...,j)
```

for arbitrary integer parameters and natural `j≥3`. The guard is real: together with the maximal monomial shift 10, it allows the falling products to agree with the zero-retaining binomial expression. It is not an unrestricted evaluation of binomial coefficients at negative indices.

For each of the six strict actual predecessor chambers, `source_fourth_middle_value[ch]M00` assumes `c≥5`, natural `i,j`, `i+j=a+4` and

```
2n+6 ≤ j ≤ 3n+3,
```

and proves the exact identity

```
120960 * A(i,j)
  = 16 * backShape[ch](c,r,4n-j)
    + penFalling(n,c,r,q,t,u,3n+6-j).
```

Here the displayed arithmetic inside the defining expression is over the integers. `q,t,u` are the exact chamber substitutions for the established natural counts: `(0,0,0)` in chambers 0 and 1, `(0,3r-c,0)` in chamber 2, `(2r-c,c-r,0)` in chamber 3, and `(2r-c,c-r,3r-2c)` in chambers 4 and 5. The strict chamber hypotheses prove the casts and minimum/subtraction branches. The guarded natural convolution indices are reconciled with these integer expressions in the proof.

There is no separate `n≥7` hypothesis on these identities; their index range is empty for `n<3`. They are derived from the actual-source two-block formula and checked reflection/convolution identities, rather than assuming a candidate coefficient formula. The normalization `120960=24·5040=16·7560` is constant. No log-concavity theorem for this middle interval follows from the identities alone.

The saved symbolic comparisons of chamber expressions, comparisons to prior forward candidates, and nonnegative-coefficient gap calculations remain Python evidence. They were not incorporated as Lean identities or inequalities in this worker.

## Unfinished and overstated metadata

`MarkovResidualLowM00.lean` contains the candidate `root_iff_core_lowM00`, but its 100-second build timed out and it has no accepted final object or replay. The unrestricted source assembly, its higher-chamber adapters and related general residual drafts are also unbuilt. The last previously accepted root reduction is not replaced by those drafts.

The final `validation.json` correctly distinguishes 42 compiled mathematical modules from 32 replayed modules. Their final sources contain 1,053 named theorem declarations: 713 in the replayed 32 modules and 340 in the ten compiled-only modules. These are helper-heavy counts, not numbers of new conjecture regions. The `audit-inventory.json` is stale at 37 modules / 883 names. Finalization adds five late successful column builds to validation without rebuilding that inventory. Consequently five files in its 13-entry excluded list are actually final compiled-only modules; only the other eight are truly unbuilt drafts. These metadata distinctions must be preserved.

Only 13 selected public axiom closures are directly printed, each with permitted axioms. They cover the actual transitive dependencies of those public statements; no assertion is made that every unused helper, all 713 replay-targeted theorems or all 1,053 compiled theorems appears in those closures. This must not be described as 1,053 individual axiom printouts. Detailed binding, closure coverage, replay scope and chronology are documented by the separate retained-validation audit.

## Retained checking and timeout chronology

All 285 controller-listed artifacts agree with their archived and current bytes; all 283 indexed artifacts also match. The two files outside that index are the index itself and `final-check.json`, both separately controller/archive-bound. No extra live evidence file, post-deadline artifact or post-finish artifact was found. All 254 predecessor-worker artifacts remain unchanged. The 268 preservation/initial comparisons and 259 reconciliation comparisons match; these categories overlap and are not distinct mathematical checks.

There are 71 ordinary completed invocations: 43 successful builds (42 mathematical modules plus Audit), 20 successful individual replays, seven timed-out builds and one timed-out individual replay. Four union invocations are recorded separately: three successes, covering respectively seven formula modules, four adapters and the restricted source module, and one timed-out eight-module attempt. The successful replay evidence covers 20 certificate modules individually and 12 additional mathematical modules through successful unions, for 32 distinct mathematical modules. A timeout is not credited as a partial replay. The ten higher-chamber certificates remain compiled-only in this history. Audit compilation prints the 13 selected public closures; compilation of that importing Audit is not a fresh replay of its dependencies.

The finalizer completed successfully at event 211. `validation.json` was written at `18:10:05.334915Z`, the artifact index at `18:10:08.040739Z`, and `final-check.json` at `18:10:08.040857Z`: the last of these is **44.766795 seconds before** the controller deadline `18:10:52.807652Z`. The last recorded event only reads a summary and root digest. There is no final agent JSON or `turn.completed`; the controller ultimately records timeout at `18:11:11.831101Z`, elapsed **1819.023449898 seconds**, with a null report. Retained completed validation is therefore real, while successful agent-turn completion is not.

The unchanged alternate replay methods are assessed in the companion method note. They recheck selected safe declarations using the Lean kernel with inherited imported objects; they are distinct from compilation and from an official-CLI or fresh whole-source rebuild. Static source import checks are not binary import/generated-constant inventories or invocation-time object digests. The incomplete higher-chamber replay and the unaccepted residual are not erased by the successful restricted source chain.

## Finite evidence and independent domain recount

The saved experiment uses exactly `5≤c≤30`, `1≤r<c`, `gcd(c,r)=1`, and `n∈{7,9,16,31}`. An independent enumeration of these input/index domains, without executing coefficient or research code, agrees with all 1,088 saved inputs and these counts:

- 36,448 two-block coefficient positions, `2n+6≤j≤4n+7`;
- 8,704 onset coefficient positions, `1≤k≤8`;
- 6,528 onset triples at `1≤k≤6`, all satisfying the three original polygon guards;
- 684 literal recurrence coefficient comparisons over 39 inputs with `b≤85`.

Thus 45,152 is the sum of two coefficient-comparison categories, not that many distinct source polynomials. The saved result reports 1,632 zero values, counted in the two-block loop; this numerical value was not independently recomputed. The stored no-failure result is finite evidence. The symbolic middle calculations are also finite algebraic evidence, not an accepted universal source inequality. No experiment was rerun.

## Selected archived source anchors

- `MarkovOnsetLowM00.lean`: `af885593b4aac86fe59934d69200afc8840f5c8396a5f9875c8abfe47a31a91d`.
- `MarkovPenFallingM00.lean`: `8a5f174879af860e4fee0274fc7d85f2cae855f44443f75d1eadd8636a8c3287`.
- `MarkovMiddleValue0M00.lean`: `0e3ea7f73a5bae16f3c4b29676f97c767831f95824560db16b87436deadd0274`.
- `MarkovMiddleValue5M00.lean`: `950f683bf875a3e90486af5a6d0671a10e352c130e1864443286069596ff4aca`.
- Unaccepted `MarkovResidualLowM00.lean`: `388df4a89d10e5d0ac26f4f95250645405a30ff778cc3354deff2456536a7c7c`.
- `experiments.json`: `b30db3cd96b469d7311caa64d5fd2255d3b95aa1efaaef991e48cd954ba6c916`.

These are source/evidence identities, not additional proof checks. See the companion validation and replay-method notes for the complete archive/current/controller comparison and the imported-dependency boundary.

## Completed supporting audits

- [Retained validation audit](markov_worker_000101_validation_audit.md), SHA-256 `71f28110aeb630c2726335be7595bf5a80b8e1320686b3895bb8ae8ccc9d322e`.
- Validation evidence JSON: `58f554bfa4df62b06edcffd8251a5f64207c86ec55082a616e6c4c3ea718d138`.
- [Historical replay method](markov_worker_000101_replay_method.md), SHA-256 `f336cfde8fd31bcd7aef374b70ca635bbbf85d2adc01305579ba87a1db3dd854`.
- Method evidence JSON: `3209ac007ecb27f10c8821e15375eebca7ed44d6f43295d87b92d9a253ec3d9c`.

The supporting audit rehashed its 1,111 directly recorded inputs unchanged at `2026-10-15T18:37:57.857909Z`; historical import graphs remain transitively bound through prior audit evidence and before-worker hashes. No missing check was completed for this audit.
