# Worker 000189 retained validation audit — interrupted host, completed local selected validation

Request `97b019af81a143628246a03e1f19b898`. The host reconciliation is **uncertain_effects**, with reason **watchdog exited without receipt**, `report:null`, and mathematical resolution false. No receipt exists. The local raw stream, `final.json`, final validation record and successful proof-command receipts survive. They do not change the host outcome or make the 39-file archive complete.

Static audit only: no project compiler, Lean checker/replay, finalizer, generator, experiment, CAS, or project Python import was executed. No mathematical values or RNG draws were recomputed. Reads used the original partial archive first and separately retained exact current counterparts where missing; ordinary compiled objects were hashed without interpretation. Later workers and proposer contact/help were excluded. Audit writes are under the designated temporary directory.

## Selected versions and actual coverage

All 23 selected final source hashes match the validation map, the selected successful compiler receipt and its saved source snapshot. The union contains 66 explicit theorems and 18 definitions. The retained final joint replay checks 84 selected explicit names; the final Audit prints all 66 distinct selected theorem closures with only the permitted axioms. These are local selected-union validation facts, not a completed host result or fresh inherited-source rebuild.

| Module | Theorems | Definitions | Final build event | Recorded seconds | Ordinary object archive |
| --- | --- | --- | --- | --- | --- |
| MarkovTopFourthBetaM97B | 3 | 1 | 38 | 35.120263 | current only |
| MarkovTopFourthControlM97B | 5 | 1 | 46 | 10.648080 | matches |
| MarkovTopFourthSignsM97B | 4 | 0 | 50 | 11.022212 | current only |
| MarkovTopFourthGroupsM97B | 4 | 0 | 57 | 10.208400 | matches |
| MarkovTopQuadraticSourceM97B | 4 | 0 | 63 | 11.962139 | matches |
| MarkovTopQuadraticResidualM97B | 4 | 3 | 70 | 11.931228 | matches |
| MarkovTopSixthBetaM97B | 2 | 3 | 123 | 9.059349 | current only |
| MarkovTopSixthControlM97B | 5 | 1 | 210 | 10.988336 | current only |
| MarkovTopInwardGeneratorM97B | 3 | 0 | 137 | 19.565635 | matches |
| MarkovTopSixthCertificateM97B | 2 | 7 | 147 | 106.687116 | current only |
| MarkovTopSixthDeltaSignM97B | 2 | 0 | 225 | 78.499492 | current only |
| MarkovTopSixthASignM97B | 2 | 0 | 225 | 45.370875 | current only |
| MarkovTopSixthCSignM97B | 2 | 0 | 225 | 32.080718 | current only |
| MarkovTopSixthKSignM97B | 2 | 0 | 175 | 81.428070 | current only |
| MarkovTopSixthReducedSignM97B | 2 | 0 | 217 | 77.557340 | zero archive |
| MarkovTopSixthGeneratorM97B | 1 | 0 | 174 | 80.498606 | current only |
| MarkovTopSixthGroupsM97B | 4 | 0 | 230 | 27.719671 | current only |
| MarkovTopSmall2GapM97B | 2 | 0 | 160 | 128.879311 | matches |
| MarkovTopSmall3GapM97B | 2 | 0 | 211 | 88.731029 | current only |
| MarkovTopSmall4GapM97B | 2 | 0 | 236 | 99.374784 | current only |
| MarkovTopSmall5GapM97B | 2 | 0 | 236 | 170.266608 | current only |
| MarkovTopSectorClosedM97B | 5 | 0 | 242 | 14.559408 | current only |
| MarkovTopSectorResidualM97B | 2 | 2 | 242 | 10.595790 | current only |

The unselected `MarkovTopSmall5FastM97B` diagnostic has two duplicate theorem declarations. Its single build timed out at recorded 100.289688 seconds; no ordinary object or archive object was observed. It receives no selected/replay/print credit. The complete mathematical source inventory is 24 modules, 68 theorem occurrences and 18 definitions; duplicate diagnostic names do not add accepted distinct closures.

## Compiler attempts and the receipt collision

