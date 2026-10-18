# Installed V3 acceptance and portable formal reconstruction

This source-only bundle preserves the actual installed checkpoint 006 acceptance
and its isolated portable Construction rebuild. It contains 277 evidence members,
60,095,605 source bytes, compressed to 4,134,777 bytes. Every member hash was
independently verified; no compiled objects, package caches or links are included.

Archive SHA256:
`bf9c11b0aba4351804febddf530839e5fe58f789b2e9beea3223ca7da319fd7e`.

The exact tested 118-source snapshot is under
`operations/installed006-tested-sources/sources/`. Its installed manifest SHA256
is `2b141d4faf49da9ad082f6dea0f7694730723e725121e4528484a01de942a4fd`.
Historical Lean sources and the original aggregate were preserved; the new
Construction entry point is additive. Current live sources may later have a
separately reviewed operational repair. Historical receipts retain their own
versions and do not automatically authorize a changed implementation.

The real full-Mathlib preflight passed in 519.726834 seconds:

- The neutral identity `∀ n : Nat, n + 0 = n` passed four sandboxed compilations,
  four independent kernel replays and premise inspection. Its axiom list is empty
  and the required identity declaration occurs in its checked dependency closure.
- A `False` target failed with a real Lean type mismatch.
- Requiring the unused `DeploymentRoot.Root` constant failed actual dependency
  inspection. This is a use-condition control, not a missing logical hypothesis.
- The exact-root completion adapter verified the Lean proof but left resolution
  false because independent English/source correspondence approval was absent.

The installed Construction consumer separately passed. Its generated Lean
sources, complete result and rebuild record are retained. These are known neutral
integration examples and a formal-model consumer, not new Markov theorems or
certified arbitrary host changes. D1/D2/D3 remain open.

The portable test freshly compiled and independently replayed all seven modules
in `repro/manifest-construction-v3.json`, using existing pinned dependency binaries.
The manifest SHA256 is
`48146125c4e8a81271b7dfae30d3e3d9809230d22930eb36a078334dd32ae589`;
its source Git commit is
`4915b7c6cfa50c2c66c33155d944e13d2f067f84`. These are different identities.
This was not a cold network/dependency bootstrap. The historical reproduction
manifest remains unchanged.

Extract into a new directory. Archive names are relative, while original absolute
paths inside receipts remain host provenance. Rebuild derived objects from the
retained sources, pins, commands and recipes; historical object hashes do not
mean binary payloads are included. Fresh runtime deployments regenerate their
own paths, source review and actual test receipts. No live LLM calls occurred in
these acceptance tests, and no live curation/evaluation material is in this bundle.
