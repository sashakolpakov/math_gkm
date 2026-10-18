from pathlib import Path
import hashlib
import json
import re
import shlex

root = Path.cwd()
out = root/'evidence/neutral-validation/maintenance-sol-deployment-20261018'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
pretest = json.loads((out/'pretest-002/manifest.json').read_text())
assert all(sha(root/n) == h for n,h in pretest.items()), 'final source drift'
labels = ['focused-001', 'lean-controls-001', 'connected-001', 'focused-002', 'connected-002', 'deployment-002']
runs = []
retained = set()
scopes = {
    'focused-001': '10 passing neutral configuration/mock/fixture tests; pretest-001',
    'focused-002': '11 passing final neutral configuration/mock/fixture tests; pretest-002',
    'lean-controls-001': '4 passing targeted tests; real unwrapped neutral Lean and argv/recovery; static dispositions bind unchanged affected code',
    'connected-001': 'failed source-seal guard after builder edited controller while running; retained without repair',
    'connected-002': 'corrective fresh connected neutral fixture run; pretest-002; real unwrapped Lean, no OS deployment attestation',
    'deployment-002': 'actual real-wrapper startup diagnostic; failed closed in nested environment; not mathematical validation'}
for label in labels:
    record = json.loads((out/(label+'.json')).read_text())
    assert sha(root/record['log']) == record['log_sha256']
    log = (root/record['log']).read_text()
    match = re.search(r'Ran (\d+) tests? in ([\d.]+)s', log)
    record.update(label=label, scope=scopes[label], test_count=int(match[1]) if match else None)
    runs.append(record)
    retained.update(re.findall(r'RETAINED (\S+)', log))
artifacts = {}
for name in sorted(retained):
    directory = Path(name)
    assert directory.is_relative_to(root/'.scratch')
    artifacts[str(directory.relative_to(root))] = {
        str(p.relative_to(directory)): sha(p) for p in directory.rglob('*', recurse_symlinks=False)
        if p.is_file() and not p.is_symlink() and '__pycache__' not in p.parts}
validation = {'phase': 'construction', 'runs': runs,
    'environment': {'PATH': '/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin:/usr/sbin:/sbin',
        'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null'},
    'source_postcheck': 'All pretest-002 file hashes still match; installed-source manifest unchanged.',
    'retained_artifacts_manifest': 'RETAINED_ARTIFACTS.json',
    'deployment_valid': False,
    'host_remaining': ['Approved-host real-wrapper echo and version startup.',
        'Neutral wrapped fresh compilation, kernel replay and actual premise closure.',
        'Read/write containment, wrong-target and missing-use negative controls.',
        'Actual completion adapter exact-root check without correspondence approval.',
        'Independently review artifacts; host -6 cause remains unproved.'],
    'limitations': ['No hosted model calls or provider execution attestation.',
        'Fixture and unwrapped Lean results do not establish live deployment compatibility.',
        'Whole-continuation and host-refinement proof gaps remain open.']}
for name, value in [('RETAINED_ARTIFACTS.json', artifacts), ('VALIDATION.json', validation)]:
    with (out/name).open('x') as f: json.dump(value, f, indent=2); f.write('\n')
    (out/name).chmod(0o444)
lines = ['# Exact validation commands and results\n',
    'All commands used the explicit Homebrew/elan PATH and Git environment recorded in VALIDATION.json. No model calls.\n']
for r in runs:
    lines += ['\n## '+r['label']+'\n', r['scope']+'\n', '\n```sh\n'+shlex.join(r['argv'])+'\n```\n',
        '\nExit '+str(r['returncode'])+'; '+str(r['elapsed_seconds'])+' seconds; cap '+str(r['cap_seconds'])+' seconds; timeout='+str(r['timeout'])+'.\n',
        'Log: `'+r['log']+'`; SHA256 `'+r['log_sha256']+'`.\n']
lines += ['\nDeployment remains unvalidated. Approved-host command, at a new path:\n\n```sh\n',
    '/opt/homebrew/bin/python3 -m machinery.study_deployment --out .scratch/deployment-host-001 --seconds 120\n```\n',
    '\nUse studies/v2-study-sol.json only for a separately authorized fresh study after reviewed deployed validation. Preserve the panel/root/opportunity budgets and all interrupted/infrastructure-failed outcomes.\n']
(out/'RESULTS.md').write_text(''.join(lines))
(out/'RESULTS.md').chmod(0o444)
files = {str(p.relative_to(out)): sha(p) for p in out.rglob('*', recurse_symlinks=False) if p.is_file()}
with (out/'EVIDENCE_MANIFEST.json').open('x') as f: json.dump(files, f, indent=2); f.write('\n')
(out/'EVIDENCE_MANIFEST.json').chmod(0o444)
print('Source hashes unchanged. Evidence files:', len(files), 'retained directories:', len(retained))
print('Connected final returncode:', runs[4]['returncode'])
print('Installation manifest SHA256:', sha(out/'INSTALLATION_MANIFEST.json'))
print('Validation index SHA256:', sha(out/'VALIDATION.json'))
