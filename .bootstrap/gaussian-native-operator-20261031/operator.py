"""One owned first epoch around unchanged native freeze/run; no continuation."""
import sys
# This requested filename must not shadow Python's standard operator module.
sys.path = [p for p in sys.path if p != __file__.rsplit('/',1)[0]]
import argparse
import fcntl
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import selectors
import signal
import stat
import subprocess
import time

ROOT = Path('/Users/sasha/math_gkm')
PYTHON = '/opt/homebrew/bin/python3'
SCHEMA = 'math-gkm.gaussian-native-first-epoch-operator.v1'
PARSER_SHA = '5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec'
PROTOCOL_SHA = 'ad4732179397465e18035e5071d560da3cd06ac24af4d07ca1f22e112585e136'
REVIEWERS = ['/root', '/root/resume34_review']
STATE_KEYS = ('round','phase','status','calls','meta_calls','seconds','failures','policy_trials')
STOPPING = False


def need(ok, message):
    if not ok:
        raise RuntimeError(message)


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1024**2), b''):
            h.update(block)
    return h.hexdigest()


def raw(path, cap=32*1024**2):
    p = Path(path)
    info = p.lstat()
    need(stat.S_ISREG(info.st_mode) and info.st_nlink == 1 and not p.is_symlink(), 'regular unaliased input required')
    need(info.st_size <= cap, 'bounded input required')
    with p.open('rb') as f:
        data = f.read(cap+1)
    need(len(data) <= cap, 'bounded input required')
    return data.strip()


def write(path, value, *, exclusive=False):
    path = Path(path)
    body = (json.dumps(value, sort_keys=True, separators=(',', ':'))+'\n').encode()
    if exclusive:
        with path.open('xb') as f:
            os.fchmod(f.fileno(), 0o600); f.write(body); f.flush(); os.fsync(f.fileno())
    else:
        temporary = path.with_name(path.name+'.next')
        with temporary.open('wb') as f:
            os.fchmod(f.fileno(), 0o600); f.write(body); f.flush(); os.fsync(f.fileno())
        os.replace(temporary, path)
    fd = os.open(path.parent, os.O_RDONLY)
    try: os.fsync(fd)
    finally: os.close(fd)


def parser():
    path = Path(__file__).with_name('public_json_projection.py')
    need(sha(path) == PARSER_SHA, 'public projection source differs')
    spec = importlib.util.spec_from_file_location('gaussian_public_projection', path)
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    return module


def project_state(path):
    """Only public scalars/nullness; arbitrary reason and research stay raw."""
    e = parser()
    envelope = e.fields(raw(path))
    body = envelope['state']
    need(json.loads(envelope['sha256']) == hashlib.sha256(body).hexdigest(), 'state integrity differs')
    fields = e.fields(body)
    result = e.select(fields, STATE_KEYS)
    need(type(result.get('round')) is int and type(result.get('calls')) is int and
         type(result.get('meta_calls')) is int, 'public state counters differ')
    need(result.get('phase') in ('research','review'), 'unknown public phase')
    allowed = ('ready','running','stopped','operationally_blocked','bounded_or_blocked',
               'finite_budget_finished; root_open','mathematically_resolved')
    need(result.get('status') in allowed, 'unknown public status')
    for name in ('active','active_intent','resolution'):
        result[name+'_is_null'] = fields.get(name, b'null') == b'null'
    result['state_sha256'] = hashlib.sha256(body).hexdigest()
    result['file_sha256'] = sha(path)
    return result


def pin(row):
    need(set(row) == {'path','sha256'}, 'exact path/hash descriptor required')
    p = Path(row['path'])
    need(p.is_absolute() and p.is_relative_to(ROOT) and not p.is_symlink(), 'durable native input required')
    need(type(row['sha256']) is str and len(row['sha256']) == 64 and sha(p) == row['sha256'], 'input hash differs')
    return p