There are 39 retained compiler receipts: 23 successful mathematical builds, two successful Audit builds, nine return-code-one failures, and five timeouts. Raw command summaries additionally retain one successful SixthControl attempt whose timestamp-only receipt and snapshot pathname collided with SixthCertificate. Thus there are 40 reported build invocations but 39 surviving receipt/snapshot pairs. No missing snapshot is reconstructed or substituted.

Events 138 and 147 report the same `build-1792235236432769000.json`: SixthControl at 19.94452999997884 seconds and SixthCertificate at 106.68711579201045 seconds. The surviving receipt and snapshot bind SixthCertificate. The final selected SixthControl uses the distinct successful rebuild `build-1792235720262304000-MarkovTopSixthControlM97B.json`, whose final source snapshot matches. Compiler object destinations were module-specific; the receipt collision does not make those destinations identical.

| Failed/timeout event | Module | Result | Recorded seconds | Snapshot equals final source |
| --- | --- | --- | --- | --- |
| 109 | MarkovTopSixthBetaM97B | return code 1 | 27.478470 | False |
| 113 | MarkovTopInwardGeneratorM97B | return code 1 | 7.302885 | False |
| 129 | MarkovTopInwardGeneratorM97B | return code 1 | 7.346514 | False |
| 166 | MarkovTopSmall3GapM97B | timeout; compiler return-code field absent | 180.275906 | False |
| 169 | MarkovTopSixthCSignM97B | return code 1 | 120.509696 | False |
| 170 | MarkovTopSixthDeltaSignM97B | return code 1 | 131.307837 | False |
| 171 | MarkovTopSixthASignM97B | return code 1 | 137.908515 | False |
| 197 | MarkovTopSmall4GapM97B | timeout; compiler return-code field absent | 240.465706 | False |
| 195 | MarkovTopSixthReducedSignM97B | timeout; compiler return-code field absent | 240.342792 | False |
| 196 | MarkovTopSmall5GapM97B | timeout; compiler return-code field absent | 240.380792 | False |
| 210 | MarkovTopSixthDeltaSignM97B | return code 1 | 88.286568 | False |
| 210 | MarkovTopSixthASignM97B | return code 1 | 18.234457 | False |
| 210 | MarkovTopSixthCSignM97B | return code 1 | 10.788178 | False |
| 248 | MarkovTopSmall5FastM97B | timeout; compiler return-code field absent | 100.289688 | True |

Every retained build receipt has its own snapshot hash checked and its saved summary matched to the raw event. Complete snapshot-to-final textual diffs are retained in evidence. Later successes do not reclassify prior failures. Filename epochs plus recorded durations give estimated build intervals, not independent process-clock observations. No same-module overlap appears among the retained intervals. Multiple different-module jobs overlap. The scan of file-change events is not claimed to detect every edit embedded in a shell command.

The compiler was given the ordinary source pathname, after the wrapper saved its snapshot. Receipts record source hashes and command arguments, but no compiler-output digest. Current object hashes, manifest hashes, partial archive identities and later replay/Audit records provide the separately retained bindings; they are not a fabricated invocation-time output attestation.

## Replay and axiom stages

| Replay event | Audit event | Selected modules | Guarded names | Printed theorem closures |
| --- | --- | --- | --- | --- |
| 79 | 80 | 6 | 29 | 24 |
| 259 | 251 | 23 | 84 | 66 |

Stage one uses six final-source modules, 29 explicit names and 24 theorem closures. Stage two uses all 23 modules, 84 explicit names and 66 closures. The Audit/replay jobs overlap within each stage; the final Audit finishes before the final replay. Both stages have successful retained receipts. There are 90 printed rows across the stages and 66 distinct final selected closures. Exact Audit source text, successful Audit compiler output, printed name set, axiom lists and selected source maps were independently matched.

The replay driver reads the selected ordinary module files, forms their joined constant set, imports only the boundary modules not included in that selected set, checks absent/unsafe/partial names ending M97B, then invokes ordinary Lean replay. The six-module stage prints three direct inherited imports; the full stage prints four. These are direct boundary counts, not transitive graph sizes. Explicit theorem/definition/abbreviation parsing is distinct from compiler-generated/private constants; ordinary replay behavior for generated declarations remains a limitation. The checker digest is bound for both invocations.

