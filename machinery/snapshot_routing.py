"""Prospective routing only; exact A remains the existing validator input.

No B certificate, native-world equivalence, cache normalization or budget change.
Both source gates remain closed pending independent review of this prototype.
"""
import copy
import os
from pathlib import Path
import secrets
import shutil

from .study_common import (Invalid, canonical, digest, inventory, read, sha,
                           verify_snapshot, write, copy_seed, SOURCE_FILE_CAP, SOURCE_TOTAL_CAP)

ENABLED = True
# Source review must qualify the prospective formal-head classification and
# its association with actual A and the existing exact cache inputs. This does
# not require a new ambient OS/native-equivalence or loader attestation.
# Tests replace this only for their complete, tiny controlled fixture universe.
VALIDATION_INPUT_COVERAGE = 'math-gkm.formal-projection.public-constructors.v1'
SCHEMA = 'math-gkm.exact-snapshot-routing.v1'
CONTEXT_SCHEMA = 'math-gkm.snapshot-research-context.v1'
NOTE_SUFFIXES = frozenset({'.md', '.txt', '.rst'})
FORMAL_FIELDS = frozenset({'knowledge', 'components', 'remaining_obligations',
                          'formal_obligations', 'proposition_dag', 'pending_discoveries'})
REQUIRED_FORMAL_FIELDS = frozenset({'knowledge', 'components', 'remaining_obligations',
                                   'formal_obligations'})
# Public source owners: study_policy.{initial,update,commit}, study_concepts,
# study_reports, study_research_feedback and study_knowledge diagnostics.
# These values schedule/report research; none substitutes for an admitted record.
NONFORMAL_FIELDS = frozenset({'mode', 'policy', 'portfolio', 'agenda', 'episode',
    'decisions', 'use_links', 'pending_policy', 'observations', 'program',
    'pending_program', 'episode_history', 'concepts', 'findings', 'execution_budget',
    'submission_failures', 'metadata_failures', 'own_check_feedback',
    'review_feedback', 'review_feedback_deliveries'})
MAX_NOTES_BYTES = 2 * 1024**2
MAX_DELIVERY_BYTES = 4 * 1024**2


class DeliveryUnavailable(Invalid):
    """Pre-assay feasibility refusal; never permission to retarget a paid route."""
    def __init__(self, code):
        self.code = code
        super().__init__('bounded research context unavailable: '+code)

MAX_ENTRIES = 10000


def _path(root, name):
    relative = Path(name)
    if (not isinstance(name, str) or relative.is_absolute() or '..' in relative.parts or
            any(part.startswith('.') for part in relative.parts)):
        raise Invalid('routing path is not a plain source-relative path')
    result = root/relative
    if result.is_symlink() or not result.resolve().is_relative_to(root.resolve()):
        raise Invalid('routing path escaped its immutable root')
    return result


def _note(name):
    p = Path(name)
    return p.parts[0] in ('research', 'evidence') and p.suffix in NOTE_SUFFIXES


def _exact_source_files(source):
    """Unlike inventory(), fail on every unclassified/ignored snapshot file."""
    files, total = {}, 0
    for directory, dirs, names in os.walk(source, followlinks=False):
        if Path(directory).is_symlink() or any((Path(directory)/d).is_symlink() for d in dirs):
            raise Invalid('routing source symlink')
        for name in names:
            path = Path(directory)/name
            relative = str(path.relative_to(source))
            _path(source, relative)
            size = path.stat().st_size
            total += size
            if (not path.is_file() or len(files) >= MAX_ENTRIES or
                    size > SOURCE_FILE_CAP or total > SOURCE_TOTAL_CAP):
                raise Invalid('routing unclassified source or source bound')
            files[relative] = sha(path)
    return files


def _ledger(research, source, files, contract, armroot):
    if (not isinstance(research, dict) or not REQUIRED_FORMAL_FIELDS <= research.keys() or
            set(research) - FORMAL_FIELDS - NONFORMAL_FIELDS):
        raise Invalid('unknown or missing research-state classification')
    from .formal_projection import project
    return project(research, source, files, contract, armroot)


