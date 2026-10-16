# Worker 000126: retained replay method and import boundary

Request `10d1575180b64743bae4589161aa0716`. This static review used the completed worker126 archive, exact named current counterparts, and sealed predecessor evidence. No Lean, project checker, replay, proof experiment, finalizer, or project code was executed; no successor work was inspected. Source mathematics and independent validation/hash checks are separate.

The final retained records support **seven new mathematical modules, 40 explicit theorem closures and ten explicit definitions**, selected exactly once across three successful replay unions. The initial selected-validation wrapper rejected a successful Audit compilation because its parser ignored one axiom-free result. The correction preserves the successful-return, exact-count, and allowed-axiom predicates. Two additional theorems were also added before the successful rerun: the initial scope was 38 theorems, while the final scope is 40. These are distinct changes, and the initial rejection is not retroactively upgraded.

## Parser rejection and correction

The first selected validation, ending at controller event167 with exit code 1, compiled `MarkovAuditSelected1792127322451537000M10D` successfully in receipt `build-1792127322451634000.json`. Its source requests **38 names**, and its output contains exactly those 38 results: 34 with `{propext, Classical.choice, Quot.sound}`, three with `{propext, Quot.sound}`, and one with no axioms. The axiom-free theorem is `MathGKM.Markov.badPrefix_countsM10D`.

The copied parser selected only lines containing `depends on axioms:`. It therefore counted 37, reported `AXIOMS {"ok": false, "modules": 7, "closures": 37}`, and failed `assert ok`. The selected-wrapper code places this assertion before replay scheduling. There is no numeric replay invocation from that rejected attempt. The successful compiler receipt and printed theorem results remain retained, but the enclosing wrapper outcome remains a failure.

Controller events168–169 update both `audit_10d15751.py` and `validate_selected_10d15751.py`. The line predicate becomes:

```python
'depends on axioms:' in line or 'does not depend on any axioms' in line
```

For the second form, the closure parser produces `set()`; for the first it retains the previous bracketed-set parsing. The overall predicate still requires compiler return code zero, the number of recognized lines to equal the requested theorem count, and every parsed axiom set to be a subset of `{propext, Classical.choice, Quot.sound}`. Both final wrappers are exactly their retagged worker125 versions plus these two parser substitutions. The correction neither removes the count requirement nor widens the allowed axiom set.

Between the two Audits, `MarkovPrefixScopeM10D` was successfully rebuilt with two additional theorems, `prefix_weakLC_failureM10D` and `universal_source_prefix_failureM10D`. The second Audit, `MarkovAuditSelected1792127441762474000M10D`, requests and prints **40 exact names**. Event183 completes the corrected selected wrapper successfully with 40 recognized closures, followed by three successful replay unions. Its distinct closure distribution is **36 full triples, three `{propext, Quot.sound}` pairs, and one empty set**. The three pair-only theorems are `source_two_wordM10D`, `source_two_prefixM10D`, and `source_two_prefix_takeM10D`.

The two Audit outputs together have 78 rows and 40 distinct names. Each Audit request/output set matches the latest recorded successful source snapshots for its imports before that Audit invocation. Thus the first Audit is correctly bound to 38 historical theorem declarations, not the later 40. The final parser still uses substring recognition, counts, and allowed-set checks rather than exact name/uniqueness comparisons; this static review independently verifies names, uniqueness, source versions, and output coverage.

## Final selected scope and replay implementation

| New module, suffix `M10D` | Theorems | Definitions |
|---|---:|---:|
| `MarkovPrefixObstruction` | 6 | 1 |
| `MarkovRawConjugacy` | 9 | 4 |
| `MarkovRawPrefix` | 8 | 4 |
| `MarkovPrefixScope` | 5 | 0 |
| `MarkovSourcePrefix` | 4 | 0 |
| `MarkovWordConjugacy` | 6 | 1 |
| `MarkovSourceConjugacy` | 2 | 0 |
| Total | 40 | 10 |

