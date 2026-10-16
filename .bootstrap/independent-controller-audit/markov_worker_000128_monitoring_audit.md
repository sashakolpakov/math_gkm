# Worker 000128 independent monitoring audit — timed-out partial run

Request `263d8c71d1e34c09988ae5004b76a354`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000128/artifacts`; research suffix `M263`. Audit date2026-10-16 UTC. This is a read-only audit of completed archived sources/records, exact named counterparts and sealed predecessor evidence. It runs no Lean, checker, replay, experiment, finalizer, project code, coefficient, polynomial/matrix recurrence or inequality-gap computation. Independent work is static parsing, hashing and integer word/index/polygon-domain counting. No project file was changed, active129 mathematics inspected, or proposer contacted or assisted. All output is under `/private/tmp/math_gkm_godel_20261013`.

## Outcome and accepted mathematical scope

**The controller outcome remains TIMEOUT, report null**, with retained elapsed1837.139928817749 seconds and returncode0. Saved finalization does not turn this into a completed worker turn. The archive contains useful accepted partial results and an explicitly unvalidated candidate; these must remain separate.

The retained accepted inventory has **26 new mathematical modules,85 theorem closures and16 definitions**. The new positive theorem extends horizontal raw row **j=2** log-concavity to **every original A/B word beginning with A**, at every natural starting index, retaining zeros. It also covers every finite prefix of every source word, including the empty prefix and prefix lengths beyond the full word. It proves no full-prefix `WeakLC`, no new source-root residual region, and no new vertical or diagonal region. Source row j=2 was already known.

Accepted negative certificates concern two distinct enlargements: an atomic A/C word failing horizontal row j=1 and proved not to be the expansion of any original word; and an explicit positive mixture whose displayed row-four triple fails while its two component triples pass. The mixture is formally excluded from every source numerator and both endpoint polynomials, and its left triple point is outside the count-labelled polygon. These are not root counterexamples.

The27th mathematical source, **MarkovClusteredObstructionM263**, has seven drafted theorems and two definitions but **no successful build, object, selected replay or axiom print**. Its two builds timed out. The polygon-valid vertical `[1,8,82]` witness for A^10 B^3 and its proposed source exclusions therefore remain saved finite evidence and unvalidated draft statements. A separate saved experiment gives `[1,8,34]` for the actual source3/13.

The later coordinate stress test reports negative symmetric mixed gaps in all three directions. This directly rejects nonnegative mixed-gap compatibility on its tested enlarged family. **A negative mixed term alone is not a proof that a positive weighted mixture fails LC**; that requires additional information about component gaps and weights. The script does not perform that further test. Its result also does not establish a root refutation.

The inherited exact reduction remains `Conjecture63 ↔ InteriorCore63MF8`. Full root proof and negation remain absent. The old worker121 **212-module replay backlog remains unrecovered**: it is absent from accepted successful replay bases but present in the pending Clustered source closure. Declared pending imports are not recovery of their missing replay.

## Literal raw indices and terminal-A formula

The root still defines `coeff P i j=(P.coeff i).coeff j`, with raw squared variables and no factorial normalization. `InPolygon a b i j` remains `a*b ≤ b*i+a*j` and `i+j ≤ a+b-1`. Root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

For an original Boolean core w, `terminalWordM263 x w` is the polynomial formed by folding the inherited horizontal row step from `(X,1)` and taking `p.1+C(x+1)*p.2`. `terminal_rawM263` proves its exact equality to `Bivariate.swap (rawWord80 (false::(w++[false]))).b`. Thus this is literal A–core–A, with horizontal row index taken after swapping variables. Inherited `swap_coeff46` recovers protected raw `(i,j)` indices.

For a nonempty core let n be its length, m its B count, r the indicator of its last B, and t its first-B indicator plus twice its adjacent-BB count. `terminal_stat_boundM263` proves **t+r≤2m** for every such core. It derives this from the inherited statistic bound, without source balance.

`terminal_scaledM263` first proves a commutative-ring identity with factor `2*x*(x+1)^3` from inherited `HJet8934` and its fold theorem. Over integer polynomials, for n≥3, `terminal_formulaM263` cancels only the nonzero polynomial `(X+1)^3` to obtain

```
2*X*raw_row_2 = X^m*(X+1)^(n-3)*J(X),
J(X) = 4t + (9m^2+7m+2-4r)X
     + (6m^2+6mn+4n)X^2 + (m+n)(m+n+1)X^3.
