"""INACTIVE source-version transaction candidate; no action at import.

prepare/install/finalize are separate explicit operator actions. Installation
leaves a deliberate maintenance gap until a separately authorized genuine new
neutral deployment has succeeded. This module never launches mathematical work,
neutral compilers, or a model. Private backups are opaque and never public data.
"""
import argparse
import contextlib
import fcntl
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import stat
import sys
import time

ROOT = Path('/Users/sasha/math_gkm')
PARSER = ROOT/'.bootstrap/gaussian-native-operator-20261031/public_json_projection.py'
PARSER_SHA = '5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec'
ALLOWED_CHANGES = {'machinery/study_context.py', 'machinery/study_bridge.py'}
SCHEMA = 'math-gkm.prelaunch-revision-transaction.v1'
ARM_STATES = ('arms/baseline/state.json', 'arms/exploration/state.json')

class Hold(RuntimeError):
    pass

def need(value, message):
    if not value:
        raise Hold(message)

def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':'), ensure_ascii=False, allow_nan=False).encode()

def digest(value):
    return hashlib.sha256(canonical(value)).hexdigest()

def sha(path):
    result = hashlib.sha256()
    with regular(path).open('rb') as source:
        for block in iter(lambda: source.read(1024**2), b''):
            result.update(block)
    return result.hexdigest()

def regular(path):
    path = Path(path)
    need(path.is_absolute() and path.resolve(strict=True) == path and
         stat.S_ISREG(path.lstat().st_mode), 'unlinked absolute regular artifact required')
    return path

def raw(path, cap=64*1024**2):
    path = regular(path)
    need(path.stat().st_size <= cap, 'bounded artifact exceeded')
    return path.read_bytes()

def metadata(path):
    return json.loads(raw(path, 4*1024**2))

def sync(parent):
    fd = os.open(parent, os.O_RDONLY)
    try:
        os.fsync(fd)
    finally:
        os.close(fd)

def exclusive(path, data):
    path = Path(path)
    need(not path.exists() and not path.is_symlink(), 'fresh artifact required')
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open('xb') as out:
        out.write(data); out.flush(); os.fsync(out.fileno())
    path.chmod(0o400); sync(path.parent)
    return {'path': str(path), 'sha256': sha(path)}

def replace(path, data, expected):
    path = regular(path)
    need(sha(path) == expected, 'compare-and-swap artifact mismatch')
    temporary = path.with_name(path.name+'.revision-next')
    need(not temporary.exists() and not temporary.is_symlink(), 'unsettled replacement exists')
    mode = path.stat().st_mode & 0o777
    with temporary.open('xb') as out:
        out.write(data); out.flush(); os.fsync(out.fileno())
    temporary.chmod(mode)
    need(sha(path) == expected, 'artifact changed before replacement')
    os.replace(temporary, path); sync(path.parent)
    return sha(path)

def parser(config):
    row = config['projection']
    need(sha(row['path']) == row['sha256'] == PARSER_SHA, 'projection source differs')
    spec = importlib.util.spec_from_file_location('revision_public_projection', row['path'])
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    return module

def object_bytes(fields):
    return b'{'+b','.join(canonical(key)+b':'+fields[key] for key in sorted(fields))+b'}'

def state_fields(data, projection):
    envelope = projection.fields(data.strip()); body = envelope['state']
    need(projection.select(envelope, ('sha256',))['sha256'] == hashlib.sha256(body).hexdigest(),
         'state envelope integrity differs')
    return projection.fields(body)

def rebind_state(data, before_seal, after_seal, projection):
    fields = state_fields(data, projection)
    need(projection.select(fields, ('seal_hash',))['seal_hash'] == before_seal,
         'old state/seal binding differs')
    original = dict(fields); fields['seal_hash'] = canonical(after_seal)
    need({k:v for k,v in fields.items() if k != 'seal_hash'} ==
         {k:v for k,v in original.items() if k != 'seal_hash'}, 'non-seal state modification')
    body = object_bytes(fields)
    return object_bytes({'state': body, 'sha256': canonical(hashlib.sha256(body).hexdigest())})+b'\n'

