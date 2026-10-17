# Round 3 final runtime disposition

2026-10-17T22:48:35.381679+00:00

Independent read-only static source and retained-result review. No candidate imports, execution, tests, proofs, model calls, source edits or builder contact. Only this review is written under /private/tmp.

No fresh Markov research, curation, canary or activation before explicit user OK.

Concrete runtime/configuration/audit-accuracy corrections remain; no candidate execution or independent test run was performed. Documented experimental limitations are not treated as repair blockers.

## Necessary corrections / accurate contracts

- **R3-C1 (P2: horizon-contract correctness)**: Committed episode does not reserve its evaluation and review. The first episode reservation covers only research calls, up to k validations and one completion validation per round. Required episode evaluation and two review/selector calls are funded only after the promised research horizon finishes. A cap sufficient for research alone starts the episode, then blocks evaluation/review. Call/meta-call checks likewise cover only research at the horizon start. Symmetric policy-trial branch pools are repaired; this remaining defect concerns the main episode-to-review edge. Either reserve the complete required continuation through evaluation/review, or accurately describe the promised protected horizon as research-only with downstream review potentially unavailable. No matched-cost redesign is requested. Source: `machinery/study.py:417-428`, `machinery/study.py:524-550`, `machinery/study_transfer.py:289-296`

- **R3-C2 (P1)**: Shipped fixture and canary protocols cannot start under the new envelope. Both inherit k=6 and validation_seconds=120. The fixture first episode requires 2*(2*5+7*120)=1700 reserved seconds against arm_seconds=1200. The canary requires 2*(2*120+7*120)=2160 against 1800. validate_protocol accepts both; research_round fails before its first role call. DEFAULT arm_seconds was corrected to 12000, so the earlier default-dictionary failure is superseded. The named profiles remain broken. Make shipped neutral profile(s) viable and statically reject impossible commitments at freeze. The live canary remains explicitly unauthorized; no execution or activation is proposed. Source: `machinery/study.py:22-30`, `machinery/study.py:41-64`, `machinery/study.py:417-426`, `studies/v2-fixture.json:3-13`, `studies/v2-canary.json:3-13`

- **R3-R1 (P2)**: Terminal completion export is not included or bound in the audit result. The producer now creates/reconciles terminal snapshots and outbox, fixing the missing producer. The report only checks terminal export conflicts; raw measurement and conditional pairs still iterate the initial+rounds schedule, excluding terminal. The terminal observer record also omits the checked resolution/result-bundle identity. Thus a separate exact-root completion between scheduled rounds is absent from the measured audit sequence and is not tied to its finished completion receipt there. Represent a terminal point in the consumer schedule, preserve absent-terminal semantics, and bind the terminal export to its exact finished resolution receipt/bundle. No complexity-based control feedback should be introduced. Source: `machinery/study_completion.py:67-73`, `machinery/study_observer.py:9-22`, `machinery/study.py:149-155`, `machinery/study_burden.py:94-121`

- **R3-C3 (P2)**: New enforced knowledge limit is not disclosed in role request limits. ingest rejects the entire report before checking anything when the aggregate across proposal kinds exceeds knowledge_checks_per_round. The request limits projection lists only rounds, episode_rounds, invention_rounds and call_seconds. It does not tell ordinary proposer/researcher roles the newly enforced aggregate cap or validation timeout. The precheck also counts repeated already-accepted identities before the later skip, so its exact semantics need to be stated. Expose the enforced limit and its counting semantics in the same prospective request/schema the role consumes. No change to proof claims or research priorities is involved. Source: `machinery/study_policy.py:27-39`, `machinery/study_knowledge.py:90-104`

- **R3-R2 (P2: manifest claim; permissions coverage repaired by supplement)**: Install/static manifests overstate historical protection and omit a required permissions input. study_manifest sets before={} and constructs each protected before/after SHA by hashing the same current file twice, then announces protected inputs unchanged. This is only a current identity check, not comparison to an approved baseline. Its source enumeration and neutral_checkpoint omit .bootstrap/base-permissions.json, although runtime implementation() pins it and worker permissions reads it. The separate runtime seal provides some later protection; the pre-test/source-install manifest alone is incomplete. AFTER THE INITIAL HANDOFF: SUPPLEMENTAL_INPUT_MANIFEST.json now pins base-permissions and other required inputs; those hashes independently match current files, and each fixture seal also binds the permissions input. Thus the evidence-package omission is covered without requiring a rerun solely to relocate the pin. The generic generator still does not make a meaningful historical before/after comparison. Keep the supplemental input manifest in preservation/reproduction scope; change generic historical unchanged wording or compare an actual approved baseline when that generator is used. This is no longer a missing-input blocker for the present package. Source: `machinery/study_manifest.py:9-22`, `machinery/study_manifest.py:48`, `machinery/neutral_checkpoint.py:12-16`, `machinery/study_common.py:151-153`, `machinery/study_worker.py:22-24`

## Not additional blockers

- Fixed research-round counts and equal upper caps are a valid labeled bounded comparison, not claimed matched actual-cost efficiency.
- Protocol control overhead has separate per-event bounds and observed totals; arm_seconds is not a whole-process wall deadline.
- The program DSL remains deliberately restricted and actual host refinement/certified switching are open.
- Host-specific paths and no portable cold bootstrap are explicitly disclosed; no new portability implementation is demanded in this review.

## Validation evidence

46 completed passing tests across two tested source snapshots. The separate connected endpoint reports11 passing assertions with four unchanged support hashes; the full four-round connected regression was interrupted(return130), not passed. Earlier failures/interruption logs remain retained. These are reviewed builder records, not reviewer executions.

Final source manifest `bcc6defb56dd3d21031eb8dae8c16ab95bf8be701b4123a51b8dc03781d68b02`: all 119 current hashes match.
Pre005 `7e9ab7911641fd1c05b0266ef81a525bbde12ee77e6bde94830555a8227737b7`: only post-test differences are ['docs/HARNESS_CHECKPOINT.md', 'docs/REQUIREMENT_MAP.md', 'docs/STUDY_V2.md'].
Supplement `65b2a3e19b5844a70ef78682d1c136f4cd28aedbcdf087e6fd1fbcd88fd09229`: all 6 input hashes match.

The earlier detailed report retains full repaired-edge explanations and source-line references. This final JSON pins current source, documents and all cited validation records.
