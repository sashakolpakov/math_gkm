# Worker 000130 independent monitoring audit

Request `b9d0d3410a1644b6b35ab712bbfc87f7`; archive `/Users/sasha/math_gkm/.control/markov/workers/000130/artifacts`; suffix `MB9D`. Audit date2026-10-16 UTC. This archive-first review reads completed records, exact named counterparts and sealed predecessor evidence. It executes no Lean, checker, replay, experiment, finalizer, project code, coefficient, polynomial/matrix recurrence, inequality gap or symbolic expansion. Own computations are static parsing, hashing and integer label/index/polygon-domain counts. No project changes, active131 inspection, proposer contact or research assistance occurred. Output is confined to `/private/tmp/math_gkm_godel_20261013`.

## Finding and accepted scope

The saved final sources and matching records support **six accepted mathematical modules,21 theorem closures and seven definitions**, all compiled, selected once in one successful replay union, and covered by21 exact named axiom prints. Controller outcome is **completed**, returncode0, elapsed1625.5472819805145seconds, with final report and turn.completed. Mathematical completion remains null.

`source_strip_all_lowMB9D` proves, for every generated path with **3a≤b** and every natural i,

```
coeff P i 1 * coeff P i 3 ≤ coeff P i 2 ^ 2,
where P=(frame path).mid.p, a=(frame path).mid.a, b=(frame path).mid.b.
```

This is the literal **vertical** triple **(i,1),(i,2),(i,3)**. No denominator upper bound, polygon restriction, nonzero coefficient, source formula, scalar-gap or auxiliary shape assumption remains. Natural zero positions and both degree boundaries are included. The condition3a≤b remains essential to the claimed new scope; finite tests outside this condition do not remove it.

`root_iff_interiorMB9D` establishes **Conjecture63 ↔ InteriorCore63MB9D**. The exact residual differs from MAA6 only by the added vertical condition **2≤j ∨ b<3a**, retaining the prior j≥1 condition and every original guard. The residual is unproved. No full-root proof or refutation follows.

There are also two excluded diagnostics: **MarkovStripTwoProbeMB9D**, compiled with one theorem and two definitions but not replayed or axiom-printed; and **MarkovProbeMB9D**, a compiled declaration-free `#check` probe. Neither enters accepted imports. Thus six accepted modules are not the entire compiled source inventory. There is no unbuilt final Lean candidate or unfinished saved invocation; the proposed middle-cone extension remains candidate algebra/prose, not accepted theorem coverage.

The old worker121 **212 compiled-but-unreplayed modules remain unrecovered**, including the195-module subset. They are inherited imports in this round, not replay targets. Historical worker128 remains timeout/nullreport; its Clustered draft remains unvalidated and absent from accepted imports.

## Exact source formulas, statistics and indices

The protected raw convention remains `coeff P i j=(P.coeff i).coeff j`, without factorial normalization. The root polygon remains `a*b≤b*i+a*j` and `i+j≤a+b−1`. For actual paths, inherited `frame_reduced` supplies1≤a<b and coprimality.

The exact inherited second-row statistic is `s=2*(2a-b)` in natural arithmetic, hence twice the positive part of2a−b. Under **2a≤b**, `source_strip_twoMB9D` derives s=0 from `source_second_exactMAA6`, rather than assuming it. For b≥5 the cubic `secondExpr8934` then has an X factor. With n=b−2,m=a−1, the identity is rewritten as

```
2R2 = X^a(1+X)^(b-5) Q2,
Q2 = D + EX + FX²,
D = 9a²-5a+2,
E = 6a²+6ab-16a+4,
F = (a+b-1)(a+b-2),
Rj = (Bivariate.swap P).coeff j.
```

The equality uses m+1=a to combine `X^m*X`; it does not introduce a negative exponent or divide by X. This **formula** holds under the weaker cone2a≤b, but it is not by itself a vertical LC theorem on that larger cone.

Inherited `horizontal_third_formulaM13D` is an actual-source theorem requiring a≥2,b≥7. It supplies

```
6R3 = X^(a-2)(1+X)^(b-7) h3seed(a,b,q,t,u),
q=(2a-b)_+, t=min(b-a,(3a-b)_+), u=(3a-2b)_+.
```

