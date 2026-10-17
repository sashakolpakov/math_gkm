"""Seal the final review package after completed neutral validation."""
import ast
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import shutil
import tarfile

ROOT = Path.cwd()
OUT = ROOT/'evidence/neutral-validation'
def read(path):
    return json.loads(path.read_text())
def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()
def save(path, data):
    with path.open('x') as handle:
        handle.write(json.dumps(data, indent=2)+'\n')

summary = read(OUT/'ACCEPTANCE_VALIDATION_SUMMARY.json')
assert summary['distinct_passing_tests'] == 49 and not summary['missing_passing_tests']
assert (summary['passing_test_executions'], summary['failed_test_executions']) == (50, 1)
assert not any(summary['source_mismatches_reported'].values())
packaging = read(OUT/'acceptance-packaging.json')
assert packaging['returncode'] == 0 and not packaging['source_mismatches_after']
install = read(OUT/'acceptance-install-manifest.json')
sources = {r['path']: r['sha256'] for r in install['source_files']}
assert all(sha(ROOT/n) == h for n,h in sources.items())
pre3 = read(OUT/'acceptance-pre-003/SOURCE_MANIFEST.json')['files_sha256']
assert all(sources[n] == h for n,h in pre3.items())
pre2 = read(OUT/'acceptance-pre-002/SOURCE_MANIFEST.json')['files_sha256']
assert [n for n,h in pre2.items() if sha(ROOT/n) != h] == ['machinery/study_manifest.py']
assert not (ROOT/'.bootstrap/study-authorization.json').exists()

# Compare an actual previous snapshot, never current bytes against themselves.
prior = read(OUT/'pre-007/SOURCE_MANIFEST.json')['files_sha256']
protected = [n for n in prior if n.startswith(('MathGKM/', 'contracts/'))]
protected += ['MISSION.md', 'docs/DESIGN.md', 'lean-toolchain', 'lakefile.toml', 'lake-manifest.json',
    '.bootstrap/base-permissions.json', 'machinery/study.py', 'machinery/study_common.py',
    'machinery/study_transfer.py', 'machinery/study_knowledge.py', 'machinery/proof_audit.py',
    'machinery/completion.py', 'machinery/study_completion.py', 'machinery/study_bridge.py',
    'machinery/study_policy.py', 'machinery/study_program.py', 'machinery/study_worker.py',
    'machinery/study_observer.py', 'machinery/gate.py', 'machinery/process.py', 'machinery/trust.py']
baseline = {n: {'reviewed_pre007': prior[n], 'current': sha(ROOT/n)} for n in protected}
assert all(v['reviewed_pre007'] == v['current'] for v in baseline.values())
old_logs = read(OUT/'round4-install-manifest.json')['validation_logs']
assert all(sha(ROOT/n) == h for n,h in old_logs.items())
save(OUT/'ACCEPTANCE_PROTECTED_BASELINE.json', {'protected': baseline,
    'historical_log_hashes_verified': old_logs, 'authorization_file_present': False})

archive_record = read(OUT/'ACCEPTANCE_RETAINED_ARTIFACT_MANIFEST.json')
archive = ROOT/archive_record['archive']
assert sha(archive) == archive_record['archive_sha256']
archived = {}
with tarfile.open(archive, 'r:gz') as tar:
    for member in tar:
        assert member.isfile()
        archived[member.name] = hashlib.sha256(tar.extractfile(member).read()).hexdigest()
assert archived == {n:r['sha256'] for n,r in archive_record['files'].items()}

