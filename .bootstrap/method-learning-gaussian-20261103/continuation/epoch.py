"""Closed, own-history successor epochs for the Gaussian research machine.

Outside the sealed research implementation. Activation uses the unchanged native
freeze/verify/receipt APIs; no mathematical result is produced by migration.
The public return value contains counts, bindings and provenance paths only.
"""
import copy
import ctypes
import errno
import os
from pathlib import Path
import re
import shutil
import time
from types import SimpleNamespace

from machinery import study, study_common as common, study_knowledge as knowledge
from machinery import snapshot_routing, study_observer, study_discoveries
from machinery.validation_receipts import reuse
from machinery.resources import headroom, limits

SCHEMA = 'math-gkm.closed-own-epoch.v1'
MAX_COPY_BYTES = 16 * 1024**3
MAX_COPY_FILES = 100000
MAIN_JOB = re.compile(r'(?:plan-[0-9]{4}(?:-generation-[0-9]+)?(?:-repair-[0-9]+)?|round-[0-9]{4})\Z')
PARTIAL_METHOD = ('comparison-commitment.json', 'suite.json', 'prediction-reservation.json',
                  'progress.json', 'result.json', 'prediction-validation', 'prediction-workspace')


def clone_file(source, destination):
    """APFS copy-on-write with a distinct inode; ordinary copies elsewhere.

    CLONE_NOFOLLOW=0x0001 is declared by the installed macOS SDK clonefile.h.
    This shares storage extents, never a writable inode or a model permission.
    """
    if os.uname().sysname != 'Darwin':
        return False
    library = ctypes.CDLL(None, use_errno=True)
    try:
        function = library.clonefile
    except AttributeError:
        return False
    function.argtypes = (ctypes.c_char_p, ctypes.c_char_p, ctypes.c_uint32)
    function.restype = ctypes.c_int
    if function(os.fsencode(source), os.fsencode(destination), 0x0001) == 0:
        return True
    number = ctypes.get_errno()
    if number in (errno.ENOTSUP, errno.EXDEV, errno.ENOSYS, errno.EINVAL) and not Path(destination).exists():
        return False
    raise OSError(number, 'continuation clone failed')


class CopyBudget:
    """One source copy per selected view; never recursively copy an old study."""
    def __init__(self):
        self.bytes = 0
        self.files = 0
        self._last_room = 0.0
        self._bytes_since_room = 64*1024**2

    def room(self, amount=0):
        self._bytes_since_room += amount
        now = time.monotonic()
        if self._bytes_since_room >= 64*1024**2 or now-self._last_room >= 1:
            headroom(limits())
            self._last_room = now
            self._bytes_since_room = 0

    def file(self, source, destination, expected=None, *, replace=False):
        source, destination = Path(source), Path(destination)
        if source.is_symlink() or not source.is_file():
            raise common.Invalid('continuation needs a regular immutable source')
        actual = common.sha(source)
        if expected is not None and actual != expected:
            raise common.Invalid('continuation source hash changed')
        if destination.exists() or destination.is_symlink():
            if destination.is_symlink():
                raise common.Invalid('continuation destination alias')
            if common.sha(destination) == actual:
                return
            if not replace:
                raise common.Invalid('continuation destination collision')
        self.bytes += source.stat().st_size
        self.files += 1
        if self.bytes > MAX_COPY_BYTES or self.files > MAX_COPY_FILES:
            raise common.Invalid('continuation copy allowance exceeded')
        # Closed copies still need admission headroom. No limit is relaxed.
        self.room()
        destination.parent.mkdir(parents=True, exist_ok=True)
        temporary = destination.with_name(destination.name+'.epoch-copy')
        if temporary.exists() or temporary.is_symlink():
            raise common.Invalid('interrupted continuation copy; preserve origin')
        if not clone_file(source, temporary):
            with source.open('rb') as inp, temporary.open('xb') as out:
                while True:
                    block = inp.read(1024**2)
                    if not block:
                        break
                    self.room(len(block))
                    out.write(block)
                out.flush(); os.fsync(out.fileno())
        else:
            with temporary.open('rb') as copied:
                os.fsync(copied.fileno())
        if source.stat().st_ino == temporary.stat().st_ino:
            raise common.Invalid('continuation copy aliases a source inode')
        if common.sha(temporary) != actual:
            raise common.Invalid('continuation copied bytes differ')
        os.replace(temporary, destination)

    def tree(self, source, destination):
        source, destination = Path(source), Path(destination)
        if not source.exists():
            return
        if source.is_symlink():
            raise common.Invalid('continuation tree alias')
        for directory, dirs, files in os.walk(source, followlinks=False):
            base = Path(directory)
            if any((base/name).is_symlink() for name in dirs):
                raise common.Invalid('continuation tree contains aliases')
            for name in files:
                path = base/name
                self.file(path, destination/path.relative_to(source))