def _formal_files(files, ledger):
    referenced = {name for kind in ('knowledge', 'components')
        for record in (ledger.get(kind) or {}).values() for name in record['source_files']}
    return {name: hashed for name, hashed in files.items() if not _note(name) or name in referenced}


def _common_inputs(study):
    """Use the established verifier's exact same-study ledger, never widen it.

    The gate stays unqualified pending review of the formal-head projection
    and source/permission integration. A remains the actual validator input;
    no equivalence of B native objects or enlarged loader boundary is asserted.
    """
    from .formal_projection import SCHEMA as projection_schema
    if VALIDATION_INPUT_COVERAGE != projection_schema:
        raise Invalid('unqualified prospective formal-head coverage')
    from .study_common import implementation
    from .study_transfer import CATALOG_INSPECTION_PROFILE, _catalog_engine
    from .inspection_profiles import resolve
    from .serial_replay import engine_identity
    seal = read(study/'seal.json')
    if implementation() != seal['implementation'] or not isinstance(seal.get('dependencies'), dict):
        raise Invalid('existing implementation/dependency ledger changed')
    # Reference the same frozen dependency ledger consumed by the unchanged
    # exact catalogue/cache contract. Existing study.verify() still verifies it;
    # this projection does not add another whole-tree scan per snapshot/select.
    seed = study/'seed'
    names = read(seed/'seed-files.json')
    if (not isinstance(names, list) or len(set(names)) != len(names) or
            set(seal['seed']) != set(names) | {'contract.json'} or
            sha(seed/'seed-files.json') != seal['seed_files_sha256']):
        raise Invalid('seed manifest changed or incomplete')
    for name, hashed in seal['seed'].items():
        if sha(_path(seed, name)) != hashed:
            raise Invalid('seed input bytes changed')
    return {'coverage': VALIDATION_INPUT_COVERAGE, 'study_seal': digest(seal),
        'seed_files_manifest_sha256': seal['seed_files_sha256'], 'seed': seal['seed'],
        'contract': read(seed/'contract.json'), 'implementation': seal['implementation'],
        'dependencies': seal['dependencies'], 'ordinary_profile': resolve().binding(),
        'catalogue_profile': resolve(CATALOG_INSPECTION_PROFILE).binding(),
        'catalogue_engine': engine_identity(_catalog_engine())}


def initialize_epoch(armroot):
    """Only a new arm may create an epoch; never install into an existing arm."""
    target = armroot/'snapshot-routing/epoch.json'
    if target.exists() or (armroot/'state.json').exists() or (armroot/'snapshots').exists():
        raise Invalid('routing epoch requires a new arm without snapshots or state')
    write(target, {'schema': SCHEMA, 'arm': str(armroot.resolve()),
                   'nonce': secrets.token_hex(32)})


def _epoch(armroot):
    epoch = read(armroot/'snapshot-routing/epoch.json')
    if epoch.get('schema') != SCHEMA or epoch.get('arm') != str(armroot.resolve()):
        raise Invalid('unknown or migrated routing epoch')
    return digest(epoch)


