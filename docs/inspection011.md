Source-only construction011; independent review and execution remain mandatory.

The trusted producer emits newline-delimited `math-gkm.inspection-dag.v2` records:
header with exact ordered roots; postorder Expr nodes and checked declarations;
one full selected-module catalog; per-root used declaration references, permitted
axioms and distinct-node/edge/duplicate counts; exact end counts. Every catalog
declaration comes from the checked environment, including unused declarations.
Opaque bodies, type dependencies and inductive constructors remain included.
No expression pretty printer, alpha-equivalence cache or candidate digest is used.
Pointer equality memoizes identical live Expr objects only; different allocations
with equal structure obtain equal Merkle hashes. Name constructors, every Level
constructor, ordered metadata entries, every DataValue including full Syntax and
source spans/substrings, binder names/info, literals, projections and let flags
are encoded explicitly. Runtime computed caches are not structural fields.

Trusted Python derives `math-gkm.expr-merkle-sha256.v2` identities using existing
canonical JSON SHA256: `[schema,"expr",tag,fields,child_hashes]`, then
`[schema,"declaration",kind,isUnsafe,ordered_level_parameter_names,type_hash,
body_hash_or_null]`. Presence of a body differs from absence. `semantic_sha256`
is an exact encoding identity, not semantic equivalence or novelty. Context/source
and object bindings remain separate mandatory gates. Catalog/retention/actual-use
comparisons use schema plus digest. Finished-validator.v2 binds the encoding;
legacy receipts require a charged new identity/check, never silent reuse.

Unchanged 32MiB artifact, 1MiB subprocess output, native memory/disk/time and
256MiB finished-bundle caps apply. New stream-specific guards: 1MiB per record,
1,000,000 Expr records, depth 4096, 200,000 declaration records; at most 16 roots.
Each root enqueues a name once, permits 200,000 distinct nodes, and separately
permits 200,000 dependency edges (including duplicates). No queue pop is charged
twice to the distinct-node budget. Exactly completed boundaries succeed; an
additional unique node/edge fails deterministically. These are explicit new
encoding/work guards, not increased old process/resource caps. Metadata/leaf
serialization and pinned getUsedConstants still run inside those process guards.
The parser retains bounded node hashes and compact declaration records, rejects
bad tags/arity/references/order/duplicates/counts/truncation/trailing data and
oversize records, and binds the streamed hash to the stat-checked regular file.
Full expressions are retained losslessly in the artifact; full original sources
remain retained. This does not promise capacity for every legitimate proof.

Own feedback uses math-gkm.own-check-feedback.v1. Only own ingestion/completion
call sites publish a controller projection into history/own-checks/<hash>.json;
the last 32 enter both role requests independently of optional report metadata
and keep_observations. Raw validator/receipt evidence remains at origin and its
result digest accompanies the projection. Fixed stage/category enums and bounded
integers replace arbitrary exception prose. Process termination and file sizes
are controller measured. Fixed inspector failure records come from a bounded,
unchanged regular producer artifact; stdout/stderr tokens are ignored. They are
own-local diagnostics, not cryptographic proof of a cause; ambiguity stays unknown. Compiler
exit1 means type-or-elaboration rejection, not a counterexample. Unknown remains
unknown. These fields do not alter acceptance, scheduling, budgets or strategy.
No evaluator/adapter call site exports feedback; no permissions are expanded.
Existing008 diagnostics and009 hypothesis evidence binding are unchanged.

After review the supervisor supplies local.scratch/inspection011-fixture.json
and its external hash via GKM_INSPECTION011_FIXTURE_SHA256. Schema:
{schema:"math-gkm.inspection011.fixture.v1", supervisor_selected:true,
 unchanged_original_claim_context_dependencies:true, cases:[case],
 differential_cases:[case]}. Required cases have exactly large_pilot, neutral,
full_mathlib tags. A case contains source_directory (within local.scratch), complete
files_sha256 including contract.json and every original source, exact bound task,
task_hash, solution, solution_hash, ordered required, seconds (existing validation
budget), expected_checked, and provenance identifying immutable stopped pilot
evidence. No fixture source is supplied or invented in011. The large case must
retain its original claim/context/dependencies and actual fresh compile, kernel
replay and inspection under unchanged limits. Measurements retain artifact bytes,
work counts, wall time, native/RSS receipts and actual admission, including failure.
Supervisor review must verify completeness/provenance, the existing budget, and
the full-Mathlib import path before authorizing execution.

Required follow-up includes repeated-diamond and shared forbidden-axiom actual
closures, exact work boundaries, old/new complete closure differential comparisons,
all existing mathematical negative controls with intended reasons, receipt
mutation/unfinished negatives, own-ingest-to-next-request tests for every class
(including interruption/context/type/unknown), spoofed provenance/private canaries,
and the immutable large fixture. The small synthetic stream tests are parser
controls only and cannot replace these integration obligations.
