# Worker 000064: static finite and obstruction audit

Request `6d2c5a67e4e14b3993f3b98af6bf0e61`, repository `/Users/sasha/math_gkm`. This note covers the finite scripts/artifacts, mathematical correspondence, and `MarkovAlignedObstruction6d2c.lean`. The parent audit covers the other five mathematical modules and receipt/replay provenance. No project script was executed or imported, no coefficient experiment or Lean run was repeated, and no project source was edited. Work consisted of static reads, JSON inspection, elementary count arithmetic, and input hashing.

## Finding and scope

No mathematical discrepancy was found in the obstruction statements or their contrast with the complete raw source triple. The new universal inequalities concern **constant coefficients of aligned groups on the family `R^n L`**, with `n≥1`. They do not prove all-coefficient or all-source raw log-concavity. The final named interval LC theorem explicitly assumes `1≤L≤U≤2n+1`; the zero-start cases have a separate prefix theorem. The finite all-interval experiment has broader signed-grade/all-coefficient coverage, but only on its recorded finite input range.

Two evidence qualifications matter. The larger-source scan stopped at its time limit after 302 selected fractions, rather than completing its planned input list. The arbitrary-word scan stopped after three words and two failure categories. Also, the saved smaller-cut interval JSON has an older status/schema than the final interval script; its status describes the same smaller-cut scope, but it omits the `all_cuts` field that the final script would write. This is a provenance limitation, not a contradictory coefficient result.

## Signed alignment and interval meaning

The transfer dictionary has entries `F[s,d,j]`, where `s` is the number of cuts, `d` the individual mask polynomial degree, and `j` the original coefficient index. The reindexing is exactly `M[s,d-s,j]=F[s,d,j]`. Python integer subtraction retains negative grades. It is not natural-number truncated subtraction and does not discard `d<s` entries. The map is injective for fixed `s,j`; multiplicity already accumulated in `F` is preserved.

The all-cuts interval script takes the minimum and maximum grade present **over the whole source transfer**, then iterates every integer between them, including internal zero grades. For each polygon triple it tests every pair of interval endpoints in this range and sums the actual coefficients for those grades. This differs from arbitrary subsets of grades, and from a prefix alone. Intervals extending outside the global active range produce the same clipped sums or zero; thus the finite scan covers every distinct finite signed-interval sum at its sampled sources. No reweighting or coefficient normalization occurs.

The formal source family is the exact word `B^n A B^(n+1)` with label `(2n+1)/(2n+3)`. Here the inspected obstruction module's `source_negative_alignment6d` states that the **constant coefficient** of `degreeLayer(w,s,d)` is zero whenever `d<s`, for every natural `n,s,d`. It is not an assertion about all words or sources. The positive count/prefix/interval declarations use natural grades `e` and compare coefficients across cut count at original `j=0`.

Writing `H_e(t)=sum_s c_n(s,s+e)t^s`, the notes' formulas agree with the inspected count declarations:

* `H_0=1+t` for `n≥1`.
* For `1≤e<n`, `H_e=t(1+t)^(e-1)(2+(e+1)t)`.
* `H_n=t(1+t)^(n-1)(3+(n+2)t)`.
* For `e>n`, `H_e=max(2n+2-e,0)t²(1+t)^(e-1)`; the coefficient is natural truncated subtraction, so these layers vanish for `e≥2n+2`.

The finite positive family therefore has active grades `0..2n+1`. The interval declarations quantify over natural bounds `1≤L≤U≤2n+1`, with all natural cut counts. Prefix declarations cover sums from grade zero for every natural upper bound. The named interval theorem itself is not a single theorem quantifying over arbitrary signed/exterior interval bounds. Its scope is accurately stated in the mathematics note. Parent review covers the proofs and formula derivations.

## Nonconsecutive grades versus complete source coefficients

`aligned_skipped_pair6d` states, for every `n≥6`,

`H_0+H_5 = 1+3t+14t²+36t³+44t⁴+26t⁵+6t⁶`.

This agrees with `1+t + t(1+t)^4(2+6t)`. The omitted grades are `1,2,3,4`; this is not an interval sum. `source_skipped_pair_failure6d` explicitly connects the selected coefficients to

`f(s) = [y^0]G_w(s,s;y) + [y^0]G_w(s,s+5;y)`

and states `f(1)²-f(0)f(2)=-5`. Thus the `[1,3,14]` triple uses the fixed **aligned grades** `e=0,5`, with degrees `d=s,s+5` changing as `s` changes. It is not the sum of fixed degree layers `d=0,5` for every cut count. The statement keeps actual source multiplicities and zeros.

For `n=6`, `source_skipped_full_triple6d` separately checks source `13/15`, all three original polygon guards at `(13,0),(14,0),(15,0)`, and the **full raw** triple `[1,14,91]`, with gap `14²-1·91=105`. Its proof invokes the source boundary coefficients `choose(14,s)`. The negative auxiliary gap neither changes those raw coefficients nor refutes their inequality.

`raw-source.json` records the same path `R^6 L`, points, coefficients, three true guards, gap `105`, and 295 nonzero coefficients from the literal numerator recurrence. The preserved rejected Python attempt has the same recurrence, path, extraction and guards, but an incorrect expected assertion list `[814385,10424128,10945644]`; the corrected assertion is `[1,14,91]`. This rejected expectation is not a raw-inequality failure.