The successful unions contain respectively three, three, and one targets. The first selects PrefixObstruction, RawConjugacy, and RawPrefix: 23 theorems plus nine definitions. The second selects PrefixScope, SourcePrefix, and WordConjugacy: 15 theorems plus one definition. The third selects SourceConjugacy: two theorems. The reported isolation counts are exactly **32, 16, and 2**.

Selected targets, accepted validation modules, final successful mathematical sources, and compiled inventory agree exactly. The archive has ten new Lean sources: seven mathematical modules, two Audits, and the operational driver. There are no new pending or compiled-only mathematical sources, definition-only or import-only targets, inherited selections, duplicate selected explicit names, target/base explicit-name collisions, or selected forbidden-token flags. The 50 explicit mathematical declarations all lie in namespace `MathGKM.Markov`, end `M10D`, and match the names recorded by the replay receipts. All new Lean sources are indexed.

`research/ReplayIsolatedM10D.lean` has SHA-256 `94d6a3742375fe41f21f27bff33cfb318b9cf5c9a740ebaed447c93a1635b049`. It is exactly worker125's final driver after suffix substitution, and all three replay receipts record this hash. Removing its explicit guard and normalizing entry name, comments, and whitespace still matches the original Wide replay body. The joined Lean task, stack setting `131072`, compiler `-j1`, explicit-name suffix assertion, and ordinary compiler/replay wrapper are unchanged.

The driver reads target module-data parts, including available server/private parts, collects constants into a map, excludes directly named targets from imports, constructs the imported environment, applies the guard, and calls `env.replay newConstants`. The guard rejects collected `MathGKM.Markov.*M10D` names that are already imported, unsafe, or partial. Constants outside that predicate retain ordinary `Lean.Replay` handling, including imported/generated constant handling. The static source graph independently confirms that all three target batches are antichains and all transitive imported bases are target-free. Source explicit-name checks do not reconstruct every private/generated binary declaration.

The selected wrapper retains levels computed from direct imports among chosen modules, batches of at most eight, and a three-thread pool with 180-second replay limits. All levels are submitted without barriers. The two higher-level invocations begin before some imported new dependencies' replay finishes; every matching target/base compilation finishes before invocation, and all seven new modules ultimately have successful replay receipts. Final `replay-plan.json` describes all three batches of this successful attempt. It is scheduling metadata, not an execution receipt, and the finalizer retains its `mode == 'replay'` filter.

The replay wrapper hashes checker source after subprocess return. It does not measure driver identity before invocation or imported binary identity at runtime. The selected wrapper's old worker121 fallback is unused. It still preserves previous replay booleans during audit-result assignment without checking the previous source hash at that assignment. The finalizer restores flags from source-matching successful receipts containing a checker-hash field, without itself comparing that field against an expected checker hash. Actual final sources, explicit names, checker hashes, and coverage independently agree here; these implementation predicates alone would be insufficient.

## Imported source and object boundary

The reconstructed local graph has **106 nodes: nine new mathematical/Audit nodes and 97 inherited nodes**. The terminal roots PrefixScope, SourceConjugacy, and SourcePrefix jointly reach **104 nodes: all seven new mathematical modules and all 97 inherited modules**, excluding the two Audits. Their individual closures contain 28, 102, and 99 local nodes respectively. There are no unresolved local source imports or cycles. External Mathlib and implicit Lean imports remain outside the local graph.

Worker126 has no saved `source-dependency-scope.json`; these counts come from static reconstruction. All 97 inherited source/object pairs bind to sealed predecessor evidence and `before126` pins: 60 use worker125's inherited bindings, 34 additional nodes use worker124's inherited bindings, and three use worker125's accepted final validation records. Those three modules are `MarkovAtomicSupportMEA423`, `MarkovHorizontalPairMEA423`, and `MarkovHorizontalSupportMEA423`. No new worker124 `MF8` module is imported. The evidence JSON records all exact paths and hashes under `inherited_object_bindings_from_prior125_124.entries`, with zero missing or mismatched bindings.