def freeze_snapshot(study, armroot, workspace, snapshot, research, admitted_modules):
    """Create a NEW snapshot and its AS-OF seal as one controller operation.

    There is intentionally no seal-existing/backfill API and no later arm state
    read. Unknown coverage/classification leaves an immutable nonreusable seal.
    """
    if snapshot.exists() or workspace is None:
        raise Invalid('prospective snapshot must be new and have its original workspace')
    from .study_common import snapshot as freeze
    manifest = freeze(workspace, snapshot, research['policy'], admitted_modules)
    target = snapshot/'routing-seal.json'
    if target.exists():
        raise Invalid('prospective routing seal must never be backfilled or replaced')
    record = {'schema': SCHEMA, 'snapshot': manifest['binding'],
              'manifest_sha256': sha(snapshot/'manifest.json'), 'reusable': False,
              'research_state_sha256': digest(research),
              'asof_formal_ledger': {name: copy.deepcopy(research.get(name))
                                     for name in sorted(FORMAL_FIELDS)},
              'research_metadata': {name: copy.deepcopy(value) for name, value in research.items()
                                    if name in NONFORMAL_FIELDS}}
    record['research_metadata_sha256'] = digest(record['research_metadata'])
    try:
        epoch = _epoch(armroot)
        if research.get('mode') != armroot.name:
            raise Invalid('research mode does not match owning arm')
        relative = snapshot.resolve().relative_to(armroot.resolve())
        if snapshot.is_symlink() or '..' in relative.parts:
            raise Invalid('snapshot is outside its epoch arm')
        files = _exact_source_files(snapshot/'source')
        if workspace is None:
            raise Invalid('prospective workspace input closure was not captured')
        observed = {}
        for folder in ('MathGKM', 'research', 'evidence'):
            if (workspace/folder).exists():
                observed.update({folder+'/'+name: hashed for name, hashed in
                    _exact_source_files(workspace/folder).items()})
        if observed != manifest['files']:
            raise Invalid('unknown formal/native workspace material')
        if files != manifest['files']:
            raise Invalid('unknown formal/native snapshot material')
        ledger = _ledger(research, snapshot/'source', files,
                         read(study/'seed/contract.json'), armroot)
        formal = _formal_files(files, ledger)
        record['classified_note_paths'] = sorted(set(files) - set(formal))
        common = _common_inputs(study)
        from .formal_projection import SCHEMA as projection_schema, admitted_paths
        if manifest['admitted_modules'] != admitted_paths(research, read(study/'seed/seed-files.json')):
            raise Invalid('unsupported admitted-module constructor association')
        payload = {'common': common, 'formal_files': formal, 'accepted_ledger': ledger,
                   'projection_schema': projection_schema, 'admitted_modules': manifest['admitted_modules']}
        formal_identity = digest(payload)
        index = armroot/'snapshot-routing'/epoch/(formal_identity+'.json')
        origin = {'schema': SCHEMA, 'snapshot': str(relative),
                  'binding': manifest['binding'], 'seal_sha256': None}
        if index.exists():
            origin = read(index)
            if (not isinstance(origin, dict) or
                    set(origin) != {'schema', 'snapshot', 'binding', 'seal_sha256'}):
                raise Invalid('unknown as-of validation-origin index schema')
            candidate = armroot/Path(origin['snapshot'])
            old_manifest, old_seal = _sealed(armroot, candidate, epoch)
            if (old_seal['formal'] != payload or origin.get('schema') != SCHEMA or
                    origin['binding'] != old_manifest['binding'] or
                    origin['seal_sha256'] != sha(candidate/'routing-seal.json')):
                raise Invalid('as-of validation origin changed')
        record.update(epoch=epoch, reusable=True, formal_identity=formal_identity,
                      formal=payload, validation_origin=origin)
    except (Invalid, OSError, ValueError, KeyError, TypeError) as exc:
        record['reason'] = str(exc)
    write(target, record)
    target.chmod(0o444)
    if record['reusable']:
        index = armroot/'snapshot-routing'/record['epoch']/(record['formal_identity']+'.json')
        if not index.exists():
            # The first original immutable A remains the index origin.
            write(index, {'schema': SCHEMA, 'snapshot': str(relative),
                          'binding': manifest['binding'], 'seal_sha256': sha(target)})
    return record


def _sealed(armroot, source, epoch):
    if source.is_symlink() or not source.resolve().is_relative_to(armroot.resolve()):
        raise Invalid('routing snapshot escaped owning arm')
    manifest = verify_snapshot(source)
    seal = read(source/'routing-seal.json')
    if (seal.get('schema') != SCHEMA or seal.get('reusable') is not True or
            seal.get('epoch') != epoch or seal.get('snapshot') != manifest['binding'] or
            seal.get('manifest_sha256') != sha(source/'manifest.json') or
            seal.get('formal_identity') != digest(seal.get('formal')) or
            _exact_source_files(source/'source') != manifest['files']):
        raise Invalid('unknown, changed or legacy prospective routing seal')
    if (seal.get('asof_formal_ledger') != seal['formal']['accepted_ledger'] or
            seal.get('research_metadata_sha256') != digest(seal.get('research_metadata'))):
        raise Invalid('as-of research metadata changed')
    from .formal_projection import SCHEMA as projection_schema, admitted_paths
    if seal['formal'].get('projection_schema') != projection_schema:
        raise Invalid('unknown formal projection schema')
    frozen_research = {**seal['research_metadata'], **seal['asof_formal_ledger']}
    projected = _ledger(frozen_research, source/'source', manifest['files'],
                        read(armroot.parent.parent/'seed/contract.json'), armroot)
    if (projected != seal['formal']['accepted_ledger'] or
            manifest['admitted_modules'] != admitted_paths(frozen_research,
                read(armroot.parent.parent/'seed/seed-files.json'))):
        raise Invalid('as-of formal references changed')
    origin = seal.get('validation_origin')
    if not isinstance(origin, dict) or set(origin) != {'schema', 'snapshot', 'binding', 'seal_sha256'}:
        raise Invalid('missing prospective validation-origin association')
    formal = _formal_files(manifest['files'], projected)
    if (seal.get('classified_note_paths') != sorted(set(manifest['files']) - set(formal)) or
            seal['formal'].get('formal_files') != formal or
            seal['formal'].get('admitted_modules') != manifest['admitted_modules']):
        raise Invalid('formal input map changed')
    return manifest, seal


