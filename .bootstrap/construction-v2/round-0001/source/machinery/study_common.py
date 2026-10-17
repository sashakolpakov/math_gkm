"""Codex/Astra construction v2. Local experimental study primitives, no LLM calls."""
import contextlib
import fcntl
import hashlib
import json
import os
from pathlib import Path
import shutil
import time

ROOT = Path(__file__).resolve().parents[1]
PYTHON = '/opt/homebrew/bin/python3'
ROOT_SHA = '8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
SEED = ('MathGKM/Markov.lean', 'MathGKM/Protocol.lean', 'MISSION.md',
        'docs/DESIGN.md', 'lakefile.toml', 'lake-manifest.json', 'lean-toolchain')

class Invalid(ValueError):
    pass

def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':'), ensure_ascii=False)

def digest(value):
    return hashlib.sha256(canonical(value).encode()).hexdigest()

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def read(path):
    return json.loads(Path(path).read_text())

def write(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(path.name + '.next')
    with tmp.open('w') as f:
        f.write(canonical(value) + '\n')
        f.flush()
        os.fsync(f.fileno())
    os.replace(tmp, path)
    fd = os.open(path.parent, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)

def save_state(path, state):
    write(path, {'state': state, 'sha256': digest(state)})

def load_state(path):
    envelope = read(path)
    if digest(envelope['state']) != envelope['sha256']:
        raise Invalid('state integrity mismatch')
    return envelope['state']

@contextlib.contextmanager
def lock(path):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open('a') as f:
        try:
            fcntl.flock(f, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            raise Invalid('study/controller/watchdog already running')
        yield f.fileno()

def inside(root, name):
    p = Path(name)
    if p.is_absolute() or '..' in p.parts or any(x.startswith('.') for x in p.parts):
        raise Invalid('unsafe artifact path')
    result = root/p
    if result.is_symlink() or not result.resolve().is_relative_to(root.resolve()):
        raise Invalid('artifact escaped workspace')
    return result

def inventory(root):
    """Research sources only. Never traverse links, Git, caches or provider state."""
    result = {}
    for folder in ('MathGKM', 'research', 'evidence'):
        base = root/folder
        if not base.exists():
            continue
        for directory, dirs, files in os.walk(base, followlinks=False):
            if Path(directory).is_symlink():
                raise Invalid('symlink research directory')
            for d in dirs:
                if (Path(directory)/d).is_symlink():
                    raise Invalid('symlink research directory')
            dirs[:] = [d for d in dirs if not d.startswith('.') and d != '__pycache__']
            for name in files:
                p = Path(directory)/name
                if p.is_symlink():
                    raise Invalid('symlink research artifact')
                if p.suffix not in ('.olean', '.ilean', '.pyc'):
                    result[str(p.relative_to(root))] = sha(p)
    return result

def snapshot(workspace, target, policy):
    target.mkdir(parents=True, exist_ok=False)
    files = inventory(workspace)
    for name in files:
        p = target/'source'/name
        p.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(workspace/name, p)
    result = {'files': files, 'policy': policy, 'created': time.time()}
    result['binding'] = digest({'files': files, 'policy': policy})
    write(target/'manifest.json', result)
    return result

def verify_snapshot(target):
    m = read(target/'manifest.json')
    if inventory(target/'source') != m['files'] or digest({'files': m['files'], 'policy': m['policy']}) != m['binding']:
        raise Invalid('frozen solver artifact changed')
    return m

def dependencies(workspace):
    target = workspace/'.lake/packages'
    target.mkdir(parents=True, exist_ok=True)
    for p in (ROOT/'.lake/packages').iterdir():
        if not (target/p.name).exists():
            (target/p.name).symlink_to(p.resolve(), target_is_directory=True)

def copy_seed(seed, workspace):
    workspace.mkdir(parents=True, exist_ok=False)
    for name in SEED + ('contract.json',):
        target = workspace/name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(seed/name, target)
    for name in ('.scratch', 'research', 'evidence'):
        (workspace/name).mkdir(exist_ok=True)
    dependencies(workspace)

def clean_contract():
    old = read(ROOT/'contracts/markov-goal.json')
    if old['root_sha256'] != ROOT_SHA or sha(ROOT/old['root_file']) != ROOT_SHA:
        raise Invalid('exact supplied root changed')
    return {**old, 'id': 'published-markov-6-3-clean-v2', 'inherited': [],
            'preference': 'Exact root resolution; autonomous revisable agenda; complexity audit-only.',
            'clean_start': {'historical_results': 'none supplied or imported',
                'historical_exercises': 'not rerun; no exercise evidence claimed',
                'removed_inheritance_paths': old['inherited'],
                'reason': 'User-authorized fresh paired study, not an old-run migration.'}}

def implementation():
    files = sorted((ROOT/'machinery').glob('*.py')) + [ROOT/'.bootstrap/base-permissions.json']
    return {str(p.relative_to(ROOT)): sha(p) for p in files}