```

Multiplying the left row by X avoids an invalid negative exponent when m=0. There is no assumption of m≥1 in this exact word identity, and no division by X. The condition n≥3 justifies splitting the `(X+1)` power. This is polynomial equality, not cancellation of an LC conclusion.

`terminalRowM263 n m t r` is `(1+X)^(n-3)*J` over the reals. `terminal_coeff_clearM263` proves, for natural n,k with n≥3,k≤n and arbitrary real m,t,r,

```
n(n-1)(n-2) * terminalRow.coeff k
  = choose(n,k) * terminalHM263 k (n-k) m t r.
```

Here H is the falling-factorial expression with coefficients `4t`, `9m²+7m+2−4r`, `6m²+6m(k+l)+4(k+l)`, and `(m+k+l)(m+k+l+1)`, multiplying respectively `l(l−1)(l−2)`, `kl(l−1)`, `k(k−1)l`, and `k(k−1)(k−2)`. The equality uses inherited `cubic_falling_coeff340`; it is not inferred from samples.

## Gap coverage, zero cases and all starting words

The terminal gap is `(k+1)(l+1)H(k,l)^2−klH(k−1,l+1)H(k+1,l−1)`. A universal ring identity expresses `(2m−r)^2` times that gap as a quadratic Bernstein combination of its values at t=0,t=2m−r and the mixed expression. For real m≥1 and **r=0 or r=1**, the16 chart modules prove48 endpoint/mixed nonnegativity certificates: eight index regions for each of the two r values.

The regions split each of k,l into1,2,or≥3 and omit only(1,1). In the natural-index application k=i+1,l=j+1 and i+j≥1, so the omitted corner would have n=2 and is not a valid n≥3 inner case. The large coordinates use x+3,y+3 with x,y≥0, and m=z+1 with z≥0. Equality faces are included. All48 final bodies consist of definition simplification, ordinary `ring_nf`, and `positivity`. The generator does not supply a trusted external mathematical assertion; accepted Lean proofs check the expressions.

The assembler splits natural i,j exhaustively, substitutes m−1≥0, and handles r=0 and r=1 separately. It does **not** prove the real-parameter statement for every r in[0,1]. With0≤t and t+r≤2m, `(2m−r)^2>0` and the Bernstein weights are nonnegative. This proves the exact gap used by the coefficient bridge.

For n=i+j+2, the bridge uses the inherited exact binomial product identity and multiplies the terminal gap by the square of the middle binomial coefficient. It then cancels only the positive factor `(i+2)(j+2)*[n(n−1)(n−2)]²`. No binomial coefficient is divided out, and no reverse inference from LC of a smoothed polynomial to LC of its seed occurs.

`terminal_row_allM263` quantifies over natural n,m,t,r,i with **n≥3,t+r≤2m,r≤1**. There is no requirement m≤n, source balance or denominator bound. For m=0 the parameter bound forces t=r=0, and the cubic `[0,2,4n,n(n+1)]` is handled through CrossLC and binomial smoothing. For i+2≤n the inner gap theorem applies; for i+2>n the degree bound gives a zero right coefficient. All natural upper zero positions are covered.

The final terminal-word proof maps the integer equality to the reals and applies inherited `shifted_adjacentMF52` to **X times the raw row**, at starting index **i+1**. Exact `coeff_X_mul` identities recover the raw row at i,i+1,i+2. This handles the additional X without losing i=0, and the shifted lemma covers positions before the monomial X^m. The common factor2 is uniform across the triple. Small cores of length≤2 have seven explicit shifted quadratic formulas, including the zero row for the empty A–core–A core, followed by ordinary CrossLC transport. No zero, short core or m=0 case is omitted.

`raw_terminal_secondM263` therefore gives raw row j=2 LC for every A–core–A word. `raw_starting_secondM263 (w : List Bool) (i : ℕ)` then has the exact conclusion

```
coeff (rawWord80 (false::w)).b i 2 *
coeff (rawWord80 (false::w)).b (i+2) 2
  ≤ coeff (rawWord80 (false::w)).b (i+1) 2 ^ 2.
