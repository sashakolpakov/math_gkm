# Uniform left-branch proof texts: closed round0002

**None of these three main claims was admitted to the machine's registry.** This package preserves exact source texts, successful compile/kernel-replay records and their recorded failed admissions. It does not turn an inspection-capacity failure into acceptance.

## Exact statement scopes

Write Q(0)=1, Q(1)=U+V and Q(n+2)=(U+V+1)Q(n+1)-VQ(n). The preserved statements are:

1. **Coefficient formula:** for every natural n,i,j, the integer coefficient of U^i V^j in Q(n) equals `rawFormula n i j`. If i=0, it is1 when j=n and0 otherwise. For i>0 and i+j≤n it is `choose(i+j,j) * choose(n-j-1,i-1)`, with the two natural binomial coefficients cast to integers before multiplication; otherwise it is0. Subtractions in binomial arguments are natural truncated subtraction. All natural inputs, including n=0, boundaries and zero coefficients, remain in scope. See [target definitions](rebuild/checks/coefficient/source/MathGKM/MarkovLeftCoefficientTargets0001.lean) and [coefficient proof text](rebuild/checks/coefficient/source/MathGKM/MarkovLeftCoefficients0002.lean).
2. **FormulaWeakLC:** for every natural n≥1, the same formula satisfies first×last≤middle² on every valid horizontal, vertical and descending diagonal triple in the original polygon with labels(1,n). The triples are `(i,j),(i+1,j),(i+2,j)`; `(i,j),(i,j+1),(i,j+2)`; and `(i,j+2),(i+1,j+1),(i+2,j)`. Every point must satisfy the original polygon premises `n≤n*i+j` and `i+j≤n`. No positivity assumption or omitted boundary/zero case is added. See [formula-LC proof text](rebuild/checks/formula-lc/source/MathGKM/MarkovLeftFormulaLC0002.lean).
3. **Original all-false branch:** for every natural k, including0, the middle polynomial of the original `frame (List.replicate k false)` satisfies the original complete `WeakLC` predicate. The earlier structural bridge identifies its labels as(1,k+2) and polynomial as Q(k+2). See [source-family consumer](rebuild/checks/all-false-lc/source/MathGKM/MarkovLeftWeakLC0002.lean).

This is the unbounded numerator-one/all-false family, not arbitrary Boolean paths. Full Conjecture6.3, remaining published-paper correspondence bridges and mathematical novelty are not established. The copied [independent source/admission audit](independent-round0002-audit.md) records the exact source correspondence and its limits.

## Recorded validation outcomes

| Main claim | Successful fresh compiles | Successful kernel replays | Final inspection | Main admission |
|---|---:|---:|---|---|
|Coefficient formula|6|6|Inspector returned0;169,111,686-byte artifact exceeded32MiB parser cap|No|
|FormulaWeakLC|7|7|Inspector stopped by sustained-footprint guard; no axiom artifact|No|
|Original all-false WeakLC|10|10|Inspector stopped by sustained-footprint guard; no axiom artifact|No|

The completed coefficient output independently reports only `Classical.choice`, `Quot.sound`, `propext` for the obligation and no axioms for interface/transport. This is actual standard-axiom metadata, not self-report. The official artifact parser nevertheless rejected its size; later format/semantic/source/object/binary postchecks were skipped. Independent metadata inspection did not waive them or insert this result into the registry.

The two LC items have completed proof texts and actual fresh kernel replays, but **their independent allowed-premise closures remain unconfirmed**. Their inspectors exited−9 under `resource_guard: footprint_sustained`, at recorded native peaks5,110,831,840 and4,847,950,464 bytes. No closure report was emitted. Successful compilation/replay must not be substituted for that missing stage or for a registered admission.

The third claim's ten-module replay includes the original accepted target, its unchanged export and the new consumer. Its source actually applies `Accepted95a4e0482c798d7a5531cd05.obligation`; this is real source-level prior-bridge use with fresh dependency/consumer replay, not an unused import. It does not imply that the stopped inspector completed closure or a mandatory-use metadata check.

All three attempts have FINISHED receipts binding15/15/18 files. Those receipts finalize historical attempts, including failures; they do not imply checked:true. The prior structural bridge remains a separate admitted result.

## Files and reproduction limits

[MANIFEST.json](MANIFEST.json) maps every original file hash and size. [VERIFICATION.json](VERIFICATION.json) records a second streaming read of all archive members, all48 FINISHED file bindings, all26 Lean source bindings, all138 snapshot files and all231 completed-role after hashes. [SOURCE_SELECTION.json](SOURCE_SELECTION.json) preserves the fixed read-only selection inventory.

The archive contains only the three closed validation bundles with complete source/pins/REBUILD/results, the complete coefficient catalog, immutable round0002 snapshot, completed own plan0002/researchround0002 records and the closed audit. Exact small rebuild closures are visible under `rebuild/checks/`. Historical failed/scratch source attempts in the snapshot are retained as history, not extra accepted theorems. All raw local originals and the earlier580MB failure history remain untouched. No private evaluator/curator/suite/answers, active round3 files, dependency trees or compiled build products are selected.

Use [pinned010 source733914c8](https://github.com/sashakolpakov/math_gkm/commit/733914c8e7883f3eb6340d7f213ee7e3e4800d9b), Lean4.32.2 and mathlib revision905b95818eb32af7874a58b427f50c1711a5e96c. The [earlier first-bridge publication89f2ac68](https://github.com/sashakolpakov/math_gkm/commit/89f2ac6844c22b11f92d7ca3f612c0bfe24ff8e4) retains its independently admitted structural result. Shared pinned dependency/repro sources can be referenced instead of copying package caches.

Extract into a new empty directory and use each `checks/LABEL/REBUILD.json`, its `rebuild-pins/` and actual `validator.sb`. Safely relocate original source/build/dependency/temp paths and the profile's host permissions to the new workspace; preserve module order, pinned environment, `lean -j 1`, every recorded `leanchecker` replay and the final inspector invocation. Do not reuse historical attempt ids. The old sandbox profile is macOS-specific; unchanged-path replay on another host is not claimed.

This package preserves both the proof texts and the failed admissions. Reproduction under the historical parser/resource bounds can reproduce the capacity failures; it is not permission to relax those bounds or relabel an outcome. It supplies no newly tested portable profile, new Lean/model execution, cold bootstrap, independent closure for the two LC items, full root theorem or novelty certification. Raw result/catalog/source digests remain the historical comparison points.