def load(path, expected):
    path = Path(path)
    need(sha(path) == expected, 'configuration hash differs')
    c = json.loads(raw(path, 1024**2))
    need(c.get('schema') == SCHEMA and c.get('authorized') is True and
         c.get('reviewers') == REVIEWERS and c.get('epoch_limit') == 1, 'reviewed one-epoch configuration required')
    need(c.get('model') == 'gpt-6.1-sol' and c.get('reasoning_effort') == 'high', 'reviewed model required')
    need(c.get('protocol',{}).get('sha256') == PROTOCOL_SHA, 'exact first-epoch protocol required')
    need(c.get('operator') == {'path': str(Path(__file__)), 'sha256': sha(__file__)}, 'operator source differs')
    for name in ('authorized_at','start_before','deadline_wall','cleanup_seconds','setup_seconds'):
        need(type(c.get(name)) in (int,float) and math.isfinite(c[name]), 'finite configured clock required')
    need(c['authorized_at'] <= time.time() < c['start_before'] < c['deadline_wall'] and
         c['cleanup_seconds'] >= 1900 and c['setup_seconds'] >= 1800, 'fresh launch/cleanup window required')
    need(c['deadline_wall']-time.time() >= 270000+7740+c['setup_seconds']+c['cleanup_seconds'], 'complete first-epoch wall allowance required')
    c['_config_sha256'] = expected
    c['_config_path'] = str(path)
    c['_deadline_monotonic'] = time.monotonic()+c['deadline_wall']-time.time()
    return c


def source_checks(c):
    for name in ('protocol','contract','curation_suite','curation_provenance','curation_receipt',
                 'semantic_review','authorization'):
        pin(c[name])
    need(Path(c['authorization']['path']) == ROOT/'.bootstrap/study-authorization.json', 'native authority path required')
    from machinery.study_common import implementation, digest
    need(digest(implementation()) == c['implementation_sha256'], 'native implementation differs')
    parser()


