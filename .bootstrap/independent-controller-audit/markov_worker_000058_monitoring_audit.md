# Independent monitoring audit: worker 000058

Request `34071a88f5e74d9bb6a7e4fa9173f2ff`. Read-only review of the archived worker sources, evidence and events, with matching current files. No project changes, mathematical assistance, proposer contact, new compilation, kernel replay, or experiment reruns were performed.

## Finding

The worker proves a **stronger binomial-normalized horizontal inequality on the raw `j=2` row for every source path and every source denominator**, subject to the original endpoint polygon guards. The auxiliary source restrictions are discharged, including the small denominators. This strengthens the already proved raw `j=2` inequality; it does not add an entire new direction or settle the root.

All seven final modules compiled. Five have matching successful direct kernel replays, including the all-denominator result on its final sequential retry. The certificate and coefficient-helper individual replays remain unconfirmed after timeouts. The auxiliary polarization witness is not a counterexample to a raw Markov coefficient inequality. Its exact formal scope is distinguished below from the English interpretation involving complete log-concavity.

## Exact source theorem

For `m=(frame path).mid`, write `a=m.a`, `b=m.b`, `A(i,j)=coeff m.p i j`, `N=b-1`, and `s=i+2-a`. The final theorem `source_second_ambient_all340` quantifies over every finite Boolean source path and natural `i`, assuming

`InPolygon a b i 2` and `InPolygon a b (i+2) 2`.

It proves, with integer arithmetic,

`(s+2)*(N-s)*A(i,2)*A(i+2,2) ≤ (s+1)*(N-s-1)*A(i+1,2)^2`.

The `s` definition uses natural subtraction, but the source and polygon argument proves the subtraction lies in the intended range. In the large-denominator proof it is exactly `s=h+1`, where `h=i-(a-1)`. The endpoint guards imply the center guard because both defining polygon inequalities are affine. They also imply the positive binomial range needed by the proof. The final theorem is about unchanged raw integer coefficients, not factorial-weighted or redefined coefficients.

On its admissible range this is precisely the adjacent log-concavity inequality for `A(i,2)/choose(N,s)`, rewritten without denominators. The multiplier on the left exceeds the multiplier on the right by `N+1`; with the inherited nonnegative raw coefficients it is stronger than the unweighted inequality. The theorem imposes no positivity assumption on the three coefficients and never divides by them. It does not claim arbitrary outside-polygon triples. The older `horizontal_two_raw8934` already proves the unweighted row for all natural indices, including its outside-support zeros.

## Source restrictions and normalization bridge

For `b≥5`, put `n=b-2` and `m=a-1`. `source_second_row340` supplies a natural source statistic `t` with `0≤t≤2*m`, `m≤n`, and **`n≤2*m` or `t=0`**, together with the exact coefficient identity for every natural `h`:

`2*A(m+h,2) = coeff(secondRow340 n m t,h)`.

The row polynomial is `(1+X)^(n-3)` times the explicit cubic with coefficients

`[4*t, 9*m^2+13*m+6, 6*m^2+6*m*n+8*m+6*n+6, (m+n+2)*(m+n+1)]`.

These restrictions are inherited proved source properties, not assumptions added to the final source theorem. In `second_source_formula8934`, the disjunction is proved using the exact source word formula and the vanishing of a coefficient outside the known polygon; it does not invoke the unproved log-concavity conjecture.

The new coefficient bridge states, for `N=n+1`, `k=h+1`, and the explicitly defined quartic `F(k)=secondNorm340 k N m t`,

`2*N*(N-1)*(N-2)*(N-3)*A(m+h,2)=choose(N,k)*F(k)`.

The formula is obtained by checked falling-factorial coefficient identities, not fitted numerical values. The factors `N*(N-1)*(N-2)*(N-3)` and the relevant binomial coefficients are strictly positive in the stated range `n≥3`, `h+2≤n`. The proof establishes that range before taking auxiliary quotients and then returns to the integer-scaled raw inequality. Thus zero raw coefficients are retained.

`second_normalized_lc340` proves the quartic sequence inequality under the exact algebraic source constraints. The zero-statistic case is handled directly. Otherwise the lower bound `N-1≤2*m`, together with `N≥4`, makes `(2*m)^2` strictly positive. A checked Bernstein identity expresses that multiple of the gap as a sum involving the zero, endpoint, and mixed gaps with nonnegative weights. The required sign certificates cover `k=1`, `k=2`, and all `k≥3`, with the full terminal range `k+2≤N`. Polynomial identities are checked by `ring`; sign arguments use the stated nonnegative parameter substitutions. No zero denominator, missing endpoint, or assumed generic-word inequality was found.

## All denominators and boundary cases

The final assembly first uses `source_second_ambient340` when `b≥5`. For `a=1`, including the remaining small denominators, it uses the inherited stronger source-one-family theorem with the exact shift conversion.

If `b<5` and `a≠1`, source reduction and coprimality force `b=a+1`. The existing source-path classification then gives a Pell path with parameter at most two. The first two parameter cases have no admissible endpoint pair. The only nonvacuous case is source `3/4`, starting at `i=2`, with actual raw triple `[8,26,15]`; its scaled inequality is checked from the exact source coefficient formula. This is an exhaustive small-case classification, not an assumption excluding small inputs.

The source theorem covers horizontal `j=2` only. It preserves the protected conjecture and the existing root reduction; neither vertical nor constant-total-degree obligations are declared solved. The root endpoints `0/1` and `1/1` remain in the inherited root formalization, rather than being silently replaced by the `0<a<b` source-path family.

## Polarization: precise formal and English scope

`siteEval340` introduces independent site variables into the positive transfer expression. `siteEval_uniform340` proves that making the site variables equal recovers the original transfer. `siteEval_source340` proves the universal exact source identity after the existing exponent shear and monomial prefactor. This does not assert that arbitrary independent site weights define other source Markov polynomials.

