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
MODELS = ('gpt-6-astra', 'gpt-6.1-sol')
REASONING_EFFORT = 'high'
ROOT_SHA = '8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
SEED = ('MathGKM/Markov.lean', 'MathGKM/Protocol.lean', 'MISSION.md',
        'docs/DESIGN.md', 'docs/CONCEPT_DRIVER.md', 'lakefile.toml', 'lake-manifest.json', 'lean-toolchain')

class Invalid(ValueError):
    pass

def validate_model(model):
    if model not in MODELS:
        raise Invalid('explicit supported model required: '+', '.join(MODELS))
    return model

def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':'), ensure_ascii=False)

def digest(value):
    return hashlib.sha256(canonical(value).encode()).hexdigest()

def sha(path):
    hashed = hashlib.sha256()
    with Path(path).open('rb') as source:
        for block in iter(lambda: source.read(1024*1024), b''):
            hashed.update(block)
    return hashed.hexdigest()

def read(path, *, max_bytes=32*1024**2):
    with Path(path).open('rb') as source:
        raw=source.read(max_bytes+1)
    if len(raw)>max_bytes: raise Invalid('JSON artifact exceeds bounded parser capacity')
    return json.loads(raw)

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

SOURCE_SUFFIXES={'.lean','.py','.md','.json','.jsonl','.toml','.txt','.rst','.csv','.tsv',
    '.yaml','.yml','.svg','.log','.sb','.sh','.sage','.gap','.tex','.bib','.html','.css','.js','.ipynb'}
SOURCE_FILE_CAP=8*1024**2
SOURCE_TOTAL_CAP=128*1024**2

def inventory(root):
    """Research sources only. Never traverse links, Git, caches or provider state."""
    result = {}; total=0
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
                if p.suffix not in SOURCE_SUFFIXES or any(x in name for x in ('.olean','.ilean')):
                    continue  # Binary/archive payloads stay at origin, never source views.
                size=p.stat().st_size; total+=size
                if size>SOURCE_FILE_CAP or total>SOURCE_TOTAL_CAP or len(result)>=10000:
                    raise Invalid('source inventory retention bound; preserve origin and stop')
                # Explicit text formats alone do not authorize binary contents.
                import codecs
                decoder=codecs.getincrementaldecoder('utf-8')()
                try:
                    with p.open('rb') as source:
                        for block in iter(lambda:source.read(65536),b''):
                            if b'\x00' in block: raise Invalid('binary payload in source format')
                            decoder.decode(block)
                    decoder.decode(b'',final=True)
                except UnicodeError as exc: raise Invalid('non-text payload in source format') from exc
                result[str(p.relative_to(root))] = sha(p)
    return result

def retention_room(root, extra):
    from .resources import disk_bytes,GiB
    if disk_bytes(root)+extra>GiB:
        raise Invalid('aggregate retained source/history bound; preserve evidence and stop')

def atomic_text(path,text):
    path=Path(path); path.parent.mkdir(parents=True,exist_ok=True)
    tmp=path.with_name(path.name+'.next')
    with tmp.open('w') as out:
        out.write(text); out.flush(); os.fsync(out.fileno())
    os.replace(tmp,path)
    fd=os.open(path.parent,os.O_RDONLY)
    try: os.fsync(fd)
    finally: os.close(fd)