All positive parts are natural subtractions before casting. Under3a≤b the new proof derives q=t=u=0, including the equality boundary. The seed's constant and linear coefficients vanish, giving exactly `X²*stripCubicMB9D`; a≥2 justifies `X^(a-2)*X²=X^a`. Consequently

```
6R3 = X^a(1+X)^(b-7) Q3,
Q3 = C2 + C3X + C4X² + C5X³,
C2 = 27a³-18a²+21a-6,
C3 = 27a³+27a²b-114a²+3ab+33a+6b-18,
C4 = 9a³+18a²b-54a²+9ab²-51ab+87a+3b²-3b-18,
C5 = (a+b-1)(a+b-2)(a+b-3).
```

This is specialization of the already accepted source formula, not a new assertion for arbitrary words or a conditional formula premise left unresolved. The inherited matrix/trace and source-word correspondence underlying that formula retains its earlier audit boundary; it is not rebuilt here. The two leading seed zeros are absorbed into the exact X² factor, not deleted from the raw sequence.

The new map lemmas explicitly transport Q2 and Q3 from integer polynomials to real polynomials. Extracting at **k+a** and applying `coeff_X_pow_mul` and `swap_coeff46` yields coefficients at the literal raw positions **(a+k,2)** and **(a+k,3)**, with factors2 and6. The inherited first-row identity similarly gives

```
R1 = X^a(1+X)^(b-3)[(3a-1)+(a+b-1)X].
```

No horizontal direction or diagonal slice is silently substituted for the vertical triple.

## Common-binomial adapters and gap transfer

Put **i=a+k**, **N=k+l=b−2**, and C=choose(N,k). This N differs from worker129's b−1 normalization. Here k is any natural number, including0, l≥2, and N≥5. Let cr=coeff P (a+k) r and define

```
T = (3a-1)l+(a+b-1)k,
J = D(l-1)(l-2)+Ek(l-1)+Fk(k-1),
H = C2(l-2)(l-3)(l-4)+C3k(l-2)(l-3)
  + C4k(k-1)(l-2)+C5k(k-1)(k-2).
```

The accepted equalities are

```
N*c1 = C*T,
2N(N-1)(N-2)c2 = C*l*J,
6N(N-1)(N-2)(N-3)(N-4)c3 = C*l*(l-1)*H.
```

`strip_choose_downMB9D` proves the exact multiplicative binomial downshift. `strip_linear_scaledMB9D` handles k=0 separately when extracting the X term and uses the successor binomial identity for k>0. `strip_quad_scaledMB9D` applies inherited degree-two coefficient identities at **k,l−1**, then the downshift. `strip_cubic_scaledMB9D` applies the inherited cubic falling-factorial identity at **k,l−2**, then the two-step binomial relation. The stated l≥2 and N≥5 conditions justify every natural index and exponent subtraction. The source adapters substitute b=N+2 and the exact row identities with their2/6 factors.

The abstract gap is

```
G = 3(N-3)(N-4)l*J² - 2(N-1)(N-2)(l-1)*T*H.
```

The final four certificate bodies unfold T,J,H,G, use ordinary Lean `ring_nf`, then `positivity`. Their regions are:

| Chart | Parameters substituted into G |
|---|---|
| large |a=A+1,k=K,l=L+5|
| two |a=A+1,k=K+3,l=2|
| three |a=A+1,k=K+2,l=3|
| four |a=A+1,k=K+1,l=4|

All chart parameters are nonnegative reals, including zero. The final assembler proves G≥0 for **all natural a≥1,k≥0,l≥2,k+l≥5**; the abstract gap theorem has no additional slope condition. It splits l≥5 from l=2,3,4. N≥5 then supplies k≥3,2,1 respectively. Thus k=0 is included through the large chart, as are every boundary equality and the top-degree cases l=2. Source use of this gap still needs3a≤b to identify its coefficients with Q2/Q3.

The saved generator reports255,45,45,45 positive terms for these four expansions. Those390 terms are exploratory generated-data counts, not an independently recomputed expansion in this audit. The final compact source is distinct from earlier literal-expansion attempts; its accepted proof is the `ring_nf`/`positivity` body, not a trusted Python claim or a failed generated snapshot.