## Finite coverage and counts

| Artifact | Actual coverage | Recorded checks |
|---|---|---|
| `aligned-intervals-all.json` | All 394 reduced fractions `1≤a<b`, `3≤b≤36`; every cut count `0..b-1`; every polygon-valid triple in the three directions; all signed-grade intervals in the source's full active range | H `52,516,538`; V `52,516,538`; diagonal `54,824,267`; total **159,857,343**, no failures. |
| `aligned-intervals.json` | Same 394 fractions, smaller-cut experiment; final default branch retains `s≤7` and uses starting cut counts `0..5` | H `3,921,252`; V `3,921,252`; diagonal `3,439,763`; total `11,282,267`, no failures. Its older schema has no `all_cuts` key. |
| `aligned-source.json` | 302 distinct selected fractions, denominators `9..90`, ending at `83/90`; individual aligned-grade H/V tests with starting `s≤5`, transfer retained through `s=7` | `987,176` per direction, no failures; elapsed `135.7038…` seconds against a 135-second input-loop stopping condition. |
| `aligned-arbitrary.json` | Three saved seed-620 words, all of length 12; no source label or polygon guard | 203 H and 203 V tests; one stored failure in each direction, followed by termination. |
| `aligned-matroid.json` | Six source inputs through the first witness `2/5`; 16 grade-sublevel families visited | First recorded obstruction is failure of exchange, not a universal scan result. |
| `transfer-validation.json` | All 240 reduced fractions `1≤a<b`, `3≤b≤28`; full transfer compared to literal raw recurrence | **88,357 raw coefficient positions**, no differences. |

The full interval artifact's 394 saved pairs are distinct and reach `35/36`, with elapsed time about 85.5 seconds, below the 130-second stop. Its loops enumerate `s=0..b-1`, `j=0..a+s`, set `i=a+s-j`, and check nonnegative `i`, `bi+aj≥ab`, and `i+j≤a+b-1` at all three positions. These enumerate the polygon positions because the lower polygon bound implies `i+j≥a`. Horizontal/vertical steps increase cut count; diagonal steps keep it fixed. All needed cut counts are retained when `limit=b-1`.

The smaller-cut branch's H/V triples need at most starting `s+2≤7`, so the transfer cap retains their complete coefficient sums; its diagonal start range is also only `0..5`, although the transfer includes two higher cut counts. It must not be read as all cut counts. Recorded inequality totals were read and summed, not regenerated from the transfer calculation.

The larger-source script plans near-upper fractions `(b-k)/b` for `9≤b≤99`, `k∈{2,3,5,7,11}`, followed by an exhaustive smaller-source list. The saved 302-input prefix stops in the first list at `83/90`; the later exhaustive list was not reached. It therefore does not establish coverage of all sources through denominator 90 or 99. Its loops start at represented left entries; an absent left entry is zero and cannot violate the tested raw square inequality. A category stops being checked after its first failure, but this dataset has no recorded category failure.

The arbitrary scan plans 250 structured-by-length/probability random inputs but terminates after the third saved word, `[1,0,0,0,1,0,0,1,1,0,0,0]`. At `s=e=j=0`, its aligned H triple is `[1,3,23]`, gap `-14`, versus unfiltered `[1,12,66]`, gap `78`. The aligned V triple is `[1,4,32]`, gap `-16`, versus unfiltered `[1,13,135]`, gap `34`. The unfiltered word totals are not identified as a rational source numerator. These witnesses refute the enlarged arbitrary-word alignment assertion, not the source conjecture.

For the matroid diagnostic, the actual source word at `2/5` is `ABAB`, threshold `e≤0`. Masks `1` and `6` denote cut sets `{0}` and `{1,2}`; both have grade zero. Neither permitted exchange augmentation `{0,1}` nor `{0,2}` is allowed: each has grade one. The script stops at this witness. Its counter counts visited thresholds, skips a threshold's matroid checks when the empty mask is absent, and does not show that all alternative representations are impossible.

## Meaning of the independent literal comparison

The independent branch uses the initial polynomials and both left/right update formulas from `MathGKM/Markov.lean`, with exact integer sparse multiplication/subtraction. The transfer branch uses the mechanical interior word followed by `B`, of length `b-1`, and `transfer(w,b-1)`. Since one site can increase cut count by at most one, this cap does not truncate that word's masks.

It sums over auxiliary degree and extracts `Q[a+s-j,j] += F[s,d,j]`, with no normalization. The comparison uses the union of the two raw polynomial supports and treats missing keys as zero. The 88,357 count is the sum of those union sizes over the 240 saved sources; it is neither a number of LC triples nor a count of separate graded entries. It validates finite **aggregate raw polynomials**, and does not separately validate each individual degree allocation. There is no polygon/nonzero-endpoint filter in this polynomial comparison. Source `1/2` and the two endpoints are outside the stated range.

All scripts and data were inspected statically. Input hashes are recorded in the adjacent `markov_worker_000064_formula_audit_inputs.sha256.json`.