def own_path(path, root):
    path, root = Path(path), Path(root)
    if path.is_symlink() or not path.resolve().is_relative_to(root.resolve()):
        raise common.Invalid('continuation path escaped its own arm')
    return path


def copy_finished(source, destination, record, copies):
    """Use the genuine receipt verifier before and after relocation."""
    source, destination = Path(source), Path(destination)
    marker = source/'FINISHED.json'
    if common.sha(marker) != record['validation_bundle']['finished_sha256']:
        raise common.Invalid('continuation validator marker changed')
    checked = reuse(source, record['task'], record['solution'], record['task'].get('required_constants', []))
    if not checked.get('checked') or common.digest(checked) != record['receipt_hash']:
        raise common.Invalid('continuation validator result changed')
    finished = common.read(marker)
    if not isinstance(finished.get('files'), dict) or len(finished['files']) > 10000:
        raise common.Invalid('continuation validator file bound')
    for name, expected in finished['files'].items():
        relative = Path(name)
        if relative.is_absolute() or '..' in relative.parts or 'build' in relative.parts:
            raise common.Invalid('continuation validator includes an unsafe build path')
        copies.file(source/relative, destination/relative, expected)
    copies.file(marker, destination/'FINISHED.json', record['validation_bundle']['finished_sha256'])
    result = copy.deepcopy(record)
    result['validation_bundle']['directory'] = str(destination.resolve())
    after = reuse(destination, record['task'], record['solution'], record['task'].get('required_constants', []))
    if common.digest(after) != record['receipt_hash']:
        raise common.Invalid('continuation relocated receipt changed')
    return result


def required_snapshots(state, protocol):
    """Keep every lookup the unchanged future controller may require."""
    result = {'initial'}
    current = state['round']
    if current:
        result.add(f'round-{current-1:04d}')
    # The first continued episode can revisit the preceding ordinary boundary.
    first = max(0, current-protocol['episode_rounds'])
    if first:
        result.add(f'round-{first-1:04d}')
    research = state['research']
    for plan in research.get('method_plans', {}).values():
        start = plan['start_round']
        if type(start) is not int or not 0 <= start <= current:
            raise common.Invalid('continuation method predecessor is invalid')
        result.add('initial' if start == 0 else f'round-{start-1:04d}')
    concepts = research.get('concepts') or {}
    # Closed episode evidence remains at the retained immutable parent. Only
    # the active interval can be consulted by the unchanged next review.
    episodes = [concepts['active']] if concepts.get('active') else []
    for episode in episodes:
        start, end = episode['start_round'], episode['end_round']
        if type(start) is not int or type(end) is not int or not 0 <= start <= end < current:
            raise common.Invalid('continuation concept interval is invalid')
        result.add('initial' if start == 0 else f'round-{start-1:04d}')
        result.add(f'round-{end:04d}')
    return sorted(result)


