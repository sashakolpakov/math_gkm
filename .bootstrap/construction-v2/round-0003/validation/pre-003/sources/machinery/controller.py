"""Goal-driven continuing experimental controller. See docs/CONTROLLER.md.

Controller records live in .control (read-only to Codex workers). Worker reports
are observations, never running-control commands or mathematical authority.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

from .engine import Engine, atomic
from .gate import digest, Rejected
from .trust import ROOT, sha
from . import completion

CONTROL = ROOT/'.control'
PYTHON = '/opt/homebrew/bin/python3'


def read(path):
    return json.loads(Path(path).read_text())


def goal_path(name):
    if not name or any(c not in 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_' for c in name):
        raise Rejected('goal name must contain only letters, digits, dash or underscore')
    return CONTROL/name


def initialize(name, *, contract_path, mode, workers, seconds, epoch_actions=32,
               total_seconds=None, tokens=None, failure_limit=3, transport='live'):
    if mode not in ('bounded', 'continuing') or (mode == 'bounded' and (not workers or workers < 1)):
        raise Rejected('explicit --workers N or --continue required')
    if not 1 <= seconds <= 1800 or not 1 <= epoch_actions <= 32 or failure_limit < 1:
        raise Rejected('invalid worker, epoch or failure limit')
    if any(x is not None and x <= 0 for x in (total_seconds, tokens)):
        raise Rejected('resource limits must be positive')
    contract = read(contract_path)
    reference = read(ROOT/'contracts/markov-goal.json')
    if contract != reference or sha(ROOT/contract['root_file']) != contract['root_sha256']:
        raise Rejected('this controller implements only the exact reviewed Markov goal contract')
    directory = goal_path(name)
    directory.mkdir(parents=True, exist_ok=False)
    atomic(directory/'contract.json', contract)
    limits = {'mode': mode, 'workers': workers if mode == 'bounded' else None,
        'worker_seconds': seconds, 'total_seconds': total_seconds, 'tokens': tokens,
        'epoch_actions': epoch_actions, 'failure_limit': failure_limit,
        'output_bytes': 32*1024*1024}
    atomic(directory/'limits.json', limits)
    atomic(directory/'state.json', {'schema': 'math-gkm.controller.v1',
        'status': 'stopped', 'reason': 'initialized; never launched', 'created': time.time(),
        'last_activity': time.time(), 'contract_hash': digest(contract),
        'transport': transport, 'workers_completed': 0, 'elapsed_seconds': 0,
        'tokens': 0, 'usage_unknown': 0, 'failures': 0, 'agenda': [], 'last_result': None})
    protected = sorted((ROOT/'machinery').glob('*.py')) + [ROOT/p for p in (
        'MathGKM/Protocol.lean', 'MISSION.md', 'docs/DESIGN.md',
        'lean-toolchain', 'lakefile.toml', 'lake-manifest.json')]
    atomic(directory/'implementation.json', {str(p.relative_to(ROOT)): sha(p) for p in protected})
    inherited = {p: {'sha256': sha(ROOT/p), 'content': (ROOT/p).read_text()} for p in contract['inherited']}
    atomic(directory/'inherited.json', inherited)
    engine_contract = {**contract, 'limits': {'actions': epoch_actions}}
    Engine(directory/'engine', continuing=True).initialize(engine_contract)
    return directory


class Locks:
    def __init__(self, directory):
        self.streams = []
        try:
            for path in (directory/'controller.lock', CONTROL/'workspace.lock'):
                stream = path.open('a')
                self.streams.append(stream)
                fcntl.flock(stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            self.close()
            raise Rejected('a controller or bounded watchdog already owns this goal/workspace')

    @property
    def fds(self):
        return tuple(s.fileno() for s in self.streams)

    def close(self):
        for stream in self.streams:
            stream.close()
        self.streams = []


def status(directory):
    state = read(directory/'state.json')
    with (directory/'controller.lock').open('a') as stream:
        try:
            fcntl.flock(stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
            alive = False
        except BlockingIOError:
            alive = True
    state['lock_held'] = alive
    state['stop_requested'] = (directory/'STOP.json').exists()
    active = state.get('active_worker')
    if active and (Path(active)/'activity.json').exists():
        state['worker_activity'] = read(Path(active)/'activity.json')
    if state['status'] == 'running' and not alive:
        state.update(status='operationally_blocked', reason='stale running state; resume reconciles interrupted work')
    return state


def feedback(engine_state):
    return [dict(e['result'], event_index=e['index']) for e in engine_state['events']
            if e['action'].get('kind') == 'research_worker']


def prompt_for(request, directory):
    return f'''You are the actual live gpt-6-astra mathematical research worker of an autonomous continuing controller.
Read MISSION.md and docs/DESIGN.md completely. Construction and Agoh stand. Work only on the full pinned published Markov goal in {directory / 'contract.json'}.
This is an explicitly authorized experimental research execution, not a certified switch of the Python controller. Research needs no fresh switch proof at every action. You choose the next mathematical actions and may abandon inherited subgoals. No proof recipe is prescribed.
Read the actual request below, the inherited evidence index {directory / 'inherited.json'}, and the latest results. Follow paths to earlier full reports and artifacts when useful; they remain available. Read the independent Markov target and residual scope audits. Preserve the exact root, English meaning, assumptions, all directions, raw coefficients, zeros, endpoints and universal scope. An interesting partial result or scan does not resolve it.
Use ordinary Lean, Python, available Sage/GAP, hosted live source search and your own representations and proofs. Execute the actions inside this worker and record actual observations, including capability failures; do not leave external action requests waiting for a supervisor. Experiments are not proofs. Complexity measures are audit-only, with no levels or lemma-count reward.
No sorry, admit, custom axioms or native_decide. Pinned read-only dependencies only. No package updates. Keep GIT_CONFIG_NOSYSTEM=1 and GIT_CONFIG_GLOBAL=/dev/null; use env PATH=/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin for Lake. Use /opt/homebrew/bin/python3 and .scratch for temporary files. Shell networking is disabled; hosted web search is available.
Do not access .git, outside project source, archives, old outside transcripts or credentials. Do not publish or contact anyone. Do not invoke Codex, another LLM, a controller, a background process or edit controller control records. The outer controller launches subsequent workers automatically. Do not alter machinery, goal contracts, protected root definitions, prior independent evidence or permissions. Controller changes can be proposed as research artifacts only. Preserve existing history; write new evidence in research/ and evidence/ with unique names. The supervisor alone may make local Git commits; no worker commits.
Work for at most {request['seconds']} seconds and checkpoint useful progress frequently in research/. If an earlier worker was interrupted, inspect its changes and raw event log, explicitly reconcile partial effects, and choose a new action; never blindly replay a possibly completed side effect. Tool outcomes are operational evidence, never a mathematical result.
Return the required JSON report with request_id={request['id']}. Agenda is revisable advice for the next automatic invocation. List completed actions and concrete observations with evidence paths. completion must be null unless you have a closed theorem of the exact pinned root or its negation; then give kind, module, declaration and the path of a detailed source-correspondence argument. Source coverage, source family, coefficient/homogeneity, polygon and endpoint/direction bridges must be addressed; missing bridges prevent root closure. The controller independently rebuilds and checks claimed completion and requires a separate hash-bound source/English audit. Your success declaration alone never closes the goal.
ACTUAL REQUEST:
{json.dumps(request, ensure_ascii=False, indent=2)}
'''


class Controller:
    def __init__(self, directory, lock_fds=()):
        self.directory = Path(directory)
        self.fds = tuple(lock_fds)
        self.contract = read(self.directory/'contract.json')
        self.limits = read(self.directory/'limits.json')
        self.state = read(self.directory/'state.json')
        self.accounting_tick = time.monotonic()
        self.engine = Engine(self.directory/'engine', continuing=True,
                             adapters={'research_worker': self.worker})

    def save(self, **changes):
        now = time.monotonic()
        self.state['controller_active_seconds'] = self.state.get('controller_active_seconds', 0) + now-self.accounting_tick
        self.accounting_tick = now
        self.state.update(changes, last_activity=time.time())
        atomic(self.directory/'state.json', self.state)

    def stopped(self):
        return (self.directory/'STOP.json').exists()

    def worker(self, payload):
        directory = Path(payload['directory'])
        self.save(active_worker=str(directory))
        env = os.environ.copy()
        env.update(GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL='/dev/null', TMPDIR=str(ROOT/'.scratch'))
        # Watchdog inherits both locks. If controller dies, a new controller
        # cannot overlap the surviving bounded worker. OS releases on exit/reboot.
        with (directory/'watchdog.log').open('ab') as log:
            process = subprocess.Popen([PYTHON, '-m', 'machinery.worker', str(directory)],
                cwd=ROOT, env=env, stdin=subprocess.DEVNULL, stdout=log, stderr=log,
                start_new_session=True, pass_fds=self.fds)
            atomic(directory/'watchdog.json', {'pid': process.pid, 'started': time.time()})
            while process.poll() is None:
                self.save(watchdog_pid=process.pid)
                time.sleep(0.25)
        if (directory/'receipt.json').exists():
            return read(directory/'receipt.json')
        return self.uncertain(directory, 'watchdog exited without receipt')

    def uncertain(self, directory, reason):
        process_record = directory/'process.json'
        if process_record.exists():
            pid = read(process_record)['pid']
            try:
                os.kill(pid, 0)
            except ProcessLookupError:
                pass
            else:
                raise Rejected('uncertain worker process still exists (PID '+str(pid)+
                               '); inspect and terminate it before resume; refusing overlap or PID-based blind kill')
        # Reconciles the attempt as unknown; never asserts that effects rolled back.
        result = {'evidence': 'execution_outcome', 'outcome': 'uncertain_effects',
            'request_id': read(directory/'request.json')['id'], 'reason': reason,
            'report': None, 'usage': [], 'mathematical_resolution': False,
            'reconciliation': 'Do not replay this attempt. Next worker must inspect retained files and logs.',
            'directory': str(directory)}
        atomic(directory/'reconciliation.json', result)
        return result

    def account(self):
        observations = feedback(read(self.engine.state_path))
        seconds, tokens, unknown, failures = 0, 0, 0, 0
        agenda = []
        resume = self.directory/'resume.json'
        baseline = read(resume)['failure_baseline'] if resume.exists() else 0
        for index, result in enumerate(observations):
            seconds += result.get('elapsed_seconds', self.limits['worker_seconds'])
            usage = result.get('usage', [])
            if not usage:
                unknown += 1
            for u in usage:
                tokens += sum(u.get(k, 0) for k in ('input_tokens', 'output_tokens')
                              if isinstance(u.get(k, 0), int))
            failures = 0 if index < baseline or result.get('outcome') == 'completed' else failures + 1
            if result.get('report'):
                agenda = result['report']['agenda']
        self.save(workers_completed=len(observations), elapsed_seconds=seconds,
                  tokens=tokens, usage_unknown=unknown, failures=failures,
                  agenda=agenda, active_worker=None, watchdog_pid=None)
        return observations

    def verify_claim(self, result):
        report = result.get('report')
        claim = report.get('completion') if report else None
        if not claim or result.get('outcome') != 'completed':
            return False
        if self.state['transport'] == 'fixture':
            self.save(last_validation={'resolved': False, 'rejection': 'fixture can never resolve mathematics'})
            return False
        validation = self.directory/'validations'/f'{len(list((self.directory / "validations").glob("*"))) if (self.directory / "validations").exists() else 0:06d}'
        audit = read(self.directory/'audit.json') if (self.directory/'audit.json').exists() else None
        checked = completion.verify(self.contract, claim, validation, audit=audit, stop=self.stopped)
        self.save(last_validation=checked, validation_directory=str(validation))
        if checked['resolved']:
            self.save(status='mathematically_resolved', reason='exact root and independent correspondence audit passed',
                      resolution=checked)
            return True
        return False

    def run(self):
        if digest(self.contract) != self.state['contract_hash']:
            raise Rejected('goal contract changed')
        for path, expected in read(self.directory/'implementation.json').items():
            if sha(ROOT/path) != expected:
                raise Rejected('controller implementation changed; independent review and explicit migration needed')
        if sha(ROOT/self.contract['root_file']) != self.contract['root_sha256']:
            raise Rejected('exact pinned root changed')
        for process_record in (self.directory/'workers').glob('*/process.json'):
            if not (process_record.parent/'receipt.json').exists():
                pid = read(process_record)['pid']
                try:
                    os.kill(pid, 0)
                except ProcessLookupError:
                    pass
                else:
                    raise Rejected('receiptless worker PID still exists: '+str(pid)+
                                   '; inspect/terminate before resuming')
        self.save(status='running', reason='controller active', pid=os.getpid())
        state = read(self.engine.state_path)
        if state.get('inflight'):
            job = state['inflight']
            if job.get('active') is not None:
                directory = Path(job['response']['actions'][job['active']]['payload']['directory'])
                reconciled = read(directory/'receipt.json') if (directory/'receipt.json').exists() else self.uncertain(directory, 'interrupted controller/watchdog')
                self.engine.recover(reconciled)
            else:
                self.engine.recover()
        observations = self.account()
        # A reviewed completion can be rechecked on resume without a new LLM call.
        candidate = observations[-1] if observations else None
        audit_path = self.directory/'audit.json'
        if audit_path.exists():
            audit = read(audit_path)
            for observation in reversed(observations):
                # Only completed attempts can supply completion evidence. A later
                # failed report for the same bundle must not shadow an eligible one.
                if observation.get('outcome') != 'completed':
                    continue
                claim = (observation.get('report') or {}).get('completion')
                if claim:
                    try:
                        if completion.prepare(self.contract, claim)['bundle_hash'] == audit['bundle_hash']:
                            candidate = observation
                            break
                    except (Rejected, OSError, ValueError):
                        continue
        if candidate and self.verify_claim(candidate):
            return
        while True:
            if self.stopped():
                self.save(status='stopped', reason='explicit stop request')
                return
            limit = self.limits
            if limit['tokens'] and self.state['usage_unknown']:
                self.save(status='operationally_blocked', reason='token cap selected but provider usage missing; cannot account safely')
                return
            if ((limit['workers'] is not None and self.state['workers_completed'] >= limit['workers']) or
                (limit['total_seconds'] and self.state['elapsed_seconds'] >= limit['total_seconds']) or
                (limit['tokens'] and self.state['tokens'] >= limit['tokens'])):
                self.save(status='exhausted', reason='user-selected cumulative resource limit reached; mathematical goal open')
                return
            if self.state['failures'] >= limit['failure_limit']:
                self.save(status='operationally_blocked', reason='consecutive worker failures reached configured limit')
                return
            req = self.engine.request()
            worker_dir = self.directory/'workers'/f'{req["generation"]:06d}'
            worker_dir.mkdir(parents=True, exist_ok=True)
            seconds = limit['worker_seconds']
            if limit['total_seconds']:
                seconds = min(seconds, max(0.1, limit['total_seconds']-self.state['elapsed_seconds']))
            # Context is compact; complete immutable requests/events remain on disk.
            compact = [{k: v for k, v in r.items() if k in ('request_id', 'outcome', 'report', 'reason', 'event_index')}
                       for r in observations[-8:]]
            request = {'id': req['id'], 'context_hash': req['context_hash'],
                'transport': self.state['transport'], 'seconds': seconds,
                'output_bytes': limit['output_bytes'], 'stop_file': str(self.directory/'STOP.json'),
                'contract_hash': self.state['contract_hash'], 'contract': self.contract,
                'epoch': req['epoch'], 'generation': req['generation'], 'agenda': self.state['agenda'],
                'feedback': compact, 'last_validation': self.state.get('last_validation'),
                'full_history': str(self.engine.state_path), 'worker_archive': str(self.directory/'workers'),
                'inheritance': str(self.directory/'inherited.json')}
            if self.state['transport'] == 'fixture':
                modes = self.state.get('fixture_modes', [])
                request['fixture_mode'] = modes[req['generation']] if req['generation'] < len(modes) else 'feedback'
            atomic(worker_dir/'request.json', request)
            (worker_dir/'prompt.txt').write_text(prompt_for(request, self.directory))
            self.engine.consume({'request_id': req['id'], 'context_hash': req['context_hash'],
                'origin': 'supervisor_transport',
                'decision': 'Controller delegates an open research round; Astra selects mathematical actions from evidence.',
                'actions': [{'kind': 'research_worker', 'payload': {'directory': str(worker_dir)}}]})
            observations = self.account()
            last = observations[-1]
            self.save(last_result={'request_id': last.get('request_id'), 'outcome': last.get('outcome')})
            if last.get('evidence') == 'execution_failure':
                self.save(status='operationally_blocked', reason='adapter failure; inspect effect/process uncertainty before resume')
                return
            if self.verify_claim(last):
                return


def serve(directory, fds):
    if len(fds) != 2:
        raise Rejected('internal serve requires both inherited controller locks')
    controller = Controller(directory, fds)
    def stop_signal(*_):
        atomic(directory/'STOP.json', {'time': time.time(), 'origin': 'controller signal'})
    signal.signal(signal.SIGTERM, stop_signal)
    signal.signal(signal.SIGINT, stop_signal)
    try:
        controller.run()
    except Exception as exc:
        controller.save(status='operationally_blocked', reason=type(exc).__name__+': '+str(exc))
        raise


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=['init', 'run', 'resume', 'status', 'stop', 'audit', '_serve'])
    parser.add_argument('--goal', required=True)
    parser.add_argument('--contract', type=Path, default=ROOT/'contracts/markov-goal.json')
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--workers', type=int)
    mode.add_argument('--continue', dest='continuing', action='store_true')
    parser.add_argument('--worker-seconds', type=int)
    parser.add_argument('--total-seconds', type=float)
    parser.add_argument('--tokens', type=int)
    parser.add_argument('--epoch-actions', type=int, default=32)
    parser.add_argument('--failure-limit', type=int, default=3)
    parser.add_argument('--transport', choices=['live', 'fixture'], default='live')
    parser.add_argument('--foreground', action='store_true')
    parser.add_argument('--file', type=Path)
    parser.add_argument('--lock-fds', default='')
    args = parser.parse_args()
    directory = goal_path(args.goal)
    if args.command == 'init':
        if args.worker_seconds is None or not (args.continuing or args.workers):
            parser.error('init requires --worker-seconds and either --workers N or --continue')
        initialize(args.goal, contract_path=args.contract,
            mode='continuing' if args.continuing else 'bounded', workers=args.workers,
            seconds=args.worker_seconds, epoch_actions=args.epoch_actions,
            total_seconds=args.total_seconds, tokens=args.tokens,
            failure_limit=args.failure_limit, transport=args.transport)
    elif args.command == 'status':
        pass
    elif args.command == 'stop':
        atomic(directory/'STOP.json', {'time': time.time(), 'origin': 'explicit CLI stop'})
    elif args.command == '_serve':
        serve(directory, tuple(int(x) for x in args.lock_fds.split(',') if x))
        return
    else:
        locks = Locks(directory)
        try:
            if args.command == 'audit':
                if not args.file:
                    parser.error('audit requires --file with independent review of an exact bundle')
                audit = read(args.file)
                if audit.get('accepted') is not True or not audit.get('reviewer') or not audit.get('bundle_hash'):
                    raise Rejected('incomplete independent audit')
                for key in read(directory/'contract.json')['correspondence_obligations']:
                    if not isinstance(audit.get('checks', {}).get(key), str) or not audit['checks'][key].strip():
                        raise Rejected('missing audit explanation: '+key)
                archive = directory/'audits'
                archive.mkdir(exist_ok=True)
                atomic(archive/f'{time.time_ns()}.json', audit)
                atomic(directory/'audit.json', audit)
            else:
                state = read(directory/'state.json')
                if state['status'] == 'mathematically_resolved':
                    raise Rejected('goal already resolved')
                limits = read(directory/'limits.json')
                previous = dict(limits)
                if args.workers is not None:
                    if args.workers < 1:
                        raise Rejected('worker limit must be positive')
                    limits.update(mode='bounded', workers=args.workers)
                if args.continuing:
                    limits.update(mode='continuing', workers=None)
                for arg, key in [('worker_seconds', 'worker_seconds'), ('total_seconds', 'total_seconds'), ('tokens', 'tokens')]:
                    value = getattr(args, arg)
                    if value is not None:
                        if value <= 0 or (arg == 'worker_seconds' and value > 1800):
                            raise Rejected('invalid resource limit')
                        limits[key] = value
                if previous != limits:
                    atomic(directory/'limit-history'/f'{time.time_ns()}.json', {'before': previous, 'after': limits})
                    atomic(directory/'limits.json', limits)
                (directory/'STOP.json').unlink(missing_ok=True)
                # Failure streaks are historical; explicit resume authorizes a fresh retry window.
                if args.command == 'resume':
                    atomic(directory/'resume.json', {'time': time.time(), 'failure_baseline': state['workers_completed']})
                if args.foreground:
                    serve(directory, locks.fds)
                else:
                    state.update(status='running', reason='detached controller launching', last_activity=time.time())
                    atomic(directory/'state.json', state)
                    with (directory/'controller.log').open('ab') as log:
                        subprocess.Popen([PYTHON, '-m', 'machinery.controller', '_serve', '--goal', args.goal,
                            '--lock-fds', ','.join(map(str, locks.fds))], cwd=ROOT,
                            stdin=subprocess.DEVNULL, stdout=log, stderr=log,
                            start_new_session=True, pass_fds=locks.fds)
        finally:
            locks.close()
    print(json.dumps(status(directory), indent=2))


if __name__ == '__main__':
    try:
        main()
    except (Rejected, OSError, ValueError) as exc:
        print(json.dumps({'error': str(exc)}), file=sys.stderr)
        raise SystemExit(1)