def startup(c):
    source_checks(c)
    study = Path(c['study'])
    runtime = Path(c['runtime'])
    need(study == ROOT/'.scratch/studies/gaussian-quotient-concept-20261031' and
         runtime == ROOT/'.bootstrap/gaussian-native-operator-20261031/RUN', 'fresh fixed campaign namespace required')
    need(not study.exists() and not study.is_symlink() and not runtime.exists() and not runtime.is_symlink(), 'one-use namespace already exists')
    # Decode task kinds only. Native freeze validates the complete private suite
    # and genuine curator receipt; no task content is decoded by this owner.
    e = parser(); tasks = e.fields(raw(c['curation_suite']['path']))['tasks']
    need(tasks[:1] == b'[' and tasks[-1:] == b']', 'native task array required')
    kinds = []; cursor = 1
    while cursor < len(tasks)-1:
        need(len(kinds) < 2, 'exact two-task panel required')
        end = e._end(tasks,cursor)
        kinds.append(e.select(e.fields(tasks[cursor:end]), ('kind',)).get('kind'))
        cursor = end
        if cursor < len(tasks)-1:
            need(tasks[cursor:cursor+1] == b',', 'canonical task array required'); cursor += 1
    need(sorted(kinds) == ['holdout','regression'], 'exact one-plus-one panel required; no truncation')
    need(Path(c['curation_provenance']['path']) == Path(c['curation_suite']['path']).parent/'provenance.json', 'native CLI provenance location differs')
    need(not (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists(), 'native cleanup hold exists')
    runtime.mkdir(parents=True, mode=0o700)
    return runtime


def state_path(c):
    return Path(c['study'])/'arms/exploration/state.json'


def publish(c, phase, child=None, **extra):
    value = {'schema': SCHEMA, 'configuration_sha256': c['_config_sha256'],
             'phase': phase, 'observed_at': time.time(), 'model': c['model'], 'arm': 'exploration',
             'controller_owned_poll': child.poll() if child is not None else None,
             'status_file_is_timestamped_observation_not_live_handle': True,
             'deadline_wall': c['deadline_wall'], 'epoch2_qualified': False, **extra}
    p = state_path(c)
    if p.is_file():
        try: value['state'] = project_state(p)
        except (OSError,ValueError,KeyError,RuntimeError): value['state_projection_unavailable'] = True
    write(Path(c['runtime'])/'STATUS.json', value)


def request_stop(c, reason):
    study = Path(c['study'])
    if study.is_dir() and not (study/'STOP.json').exists():
        write(study/'STOP.json', {'requested': time.time(), 'operational_reason': reason}, exclusive=True)


def spawn(argv, **kwargs):
    return subprocess.Popen(argv, **kwargs)


def drive(c, name, argv, *, keeper=None):
    """Only actual owned handles; native leaves retain their own heavy lease."""
    runtime = Path(c['runtime'])
    child = spawn(argv, cwd=ROOT, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
                  stderr=subprocess.PIPE, start_new_session=True, close_fds=True)
    selector = selectors.DefaultSelector()
    for stream in (child.stdout, child.stderr):
        os.set_blocking(stream.fileno(), False); selector.register(stream, selectors.EVENT_READ)
    stopped_at = None; terminated = killed = False; total = 0; observation = 0
    try:
        with (runtime/(name+'.raw.log')).open('xb', buffering=0) as log:
            os.fchmod(log.fileno(), 0o600)
            while child.poll() is None:
                now = time.monotonic()
                if STOPPING or (runtime/'STOP.json').exists() or (Path(c['study'])/'STOP.json').exists() or now >= c['_deadline_monotonic']-c['cleanup_seconds']:
                    if stopped_at is None: stopped_at = now; request_stop(c, 'owned_operator_stop')
                if keeper is not None and keeper.poll() is not None:
                    stopped_at = stopped_at or now; request_stop(c, 'owned_keeper_exited')
                if stopped_at is not None and now >= min(stopped_at+c['cleanup_seconds']-10,c['_deadline_monotonic']-10) and not terminated:
                    child.terminate(); terminated = True
                if now >= c['_deadline_monotonic'] or (stopped_at is not None and now >= stopped_at+c['cleanup_seconds']):
                    if not killed: child.kill(); killed = True
                wait_end = c['_deadline_monotonic']+5
                if stopped_at is not None: wait_end = min(wait_end,stopped_at+c['cleanup_seconds']+5)
                if killed and now >= wait_end:
                    raise RuntimeError('owned numeric wait unresolved')
                for key,_ in selector.select(0.2):
                    data = os.read(key.fileobj.fileno(), 65536)
                    if not data: selector.unregister(key.fileobj); continue
                    left = 16*1024**2-total
                    log.write(data[:max(0,left)]); total += len(data)
                    if total > 16*1024**2:
                        stopped_at = stopped_at or time.monotonic(); request_stop(c, 'private_cli_output_bound')
                if now-observation >= 5:
                    publish(c, name, child, stopped=stopped_at is not None); observation = now
            # The child is numeric-terminal; drain only immediately available bytes.
            for key in list(selector.get_map().values()):
                while True:
                    try: data = os.read(key.fileobj.fileno(), 65536)
                    except BlockingIOError: break
                    if not data: break
                    left = 16*1024**2-total; log.write(data[:max(0,left)]); total += len(data)
            result = child.wait(timeout=0)
            need(type(result) is int, 'actual owned numeric wait required')
        write(runtime/(name+'_EXIT.json'), {'schema': SCHEMA, 'configuration_sha256': c['_config_sha256'],
              'returncode': result, 'actual_numeric_wait_completed': True, 'owned_handle': True,
              'terminate_sent': terminated, 'kill_sent': killed, 'raw_log_sha256': sha(runtime/(name+'.raw.log')),
              'raw_bytes_observed': total, 'raw_log_truncated': total > 16*1024**2}, exclusive=True)
        return result, killed or stopped_at is not None or total > 16*1024**2
    finally:
        selector.close()
        if child.poll() is None:
            request_stop(c, 'owner_exception')
            child.terminate()
            try: child.wait(timeout=5)
            except subprocess.TimeoutExpired:
                child.kill()
                try: child.wait(timeout=5)
                except subprocess.TimeoutExpired: pass
        child.stdout.close(); child.stderr.close()


def idle(c):
    study = Path(c['study'])
    with (study/'controller.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX|fcntl.LOCK_NB)
        s = project_state(state_path(c))
        need(s['active_is_null'] and s['active_intent_is_null'], 'native effects remain active')
        e = parser(); envelope = e.fields(raw(state_path(c))); fields = e.fields(envelope['state'])
        receipts = json.loads(fields['receipts']); hashes = json.loads(fields['receipt_hashes'])
        need(type(receipts) is list and len(receipts) <= 10000 and len(receipts) == len(set(receipts)), 'bounded unique receipt paths required')
        jobs = study/'arms/exploration/jobs'
        if jobs.exists():
            entries = list(jobs.iterdir()); need(len(entries) <= 10000, 'bounded jobs required')
            for job in entries:
                need(job.is_dir() and not job.is_symlink() and receipts.count(str(job)) == 1, 'unsettled native job remains')
                receipt = job/'receipt.json'
                need(hashes.get(str(job)) == hashlib.sha256(raw(receipt)).hexdigest(), 'native receipt hash differs')
        need(not (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists(), 'native cleanup hold remains')
        return s


def run(c):
    runtime = startup(c)
    write(runtime/'OPERATOR_INTENT.json', {'schema': SCHEMA, 'configuration_sha256': c['_config_sha256'],
          'automatic_retry': False, 'epoch_limit': 1}, exclusive=True)
    keeper = None; closed = False; result = 1; final = 'needs_reconciliation'; run_started = False
    try:
        keeper = spawn(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())], stdin=subprocess.DEVNULL,
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, close_fds=True)
        publish(c, 'freezing')
        freeze = [PYTHON,'-m','machinery.study','freeze','--study',c['study'],'--config',c['protocol']['path'],
                  '--suite',c['curation_suite']['path'],'--contract',c['contract']['path']]
        rc, killed = drive(c, 'FREEZE', freeze, keeper=keeper)
        need(rc == 0 and not killed and not STOPPING and not (runtime/'STOP.json').exists(), 'native freeze did not complete cleanly')
        source_checks(c)
        run_started = True
        rc, killed = drive(c, 'CONTROLLER', [PYTHON,'-m','machinery.study','run','--study',c['study'],'--arm','exploration'], keeper=keeper)
        s = idle(c)
        closed = not killed
        if not s['resolution_is_null']:
            final = 'candidate_resolution_pending_root_completion_audit'; result = 0 if rc == 0 else 1
        elif rc == 0 and s['round'] == 4 and s['phase'] == 'research' and s['status'] == 'finite_budget_finished; root_open':
            final = 'epoch1_complete_pending_root_closure_audit'; result = 0
        source_checks(c)
    except BaseException as exc:
        result = 1; final = 'needs_reconciliation'
        write(runtime/'OPERATIONAL_FAILURE.json', {'schema': SCHEMA, 'exception_type': type(exc).__name__,
              'detail_omitted': True, 'automatic_retry': False}, exclusive=True)
        if run_started:
            try:
                idle(c)
                receipt = json.loads(raw(runtime/'CONTROLLER_EXIT.json',1024**2))
                closed = (receipt.get('actual_numeric_wait_completed') is True and
                          receipt.get('owned_handle') is True and receipt.get('kill_sent') is False and
                          receipt.get('configuration_sha256') == c['_config_sha256'] and
                          type(receipt.get('returncode')) is int)
            except (OSError,ValueError,KeyError,RuntimeError): closed = False
    finally:
        keeper_exit = None; keeper_error = False
        if keeper is not None:
            try:
                if keeper.poll() is None: keeper.terminate()
                try: keeper_exit = keeper.wait(timeout=5)
                except subprocess.TimeoutExpired:
                    keeper.kill()
                    try: keeper_exit = keeper.wait(timeout=5)
                    except subprocess.TimeoutExpired: pass
            except (OSError,subprocess.SubprocessError): keeper_error = True
        settled = closed and type(keeper_exit) is int and not keeper_error
        write(runtime/'KEEPER_EXIT.json', {'returncode': keeper_exit,
              'actual_numeric_wait_completed': type(keeper_exit) is int,
              'cleanup_error_observed': keeper_error}, exclusive=True)
        if not settled:
            result = 1; final = 'needs_reconciliation'
            write(runtime/'CLEANUP_UNCERTAIN.json', {'schema': SCHEMA, 'descendant_cleanup_confirmed': False,
                  'automatic_retry': False, 'original_native_owners_preserved': True}, exclusive=True)
        publish(c, final, all_owned_effects_settled=settled,
                genuine_final_native_verify_claimed=False, mathematical_completion_claimed=False)
        write(runtime/'OPERATOR_RETURN.json', {'schema': SCHEMA, 'configuration_sha256': c['_config_sha256'],
              'returncode': result, 'actual_operator_exit_observed': False,
              'all_owned_effects_settled': settled,
              'unresolved_cleanup': not settled,
              'epoch2_launched': False, 'mathematical_completion_claimed': False}, exclusive=True)
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('action', choices=('run','status','stop'))
    p.add_argument('--config', type=Path, required=True); p.add_argument('--config-sha256', required=True)
    a = p.parse_args()
    if a.action == 'run':
        c = load(a.config,a.config_sha256)
        def stop_signal(*_):
            global STOPPING
            STOPPING = True
        for number in (signal.SIGINT,signal.SIGTERM): signal.signal(number,stop_signal)
        return run(c)
    need(sha(a.config) == a.config_sha256, 'configuration hash differs')
    c = json.loads(raw(a.config,1024**2))
    need(c.get('schema') == SCHEMA, 'configuration schema differs')
    if a.action == 'stop':
        write(Path(c['runtime'])/'STOP.json', {'requested': time.time()}, exclusive=True)
    else:
        # This is explicitly a timestamped file observation, never a fresh Popen query.
        print(raw(Path(c['runtime'])/'STATUS.json',1024**2).decode())
    return 0


if __name__ == '__main__':
    sys.path.insert(0,str(ROOT))
    raise SystemExit(main())