def copy_snapshot(source, destination, copies):
    manifest = common.verify_snapshot(source)
    if destination.exists():
        existing = common.verify_snapshot(destination)
        if existing['binding'] != manifest['binding'] or existing['files'] != manifest['files']:
            raise common.Invalid('continuation historical snapshot collision')
        return manifest['binding']
    for name, expected in manifest['files'].items():
        common.inside(source/'source', name)
        copies.file(source/'source'/name, destination/'source'/name, expected)
    copies.file(source/'manifest.json', destination/'manifest.json')
    # Historical routing seals are retained as evidence, not resealed in a new epoch.
    if (source/'routing-seal.json').exists():
        copies.file(source/'routing-seal.json', destination/'routing-seal.json')
    if common.verify_snapshot(destination)['binding'] != manifest['binding']:
        raise common.Invalid('continuation historical snapshot differs')
    return manifest['binding']


def validate_closed_parent(parent, mode, protocol, state):
    if state.get('active') is not None or state.get('active_intent') is not None or state.get('resolution'):
        raise common.Invalid('continuation parent is active or resolved')
    if (state.get('status') != 'finite_budget_finished; root_open' or state.get('phase') != 'research'
            or state.get('round') != protocol['rounds'] or state['round'] % protocol['episode_rounds']):
        raise common.Invalid('continuation requires a completed finite episode boundary')
    arm = parent/'arms'/mode
    for job in (arm/'jobs').glob('*'):
        if not job.is_dir() or job.is_symlink() or str(job) not in state['receipts']:
            raise common.Invalid('continuation parent has an unreconciled job')
        receipt = common.read(job/'receipt.json')
        if common.digest(receipt) != state.get('receipt_hashes', {}).get(str(job)):
            raise common.Invalid('continuation parent receipt changed')
    for entry in state.get('method_learning', {}).get('pending', []):
        prepared = entry['prepared']
        directory = arm/'method-learning'/prepared['reference']
        if any((directory/name).exists() for name in PARTIAL_METHOD):
            raise common.Invalid('continuation cannot retarget a partially started method comparison')


def copy_jobs(old_arm, arm, state, copies):
    """Keep paid development history, never adapter/evaluator responses."""
    needed = {Path(path).name for path in state['receipts'] if MAIN_JOB.fullmatch(Path(path).name)}
    for entry in state['research'].get('pending_discoveries', {}).values():
        needed.add(entry['core']['origin']['job_key'])
    inherited = []
    for key in sorted(needed):
        if len(Path(key).parts) != 1 or key in ('.', '..'):
            raise common.Invalid('continuation inherited job identity')
        source, destination = old_arm/'jobs'/key, arm/'jobs'/key
        spec = common.read(source/'spec.json')
        receipt = common.read(source/'receipt.json')
        if spec.get('role') not in ('proposer', 'researcher') or receipt.get('role') != spec['role']:
            raise common.Invalid('continuation inherited job is not main research')
        for name in ('spec.json', 'request.json', 'receipt.json', 'final.json'):
            if (source/name).exists():
                copies.file(source/name, destination/name)
        inherited.append({'path': str(destination), 'key': key,
            'receipt_hash': common.digest(receipt), 'elapsed_seconds': receipt.get('elapsed_seconds')})
    return inherited


def copy_history(source, destination, copies):
    """Only original main-source history, not role trees or evaluator answers."""
    source, destination = Path(source), Path(destination)
    if not source.exists():
        return
    if source.is_symlink():
        raise common.Invalid('continuation history alias')
    for directory, dirs, files in os.walk(source, followlinks=False):
        base = Path(directory)
        if any((base/name).is_symlink() for name in dirs):
            raise common.Invalid('continuation history directory alias')
        for name in files:
            path = base/name
            relative = path.relative_to(source)
            if relative.parts[0] not in ('objects', 'manifests', 'own-checks', 'context') and not (
                    len(relative.parts) == 1 and re.fullmatch(r'round-[0-9]{4}\.json', relative.name)):
                raise common.Invalid('continuation history has an unknown producer')
            if relative.parts[0] == 'context':
                if (len(relative.parts) != 2 or not re.fullmatch(r'[0-9a-f]{64}\.json', relative.name) or
                        path.stat().st_size > 16*1024**2 or common.sha(path) != path.stem or
                        common.read(path).get('role') not in ('proposer', 'researcher')):
                    raise common.Invalid('continuation history includes a non-research context')
            copies.file(path, destination/relative)


