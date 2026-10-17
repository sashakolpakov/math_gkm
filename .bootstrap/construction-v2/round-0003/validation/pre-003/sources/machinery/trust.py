"""Proposed boundary awaiting supervisor freezing and independent validation.
Never derives authority from a writable manifest. No activation flag exists.
"""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TOOLCHAIN = Path('/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2')
CORE = TOOLCHAIN / 'lib/lean'
LEAN = TOOLCHAIN / 'bin/lean'
CHECKER = TOOLCHAIN / 'bin/leanchecker'


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1048576), b''):
            h.update(block)
    return h.hexdigest()


def environment(imports=()):
    return {'PATH': '/opt/homebrew/bin:/usr/bin:/bin',
            'LEAN_PATH': ':'.join(map(str, imports)),
            'LEAN_SYSROOT': str(TOOLCHAIN),
            'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null',
            'TMPDIR': str(ROOT / '.scratch'), 'LANG': 'en_US.UTF-8'}


def snapshot():
    files = [LEAN, CHECKER]
    files += sorted(p for p in CORE.rglob('*') if p.is_file()
                    and (p.suffix in {'.olean', '.ilean', '.so', '.dylib'}
                         or '.olean.' in p.name))
    for rel in ['machinery/gate.py', 'machinery/trust.py', 'machinery/process.py',
                'MISSION.md', 'docs/DESIGN.md', 'lean-toolchain']:
        files.append(ROOT / rel)
    return {str(p): sha(p) for p in files}


def request_freeze():
    result = {'status': 'REQUEST_INDEPENDENT_VALIDATION_AND_FREEZE',
      'authority': False, 'file_hashes': snapshot(),
      'required_supervisor_actions': [
        'Audit exact AST meanings, generated validator, subprocess and import resolution.',
        'Freeze validator, launcher, binaries, dynamic libraries, core import tree and contract outside candidate write authority.',
        'Separate candidate and validator OS authority with a protected response channel.',
        'Independently rerun positive, shadow-import, imported-invalid and axiom controls.',
        'Only then expose a supervisor-owned admission service; candidate JSON cannot enable it.'],
      'project_dependencies': 'Rejected by restricted AST gate. General source checks remain experimental.',
      'allowed_axioms': [], 'meaning': 'Pinned core True, False, Nat, Eq, And, Not; closed AST only',
      'remaining': ['No frozen validator in this workspace', 'Hash snapshot does not prevent concurrent mutation',
                    'System loader/OS and Python runtime need independent trust accounting']}
    (ROOT / 'requests/freeze-boundary.json').write_text(json.dumps(result, indent=2)+'\n')
    return result

if __name__ == '__main__':
    r = request_freeze()
    print(json.dumps({'status': r['status'], 'files': len(r['file_hashes'])}))
