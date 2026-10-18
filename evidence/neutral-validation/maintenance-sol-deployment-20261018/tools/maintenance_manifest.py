"""Finalize only this invocation's evidence; never traverse old evidence."""
from pathlib import Path
import ast
import difflib
import hashlib
import json
import shutil

root = Path.cwd()
out = root/'evidence/neutral-validation/maintenance-sol-deployment-20261018'
before = json.loads((out/'input/manifest.json').read_text())
pretest = json.loads((out/'pretest-002/manifest.json').read_text())
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
names = ['machinery/study.py', 'machinery/study_common.py', 'machinery/study_worker.py',
         'machinery/study_transfer.py', 'machinery/study_deployment.py',
         'tests/test_sol_deployment.py', 'studies/v2-study-sol.json',
         'studies/v2-study-astra.json', 'docs/DEPLOYMENT_PREFLIGHT.md']
final = out/'final'
final.mkdir(exist_ok=False)
entries = []
patches = []
for name in names:
    p = root/name
    dest = final/'sources'/name
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(p.read_bytes())
    dest.chmod(0o444)
    entries.append({'path': name, 'status': 'modified' if name in before else 'added',
        'input_sha256': before.get(name),
        'input_source': str(out.relative_to(root)/'input/sources'/name) if name in before else None,
        'origin': 'machine-authored maintenance invocation; new source' if name not in before else 'input checkpoint',
        'installation_source': str(dest.relative_to(root)), 'final_sha256': sha(dest)})
    old = (out/'input/sources'/name).read_text() if name in before else ''
    patches.extend(difflib.unified_diff(old.splitlines(True), p.read_text().splitlines(True),
        fromfile='input/'+name if name in before else '/dev/null', tofile='candidate/'+name))
    assert sha(p) == pretest[name], 'source changed after pretest-002: '+name
(final/'changes.diff').write_text(''.join(patches))
protected = {n: h for n,h in before.items() if n.startswith('MathGKM/') or n in
    ('MISSION.md', 'docs/DESIGN.md', 'docs/REQUIREMENT_MAP.md', 'docs/STUDY_V2.md',
     'lakefile.toml', 'lake-manifest.json', 'lean-toolchain', 'studies/v2-study.json')}
assert all(sha(root/n) == h for n,h in protected.items())
assert all(sha(root/n) == h for n,h in pretest.items())
for p in sorted(final.rglob('*'), reverse=True):
    if p.is_file(): p.chmod(0o444)
    elif p.is_dir(): p.chmod(0o555)
final.chmod(0o555)
manifest = {'schema': 'math-gkm.maintenance-installation.v1', 'phase': 'construction',
    'date': '2026-10-18', 'status': 'reviewable candidate; deployment blocked pending approved-host preflight',
    'entries': entries, 'protected_unchanged': protected,
    'final_checkpoint_sha256': sha(out/'pretest-002/manifest.json'),
    'patch_sha256': sha(final/'changes.diff'),
    'installation': ['Independently review exact source diff and host diagnostic.',
        'Verify each existing destination input SHA256 before applying changes; added paths must be absent.',
        'Copy only listed installation_source files to path, then verify every final_sha256.',
        'Preserve all prior evidence and frozen studies; never resume them under changed implementation.',
        'Run approved-host neutral preflight at a fresh path; retain and independently review all results.',
        'Only after deployed mathematical validation and existing authorization: fresh Sol config with unchanged panel/root/opportunity budgets.'],
    'no_live_activation': True, 'sandbox_profile_unchanged': True,
    'limitations': ['Supervisor host -6 cause unproved; nested sandbox_apply denied (71).',
        'No actual deployed positive validation or hosted model transport tested here.',
        'Host-refinement and whole-continuation proof gaps remain open.']}
path = out/'INSTALLATION_MANIFEST.json'
with path.open('x') as f: json.dump(manifest, f, indent=2); f.write('\n')
path.chmod(0o444)
print('Install sources', len(entries), 'manifest SHA256', sha(path))