def copy_pending_discoveries(old_arm, arm, old_ws, workspace, research, copies):
    """Immutable discovery cores retain their original, verified dependencies."""
    original_dependencies = []
    for key, entry in research.get('pending_discoveries', {}).items():
        study_discoveries.verify(SimpleNamespace(root=old_arm, mode=arm.name), research, old_ws, key)
        for name, relative in entry['source_paths'].items():
            copies.file(common.inside(old_ws, relative), common.inside(workspace, relative), entry['core']['source_files'][name])
        copies.file(common.inside(old_ws, entry['manifest']), common.inside(workspace, entry['manifest']))
        if entry['core']['kind'] != 'completion':
            original = Path(entry['core']['record']['validation_bundle']['directory'])
            own_path(original, common.ROOT)
            copy_finished(original, arm/'inherited/pending-validators'/key, entry['core']['record'], copies)
            original_dependencies.append({'binding': key, 'original': str(original),
                'clone': str(arm/'inherited/pending-validators'/key),
                'reason': 'immutable discovery core still names original bundle'})
    return original_dependencies


def copy_method_state(old_arm, arm, state, copies, snapshot_bindings):
    """Archive old tests; move only unstarted candidates into the live new pool."""
    queue = copy.deepcopy(state.get('method_learning'))
    if queue is None:
        return None, [], []
    old_root, new_root = old_arm/'method-learning', arm/'method-learning'
    retained_archives, descriptor_remaps = [], []
    for name in ('identities.json', 'application-pool.json'):
        if (old_root/name).exists():
            copies.file(old_root/name, new_root/name)
    # New challenge selection starts afresh; the original panel journal remains
    # immutable evidence at its original location, never gets a new suite hash.
    if (old_root/'holdout-use.json').exists():
        retained_archives.append(str(old_root/'holdout-use.json'))
    for review in queue.get('reviews', {}).values():
        old_path = own_path(old_arm/review['path'], old_arm)
        if common.sha(old_path) != review['sha256']:
            raise common.Invalid('continuation method review changed')
        copies.file(old_path, arm/review['path'], review['sha256'])
    pending_refs = {entry['prepared']['reference'] for entry in queue.get('pending', [])}
    for reference in queue.get('submitted', {}).values():
        if not isinstance(reference, str) or not re.fullmatch('[0-9a-f]{64}', reference):
            raise common.Invalid('continuation method reference is invalid')
        if reference not in pending_refs:
            retained_archives.append(str(old_root/reference))
    for entry in queue.get('pending', []):
        prepared = entry['prepared']
        reference = prepared['reference']
        if common.digest(prepared['commitment']) != reference:
            raise common.Invalid('continuation method commitment changed')
        original_descriptor = copy.deepcopy(prepared)
        source = own_path(old_root/reference, old_arm)
        if any((source/name).exists() for name in PARTIAL_METHOD):
            raise common.Invalid('continuation pending method comparison already started')
        if common.read(source/'prepared.json') != prepared:
            raise common.Invalid('continuation pending method descriptor changed')
        if common.read(source/'commitment.json') != prepared['commitment']:
            raise common.Invalid('continuation pending method commitment journal changed')
        before = own_path(prepared['before_path'], old_arm)
        relative = before.relative_to(old_arm)
        if relative.parts[0] != 'snapshots':
            raise common.Invalid('continuation pending method predecessor is not historical')
        snapshot_bindings[str(relative)] = copy_snapshot(before, arm/relative, copies)
        if snapshot_bindings[str(relative)] != prepared['before']:
            raise common.Invalid('continuation method predecessor binding changed')
        candidate = own_path(prepared['candidate_path'], old_arm)
        target = new_root/reference/'candidate'
        if copy_snapshot(candidate, target, copies) != prepared['candidate']:
            raise common.Invalid('continuation method candidate binding changed')
        copies.file(source/'commitment.json', new_root/reference/'commitment.json')
        prepared['before_path'] = str((arm/relative).resolve())
        prepared['candidate_path'] = str(target.resolve())
        common.write(new_root/reference/'prepared.json', prepared)
        descriptor_remaps.append({'reference': reference,
            'original_descriptor_sha256': common.digest(original_descriptor),
            'new_descriptor_sha256': common.digest(prepared),
            'original_before_path': original_descriptor['before_path'],
            'new_before_path': prepared['before_path'],
            'original_candidate_path': original_descriptor['candidate_path'],
            'new_candidate_path': prepared['candidate_path']})
    return queue, sorted(set(retained_archives)), descriptor_remaps


