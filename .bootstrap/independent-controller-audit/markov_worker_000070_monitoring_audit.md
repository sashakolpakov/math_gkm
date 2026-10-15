# Independent monitoring audit: worker 000070

Request `b485717c0c2e4ae9b5526ee78a83dc99`, reviewed read-only on 2026-10-15.

The review inspected all nine final mathematical Lean modules, their English correspondence, inherited definitions needed to interpret the source bridge, finite-experiment scripts and retained records, and current versus archived source hashes. A separate read-only validation review checked the compilation/replay bindings and finalizer records. No project files were changed, no proposer was contacted, no active successor was disturbed, and no proofs, builds, kernel replays, or numerical experiments were rerun.

## Conclusion

The mathematical claims in the final English descriptions match the inspected Lean statements. These are obstructions to adding nonuniform activities at cut sites, on two fixed genuine source words. They are not counterexamples to the unweighted Markov coefficient conjecture and do not establish a new universal raw-coefficient region.

The important distinction between the two examples is:

- At source 1/8 the activity vector `(1,t,t,1,t,t,1)` is positive and palindromic for positive integer `t`. It is **not log-concave for `t>1`**: its middle entry is 1, between two entries equal to `t`. The worker's final prose correctly describes this example as palindromic, not log-concave.
- At source 7/10 the activity vector `(t^8,t^7,…,t,1)` is positive, nonincreasing, and satisfies all adjacent log-concavity equalities for integers `t≥1`. This separate example rules out the stronger geometric-activity closure being tested.

The formal failure ranges are sufficient conditions, `t≥86` and `t≥8`, respectively, with `t:ℤ`. Neither theorem is an if-and-only-if classification of all parameter values or a theorem for arbitrary real parameters. The universal algebraic identities underlying these inequalities are proved over arbitrary commutative rings.

All nine final mathematical modules have matching successful compilation and accepted alternate-driver kernel replay records. The full pinned conjecture remains unresolved.

## Exact meaning of the activity polynomial

`activityCoeffB485 y p q w s` retains the original skip/select recursion on the Boolean word. Selecting a site multiplies its original factor by that site's activity and reduces the number of remaining selected cuts by one; skipping a site makes the unchanged charge transition. The empty-word and zero-cut cases are explicit. Thus the recursion retains every mask and its original multiplicity, without renormalization or deletion of zero coefficients.

Two universal bridges are proved:

- `activity_polynomialB485` identifies the fixed-cut polynomial with the coefficient of the inherited `siteEval340` after assigning the site's auxiliary variable `X` times its activity.
- `activity_uniformB485` states equality with the original `cutCoeffA27` for every Boolean word and every natural cut count when all activities are one.

The inherited source coefficient identity is

`A(i,j) = [y^j] cutCoeff(source,s)` when `i+j=a+s`.

This is used with explicitly discharged equalities in both actual-source comparisons. For fixed `j`, consecutive cut counts correspond to consecutive horizontal raw indices only after the uniform specialization. The weighted expressions at other parameters are not asserted to be coefficients of the original numerator polynomial.

The generic bridges include zero cuts and counts beyond the word length; the two new negative inequalities concern fixed, interior cut counts. They do not replace or weaken any endpoints or zero conditions in the root conjecture.

## Source 1/8: positive palindromic activities

The actual path is `L^6`; its extended word is `A^6 B`. The word identity is proved, rather than assumed from a numerical label. The activities are `(1,t,t,1,t,t,1)`.

At fixed coefficient index `j=2`, cut counts 2, 3, and 4 have coefficients

`L=1+2t`,

`M=1+14t+15t²`,

`R=12t+59t²+28t³+t⁴`.

The full cut polynomials, not merely these three sampled coefficients, are proved by exact ring identities in `MarkovActivityFormulaB485`. Coefficient extraction then proves the displayed formulas over the integers. Their exact gap is

`M²−LR = 1+16t+143t²+274t³+168t⁴−2t⁵`.

`activity_gap_shiftB485` identifies its value at `t=n+86` as the negative of a polynomial in `n` with strictly positive constant term and nonnegative coefficients. The proof for `t≥86` uses the nonnegative integer `n=t−86`; it does not assume the inequality being proved. `activity_horizontal_failureB485` applies this to the actual activity recursion. `activity_positive_palindromeB485` separately proves positivity and reversal invariance of the activity list for every positive integer `t`.

