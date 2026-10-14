# Independent monitoring audit: worker 000054

Request `e27336bcd7374c768840a75b2276fcb8`, reviewed 2026-10-14. This was a read-only mathematical and evidence audit. No active source edits, proof suggestions, proposer contact, compilation/replay retries, numerical experiments, or successor operations were performed. Companion snapshots and receipt/hash comparisons are in `markov_worker_000054_audit_evidence/`; the separate formula review is `markov_worker_000054_formula_audit.md`.

## Verdict

All **nine final modules, containing 33 named theorems, compiled successfully**. Six modules, containing **25 named theorems**, completed direct separate kernel replay. ChooseShape, SparseKernel, and Interior have only timed-out direct replays. The last Interior retry also timed out; there is no late success omitted from the final manifest.

The two source advances are correctly stated and actually tied to the protected raw coefficients:

- Every source path satisfying `3a<=2b` has the second-lower-diagonal inequality, with total degree `a+2` and all three polygon guards.
- For every non-Pell path written `true^n ++ false :: rest`, the same raw inequality holds in the explicitly specified lower and upper open index regions.

These source modules have successful direct replay. The exact residual equivalence compiled but did not complete direct replay. It removes the slope-band case on the second slice; it does **not** incorporate the separate open-region inequalities into its definition.

The arbitrary-run formulas, guarded shifted-binomial interpretation, and two-run correction agree with the English account. No mathematical statement mismatch was found. The seven transition certificates are still symbolic candidates, not Lean source inequalities. The full conjecture remains unproved and unrefuted.

## Validation and final provenance

| Module in `research/` | Named theorems | Build | Direct replay |
|---|---:|---|---|
| `MarkovChooseShapeE273.lean` | 1 | exit 0, 19.228 s | timeout, 150.016 s |
| `MarkovInteriorE273.lean` | 1 | exit 0, 10.692 s | timeouts, 150.021 s and 85.359 s |
| `MarkovQuinticE273.lean` | 7 | exit 0, 35.994 s | exit 0, 101.734 s |
| `MarkovRunKernelsE273.lean` | 4 | exit 0, 33.126 s | exit 0, 74.858 s |
| `MarkovSecondBandE273.lean` | 2 | exit 0, 46.497 s | exit 0, 87.088 s |
| `MarkovSecondInteriorE273.lean` | 2 | exit 0, 28.788 s | exit 0, 73.907 s |
| `MarkovSecondKernelE273.lean` | 4 | exit 0, 24.193 s | exit 0, 58.495 s |
| `MarkovShapeBridgeE273.lean` | 6 | exit 0, 21.739 s | exit 0, 108.849 s |
| `MarkovSparseKernelE273.lean` | 6 | exit 0, 22.706 s | timeout, 150.016 s |

All selected successful build records match the final source hashes and their saved source snapshots. Current sources also match archived source and controller change hashes. Current `.olean` files match the manifest, controller receipt, and archived artifact bytes. All selected replay records and snapshots, including timeouts, are present in the worker archive and match final sources. Successful printed main-theorem closures contain only `propext`, `Classical.choice`, and `Quot.sound`; no final source introduces admissions or custom axioms. These are reviews of recorded checks, not independently rerun exhaustive axiom or kernel checks.

The last Interior retry is `run-MarkovInteriorE273-replay-1792010271070349000.json`, a timeout after 85.359 seconds, written at **20:39:16.431787Z**. It precedes the final manifest at **20:39:21.518973Z** and the controller timeout at **20:39:33.670814Z**. Archived event 196 records that timeout; event 198 completes the updated finalizer with six successes. Thus the final manifest is current, unlike worker 50's earlier late-success situation. No further direct success was found.

The controller outcome is still `timeout`, elapsed 1202.510 seconds, `report: null`, and `mathematical_resolution: false`. A process return code of zero does not close the research goal. The documentation's final statement that all foreground checks ended is consistent with this worker's event tail; the mathematical replay classification remains six of nine.

The validation uses inherited compiled imports, explicitly disclosed in the notes. A downstream module's successful replay is not relabeled here as a new direct replay receipt for a helper whose own direct attempt timed out.

### Overwritten validation filename

The collision is real and precisely localized. Archived events **120 and 121** both report `run-1792009786351150000.json`, respectively for ChooseShape and SparseKernel. The surviving record identifies **SparseKernel** and matches its final source and compiled artifact. Distinct module-prefixed source snapshots survived.

The validator then changed this worker's receipt naming to include module and mode. ChooseShape was **recompiled** successfully under `run-MarkovChooseShapeE273-build-1792009842733497000.json`; archived event **135** records that fresh successful build and its permitted printed axiom closure. The final manifest accepts this unique fresh record for ChooseShape, and the surviving old record only for SparseKernel. Consequently no accepted final ChooseShape claim depends on interpreting an overwritten receipt as two checks. The old ChooseShape snapshot is retained as historical evidence, not substituted for the fresh final hash-bound build.

