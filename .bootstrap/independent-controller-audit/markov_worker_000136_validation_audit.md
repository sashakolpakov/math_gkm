# Worker 000136 retained validation audit

Request `f1e4fe3b99d84d70bd218f29dcffcb3c`; archive `/Users/sasha/math_gkm/.control/markov/workers/000136/artifacts`. This is static retained-evidence parsing and byte hashing only: no project code, Lean, proof/checker/replay/experiment/finalizer, mathematical coefficient/gap/recurrence computation, project edit, proposer contact or successor inspection. The parent-reported stopped controller is left untouched. Its later operational stop is not inferred to be the cause of this historical timeout.

**Historical outcome: timeout, returncode0, elapsed1883.721794128418seconds, report null.** There is no controller final.json, structured final-response event or turn.completed. A successful local finalizer and indexed draft report exist before the deadline, but neither upgrades the timeout. The retained mathematical inventory is five final-source compiled/replayed/printed modules with20 theorem closures and five definitions. One additional one-theorem diagnostic source timed out and remains unbuilt, unprinted and unreplayed.

## Final-source inventory

| Module | Theorems | Definitions | Successful final build identifier | Replay identifier |
|---|---:|---:|---|---|
|MarkovBinomialMixedMF1E|4|1|1792144443970798000|1792144548356348000|
|MarkovBinomialInteriorMF1E|6|0|1792144565443491000|1792144623247177000|
|MarkovSourceInteriorMF1E|6|2|1792145073782425000|1792145118092463000|
|MarkovResidualMF1E|1|2|1792145183299857000|1792145229786568000|
|MarkovInteriorWitnessMF1E|3|0|1792145289793468000|1792145327561205000|

These five final sources exhaust the explicit validated inventory. Independent enumeration finds six declaration-bearing new mathematical sources: the five above plus MarkovSmoothProbeMF1E. Ten final Lean files comprise those six, three Audits and the driver. There is no compiled-only mathematical module, pending final-source build for an accepted module, snapshot-only invocation or unaccounted mathematical source. The empty finalizer excluded map applies to its explicit five-target list; the separate diagnostic_sources field names the sixth source.

| Module | Final source SHA-256 | Retained object SHA-256 |
|---|---|---|
|MarkovBinomialInteriorMF1E|`f3e71c88e67273d249557ba9206743db5fbba6767e2c965c047738472a8c0eb1`|`6d8bc3efe911efbe039e065a5f4fb2b040068529e7e1c5ef3524b2ac863638e3`|
|MarkovBinomialMixedMF1E|`c8a693ab8be5276cbbdf91637637ecb8977ef131179d1e1c5a848a2c22940988`|`33cacf71c048ab31c033c72c4493ee74b89783be54cab8b81dea75a7d1b0d3c1`|
|MarkovInteriorWitnessMF1E|`8c2864c5d9dd04930912c7c33d9d7a0254ba284f9bab55490051935b15c6a4c2`|`319c285451b56f8c31c9a155a4c86737c869ac94fe4eddffe60937797a5529ee`|
|MarkovResidualMF1E|`43dedcda4d64d3304005f3311c4830399cb6604e975c0a114c0583b09013761c`|`91397b897b865cb48da34e4552b5400204b045ef3ff2340e64d0863c2d7b1480`|
|MarkovSourceInteriorMF1E|`c6a7f454c50431e217bc5104b7ff9cc02e9cfdc1539bd92fd5385c8370394d0e`|`8487ea55fe0548eeb7da32d6853ddcb295f9acd0fc28ba640cb69ecec52bf545`|

The source hashes in final validation, successful compiler receipts and immutable snapshots match the final archived sources and exact current counterparts. Eight retained .olean objects (five mathematics, three Audits) match the index/controller/archive/current associations. Source-bound receipt/object preservation is retained build evidence, not a freshly reconstructed compilation. Every final selected module has a matching successful build before replay; every Audit import uses the latest matching successful version before that Audit, equal to final bytes.

Five successful singleton replay invocations select5,6,8,3,3 explicit declarations:25 total, comprising20 theorems and five definitions. Three successful Audit builds print10+6+4 disjoint theorem names, exactly20 unique closures, all with `{propext, Classical.choice, Quot.sound}`. Exact Audit snapshots, source-hashed axiom JSON, compiler stdout, requested names and final validation references agree. Definitions are selected for replay and are not included in the theorem-print count.

## Diagnostic and version history

