# Independent monitoring audit: worker 000057

Request `7d80a785cc54418dbc60c87975360f76`. Read-only review of `.control/markov/workers/000057/artifacts`, the archived events and host receipt, and matching final project files. No project changes, proposer contact, proof guidance, fresh builds, replays, or experiment reruns were performed.

## Finding

The main theorem proves the **actual raw vertical inequality for every source path on the strip `i+j+3=a+b-1`**, with the original starting-point polygon guard. No slope, numerator, denominator, or path-length restriction remains. Its exact residual equivalence also checks out semantically.

All nine final modules compiled with standard printed axiom closures. The final source theorem and exact residual equivalence each have a matching successful direct kernel replay. The other seven modules have no successful individual replay recorded. The final residual replay completed after interim manifests but before the host timeout, and was incorporated into the final archived manifest. The full conjecture remains unresolved.

## Exact English meaning

For `m=(frame path).mid`, write `a=m.a`, `b=m.b`, `d=a+b-1`, and `A(i,j)=coeff m.p i j`. These are the literal integer coefficients of the original numerator. `source_next_vertical7d80` states, for every finite Boolean source path and natural `i,j`,

`A(i,j)*A(i,j+2) ≤ A(i,j+1)^2`

under `InPolygon a b i j` and `i+j+3=d`. The compared entries therefore lie in the fourth, third, and second upper layers. This is a vertical triple, not a claim of log-concavity along an entire constant-total-degree diagonal or an entire column.

The original polygon guard is `a*b≤b*i+a*j` together with `i+j≤d`. The later points also lie in the polygon: their lower inequality follows by increasing `j`, and their upper inequality follows from the strip equality. Thus using only the first guard does not omit a needed source condition. No coefficient positivity assumption is imposed, and no coefficient is divided out. For `a≥4`, the intermediate theorem is stronger and requires only the strip equality, including natural-index positions outside the polygon. For small numerators the final theorem retains its polygon restriction; it does not claim arbitrary outside-polygon triples for these cases.

This agrees with the principal vertical direction in the published [Definitions 6.1–6.2 and Conjecture 6.3](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html). The displayed theorem has no premise asserting any part of the unproved root.

## Source structure and coefficient bridge

The new switch bound concerns the actual source central word. `palindrome_mixed_switches7d80` proves that a nonempty Boolean palindrome containing both letters has at least two adjacent switches. The source application uses the checked palindrome identity, central-word length `b-2`, and true-letter count `a-1`. Under `a≥2` and `b≥a+2`, both letters occur. `source_fourth_mixed7d80` then supplies an actual switch count `s≥2` together with the exact cubic quotient-slice identity. This is not an arbitrary auxiliary word assumed to represent a source.

`source_vertical_low_mixed7d80` translates that identity to the literal raw coefficient by the existing upper-slice factorization and coefficient extraction. Its assumptions include `D=i+j≥3`, precisely the regime in which the required exponent `D-3` and scalar clearing are used. The other two source identities are proved from the inherited upper-layer coefficient formulas and exact binomial identities.

With `B=a-1`, `N=b-1`, `F=choose(D,i)`, and raw entries `L,M,R`, the checked identities are

- `6*D*(D-1)*(D-2)*L=F*T(s)`;
- `2*D*(j+1)*M=F*Q`;
- `(j+1)*(j+2)*R=(D+1)*F*(B*(j+2)+N*i)`.

Here `N+B=D+2`, and `Q` and `T` are the explicit checked polynomials used in the source. The natural source bounds imply `B≥0` and `N≥B+1`. The gap identity multiplies `M^2-L*R` by `12*D^2*(D-1)*(D-2)*(j+1)^2*(j+2)`. This factor is strictly positive when `D≥3`; only this factor is canceled. The binomial coefficient and the three raw coefficients may be zero without invalidating the argument.

The dependence of `T` on the switch count is proved algebraically: `T(s0)-T(s)=12*(s-s0)*i*j*(j-1)`. Since `j` is natural, `j*(j-1)≥0`, including `j=0,1`. Thus a proved lower bound on the switch count gives the required upper bound on the low-layer contribution with the correct sign. There is no unsupported independence, probability, or generic-word hypothesis.

## Exhaustive parameter cases

For `a≥4`, the gap certificate uses `B≥3` and `2*B≤D+1`, both consequences of actual source bounds. It handles `i=0,1,2` by explicit polynomial certificates and all `i≥3` by the larger certificate. The large theorem is an identity over real parameters with nonnegative constraints, not a bounded parameter scan. The certificate identity is checked with `ring`, and nonnegativity with `positivity`.

For `a=2,3`, `vertical_small_gap7d80` covers `B=1,2`, all natural `i,j` with `D≥3` and the source interval constraint. At `i=1` it uses the envelope `s0=2`; at other indices it uses `s0=0`. The source assembly proves from polygon membership and the strip equality that `i=1` forces `b≥a+2`. The actual-source switch theorem therefore discharges the only additional bound. No small-numerator case is assumed away.

The `a=1` case uses the inherited complete source-one-family theorem, deriving the two later polygon guards. If `a=2,3` but `D<3`, the starting polygon guard first implies `a≤D`; the remaining arithmetic would force `(a,b)=(2,4)`, contradicted by source coprimality. Thus there is no omitted low-degree case. The cast/subtraction guards are supplied explicitly where natural subtraction is converted to real subtraction.

## Exact residual and endpoints

`root_iff_interior7d80 : Conjecture63 ↔ Interior637d80` changes only the outstanding vertical strip relative to `Interior637955`. Both remaining horizontal and vertical clauses retain all three original polygon guards and now require `i+j+4≤d`. The diagonal clause remains guarded by `i+j+5≤d` and `a+3≤i+j+2`.