def namespace_applications(arm, suite, parent_binding):
    """Avoid ID collisions with a fresh panel without changing task semantics."""
    from machinery.study_methods import partition_suite
    path = arm/'method-learning/application-pool.json'
    if not path.exists():
        return []
    pool = common.read(path)
    fresh_ids = {task['id'] for task in partition_suite(suite, {'enabled': True})['methods']['tasks']}
    changed = []
    for entry in pool['entries']:
        old = entry['task']['id']
        # No repeated prefix growth across epochs: use original semantic task hash.
        new = 'inherited-'+common.digest({k: v for k, v in entry['task'].items() if k != 'id'})[:32]
        if new in fresh_ids:
            raise common.Invalid('fresh panel collides with retained application identity')
        entry['task']['id'] = new
        changed.append({'from': old, 'to': new})
    common.write(path, pool)
    return changed


def migrate(parent, destination, *, curation, profile, contract_path, arm='exploration'):
    """Create a funded successor; `profile.rounds` is an ADDITIONAL round count.

    This is trusted host data handling. Call only after source review and actual
    owned closure. No model runs and no mathematical admission occurs here.
    """
    parent, destination = Path(parent).resolve(), Path(destination).resolve()
    if arm != 'exploration' or parent == destination or destination.exists():
        raise common.Invalid('continuation needs a fresh own exploration destination')
    if not parent.is_relative_to(common.ROOT) or not destination.is_relative_to(common.ROOT):
        raise common.Invalid('continuation study outside the authorized repository')
    contract = common.read(contract_path)
    curation = Path(curation)
    suite_path = curation/'suite.json' if curation.is_dir() else curation
    suite = common.read(suite_path)
    curation_provenance = common.read(suite_path.parent/'provenance.json')
    configuration = common.read(profile) if isinstance(profile, (str, Path)) else copy.deepcopy(profile)
    if not isinstance(configuration, dict) or type(configuration.get('rounds')) is not int or configuration['rounds'] < 1:
        raise common.Invalid('continuation profile needs a positive additional round count')
    copies = CopyBudget()
    headroom(limits())
    with common.lock(parent/'controller.lock'):
        protocol = study.verify(parent)
        old_arm = parent/'arms'/arm
        old = common.load_state(old_arm/'state.json')
        validate_closed_parent(parent, arm, protocol, old)
        if contract != common.read(parent/'seed/contract.json'):
            raise common.Invalid('continuation cannot change the mathematical contract')
        parent_state_hash = common.sha(old_arm/'state.json')
        parent_seal_hash = common.sha(parent/'seal.json')
        if common.digest(suite) == common.read(parent/'seal.json')['suite']:
            raise common.Invalid('continuation requires a fresh independent challenge panel')
        start = old['round']
        additional = configuration['rounds']
        configuration['rounds'] = start+additional
        study.validate_protocol({**study.DEFAULT, **configuration})
        study.freeze(destination, configuration, suite, contract, curation_provenance)
        fresh_seal = common.read(destination/'seal.json')
        parent_seal = common.read(parent/'seal.json')
        if fresh_seal['seed'] != parent_seal['seed']:
            raise common.Invalid('continuation exact clean seed changed')
        fresh_arm, workspace = destination/'arms'/arm, destination/'arms'/arm/'workspace'
        old_ws = old_arm/'workspace'
        source_inventory = common.inventory(old_ws)
        for name, expected in source_inventory.items():
            copies.file(old_ws/name, workspace/name, expected, replace=True)
        copy_history(old_ws/'history', workspace/'history', copies)
        research = copy.deepcopy(old['research'])
        remaps = []
        for group in ('knowledge', 'components'):
            for identifier, record in research.get(group, {}).items():
                source = own_path(record['validation_bundle']['directory'], old_arm)
                target = fresh_arm/'inherited/validators'/identifier
                migrated = copy_finished(source, target, record, copies)
                knowledge.verify_record(migrated, workspace)
                research[group][identifier] = migrated
                remaps.append({'id': identifier, 'original': str(source), 'copy': str(target),
                               'finished_sha256': record['validation_bundle']['finished_sha256']})
        inherited_jobs = copy_jobs(old_arm, fresh_arm, old, copies)
        dependencies = copy_pending_discoveries(old_arm, fresh_arm, old_ws, workspace, research, copies)
        bindings = {}
        for name in required_snapshots(old, protocol):
            if name == 'initial':
                # Native freeze already creates the exact pristine seed. It must
                # agree with original clean initial before any continued work.
                bindings[name] = copy_snapshot(old_arm/'snapshots'/name, fresh_arm/'snapshots'/name, copies)
            else:
                bindings[name] = copy_snapshot(old_arm/'snapshots'/name, fresh_arm/'snapshots'/name, copies)
        method_queue, method_archives, method_remaps = copy_method_state(old_arm, fresh_arm, old, copies, bindings)
        application_remaps = namespace_applications(fresh_arm, suite, parent_state_hash)
        fresh = common.load_state(fresh_arm/'state.json')
        continued = copy.deepcopy(fresh)
        continued.update(research=research, round=start, phase='research',
            status='ready', reviewed_rounds=list(old['reviewed_rounds']),
            receipts=[item['path'] for item in inherited_jobs],
            receipt_hashes={item['path']: item['receipt_hash'] for item in inherited_jobs},
            counted_jobs=[item['key'] for item in inherited_jobs])
        if method_queue is not None:
            continued['method_learning'] = method_queue
        old_accounting = {key: value for key, value in old.items() if key != 'research'}
        provenance = {'schema': SCHEMA, 'parent_study': str(parent), 'arm': arm,
            'parent_state_sha256': parent_state_hash, 'parent_seal_sha256': parent_seal_hash,
            'parent_research_sha256': common.digest(old['research']),
            'new_research_sha256': common.digest(research),
            'start_round': start, 'end_round': start+additional,
            'old_accounting': old_accounting, 'inherited_main_jobs': inherited_jobs,
            'accounting_scope': 'New allowance only; old costs retained at parent and here. Inherited receipt elapsed must not be counted as new work.',
            'validator_remaps': remaps, 'original_pending_dependencies': dependencies,
            'historical_snapshots': bindings, 'method_archives_retained': method_archives,
            'method_descriptor_path_remaps': method_remaps,
            'application_id_remaps': application_remaps,
            'method_panel_chronology': 'Previously untested carried methods first use a fresh panel selected after acquisition by an independent curator not shown the acquired method; not a predevelopment panel claim.',
            'original_comparison': 'Immutable at original parent; successor is noncomparative own-history goal work.',
            'original_clean_initial_preserved': True,
            'routing_scope': 'Prospective capture may require fresh native rebuilding; actual routing qualification is recorded in MIGRATION_FINISHED.',
            'created': time.time()}
        common.write(destination/'CONTINUATION_PROVENANCE.json', provenance)
        seal = fresh_seal
        seal['continuation_provenance_sha256'] = common.sha(destination/'CONTINUATION_PROVENANCE.json')
        seal['baseline_adjustments'] = ['dormant pristine baseline placeholder; exploration own-history continuation',
                                      'new finite allowance, original costs retained',
                                      'fresh private panel; no inherited comparison is relabeled fresh']
        plan = common.read(destination/'audit/plan.json')
        plan['checkpoints'] = ['initial', 'epoch-start']+[f'round-{r:04d}' for r in range(start, start+additional)]+['terminal']
        plan['initial_scope'] = 'Original clean initial preserved for historical predecessor lookup.'
        plan['epoch_start_scope'] = 'Actual inherited mathematical state and notes, prospectively sealed.'
        plan['continuation_provenance_sha256'] = seal['continuation_provenance_sha256']
        common.write(destination/'audit/plan.json', plan)
        seal['observer_plan'] = plan; seal['audit_plan_sha256'] = common.sha(destination/'audit/plan.json')
        common.write(destination/'seal.json', seal)
        seal_hash = common.digest(seal)
        for mode in ('baseline', 'exploration'):
            path = destination/'arms'/mode/'state.json'
            value = continued if mode == arm else common.load_state(path)
            value['seal_hash'] = seal_hash
            common.save_state(path, value)
        # Capture actual continued inputs in a NEW snapshot; never replace clean T.
        routing = None
        if snapshot_routing.ENABLED:
            routing = snapshot_routing.freeze_snapshot(destination, fresh_arm, workspace,
                fresh_arm/'snapshots/epoch-start', research,
                study.Arm(destination, arm, -1).admitted(research))
        else:
            common.snapshot(workspace, fresh_arm/'snapshots/epoch-start', research['policy'],
                            study.Arm(destination, arm, -1).admitted(research))
        study_observer.checkpoint(destination, arm, 'epoch-start', continued,
                                 fresh_arm/'snapshots/epoch-start')
        for key in research.get('pending_discoveries', {}):
            study_discoveries.verify(SimpleNamespace(root=fresh_arm, mode=arm), research, workspace, key)
        study.verify(destination)
        if common.sha(old_arm/'state.json') != parent_state_hash or common.inventory(old_ws) != source_inventory:
            raise common.Invalid('continuation parent changed during migration')
        marker = {'schema': SCHEMA, 'parent_state_sha256': parent_state_hash,
                  'state_sha256': common.sha(fresh_arm/'state.json'),
                  'seal_sha256': common.sha(destination/'seal.json'),
                  'provenance_sha256': common.sha(destination/'CONTINUATION_PROVENANCE.json'),
                  'epoch_start_binding': common.verify_snapshot(fresh_arm/'snapshots/epoch-start')['binding'],
                  'copied_files': copies.files, 'copied_bytes': copies.bytes,
                  'epoch_start_routing_reusable': bool(routing and routing.get('reusable')),
                  'source_sha256': common.sha(__file__), 'finished_at': time.time()}
        common.write(destination/'MIGRATION_FINISHED.json', marker)
        return {'study': str(destination), 'start_round': start, 'end_round': start+additional,
                'provenance_path': str(destination/'CONTINUATION_PROVENANCE.json'),
                'parent_state_sha256': parent_state_hash, 'epoch_start_binding': marker['epoch_start_binding'],
                'knowledge_count': len(research.get('knowledge', {})),
                'component_count': len(research.get('components', {})),
                'pending_method_count': len((method_queue or {}).get('pending', [])),
                'epoch_start_routing_reusable': marker['epoch_start_routing_reusable'],
                'copied_files': copies.files, 'copied_bytes': copies.bytes}
