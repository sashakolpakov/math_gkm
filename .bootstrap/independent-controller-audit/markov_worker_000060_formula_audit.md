# Worker 000060: static finite/counterexample audit

Request `07a7e5b715cd4825bb464f056e32ebfa`, repository `/Users/sasha/math_gkm`. This report covers the mathematical/correspondence notes, experiment scripts and saved JSON, and the exact statements of `MarkovCutPrefix07a7.lean` and `MarkovDegreeObstruction07a7.lean`. The parent audit covers CutDegree/Transfer/Bridge proofs, receipts, axioms and timing. Inspection was read-only: no project code was executed or imported, no research computation or Lean run was repeated, and no source was edited. Only static reads, JSON inspection, input hashing, and elementary coverage arithmetic were used.

## Finding

No discrepancy was found in the two assigned Lean modules or the counterexample formulas. The notes distinguish failed chronological prefixes, auxiliary degree coordinates, and auxiliary marker inequalities from the complete raw source inequality. No full-root proof or refutation is established here. The finite data support exactly the bounded assertions described below.

Coverage qualifications: the 1,222 transfer inputs include overlapping arbitrary-word and source collections; the arbitrary-mode `a,b` fields mean `sum(word),len(word)`, not a rational source label. Mixed-pair and midpoint failure searches stop checking the affected category after its first witness. Their small test counts must not be read as exhaustive compatibility checks. These are scope clarifications, not contradictions of the mathematical note.

## Chronological prefix versus degree prefix

For a fixed word and cut count, `grouped` collects all masks by their **individual term degree**. It sums their coefficient lists, preserving multiplicity. The renewal records each mask by its last selected position and its preceding selected position; the unselected suffix adds no weight. It includes the zero-cut term at `(s,d)=(0,0)` with polynomial `1`. `cuts_fe01.kernel` returns a polynomial with positive leading coefficient, as do its products, so `len(p)-1` is the term's actual degree over these integer lists.

A degree prefix sums whole degree layers in increasing degree; a suffix uses decreasing degree. `degree_intervals_07a7.py` sums every consecutive range in the sorted occupied degrees, including single layers and the full sum. Missing degrees contribute zero, so this covers all distinct sums arising from integer degree intervals. These operations differ from selecting the first several cut positions in the word. No universal LC statement for any of these aggregates is proved by the two audited modules.

`cut_one_append07a7` is a universal identity over every commutative ring:

`cutCoeff(y,p,q,u++v,1) = cutCoeff(y,p,q,u,1) + cutCoeff(y,gapCharge(y,p,q,u),q,v,1)`.

It supplies the exact chronological meaning of the one-cut prefix; it asserts no inequality. The other prefix-module statements concern the explicit path `[true,true,true,true,true,false]`, whose extended word is `B^5 A B^6` and whose source label is checked as `11/13`.

* Taking eight letters gives precisely the sum of the first eight one-cut positions, `8+20y+20y²+14y³+10y⁴+6y⁵+2y⁶`. The integer coefficient triple at degrees `2,3,4` is `[20,14,10]`; its gap is `14²-20·10=-4`.
* The full one-cut polynomial is `12+32y+36y²+28y³+20y⁴+12y⁵+4y⁶`. `full1113_raw07a7` explicitly identifies the original coefficients at `(10,2),(9,3),(8,4)` as `[36,28,20]`, checks every polygon guard, and states gap `28²-36·20=64`.

The comparison is in the original diagonal direction, in reverse order. The negative prefix gap refutes a universal assertion about such chronological partial sums; it does not reverse the corresponding complete-source inequality. No normalization or removal of zero coefficients occurs in these statements.

## Exact finite coverage

All source scans use reduced interior fractions `1≤a<b`, with the mechanical interior word followed by `B`; they do not include the root's two endpoint clauses. The group checks use adjacent centers `j=1..len(p)-1`, with coefficient lookup returning zero outside the list. Thus the final center with a zero right neighbor is included. Center `j=0`, centers beyond support, and absent degree layers have trivial zero-side inequalities and are not enumerated. No nonzero-endpoint filter is applied to the tested inequalities.

| Artifact | Input coverage | Recorded checks and result |
|---|---|---|
| `group-cuts.json` | All 63 sources with `b≤14`; all nonempty cut subsets | 121,307 masks, equal to the sum of `2^(b-1)-1` over the sources. Degree groups/prefixes/suffixes pass their finite checks. First/last chronological prefixes first fail at `11/13`, `s=1`, position group `7`, gap `-4`. |
| `degree-groups-source-25.json` | All 199 sources with `b≤25` | Layer/prefix/suffix checks `309,477 / 309,477 / 394,985`, no failures. |
| `degree-groups-source-40.json` | All 489 sources with `b≤40` | `2,911,174 / 2,911,174 / 3,753,422`, no failures. |
| `degree-groups-arbitrary-9.json` | All 1,023 binary words of lengths `0..9` | `172,875 / 172,875 / 220,180`; no layer failure; prefix and suffix failures. |
| `degree-groups-arbitrary-13.json` | All 16,383 binary words of lengths `0..13` | `8,181,945 / 8,181,945 / 10,638,135`; no layer failure; the same first prefix and suffix witnesses. |
| `degree-intervals.json` | All 277 sources with `b≤30`; every cut count and every occupied-degree interval | 4,744,368 adjacent inequalities, no failure. |
| `degree-stress.json` | 21 structured words plus 27 seed-707 random words; 48 saved inputs, lengths `15,20,24,30,40` | 366,434 individual-layer checks, no failure. This enlarged family is not identified with sources. |
| `degree-transfer.json` | 1,023 arbitrary words of lengths `0..9`, followed by 199 source inputs with `b≤25` | 1,222 input evaluations, with overlap between collections; equality of transfer and renewal dictionaries, containing 533,536 entries in total. This is an identity test, not an inequality test. |