def _select(arm, research):
    selected, reason, formal_id = research, 'fresh_B_unknown_or_legacy_seal', None
    try:
        epoch = _epoch(arm.root)
        _, bs = _sealed(arm.root, research, epoch)
        # Recheck only the established exact global ledger; it cannot qualify the
        # coverage gate. No compare-to-current accepted/research ledger occurs.
        if bs['formal']['common'] != _common_inputs(arm.study):
            raise Invalid('global validation inputs changed')
        formal_id = bs['formal_identity']
        index = read(arm.root/'snapshot-routing'/epoch/(formal_id+'.json'))
        origin = dict(bs['validation_origin'])
        if origin['seal_sha256'] is None:
            if (origin['snapshot'] != str(research.resolve().relative_to(arm.root.resolve())) or
                    origin['binding'] != bs['snapshot']):
                raise Invalid('invalid self-origin association')
            origin['seal_sha256'] = sha(research/'routing-seal.json')
        if index != origin:
            raise Invalid('current index differs from sealed as-of validation origin')
        relative = Path(origin['snapshot'])
        if relative.is_absolute() or '..' in relative.parts:
            raise Invalid('routing index escaped owning arm')
        candidate = arm.root/relative
        am, ass = _sealed(arm.root, candidate, epoch)
        if (index.get('schema') != SCHEMA or index['binding'] != am['binding'] or
                index['seal_sha256'] != sha(candidate/'routing-seal.json') or
                ass['formal'] != bs['formal']):
            raise Invalid('routing index or exact prospective identity changed')
        selected = candidate
        reason = 'original_A_exact_prospective_formal_identity' if selected != research else 'fresh_B_first_formal_identity'
    except (Invalid, OSError, ValueError, KeyError, TypeError):
        pass
    return selected, reason, formal_id


def _delivery(research, manifest, target):
    """Only explicitly classified, exact B note bytes, never B formal files."""
    notes, size = [], 0
    metadata, allowed_notes = None, set()
    sealpath = research/'routing-seal.json'
    if sealpath.exists():
        captured = read(sealpath)
        if (captured.get('snapshot') != manifest['binding'] or
                captured.get('manifest_sha256') != sha(research/'manifest.json') or
                captured.get('research_metadata_sha256') != digest(captured.get('research_metadata'))):
            raise Invalid('as-of research context changed')
        metadata = captured['research_metadata']
        allowed_notes = set(captured.get('classified_note_paths', []))
    for name, hashed in sorted(manifest['files'].items()):
        if not _note(name) or name not in allowed_notes:
            continue
        path = _path(research/'source', name)
        size += path.stat().st_size
        if size > MAX_NOTES_BYTES:
            raise DeliveryUnavailable('raw_notes_bytes')
        raw = path.read_bytes()
        if sha(path) != hashed or b'\x00' in raw:
            raise Invalid('research notes bytes changed or contain binary data')
        try:
            text = raw.decode('utf-8')
        except UnicodeError:
            raise DeliveryUnavailable('notes_utf8') from None
        notes.append({'source_path': name, 'sha256': hashed, 'text': text})
    value = {'schema': SCHEMA, 'research_snapshot': manifest['binding'],
        'research_policy': manifest['policy'], 'research_metadata': metadata, 'notes': notes,
        'authority': 'untrusted research context only; no B formal input is supplied or certified'}
    if len((canonical(value)+'\n').encode('utf-8')) > MAX_DELIVERY_BYTES:
        raise DeliveryUnavailable('encoded_context_bytes')
    if target.exists():
        if read(target, max_bytes=MAX_DELIVERY_BYTES) != value:
            raise Invalid('research notes delivery changed after commitment')
    else:
        write(target, value)
        target.chmod(0o444)
    return {'schema': SCHEMA, 'path': str(target.resolve()), 'sha256': sha(target),
            'research_snapshot': manifest['binding'], 'research_policy_sha256': digest(manifest['policy']),
            'research_metadata_sha256': digest(metadata)}