`MarkovSmoothProbeMF1E.lean` has source SHA-256 `d77428ee22fef0d9d67e4212bdfa506752ced316ef795690682d2b91508ccd4a` and one theorem, smooth_probeMF1E. Its sole build1792145108034089000 times out after50.353632seconds under a50second limit on those same final bytes. No retained object, successful compiler result, replay target or axiom print exists. Its name is distinct from the accepted coeff_le_smoothedMF1E helper. The mathematical companion finds the same helper body after name/whitespace normalization; that comparison does not confer compilation/replay status on this diagnostic source. It is outside all successful replay bases and accepted import closure.

There are19 numeric compiler receipts and19 immutable snapshots. Nine succeed: five final mathematics builds, three Audit builds, and one earlier superseded successful BinomialMixed build. The remaining ten are eight returncode1 errors and two wall timeouts. All snapshots match their receipt source maps; all receipts bind to saved command summaries. No failed version is accepted merely because its theorem names agree.

| Unsuccessful build identifier | Module | Outcome | Same final source? |
|---|---|---|---|
|1792143990522071000|MarkovBinomialMixedMF1E|returncode 1|no|
|1792144108776451000|MarkovBinomialMixedMF1E|returncode 1|no|
|1792144314381214000|MarkovBinomialInteriorMF1E|returncode 1|no|
|1792144505189130000|MarkovBinomialInteriorMF1E|returncode 1|no|
|1792144622418670000|MarkovSourceInteriorMF1E|returncode 1|no|
|1792144776204948000|MarkovSourceInteriorMF1E|returncode 1|no|
|1792144905488591000|MarkovSourceInteriorMF1E|wall timeout|no|
|1792145108034089000|MarkovSmoothProbeMF1E|wall timeout|yes|
|1792145118116188000|MarkovResidualMF1E|returncode 1|no|
|1792145229788159000|MarkovInteriorWitnessMF1E|returncode 1|no|

The early BinomialMixed errors include parser/notation collisions around <=m or <=s, unidentified truncated names and the choose_step cast. Its first failed statement uses real subtraction on the choose-step RHS; the corrected statement keeps natural truncated subtraction inside the coercion. This is not safely summarized as only proof-body repair. BinomialInterior failures involve token parsing, cast simplification and the exponent argument to Nat.pow_le_pow_left. SourceInterior errors concern the antidiagonal namespace, cast/argument types and explicit raw-coefficient unfolding. The residual error concerns reduction of let-bound labels before introducing hypotheses; the witness error is a redundant tactic after an already closed goal.

The earlier successful Mixed snapshot1792144204354398000 has SHA-256 `f6ab9ecd2d19f8f80e47d75babc2c18709b4eeb90aa95317ba30d2a4042cae77` and the same four theorem names/one definition as final. Its whole-source difference from final is whitespace-only, but that textual fact alone is not a parser-equivalence proof. The final source is separately compiled at1792144443970798000. The first Mixed replay selects the final c8a693… hash; no replay selects the superseded successful hash, and no old object is substituted for the final binding.

SourceInterior timeout1792144905488591000 lasts120.167067seconds under a120second wall limit. Its hash02e132… differs from successful final c6a7f4… solely by maxHeartbeats4000000→600000; static diff verifies that exact option change. Thus the timeout is not byte-identical final-source evidence, and the change is an operational heartbeat setting rather than a mathematical proof correction. The later source succeeds. Only the standalone diagnostic timeout uses unchanged final bytes and remains unresolved. All five replay receipts succeed; there are no failed or late unrecorded replay attempts in the retained inventory.

## Replay method and dependency scope

The new ReplayIsolatedMF1E driver has SHA-256 `6e3ef3db74ddf2c127a2403a45604f89b2a4208de2bcb7ba058eaf571ec1940c`. The driver and ordinary validation/Audit wrappers are retagged135 versions; the180second Audit limit is retained. Compiler -j1 and replay -s131072 with joined task/result propagation are unchanged. The same ordinary Lean.Replay body constructs an inherited environment excluding directly selected module imports, checks selected explicit namespace/suffix names are absent and safe/total, then replays target constants. All25 explicit accepted names satisfy the guard, are unique and target-free; no local cycle or resolution failure is found.

Generated/private/inherited constants outside the explicit suffix guard retain ordinary replay handling. Source-graph/name checks are not independent decoding of all loaded object parts or an authentication of runtime binaries. The wrapper hashes sources before invocation and checker source after return; the Audit wrapper records imported source hashes after its subprocess. These hashes are not invocation-start binary attestations. External Lean/Mathlib objects are not rebuilt here, and reused inherited bodies are not replayed merely because they are in a base.

| Replay target | Explicit declarations | Transitive local base | Current136 modules in base | Direct imports, including Init |
|---|---:|---:|---:|---:|
|BinomialMixed|5|0|0|2|
|BinomialInterior|6|1|1|2|
|SourceInterior|8|72|2|3|
|Residual|3|2404|3|3|
|InteriorWitness|3|2405|4|3|