`strip_gap_transferMB9D` derives the exact scalar identity

```
12[N(N-1)(N-2)]²(N-3)(N-4)*(c2²-c1*c3) = C²*l*G.
```

N≥5 makes the common left scalar strictly positive. The right side is nonnegative from G≥0 and l≥2. C may be any real in the abstract transfer; its square is nonnegative, and **no positivity or nonzero assumption on C or a coefficient is required**. No individual coefficient or binomial is divided out, and no reverse LC-through-smoothing inference occurs. The source result is cast back to the protected integer inequality.

## All starts, natural zeros and small sources

For a≥2,b≥7,3a≤b, `source_strip_lowMB9D` first handles i<a. The actual Lean proof uses **polygon containment at j=1**, together with a<b, to obtain c1=0. The written first-row factorization also implies the same zero, but is not the code path used here. If i+3>a+b−1, polygon containment gives c3=0. In either case the left product is zero and the middle square is nonnegative; no support saturation or deletion of zeros is assumed.

For the remaining indices, k=i−a≥0 and l=b−2−k≥2 are derived. Exact equality a+k=i reconnects the source adapter. **i=a (k=0)** is included in this interior argument; unlike worker129, it needs no separate vertex theorem. The upper equality i+3=a+b−1 corresponds to l=2 and is included. Arbitrarily large natural starts are covered by the zero case.

`source_strip_all_lowMB9D` then removes the separate a≥2,b≥7 assumptions. If a=1, inherited `source_one_global6` supplies raw vertical LC at starting j=1 for every i, including zeros. Otherwise a≥2. If b<7, the cone condition forces a=2,b=6, contradicting the inherited source coprimality. This excludes the sole apparent small-denominator case; it does not rely on a finite numerical check. The final theorem retains exactly the path,3a≤b and natural i arguments.

## Exact residual scope and endpoints

Static textual comparison with `InteriorCore63MAA6` confirms that the only added residual premise is **(2≤j ∨ b<3a)** in the vertical clause. Every clause still quantifies generated paths with a≥2 and all three original polygon guards. Write d=a+b−1:

| Direction | Literal triple | Additional residual conditions |
|---|---|---|
| Horizontal |(i,j),(i+1,j),(i+2,j)|i+j+4≤d; j≥5|
| Vertical |(i,j),(i,j+1),(i,j+2)|i+j+4≤d; i≥4; j≥1; **2≤j or b<3a**|
| Diagonal |(i,j+2),(i+1,j+1),(i+2,j)|i+j+8≤d; a+5≤i+j+2; a+2≤b|

In the reverse equivalence, failure of the new disjunction forces j=1 and3a≤b. The proof invokes **source_strip_lowMB9D**, deriving a≥2 from the residual and b≥7 from its combined numeric guards; it does not directly invoke the later all-low wrapper. This is sufficient on that residual domain. The forward implication merely restricts the older vertical clause. Horizontal and diagonal clauses are unchanged.

Both special endpoints `WeakLC 0 1 1` and `WeakLC 1 1 (U+V)` remain part of the exact protected Conjecture63 through inherited `root_iff_interiorMAA6`. The new strip theorem itself quantifies generated middle frames. No endpoint is silently identified with a generic path. Full rational/source/Laurent/homogeneous correspondence and universal Newton-polygon identification retain their inherited end-to-end audit qualifications; no fresh literature or whole-source correspondence proof was performed here.

## Finite domains and candidate-only algebra

The saved experiment evaluates the original subtractive source recurrence and compares it to the positive word recurrence for every reduced interior fraction0<a<b≤40. Independent label counts reproduce **489 fractions and489 whole-polynomial comparisons**. Only **164** of those fractions satisfy3a≤b. The raw vertical scan uses every i in `range(a+b+4)`, without a polygon filter, giving **21621 triples**. It reports no failures across the broader finite set; this does not prove the remaining slope regions.

The coefficient-identity domain additionally requires a≥2,b≥7,a≤i and i+3≤a+b−1. It contains10931 positions, with three general identities each: **32793** comparisons. These general identities retain actual q,t,u and additional k+1 and k+2 clearing factors. The3208 eligible low-cone positions receive two additional specialized second/third identities: **6416** comparisons. The first identity is already counted in the general group. Thus the reported **39209** is32793+6416, not39209 distinct raw triples or fractions.

