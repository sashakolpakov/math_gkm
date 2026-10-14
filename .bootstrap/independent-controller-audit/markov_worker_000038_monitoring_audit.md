# Independent monitoring audit: worker 000038

Request: `6a40862beebd4a1a8207ff0222f0451d`. Audited on 2026-10-14. Final hash comparison: 15:44:15 UTC.

This is an observational mathematical/source/evidence review, not a new proof campaign or independent rerun. No active repository files were edited; no compilation, replay, proposer communication, repair, or successor operation was initiated. Exact reviewed source and selected records are saved in `markov_worker_000038_audit_evidence/` beside this note; its `summary.json` records full hashes and receipt comparisons.

## Verdict

The mathematical claims and their stated limitations agree with the final Lean sources. Three modules (22 named theorems in total) have source-matching successful compilation and kernel-replay records: polynomial nonnegativity, the split polynomial identity, and basic binomial ratios. The final rational-monotonicity module (three more named theorems) has a source-matching successful compilation, with standard printed axiom closures, but **no successful kernel replay**. Its late replay receipt explicitly records a timeout. It must remain distinguished from the three replayed modules.

This is auxiliary progress on normalized layers for the Pell source family `a/(a+1)`. No new universal raw-coefficient log-concavity theorem, no complete Pell horizontal/vertical theorem, and no proof of the pinned `MathGKM.Markov.Conjecture63` is present. The documents expressly retain the missing source/binomial-layer bridge and total-fiber positivity obligation.

## Exact evidence status

| Final module in `research/` | Named theorems | Compilation | Kernel replay |
|---|---:|---|---|
| `MarkovLayerPositive6a40.lean` | 6 | success, 12.256 s | success, 40.335 s |
| `MarkovLayerIdentity6a40.lean` | 10 | success, 137.948 s | success, 57.812 s |
| `MarkovBinomialRatios6a40.lean` | 6 | success, 7.292 s | success, 43.885 s |
| `MarkovLayerMonotone6a40.lean` | 3 | success, 49.214 s | timed out, 25.125 s |

Selected receipt filenames, in the same row order:

- Positive: `run-1791991400450470000.json` and `run-1791991572901752000.json`.
- Identity: `run-1791991590540311000.json` and `run-1791991766228173000.json`.
- BinomialRatios: `run-1791991505435660000.json` and `run-1791991591737524000.json`.
- Monotone: `run-1791991842424211000.json` and late timeout `run-1791991905052867000.json`.

All are under `evidence/markov-6a40862b/`. Every selected record's source hash matches the saved final source. Each final module's current source matches the controller archive, and each current compiled artifact matches the validation manifest, controller receipt, and archived artifact bytes. This is evidence consistency verification; inherited imports were not independently rebuilt.

Final source SHA256 values:

```
Positive       7bda2e2957cebd34008f6e9ff180e8b46c6e198d10fd6e722015b33783fa4278
Identity       b20ef44819b6944fa61dad481807d6b593cb6366ec6eef3d3f6f639be2daf209
BinomialRatios fdda232ff7f1be421cd3edf06b031b07fffd31957de4e7e82230bc4ba4421676
Monotone       fb5e095a1c6fba7cbb8a995cb75fb24fa560edfbcac46db7d746b333ffb8e6d9
```

The printed axiom closures in successful records for `layerCert6_nonneg`, `layer_certificate_identity6`, `bc_lower6`, `bc_upper6`, `bc_lower_ratio6`, `bc_upper_back6`, `layer_cleared_monotone6`, and `layer_ratio_monotone6` contain only `propext`, `Classical.choice`, and `Quot.sound`. These are the recorded printed closures, not a fresh exhaustive `#print axioms` run. The final source proofs do not introduce custom axioms or admissions. The rejected earlier Monotone elaboration printed `sorryAx` after an error; that failed source/result is not the final successful build or accepted evidence.

The superseded `MarkovLayerCertificate6a40.lean` timed out. It is not imported by the accepted split modules and is not counted as accepted. Earlier failed versions of Identity, BinomialRatios, and Monotone are likewise excluded.

## Replay timing and controller outcome

The manifest was written at `2026-10-14T15:31:46.543790Z`; it correctly has `replay: null` for Monotone. Worker 000038 timed out after 1201.453 s at `15:31:52.785856Z`. Its controller receipt has `outcome: timeout`, `report: null`, and `mathematical_resolution: false`; the process return code alone does not establish completed worker reporting.

The Monotone replay started around `15:31:45.052867Z`. The late receipt was written at `15:32:10.178859Z`, after the worker timeout; it records `timeout: true`, no return code, and no successful checker output. This late receipt is absent from the worker's archived artifacts. The archived event transcript starts the replay but never records its completion. The saved research report conservatively accepts only Positive, Identity, and BinomialRatios. There is no hidden successful replay inferred from the compiled `.olean`, process exit, or finalizer invocation.

## English versus Lean mathematics

### Polynomial certificate and exact identity

The definitions `layerAN6`, `layerAD6`, `layerBN6`, `layerBD6` are the literal factors of

\[
 A(q)=\frac{(2s-j+q)(2s-1-j+q)}{(a-s-q+1)(s+q-1)},\qquad
 B(q)=\frac{(a-s-q)(s+q)}{(2s+2-j+q)(2s+1-j+q)}.
\]