text = '''# Acceptance completion report

**49 distinct supported neutral harness tests have passing evidence for the final
source, using affected reruns and the unchanged-path arguments below.** There
were 50 passing test executions and one retained initial fixture failure. No
test was skipped, weakened or silently removed. This is scoped harness acceptance,
not completion of the actual-host or certified whole-continuation requirements.

All 14 lifecycle tests and three Lean tests in test_study_v2 remain active under
load_tests. The support class no longer inherits test methods into the Lean class.
The full supported selection contains 49 unique IDs, with no duplicated expensive
tests from imported TestCase classes. docs/REGRESSION.md provides the five bounded
test commands, a fresh checkpoint command, fixture replacement map, historical
exclusions and exact distinction between deterministic roles, real Lean and live
transport. Actual test IDs and argv are in ACCEPTANCE_VALIDATION_SUMMARY.json.

## Results and preserved failure

The first lifecycle run completed 17 tests: 16 passed and the watchdog fixture
failed while waiting for a nonexistent round-0000 process. Both current arms
start with plan-0000; the sleeping proposer correctly timed out before authorizing
a researcher. The retained log and actual proposer receipt establish this fixture
error. No runtime gate was changed. The corrected test kills the real controller
during that first proposer, checks the inherited lock while the watchdog runs,
waits for its bounded receipt and lock release, then recovers without duplicate
calls, receipt mutation or charge. Its rerun passed. The review-interruption test
also passed with stronger assertions for exact frozen inputs, unchanged reviewer
receipt and exactly one selector call/meta-call/charge. Real STOP/resume and
duplicate-lock checks passed in the original current-source lifecycle run.

The Toy positive uses a frozen ToyContext independently of the adapter. Actual
Lean results preserve correctness versus use credit: a newly invented helper can
prove an independently meaningful target without frozen-helper credit; a target
absent from its original context cannot acquire meaning from adaptation. A missing
task.required_constants entry denies use credit but does not invalidate an otherwise
correct proof. A missing separately supplied required= constant fails actual premise
inspection. The exact-root negative uses an unrelated True theorem because the old
natural-identity theorem would prove this neutral root by definitional equality.
acceptance-toy-disposition.json binds all nine result artifacts. No mathematical
gate or Lean foundation changed.

The fresh connected run completed four rounds, reviews at rounds 2 and 4, and
28 deterministic role receipts. It retained real checked component/family reuse,
delayed reuse, original-context residual discharge, finite strategy comparison,
experimental program selection and reverse_agenda in the subsequent actual fixture
request. The root remains open and certified_switch is false. These are mechanism
results, not live scientific progress, causal indispensability or a switch theorem.
acceptance-connected-disposition.json binds the exact state/decision/request.

## Observer qualifications

Every available endpoint is validated/measured independently even when its immediate
predecessor is missing, including a final/terminal witness. Missing comparisons and
overhead deltas remain unknown, and no plot line bridges the gap. The new negative
test also proves that a missing predecessor cannot bypass terminal receipt checking.
Raw observations and all scheduled missing points remain retained. The 11-test
observer group passed, including source/receipt mutation, exact-budget real evaluation,
unused-route invariance, and the two new reporting cases.

A direct completed root proof is receipt/source-bound mathematical resolution,
but its encoding is unmeasured unless represented through a supported checked
reduction-ledger route. The direct proof bundle is not a per-witness encoding in
this observer. An unwitnessed/unknown encoding is not unresolved mathematics and
does not establish a lower bound. Supported route descriptions, explicit unknown
residual proof holes, cumulative storage and introduced overhead remain separate.
Minimum complexity, proof difficulty and unknown reference-panel encodings remain
unknown. No universal complexity estimator or reward was introduced. Actual
audit-invariance tests passed; audit outputs cannot guide research decisions.
Synthetic terminal receipts test serialization/binding only, not root admission.

## Source review and validation binding

The fixed mission/design/requirements, round-4 reports and independent reviews were
read before changes. acceptance-input preserves the starting source. Source diffs,
static dispositions and read-only pre-validation copies were saved before each
affected run. The supervisor's subsequently supplied LIVE_ACCEPTANCE_REVIEW.md is
an audit, not implementation, a proof recipe or authorization; it is retained.

- acceptance-pre-001: migrated suite, observer corrections and neutral storage
  collector. All five supported test groups ran on these frozen bytes.
- acceptance-pre-002: only two test method bodies and three reporting documents
  changed. Both changed methods were rerun. Static AST comparison proves all
  remaining test methods, support, imports and load_tests unchanged; every runtime
  and Lean source was byte-identical. The three reporting docs are not seed inputs
  or execution imports. This justifies retaining the other 47 passing tests without
  duplicating expensive Lean checks.
- acceptance-pre-003: only the packaging-only study_manifest generator changed.
  It now emits the complete bounded reproduction commands, includes all required
  checkpoint/review inputs and refuses to overwrite existing manifests. Its CLI,
  90 source pins, 49 distinct selected IDs and no-overwrite behavior were checked
  separately. This is not counted as additional unit tests. The generator is not
  imported by the tested controller/proof/observer paths. implementation() hashes
  it as inert source metadata; new studies bind those bytes with unchanged equality
  checks. No old study was resumed after the change.

Every completed group has zero post-run source mismatches. The final package matches
pre-003 for every included file. ACCEPTANCE_PROTECTED_BASELINE.json compares actual
pre-007 pins with current protected source and checks all prior validation log
hashes. Fixed mission/design, contracts, Lean foundations, compiler pins, permission
input and mathematical admission/completion/transfer gates are unchanged. Earlier
round-4 successes remain 27 passing executions / 24 distinct tests on their own
pins; earlier failures and interruptions remain failures and interruptions. Initial
Agoh/Markov campaigns were not rerun or resumed.

## Exact completed commands

Each unittest group was launched through machinery/neutral_validate.py with a
720-second bound, unique log label and its named checkpoint. The table gives the
underlying exact command; group JSON records also preserve elapsed time and hashes.
Durations overlap because independent groups ran concurrently; do not add them as
one wall-clock or research-cost measurement.

'''
for group in summary['groups']:
    text += f"- **{group['label']}**: {group['tests_run']} tests, exit {group['returncode']}, {group['elapsed_seconds']:.3f}s.\n"
    text += '  Command: `'+ ' '.join(group['command'])+'`.\n'
    text += f"  Source manifest SHA-256: `{group['manifest_sha256']}`. Log SHA-256: `{group['log_sha256']}`.\n"
