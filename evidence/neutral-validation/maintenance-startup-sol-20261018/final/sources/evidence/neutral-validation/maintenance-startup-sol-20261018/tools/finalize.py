"""Finalize this invocation only; preserve round7 manifests and evidence."""
from pathlib import Path
import difflib
import hashlib
import json
import re

root = Path.cwd()
out = root/'evidence/neutral-validation/maintenance-startup-sol-20261018'
prior = root/'evidence/neutral-validation/maintenance-sol-deployment-20261018'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
read = lambda p: json.loads(p.read_text())
before = read(out/'input/manifest.json')
validated = read(out/'pretest/manifest.json')
frozen = read(out/'final/manifest.json')
assert all(sha(root/n) == h for n, h in frozen.items()), 'frozen source drift'
tool_prefix = str(out.relative_to(root)/'tools')+'/'
assert all(frozen.get(n) == h for n, h in validated.items() if not n.startswith(tool_prefix))
assert all(n in validated or n.startswith(tool_prefix) for n in frozen)
old_install = read(prior/'INSTALLATION_MANIFEST.json')
old_input = read(prior/'input/manifest.json')
old_final = {e['path']: e['final_sha256'] for e in old_install['entries']}
names = set(old_final)
names.update(n for n, h in frozen.items() if before.get(n) != h)
names.update(str(p.relative_to(root)) for p in (out/'tools').glob('*.py'))
entries = []
patch = []
for name in sorted(names):
    current = sha(root/name)
    # Root production is the pre-round7 input. Keep that origin even for files
    # changed again this round; added round7 files stay added cumulatively.
    origin = old_input.get(name)
    if origin is None and name in before and name not in old_final and not name.startswith(str(out.relative_to(root))):
        origin = before[name]
    origin_path = (prior/'input/sources'/name if name in old_input else
                   out/'input/sources'/name if origin else None)
    entries.append({'path': name, 'status': 'modified' if origin else 'added',
        'root_production_sha256': origin,
        'root_production_source': str(origin_path.relative_to(root)) if origin_path else None,
        'round7_final_sha256': old_final.get(name),
        'this_round_input_sha256': before.get(name),
        'this_round_changed': before.get(name) != current,
        'origin': 'root production / round7 input checkpoint' if name in old_input else
                  'round7 new source' if name in old_final else
                  'this invocation input checkpoint' if origin else 'this invocation new evidence tooling',
        'installation_source': str((out/'final/sources'/name).relative_to(root)),
        'final_sha256': current})
    old = origin_path.read_text() if origin_path else ''
    patch.extend(difflib.unified_diff(old.splitlines(True), (root/name).read_text().splitlines(True),
        fromfile='root-production/'+name if origin else '/dev/null', tofile='candidate/'+name))
assert all((out/'final/sources'/e['path']).is_file() and
           sha(out/'final/sources'/e['path']) == e['final_sha256'] for e in entries)
protected = old_install['protected_unchanged']
assert all(sha(root/n) == h for n, h in protected.items())
(out/'cumulative-installation.diff').write_text(''.join(patch))
runs = []
retained = {}
for label in ('focused', 'connected', 'tooling', 'connected-core'):
    record = read(out/(label+'.json'))
    assert sha(root/record['log']) == record['log_sha256']
    assert record['source_postcheck']
    runs.append({'label': label, **record})
    log = (root/record['log']).read_text()
    for name in re.findall(r'RETAINED (\S+)', log):
        directory = Path(name)
        assert directory.is_relative_to(root/'.scratch')
        retained[str(directory.relative_to(root))] = {
            str(p.relative_to(directory)): sha(p) for p in directory.rglob('*', recurse_symlinks=False)
            if p.is_file() and not p.is_symlink() and '__pycache__' not in p.parts}
manifest = {'schema': 'math-gkm.cumulative-maintenance-installation.v2',
    'phase': 'construction', 'date': '2026-10-18',
    'baseline': 'root production, before round7; cumulative, not a reset',
    'prior_manifest': str((prior/'INSTALLATION_MANIFEST.json').relative_to(root)),
    'prior_manifest_sha256': sha(prior/'INSTALLATION_MANIFEST.json'),
    'entries': entries, 'protected_unchanged': protected,
    'pretest_manifest': str((out/'pretest/manifest.json').relative_to(root)),
    'pretest_manifest_sha256': sha(out/'pretest/manifest.json'),
    'final_manifest_sha256': sha(out/'final/manifest.json'),
    'runtime_tests_docs_unchanged_since_connected': True,
    'post_connected_evidence_tool_changes': [n for n,h in frozen.items() if validated.get(n) != h],
    'cumulative_diff_sha256': sha(out/'cumulative-installation.diff'),
    'installation': ['Check root_production_sha256 at each existing destination; added paths must be absent.',
        'Copy exactly the listed installation_source to path and verify final_sha256.',
        'Also retain/copy this evidence directory, including pretest manifest and immutable source checkpoints, at its relative path for host verification.',
        'Preserve round7 and earlier evidence; never resume sealed studies with modified implementation.',
        'Run both exact approved-host commands in docs/DEPLOYMENT_PREFLIGHT.md at unused paths; independently inspect the results.'],
    'deployment_status': 'PENDING approved-host real profile compilation/replay/inspection and Mathlib catalog smoke',
    'no_live_activation': True,
    'limitations': ['Experimental maintenance, no certified Goedel switch.',
        'Host refinement and concrete whole-continuation proof remain OPEN.',
        'No hosted model/curator/research child executed; no provider attestation.']}
for name, value in [('INSTALLATION_MANIFEST.json', manifest),
                     ('VALIDATION.json', {'phase': 'construction', 'runs': runs,
                         'deployment': 'PENDING approved-host execution',
                         'source_postcheck': True,
                         'connected_scope': '900-second full-method timeout preserved during extra final evaluation; all original connected-cycle postconditions separately executed, without replaying roles or altering retained state.',
                         'runtime_tests_docs_unchanged_since_connected': True}), ('RETAINED_ARTIFACTS.json', retained)]:
    with (out/name).open('x') as f:
        json.dump(value, f, indent=2)
        f.write('\n')
    (out/name).chmod(0o444)
print('Cumulative installable paths:', len(entries))
print('Installation manifest SHA256:', sha(out/'INSTALLATION_MANIFEST.json'))
print('Source hashes unchanged; runs:', [(r['label'], r['returncode'], r['elapsed_seconds']) for r in runs])