`layerN6 / layerD6` is the common-denominator expression for `A(q)B(r)+A(r)B(q)` when the denominators are nonzero. The denominator is the product `AD(q) BD(q) AD(r) BD(r)`; no factors have been silently cancelled.

The five `layerC6_i_nonneg` results prove nonnegativity of five explicit real polynomials for nonnegative `d,e,h`. `layerCert6_nonneg` combines them with nonnegative powers of `x`. The exact certificate JSON has 1140 distinct monomials, all with positive rational coefficients, and degree at most four in `x`; I independently checked those metadata claims. Positivity of this auxiliary certificate is not positivity of a complete source fiber.

`layer_certificate_identity6` is an unconditional real polynomial identity in `x,d,e,h`, with `s=(d+e+2)/2`, `r=x+d+2`, `j=r`, and `a=s+r+h`. It equates the cross-multiplied difference

\[
 N(q,r)D(q+1,r-1)-N(q+1,r-1)D(q,r)
\]

to `(d+1)(e+2)(d+e+3) layerCert6 x d e h`. The four expansion lemmas and five coefficient identities establish the full expression; this is not merely a collection of sampled coefficient checks.

### Rational monotonicity: compiled, not successfully replayed

`layer_cleared_monotone6` has real parameters and exactly the assumptions

\[
 0\le q,\quad q+2\le r,\quad r\le j,\quad j\le2s+q,\quad s+r\le a.
\]

It proves the cross-multiplied inequality in the direction corresponding to a decrease of `N/D` under `(q,r) -> (q+1,r-1)`. The proof substitutes the nonnegative slacks `x=q+(j-r)/2`, `d=r-q-2`, `e=2s-j+q`, `h=a-s-r`; its polynomial equalities account for the translation to the reduced coordinates. The English description of that reduction is accurate.

`layerD_positive6` proves strict denominator positivity under `s>1`, `q>=0`, `q<=r`, `j<=2s+q`, and `s+r<=a`. `layer_ratio_monotone6` adds `s>1` to the cleared theorem's assumptions and uses positive denominators for both endpoint pairs to justify division. It consequently proves

\[
 \frac{N(q+1,r-1)}{D(q+1,r-1)}\le\frac{N(q,r)}{D(q,r)}.
\]

The stronger separation assumption `q+2<=r` makes the shifted pair ordered, including equality at gap two. It does not include the already central pair or adjacent pair as an application. No zero-denominator inference is used: for example `s=1,q=0` can make `AD(q)=0` and is excluded by the strict `s>1` requirement. These are checks of theorem meaning and boundary conditions, not newly formalized test theorems.

### Binomial identities and division conditions

`bc6 n k` is the real cast of the ordinary natural binomial coefficient. The two multiplicative recurrences are unconditional for all natural `n,k`, including out-of-support zeros. The forward lower-index ratio divides by `k+1`; the backwards upper-index ratio divides by `n+1`, both always positive.

The remaining division lemmas have the necessary support conditions: `bc_upper_ratio6` assumes `k<=n`, while `bc_lower_back6` assumes `k<n`. Dropping these hypotheses would fail respectively at `k=n+1` and `k=n`: the claimed equality would be `1=0` under Lean's totalized division. Thus the English expectation of endpoint care agrees with the formal statements. `binTerm6` is only a definition; this module does not yet identify it with the source summand or prove the complete product-ratio bridge.

## Missing source-level obligations and exact scope

The intended summand is

\[
 H_s(q)=\binom{a-q}{s}\binom{s+q-1}{q}\binom{2s}{j-q},
\]

with the integer center support described for `s>=2`. The notes explicitly label the identification of the normalized signed binomial layer with `2-K[A(q)B(r)+A(r)B(q)]` as not yet assembled in Lean. The rational real-parameter theorem is not, on its own, a theorem about those source coefficients. Support/zero cases and the middle pair's half-weight in regrouping also remain outside this worker's completed bridge.

The single-crossing/centered-tail discussion retains the separate requirement that the total fiber be nonnegative. A monotone normalized layer does not establish that requirement. The documents therefore correctly say that even the completed ratio bridge would not itself prove `HorizontalFiberGoal9a72`, the whole Pell family, or `Conjecture63`. Auxiliary normalization has not replaced the protected raw coefficient predicate.

The finite diagnostic reports 16000 seeded random trials and 8148 trials with nonzero center products. Inspection of its script gives `3<=a<400`, `2<=s<a`, `0<=j<=2a`, `0<=k<=2(a-s)`, with all tested `q<=floor(k/2)` inside each sampled fiber. It uses exact integers and rational arithmetic and reports no mismatches. This is sampled finite evidence, not exhaustive coverage of those ranges, not universal positivity, and not a Lean proof. I inspected the script and result rather than rerunning it.

## Final state

All saved reviewed sources, English documents, selected receipts, and the manifest/report remained byte-identical at the final comparison. The protected root `MathGKM/Markov.lean` still has SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. No final goal completion is supported or claimed. The substantive addition is a checked polynomial positivity/identity foundation and elementary binomial identities, plus a compiled rational-monotonicity theorem whose replay did not finish successfully.
