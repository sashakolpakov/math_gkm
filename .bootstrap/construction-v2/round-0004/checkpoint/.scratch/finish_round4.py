"""Final source/evidence documentation; no research or mathematical execution."""
import hashlib
import json
from pathlib import Path
import shutil
import sys
sys.path.insert(0, str(Path.cwd()))
from machinery.study_manifest import generate

root = Path.cwd()
out = root/'evidence/neutral-validation'
def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()
def read(p):
    return json.loads(p.read_text())
def put(p, value):
    p.write_text(json.dumps(value, indent=2)+'\n')
summary = read(out/'ROUND4_VALIDATION_SUMMARY.json')
archive = read(out/'ROUND4_ARCHIVE.json')
assert summary['passing_executed_tests'] == 27
assert summary['distinct_passing_tests'] == 24
assert all(r['returncode'] == 0 and not r['source_mismatches_after'] for r in summary['groups'] if r['label'] != 'round4-006')
old = read(out/'pre-005/SOURCE_MANIFEST.json')['files_sha256']
tested = read(out/'pre-007/SOURCE_MANIFEST.json')['files_sha256']
assert all(sha(root/n) == h for n,h in tested.items()), 'unexpected change before documentation'

commands = '\n'.join(f"- `{r['label']}`: exit {r['returncode']}; {r['tests']} completed tests; {r['elapsed_seconds']:.3f}s; log SHA-256 `{r['log_sha256']}`.\n  Command: `"+' '.join(r['command'])+'`.' for r in summary['groups'])
report = f'''# Round 4 construction report

**27 passing test executions, 24 distinct tests. The full four-round connected
regression passed.** All completed groups have zero post-run source mismatches.
These are neutral deterministic role fixtures with real Lean checks where stated;
they are not a live Astra campaign, new mathematical discovery, or a certified
whole-continuation switch. No Markov work or live authorization occurred.

The corrected episode path protects research, required paired evaluation and
review/selection before its first proposer, including role and meta-call counters.
The shipped neutral profile completed all four rounds. A separate exact-envelope
test completed real paired evaluation and review with exactly **2200 reserved
seconds, 8 calls and 4 meta calls**. These seconds are upper caps, not equal actual
costs. Its extra final evaluation honestly reported no remaining allowance.
Freeze rejects impossible initial episode commitments before creating role jobs;
later episodes are separately admitted before their first role. Optional trials
cannot spend reserved reviewer opportunities. Stop and operational failure can
still prevent completion: prepaid opportunity is not guaranteed research success.

Requests disclose validation_seconds and the aggregate knowledge_checks_per_round
limit across mathematical_claims, reductions, attachments, representations and
fiber_gluings. Repeated already-accepted identities count before the later skip;
an over-limit report is rejected before any checks. No scalar reward was added.

## Exact source and reviewed history

- Round-3 reviewed pre-005 manifest: `7e9ab7911641fd1c05b0266ef81a525bbde12ee77e6bde94830555a8227737b7`.
- First corrected tests, pre-006: `095c496b7aceb381b771455092ab21df3899e44ff5992ebd8901fa6dabc72481`.
- Final executable/test source, pre-007: `241d7be7e0ae955bded56b16145737024c191500c386571162ec3773aba20b8d`.

Each pre-* manifest retains read-only source copies. Static reviews/dispositions
are in round4-review and round4-review-007. Final documentation and packaging are
subsequent changes listed by ROUND4_FINAL_SOURCE_MANIFEST.json; executable and
test files remain exactly pre-007. The final install manifest uses honest current
pins. Its permissions input is included. ROUND4_PROTECTED_BASELINE.json separately
compares actual pre-005 hashes to current hashes, rather than hashing current files
twice and claiming historical preservation.

The round-3 final runtime review superseded its earlier validation-time findings:
the generic default budget, symmetric trial pools, distinct validation charging,
terminal producer, accepted-source catalog and real foundation/identity tests had
already been repaired. Those are not reported as newly fixed here. The remaining
R3-C1/C2/C3, R3-R1/R2 and K-R3-1/2 corrections are now covered by current source and
the tests below. The pre-005 successful compilation, replay and actual premise
inspection records remain retained. No Lean source or proof-admission weakening
was used to obtain these results.

The historical round-3 connected-005 run returned 130 and remains interrupted.
Its separate endpoint evidence did not make the full regression pass. The fresh
connected-006 run passed in 413.196s, with retained delayed component/family reuse,
residual discharge, valid paired policy trial, independent fixture review and
selection, experimental program installation, and the next actual researcher
request executing that program. The invalid draft remains retained but excluded
from the accepted catalog.

## Commands, counts and logs

{commands}

The first round4-006 run was deliberately interrupted after discovery included an
imported TestCase class and began unrelated tests. It is not counted as passing;
its log and static rerun disposition are retained. The selected class then passed
without a source change. The final test module no longer imports a TestCase class
into discovery. No failing mathematical expectation was relaxed.

The bounded runner command is `python3 machinery/neutral_validate.py CHECKPOINT
LABEL TEST_NAMES...`; underlying exact argv, pre/post byte checks and every log
hash are recorded in the group JSON files. Use new labels/directories when
reproducing to preserve old logs. No old campaign should be resumed.

The final observer command was `/opt/homebrew/bin/python3 .scratch/audit_round4.py
round4-observer-final`. Its receipt records 13 assert evaluations and 3 SVG XML
parses, the script hash and exact pre-007 source pin. It only observes this
invocation's finished neutral data and checks that research JSON files remain
unchanged. The earlier observer receipt's manual count of 14 was bookkeeping,
corrected in the separately retained final receipt; its raw artifacts remain.

## Audit results and plots

The observer verifies the original state/seal, seed manifest, every fixed seed
input, root and panel. Direct conditional comparisons also check feed/snapshot
bindings, immutable seed theory and accepted source hashes. Changed reference
inputs invalidate the audit; they cannot silently redefine the fixed comparison.

The final plots and raw data are in **round4-observer-final-plots/**:

- `conditional-descriptions.svg`: each fixed checked witness's description under
  its bound accepted theory; explicit unknown proof holes are never zero.
- `overhead.svg`: full introduced dictionary, adapter and connecting-proof encoding
  costs (including JSON containers), charged separately and in each standalone
  per-witness comparison. Do not sum repeated shared charges across witnesses.
- `costs.svg`: actual worker wall, overlapping controller wall and reserved caps
  in separate series; these are not added or converted to token/currency costs.
- `raw.json`, `paired.json`, `conditional-paired.json`: all 12 scheduled points,
  including missing observations, separately labelled cumulative portfolio storage,
  conditional portfolio descriptions and per-witness comparisons.

The observed neutral route description **rises by 38 bytes and then stays flat**.
There is no observed sawtooth or inferred proof-difficulty decrease. Source
overhead remains charged. Program/policy/component and measured changes are marked.
Missing points break trajectories. New or changed witnesses are not compared as
the same route. Non-root panel proofs and minimum proof complexity remain unknown.
The unused-route test increases the portfolio encoding without changing the
existing witness's description. No observer chooses the current research route.

The sealed schedule includes terminal. Both finished-run terminal points here
are absent because fixtures cannot resolve the root; those missing points are
retained. Separate explicitly synthetic receipt tests check terminal export
interruption/recovery, conflicts, exact finished receipt/bundle/contract binding,
and rejection of changed completion sources/correspondence. Those serialization
tests are not a proof of mathematical root closure. Ordinary exact-root completion
still requires its unchanged real verifier and independent correspondence audit.

Actual two-run fixture/Lean audit invariance passed despite corrupt audit exports
and a changed audit-side plan. Measurements and derived proxies have no role-request,
admission, allocation, selection or root-closure consumer.

## Reproduction and preservation

ROUND4_RETAINED_ARTIFACT_MANIFEST.json indexes {archive['files']} retained files,
including extensionless history objects, requests, receipts, source snapshots and
compiler/inspection logs. `round4-neutral-artifacts.tar.gz` contains those inputs
without compiled caches; SHA-256 `{archive['sha256']}`. The source copies and older
evidence remain separately retained. The archive does not include dependency
caches; use the declared pinned toolchain/dependency sources. This is the existing
host-specific environment, not a portable cold bootstrap or full dependency-tree
attestation. Fixture freeze explicitly mocks dependency-tree identity; mathematical
checks invoke the actual pinned Lean/compiler/checker and retain binary hashes.

Required base and invocation permissions, toolchain pins, source/install manifests,
immutable test snapshots, logs, plots and scripts are listed in the final manifest.
The supervisor owns subsequent independent review, installation/versioning and
publication. No Git, downloads, package changes, dependency writes, nested model
calls, external messaging or background services were used.

## Exact remaining obligations

1. **Experimental harness:** tested scope above. The full interruption/host-deployment
   matrix, live provider behavior, independent live holdout curation and portable
   containment are not established by neutral fixtures.
2. **Checked mathematics:** preserve actual premise closure and exact proposition/context
   identities; any live root closure still needs independent English/source
   correspondence. No new conjecture campaign was attempted.
3. **Verified abstract model:** generic continuation/gluing theorems and inhabited
   modelBinding have actual compilation/replay evidence. Their stated hypotheses
   and restricted structures remain their scope.
4. **Actual-host refinement OPEN:** prove Python/OS/external-role transitions,
   effects, timing, recovery and migration realize the declared semantics.
5. **Certified whole-continuation switch OPEN:** supply a concrete comparison of
   install-and-continue against the entire incumbent including future discoveries
   and switches, with common-time costs, deadline/state transport and justified
   environment coupling/quantification, followed by independent guarded installation.
   The model theorem and bounded experimental trial do not discharge this.
6. **Markov authorization pending:** no live researcher, curator, canary, study,
   old campaign resume or authorization file. Fresh Markov work requires the user's
   subsequent explicit OK after review of this report.
'''
(out/'ROUND4_REPORT.md').write_text(report)
shutil.copyfile(root/'.scratch/round4-requirements.md', root/'docs/REQUIREMENT_MAP.md')
(root/'docs/HARNESS_CHECKPOINT.md').write_text('''# Current construction checkpoint

Round 4: 27 passing test executions across 24 distinct tests. Full connected
four-round neutral regression passed; exact-budget real evaluation/review passed.
Actual context, recovery and audit-invariance tests passed. See
evidence/neutral-validation/ROUND4_REPORT.md for commands, counts, exact source
hashes, retained interruptions, plots and precise limitations.

Final executable/test bytes: pre-007/SOURCE_MANIFEST.json,
241d7be7e0ae955bded56b16145737024c191500c386571162ec3773aba20b8d.
The expensive connected/context groups ran at pre-006; only observer/terminal
validation and tests changed afterward and received affected pre-007 tests and
current-source observer replay. Final documentation is pinned separately.

Experimental harness, checked mathematical results and verified abstract models
remain distinct. Actual-host refinement and a concrete certified whole-continuation
switch remain OPEN. No live Astra campaign or Markov authorization occurred.
The user must explicitly authorize fresh Markov work after the harness report.
''')
(root/'docs/STUDY_V2.md').write_text('''# Experimental study harness

Current construction evidence: evidence/neutral-validation/ROUND4_REPORT.md.
Requirement/producer/artifact/consumer/status mapping: docs/REQUIREMENT_MAP.md.
Final current source/install manifests and cache-independent retained evidence
are in evidence/neutral-validation with ROUND4 or round4 prefixes. Earlier reports
and failed/interrupted runs remain historical evidence with their own source pins.

Only fresh neutral deterministic fixtures were executed. The shipped fixture
profile is tested with the explicit neutral contract from the test harness.
No live model campaign, canary, curation, study activation or old run resume is
authorized. User OK after the report remains necessary for fresh Markov work.

The controller prepays each committed episode through evaluation/review with
seconds and role/meta-call pools. All five knowledge proposal kinds share the
disclosed aggregate cap, including repeats; validation timeouts are disclosed.
Comparisons have equal opportunities and upper caps, not equal actual costs.
Protocol events have a separate bounded allowance; overlapping wall totals are
never summed. Optional later episodes/trials require fresh resource admission.

The unchanged mathematical gate requires actual premise closure, fresh replay,
exact original-context propositions and independent root correspondence. Generic
model theorems do not establish Python/OS/Astra refinement or certified self-change.
Both concrete obligations remain explicit, open and fail-closed.

The one-way observer binds the original root, seed, panel and scheduled snapshots.
Terminal points require exact finished receipt/bundle/source binding; absent
terminal remains missing. Per-witness descriptions, conditional portfolios and
cumulative storage are separate. New dictionary/adapter/connecting overhead is
charged; unknown proof holes stay unknown. Plots show measured descriptions/costs
and change markers. The neutral trace rises and then stays flat; no sawtooth or
proof-difficulty inference is required. Audit values never guide research.
''')