In the reverse implication, the old vertical condition is `i+j+3≤d`. Either the new interior condition holds, or the missing case is exactly `i+j+3=d`, discharged by `source_next_vertical7d80`. Both endpoint clauses and the other directions remain represented through the inherited root equivalence. The residual is still an infinite unproved proposition; the equivalence does not certify it as true. No circular hypothesis or weakened target was found.

## Source hashes and recorded checks

All final source hashes agree among current files, archived worker files, host change receipts, and the final artifact manifest. The selected successful build/replay records and their saved source snapshots also agree. Compiled-object hashes agree among current files, archives, host receipts, and the artifact manifest. Forty such source/record/snapshot/object bindings were checked. The 11 printed theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`.

| Module | Final source SHA-256 | Compile | Successful individual replay |
|---|---|---|---|
| MarkovSwitchLower7d80 | `7a54d6b67691c0547763f981f9b6ac66903b7a2719b88dc3514205be1f255f1e` | Yes | No; two timeouts |
| MarkovVerticalMixed7d80 | `d0bb17b0766cbb1d5ae07da7acfbceb1ef54d89047e8a2feb1429466a7d8c0f0` | Yes | Not recorded |
| MarkovVerticalCertificate7d80 | `76be67f1d648bd29cf5ce55955f58caaeed8492d62e1b523482a34269b40d2a7` | Yes | No; timeout |
| MarkovVerticalSmall7d80 | `05544ae15af074ad1ba2da94c96b92c61d15aa14e794cf5e4c7745d573e2dd7d` | Yes | Not recorded |
| MarkovVerticalSource7d80 | `c0c2680443620be087f17c7e55dff8137b6c033c4674d1eabf638c48599f563e` | Yes | Not recorded |
| MarkovVerticalAlgebra7d80 | `73ca1f34bed20259a9dc429f0962865fab83ab7d71fd5af3cd00d0791afa3b54` | Yes | Not recorded |
| MarkovNextVertical7d80 | `162a2ee0f28e114057a899967c07f1907d00a9fa3f0b37751e2326d73197a2d5` | Yes | Yes |
| MarkovInterior7d80 | `37f8d8097dff1736f3590133ac6dd997ac753f61b4ff77d1f8fdd08047fa4e36` | Yes | Yes |
| MarkovOtherDirection7d80 | `3b8270eb82db1d9f11aaf68d91a58e459bf6b81a14d65a798d0687731d963ae6` | Yes | No; timeout |

The source theorem compiled in `run-MarkovNextVertical7d80-build-1792013873091388000.json` and replayed successfully in `run-MarkovNextVertical7d80-replay-1792013968687614000.json`; the replay finished at **2026-10-14 21:41:41.350224 UTC**, after 132.66 seconds. The exact residual compiled in `run-MarkovInterior7d80-build-1792013967500924000.json` and replayed successfully in `run-MarkovInterior7d80-replay-1792014114116826000.json`; its replay finished at **21:43:28.529709 UTC**, after 94.41 seconds.

Archived events show two interim finalizer runs, items 122 and 125, reporting the residual replay as unconfirmed while it was still running. Item 120 subsequently reports replay return code 0; item 129 records the completed checkpoint update; item 130 reruns the finalizer and records both successful replays. The final manifest, checkpoint, and durable report match both the archive and host hashes. The host still reports timeout at **21:43:51.953114 UTC**, after 1204.30 seconds, with a null top-level report. This operational timeout does not erase the earlier successful durable checks. There are no current-only later replay records.

Nineteen recorded validation attempts comprise eleven successes—nine compilations and two replays—and eight rejected or timed-out attempts. The failed earlier assembled source printed an error-generated placeholder closure; that rejected source hash is different from the corrected final source. It is not an accepted proof. The large certificate's initial compilation timeout was followed by a successful compilation of the matching final source. No timeout is upgraded to a successful individual replay.

The pinned root hash remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; the canonical contract hash remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Both were independently recomputed. Inherited compiled imports were reused. These are inspections of recorded matching checks, not a fresh whole-development rebuild or a new independent kernel replay.

## Finite experiments and literature scope

The exact finite probe enumerates coprime `1≤a<b≤64`, totaling 1,259 source parameters. It records 154,628 middle/last coefficient-identity checks, 77,183 polygon-guarded vertical triples, and 1,134 source switch checks, with no recorded failures. These counts are separate kinds of checks, not that many distinct source polynomials. They do not establish the universal theorem by enumeration.

The literature observation accurately describes the finite-fiber midpoint inequality in Leake–Mohammadi Yekta's [Theorem 1.4, arXiv:2609.39917v1](https://arxiv.org/html/2609.39917v1), dated 30 September 2026; Theorem 3.1 treats fixed boxes with weights. No such external theorem is used as a new Lean axiom in the accepted source proof. This monitoring check does not certify that preprint's proof or establish a Markov identification.

The auxiliary formal obstruction uses the actual source `1/9`, path `replicate 7 false`, and positions `(0,9),(1,6),(2,3)`, proving labels, all three polygon guards, raw coefficients `[1,7,50]`, and `49<50`. It rules out the stronger all-direction conclusion, not the pinned three-direction conjecture. It is a **re-proof of the existing worker-25 witness** in `MarkovDirectionObstruction3eda.lean`, not a new obstruction. An affine coefficient-preserving identification satisfying the cited fixed-matrix fiber hypotheses would conflict with this witness; no claim about all conceivable representations follows. The 2,679-case route experiment is finite evidence separate from the formal witness.

No substantive English–Lean mismatch was found in the new universal vertical-strip theorem or its exact residual equivalence. The useful advance is one additional universally proved vertical strip, including small numerators and all admissible boundary cases; the remaining interior inequalities are still open.
