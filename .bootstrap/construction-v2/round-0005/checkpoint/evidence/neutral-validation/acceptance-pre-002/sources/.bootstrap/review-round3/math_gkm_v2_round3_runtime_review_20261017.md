# Round 3 independent runtime review

2026-10-17T22:40:37.409859+00:00

Independent read-only static source and retained-result review. No candidate imports, execution, tests, proofs, model calls, source edits or builder contact. Only this review is written under /private/tmp.

No fresh Markov research, curation, canary or activation before explicit user OK.

This is an exact-source handoff during ongoing builder validation, not a final candidate approval.

## R3-C1 — P1: Committed episode does not reserve its evaluation and review

The first episode reservation covers only research calls, up to k validations and one completion validation per round. Required episode evaluation and two review/selector calls are funded only after the promised research horizon finishes. A cap sufficient for research alone starts the episode, then blocks evaluation/review. Call/meta-call checks likewise cover only research at the horizon start. Symmetric policy-trial branch pools are repaired; this remaining defect concerns the main episode-to-review edge.

Before accepting a delayed episode, admit the complete required horizon through its review/evaluation (including call counters), or explicitly expose a different horizon contract. This is a comparison/accounting requirement, not a mathematical strategy.

Source: `machinery/study.py:417-428`, `machinery/study.py:524-550`, `machinery/study_transfer.py:289-296`

## R3-C2 — P1: Shipped fixture and canary protocols cannot start under the new envelope

Both inherit k=6 and validation_seconds=120. The fixture first episode requires 2*(2*5+7*120)=1700 reserved seconds against arm_seconds=1200. The canary requires 2*(2*120+7*120)=2160 against 1800. validate_protocol accepts both; research_round fails before its first role call. DEFAULT arm_seconds was corrected to 12000, so the earlier default-dictionary failure is superseded. The named profiles remain broken.

Make shipped neutral profile(s) viable and statically reject impossible commitments at freeze. The live canary remains explicitly unauthorized; no execution or activation is proposed.

Source: `machinery/study.py:22-30`, `machinery/study.py:41-64`, `machinery/study.py:417-426`, `studies/v2-fixture.json:3-13`, `studies/v2-canary.json:3-13`

## R3-R1 — P2: Terminal completion export is not included or bound in the audit result

The producer now creates/reconciles terminal snapshots and outbox, fixing the missing producer. The report only checks terminal export conflicts; raw measurement and conditional pairs still iterate the initial+rounds schedule, excluding terminal. The terminal observer record also omits the checked resolution/result-bundle identity. Thus a separate exact-root completion between scheduled rounds is absent from the measured audit sequence and is not tied to its finished completion receipt there.

Represent a terminal point in the consumer schedule, preserve absent-terminal semantics, and bind the terminal export to its exact finished resolution receipt/bundle. No complexity-based control feedback should be introduced.

Source: `machinery/study_completion.py:67-73`, `machinery/study_observer.py:9-22`, `machinery/study.py:149-155`, `machinery/study_burden.py:94-121`

## R3-C3 — P2: New enforced knowledge limit is not disclosed in role request limits

ingest rejects the entire report before checking anything when the aggregate across proposal kinds exceeds knowledge_checks_per_round. The request limits projection lists only rounds, episode_rounds, invention_rounds and call_seconds. It does not tell ordinary proposer/researcher roles the newly enforced aggregate cap or validation timeout. The precheck also counts repeated already-accepted identities before the later skip, so its exact semantics need to be stated.

Expose the enforced limit and its counting semantics in the same prospective request/schema the role consumes. No change to proof claims or research priorities is involved.

Source: `machinery/study_policy.py:27-39`, `machinery/study_knowledge.py:90-104`

## R3-R2 — P2: Install/static manifests overstate historical protection and omit a required permissions input

study_manifest sets before={} and constructs each protected before/after SHA by hashing the same current file twice, then announces protected inputs unchanged. This is only a current identity check, not comparison to an approved baseline. Its source enumeration and neutral_checkpoint omit .bootstrap/base-permissions.json, although runtime implementation() pins it and worker permissions reads it. The separate runtime seal provides some later protection; the pre-test/source-install manifest alone is incomplete.

Use an approved baseline for historical unchanged assertions or label current pins honestly, and include the required permissions input in the review/reproduction manifest.