Polygon containment forces9977 sampled triples to contain a zero, from i<a or i+3>d, with no eligible interval in the smallest cases. That integer count matches the saved **9977 zero-containing triples**. Coefficients, identity truth, gaps, absence of extra interior zeros and failure counts were not recomputed. The scan's128.0562685second duration and empty failure list remain retained observations. Its archived caller and output are bound; inherited `scan.py` lies outside the worker before/index set, so its current named-source hash is recorded without claiming a runtime import binding. The other named experiment helpers match inherited pins.

The first symbolic table has **54 chart labels**:18 admissible k/l regions, each with zero, low_bound and actual_high parameter substitutions. Its negative expansion coefficients are observations about those trial certificates, not automatically negative polynomial values or source counterexamples. The label actual_high is not a substitute for proving source-domain conditions.

The separate middle table has **18 chart labels**, substituting `q=u=0,a=(k+l+2+t)/3` and multiplying the general cleared gap by81. All saved negative-coefficient counts are zero. This is exact exploratory algebra in retained output, not a Lean source adapter or a proof of region coverage. The quartic source specialization, Lean identities and chart assembly for **2a≤b≤3a** remain unproved here. This audit neither computes nor completes them. The final six-module theorem scope stays3a≤b.

## Final source inventory and diagnostic separation

| Accepted module | Theorems | Definitions |
|---|---:|---:|
| MarkovStripGapMB9D |4|4|
| MarkovStripSourceMB9D |6|2|
| MarkovStripCoefficientsMB9D |4|0|
| MarkovStripLCMB9D |2|0|
| MarkovStripAllMB9D |4|0|
| MarkovResidualMB9D |1|1|

All accepted final source hashes agree across archive, current exact-named file, controller/index, successful source snapshot/build, replay map, axiom map and validation. Objects have corresponding retained archive/current/controller/index/validation bindings. These associations are retained evidence, not independent source-to-object reconstruction.

`MarkovStripTwoProbeMB9D` has a successful build and retained object, but no selected replay or axiom print. Its two definitions and one theorem duplicate `stripQuadMB9D`, `stripCubicMB9D` and `source_strip_twoMB9D` in accepted StripSource. Static comparison shows its mathematical prefix matches that accepted source after whitespace normalization. They are duplicate names in separate disjoint modules, not additional accepted results. The probe is absent from accepted imports, so its object is not preloaded into the replay base; there is no target/base collision. Replay of StripSource is not retroactive selected replay of StripTwoProbe.

`MarkovProbeMB9D` declares no mathematical constant and only checks the inherited horizontal-third formula. It times out at30seconds and then compiles unchanged under a120second limit. It has an object but adds no theorem closure and is excluded from accepted selection/Audit. No final Lean source remains unbuilt; compiled-only diagnostic evidence is preserved distinctly from the accepted six.

There are **21 compiler receipts and21 immutable snapshots: nine successes, seven return-code1 errors and five wall timeouts**. Successes are six accepted modules, both probes and the Audit. There is no superseded successful source, failed replay or parser rejection. Eleven unsuccessful attempts use obsolete sources: three Gap attempts, six Source attempts, one Coefficients and one All error. The remaining failure is the same-final-source declaration-free Probe timeout. No failed elaboration or error placeholder is admitted.

The timeout limits are120seconds for Gap,120/120/150seconds for three Source attempts, and30seconds for Probe. A later Source attempt allowed180seconds but returned compiler error after110.908686seconds; it is not classified as a timeout. Changed versions and longer compile limits do not alter the replay method. One rejected Gap header contains unspaced `0≤stripGapMB9D`; the recorded diagnostic gives an erroneous Graph-related interpretation and unknown `tripGapMB9D`. Final source separates the comparison token from the identifier. Whitespace-erased header agreement therefore does **not** establish identical parsed statements or proof-only repairs. The earliest failed Source versions have four theorem declarations, while the accepted version adds the two explicit polynomial-map lemmas to reach six. These are textual version observations, not acceptance of failed elaboration or proof bodies.