def patch_object(data, changes, projection):
    fields = projection.fields(data.strip()); original = dict(fields)
    fields.update({key: canonical(value) for key, value in changes.items()})
    need({k:v for k,v in fields.items() if k not in changes} ==
         {k:v for k,v in original.items() if k not in changes}, 'unlisted metadata modification')
    return object_bytes(fields)+b'\n'

def source_vector(root):
    names = sorted((root/'machinery').glob('*.py')) + sorted((root/'MathGKM').glob('*.lean'))
    names += [root/'config/study-base-permissions.json']
    return {str(path.relative_to(root)): sha(path) for path in names}

def pointer(config, row):
    path = regular(row['path'])
    need(path.is_relative_to(Path(config['root'])/'.bootstrap') and sha(path) == row['sha256'],
         'protected evidence pointer differs')
    return path

def load_config(path, pin):
    path = regular(path)
    need(sha(path) == pin, 'transaction configuration differs')
    c = metadata(path)
    need(c.get('schema') == SCHEMA and c.get('authorized') is True, 'reviewed explicit transaction required')
    root = Path(c['root']); study = Path(c['study'])
    need(root == ROOT and root.resolve() == root and study.resolve() == study and
         study.is_relative_to(root/'.scratch/studies') and
         Path(c['authority']) == root/'.bootstrap/study-authorization.json', 'transaction scope differs')
    need(c['arm'] in ('baseline', 'exploration') and type(c['logical_round']) is int and
         c['failed_request_id'] == f"plan-{c['logical_round']:04d}" and
         c['next_request_id'] == c['failed_request_id']+'-repair-1', 'unique logical repair differs')
    old, new = c['old_implementation'], c['implementation']
    changed = {name for name in old if old[name] != new.get(name)}
    need(set(old) == set(new) and changed == set(c['changes']) and changed and
         changed <= ALLOWED_CHANGES, 'unreviewed native/Lean/guard source changes')
    for name, row in c['changes'].items():
        need(old[name] == row['old_sha256'] and new[name] == row['sha256'] and
             sha(pointer(c, row)) == new[name], 'candidate source pin differs')
    for row in c['evidence'].values():
        pointer(c, row)
    observation = metadata(pointer(c, c['evidence']['observation']))
    need(observation.get('schema') == 'math-gkm.closed-prelaunch-proposer-observation.v1' and
         all(observation.get(key) == c[key] for key in ('study','arm','logical_round','failed_request_id')) and
         observation.get('old_implementation_sha256') == digest(old) and
         observation.get('watchdog_popen_reached') is False and observation.get('model_started') is False and
         observation.get('cleanup_verified') is True, 'closed prelaunch observation differs')
    for key, successful in (('old_owner_exit',False),('old_native_exit',False),('native_recovery_exit',True)):
        event = observation.get(key,{})
        need(event.get('actual_numeric_exit_observed') is True and type(event.get('returncode')) is int and
             (event['returncode'] == 0) == successful and isinstance(event.get('completion_reference'),str) and
             bool(event['completion_reference'].strip()), 'actual closed owner/native/recovery evidence required')
    q = metadata(pointer(c, c['evidence']['qualification']))
    need(q.get('accepted') is True and q.get('implementation_sha256') == digest(new) and
         q.get('independent_source_review') is True and q.get('tests_passed') is True,
         'changed native source needs its own completed source qualification')
    need(c.get('scientific_status') == 'revised_source_history_no_causal_learning_claim',
         'revised comparison provenance required')
    parser(c)
    return c