def snapshot(workspace, target, policy, admitted_modules=None):
    final = target
    target = target.with_name(target.name+'.staging')
    if target.exists():
        shutil.rmtree(target)  # incomplete private copy; original source is retained
    target.mkdir(parents=True, exist_ok=False)
    files = inventory(workspace)
    common=Path(os.path.commonpath([workspace.resolve(),final.resolve()]))
    retention_room(common,sum((workspace/n).stat().st_size for n in files))
    for name in files:
        p = target/'source'/name
        p.parent.mkdir(parents=True, exist_ok=True)
        # No hardlink can alias frozen data to a live writer's cache/history.
        shutil.copyfile(workspace/name,p)
        if sha(p)!=files[name]: raise Invalid('source changed while freezing')
        with p.open('rb') as copied: os.fsync(copied.fileno())
        p.chmod(0o444)
    result = {'files': files, 'policy': policy, 'created': time.time()}
    result['admitted_modules'] = sorted(admitted_modules or [])
    result['binding'] = digest({k: result[k] for k in ('files', 'policy', 'admitted_modules')})
    write(target/'manifest.json', result)
    os.rename(target, final)
    fd=os.open(final.parent,os.O_RDONLY)
    try: os.fsync(fd)
    finally: os.close(fd)
    return result

def verify_snapshot(target):
    m = read(target/'manifest.json')
    bound = {k: m[k] for k in ('files', 'policy', 'admitted_modules') if k in m}
    if inventory(target/'source') != m['files'] or digest(bound) != m['binding']:
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
    names = read(seed/'seed-files.json') if (seed/'seed-files.json').exists() else list(SEED)
    for name in tuple(names) + ('contract.json',):
        target = workspace/name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(seed/name, target)
    for name in ('.scratch', 'research', 'evidence'):
        (workspace/name).mkdir(exist_ok=True)
    dependencies(workspace)

def history_view(source, target):
    """Bounded source-only views, without shared writable inode aliases."""
    target.parent.mkdir(parents=True,exist_ok=True)
    retention_room(target.parent,sum(p.stat().st_size for sub in ('objects','manifests')
        for p in (source/sub).glob('*') if p.is_file()))
    for sub in ('objects','manifests'):
        base=source/sub
        if not base.exists(): continue
        for p in base.iterdir():
            if not p.is_file() or p.is_symlink(): raise Invalid('invalid retained source view')
            dest=target/sub/p.name
            dest.parent.mkdir(parents=True,exist_ok=True)
            if dest.exists() and (dest.is_symlink() or sha(dest)!=sha(p)):
                raise Invalid('immutable history view changed')
            if not dest.exists():
                shutil.copyfile(p,dest)
                if sha(dest)!=sha(p): raise Invalid('history changed during copy')
                dest.chmod(0o444)

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
    files = sorted((ROOT/'machinery').glob('*.py')) + sorted((ROOT/'MathGKM').glob('*.lean')) + [ROOT/'config/study-base-permissions.json']
    return {str(p.relative_to(ROOT)): sha(p) for p in files}


def dependency_identity():
    """Content identity, not just link destinations. Called only during validation/run.

    Full pinned object tree hashing is common setup/verification overhead. No
    Git metadata is traversed and no packages are downloaded or changed.
    """
    from .trust import CORE, LEAN, CHECKER
    roots = {'lean-core': CORE}
    roots.update({p.name: p.resolve()/'.lake/build/lib/lean' for p in (ROOT/'.lake/packages').iterdir()})
    result = {'binaries': {str(p): sha(p) for p in (LEAN, CHECKER)}, 'trees': {}}
    for name, directory in roots.items():
        files = {str(p.relative_to(directory)): sha(p) for p in directory.rglob('*')
                 if p.is_file() and ('.olean' in p.name or p.suffix in ('.so', '.dylib'))}
        result['trees'][name] = {'path': str(directory), 'files_sha256': digest(files), 'files': files}
    return result


def authorize_live(contract):
    """Only a supervisor-owned, read-only authorization may lift the hold.
    This file is absent from the candidate write grants and is not a certificate.
    """
    path = ROOT/'.bootstrap/study-authorization.json'
    if not path.is_file():
        raise Invalid('live activation awaits independent source audit, actual passing tests and protected supervisor authorization; user already authorized subsequent fresh matched trials')
    record = read(path)
    if (record.get('contract_sha256') != digest(contract) or
        record.get('implementation_sha256') != digest(implementation()) or
        record.get('user_explicit_ok') is not True):
        raise Invalid('live authorization does not bind this reviewed contract and implementation')