This repair did not produce a successful ChooseShape replay: its later direct replay still timed out. The collision and replay limit are both disclosed accurately. No repair was performed during this audit.

Final source SHA256 values are recorded in full in the companion summary:

```
ChooseShape    ff8b19d984ed5466660a5cc25b9af9f77180e8a7e5e89d80a8755a1dcdf616ea
Interior       7765fd4fd7ef264ee50e7ce7df9731d534130b5ada8bfb6d6a00a498b89dcc27
Quintic        10ce9e80543e425da353bf5c61cad79b667a36cd8a1b7fd5b40cf20b0ca0c618
RunKernels     88bcb40149ed5828848b8148d7dad96961328bb42e77ae25a54b450c1defac6e
SecondBand     5479d054885da07a069a7621049816df4a6bffecb25046ea6f0c23ac9995cafb
SecondInterior 09dca9092899ad6205f6734bc5b5dd8e1a79621e6cbd7b9616311c889c247f3a
SecondKernel   5a605742f1f9a5b4bcc2d11043fc6faa14f19d9b49fefa2295c7308b46503f5b
ShapeBridge    fbad1f9bcd9be4ea682d65c8a3a8618b5d65d5b803361cb034b088cc7d014fc9
SparseKernel   294cfc32a2d4b965593e71d8a54b3b9a08a56ed803fa82444693a28b19885dcc
```

## Arbitrary-run kernels, inversion, and zeros

The general kernel identities use the actual scalar recurrence polynomials `lowerH487`, `runCOneBF`, `runDTwoBF`, and their sum, for **every natural run length**. They clear powers of `(1-x)` as polynomial identities. They are not inferred from a bounded coefficient scan and do not require `x!=1` as a numerical hypothesis.

The second-slice compressed polynomial is twice the ordinary raw coefficient polynomial. The cleared identity retains the extra term

\[
[c=2]\,2x^{2n+3}(1-x)^4.
\]

Formal-power-series inversion uses the coefficients `choose(j+3,3)` and the formal identity with `(1-x)^4`. It invokes no analytic convergence and divides by neither a source coefficient nor a numerical value of `(1-x)`.

The sparse formula has **17 indexed summands**: seven at shifts `0..6`, five at `n+2..n+6`, and five at `2n+3..2n+7`. It is not necessarily a list of 17 distinct nonzero monomials after specialization: small run lengths can cause shifts to coincide, and coefficients can vanish. The formula remains a fixed 17-summand identity with the additional two-run correction.

Every shifted binomial is defined with the guard `k<=j` before subtraction:

\[
B(j,k)=\begin{cases}\binom{j-k+3}{3}&k\le j,\\0&k>j.\end{cases}
\]

Therefore a negative intended index is not accidentally converted by truncated natural subtraction into `choose(3,3)=1`. `q=(2r-c:ℕ)` is truncated before casting, whereas `c-r` inside the polynomial kernels is ordinary ring subtraction. The source use has `c=rest.b`, `r=rest.a`, hence `0<r<c` automatically; the general algebraic identities themselves have their stated broader natural-parameter scope.

The exact source bridge is for `path=true^n ++ false :: rest`, with total degree `i+j=a+2`; it states twice the actual raw source coefficient equals the explicit coefficient expression. This parameterization ranges over every non-Pell source path, without a denominator bound, and is not an arbitrary-word substitution.

### Two-run correction

The correction is **not the earlier Pell endpoint correction**. Here `c=2` forces the actual rest label to be `1/2`, so `r=1` and the full source label is `(2n+1)/(2n+3)`. At `j=2n+3`, the correction is +2 in the doubled coefficient, hence raw +1 at spatial position `i=0` on total degree `a+2`.

The guarded inversion retains this term as `[c=2 and j=2n+3]2`. Both open shape ranges end before that index, so allowing `c=2` in those bridges does not silently discard a nonzero correction inside their domain.

## Shape bridges and actual source open regions

The new exact equalities are:

- `3<=j<=n`: `6 A(i,j)=lowerShape446(n,c,r,j)`.
- `n+3<=j<=2n+2`: `6 A(i,j)=8 upperShape446(c,r,2n+2-j)`.

Both include the raw slice relation `i+j=a+2` for the actual path `true^n ++ false :: rest`. The factors 2, 6, and 8 are uniform algebraic scalars. They are not factorial or index-dependent coefficient normalization.

The helper cubic-binomial identity has the explicit guard `k<=j+3`, correctly including the first three zero positions beyond `j`. Beyond that domain no such unguarded cubic replacement is asserted. This is significant at transition indices.

`MarkovSecondInteriorE273` applies the inherited shape inequalities to all three coefficients only when their complete ranges are covered. For a raw diagonal triple `(i,j+2),(i+1,j+1),(i+2,j)` on total degree `a+2`, the **starting index** must satisfy either