The group scripts contain a 100-second break after processing an input. The saved source-40, arbitrary-13, and stress records reach their full prescribed input counts; the break did not truncate those datasets. The detailed inequality counts are saved output, whose generating loops were inspected; this audit did not regenerate coefficients to independently recount those inequalities.

The direct-mask checks inside the degree-group script are restricted to words of length at most eight. Source runs record 2,586 mask comparisons; arbitrary runs record 87,381, the sum of `4^n` for `n=0..8`. The larger-word grouping calculations are not all matched against direct mask enumeration.

The arbitrary prefix witness is word `[1,1,0,0,0,0,0]`, `s=1`, degree cutoff `2`, polynomial `[5,2,1]`, gap `-1`. Its JSON labels `a=2,b=7` do **not** mean source `2/7`. The suffix witness is `[1,0,1,1,1,1,1,1]`, `s=1`, lower degree cutoff `2`, polynomial `[7,19,20,14,10,6,2]`, gap `-4`. These are distinct from source-degree-prefix or source-degree-interval failures, of which none is recorded.

In `group-cuts`, pairwise mixed gaps first fail at source `3/4`, `s=1`, for `[1,2,1]` and `[1,3,4,3,1]`, with mixed gap `-1` at `j=3`. This is recorded for grouping by degree, first cut, and last cut. Only 10/15/15 mixed checks are counted because each category stops after its first failure; these counts do not measure all pairs in the 63 sources.

## Auxiliary degree obstruction at source 2/7

`MarkovDegreeObstruction07a7` uses path `[false,false,true]`, extended word `AABAAB`. The exact two-cut degree layers are `1`, `3+3y`, and `11+25y+14y²`. The identities are stated over every commutative ring using the structural degree statistic. `degree_count_failure27_07a7` checks the actual source label `2/7` and compares constant coefficients across degrees `0,1,2`: `[1,3,11]`, gap `-2`. The failed direction is auxiliary degree at fixed original coefficient index. It is not any pinned numerator direction.

`full27_formula07a7` identifies the complete sum as `15+28y+14y²`. `full27_raw07a7` checks all polygon guards and the raw coefficients `[15,28,14]` at `(4,0),(3,1),(2,2)`, with gap `574`.

`joint-groups.json` scans all 179 reduced sources with `b≤24`. It records 254,979 represented-center checks for each of the degree/coefficient directions `(1,0),(0,1),(1,1)`. The degree witness is `[1,3,11]`; the mixed degree/coefficient witness is `[1,3,14]`, both at `2/7`. Ordinary coordinatewise midpoint tests stop after 2,343 checks at the same `[1,11,3,3]` endpoint/midpoint obstruction. The separate transformed `(d-j,j)` midpoint assertion already fails after one check at source `1/2`, where the transformed midpoint entries are absent and hence zero. These are different stronger assertions; none supplies a root counterexample. Unit-direction checks are centered at represented entries, and midpoint checks use zero for absent entries.

## Auxiliary marker calculations

The degree marker `z` weights complete layers; it is not the paper's omitted homogeneous variable. At `z=1`, the layers sum to the literal raw coefficients.

For source `2/7`, the marked two-cut polynomial is `1+3z(1+y)+z²(11+25y+14y²)`. Its adjacent gap in `y` is `z²(-5+108z+471z²)`. At `z=1/100`, multiplying all coefficients by the **same** positive denominator `10,000` gives `[10311,325,14]`, with gap `-38,729`. The unscaled gap is `-38,729/100,000,000`. This sign-preserving common scaling is not a factorial/binomial normalization. The raw `z=1` gap remains `574`. `degree-weight.json` is explicitly an experiment, not an added Lean theorem.

`marked-gaps.json` covers 101 reduced sources with `b≤18`, testing 12,060 horizontal, 12,060 vertical, and 13,285 diagonal triples, total 37,405. All three positions satisfy `0≤s≤b-1`, `0≤j≤a+s`, `(b-a)j≤bs`; under `i=a+s-j` these are the original polygon conditions. Directions in `(s,j)` are `(1,0)`, `(1,1)`, and `(0,1)`, respectively. For each marked gap `p(z)`, the script computes the coefficients of `p(1+t)` exactly. This coefficientwise nonnegativity assertion is stronger than pointwise nonnegativity for `z≥1`.

At source `1/3`, starting at original point `(1,0)`, the marked horizontal triple is `[1,2z,z³]`, gap `z²(4-z)`; the vertical triple is `[1,2z,3z³]`, gap `z²(4-3z)`. Their shifts are `[3,5,1,-1]` and `[1,-1,-5,-3]`. These particular formulas are negative for `z>4` and `z>4/3`, respectively, **not for every marker unequal to one**. At `z=1`, raw gaps are `3` and `1`. The explicit formulas, beyond merely having a negative shifted coefficient, establish the claimed all-markers obstruction.

The artifact stores the first negative-coefficient witness per direction, not a count of all failed triples. No diagonal shifted-coefficient failure was recorded. Missing marker coefficients are zero-filled, absent middle/right polynomials are zero, and internal/trailing gap zeros are retained. Starts range over represented left polynomials; an omitted identically zero left polynomial cannot produce a negative shifted coefficient, since its gap is the square of a polynomial with nonnegative coefficients.

The individual-layer, source-degree-interval, and marked-diagonal universal inequalities remain unproved. Input hashes are in `markov_worker_000060_formula_audit_inputs.sha256.json` beside this report.