@contextlib.contextmanager
def locked(c):
    study = Path(c['study']); root = Path(c['root'])
    handles = []
    try:
        for path in (study/'controller.lock', root/'.scratch/resources/heavy.lock'):
            need(path.parent.resolve() == path.parent, 'lock path escaped')
            handle = path.open('a'); handles.append(handle)
            try:
                fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError:
                raise Hold('controller or heavy work is not quiescent')
        need(not (root/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists(), 'cleanup hold is unresolved')
        yield
    finally:
        for handle in reversed(handles):
            fcntl.flock(handle, fcntl.LOCK_UN); handle.close()

# Executes only receipt verification / own metadata calculations in a fresh
# exact-source native interpreter. No check_task, compiler or model entry point.
NATIVE_PROGRAM = r'''
import json,sys
from pathlib import Path
root=Path(sys.argv[1]);sys.path.insert(0,str(root))
from machinery import study,study_common as common,study_context
from machinery.study_deployment import reuse_deployment
studyroot=Path(sys.argv[2]);operation=sys.argv[3];expected=sys.argv[4]
assert common.digest(common.implementation())==expected
if operation=='verify':
 study.verify(studyroot)
 rows={}
 for mode in ('baseline','exploration'):
  s=common.load_state(studyroot/'arms'/mode/'state.json');r=s['research']
  assert not s.get('active') and not s.get('active_intent')
  records=list(r.get('knowledge',{}).values())+list(r.get('components',{}).values())
  rows[mode]={'accepted_count':len(records),'accepted_binding':common.digest(records),'research_binding':common.digest(r),'workspace_binding':common.digest(common.inventory(studyroot/'arms'/mode/'workspace'))}
 print(common.canonical({'verified':True,'arms':rows,'contract_sha256':common.digest(common.read(studyroot/'seed/contract.json')),'protocol_sha256':common.sha(studyroot/'protocol.json')}))
elif operation=='material':
 mode=sys.argv[5];key=sys.argv[6];armroot=studyroot/'arms'/mode;s=common.load_state(armroot/'state.json');job=armroot/'jobs'/key
 assert not s.get('active') and not s.get('active_intent')
 print(common.canonical({'request_binding':common.digest(common.read(job/'request.json')),'receipt_binding':common.digest(common.read(job/'receipt.json')),'recovery_projection_sha256':common.digest(study_context.prelaunch_recovery_projection(s)),'workspace_binding':common.digest(common.inventory(armroot/'workspace'))}))
elif operation=='deployment':
 binding=common.read(Path(sys.argv[5]));reuse_deployment(binding)
 print(common.canonical({'verified':True,'binding':binding,'implementation_sha256':expected}))
elif operation=='evidence':
 grant=common.read(Path(sys.argv[5]));checked=study_context.validate_prelaunch_evidence(grant)
 print(common.canonical({'verified':True,'evidence':checked}))
else:raise ValueError('unknown native operation')
'''

class Native:
    def __init__(self, c, output):
        self.c, self.output = c, Path(output)
    def invoke(self, operation, implementation, *arguments):
        # Existing bounded runner and its resource guard are unchanged; this
        # operator holds the heavy lease and the child uses tree_only=True.
        sys.path.insert(0, self.c['root'])
        from machinery.process import run
        directory = self.output/'native-verification'/f'{time.time_ns()}-{operation}'
        directory.mkdir(parents=True)
        env = dict(os.environ, PYTHONDONTWRITEBYTECODE='1', TMPDIR=str(directory))
        argv = ['/opt/homebrew/bin/python3', '-B', '-c', NATIVE_PROGRAM,
                self.c['root'], self.c['study'], operation, digest(implementation), *map(str, arguments)]
        result = run(argv, cwd=Path(self.c['root']), env=env, timeout=1800,
                     output_bytes=65536, scope=directory, tree_only=True)
        exclusive(directory/'OPERATION.json', canonical(result)+b'\n')
        need(result.get('returncode') == 0 and not result.get('termination') and
             not result.get('operationally_incomplete'), 'native verification did not finish')
        value = json.loads(result['stdout'])
        need(isinstance(value, dict), 'native verification summary differs')
        return value
    def verify(self, implementation):
        return self.invoke('verify', implementation)
    def material(self, implementation):
        return self.invoke('material', implementation, self.c['arm'], self.c['failed_request_id'])
    def deployment(self, implementation, binding_path):
        return self.invoke('deployment', implementation, binding_path)
    def evidence(self, implementation, grant_path):
        return self.invoke('evidence', implementation, grant_path)

def before_paths(c):
    study = Path(c['study']); root = Path(c['root'])
    required = {str(study/'seal.json'), str(study/'protocol.json'), str(study/'seed/contract.json'),
                str(root/'.bootstrap/study-authorization.json')}
    required.update(str(study/name) for name in ARM_STATES)
    job = study/'arms'/c['arm']/'jobs'/c['failed_request_id']
    required.update(str(job/name) for name in ('spec.json', 'request.json', 'prompt.txt', 'receipt.json'))
    need(required <= c['before_files'].keys(), 'required original opaque artifact pins missing')
    result = dict(c['before_files'])
    # The original neutral deployment is retained under its original identity.
    # This is neutral infrastructure metadata, never a research-role payload.
    projection = parser(c)
    seal_fields = projection.fields(raw(study/'seal.json', 8*1024**2).strip())
    deployment = projection.select(seal_fields, ('deployment_preflight',)).get('deployment_preflight')
    need(isinstance(deployment,dict) and deployment.get('ready') is True, 'old genuine deployment binding required')
    receipt_path = regular(deployment['receipt'])
    need(receipt_path.is_relative_to(root) and sha(receipt_path) == deployment['receipt_sha256'],
         'old deployment receipt changed')
    receipt = metadata(receipt_path)
    result[str(receipt_path)] = deployment['receipt_sha256']
    for name, hashed in receipt['files'].items():
        path = regular(receipt_path.parent/name)
        need(path.is_relative_to(receipt_path.parent), 'old neutral deployment escaped')
        result[str(path)] = hashed
    result.update({str(root/name): value for name, value in c['old_implementation'].items()})
    for name, hashed in result.items():
        need(regular(name).is_relative_to(root) and re.fullmatch('[0-9a-f]{64}', hashed), 'original pin scope differs')
    return result

def repin(expected):
    need(all(sha(name) == hashed for name, hashed in expected.items()), 'preserved file changed')

def save_phase(output, phase, **fields):
    path = Path(output)/'TRANSACTION.json'; value = {'schema': SCHEMA, 'phase': phase, 'updated_at': time.time(), **fields}
    data = canonical(value)+b'\n'
    if path.exists():
        replace(path, data, sha(path))
    else:
        exclusive(path, data)
    return value

def read_stage(c, pin, output, phase):
    output = Path(output)
    need(output.is_absolute() and output.resolve() == output and
         output.is_relative_to(Path(c['root'])/'.bootstrap'), 'private transaction output scope differs')
    stage = metadata(output/'TRANSACTION.json')
    need(stage.get('config_sha256') == pin and stage.get('phase') == phase,
         'transaction is not at the explicit requested phase')
    return stage

def prepare(config_path, config_pin, output, native_factory=Native):
    c = load_config(config_path, config_pin); output = Path(output)
    need(output.is_absolute() and output.parent.resolve() == output.parent and
         output.is_relative_to(Path(c['root'])/'.bootstrap') and not output.exists(), 'fresh private output required')
    projection = parser(c)
    with locked(c):
        expected = before_paths(c); repin(expected)
        authority = metadata(c['authority'])
        need(authority.get('implementation_sha256') == digest(c['old_implementation']) and
             authority.get('user_explicit_ok') is True and
             authority.get('contract_sha256') == c['contract_sha256'],
             'original authority does not bind the old source and unchanged exact contract')
        need(source_vector(Path(c['root'])) == c['old_implementation'], 'original implementation differs')
        seal_data = raw(Path(c['study'])/'seal.json'); seal_fields = projection.fields(seal_data.strip())
        seal = projection.select(seal_fields, ('implementation',))
        need(seal['implementation'] == c['old_implementation'], 'old seal implementation differs')
        oldseal = hashlib.sha256(object_bytes(seal_fields)).hexdigest()
        for name in ARM_STATES:
            fields = state_fields(raw(Path(c['study'])/name), projection)
            need(fields.get('active', b'null') == b'null' and fields.get('active_intent', b'null') == b'null' and
                 projection.select(fields, ('seal_hash',))['seal_hash'] == oldseal,
                 'unsettled work or old seal mismatch')
        output.mkdir(mode=0o700)
        exclusive(output/'CONFIG.json', raw(config_path))
        backups = {}
        for name, hashed in expected.items():
            relative = Path(name).relative_to(c['root'])
            backups[name] = exclusive(output/'before'/relative, raw(name))
            need(backups[name]['sha256'] == hashed, 'opaque archive differs')
        summary = native_factory(c, output).verify(c['old_implementation'])
        need(summary.get('verified') is True and summary.get('contract_sha256') == c['contract_sha256'],
             'old exact proof/source verification failed')
        repin(expected)
        manifest = {'schema': SCHEMA, 'config_sha256': config_pin, 'expected': expected,
                    'backups': backups, 'old_verification': summary,
                    'scientific_status': c['scientific_status'], 'paid_launches': 0}
        exclusive(output/'PREPARED.json', canonical(manifest)+b'\n')
        return save_phase(output, 'prepared', config_sha256=config_pin, prepared_sha256=sha(output/'PREPARED.json'))

def prepared(c, pin, output, phase):
    stage = read_stage(c, pin, output, phase); record = metadata(Path(output)/'PREPARED.json')
    need(sha(Path(output)/'PREPARED.json') == stage['prepared_sha256'] and
         record['config_sha256'] == pin, 'prepared opaque archive manifest differs')
    for name, row in record['backups'].items():
        need(sha(row['path']) == row['sha256'] == record['expected'][name], 'original archive changed')
    return stage, record

def installed_writes(c, stage):
    """The stage cannot expand the reviewed source-only mutable path set."""
    expected = {str(Path(c['root'])/name): row['sha256'] for name,row in c['changes'].items()}
    need(stage.get('own_writes') == expected, 'maintenance stage widens or changes configured source writes')
    return expected


def rollback_writes(c, output, record, writes):
    # A foreign write prevents ALL rollback. Never overwrite unsettled work or
    # infer a closed child from a missing lock. This tool has launched no work.
    need(all(sha(name) == value for name, value in writes.items()), 'foreign divergence; explicit reconciliation required')
    for name in reversed(list(writes)):
        replace(name, raw(record['backups'][name]['path']), writes[name])
    repin(record['expected'])

def install(config_path, config_pin, output, native_factory=Native):
    c = load_config(config_path, config_pin); output = Path(output)
    with locked(c):
        stage, record = prepared(c, config_pin, output, 'prepared'); repin(record['expected'])
        need(source_vector(Path(c['root'])) == c['old_implementation'], 'old source vector differs')
        need(native_factory(c, output).verify(c['old_implementation']) == record['old_verification'],
             'old admitted knowledge changed')
        writes = {}
        save_phase(output, 'install_intent', config_sha256=config_pin, prepared_sha256=stage['prepared_sha256'])
        try:
            for name, row in c['changes'].items():
                path = str(Path(c['root'])/name)
                writes[path] = replace(path, raw(row['path']), record['expected'][path])
            need(source_vector(Path(c['root'])) == c['implementation'], 'installed new source vector differs')
        except BaseException:
            try:
                rollback_writes(c, output, record, writes)
                save_phase(output, 'install_failed_rolled_back', config_sha256=config_pin, prepared_sha256=stage['prepared_sha256'])
            except BaseException:
                save_phase(output, 'needs_reconciliation', config_sha256=config_pin, prepared_sha256=stage['prepared_sha256'])
            raise
        return save_phase(output, 'source_installed_maintenance', config_sha256=config_pin,
                          prepared_sha256=stage['prepared_sha256'], own_writes=writes,
                          old_deployment_preserved=True, research_launches=0,
                          required_next='separately authorized genuine new exact-source deployment preflight')

@contextlib.contextmanager
def maintenance_fence(config_path, config_pin, output):
    """Fence the old study around a separately authorized native preflight.

    This helper launches nothing and holds NO heavy lease. Its external caller
    must itself be reviewed/pinned and invoke only the genuine bounded neutral
    deployment command, retaining that command's actual closed exit evidence.
    The current study remains non-admitting through its old seal/source mismatch.
    """
    c = load_config(config_path, config_pin); output = Path(output)
    stage, record = prepared(c, config_pin, output, 'source_installed_maintenance')
    expected = {**record['expected'], **installed_writes(c, stage)}
    path = Path(c['study'])/'controller.lock'
    with path.open('a') as handle:
        try:
            fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            raise Hold('controller is not quiescent for neutral deployment')
        try:
            repin(expected)
            need(source_vector(Path(c['root'])) == c['implementation'], 'new source changed before neutral deployment')
            need(not (Path(c['root'])/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists(), 'cleanup hold is unresolved')
            yield
            repin(expected)
            need(source_vector(Path(c['root'])) == c['implementation'], 'new source changed during neutral deployment')
        finally:
            fcntl.flock(handle, fcntl.LOCK_UN)


def finalize(config_path, config_pin, output, deployment_path, deployment_pin, native_factory=Native):
    c = load_config(config_path, config_pin); output = Path(output); projection = parser(c)
    with locked(c):
        stage, record = prepared(c, config_pin, output, 'source_installed_maintenance')
        expected = {**record['expected'], **installed_writes(c, stage)}; repin(expected)
        need(source_vector(Path(c['root'])) == c['implementation'], 'new implementation differs')
        need(sha(deployment_path) == deployment_pin, 'fresh deployment input pin differs')
        binding = metadata(deployment_path)
        native = native_factory(c, output)
        deployed = native.deployment(c['implementation'], deployment_path)
        need(deployed.get('verified') is True and deployed.get('binding') == binding and
             deployed.get('implementation_sha256') == digest(c['implementation']), 'new exact-source deployment not established')
        material = native.material(c['implementation'])
        study = Path(c['study']); armroot = study/'arms'/c['arm']; job = armroot/'jobs'/c['failed_request_id']
        identities = {key: c[key] for key in ('study','arm','logical_round','failed_request_id','next_request_id')}
        identities.update(request_binding=material['request_binding'], receipt_binding=material['receipt_binding'],
            receipt_file_sha256=sha(job/'receipt.json'), spec_sha256=sha(job/'spec.json'), prompt_sha256=sha(job/'prompt.txt'),
            protocol_sha256=sha(study/'protocol.json'), old_implementation_sha256=digest(c['old_implementation']),
            implementation_sha256=digest(c['implementation']), old_seal_sha256=sha(study/'seal.json'),
            stopped_state_sha256=record['expected'][str(armroot/'state.json')],
            recovery_projection_sha256=material['recovery_projection_sha256'], workspace_binding=material['workspace_binding'])
        core = {'schema':'math-gkm.prelaunch-source-revision.v1', **identities,
                'prelaunch_observation_sha256':c['evidence']['observation']['sha256'],
                'old_implementation':c['old_implementation'], 'implementation':c['implementation'],
                'old_files':record['backups'], 'old_seal':record['backups'][str(study/'seal.json')],
                'preserved_files':record['expected'],
                'qualification':c['evidence']['qualification'], 'new_deployment':binding,
                'old_verification':record['old_verification'], 'scientific_status':c['scientific_status'],
                'historical_snapshots':'unchanged; cross-version routing falls back to fresh exact B',
                'host_refinement':'open; source-version repair is not a certified Goedel self-change'}
        grant = {'schema':'math-gkm.closed-prelaunch-proposer-recovery.v1', **identities,
                 'prelaunch_observation':c['evidence']['observation'],
                 'classification':'closed_protocol_guard_failure_before_watchdog',
                 'no_model_started':True, 'native_cleanup_verified':True,
                 'revision_core':core, 'revision_binding':digest(core)}
        grant_row = exclusive(output/'GRANT.json', canonical(grant)+b'\n')
        need(native.evidence(c['implementation'], grant_row['path']).get('verified') is True,
             'pure source-bound prelaunch evidence validation failed')
        seal_data = raw(study/'seal.json'); old_seal = json.loads(seal_data)
        seal_changes = {'implementation':c['implementation'], 'deployment_preflight':binding,
                        'source_revision':{'record':grant_row['path'], 'binding':digest(core),
                                           'old_seal_sha256':identities['old_seal_sha256']}}
        new_seal_data = patch_object(seal_data, seal_changes, projection)
        new_seal_hash = digest(json.loads(new_seal_data))
        images = {str(study/'seal.json'):new_seal_data}
        for name in ARM_STATES:
            images[str(study/name)] = rebind_state(raw(study/name), digest(old_seal), new_seal_hash, projection)
        authority = c['authority']
        authority_data = patch_object(raw(authority), {'implementation_sha256':digest(c['implementation']),
                                                        'prelaunch_recovery':grant_row}, projection)
        writes = installed_writes(c, stage)
        save_phase(output, 'finalize_intent', config_sha256=config_pin, prepared_sha256=stage['prepared_sha256'],
                   grant=grant_row, expected_after={**{name:hashlib.sha256(data).hexdigest() for name,data in images.items()},
                                                    authority:hashlib.sha256(authority_data).hexdigest()})
        try:
            repin(expected)
            for name, data in images.items():
                writes[name] = replace(name, data, record['expected'][name])
            verified = native.verify(c['implementation'])
            need(verified == record['old_verification'], 'new source failed genuine old proof/source reuse')
            repin({**record['expected'], **writes})
            need(source_vector(Path(c['root'])) == c['implementation'], 'new source changed during final verification')
            # Verification needs no live authorization. Keep the old source-bound
            # authority non-admitting until proof reuse and every final CAS pass.
            writes[authority] = replace(authority, authority_data, record['expected'][authority])
            repin({**record['expected'], **writes})
        except BaseException:
            try:
                rollback_writes(c, output, record, writes)
                save_phase(output, 'finalize_failed_rolled_back', config_sha256=config_pin, prepared_sha256=stage['prepared_sha256'],
                           grant=grant_row, paid_launches=0)
            except BaseException:
                save_phase(output, 'needs_reconciliation', config_sha256=config_pin, prepared_sha256=stage['prepared_sha256'], grant=grant_row)
            raise
        finished = {'schema':SCHEMA, 'phase':'finalized_not_launched', 'config_sha256':config_pin,
                    'prepared_sha256':stage['prepared_sha256'], 'grant':grant_row,
                    'implementation_sha256':digest(c['implementation']), 'after_files':writes,
                    'proof_reuse_verification':verified, 'scientific_status':c['scientific_status'],
                    'research_launches':0, 'compiler_launches':0, 'model_launches':0}
        exclusive(output/'FINISHED.json', canonical(finished)+b'\n')
        return save_phase(output, 'finalized_not_launched', **{k:v for k,v in finished.items() if k not in ('schema','phase')})

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('action',choices=('prepare','install','finalize'))
    p.add_argument('--config',type=Path,required=True);p.add_argument('--config-sha256',required=True)
    p.add_argument('--output',type=Path,required=True);p.add_argument('--source-sha256',required=True)
    p.add_argument('--deployment',type=Path);p.add_argument('--deployment-sha256')
    a=p.parse_args()
    need(sha(__file__)==a.source_sha256,'operator source pin differs')
    args=(a.config,a.config_sha256,a.output)
    if a.action=='finalize':
        need(a.deployment is not None and a.deployment_sha256 is not None,'genuine new deployment required')
        value=finalize(*args,a.deployment,a.deployment_sha256)
    else:value={'prepare':prepare,'install':install}[a.action](*args)
    print(json.dumps({'phase':value['phase'],'research_launches':0,'compiler_launches':0,'model_launches':0}))

if __name__=='__main__':
    main()