The accepted source closure is2406=5new+2401inherited. ResidualMF1E alone reaches2405=4new+2401old and contains17 new theorem statements/five definitions, excluding InteriorWitness. InteriorWitness imports the residual and reaches all five accepted modules:20 theorems/five definitions. Adding the independent diagnostic gives2407 local mathematical sources; adding three Audit sources gives2410 total local graph nodes. Successful replay-base union is2405=4new+2401inherited. Each new dependency has a successful build and selected replay before its dependent replay begins. These counts exclude external Lean/Mathlib and the operational driver.

All2401 exact named inherited source/object pairs match current bytes, controller before136 pins and sealed135 associations. The independent pass ran10:22:57.058024–10:23:23.123391UTC. Origins are2397 sealed135 inherited pairs plus four accepted135 modules (HighCone2Gap, HighGap, HighAll and Residual). No fallback mapping is used. The paired identities preserve the earlier build association; they do not reconstruct every source or add inherited-body replay. Prior byte-identical COW storage maintenance changes no mathematical status.

All212 old121 compiled-but-unreplayed modules, including195 certificate dependencies, occur in the Residual and InteriorWitness bases. None is selected or rebuilt here; no worker121 backlog recovery is established. The earlier three bases contain none of that backlog. All23 worker134 certificate/coverage modules recovered during135 are now inherited with that135 provenance; their23 retained recovery receipts are preserved unchanged among the prior135 artifacts. They are not replayed again in136. Old134 Cone2Gap remains the separately replaced, historically compiled-only old name. The six new declaration-bearing sources add only one unbuilt diagnostic, not a new compiled-but-unreplayed theorem backlog.

## Archive, preservation and experiment bindings

All88 controller-listed artifact bytes match archive and exact current counterparts. The86-entry index matches all of its controller/archive/current hashes; manifest.json and last-verification.json are the two controller artifacts intentionally outside the index. Composition: eight .olean,40 JSON,29 Lean (ten final sources plus19 snapshots), six Python and five Markdown files. No unrecorded archive artifact is found.

Initial evidence/before.json contains5987 paths. Excluding this round's setup and checkpoint leaves5985 unchanged prior inputs, including147 pyc files. Setup is unchanged; the own checkpoint changed and is correctly excluded. Controller before136 and the evidence preservation inventory cover different sets: pins agree where both include a path. The three predecessor indexes preserve527=180worker133+246worker134+101worker135 artifacts. Independent checks cover all533 corresponding predecessor controller artifacts, including their own manifests/verifiers:182+248+103. Those bytes match prior archives, exact current counterparts and before136 pins. Six inherited administrative bindings also agree. Reconciliation embeds exact predecessor receipts, event hashes/counts and last six events; worker133/134 remain timeout/nullreport, worker135 completed.