Independent validation additionally hashed all 97 exact current source/object pairs at **05:22:16.809947–05:22:16.858366 UTC**, confirming the prior evidence and before126 bindings. That later audit-time preservation check is not a new worker proof receipt or a runtime object measurement. No evidence is backdated.

No worker121 `MAE2` module occurs in the current successful bases: intersections with its previously accepted modules, 212 compiled-but-unreplayed modules, 195-module subset, and 298 unbuilt modules are all empty. None of the old212 appears in a compiler receipt or replay target. The tracked historical excluded/unbuilt set is also absent. The 212 remain a historical unrecovered backlog; neither their absence from these imports nor preservation/reconciliation supplies replay coverage.

## Version boundaries, finalization, and cutoff

There are **19 numeric compiler receipts and 19 source snapshots: eleven successes and eight return-code-1 errors**, plus three successful numeric replay receipts. The first parser rejection is a separate enclosing-wrapper failure, not a compiler failure or rejected replay. There are no wall timeouts, interrupted compiler receipts, missing-outcome snapshots, or failed numeric replay receipts.

All eight compiler errors use distinct obsolete source hashes and differ from final accepted bytes: PrefixObstruction five times, RawConjugacy once, SourcePrefix once, and WordConjugacy once. Independently comparing textual declaration headers through `:=`, after whitespace normalization, finds no changed theorem/definition binders or premises between these rejected snapshots and final sources. This is a static textual comparison, not elaborated type reconstruction. The rejected snapshots remain rejected.

The eleven successful builds include **nine final source versions** (seven mathematical modules and two Audits) plus **two superseded successful versions**:

- RawPrefix initially has seven theorems and four definitions at hash `71735a893ebf6106f836454ac3c66ec846fb842c8521947b8bf6c9a75d84efa7`. Its final hash is `9e2d0040be6e5f23539cc3ba0265d4f1413a7f2b09eeffedb929cc350e62626b`, adding `badPrefix_not_sourceM10D`. The final build finishes at an estimated 05:02:46.713412 UTC, before both Audits.
- PrefixScope initially has three theorems at hash `45dc09151111d70a535befaff139d945549d8781aa7d433a0d3ec48b34444d86`. Its final hash is `5681c4c9d8920c9310f59725f58a7771697b6424e116dbd9f8f75f14ab616052`, adding the two named failure theorems. The final build finishes at 05:09:34.712861, between the Audits. The final replay uses this five-theorem version.

The finalizer is unchanged from worker125 after retagging and predecessor-manifest path update. All three direct invocations—events185–186, 198–199, and 208–209—return code zero with complete **7 compiled / 7 validated / 40 closures**, no pending modules, and zero replay failures. Their manifest sizes are 87, 91, and 93. There is no partial or failed finalizer result. Preservation counts 5,415 prior inputs from 5,416 initial entries, excluding only the run's setup script, and preserves the predecessor's 97 indexed artifacts.

The first Audit finishes at an estimated **2026-10-16 05:08:46.016762 UTC**, the final Audit at **05:10:45.113732**, and the last replay at **05:10:52.172593**. Final-check is retained at 05:15:06.699256, manifest at 05:15:06.711224, and last-verification at 05:15:06.713534. `final.json` is retained at 05:15:30.923746 with SHA-256 `ebe62c2f416e0a852f94c045a959d66e879d25fcf27a64f3327bd28f8cb4e1ca`. The controller completes at 05:15:59.295990, about 178.333 seconds before the nominal 05:18:57.628970 deadline, after approximately 1621.667 seconds.

The 211-event log contains `turn.completed`; its 515,577 bytes exactly match activity accounting, with zero stderr bytes. All three exact current numeric replay receipts and checked finalization counterparts match the archive, with no additional replay receipt observed. The companion evidence records 133 exact static input hashes and a final byte-stability check. This review establishes the described retained local replay coverage, not a whole-source rebuild, independent binary verification, official-checker admission, or mathematical completion. Historical cutoff and failed-version distinctions remain intact.