The independent selected import closure has 2,870 project modules: 23 selected and 2,847 inherited. The inherited pairs comprise 2,840 sealed188 pairs and seven accepted188 modules; all-source closure including Fast has 2,871. Fresh exact current source/object hashes match sealed expectations and controller-before189 in the separately recorded pair window. This is identity verification, not an inherited rebuild. Implicit Init explains the direct observed import counts.

All endpoints import the historical 212-module group, its included 195-module subset and the separate 19-module group. WindowLC retains its empty-checker limitation and two historical prints; Abel has its separate two-print limit. Worker166 host completion is distinct from its failed combined replay, and its seven unreplayed prefixes receive no recovery. Worker171’s failed host outcome remains dated. Worker183 stays uncertain-host compilation at cutoff;184 later recovered ten modules, of which nine are inherited here. New selected replay does not extend those historical windows.

## Wrapper and finalizer boundaries

The final validation wrapper adds the first module name to timestamp-derived receipt/snapshot names. It omits `--profile`. The two completed wrapper-edit records are events151 and201. Earlier saved compiler commands retain their actual flag lists, including a batch started at182 and completed at210 that had loaded the older wrapper before the later edit. The final wrapper file is not treated as the exact invocation bytes of every earlier run. Retagged predecessor/final wrapper diffs are retained separately.

`validate()` binds final source hashes to successful build receipts, a successful exact selected replay/source map, and an exact selected Audit/source map; it also scans forbidden source tokens. It does not independently check the checker digest, exact printed theorem-name set, permitted axiom lists, successful Audit build receipt or compiler object hashes. Those missing checks are supplied by this static independent review of retained records. `finish()` checks the initial inputs and previous manifest, writes the new manifest and last-verification, and does not execute proof validation.

Validation event88 records the first six-module stage. Event263 records the final23/66 selection. The finalizer command completes at269; the raw agent JSON is event270 and `turn.completed` is271. The raw final JSON exactly matches local `final.json`. The watchdog then fails during archive-copy `target.write_bytes` with ENOSPC, before host receipt construction/writing. No host return code or duration is invented from this control flow.

## Initial inputs, root and partial retention

The worker input snapshot has22,724 entries and excludes compiled objects. Every listed current input matched at the foundation observation; all128 predecessor188 manifested artifacts also matched. Six input paths are outside the controller-before map: MISSION.md, lakefile.toml, lake-manifest.json, lean-toolchain, .control/markov/contract.json, and this worker’s setup script. There are no owned-input exclusions. This is not a claim that every compiled file in the larger controller-before map will remain present after root’s separately authorized post-interruption cleanup.

The root digest is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The saved raw contract digest `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068` matches the exact contract bytes printed at event8. Canonical compact ASCII and Unicode JSON digests are distinct and retained; parsed semantic equality is not confused with raw-byte equality.

The original partial archive has39 files. Current exact scope has181 files and the worker manifest has177 entries, all matching current bytes. Compared with the earlier179-file protection inventory, only two cache paths were outside that earlier enumeration; all179 shared hashes match. This is a scope difference, not evidence of later cache creation. Original archive/current mismatch is exactly the zero-byte SixthReducedSign object versus126,011,832 current bytes.

The supplemental bundle retains122 missing nonbinary files plus two opaque cache files,124 exact COW copies and3,609,264 bytes. Original15 control records and39 archive entries stay separate. All154 current nonbinary paths are enumerated as eligible exact preserved counterparts. Nineteen missing/different current ordinary compiled objects total782,958,632 bytes and remain protected in place; no binary supplement was made and no empty archive object repaired. The two cache files are retained without decoding, execution, producer attribution or invocation-version inference.

The machine-readable `special_partial_preservation_plan` lists every original control/archive pin, all154 current nonbinary mappings,124 supplemental copies/companions and19 protected-in-place object pins. Root’s separate inactive-cache cleanup excludes188/189 scope and current protected import objects. Any later removal of inactive historical compiled paths is post-interruption operational work, not a rewrite of saved189 verification or prior sealed windows.