protected_names = ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','lean-toolchain','lake-manifest.json','lakefile.toml']
protected = {n: {'baseline_sha256': old[n], 'current_sha256': sha(root/n),
    'unchanged': old[n] == sha(root/n)} for n in protected_names}
assert all(v['unchanged'] for v in protected.values())
put(out/'ROUND4_PROTECTED_BASELINE.json', {'baseline_manifest': 'pre-005/SOURCE_MANIFEST.json',
    'baseline_manifest_sha256': sha(out/'pre-005/SOURCE_MANIFEST.json'), 'files': protected})
inputs = ['.bootstrap/base-permissions.json', '.bootstrap/external_launcher.py', '.bootstrap/setup.json']
inputs += ['.bootstrap/round-0004/'+n for n in ('permissions.json','command.json','environment-overrides.json','prompt.txt','schema.json')]
put(out/'ROUND4_INPUT_MANIFEST.json', {'files_sha256': {n: sha(root/n) for n in inputs},
    'scope': 'Required base permissions plus actual construction invocation inputs; no live authorization.'})
generate(out/'round4-install-manifest.json')

paths = set(tested) | set(inputs)
paths |= {'.scratch/package_round4.py','.scratch/finish_round4.py','.scratch/audit_round4.py','.scratch/round4-requirements.md'}
for folder in ('round4-review','round4-review-007','round4-observer-final-plots','round4-connected-audit'):
    paths.update(str(p.relative_to(root)) for p in (out/folder).rglob('*') if p.is_file())
