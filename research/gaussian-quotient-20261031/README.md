# Checked Gaussian-quotient progress

This archive contains eight admitted mathematical claims from the stopped
Gaussian-quotient run. It does **not** prove the full positivity conjecture.
No unadmitted candidate, numerical result, model report, request, evaluator task,
compiled object, dependency cache or study controller is included.

The 26 files in `MathGKM/` are unchanged admitted source bytes, including the
full root definition, generic semantic definitions, proof dependencies, frozen
target propositions and reusable accepted wrappers. `PROOF_REGISTRY.json` gives
all eight exact statements, exported declaration names, source hashes and their
original finished-validator bindings. Do not count helper-file declarations as
additional registry admissions.

The main positivity statements cover every valid Gaussian quotient with
`k-l=2`, and separately `k-l=1`, with `l<=k<=n`, nonzero denominator and exact
rational-polynomial quotient identity. These are formalizations of known
published subcases; no mathematical novelty is claimed. Another checked result
classifies polynomiality for a ratio of two consecutive factors. The full
conjecture is proved equivalent to the remaining separated interval-product
positivity statement with `a+r<=b` and `r>=3`; that remaining statement is open
in this archive. See `audit/SUMMARY.md` and the exact Lean statements rather than
interpreting a reduction as a solution.

The target is Conjecture1.2 of arXiv:2603.22226v1, with standard Gaussian
conventions from arXiv:2502.06032v3. The full natural-parameter range, formal
indeterminate, nonzero-denominator condition, arbitrary rational polynomial
witness and nonnegative-integer conclusion are preserved.

## Retained evidence

`validation/<claim-id>/` retains the original FINISHED.json and every file
bound by it: exact rebuild pins, raw validator result, source controls, native
inspector program and declaration artifact, plus retirement metadata and the
original sandbox profile. These are text/source evidence, not compiled caches.
They carry original machine paths for historical provenance; they are not new
authority or commands to restart a run. The raw results were copied and hashed,
not decoded as model payloads. The public audit projected only accepted-registry
fields and validator status/returncode/premise metadata.

All eight original records say `checked_exact_obligation_and_interfaces` in
`deployed_sandbox`; compilation, kernel replay and trusted premise inspection
returned zero without termination. The actual inspector artifacts match their
completion hashes and sizes. All 26 admission-bound workspace source hashes
matched at export. This historical evidence is separate from a fresh replay.

## Reproduction

Use Lean4.32.2 and the exact package revisions in the retained lake manifest.
Prepare dependency checkouts and their ordinary build/cache artifacts separately;
the reproducer performs no download or package update. It checks all nine package
HEADs and tracked-source cleanliness read-only, adds only existing built library
directories to LEAN_PATH, and records packages without built libraries. Lean
rejects any genuinely missing imported module; an unused package such as Cli
does not require a build directory. The original Lean and leanchecker
binary hashes are retained in the public registry; the strict reproducer
requires those exact binaries. Sources and manifest remain available for an
independently audited build on another platform, whose binary/artifact identities
must not be mislabeled as the original ones.

First verify this archive without running a compiler or checker:

```sh
python3 -I -B -S reproduce.py --verify-only
```

For the original host's pinned dependencies, an example invocation is:

```sh
python3 -I -B -S reproduce.py \
  --toolchain /Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2 \
  --packages-dir /Users/sasha/math_gkm/.lake/packages \
  --build-dir /private/tmp/gaussian-proof-reproduction-FRESH
```

Choose an absent external build directory. Run this under the host's normal
bounded process/resource wrapper; the script also has a fixed 1800-second total
window. No generated file is placed in this publication. The script compiles
the full project import closure into fresh objects, kernel-replays every module
with the genuine leanchecker, then recompiles/replays each original StudyCheck
and executes its unchanged native StudyInspect program in a separate directory.
Every fresh inspector artifact must reproduce its original hash, byte count and
completion marker. `REPRODUCTION_RESULT.json` appears only after all eight pass.
Compilation, logs, objects and inspector outputs remain disposable external
reproduction artifacts, not publication sources.

This publication-preparation step did not run Lean, prove new statements,
restart research or alter the conjecture. Fresh reproduction is performed and
reported separately; original receipt flags must not be relabeled as its result.