All 25 expected optional CAS digest paths were initially absent. This availability fact is separate from the 25 existing ordinary selected/Audit objects and their partial archive retention. Final optional-CAS availability, pending Fast absences and the mixed administrative map are recorded independently below; archived validation.json is present, so a blanket all-absent assertion would be wrong.

## Saved finite output bindings

| Raw event | Saved record | Binding |
| --- | --- | --- |
| 69 | fourth-moment-experiment.json | whole JSON object |
| 186 | sixth-exact-experiment.json | whole JSON object |
| 45 | fourth-sign-certificates.json | whole JSON object |
| 78 | source-experiment.json | exact literal projection |
| 94 | sixth-probe.json | exact literal projection |
| 105 | sixth-sign-probe.json | exact literal projection |
| 142 | small-gap-certificates.json | exact literal projection |

Source stdout excludes both labels and witness; both remain in the saved JSON. Sixth-probe summaries count stored array lengths and stored Boolean flags, not recomputed signs or validity predicates. Script digest fields in the three finite experiment records match the retained final script bytes. Symbolic generation and later generated-source edits remain separate historical records; final script retention does not authenticate every earlier generator invocation. Primary finite-domain support independently recounts only index domains.

## Timing and audit preparation

The watchdog launch is10:54:20.053170 UTC. The process record’s `started` value is10:54:54.676742, and its nominal1,800-second deadline counterpart is11:24:54.676742. Retained machinery/worker.py lines129–130 sample wall time into started and set the monotonic deadline immediately afterward; lines139–140 write that same started into process.json. The earlier watchdog launch is not the timer origin. Its code hash matches the controller implementation map.

Last-verification current mtime is11:23:23.679825,90.99691677093506 seconds before the nominal deadline; local final.json mtime is11:23:54.149134,60.527608156204224 seconds before it. These metadata samples are not measured command completion/host finish times. No final host elapsed time or outcome is inferred. The exact receipt-only watch, including its failed ENOSPC log-write observation with unknown result, is embedded without manufacturing another absence.

Pre-window audit refinements are disclosed in evidence: a provisional watchdog-based deadline was corrected after direct operational-code review; an exact wrapper was found in the original archive rather than guessed supplemental location; and the finite stdout projection was corrected to omit both labels and witness after a pre-output assertion stopped enrichment. These changed audit parsing/wording only. No research program or mathematical calculation was run.

## Closing state

The project observation window is closed. The following records are finite observations and do not imply continuous stability. Method and validation windows remain separate; final note rendering reads audit files only. No later-worker reads, object execution, mathematical recomputation or historical-status upgrade occurred.

### Final named-input hashes

```json
{
  "started_utc": "2026-10-17T11:59:29.812130+00:00",
  "finished_utc": "2026-10-17T11:59:56.724376+00:00",
  "input_count": 25976,
  "all_unchanged": true,
  "changed": {},
  "missing": [],
  "qualification": "One bounded hash observation, not continuous stability. Source/object and historical validation statuses unchanged."
}
```

### Pending Fast objects

```json
{
  "started_utc": "2026-10-17T11:59:56.724385+00:00",
  "finished_utc": "2026-10-17T11:59:56.724409+00:00",
  "applicable": true,
  "path_count": 2,
  "paths": {
    "/Users/sasha/math_gkm/.control/markov/workers/000189/artifacts/evidence/markov-97b019af/MarkovTopSmall5FastM97B.olean": true,
    "/Users/sasha/math_gkm/evidence/markov-97b019af/MarkovTopSmall5FastM97B.olean": true
  },
  "scope": "Exactly two pending Small5Fast ordinary/archive object paths."
}
```

### Mixed administrative availability

