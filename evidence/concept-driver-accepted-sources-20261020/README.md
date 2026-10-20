# Accepted Lean sources from the concept study

This packet preserves exactly six baseline admissions and the first exploration
admission. Only accepted FINISHED-bound Lean source files, exact accepted task
and solution metadata, required local module closures, deterministic exported
wrappers, and public dependency pins are included. No private evaluation task,
active draft, role log, resource/process trace, credential, or compiled cache is
included. Original full validator receipts remain at their retained origin; the
packet records their immutable identities without copying host/process metadata.

Every original FINISHED bundle was reverified with the official receipt-reuse
checker while packaging. No Lean compilation, kernel replay, model call, new
admission, or mathematical novelty test was performed by packaging. Renamed
Accepted*.lean exports retain their original explicit status: exact checked
composition renamed, with fresh rebuild required for each consumer.

Each claim has an isolated source tree because StudyCheck/StudyInspect are
claim-local modules. ACCEPTED_SOURCE.json gives the exact task, hypotheses, proof
terms, export names, original receipt hashes and a topological local module order.
Use the exact Lean toolchain and all Mathlib dependency commits in pins/. For each
claim, compile its listed modules in order into a separate empty build directory
with Lean's -o option and LEAN_PATH containing that directory plus the pinned
dependency libraries; then run the pinned leanchecker once per listed module.
StudyInspect is the retained original optional premise-inspection program, not a
necessary mathematical import. Do not combine the seven claim-local StudyCheck
modules into one directory. Existing public repro/ tools explain pinned dependency
bootstrap, but no new source profile or standalone automated rebuild runner has
been tested for this packet. Successful fresh recompilation is not claimed.

The universal Markov conjecture remains open. Admission of structural facts or a
boundary identity does not establish general coefficient log-concavity.