One union replay selects exactly the six final accepted modules and **28 explicit declarations**,21 theorems plus seven definitions. One successful Audit imports those six and prints exactly21 distinct requested theorem closures. **All21 use only `{propext,Classical.choice,Quot.sound}`**. Source-bound axiom JSON and actual Audit compiler output match. No selected new admission, new axiom, native evaluation, unsafe or partial declaration was found. Definitions are replayed but not counted as theorem closures; the excluded probe theorem is not an extra printed closure.

## Method, imported dependencies and old replay backlog

The driver SHA-256 is `d9c6c97830cf639c343b2b7225b1143cc507fb1dd7fd36dd3d64fabaa4ec8414`. It is exactly worker129's driver after suffix substitution, with the ordinary Wide replay body unchanged apart from the inherited explicit-name guard. Compiler `-j1`, replay stack131072, joined task and result propagation are unchanged. No larger-stack retry or new bypass occurs.

The driver excludes the selected modules from the imported base, checks that explicitly named `MathGKM.Markov.*MB9D` declarations are absent there and not unsafe/partial, then calls ordinary environment replay. All28 explicit accepted declarations satisfy that guard. Private/compiler-generated and inherited names outside the predicate retain ordinary Lean replay handling. The source hash is measured after subprocess return, not as an invocation-start or runtime executable/library identity measurement.

The six selected modules form a dependency union and are excluded together; an antichain is not required. The five explicit inherited roots are BottomCoefficientsMAA6, FibonacciLC6ade, HorizontalThirdSourceM13D, ResidualMAA6 and MathGKM.Markov; adding implicit Init matches the reported six direct inherited imports. Their local transitive base has **2292 inherited modules**. The accepted ResidualMB9D closure has **2298=6new+2292inherited** nodes. Including StripTwoProbe gives2299 mathematical-closure nodes; adding the declaration-free probe and Audit gives2301. Driver and external Lean/Mathlib source trees are separate. No local cycle or unresolved import appears.

All final new dependency builds precede dependent successful builds, the Audit and replay. All six selected builds finish before the union; no new accepted module is left as a merely imported dependency. The2292 inherited source/object pairs consist of the2284 previously sealed inherited129 pairs plus all eight accepted129 modules. Their current bytes agree with those sealed bindings and before130 pins. Hash preservation is not a new rebuild or runtime import measurement.

The independent current-byte observation for those2292 pairs ran07:21:21.153931–07:22:10.163139UTC with no mismatch. This later audit time is not backdated to a worker proof receipt.

All **212 old121 backlog modules**, including195 Half dependencies, and19 previously accepted121 modules occur in this base. None of the212 is a current build or replay target; **zero are recovered**. Historical unbuilt121 candidates are absent. No accepted128 mathematical module or its pending Clustered source is imported. Reconciliation of128/129 manifests and new selected-body replay do not backdate missing checks or upgrade128's timeout.

The wrappers are exact worker129 copies after retagging. Successful console summaries suppress stdout while receipts retain full output. The axiom wrapper checks names, allowed sets, empty-set syntax and successful compilation; exact no-extra/no-duplicate coverage is independently checked here. The finalizer uses an explicit six-module list and is not designed to require replay of every compiled probe. Its actual source/build/replay/Audit bindings were independently matched. No fresh whole-source rebuild, independent runtime binary verification, official-checker admission or full-root completion is claimed.

## Preservation, finalizer and timing

There are **89 archive/controller artifacts,87 indexed**; manifest and last-verification are the deliberate nonindexed records and are separately bound. The local initial snapshot has5732 entries; the current worker's own setup script is excluded, leaving **5731 prior inputs**, including139 bytecode entries. This exclusion is a current-run setup artifact, not a changed prior dependency. The six inherited administrative hashes match. Both predecessor indexes are rechecked:128's218 and129's77, totaling295; their full220 and79 archive/controller artifacts also remain bound. The128 raw log/outcome is retained without promoting timeout to completion.

Root source SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII-escaped canonical contract remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Older storage-only COW archive/cache maintenance is metadata history, not new mathematical validation; exact bytes remain the binding criterion.