```json
{
  "started_utc": "2026-10-17T11:59:56.724410+00:00",
  "paths": {
    "/Users/sasha/math_gkm/.control/markov/workers/000189/receipt.json": true,
    "/Users/sasha/math_gkm/.control/markov/workers/000189/artifacts/evidence/markov-97b019af/validation.json": false,
    "/Users/sasha/math_gkm/.control/markov/workers/000189/artifacts/evidence/markov-97b019af/manifest.json": true,
    "/Users/sasha/math_gkm/.control/markov/workers/000189/artifacts/evidence/markov-97b019af/last-verification.json": true,
    "/Users/sasha/math_gkm/evidence/markov-97b019af/final-check.json": true
  },
  "path_count": 5,
  "scope": "Absence booleans; archived validation is expected present. No blanket all-absent assertion.",
  "finished_utc": "2026-10-17T11:59:56.724433+00:00"
}
```

### Optional CAS availability

```json
{
  "started_utc": "2026-10-17T11:59:56.724434+00:00",
  "finished_utc": "2026-10-17T11:59:56.727270+00:00",
  "path_count": 25,
  "files": [
    {
      "module": "MarkovTopFourthBetaM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/9b464e54092a3bcaccbe9e49d65386968374a0d80744ff10e1c939fa962fb39b",
      "present": false,
      "expected_sha256": "9b464e54092a3bcaccbe9e49d65386968374a0d80744ff10e1c939fa962fb39b",
      "expected_bytes": 1453920
    },
    {
      "module": "MarkovTopFourthControlM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/30e8cc2463cc77947a71aba28325f793a004a123d0a2156e5f807ff2033f69b0",
      "present": false,
      "expected_sha256": "30e8cc2463cc77947a71aba28325f793a004a123d0a2156e5f807ff2033f69b0",
      "expected_bytes": 634960
    },
    {
      "module": "MarkovTopFourthSignsM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/85b0bbe5a08cea5d33c946f0e992038a4b8ede14ef526715f6bc6d1fab313b60",
      "present": false,
      "expected_sha256": "85b0bbe5a08cea5d33c946f0e992038a4b8ede14ef526715f6bc6d1fab313b60",
      "expected_bytes": 2045912
    },
    {
      "module": "MarkovTopFourthGroupsM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/893141ad3e3521e92ce79d65b5c9985b06d83994339b433a568f3eb1d8259229",
      "present": false,
      "expected_sha256": "893141ad3e3521e92ce79d65b5c9985b06d83994339b433a568f3eb1d8259229",
      "expected_bytes": 297528
    },
    {
      "module": "MarkovTopQuadraticSourceM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/fd0696d170906e49c4a45a362edc25f6bffe3eb3633230b23427f3d123898d7e",
      "present": false,
      "expected_sha256": "fd0696d170906e49c4a45a362edc25f6bffe3eb3633230b23427f3d123898d7e",
      "expected_bytes": 364136
    },
    {
      "module": "MarkovTopQuadraticResidualM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/e28a25bfa61ae0a6567674fcfc000cfb00d82ab2952a447a3820c8bf3df610c3",
      "present": false,
      "expected_sha256": "e28a25bfa61ae0a6567674fcfc000cfb00d82ab2952a447a3820c8bf3df610c3",
      "expected_bytes": 94648
    },
    {
      "module": "MarkovTopSixthBetaM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/9eb89364daf06936c670b2ebfcf53c478ca957d2ba9cd0732c664271e0ec739a",
      "present": false,
      "expected_sha256": "9eb89364daf06936c670b2ebfcf53c478ca957d2ba9cd0732c664271e0ec739a",
      "expected_bytes": 4712584
    },
    {
      "module": "MarkovTopSixthControlM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/bbb7ee6b39f535d3c6603bca78bafdd22e79e15d27f99bb7b49258b060618251",
      "present": false,
      "expected_sha256": "bbb7ee6b39f535d3c6603bca78bafdd22e79e15d27f99bb7b49258b060618251",
      "expected_bytes": 1234416
    },
    {
      "module": "MarkovTopInwardGeneratorM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/0e0c3e418d5aeefc7b5f97532eba718c24550f6b65a12d08b86069785b78cd30",
      "present": false,
      "expected_sha256": "0e0c3e418d5aeefc7b5f97532eba718c24550f6b65a12d08b86069785b78cd30",
      "expected_bytes": 323088
    },
    {
      "module": "MarkovTopSixthCertificateM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/44e6973456c59479e4a93552277264d178290253db2b378f143deac6eceb09c8",
      "present": false,
      "expected_sha256": "44e6973456c59479e4a93552277264d178290253db2b378f143deac6eceb09c8",
      "expected_bytes": 54774312
    },
    {
      "module": "MarkovTopSixthDeltaSignM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/b56d3811abef874a7808959b893f644f98548778d5eb4fbb64535a6cbf13a489",
      "present": false,
      "expected_sha256": "b56d3811abef874a7808959b893f644f98548778d5eb4fbb64535a6cbf13a489",
      "expected_bytes": 7962088
    },
    {
      "module": "MarkovTopSixthASignM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/8fad4a32a1926765ef0750bda6592e90605376c268818f3c463ba1f76c769055",
      "present": false,
      "expected_sha256": "8fad4a32a1926765ef0750bda6592e90605376c268818f3c463ba1f76c769055",
      "expected_bytes": 11759296
    },
    {
      "module": "MarkovTopSixthCSignM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/16b2e29c100d0f42a3714a80edededdd168389bd552544b53b17df3ec455c67e",
      "present": false,
      "expected_sha256": "16b2e29c100d0f42a3714a80edededdd168389bd552544b53b17df3ec455c67e",
      "expected_bytes": 1515368
    },
    {
      "module": "MarkovTopSixthKSignM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/8f8c5ba31cbf864fe51ec49d127e1caae3e79a44aef6866e514b6a4508e50c94",
      "present": false,
      "expected_sha256": "8f8c5ba31cbf864fe51ec49d127e1caae3e79a44aef6866e514b6a4508e50c94",
      "expected_bytes": 2427832
    },
    {
      "module": "MarkovTopSixthReducedSignM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/47cac9d1ff5d56efd60ce20d0449ae259bc132d034dfa7c71ca23f77d5242f31",
      "present": false,
      "expected_sha256": "47cac9d1ff5d56efd60ce20d0449ae259bc132d034dfa7c71ca23f77d5242f31",
      "expected_bytes": 126011832
    },
    {
      "module": "MarkovTopSixthGeneratorM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/c2c16aa6a1d95f34dce4959d1d6502c6b04598746eedb9701993168c00819d3c",
      "present": false,
      "expected_sha256": "c2c16aa6a1d95f34dce4959d1d6502c6b04598746eedb9701993168c00819d3c",
      "expected_bytes": 880840
    },
    {
      "module": "MarkovTopSixthGroupsM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/9683fe8f0fcedac78fdb722cc67115252471b2e2ce176d74d127883549e362ba",
      "present": false,
      "expected_sha256": "9683fe8f0fcedac78fdb722cc67115252471b2e2ce176d74d127883549e362ba",
      "expected_bytes": 610896
    },
    {
      "module": "MarkovTopSmall2GapM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/956f2a983bbd688d4e3e4a9c2d73aa18f5fef85ac56dfd30ff1ff5875074d346",
      "present": false,
      "expected_sha256": "956f2a983bbd688d4e3e4a9c2d73aa18f5fef85ac56dfd30ff1ff5875074d346",
      "expected_bytes": 56174896
    },
    {
      "module": "MarkovTopSmall3GapM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/a2275d94d47c9bc5fe1d250b760f8d1ebd87491d453619d85e71a364d37fe6e5",
      "present": false,
      "expected_sha256": "a2275d94d47c9bc5fe1d250b760f8d1ebd87491d453619d85e71a364d37fe6e5",
      "expected_bytes": 104902488
    },
    {
      "module": "MarkovTopSmall4GapM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/c90e26bbb3b95a65709398673632867de1562a7373c54de927811199f03d9309",
      "present": false,
      "expected_sha256": "c90e26bbb3b95a65709398673632867de1562a7373c54de927811199f03d9309",
      "expected_bytes": 177631736
    },
    {
      "module": "MarkovTopSmall5GapM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/3fef9126d10be3e1db80172aefb43e30c72ad63fc918bf5d685f315a3e1c5076",
      "present": false,
      "expected_sha256": "3fef9126d10be3e1db80172aefb43e30c72ad63fc918bf5d685f315a3e1c5076",
      "expected_bytes": 284804832
    },
    {
      "module": "MarkovTopSectorClosedM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/9aee75589c2d81be26305a5e0bc0c8a5c511c5883e64a9b210e8b8a4f269c064",
      "present": false,
      "expected_sha256": "9aee75589c2d81be26305a5e0bc0c8a5c511c5883e64a9b210e8b8a4f269c064",
      "expected_bytes": 179112
    },
    {
      "module": "MarkovTopSectorResidualM97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/b992c636e997dac225105b651c548e7ccc82a9e5926ad0bc86dac3cd19980735",
      "present": false,
      "expected_sha256": "b992c636e997dac225105b651c548e7ccc82a9e5926ad0bc86dac3cd19980735",
      "expected_bytes": 44960
    },
    {
      "module": "MarkovAudit1792234882065380000M97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/e459458e984d107e33564114e414daa692c419e62b0f015bd6f4bf06a4f5bfba",
      "present": false,
      "expected_sha256": "e459458e984d107e33564114e414daa692c419e62b0f015bd6f4bf06a4f5bfba",
      "expected_bytes": 2048
    },
    {
      "module": "MarkovAudit1792236081532331000M97B",
      "path": "/Users/sasha/math_gkm/.control/markov/objects/4b90c1ed00f612ef906fa68dc62dbd443c1f82c9dd3a21a673df94a5667aad71",
      "present": false,
      "expected_sha256": "4b90c1ed00f612ef906fa68dc62dbd443c1f82c9dd3a21a673df94a5667aad71",
      "expected_bytes": 4160
    }
  ],
  "scope": "Optional CAS availability only; ordinary current objects are separately bound and protected. No creator/time or validation inference."
}
```