paths.update(str(p.relative_to(root)) for p in out.iterdir() if p.is_file() and
    p.name not in ('ROUND4_FINAL_SOURCE_MANIFEST.json','ROUND4_FINAL_SOURCE_MANIFEST.sha256','ROUND4_PROGRESS.json'))
paths.update(str(out.relative_to(root)/n) for n in ('pre-006/SOURCE_MANIFEST.json','pre-007/SOURCE_MANIFEST.json'))
post = [n for n,h in tested.items() if sha(root/n) != h]
assert all(n.startswith('docs/') for n in post), post
final = {'phase': 'construction', 'files_sha256': {n: sha(root/n) for n in sorted(paths)},
    'tested_source_manifest': 'pre-007/SOURCE_MANIFEST.json', 'post_test_changes': post,
    'status': summary, 'protected_baseline': 'ROUND4_PROTECTED_BASELINE.json',
    'open': ['actual-host refinement','concrete whole-continuation certified switch','live campaign validation/authorization'],
    'scope': 'Complete current source/install and retained evidence pins; code/tests unchanged after pre-007 affected validation. Final documentation and packaging separately pinned.'}
put(out/'ROUND4_FINAL_SOURCE_MANIFEST.json', final)
hashed = sha(out/'ROUND4_FINAL_SOURCE_MANIFEST.json')
(out/'ROUND4_FINAL_SOURCE_MANIFEST.sha256').write_text(hashed+'  ROUND4_FINAL_SOURCE_MANIFEST.json\n')
put(out/'ROUND4_PROGRESS.json', {'status': 'construction complete for requested concrete corrections; no active test or live campaign',
    'final_manifest_sha256': hashed, 'report': 'ROUND4_REPORT.md', 'next': 'Supervisor review, then subsequent explicit user OK before fresh Markov work.'})
print(json.dumps({'final_manifest_sha256': hashed,'files':len(paths),'post_test_changes':post,'tests':summary['passing_executed_tests'],'distinct':summary['distinct_passing_tests']}))
