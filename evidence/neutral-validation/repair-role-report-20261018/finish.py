"""Seal repair evidence after bounded runners finish. Never launches tests or roles."""
import hashlib
import json
import os
from pathlib import Path
import re
import shlex
from datetime import datetime, timezone

root = Path.cwd()
base = root / 'evidence/neutral-validation/repair-role-report-20261018'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def emit(path, data):
    with path.open('x') as handle:
        handle.write(json.dumps(data, indent=2) + '\n')

pre = json.loads((base / 'pretest/SOURCE_MANIFEST.json').read_text())
old = json.loads((base / 'input/SOURCE_MANIFEST.json').read_text())
assert all(sha(root / p) == h for p, h in pre['files_sha256'].items()), 'source changed after tests'
groups = {}
for name in ('focused', 'lifecycle', 'connected'):
    record = json.loads((base / (name + '.json')).read_text())
    log = (base / (name + '.log')).read_text()
    assert sha(base / (name + '.log')) == record['log_sha256']
    assert not record['source_mismatches_after']
    assert record['manifest_sha256'] == sha(base / 'pretest/SOURCE_MANIFEST.json')
    count = re.search(r'Ran (\d+) tests? in', log)
    groups[name] = {**record, 'tests_completed': int(count[1]) if count else None,
        'reported_ok': bool(re.search(r'^OK$', log, re.M)),
        'test_ids': re.findall(r'^test_\S+ \(([^)]+)\)', log, re.M)}
emit(base / 'VALIDATION_SUMMARY.json', groups)

# Only newly created neutral fixture directories from these runs, never old studies.
start = min(g['started'] for g in groups.values())
prefixes = ('role-report-repair-', 'revision-tests-', 'revision-lean-', 'study-v2-neutral-', 'protocol-')
roots = sorted(p for p in (root / '.scratch').iterdir()
               if p.name.startswith(prefixes) and not p.is_symlink() and p.is_dir() and p.stat().st_mtime >= start)
artifacts, links = {}, {}
for folder in roots:
    for directory, dirs, files in os.walk(folder, followlinks=False):
        directory = Path(directory)
        for name in list(dirs):
            p = directory / name
            if p.is_symlink():
                links[str(p.relative_to(root))] = os.readlink(p)
                dirs.remove(name)
        for name in files:
            p = directory / name
            if p.is_symlink():
                links[str(p.relative_to(root))] = os.readlink(p)
            else:
                artifacts[str(p.relative_to(root))] = sha(p)
emit(base / 'RETAINED_ARTIFACTS.json', {
    'roots': [str(p.relative_to(root)) for p in roots], 'files_sha256': artifacts,
    'symlinks_not_followed': links,
    'scope': 'Fresh neutral fixture and protocol directories created since the first repair test; dependencies not traversed.'})

install = []
for name in ('machinery/study_policy.py', 'tests/test_role_report_contract.py'):
    install.append({'path': name, 'before_sha256': old['files_sha256'].get(name),
        'after_sha256': sha(root / name),
        'reviewed_input': str((base / 'pretest/sources' / name).relative_to(root)),
        'purpose': 'runtime prompt repair' if name.startswith('machinery/') else 'focused neutral regression'})
passed = all(g['returncode'] == 0 and g['reported_ok'] for g in groups.values())
rows = '\n'.join(f"| {name} | {g['tests_completed']} | {g['returncode']} | {g['elapsed_seconds']:.3f} |"
                 for name, g in groups.items())
environment = ('env PATH=/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin '
               'GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL=/dev/null PYTHONDONTWRITEBYTECODE=1 '
               'TMPDIR="$PWD/.scratch" ')
commands = '\n'.join(environment + '/opt/homebrew/bin/python3 machinery/neutral_validate.py '
    'repair-role-report-20261018/pretest repair-role-report-20261018/' + name + ' ' +
    shlex.join(g['command'][4:]) for name, g in groups.items())
installs = '\n'.join(f"- `{i['path']}` — SHA-256 `{i['after_sha256']}`; previous: `{i['before_sha256'] or 'new file'}`."
                     for i in install)