Before execution, events181–182 correct the copied provisional full request-id string and predecessor list, and finalize the six-module inventory. This is a pre-execution administrative correction, not a failed finalizer or weakened proof predicate. The finalizer's only direct execution completes at event210 after the checkpoint update at208, reporting6/21/87,5731 preserved prior inputs and12 unsuccessful builds. There is no failed or incomplete finalizer result.

The finalizer requires successful matching source/build/replay records and source-matching axiom-name records, hashes objects, checks prior preservation and root/canonical pins, then writes/validates the index and last-verification. It does not itself enforce checker identity, recompute permitted axiom sets from compiler output, bind that output to axiom JSON, or prove all compiled sources are selected. Those actual retained associations were checked separately. Validation is written before later assertions, so its mere existence is not sufficient evidence of full finalization. Stop-file status is observed; the last verifier is not a root-completeness check.

| Boundary, UTC2026-10-16 | Time |
|---|---|
| Controller start |06:39:20.427680|
|21-closure Audit finish estimate |07:04:07.554230|
| Union replay finish estimate |07:04:08.634516|
| Final validation mtime |07:04:51.454123|
| Final-check mtime |07:04:53.271093|
| Manifest mtime |07:04:53.449742|
| Last-verification mtime |07:04:53.475907|
| Final.json mtime |07:05:41.852602|
| Controller finish |07:06:25.974962|
| Deadline |07:09:20.427680|

Build/replay finish estimates add retained durations to invocation-start identifiers; mtimes are not exact event times. The archived last-verification copy has later snapshot mtime07:06:25.924689, which is not substituted for the project write time. Controller finish is174.452718seconds before deadline; last verification266.951773seconds before it. Final.json precedes host finish by44.122360seconds of bookkeeping, not evidence of additional proof work. Recorded elapsed and epoch subtraction agree to their displayed precision.

Final structured event213 matches final.json and receipt report; event214 is turn.completed. All100 started items have completion records. Activity466463 bytes exactly accounts for214events and zero-byte stderr. This is retained foreground accounting, not an independent system process census; the worker's process-list attempt was policy-denied. No pending execution, extra replay receipt or late exact-request mathematical evidence was found that would require a separate preservation receipt or historical upgrade.

Final.json SHA-256 is `c168b45c011abee054778819e86c883970063e76c9b52fdfe7fed1ef66239cf4`; the manifest digest is `cc619f77503517813fd3c93894de2348f2eae4cd6a48366ef5d05eee8d8ff203`, matching last-verification. Final validation stability checked8743 inputs during07:24:24.050028–07:25:08.111846UTC with no change. The exact-request scan at07:25:08.126745 found no extra or missing file. All90 method inputs were unchanged at07:24:36.007838. These are preservation observations, not newly executed proof checks.

## Supporting records and limits

The seven standard supplements hold mathematical source hashes, parsed source structure, finite-domain counts, retained validation notes/evidence and replay-method notes/evidence. Their exact hashes and the main report are sealed by the integrity manifest after audit-file-only review. The accepted result is a new raw vertical j=1 strip in the stated cone and its exact root reduction, with the compiled-import trust boundary and historical missing replay retained. The remaining residual, middle-cone candidate and full conjecture remain unproved.

Each file below has prefix `markov_worker_000130_` under the designated temporary audit directory.

| Supplement suffix | SHA-256 |
|---|---|
| mathematical_source_hashes.json |`f28eca72b563457009d2564ca6c5d85d407bae5c9afa4572322a66ee3aa85502`|
| source_structure_audit.json |`0c576e8accfa96188e53d977a7243a85ff5d9071a140fd85ae8e90ce6454223c`|
| finite_domain_audit.json |`c2bfb2a2ab4744702039c7b8781052fd9300f88491e6ba4c3144f8696bef78b4`|
| validation_audit.md |`6a8cdad8f48bc7e9e1b6d0009f1c260a01883ce260dfd070dae50f02c5ed0dd0`|
| validation_evidence.json |`5def4d2b1160cf972ade841bca4da8acbdac5276efc3a03cf018863977199c41`|
| replay_method.md |`31e519e72d657a5a39bc6c273f9de8dc00cb10145eb3eeb7d48d7d7cf3d122ca`|
| replay_method_evidence.json |`f5ac1c78ee8d5cd5bd631fe2cbde5f186443ab3acd55c8704606d8c5ba0cc014`|