### Exact-request inventory and supplemental metadata

```json
{
  "started_utc": "2026-10-17T11:59:56.727275+00:00",
  "inventory_finished_utc": "2026-10-17T11:59:57.242714+00:00",
  "archive_count": 39,
  "current_count": 181,
  "manifest_count": 177,
  "archive_added": [],
  "archive_missing": [],
  "current_added": [],
  "current_missing": [],
  "manifest_added": [],
  "manifest_missing": [],
  "archive_hash_changes": {},
  "current_hash_changes": {},
  "manifest_hash_changes": {},
  "archive_current_mismatch": [
    "evidence/markov-97b019af/MarkovTopSixthReducedSignM97B.olean"
  ],
  "manifest_current_mismatch": [],
  "unindexed_unarchived": [
    "evidence/markov-97b019af/last-verification.json",
    "evidence/markov-97b019af/manifest.json",
    "research/__pycache__/finish_97b019af.cpython-314.pyc",
    "research/__pycache__/validate_97b019af.cpython-314.pyc"
  ],
  "added_file_metadata": {},
  "supplemental_metadata_started_utc": "2026-10-17T11:59:57.242878+00:00",
  "supplemental_metadata_count": 248,
  "supplemental_metadata_all_match": true,
  "finished_utc": "2026-10-17T11:59:57.262078+00:00",
  "qualification": "Single bounded exact189 enumeration; no successor reads, execution, bytecode interpretation or file creation attribution. Any additions are metadata/hash observations only, excluded from mathematical credit."
}
```

The exact path sets and all 248 source/copy metadata rows are retained in evidence. The original 39-file archive remains unchanged, including the zero-byte object. All 124 supplemental copies remain separate; the 19 ordinary binaries remain protected in place.

### Independent method agreement

```json
{
  "field_count": 78,
  "shared_input_count": 228,
  "independent_inherited_pair_count": 2847,
  "all_copied_fields_equal": true,
  "independent_validation_bindings_agree": true,
  "method_note_read_fully": true
}
```

The complete independent pair record is embedded in evidence. All copied method fields equal the frozen method evidence. Shared input digests agree. Neither the method nor validation hash window is extended by the final audit-file seal.