The historical late failed134 Audit `evidence/markov-81f80b2d/build-1792141544717794000.json`, SHA-256 `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, is again pinned in controller before136 but absent from evidence/before.json's5985-prior preservation set and the136 index. Its separately retained134 late bundle still matches. No failure is backdated into a historical successful print or replay, and no extra copy is needed for this already preserved old evidence.

The two experiment events print exact summaries of their saved JSON rather than complete JSON. Event52 matches kernel-probe unshifted term records, test/failure fields and each translated negative-term list; it omits full translated term tables and the status field. Event104 matches interior-experiments after removing each case's examples; example coefficient/gap values remain in the result file only. Static comparison of those projections succeeds without regenerating any values.

The finalizer creates experiment-bindings.json after execution, hashing both new scripts and both result files. All four hashes match archived/current bytes. It does not bind invocation-start Python/executable/environment or all transitive loaded inputs. The inherited scan.py hash `72b5422d0c77a5d9ac6582adbc24500fbcfc40680f66b7baacb466e53619e40a` matches controller before136/current, but is absent from the evidence prior inventory, current artifact index and the two-script/two-result binder. It is retained provenance of an exact named helper, not a runtime import reconstruction.

The mathematical supplements cross-bind all six source/declaration inventories, the accepted20/5 versus diagnostic1 partition,13 named older source hashes (all in the accepted closure) and all saved experimental record hashes. Their finite recounts are179 source comparisons with a68688 dense-triangle counter,350 large-case domain triples split29/87/11/24/26/83/90,330 generic seed slots and2069 generic comparison positions, and768 kernel-test domain positions. Those are metadata/index checks. No source coefficient, polynomial comparison, sign, gap or expansion is recomputed; saved181 non-LC seeds and130 zero triples remain coefficient-dependent observations. The parent mathematical audit handles the exact source predicates and unproved residual.

## Finalizer and historical cutoff

The explicit five-target finalizer requires a matching successful source compiler receipt, replay receipt and theorem-name axiom JSON for each listed module, then asserts no exclusions. It separately lists the diagnostic source and removes135's inherited-recovery loop. Independent enumeration establishes the full5+1 partition; fixed-list success alone would not discover omitted files. The actual accepted checker/name/output bindings are verified independently here: the finalizer does not itself require the expected checker hash, re-evaluate axiom sets or bind axiom JSON to compiler stdout, authenticate binaries, or freshly derive source/object relations.

It writes validation.json before preservation assertions; that file alone would not demonstrate completed finalization. Here event219 starts and220 completes the sole finalizer with exit0, reporting5 modules,20 closures,10 unsuccessful compiler receipts,5985 prior inputs,527 indexed predecessor artifacts and86 newly indexed artifacts. It checks root and canonical contract hashes, records STOP absence as an observation, writes the experimental binder and draft report, writes/verifies the index, then writes last-verification. The last verifier checks index bytes and echoes earlier root/canonical computations; it does not independently rerun every preceding predicate. Its reported STOP observation belongs to that historical execution and is not a statement about the later stopped controller.

| UTC2026-10-16 milestone | Time |
|---|---|
|Controller start|09:40:25.263452|
|BinomialMixed replay finish estimate|09:56:12.813647|
|BinomialInterior replay finish estimate|09:58:27.271978|
|First Audit finish estimate|10:04:57.573912|
|SourceInterior replay finish estimate|10:05:55.281736|
|Second Audit finish estimate|10:06:58.674186|
|Residual replay finish estimate|10:07:37.567634|
|InteriorWitness replay finish estimate|10:09:18.502758|
|Last Audit finish estimate|10:09:22.349140|
|Validation write|10:09:55.716691|
|Final-check write|10:10:01.871886|
|Experimental binder write|10:10:01.873018|
|Draft report write|10:10:01.873234|
|Manifest write|10:10:02.081267|
|Last-verification write|10:10:02.087073|
|Final event-log mtime|10:10:02.103882|
|Activity heartbeat|10:10:24.623812|
|Nominal deadline|10:10:25.263452|
|Controller host finish|10:11:48.985246|

Receipt finish estimates add recorded duration to pre-invocation filename stamps; file times are exact current metadata observations, not independent process-exit attestations. Archive-copy mtimes occur later and are not original write times. The last selected replay finishes an estimated66.760694seconds before deadline, the last Audit62.914312seconds before, and last-verification23.176379seconds before. Controller host finish is83.721794seconds after deadline and106.898173seconds after the last verifier. Retained elapsed and subtraction of saved start/finish both give1883.721794128418seconds.

All220 saved events and104 started items are accounted for with completed counterparts, including the finalizer. The event-log696344bytes plus empty stderr equal the activity counter exactly; the heartbeat follows the log mtime by22.519930seconds and precedes deadline by0.639640seconds. This rules out a stale-byte deficit in that counter, not a lack of later transport delay or a complete independent process census. The last prose is an interim progress message at216, and the log ends with finalizer completion at220; it has no final structured response and no turn.completed. Indexed report.json is a machine-authored draft artifact, not controller final.json or a delivered final report. **The historical timeout and null report stand.**

Root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical sorted compact ASCII contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Manifest SHA-256 `9ff162646f790d57933d972cfa6f6b79d9e06912d7111332660b2c4fa2e6c8eb`; last-verification `09197153ac5a042c674e92b02cfe99a102879db6f3781ff26a141bb665aab00d`; draft report `86cb9799898705634faf14ae52cc308e3e82218e68678a9fa58fdec89306c4ce`. These hashes and local verification do not resolve/admit the protected root.

## Final static stability

Final byte stability checked9437 recorded inputs from2026-10-16T10:26:53.377715+00:00 through2026-10-16T10:27:29.546078+00:00, with zero changed or missing inputs. The exact-request136 current/archive check at2026-10-16T10:27:29.558210+00:00 found no extra or missing file. No new late136 receipt required separate preservation; no unaccounted post-finalization file was observed. This is scoped to completed136 and exact named prior counterparts, with no successor inspection or controller mutation.

Machine-readable full receipt/snapshot/object/source hashes,20 exact print names, rejected version details, inherited mappings, old late-failure membership, experiment projections and timeline are in markov_worker_000136_validation_evidence.json. The replay-method note/evidence supplies guard/import/binary details. Mathematical and finite-domain supports remain separate. All are static audits of retained records; no missing check was completed by executing project code.