Source: `machinery/study_manifest.py:9-22`, `machinery/study_manifest.py:48`, `machinery/neutral_checkpoint.py:12-16`, `machinery/study_common.py:151-153`, `machinery/study_worker.py:22-24`

## Repaired or explicitly qualified

- Distinct validation invocations now reserve by resolved destination path, separating branch/round executions while retaining same-operation recovery.
- Finished completion receipt binding is checked and reused before reserving fresh budget; terminal reconciliation is also invoked on resolved run recovery.
- Policy trial prepays separate incumbent/candidate/evaluation/review pools and debits actual branch operations within their own pool.
- Snapshot publication uses a staging directory followed by rename; research-owned observer outbox prevents reading corrupt audit outputs as control input.
- Docs explicitly distinguish fixed-round equal upper caps from matched actual-cost efficiency. Protocol transitions have separate 30-second event bounds and observed totals, so they are no longer silently claimed to fit inside arm_seconds.
- Docs accurately limit executable changes to a bounded request-transform DSL, conditional formal models, and unproved actual host refinement; no certified switch or fresh Markov activation is claimed.

## Retained validation scope

Only regressions-002 in this listed record set returned zero (26 tests per retained log). Other listed suites failed or were interrupted, tied to their own source snapshots. These are builder records, not independent executions. Further tests may be running; this report does not assert final suite success.

## Exact source pins

| Path | Bytes | SHA-256 |
|---|---:|---|
| `machinery/study.py` | 46986 | `79e3fbc85c0757f8e6bdc0689a80e97db455aaed8288939b15d1c41ab36074be` |
| `machinery/study_policy.py` | 15940 | `92101c48d318723a97f1a6a42fadfdec964d7a1e1d929c1e664f7aa7b207df75` |
| `machinery/study_knowledge.py` | 15360 | `ac04d864110a0331d4346972d9bf4e9c5858da9779be1d7c0850ddeecedf5209` |
| `machinery/study_transfer.py` | 27501 | `279f299e1d72d4cabd463c7253f9984353c8bd04a265b96c16e5365ed061085d` |
| `machinery/study_completion.py` | 3855 | `4894c36c39aa06999eca011721777066660d1c3901e929d80f2137e7d759c7bd` |
| `machinery/study_observer.py` | 1779 | `c05a528c8b4e2beb718c02d2d7a471a3c14096262b06357e266a60e6583f174d` |
| `machinery/study_burden.py` | 14854 | `e0530b64947bcfbd8176a762df3836f9711777c815be9cf97db324cdaf3b8378` |
| `machinery/study_bridge.py` | 4243 | `13d543cc4fb414d9e8a360f381d71eff8782fcc01a37c74923176e8b17ca862b` |
| `machinery/study_manifest.py` | 3094 | `76ecef6cf0aef7f31dc730438b7873f2acfc7b335aeb3e96d7a7400eebb8236d` |
| `machinery/neutral_checkpoint.py` | 1965 | `6c4fec5e79ab095d64c44bb7834bf10c8dfa7049f81939a244c9e1d706e2460b` |
| `machinery/study_common.py` | 7583 | `23cfdf11a71698d6a05bff45e53ff4201bdb5b99aa0642759cab6e85d4177b95` |
| `machinery/study_worker.py` | 8417 | `cea861dbbb4285fe71f91eeeb6cf68eac2176428ac6cc36efd49b4ca5b39993f` |
| `studies/v2-fixture.json` | 284 | `bfe9647f4e51ab441a051e9cbcd7997eb0740a02b1a0516309cf52c55e62f145` |
| `studies/v2-canary.json` | 281 | `db115a9cc3c2cdc6085e7b1c83d8eaaad9fced0f6d67220178936c76da0d4546` |
| `docs/HARNESS_CHECKPOINT.md` | 2583 | `dcc2a0d1065b0ac7fb59f5ead427dae7ff3e4a7c9e5d8379309efe71fcfac7e0` |
| `docs/REQUIREMENT_MAP.md` | 5163 | `d256e3bfb576c9192ed4a1b4287f093028672df7dbd49839f12cc65b7b9b329e` |
| `.bootstrap/base-permissions.json` | 1357 | `5263cab043f26560022bffc9ff3636b91a005afc59608c2d945176979a6c673c` |
