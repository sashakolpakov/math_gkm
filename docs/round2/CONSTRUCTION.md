# Round 2 construction checkpoint — Codex/Astra

All changes are experimental bootstrap. No authoritative admission, certified
persistent switch, whole-mission completion, or live API call is claimed.
First-round evidence is retained. Copies of changed first-round machinery and
RESUME are evidence/round2/*.before.*. Earlier receipts are historical claims
and are not authoritative in view of the supervisor's import-shadowing audit.

Proof boundary repair:

The restricted gate compiles a generated closed proof AST in a fresh directory,
using absolute pinned Lean/leanchecker paths and an allowlisted environment.
The writable project build tree never participates in its elaboration imports.
Pinned core precedes the one-module output tree for replay. External project
proof dependencies are rejected. The generated validator calls collectAxioms
and rejects nonempty dependencies during compilation; success text is not
parsed as authority. Exact source, target/proof AST, contract, executable hashes,
output hash, and import root are recorded. Rechecks regenerate the proof.
Candidate source cannot add commands, imports, custom axioms, or tactics.

The real shadow test compiles a counterfeit Init with inhabited False, shows
that the deliberately vulnerable import order accepts it, and shows the new
gate rejects it even with hostile inherited environment variables. A positive
universal proof and exact refutation remain controls. Tests also exercise
missing imports, mismatched root, mutation of evidence, dispatch failures,
contract action limits, output cap, timeout, and replayed model responses.

This is NOT an independently frozen validator. Candidate-writable Python can
still be changed, hashes cannot prevent concurrent writes, and separate
processes do not confer authority. requests/freeze-boundary.json is the concrete
request to freeze and independently audit validator, binaries/import resolution,
loader and contract meanings. It inventories core artifacts and executables;
OS/Python runtime and protected result channel remain supervisor obligations.
No JSON flag enables admission. The gate always returns authoritative=false,
root_closed=false. General source validation is separately provisional.

Executable research interface:

machinery.engine persists a request, consumes a bound response, executes actions
through Broker, journals each result, and emits the next request with actual
observations. No campaign recipes are built into the controller. Adapters are
controller-owned callables; proposal JSON cannot install new host capabilities.
The transport schema requests gpt-6-astra and records provider metadata, but
model identity supplied in writable JSON is not an attestation. Tests use
explicit_protocol_fixture. The real experiment run uses direct_bootstrap_proposer
(the current authorized turn); it is not an activated external API transport.
The supervisor can drive the same foreground commands with actual responses.

Broker supports a pure Python subset with invented functions, loops, exact
fractions, input data, and comprehensions. AST restrictions withhold host I/O;
operation/range/integer limits and a trace step budget bound supported programs.
The runner caps combined output, wall time, CPU time, and kills the process group.
OS address-space/data limit calls and nested sandbox installation failed in this
environment; no hard memory-isolation guarantee is claimed. Full Python/GAP/Sage
scripts and arbitrary Lean source await supervisor containment. GAP is installed;
Sage was not found. Process groups do not contain malicious setsid escape, which
is inaccessible in the pure subset but remains an external-worker obligation.

Actual restricted proofs now run the gate, rather than enqueueing. Arbitrary
Lean source is queued because elaborators can perform host I/O. Attachment runs
a structural dependency check, then queues semantic obligations; it never claims
that graph coherence is a semantic proof. Unbound citations remain pending
searches, never retrieved_text. Audit-complexity metadata is excluded from
scheduling contexts. Events and results are copied at boundaries; exceptions
are observations and consume actions. The append history is tamper-evident under
hash comparison but writable storage is not an immutable external evidence store.

Operational bridge and new Lean results:

MathGKM/Protocol.lean is actually executed by machinery/protocol.py for engine
issue/claim/record/finish transitions. Its theorems prove budget preservation,
that recording requires an in-flight request, and rejection of repeated claims.
The code guard is reused, not reimplemented as a Python boolean table. Its source
hash is checked across each invocation. Tests execute these Lean transitions
inside the request/response loop. Crash recovery fails closed on consumed but
unfinished batches, requiring inspection rather than automatic replay.

This proves neither the filesystem/JSON bridge nor all controller semantics.
Broker execution, proposal generation, parser correctness, action meanings,
proof-search implementation, actual cost, timed responses, and future interpreter
self-replacement are still outside this model. The earlier finite continuation
comparison is preserved but not transferred to the research loop. Its overhead
parameter is still not a bound on real validation/installation. The certified
switch path remains disabled. No finite outcome table was substituted.

MathGKM/Gluing.lean constructs a quotient of B+C along a span B<-A->C, defines
its injections and compatible-map extension, proves both commuting triangles
and uniqueness, proves compatibility necessary, and gives a conflicting-binding
counterexample. This is a pushout universal property in types. It is not an
implementation of dependent Lean-module attachment or a model-category claim.

Validation rebuilds every listed project dependency from source in a fresh
import tree, then replays EACH project module, not merely the final importer.
Pinned Mathlib/Lean imports remain declared trusted dependencies. Round2Audit
extracts direct proof dependencies and transitively checks allowed ordinary
axioms. Independent kernel/English/runtime validation remains pending.