text += '\nPackaging check: `/opt/homebrew/bin/python3 .scratch/acceptance_packaging_check.py`; exact subprocess argv and results in acceptance-packaging.json.\n'
text += '\n## Reproduction and preservation\n\n'
text += f"The installation manifest contains {len(sources)} current source/input pins, including required base permissions, fixed requirements and review inputs. It is a reviewable package, not an installation. Its SHA-256 is `{sha(OUT/'acceptance-install-manifest.json')}`.\n\n"
text += f"The new retained artifact manifest indexes {len(archive_record['files'])} files in {len(archive_record['directories'])} unique neutral directories. The archive `{archive.name}` has SHA-256 `{archive_record['archive_sha256']}`. Every archived file hash was checked against that manifest. Exact inputs, requests, receipts, extensionless history, source snapshots, failed attempts and compiler/inspection logs are retained; compiled caches are omitted and rebuildable. No earlier evidence was overwritten.\n\n"
text += '''ACCEPTANCE_FINAL_SOURCE_MANIFEST.json and its SHA-256 sidecar bind the final
source copies, packaging scripts, report, review records and validation artifacts.
Use the installed pinned Lean/Mathlib and Python paths in this existing host
environment; no download or dependency edits are needed. Fixture dependency-tree
identity is explicitly mocked; actual compiler/checker binary hashes are in real
check receipts. This is not a portable cold bootstrap or host deployment attestation.
The system python3 shim and initial shell here-document setup failed before any
test/source mutation; their disposition is retained in acceptance-review/REVIEW.md.

## Requirements still unavailable

docs/REQUIREMENT_MAP.md gives requirement → producer → artifact → consumer → evidence
and status. O1 live independent external Astra transport and T1 live independent
curation are unvalidated; broad action/campaign results remain historical. The full
interruption/deployment matrix and hostile-code containment are not established.

Actual Python/OS/external-role refinement, whole-incumbent versus install-and-continue
utility/cost proof (including future switches, common time/deadline transport,
migration and justified environment coupling), and independently guarded certified
installation are OPEN, genuinely unavailable requirements. Generic checked model
theorems and accurate gap documentation do not fulfill them. Local evidence is
preserved; Git, installation and publication remain supervisor-owned and unperformed.

No live model, Markov researcher/curator/canary, new conjecture campaign, old campaign
resume, authorization file, dependency/package edit, Git, publication, messaging or
background service was initiated. Bounded watchdog subprocesses were exercised only
for the explicitly authorized neutral recovery tests. A later fresh Markov run
requires the user's explicit approval after this harness report.
'''
with (OUT/'ACCEPTANCE_REPORT.md').open('x') as handle:
    handle.write(text)

for name in ('.scratch/acceptance_summarize.py', '.scratch/acceptance_packaging_check.py', '.scratch/acceptance_finalize.py'):
    sources[name] = sha(ROOT/name)
copies = OUT/'acceptance-final/sources'
copies.mkdir(parents=True, exist_ok=False)
for name, hashed in sorted(sources.items()):
    raw = (ROOT/name).read_bytes()
    assert hashlib.sha256(raw).hexdigest() == hashed
    if name.endswith('.py'):
        ast.parse(raw, filename=name)
    target = copies/name
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(raw)
    target.chmod(0o444)
evidence = {}
for path in OUT.rglob('*'):
    relative = path.relative_to(OUT)
    if not path.is_file() or relative.parts[0] == 'acceptance-final':
        continue
    if relative.parts[0].startswith(('acceptance-', 'ACCEPTANCE_')):
        evidence[str(path.relative_to(ROOT))] = sha(path)
final = {'phase': 'construction', 'created_utc': datetime.now(timezone.utc).isoformat(),
    'status': 'Final reviewed/validated experimental source package; no installation or live authorization',
    'files_sha256': sources, 'read_only_source_copies': str(copies.relative_to(ROOT)),
    'source_entries': len(sources), 'installation_source_entries': len(install['source_files']),
    'evidence_sha256': evidence, 'validation_summary': 'evidence/neutral-validation/ACCEPTANCE_VALIDATION_SUMMARY.json',
    'unchanged_path_dispositions': ['evidence/neutral-validation/acceptance-review-002/static-disposition.json',
                                  'evidence/neutral-validation/acceptance-review-003.md'],
    'self_hash_exclusion': 'This manifest and its sidecar are excluded from their own evidence map.',
    'historical_claims': 'Round-4 and initial campaigns retain their original scope/pins; not merged into current counts.'}
path = OUT/'ACCEPTANCE_FINAL_SOURCE_MANIFEST.json'
save(path, final)
path.chmod(0o444)
with (OUT/'ACCEPTANCE_FINAL_SOURCE_MANIFEST.sha256').open('x') as handle:
    handle.write(sha(path)+'  ACCEPTANCE_FINAL_SOURCE_MANIFEST.json\n')
print(json.dumps({'final_manifest_sha256': sha(path), 'source_entries': len(sources),
    'evidence_entries': len(evidence), 'old_logs_verified': len(old_logs),
    'archived_files_verified': len(archived), 'report': str((OUT/'ACCEPTANCE_REPORT.md').relative_to(ROOT))}))