def prepare_pair(arm, before, after, directory):
    """Commit both inputs before effects; infeasible delivery uses ordinary B.

    A refusal before the route exists can choose the original ordinary path for
    BOTH sides. Once a route exists, equality below forbids any retargeting.
    """
    path = directory/'snapshot-routing.json'
    if not path.exists() and any((directory/name).exists() for name in ('commitment.json', 'result.json')):
        raise Invalid('paid/legacy comparison cannot acquire a new routing commitment')
    routes, unavailable = {}, None
    for side, research in (('before', before), ('after', after)):
        bm = verify_snapshot(research)
        validation, reason, formal_id = _select(arm, research)
        am = verify_snapshot(validation)
        try:
            delivery = _delivery(research, bm, directory/('research-notes-'+side+'.json'))
        except DeliveryUnavailable as exc:
            unavailable = exc.code
            delivery = None
        routes[side] = {'schema': SCHEMA, 'execution_mode': 'dual_snapshot',
            'research_snapshot': str(research.resolve()), 'research_binding': bm['binding'],
            'validation_snapshot': str(validation.resolve()), 'validation_binding': am['binding'],
            'validation_manifest_sha256': sha(validation/'manifest.json'),
            'formal_identity': formal_id, 'selection_reason': reason, 'research_notes': delivery,
            'research_seal_sha256': sha(research/'routing-seal.json')
                if (research/'routing-seal.json').exists() else None,
            'research_policy_provenance': {'snapshot_binding': bm['binding'],
                'policy_sha256': digest(bm['policy']), 'formal_policy_binding': am['binding']}}
    if unavailable is not None:
        # Nothing has been assayed or called. Revert the entire comparison to
        # its original B workspaces, B policies and ordinary request/check path.
        for side, research in (('before', before), ('after', after)):
            route = routes[side]
            route.update(execution_mode='ordinary_fresh', validation_snapshot=str(research.resolve()),
                validation_binding=route['research_binding'],
                validation_manifest_sha256=sha(research/'manifest.json'), research_notes=None,
                selection_reason='fresh_B_context_delivery_unavailable', context_unavailable=unavailable)
            route['research_policy_provenance']['formal_policy_binding'] = route['research_binding']
    if path.exists() and read(path) != routes:
        raise Invalid('comparison routing changed; committed assays cannot be retargeted or replayed')
    if not path.exists():
        write(path, routes)
    return routes


def verify_delivery(delivery):
    if (not isinstance(delivery, dict) or set(delivery) != {'schema', 'path', 'sha256',
            'research_snapshot', 'research_policy_sha256', 'research_metadata_sha256'} or delivery['schema'] != SCHEMA):
        raise Invalid('unknown research notes delivery descriptor')
    path = Path(delivery['path'])
    if not path.is_absolute() or path.is_symlink() or not path.is_file() or sha(path) != delivery['sha256']:
        raise Invalid('research notes delivery bytes changed')
    value = read(path, max_bytes=MAX_DELIVERY_BYTES)
    if (value.get('schema') != SCHEMA or value.get('research_snapshot') != delivery['research_snapshot'] or
            digest(value.get('research_policy')) != delivery['research_policy_sha256'] or
            digest(value.get('research_metadata')) != delivery['research_metadata_sha256']):
        raise Invalid('research notes delivery provenance changed')
    return path