For the actual source `1/5`, the central word is three false letters; with the terminal true letter this is the four-site expression used in `site_first_coeff340`. The latter proves its coefficient of the remaining variable at degree one equals `polarHom340 1 a b c d`. `polarHom340` is the explicitly homogenized degree-four polynomial. `polar_mixed_identity340` proves an exact expansion after setting `d=0`, replacing the homogenizing variable by `z+v`, and selecting the site variable `u`; its `u*v` coefficient is

`Q(z,x,y)=3*z^2+4*z*x+2*z*y+3*x*y`.

`polarization_curve340` proves `Q(1-17*t,1+12*t,1+24*t)=12+99*t^2`. At `t=1/100`, `polarization_positive_failure340` proves positivity of all three remaining coordinates at both endpoints and a strict midpoint log-concavity failure for this quadratic.

These are checked algebraic certificates for the stated obstruction. The Lean modules do **not** define complete log-concavity of the full multivariate refinement and prove its negation as a single theorem, nor do they formalize the calculus interpretation of the mixed coefficient. The English derivative interpretation follows from the displayed polynomial expansion. The witness sets the fourth site variable `d=0`; it is interior in the remaining three coordinates, but lies on a boundary face of the larger variable space. Extending that strict boundary failure to an assertion about complete log-concavity on a fully open positive orthant involves the usual continuity interpretation, not an additional Lean theorem in these modules. The safe formal claim is the exact source specialization, mixed-coefficient identity, and explicit quadratic failure.

Nothing here reverses a pinned raw coefficient inequality, and no failure of the unrefined source polynomial's three-direction log-concavity follows. The inherited raw `j=2` result remains valid. There is no claim of published novelty in this audit.

## Matching recorded verification

All seven current final source hashes match the archived worker sources, host change receipts, and final artifact manifest. The chosen successful records, saved source snapshots, and compiled objects also match: 38 source/record/snapshot/object bindings were checked. The 14 printed theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`.

| Module | Final source SHA-256 | Compile | Direct replay |
|---|---|---|---|
| MarkovPolarization340 | `d31dfadcc7ea572d88ce15199b5b1967ba438396510a0a4c4222371e8833d6ee` | Passed | Passed |
| MarkovPolarizationBridge340 | `a926df612324f0583b0cdf4afc70af78d01b6e3d4199fbddf4f666d04effb449` | Passed | Passed |
| MarkovSecondCertificate340 | `9ba324a98f96996b994d47e53f54d4b5691de43ae5722001b943d20e6e66198f` | Passed | Timed out |
| MarkovSecondNormalized340 | `89faa933ccbbc460c2399faf009f932d154f2cca37b941255b8b0dd63bb33a62` | Passed | Passed |
| MarkovSecondCoeff340 | `3f21c2e5542650c11a65cacbed9478583c465760a02d15b5691ed738f619bca6` | Passed | Timed out |
| MarkovSecondSource340 | `18c23346dc86108747eadcea029b841cbbbd2c0b3ff488bd80a50e7ce34e5593` | Passed | Passed |
| MarkovSecondAll340 | `517ebcb7399a3538708e54226ecdb462f3bc557ff7ebf1c3b84e1d5b5f44bbd3` | Passed | Passed on sequential retry |

The `b≥5` source replay `run-MarkovSecondSource340-replay-1792015118374965000.json` completed at **2026-10-14 21:59:35.117253 UTC**. The final all-denominator replay `run-MarkovSecondAll340-replay-1792015371553997000.json` returned code 0 after **64.274881833 seconds**, at **22:03:55.828879 UTC**. Its source hash is the final hash above, matching the earlier successful compilation and current object.

The archived event sequence is explicit: the three concurrent final replays hit 150-second bounds; item 116 then launches and completes the sequential all-denominator retry. Interim finalizer item 118 still records only four replay successes. Finalizers 123 and 125 incorporate the fifth success, with the last checkpoint update in item 124. Final validation, report, checkpoint, and mathematical note all match archive/current/host hashes. The host timeout occurred later, at **22:04:15.052519 UTC**, after 1201.98 seconds, with a null top-level report. The durable mathematical checks preceded that timeout. No current-only later replay receipt was found.

There are 22 recorded validation attempts: 12 successes (seven compilations, five replays), seven rejected compilations, and three timed-out replays. The successful sequential retry supersedes the earlier all-denominator replay timeout, while the two helper timeouts remain unconfirmed. Rejected source versions and error-generated placeholder output are not accepted as final proof evidence.

The protected root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The canonical goal hash remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. The worker's separately recorded `contract_sha256` is the raw hash of `.control/markov/contract.json`, `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; that also matches. These different hash conventions do not indicate a changed mathematical target.

Inherited compiled imports were reused, as the worker records. This audit inspected matching recorded compilation and replay evidence; it did not independently rerun Lean or rebuild the complete inherited development.

## Finite evidence and remaining scope

The exact source probe covers coprime `1≤a<b` with **5≤b≤70**, totaling 1,488 source parameters. It records 68,316 coefficient identities and 64,596 strengthened triples with no failures. It does not include the small denominators, whose coverage comes from the Lean assembly. The 119 recorded source-polarization tests and the 14,321 selected envelope tests are finite experiments, not universal results. No external literature claim was required as a new Lean axiom in the accepted proof.

The new mathematical content is a stronger bound on a previously proved row, plus an exact obstruction to a stronger auxiliary polarization property. The all-source statement's conditions and quantifiers agree with the English account. Its complete-log-concavity interpretation should retain the formal-scope qualifications above. Full Markov Conjecture 6.3 remains open in this development.