At `t=1`, `source18_rawB485` proves the actual label `(a,b)=(1,8)`, coprimality, all three `InPolygon` conditions, and

`(A(1,2), A(2,2), A(3,2)) = (3,30,100)`,

with gap `30²−3·100=600`.

This raw horizontal row `j=2` was already covered universally by `horizontal_two_raw8934`; the entire numerator-one family was also already covered. The exact values are a comparison illustrating the distinction between the original polynomial and its deformation, not a newly covered raw region.

## Source 7/10: geometric activities

The actual path is `RRLL`; its extended word is `BBABBABBB`. `geometric_source_wordB485` proves this identification. Site `k`, for `k=0,…,8`, receives activity `t^(8−k)`.

`geometric_activity_shapeB485` is an integer theorem with `t≥1`. It explicitly proves positivity for all nine sites, nonincrease across all eight consecutive pairs, and the geometric log-concavity equalities across all seven consecutive triples. Its natural-subtraction exponents are guarded by the corresponding index bounds. It is not a claim that every positive log-concave vector is geometric, nor that every such vector causes failure.

For cut counts 3, 4, 5 and coefficient index `j=9`, `MarkovGeometricSlice3B485`, `MarkovGeometricSlice4B485`, and `MarkovGeometricSlice5B485` prove the full bivariate-in-`y,t` polynomial expansions and their exact coefficient formulas. The left coefficient is `7t⁹+5t¹⁰`; the middle and right are the explicitly recorded polynomials of degrees 19 and 30. The gap is proved to be `t¹⁹ H(t)`, where `H` is the degree-21 polynomial recorded in the English notes and `geometricResidualB485`.

`geometric_gap_shiftB485` proves that every coefficient of `H(n+8)` is strictly negative. For any integer `t≥8`, the proof takes `n=t−8≥0` and separately proves `t¹⁹>0`. Thus `geometric_horizontal_failureB485` establishes a strict reversed horizontal inequality for every integer in the stated range. There is no remaining numerical sign test or conditional formula premise.

At `t=1`, `source710_rawB485` proves label `(7,10)`, coprimality, all three polygon guards, and

`(A(1,9), A(2,9), A(3,9)) = (12,472,5092)`,

with gap `472²−12·5092=161680`.

This is a fixed exact source comparison. The worker proves no universal raw horizontal family, no vertical or diagonal extension, and no counterexample to the original source polynomial. The new obstruction concerns coefficient log-concavity after external-field specialization without taking derivatives, distinct from the inherited polarization/derivative obstruction. No literature-novelty claim is established by this audit.

## Recorded validation and source bindings

The host receipt records completion with return code 0, elapsed time approximately 1142.543 seconds, mathematical resolution false, and a null completion claim. All selected final builds, replays, and the axiom audit finished before the final manifest and host completion.

The independently inspected validation contains successful compilation and alternate-driver replay for all nine final modules. Earlier failed elaborations and the timed-out first build of the fifth geometric slice remain rejected; later matching successful checks govern acceptance. The separate `MarkovAuditB485` build prints each of the 29 new named theorem axiom closures exactly once. Three are axiom-free; the rest use only permitted standard axioms. No new custom axiom or proof placeholder is present in the final mathematical sources.

All 98 indexed artifacts match their hashes, and all 98 retained artifact-verification comparisons were independently checked as exact matches. Source snapshots, current source files, successful build and replay receipts, current compiled objects, worker archives, and controller receipt bindings agree. The independent validation review found 103 inspected inputs stable at 01:55:52 UTC. Exact receipt paths, durations, timing, and supporting hashes are retained in [the validation audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000070_validation_audit.md) and its sibling evidence directory.

The final mathematical source hashes are:

| Module | SHA-256 |
| --- | --- |
| `MarkovCutActivityB485` | `0e53d598edc32cf297e21553901a7587d36aa02c8df6f8d3ecfff77c8d71bfc3` |
| `MarkovActivityFormulaB485` | `998f9cf8fc460660e32da18d589e69811234358529554a807056789c0011e254` |
| `MarkovActivityFailureB485` | `2c1d2b7bf466fa042ab4b92325d33e5698a47b592a171d03e89967e2ad220d4c` |
| `MarkovGeometricWordB485` | `78fe7f4e62b26bd8ef4d3a864f2b948d55ee40321a96df3280d5f970c3a8798d` |
| `MarkovGeometricSlice3B485` | `4d7a4e9fd6e630e6710988dc3addb82b3509efbc42769c2cfaf8161747f0b3a1` |
| `MarkovGeometricSlice4B485` | `9c20cc5251ead58345d0cb48978936299a8863796a777ed125333334ed39ee77` |
| `MarkovGeometricSlice5B485` | `24683d5114114e7c70c73bca60cf73787e3866a2b06b2f4349b4ebf51797b453` |
| `MarkovGeometricFailureB485` | `045b3484a249fa1e1aba90acb380518bc59f1d035d724bd859f9bedde5dd9ad4` |
| `MarkovGeometricSourceB485` | `6766f40e46c9e9b3bd5b74434c2bab01454ed51ee78ffde49101615613703865` |

The driver `ReplayKnown6d2c.lean` remains byte-identical to the accepted worker-65 version, SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Each selected record has the expected explicit-module begin/pass output and successful child return code. As explained in [the method audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000065_replay_method_audit.md), this is the pinned default per-module kernel replay through an alternate dispatcher. Imported dependencies are reused. These are not successful official CLI replay claims or a fresh full-source rebuild.

The initial finalizer confused the canonical-JSON contract digest with the digest of its file bytes. Both values were unchanged. The failed attempt and its partial outputs are retained. The final manifest uses the appropriate distinct comparisons; its artifact comparison statuses agree with the independently checked bytes. Finalization did not convert failed mathematical checks into passes.

The pinned root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`, and the canonical goal-contract digest remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

## Finite evidence and its limits

Static review of the scripts and saved outputs found the following scope. Counts include zero coefficients and repeated source triples; no experiment was rerun.

- The broad activity probe records 265,022 tested triples over 1,887 input records, representing 1,855 distinct `(source,activities)` inputs. It tests both the raw-shaped gap of the deformed coefficients and the stronger ambient normalization. Its JSON key `raw` refers to the unnormalized *weighted* gap, not a violation of the actual raw-source conjecture.
- The log-concave-site-shape probe records 31,812 triples over 435 records, representing 354 distinct inputs. Its code checks the adjacent log-concavity conditions on each tested activity list. The retained failure is at source 7/11 with a nonuniform plateau/geometric-tail activity vector; this example remains finite evidence, not an additional Lean obstruction theorem.
- The geometric probe records 6,712 triples over 116 distinct source/base/orientation inputs. It stops at its first failure. These three probes total 303,546 tested triples.
- The simplified numerator-one search checked 199 heavy-site configurations before finding the seven-site example. The script is a bounded search over lengths and selected heavy-site sets, not a universal minimality proof.
- Independent subset enumeration keeps all 128 masks on the seven-site word and all 512 masks on the nine-site word. Its recorded symbolic coefficients agree with the exact formulas subsequently proved in Lean. The enumeration itself remains finite computational evidence.
- The independent raw recurrence checks 785 coefficient positions on sources 1/8, 7/10, and 7/11, including positions outside the polygon. The 7/11 raw triple `[1,96,1806]`, gap 7410, is an experimental comparison only.
- The `R^m L²` probe records 104 distinct source/base inputs: `m=1,…,26` and bases 2, 3, 4, 8. Its retained records contain no negative gap for bases 2, 3, or 4, and one for base 8. This does not establish a universal admissible interval of activity bases. Its approximately 51.241-second runtime exceeded its nominal 45-second cap because time was checked between whole family members, as disclosed in the notes.

The saved literature note records targeted source consultation and searches, explicitly without claiming completeness or adding an external theorem as an axiom. This audit does not assert new publication priority or a current exhaustive literature result.

## Remaining scope

The useful formal addition is an exact activity extension of the cut recursion and two universal integer-parameter obstructions on fixed source words. Both actual unweighted comparison triples satisfy the conjectured inequality. Full rational-source coverage of the missing raw inequalities, all three directions, and root completion remain outstanding.