report = f'''# Role/report interface repair — construction

Result: {'all selected checks passed' if passed else 'validation incomplete or failed; inspect raw logs'}.
The only changed production function is machinery/study_policy.py::prompt.
An honest plan describes intended work in agenda, summary and hypothesis
claims/outcomes with use_links empty. Each role now gets its own payload schema;
the proposer is no longer given an execution-only binding requirement. Both
proposer and researcher are told that artifact and consumer must already be
files, evidence needs real hashes, and accepted reported links remain unverified.
The prompt also distinguishes checked controller records from report link input
and lists the already supported fiber_gluings researcher submission field.

No validator relaxation, fake endpoint, report correction/retry, state migration,
receipt rewrite, budget change or mathematical change was made. Static AST
comparison confirms all study_policy code outside prompt is unchanged. Every
other pre-existing checkpoint source is byte-identical to this repair's input.
The added test module checks the actual existing gates and prompt/role boundary.

## Reviewed source and installation inputs

{installs}

These are the complete installable source changes. Use the exact immutable
pretest/sources copies and compare destination predecessor bytes before applying.
New file means absent in the repair input; supervisor must check the installation
destination. SOURCE_CHANGES.diff is the reviewable patch; STATIC_REVIEW.json lists
unchanged inputs. Install neither generated fixtures nor dependency symlinks.
The evidence directory is a separately named repair record, not a replacement
for any earlier acceptance manifest/report. Its files and the copied input,
pretest and final source snapshots are enumerated in FINAL_MANIFEST.json.

Pinned inputs: leanprover/lean4:v4.32.2; Mathlib revision
905b95818eb32af7874a58b427f50c1711a5e96c. Exact lake-manifest.json,
lakefile.toml, lean-toolchain and base-permissions hashes appear in the source
manifests. Dependencies remained read-only; no update/download or Git operation.
Existing real Lean/checker paths are pinned by machinery/trust.py. Fixture
dependency-tree identity is mocked; this is not a deployment attestation.

## Pre-test audit and source checkpoints

AFFECTED_PATH_AUDIT.md was saved before tests. It traces request/prompt, worker
envelope, commit/record, main and paired-branch execution, checked ingestion,
review/selection, cached receipts and protected budget pools. It explains the
design choice and selected positive/negative/connected regressions. All four
required documents were read before edits. No live study, mathematical plan,
old research contents or external project was inspected. No model or curator
was invoked; no campaign authorization artifact was created.

- Input manifest: input/SOURCE_MANIFEST.json, SHA-256 `{sha(base / 'input/SOURCE_MANIFEST.json')}`.
- Pre-test manifest: pretest/SOURCE_MANIFEST.json, SHA-256 `{sha(base / 'pretest/SOURCE_MANIFEST.json')}`.
- Final source manifest: final/SOURCE_MANIFEST.json (same tested source bytes).

capture.py input, capture.py pretest and capture.py final were each run using
/opt/homebrew/bin/python3 with GIT_CONFIG_NOSYSTEM=1,
GIT_CONFIG_GLOBAL=/dev/null and PYTHONDONTWRITEBYTECODE=1. The static comparison
was run as /opt/homebrew/bin/python3
evidence/neutral-validation/repair-role-report-20261018/review_sources.py.

## Exact validation commands and results

Run from the candidate workspace root:

```sh
{commands}
```

| Group | Completed tests | Exit | Wall seconds |
| --- | ---: | ---: | ---: |
{rows}

focused includes seven new report-contract tests and six existing PureMechanisms
tests. lifecycle is the supported 14 lifecycle plus three real Lean tests.
connected is the existing full neutral cycle with actual Lean compilation,
kernel replay and premise checking, delayed reuse, matched branches,
experimental selection and consumption by the next actual fixture researcher.
The lifecycle group includes a fresh paired neutral study. Both longer groups
ran concurrently in separate directories. All selected tests use neutral
fixtures; deterministic roles do not measure opaque model compliance. The full
49-test supported suite was not rerun; validation targets the affected paths.
The unchanged runner bounds each group to 720 seconds and records pre/post source
comparisons; no source mismatch was reported. No test gate or Lean check was
replaced for this repair. Existing tests explicitly mock dependency-tree identity.

Raw focused.log, lifecycle.log, connected.log and their JSON receipts are retained.
VALIDATION_SUMMARY.json records exact test IDs, argv, exit status, elapsed times
and hashes. RETAINED_ARTIFACTS.json binds fresh fixture requests, receipts,
Lean checks and protocol invocations; dependency symlinks are listed, not followed.
DIAGNOSTICS.md preserves the blocked zsh heredoc and missing exploratory filename
errors. These commands failed before doing validation; the saved static script
subsequently completed. Expected negative protocol outcomes are passes only
because the tests assert rejection. No failed command was relabeled successful.

## Supported recovery and remaining gaps

The supervisor must review/install the exact source, then start a separately
named fresh paired study with its appropriate independently bound setup. No live
study was started here. The old plan-0000 completed receipts are immutable:
--resume reuses them and repeats semantic rejection. Installing this prompt does
not repair cached payloads or change old seals. Do not delete/rewrite receipts,
fabricate endpoints, transplant old plans or replay unaccounted calls. The new
cached-invalid-plan test confirms unchanged receipts and no duplicate calls or
charges across state reloads. No bounded correction feature is implemented.

Existing uncertain-effect recovery remains fail-closed; the lifecycle tests
cover specific stop/watchdog/reviewer transitions, not all host interruptions.
A future proposer can still violate the explicit contract and be rejected.
Protected evaluation/review budgets and original diagnostics remain intact.
Opaque live compliance is untested. Python/OS/Astra host refinement, the concrete
whole-incumbent continuation utility/cost proof, time/response coupling and
independently certified installation remain open. This experimental repair is
not a certified Goedel self-switch and establishes no new mathematics.
'''
with (base / 'REPORT.md').open('x') as handle:
    handle.write(report)

evidence = {str(p.relative_to(root)): sha(p) for p in sorted(base.rglob('*')) if p.is_file()}
emit(base / 'FINAL_MANIFEST.json', {'phase': 'construction', 'time': datetime.now(timezone.utc).isoformat(),
    'installation_inputs': install, 'selected_validation_passed': passed,
    'tested_source_manifest_sha256': sha(base / 'pretest/SOURCE_MANIFEST.json'),
    'final_source_manifest_sha256': sha(base / 'final/SOURCE_MANIFEST.json'),
    'evidence_files_sha256': evidence,
    'retained_fixture_inventory': str((base / 'RETAINED_ARTIFACTS.json').relative_to(root)),
    'limitations': ['No live model validation', 'Cached invalid plans require fresh study',
                    'Host refinement uncertified', 'Concrete whole-continuation proof open']})
(base / 'FINAL_MANIFEST.sha256').write_text(sha(base / 'FINAL_MANIFEST.json') + '  FINAL_MANIFEST.json\n')
print(json.dumps({'passed': passed, 'groups': {k: v['tests_completed'] for k, v in groups.items()},
                  'retained_files': len(artifacts), 'manifest': str((base / 'FINAL_MANIFEST.json').relative_to(root))}))