def validation_workspace(arm, source, manifest, model_workspace, target):
    """Rebuild exact A; copy only fresh adapter Lean sources, never B files."""
    before = inventory(model_workspace)
    if any(before.get(name) != hashed for name, hashed in manifest['files'].items()):
        raise Invalid('adapter altered A frozen sources')
    seed = read(arm.study/'seed/seed-files.json')
    for name in seed + ['contract.json']:
        expected = manifest['files'].get(name)
        expected_path = source/'source'/name if expected else arm.study/'seed'/name
        if sha(model_workspace/name) != sha(expected_path):
            raise Invalid('adapter altered A seed or contract')
    fresh = {name: hashed for name, hashed in before.items() if name not in manifest['files']
        and name not in seed and name.startswith('MathGKM/') and name.endswith('.lean')}
    identity = {'validation_binding': manifest['binding'], 'fresh_adapter_sources': fresh}
    marker = target.parent/(target.name+'.inputs.json')
    if marker.exists() and read(marker) != identity:
        raise Invalid('fresh adapter validation sources changed during recovery')
    if not marker.exists():
        if target.exists():
            raise Invalid('uncommitted validation workspace cannot be replayed')
        write(marker, identity)
        copy_seed(arm.study/'seed', target)
        for name in manifest['files']:
            path = target/name
            path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source/'source'/name, path)
        for name in fresh:
            path = target/name
            path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(_path(model_workspace, name), path)
    actual = inventory(target)
    expected = {**inventory(arm.study/'seed'), **manifest['files'], **fresh}
    if (actual != expected or
            any(actual.get(name) != hashed for name, hashed in manifest['files'].items()) or
            any(actual.get(name) != hashed for name, hashed in fresh.items())):
        raise Invalid('exact validation workspace changed')
    return target


def _request_context(request, *, legacy_routed=False):
    marker = request.get('snapshot_context_schema')
    if marker is None and not legacy_routed:
        return None  # Unversioned legacy keys retain their original semantics.
    if marker != CONTEXT_SCHEMA and not (marker is None and legacy_routed):
        raise Invalid('unknown versioned research context schema')
    delivery = request.get('research_notes')
    verify_delivery(delivery)
    route = request.get('snapshot_route', {})
    if (route.get('schema') != SCHEMA or
            (marker is not None and route.get('execution_mode') != 'dual_snapshot') or
            route.get('research_notes') != delivery or
            route.get('research_binding') != delivery['research_snapshot'] or
            route.get('validation_binding') != request.get('solver_binding') or
            not isinstance(request.get('validation_frozen_files'), dict)):
        raise Invalid('research/validation request identity changed')
    keys = ['research_notes', 'snapshot_route', 'validation_frozen_files', 'solver_binding', 'policy']
    if marker is not None:
        keys.append('snapshot_context_schema')
    return digest({key: request[key] for key in keys})


def request_context(request):
    """Versioned opt-in; independent of the current feature-enable gate."""
    return _request_context(request)


def verify_job_context(job, receipt=None):
    specpath = job/'spec.json'
    if not specpath.exists():
        return  # Existing legacy accounting semantics remain unchanged.
    spec = read(specpath)
    marker = spec.get('snapshot_context_schema')
    requestpath = job/'request.json'
    request = read(requestpath) if requestpath.exists() else {}
    request_marker = request.get('snapshot_context_schema')
    if 'research_context_binding' not in spec:
        if marker is not None or request_marker is not None:
            raise Invalid('missing retained versioned research context binding')
        return  # Arbitrary unversioned legacy keys do not opt into this feature.
    if marker is not None or request_marker is not None:
        if marker != CONTEXT_SCHEMA or request_marker != marker:
            raise Invalid('retained research context schema changed')
        expected = request_context(request)
    else:
        # Frozen prototype 888b jobs already explicitly marked their routed
        # identity with this spec binding. Preserve strict old-job verification
        # without reinterpreting an unmarked ordinary request's field names.
        expected = _request_context(request, legacy_routed=True)
    if (expected != spec['research_context_binding'] or
            spec.get('research_notes') != request.get('research_notes') or
            (receipt is not None and (receipt.get('research_context_binding') != expected or
                receipt.get('snapshot_context_schema') != marker))):
        raise Invalid('retained B research delivery/recovery identity changed')