\[
3\le j,\quad j+2\le n,
\]

or

\[
n+3\le j,\quad j+2\le2n+2.
\]

No polygon assumption is needed for these stronger all-natural-index identities/inequalities; in particular they apply to the guarded root triples. The proof supplies `0<r<c` from the actual reduced rest label and cancels only positive uniform factors after multiplying equalities. Zeros are not filtered. Both source inequalities have direct separate replay success.

For `n>=5`, the proved start ranges are `3..n−2` and `n+3..2n`. They leave precisely starts `0,1,2,n−1,n,n+1,n+2`, then `2n+1` onward. The prose correctly lists those remaining transition/tail locations. For smaller run lengths some ranges are empty; no blanket proof for `n=2,3,4` is inferred.

## The complete n=1 slice and the source slope band

The quintic polynomial identity is exact for the compressed second slice at leading run length `n=1`. Its six displayed coefficients, including `8 max(2r−c,0)+[c=2]2`, are followed by an explicitly infinite zero tail. The identity is algebraic for natural `c,r`; the all-adjacent inequality theorem assumes `0<r<c`. The first three gap certificates use nonnegative slacks, and the fourth explicitly separates `c=2` and the sign of `2r−c`. Tail cases are proved rather than deleted.

`source_true_false_secondE273` transports this identity to the actual source `true::false::rest`, at total degree `a+2`, for every natural raw index on that slice. Multiplication by two in each coefficient is removed uniformly in the final inequality.

`source_second_lower_bandE273` then treats an arbitrary path with **`3a<=2b`**, splits at its first false letter, and uses the actual source label formulas to show that a non-Pell path has leading run length `n<=1`. It combines the established `n=0` case, the new `n=1` theorem, and the inherited Pell raw diagonal theorem. The conclusion retains all three original `InPolygon` guards and the exact slice hypothesis `i+j+2=a+2`. There is no bound on denominator, run length of the rest, or total path length.

This proves one full lower slice in a slope band, not all diagonals for those sources, and not the second slice for every slope. It is a genuine source theorem rather than a theorem solely about an artificial parameter sequence.

## Exact remaining-root equivalence

`Interior63E273` keeps the inherited horizontal and vertical residuals unchanged. Its diagonal clause retains all original polygon guards, the top-layer restriction `i+j+5<=a+b−1`, and the lower restriction `a+2<=i+j+2`, and adds

\[
a+3\le i+j+2\quad\lor\quad 2b<3a.
\]

If that disjunction fails, the lower restriction forces total degree exactly `a+2`, and the slope satisfies `3a<=2b`, exactly the new source-band theorem's domain. `root_iff_interiorE273` therefore proves an unconditional equivalence to the pinned root, inheriting its endpoint clauses through `root_iff_interior487`. There is no hidden conjecture premise in the source theorem; the remaining residual proposition itself is unproved.

This residual definition removes only the slope-band case. The separately proved arbitrary-run open-region inequalities have not been added as exclusions to this particular residual. The residual equivalence has successful compilation and permitted printed axioms, but its direct separate replays timed out.

## Transition candidates, tail limits, and finite checks

The seven saved transition expressions each contain 75 strictly positive integer monomial coefficients after the stated slack substitution. Static inspection confirms the script and JSON agree. Their intermediate candidate coefficients are scaled by 6 relative to the doubled-coefficient formula, so the stored gaps are scaled by 36 relative to doubled gaps (144 relative to raw source gaps if the intended bridge is established). They are **not new Lean source inequalities**; positivity of a saved symbolic expression does not supply the missing source/index transport or boundary proof.

The first two displayed doubled tail entries for `n>=2` follow from the upper shape at reversed indices 1 and 0. The final term at `j=2n+3` is outside that shape bridge. The final paragraph correctly states that its source-tail bridge is still missing; no complete tail theorem is accepted from the paragraph.

The finite experiment covers 4620 parameter triples `n=0..21`, `c=2..21`, `0<r<c`, with `j=0..2n+7`, giving 133980 coefficient checks and 124740 adjacent-triple tests. These are parameter tests, not 4620 distinct demonstrated source paths. The same two-run correction is added to both compared Python sides, so the experiment checks consistency with the correction retained; its independent derivation comes from the formal identity, not that shared addition. No experiment was rerun during this audit.

## Final state

All final source/archive/artifact hashes agree. The overwritten-record incident has a clean final acceptance trail through the unique fresh ChooseShape build. Six direct replays succeeded; three modules remain direct-replay incomplete. The source band and open-region claims have the exact ranges and correction handling stated above. The transition, small-run, and final-tail cases are not silently promoted into universal second-slice log-concavity.

The protected root remains unchanged at SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. No full proof or refutation of `Conjecture63` is present.

Final byte comparison at **2026-10-14T20:58:53.876239+00:00**: all 70 saved active inputs still match their reviewed hashes. The completed separate formula audit found no discrepancy; no additional compilation or replay was run.