```

Reverse decomposition of the tail separates the singleton A base case and the two possible final letters. Final A uses the new terminal theorem; final B uses worker127's accepted all-core theorem. It is an original A/B-word result, not an arbitrary atomic A/C-word theorem.

`source_prefix_secondM263` covers every path,k,i. For k=0 the raw identity matrix has zero b-entry. For k>0 the inherited exact source form `false::(central28 path++[true])` makes its prefix begin with A. There is **no upper bound on k**; `take` saturates beyond the full length. The literal triple remains `(i,2),(i+1,2),(i+2,2)`, with no polygon or positivity premise. This is only one horizontal row, not full prefix `WeakLC`.

## Accepted atomic and mixture obstructions

`badAtomicM263` is the atomic word **ACAC^5**, namely `[false,true,false,true,true,true,true,true]`. Its polynomial is the second component of `rawPairM10D` on that atomic list, not `rawWord80` interpreting the same bits as original A/B letters. `badAtomic_tripleM263` proves raw coefficients at **(3,1),(4,1),(5,1)** are **[4,6,10]**, and `badAtomic_horizontal_failureM263` proves the strict reversal. This is row j=1, not a counterexample to the new row j=2 theorem.

`expanded_no_adjacent_CM263` proves `adj8934 r (expand80 w)=0` for every original word w and both preceding bits r. The displayed atomic word has adjacent C letters, so accepted theorems exclude it from `expand80 w` for every w, including every expanded source word. This is exact **syntactic expansion exclusion**. The module does not separately prove that no different word could have the same polynomial, and no original source/polygon identification is supplied for this atomic polynomial. It is not a root witness.

The two original mixture words are **AAAABBBB** and **AABABABB**, both length8 and B count4, beginning A and ending B. Their expanded raw-pair polynomials are exactly connected to the original raw-word model by inherited matrix/expansion identities. Accepted ordinary ring proofs verify complete literal polynomial expansions, then extract row-four triples at **(1,4),(2,4),(3,4)** as **[2,38,252]** and **[0,2,138]**. `mixture_components_LCM263` proves the adjacent inequality for each **displayed triple**; it does not establish global row-four LC or full WeakLC of either component.

`badMixtureM263=2*P0+31*P1` has the accepted exact triple **[4,138,4782]** and strict reversed adjacent inequality. The saved mixed gap−124, component gaps940 and4, and mixture gap−84 are retained numerical records, not independently recomputed here. The formal theorem supplies literal coefficients and the strict inequality. This establishes failure of closure of the displayed adjacent condition under that positive combination, not a universal statement about mixtures of globally LC source polynomials.

`mixture_triple_polygon_scopeM263` proves **the left point is outside InPolygon(4,8)** while the other two are inside. The labels are not reduced. Thus this formal witness does not refute the three-guard polygon-restricted candidate. Each component's boundary evaluation is `X^4*(X+1)^7`; the mixture's is33 times that monic polynomial. `mixture_not_source_polynomialM263` contrasts its leading boundary coefficient with the inherited monic boundary formula for every generated frame numerator, formally excluding equality to any of them. `mixture_not_endpointsM263` separately excludes1 and U+V. Unlike the atomic certificate, this is an accepted polynomial-level source exclusion.

## Unvalidated Clustered draft and later finite stress

The final Clustered source defines A^10 B^3 and its expanded raw-pair polynomial. It contains a split prefix expansion, a full expansion, literal coefficients, counts, polygon/strict-failure statement, source-word exclusion via the length-five mechanical prefix rule, and source-polynomial exclusion using the inherited universal source third-column theorem. **All seven theorem declarations remain unvalidated in this run.** Neither easy-looking local statements nor the source comments are promoted after the module's two timed-out builds. There is no accepted object, replay or print coverage for any declaration in it.

Saved experimental/certificate data give counts3/13 and vertical coefficients **(3,0),(3,1),(3,2)=[1,8,82]**, with all three original polygon guards and a reversed gap. This is an original word beginning A and ending B, so it shows why a one-row positive theorem cannot simply be read as all-direction coverage. Its formal certificate was attempted and timed out; this audit neither completes nor repairs it.

The separate `source-comparison.json` and recorded controller output give the actual source path `[false,false,false,true,true]`, word `0000100010001`, and triple **[1,8,34]** at the same points. This is saved finite matrix evidence using inherited mechanical identification, not a new universal Lean theorem. The two count-labelled words are distinguished; no root refutation is certified.

The later coordinate-mixture script checks only `2*p1*q1−p0*q2−p2*q0<0`. It does not check both component gaps, a discriminant, or positive weights producing a failed mixture. Its saved negative examples therefore refute **nonnegative symmetric mixed-gap compatibility** on the tested enlarged family. The final mathematics note's language about a refuted compatibility candidate is supported at that predicate level. It must not be strengthened to a formal polygon-valid positive-mixture closure theorem or a root refutation. The earlier unguarded weighted mixture and the individual Clustered experimental failure have their separate scopes above.

## Finite domains and exact stopping points

All scripts and outputs were read without execution. Fixed-seed word metadata and index/polygon counts alone were reconstructed. Coefficients, gaps, zeros and failure classifications below are saved observations; none was recomputed. The domain audit preserves repeated inputs, partial stopping points and the distinction between original and atomic words.

The terminal-A experiment uses1023 exhaustive cores of lengths0 through9 plus150 sampled cores of lengths10 through64: **1173 cores**. Each adjacent domain has n+m+1 starts; each n≥3 identity domain has n+m+4 indices for the cleared `2X*row` identity. Independent counts reproduce **21813 adjacent checks and25289 coefficient identities**. The saved9387 zero-containing triples and zero failures are retained observations. Seven saved small-core rows agree in scope with the seven formal cases, without being substituted for those proofs.

The atomic scan takes4095 initial-A atomic words with tails of lengths0 through11 plus150 sampled tails of lengths13 through59: **4245 inputs**, all planned inputs completed. Its triangular domains through one zero layer give **445698 comparisons**: row0=54781,row1=50536,row2=46291,row3=42047,and252043 grouped under `row_4`, which means **all j≥4**, not just j=4. Word-length/index counting reproduces every count. The saved64 failures are all in row1;219804 triples contain a zero. The first witness is the formally certified ACAC^5 triple. No polygon filter occurs.

The same-count compatibility scan exhausts core lengths1 through8, groups by core B count and final letter, and uses **pairs with replacement**. It has **18086 word-pair occurrences** and **2171676 mixed comparisons**:1016104 terminal-A and1155572 terminal-B. These counts follow from group sizes and full triangular index ranges. Saved failures are869 and516 respectively, with1174005 zero-containing comparisons. These mixed tests alone do not imply every failed pair has a positive-mixture failure; the displayed accepted weighted witness was separately certified.

The first polygon-mixture scan exhausts cores1 through9, both final letters, and reduced positive labels. It uses **distinct pairs without replacement**, giving **53397 pairs** and **3637384 guarded horizontal comparisons**. Its loop upper bound covers the rightmost total-degree guard, and the left-point lower bound implies the other two lower guards since b>0. Independent counting matches the reported total. This script tests mixed negativity and, conditionally, component-gap/discriminant criteria; it records zero negative mixed values and zero noncopositive cases. This is finite success on its exact small domain, not a universal candidate validation.

The later coordinate stress chooses denominators13,17,23,31,43,59, all reduced positive numerators, with180 planned fraction groups in a seeded order. For each, it combines clustered, reverse-clustered, mechanical-core and shuffled-core words, deduplicated within the group and all beginning A/ending B. It completes **174 of180 groups**, ending at9/43, with **3262 distinct within-group pairs**. Independent word-metadata reconstruction exactly matches the saved174-group prefix of the seeded plan. All words have the recorded length and B count.

Applying the script's three original polygon guards to each directional triple independently reproduces **5186997 horizontal,5186997 vertical and5317945 diagonal comparisons**. The saved negative mixed counts are194479,197147 and151977 respectively; no tested triple has a zero according to the saved counter. The final scan stops after a complete fraction group at about90 seconds. Its170-group progress record independently matches its own partial domain totals and is not final coverage. The diagonal convention is `(i,j+2),(i+1,j+1),(i+2,j)`, with common total degree i+j+2; it is not an axis-aligned check.

The first saved vertical pair at3/13 has triples `[1,8,82]` and `[1,8,66]` and mixed value−20. The first diagonal example at28/31 uses points(19,10),(20,9),(21,8), triples `[74,78,82]` and `[8,16,28]`, mixed−232. The first horizontal example at7/43 is at(7,5),(8,5),(9,5). These are retained finite examples of the exact mixed predicate, with no newly evaluated gap or weighted combination in this audit.

The clustered horizontal scan plans denominators3 through80 but stops after **a=36,b=67**, covering all reduced earlier labels and the initial part of denominator67. The **1362 word inputs** and **2590027 polygon-guarded horizontal comparisons** are independently recounted. Saved failures and zero triples are both absent. This partial finite success does not prove a horizontal enlargement theorem or erase the saved vertical obstruction. It does not cover the remaining numerator values at67 or denominators68 through80.

## Root residual and validation boundary

No new residual module or root equivalence is accepted. The inherited `InteriorCore63MF8` remains, for actual paths with a≥2 and all three original guards: horizontal j≥5 with i+j+4≤a+b−1; vertical i≥4 with the same total bound; and diagonal i+j+8≤a+b−1,a+5≤i+j+2,a+2≤b. Literal directions remain `(i,j),(i+1,j),(i+2,j)`; `(i,j),(i,j+1),(i,j+2)`; and `(i,j+2),(i+1,j+1),(i+2,j)`. Both root endpoints `WeakLC 0 1 1` and `WeakLC 1 1 (U+V)` remain unchanged. Natural zeros are retained throughout.

New accepted proof/replay coverage, pending source declarations, finite observations and historical imports are distinguished in the validation/method section below. No omitted check is executed by this audit.

## Retained compilation, axiom printing and selected replay

All **220 controller artifacts** match archive and exact current bytes; all **218 indexed hashes** match. The manifest and last-verification are the two deliberately unindexed, separately controller-bound files. The archive has32 final Lean sources (27 mathematics,four Audits,driver),54 immutable compiler snapshots,30 objects,83 JSON files,16 Python files and five Markdown files. There is no compiled-inventory.json. The finalizer reads an explicit26-module accepted list from mathematical-modules.json; that list deliberately omits Clustered and is not the full archived mathematical inventory.

| Accepted family | Modules | Theorems | Definitions |
|---|---:|---:|---:|
|Terminal Defs,16 cases,Gap,Row,WordFormula,Small,All|22|67|10|
|AtomicObstruction|1|5|1|
|SourcePrefixSecond|1|1|0|
|MixtureObstruction|1|10|5|
|MixtureScope|1|2|0|
|Accepted total|26|85|16|
|Excluded Clustered draft|1|7|2|

Every accepted final mathematical source matches its successful source-bound build,immutable snapshot,retained object,selected replay and named axiom record. No successful new mathematical build remains compiled-only. There are **54 compiler receipts=30 successes+22 returncode1 failures+two timeouts**, all with immutable snapshots. The successes are26 mathematics and four Audits; no successful source was subsequently superseded. There is no snapshot-only or interrupted compiler outcome and no failed or timed-out numeric replay.

Five disjoint replay selections cover the26 accepted modules exactly once: the22-module terminal union checks77 explicit declarations; Atomic checks6; SourcePrefix1; MixtureObstruction15; MixtureScope2. Their sum is **101=85 theorems+16 definitions**. Every source-declared name and final source hash matches its receipt and reported isolation count. No definition-only,import-only or inherited target is counted as new mathematical coverage.

Four Audit outputs have **67,6,10,2 rows**, totaling85 distinct final theorem names without missing,extra or repeated names. The six-name Audit combines Atomic and SourcePrefix. Source-hashed axiom JSON,Audit imports,compiler outputs,final source declarations and finalizer references agree. The closure distribution is **80 `{propext,Classical.choice,Quot.sound}`; one `{propext,Quot.sound}`** for terminal_stat_boundM263; **three `{propext}`** for expanded_no_adjacent_CM263,badAtomic_not_expandedM263,badAtomic_not_sourceM263; and **one empty set** for mixture_equal_countsM263. The name-specific parser recognizes the axiom-free form. No parser rejection or disallowed axiom is retained.

Unsuccessful compiler attempts have three distinct meanings:

- **Sixteen unchanged-source dependency failures:** every chart initially fails because TerminalGapDefs is not yet available. All16 failures finish before the successful Defs build completes. Their snapshots are byte-identical to their later accepted final sources. Later builds/replays provide acceptance; the earlier dependency failures remain failures.
- **Six superseded compiler-error sources:** one each for WordFormula,Small,Row,All,MixtureObstruction,MixtureScope. These hashes differ from final successful replacements. Static header comparison finds no changed theorem names,binders or premises; this is a textual check, not elaboration. The source fixes do not upgrade failed receipts.
- **Two unvalidated Clustered versions:** the earlier hash `a787f9474a6423597f844d6b15fe9062a62780e024be72a830e7b31d9ac5ee4f` has six theorem headers and two definitions, timing out after150.268536 seconds. The final hash `328bce81378e6eb60a684773c98feaa693c24695956870bb5689686337dd718f` adds clustered_prefixM263 and times out after120.200624 seconds. The second snapshot equals the final seven-theorem draft. Neither has a retained object,successful build,replay or print. Its completed timeout receipt resolves the invocation's outcome, while the mathematical candidate stays unbuilt.

The finalizer's count of24 unsuccessful builds is **16+6+2**, not24 obsolete mathematical source repairs. Indexed presence of Clustered source and finite certificate data supplies preservation only.

## Checker semantics and successful versus pending imports

Final driver SHA-256 is **`4e8e537686884957269f5b9624007e3e47d557b364cbc29355365dfd3aae08c9`**. It is worker127's driver after suffix substitution, and all five successful replay receipts record it. Ordinary `env.replay`,joined-task error propagation,compiler-j1 and replay stack131072 are unchanged. The guard checks collected `MathGKM.Markov.*M263` declarations for pre-imported presence,unsafe and partial status. All101 explicit selected names fall within that predicate. Generated/private/inherited names outside it retain ordinary Lean.Replay handling; this audit does not reconstruct every binary constant or private declaration.

The low-level wrapper changes only console-summary output: successful runs print an empty stdout summary,while full captured output remains in the immutable receipt. Thirteen summaries differ from the previous tail2500 policy for that reason. Independent event/receipt comparison verifies the actual blank-success convention and all59 compiler/replay outcomes, rather than interpreting blank summaries as omitted checking. Failure summaries retain their output tail. Checker source hashes are recorded after subprocess return,not at invocation; source/object retention does not independently establish runtime binary identity.

The name-aware axiom wrapper retains expected-name matching,axiom-free handling,allowed-set and successful-compiler checks,with its default list now read from mathematical-modules.json. It does not itself reject every conceivable duplicate/extra output; independent comparisons establish exact names here. The finalizer likewise uses that list and requires source-matching successful build/replay/named axiom JSON,then hashes current objects. It does **not itself require checker identity,re-evaluate axiom sets,bind axiom JSON to successful Audit output,or require every source candidate to succeed**. Those actual retained record bindings are independently checked for the26 selected modules. List-based success neither validates Clustered nor finishes the controller turn.

The22-target union includes dependency-related modules and excludes them together from its imported base; an antichain is not required. Its base has113 inherited local nodes. Atomic has31; SourcePrefix has135=113 inherited+22 newly replayed terminal nodes; MixtureObstruction has27 inherited; MixtureScope has28=27 inherited+MixtureObstruction. Every actual base is target-free,with no explicit selected-name collision. Matching new compilations and required earlier new replays precede dependent invocations. No replay overlaps an unfinished dependency replay.

The **accepted closure is145 local nodes=26 new+119 inherited**. Its119 source/object bindings comprise106 inherited worker127 bindings,twelve accepted worker127 second-row modules excluding Rescue,and worker126 RawPrefixM10D. There is no worker-saved dependency-scope inventory; these counts come from static reconstruction. No MAE2/worker121 module appears in these successful replay bases.

The **pending Clustered closure is2265=one draft+2264 inherited** through RawPrefixM10D and ThirdAllMF8. It reaches all212 old worker121 compiled-but-unreplayed modules,including195 Half dependencies,and19 previously accepted worker121 modules. Historical unbuilt121 candidates are absent. This is pending source-dependency reachability,not a measurement of dynamic loading and not successful new inherited-body validation. None of the212 is a current compiler target or selected replay target. **No backlog recovery occurs.**

The union of all mathematical source closures is2304=27 new+2277 inherited; adding four Audits gives2308 local nodes. Accepted and pending sets overlap and must not be added as disjoint groups. The driver and external Lean/Mathlib source trees are separate. There are no unresolved local imports or cycles. All2277 exact current inherited source/object pairs match before128 and sealed worker124–127 identities,checked at06:23:09.315050–06:23:40.161029 UTC. Membership flags distinguish accepted119 from pending2264. Later hash preservation does not backdate proof receipts,replay inherited bodies or constitute a fresh whole-source rebuild.

## Preservation and staged finalizers

The initial5652-entry snapshot excludes only the own setup script,leaving **5651 unchanged prior inputs**,including135 `.pyc` files preserved as bytes. No cache file was executed by this audit. Six inherited administrative inputs match. The worker checks predecessor127's112-entry and worker121's1353-entry manifests; independent audit additionally binds all **114 predecessor127 artifacts and1355 worker121 artifacts** across archive/controller/before/current. Prior event hashes/counts agree with reconciliation. Worker121 remains timeout,null report,228 events.

Root and contract pins remain unchanged. Raw contract SHA is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical compact sorted ASCII JSON SHA is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. No serialization rejection/correction occurs in this run.

Three direct finalizers return0 with different staged inventories. Event199 reports24 accepted modules/73closures,index179,21 unsuccessful builds while a revised MixtureObstruction build is still running. The accepted list later grows to25 and then26. Event273 reports26/85,index217,23 unsuccessful builds while the second Clustered attempt is still running. Event274 records that attempt's timeout. Scope documents are updated at276–277,and event279 reports26/85,index218,all24 unsuccessful builds. The last receipt accounts for217→218. Event281 reads back final last-verification. Creating the finalizer at190 is not another execution.

The retained final index is not the earlier incomplete index. It includes the final pending-source timeout as preserved failure evidence,while validation accepts only26 modules. Last-verification's digest and count agree with the final manifest. Successful finalization has completion null throughout and cannot stand in for a missing final response.

## Exact timeout cutoff and late observations

All times below are UTC on2026-10-16. Receipt filenames identify starts/snapshot times; estimated completions add retained durations and are not independently timestamped process exits.

| Milestone | Time |
|---|---|
|Worker start|05:41:11.690288|
|Terminal22-module replay completes,estimated|05:53:43.679365|
|Terminal67-closure Audit completes,estimated|05:53:53.998420|
|Atomic replay completes,estimated|05:54:48.990128|
|SourcePrefix replay completes,estimated|05:54:55.627188|
|Combined six-closure Audit completes,estimated|05:54:57.378464|
|MixtureObstruction replay /Audit complete,estimated|06:00:29.374936 /06:00:32.074973|
|MixtureScope replay /Audit complete,estimated|06:04:36.335054 /06:04:37.490433|
|First Clustered timeout completes,estimated|06:06:54.897893|
|Final Clustered timeout completes,estimated|06:09:59.893275|
|Final validation mtime|06:10:40.927983|
|Final-check mtime|06:10:47.118247|
|Manifest mtime|06:10:47.381978|
|Last-verification mtime|06:10:47.528008|
|Final event-log mtime|06:10:57.192507|
|Nominal1800-second deadline|06:11:11.690288|
|Activity time /file mtime|06:11:11.735805 /.735991|
|Controller timeout finish|06:11:48.830216|

All observed project artifacts and successful/failed mathematical receipts precede nominal deadline. Last-verification is **24.162280 seconds before** it. The activity timestamp is45.517 milliseconds after deadline,but its counter exactly accounts for the full **281-event,636377-byte log**,with empty stderr. All133 started items have completion partners;146 completed items are recorded. This is accounting evidence,not a late proof receipt. No independent system-wide process census is claimed.

The retained elapsed field is **1837.139928817749 seconds**; subtraction of stored floating-point epochs gives1837.1399278640747,about one microsecond different. Finish is37.139928 seconds after deadline. The authoritative retained fields remain **outcome timeout,returncode0,report null**. There is **no final.json,no structured final report event,and no turn.completed**. The last prose update at275,the later successful finalizer and completed subprocesses do not change that outcome. Null-report comparisons are not treated as a fictitious matching final report.

Final audit stability found **10491 inputs unchanged** at06:26:58.047088–06:27:43.768923 UTC. Exact completed-request observation at06:27:43.768947 found no extra or missing file. The method's232 exact static inputs were unchanged at06:28:01.533173. No late exact-request receipt was observed that required separate preservation; no later evidence is used to upgrade cutoff coverage. Earlier byte-preserving storage operations remain operational metadata history,not new proof validation.

## Audit artifacts and limits

Seven supports accompany this main note: mathematical source hashes,source structure,finite domains,validation note/evidence,and replay-method note/evidence. Their inventories independently agree on all27 mathematical source hashes and the26 accepted/one pending split. The integrity file binds this note and all seven supports after audit-file-only cross-review.

This audit preserves a timed-out partial run with a validly evidenced accepted subset,not a completed worker report. It supplies no missing Clustered certificate,proof fix,new experiment,research direction or fresh inherited replay. The protected root remains open and unrefuted.
