"""Fresh paired research studies; experimental policy changes, never Goedel switches.

CLI: freeze, run, stop, status, recover, evaluate, completion, audit-report.
All child calls and evaluation overhead debit the owning arm's frozen allowance.
"""
import argparse
import copy
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import time

from .study_common import (ROOT, PYTHON, SEED, Invalid, canonical, digest, sha, read,
    write, save_state, load_state, lock, inventory, snapshot, verify_snapshot,
    clean_contract, copy_seed, implementation)
from . import study_policy as policy

DEFAULT = {'schema': 'math-gkm.study.v2', 'transport': 'fixture',
    'model': 'gpt-6-astra', 'provider': 'codex-configured-provider',
    'usage_semantics': 'unverified_raw_only', 'rounds': 4, 'episode_rounds': 2,
    'invention_rounds': 1, 'call_seconds': 30, 'adaptation_seconds': 30,
    'arm_seconds': 1200, 'max_calls': 24, 'meta_calls': 8,
    'policy_trials': 1, 'policy_trial_rounds': 2, 'output_bytes': 2097152,
    'validation_seconds': 120, 'failure_limit': 3, 'fixture_policy_trial': False,
    'fixture_behavior': 'normal', 'ablations': []}

def public_receipt(receipt):
    """Evaluation answers and compiler diagnostics never enter research roles."""
    if receipt.get('role') == 'adapter':
        return {k: v for k, v in receipt.items() if k not in ('payload', 'before', 'after')}
    return receipt

def public_comparison(result):
    return {k: v for k, v in result.items() if k not in ('sides', 'outcomes')}

def validate_protocol(p):
    if set(p) != set(DEFAULT) or p['schema'] != DEFAULT['schema']:
        raise Invalid('protocol keys/schema mismatch')
    if p['transport'] not in ('fixture', 'live') or p['model'] != 'gpt-6-astra':
        raise Invalid('only explicitly selected fixture or Astra transport')
    if p['fixture_behavior'] not in ('normal', 'sleep', 'missing', 'exit') or (p['transport'] == 'live' and (p['fixture_behavior'] != 'normal' or p['fixture_policy_trial'])):
        raise Invalid('deterministic fixture behaviors are never live research settings')
    for k in ('rounds', 'episode_rounds', 'call_seconds', 'adaptation_seconds', 'arm_seconds',
              'max_calls', 'meta_calls', 'policy_trial_rounds', 'output_bytes', 'validation_seconds', 'failure_limit'):
        if type(p[k]) is not int or p[k] < 1:
            raise Invalid('invalid positive budget: '+k)
    if not 0 <= p['invention_rounds'] < p['episode_rounds'] or p['policy_trials'] < 0:
        raise Invalid('invention must be a minority of episode rounds')
    if p['call_seconds'] > 1800 or p['adaptation_seconds'] > 1800 or p['validation_seconds'] > 180:
        raise Invalid('call or validation timeout too large')
    if p['usage_semantics'] != 'unverified_raw_only':
        raise Invalid('no provider token normalization has been independently validated')
    if not isinstance(p['ablations'], list):
        raise Invalid('ablations must be precommitted artifact paths')
    for path in p['ablations']:
        from .study_common import inside
        inside(ROOT, path)
        if path in SEED or not path.startswith(('MathGKM/', 'research/')):
            raise Invalid('ablation may remove only an experimental component')

def validate_suite(suite):
    if set(suite) != {'schema', 'selector', 'selection_basis', 'independent', 'tasks'} or suite['schema'] != 'math-gkm.suite.v2':
        raise Invalid('invalid evaluation suite')
    if type(suite['independent']) is not bool or not isinstance(suite['tasks'], list):
        raise Invalid('suite independence must be explicit boolean and tasks a list')
    seen = set()
    for task in suite['tasks']:
        required = {'id', 'statement', 'hypotheses', 'scope', 'source_sha256', 'kind',
                    'interface_type', 'transport_type', 'required_constants'}
        if not required <= set(task) or task['id'] in seen or task['kind'] not in ('holdout', 'regression'):
            raise Invalid('invalid/duplicate structural obligation')
        if not isinstance(task['id'], str) or not task['id'] or any(c not in 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_' for c in task['id']):
            raise Invalid('unsafe task id')
        if task['source_sha256'] != clean_contract()['root_sha256']:
            raise Invalid('suite source does not match exact root')
        if not all(isinstance(task[k], str) and task[k] for k in ('statement', 'scope', 'interface_type', 'transport_type')):
            raise Invalid('missing exact obligation or scope')
        if not isinstance(task['hypotheses'], list) or not isinstance(task['required_constants'], list):
            raise Invalid('explicit hypotheses and use dependencies required')
        seen.add(task['id'])
    if suite['tasks'] and (not suite['selector'] or not suite['selection_basis']):
        raise Invalid('suite selection provenance required')

def freeze(directory, config=None, suite=None):
    directory = Path(directory).resolve()
    if not directory.is_relative_to(ROOT) or directory == ROOT:
        raise Invalid('study must be a fresh directory inside this workspace')
    p = {**DEFAULT, **(config or {})}
    validate_protocol(p)
    suite = suite or {'schema': 'math-gkm.suite.v2', 'selector': 'none',
        'selection_basis': 'No independent holdout available; no transfer claim authorized.',
        'independent': False, 'tasks': []}
    validate_suite(suite)
    if p['transport'] == 'live' and any(any(k.startswith('fixture_') for k in t) for t in suite['tasks']):
        raise Invalid('fixture answers cannot enter a live suite')
    directory.mkdir(parents=True, exist_ok=False)
    seed = directory/'seed'
    seed.mkdir()
    for name in SEED:
        target = seed/name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT/name, target)
    write(seed/'contract.json', clean_contract())
    write(directory/'protocol.json', p)
    write(directory/'evaluation/suite.json', suite)
    seal = {'seed': {name: sha(seed/name) for name in SEED + ('contract.json',)},
        'protocol': digest(p), 'suite': digest(suite), 'implementation': implementation(),
        'dependencies': {x.name: str(x.resolve()) for x in (ROOT/'.lake/packages').iterdir()},
        'baseline_adjustments': ['empty history and agenda; no inherited artifacts',
            'same read-isolated filesystem and resource accounting as exploration',
            'same external independent reviews and withheld evaluation overhead charged',
            'legacy single-agenda prompt/action behavior; no portfolio requirement'],
        'frozen_at': time.time(), 'status': 'experimental construction; no mathematical results'}
    write(directory/'seal.json', seal)
    for mode in ('baseline', 'exploration'):
        arm = directory/'arms'/mode
        copy_seed(seed, arm/'workspace')
        snapshot(arm/'workspace', arm/'snapshots/initial', policy.initial(mode)['policy'])
        save_state(arm/'state.json', {'research': policy.initial(mode), 'round': 0,
            'calls': 0, 'meta_calls': 0, 'seconds': 0., 'status': 'ready',
            'active': None, 'receipts': [], 'policy_trials': 0, 'failures': 0,
            'phase': 'research', 'reviewed_rounds': [], 'evaluations': [],
            'resolution': None, 'receipt_hashes': {}, 'seal_hash': digest(seal)})
    return directory

def verify(directory):
    seal = read(directory/'seal.json')
    if digest(read(directory/'protocol.json')) != seal['protocol'] or digest(read(directory/'evaluation/suite.json')) != seal['suite']:
        raise Invalid('frozen protocol/evaluation suite changed')
    if implementation() != seal['implementation']:
        raise Invalid('implementation changed since freeze; new reviewed study required')
    for name, expected in seal['seed'].items():
        if sha(directory/'seed'/name) != expected:
            raise Invalid('frozen seed changed')
    if {x.name: str(x.resolve()) for x in (ROOT/'.lake/packages').iterdir()} != seal['dependencies']:
        raise Invalid('dependency links changed')
    for mode in ('baseline', 'exploration'):
        arm = directory/'arms'/mode
        state = load_state(arm/'state.json')
        if state['seal_hash'] != digest(seal):
            raise Invalid('seal/state binding mismatch')
        for name, expected in seal['seed'].items():
            if sha(arm/'workspace'/name) != expected:
                raise Invalid('protected arm seed changed')
    return read(directory/'protocol.json')

class Arm:
    def __init__(self, study, mode, fd):
        self.study, self.mode, self.fd = study, mode, fd
        self.root = study/'arms'/mode
        self.workspace = self.root/'workspace'
        self.p = read(study/'protocol.json')
        self.s = load_state(self.root/'state.json')
        self.tick = time.monotonic()

    def save(self):
        now = time.monotonic()
        self.s['controller_active_seconds'] = self.s.get('controller_active_seconds', 0) + now-self.tick
        self.tick = now
        save_state(self.root/'state.json', self.s)

    def stopped(self):
        return (self.study/'STOP.json').exists()

    def permitted(self, role, seconds):
        return (not self.stopped() and self.s['calls'] < self.p['max_calls'] and
            self.s['seconds'] + seconds <= self.p['arm_seconds'] and
            (role not in ('proposer', 'reviewer', 'selector') or self.s['meta_calls'] < self.p['meta_calls']))

    def consume(self, job, receipt):
        if str(job) in self.s['receipts']:
            if self.s.get('receipt_hashes', {}).get(str(job)) != digest(receipt):
                raise Invalid('durable receipt changed after accounting')
            return receipt
        self.s['seconds'] += receipt['elapsed_seconds']
        self.s['receipts'].append(str(job))
        self.s.setdefault('receipt_hashes', {})[str(job)] = digest(receipt)
        self.s['active'] = None
        self.s['failures'] = 0 if receipt['outcome'] == 'completed' else self.s['failures'] + 1
        self.save()
        return receipt

    def recover(self):
        active = self.s['active']
        if not active:
            return
        job = Path(active)
        if (job/'receipt.json').exists():
            return self.consume(job, read(job/'receipt.json'))
        if (job/'process.json').exists():
            pid = read(job/'process.json')['pid']
            try:
                os.kill(pid, 0)
            except ProcessLookupError:
                pass
            else:
                raise Invalid('uncertain worker PID still exists; inspect identity before terminating; no replay')
        spec = read(job/'spec.json')
        receipt = {'outcome': 'uncertain_effects_not_replayed', 'payload': None,
            'elapsed_seconds': spec['seconds'], 'role': spec['role'],
            'usage_raw': [], 'normalized_tokens': None, 'mathematical_resolution': False,
            'request_id': spec['request_id'], 'recovery': 'full reservation charged; inspect retained partial artifacts'}
        write(job/'receipt.json', receipt)
        return self.consume(job, receipt)

    def call(self, key, role, req, workspace=None, readonly=False, seconds=None):
        """Idempotent logical invocation; completed or uncertain effects never replay."""
        job = self.root/'jobs'/key
        if (job/'receipt.json').exists():
            return self.consume(job, read(job/'receipt.json'))
        seconds = seconds or self.p['call_seconds']
        if not self.permitted(role, seconds):
            raise Invalid('resource allowance exhausted or stop requested')
        if job.exists():
            raise Invalid('unreconciled invocation; use recover')
        workspace = workspace or self.workspace
        req = {**req, 'request_id': key}
        spec = {'request_id': key, 'workspace': str(workspace), 'role': role,
            'transport': self.p['transport'], 'model': self.p['model'], 'provider': self.p['provider'],
            'usage_semantics': self.p['usage_semantics'], 'readonly': readonly,
            'seconds': seconds, 'output_bytes': self.p['output_bytes'], 'stop': str(self.study/'STOP.json'),
            'fixture_policy_trial': self.p['fixture_policy_trial'], 'fixture_behavior': self.p['fixture_behavior']}
        write(job/'spec.json', spec)
        write(job/'request.json', req)
        from .study_policy import prompt
        (job/'prompt.txt').write_text(prompt(req) if role in ('proposer', 'researcher', 'reviewer', 'selector') else
            policy.COMMON + '\nAdapt the frozen solver to these exact obligations. Do not change hypotheses or source. '
            'Return solutions keyed by task id with module, term, interface_term and transport_term. '
            'No independent test answers are supplied.\n' + canonical(req))
        self.s['active'] = str(job)
        self.s['calls'] += 1
        if role in ('proposer', 'reviewer', 'selector'):
            self.s['meta_calls'] += 1
        self.save()
        with (job/'watchdog.log').open('ab') as log:
            child = subprocess.Popen([PYTHON, '-m', 'machinery.study_worker', str(job)], cwd=ROOT,
                stdin=subprocess.DEVNULL, stdout=log, stderr=log, start_new_session=True, pass_fds=(self.fd,))
            write(job/'watchdog.json', {'pid': child.pid})
            while child.poll() is None:
                time.sleep(.1)
        return self.recover()

    def role_workspace(self, key, records, source=None):
        workspace = self.root/'roles'/key
        if not workspace.exists():
            copy_seed(self.study/'seed', workspace)
            if source:
                for name in inventory(source):
                    p = workspace/name
                    p.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(source/name, p)
            write(workspace/'inbox/records.json', records)
        elif read(workspace/'inbox/records.json') != records:
            raise Invalid('independent role input changed')
        return workspace

    def checked_findings(self, result, workspace, selector=False):
        if result['outcome'] != 'completed':
            return False
        payload = result['payload']
        refs = payload.get('evidence' if selector else 'findings', [])
        from .study_common import inside
        try:
            return bool(refs) and (not selector or bool(payload.get('reason'))) and all(
                inside(workspace, x['path']).is_file() and
                sha(inside(workspace, x['path'])) == x['sha256'] for x in refs)
        except (Invalid, KeyError, TypeError):
            return False

    def research_round(self):
        r = self.s['round']
        self.archive_sources()
        req = policy.request(self.s['research'], r, self.p)
        if self.mode == 'exploration':
            plan_req = {**req, 'role': 'proposer'}
            planned = self.call(f'plan-{r:04d}', 'proposer', plan_req, readonly=True)
            if planned['outcome'] != 'completed':
                raise Invalid('prospective proposer failed within budget; no trial authorized')
            committed = self.root/'jobs'/f'plan-{r:04d}'/'validated-plan.json'
            if committed.exists():
                binding = read(committed)
                if binding['receipt_hash'] != digest(planned):
                    raise Invalid('committed prospective plan changed')
                staged = binding['research']
            else:
                staged = copy.deepcopy(self.s['research'])
                policy.record(staged, planned['payload'], self.workspace, r, self.p)
                write(committed, {'receipt_hash': digest(planned), 'research': staged})
            req = policy.request(staged, r, self.p)
            req['committed_trial'] = planned['payload']['trial']
            req['prospective_binding'] = digest(planned)
        else:
            req['committed_trial'] = None
        result = self.call(f'round-{r:04d}', 'researcher', req)
        if result['outcome'] == 'completed':
            updated = copy.deepcopy(self.s['research'])
            try:
                if self.mode == 'exploration' and result['payload'].get('trial') != req['committed_trial']:
                    raise Invalid('executed report differs from precommitted trial')
                policy.record(updated, result['payload'], self.workspace, r, self.p)
                updated['next_trial'] = result['payload'].get('trial')
                self.s['research'] = updated
            except (Invalid, KeyError, TypeError) as exc:
                self.s['research']['observations'].append({'round': r, 'validation_failure': str(exc),
                    'status': 'report_rejected; no theorem or refutation established'})
        else:
            self.s['research']['observations'].append({'round': r, 'outcome': result['outcome'],
                'meaning': 'failure within budget; no unprovability conclusion'})
        write(self.workspace/f'history/round-{r:04d}.json', result)
        target = self.root/'snapshots'/f'round-{r:04d}'
        if not target.exists():
            snapshot(self.workspace, target, self.s['research']['policy'])
        else:
            verify_snapshot(target)
        self.archive_sources()
        self.s['round'] += 1
        self.s['phase'] = 'review' if self.s['round'] % self.p['episode_rounds'] == 0 or self.s['round'] == self.p['rounds'] else 'research'
        self.save()
        claim = result.get('payload', {}).get('completion') if result['outcome'] == 'completed' else None
        if claim:
            from .study_completion import check
            checked = check(self, claim)
            write(self.root/f'completion-claims/round-{r:04d}.json', {'claim': claim, 'result': checked})

    def archive_sources(self):
        """All old mathematical artifacts remain available read-only to their arm."""
        files = inventory(self.workspace)
        for name, hashed in files.items():
            target = self.workspace/'history/objects'/hashed
            if not target.exists():
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(self.workspace/name, target)
        write(self.workspace/f'history/manifests/round-{self.s["round"]:04d}.json', files)

    def review(self):
        r = self.s['round']
        if r in self.s['reviewed_rounds']:
            self.s['phase'] = 'research'
            self.save()
            return
        candidate = self.s['research']['pending_policy']
        committed = self.root/f'review-inputs/review-{r}.json'
        if committed.exists():
            frozen = read(committed)
            records, trial = frozen['records'], frozen['trial']
        else:
            records = {'round': r, 'receipts': [public_receipt(read(Path(p)/'receipt.json')) for p in self.s['receipts']],
                'decisions': self.s['research']['decisions'], 'evaluations': self.s['evaluations']}
            trial = None
            if candidate and self.s['policy_trials'] < self.p['policy_trials']:
                trial = self.policy_trial(candidate)
                records['policy_comparison'] = public_comparison(trial)
            write(committed, {'records': records, 'trial': trial})
        ws = self.role_workspace(f'review-{r}', records, self.workspace)
        result = self.call(f'review-{r}', 'reviewer', {'role': 'reviewer', 'records': 'inbox/records.json'}, ws, True)
        valid = self.checked_findings(result, ws)
        selection_records = {'review': result, 'review_artifact_refs_valid': valid, 'comparison': public_comparison(trial) if trial else None}
        sel_ws = self.role_workspace(f'select-{r}', selection_records)
        selected = self.call(f'select-{r}', 'selector', {'role': 'selector', 'records': 'inbox/records.json'}, sel_ws, True)
        accepted = (valid and self.checked_findings(selected, sel_ws, True) and
            selected['payload'].get('choice') == 'candidate' and trial and trial.get('eligible'))
        if accepted:
            self.s['research']['policy'] = candidate['policy']
        write(self.root/f'decisions/review-{r}.json', {'accepted_experimental_change': bool(accepted),
            'candidate': candidate, 'review': result, 'selection': selected,
            'certified_switch': False, 'comparison': trial})
        self.s['research']['pending_policy'] = None
        self.s['reviewed_rounds'].append(r)
        self.s['phase'] = 'research'
        self.save()

    def policy_trial(self, candidate):
        """Two bounded multi-round continuations from identical current artifacts.

        Branch calls, adaptations, compilation and independent reviews share the
        parent arm allowance. No branch can read another branch or its answers.
        """
        key = f'policy-{candidate["hash"][:16]}-r{self.s["round"]}'
        destination = self.root/'policy_trials'/key
        if (destination/'result.json').exists():
            if key not in self.s.get('completed_policy_trials', []):
                self.s.setdefault('completed_policy_trials', []).append(key)
                self.s['policy_trials'] = len(self.s['completed_policy_trials'])
                self.save()
            return read(destination/'result.json')
        calls = 2*self.p['policy_trial_rounds']*(2 if self.mode == 'exploration' else 1)
        budget = calls*self.p['call_seconds']
        if self.s['seconds'] + budget > self.p['arm_seconds']:
            return {'eligible': False, 'status': 'insufficient_predetermined_continuation_budget'}
        if self.s['calls'] + calls > self.p['max_calls'] or (self.mode == 'exploration' and self.s['meta_calls'] + 2*self.p['policy_trial_rounds'] + 2 > self.p['meta_calls']):
            return {'eligible': False, 'status': 'insufficient_predetermined_call_or_meta_budget'}
        seed = destination/'before'
        if not seed.exists():
            snapshot(self.workspace, seed, self.s['research']['policy'])
        before = verify_snapshot(seed)
        outcomes = {}
        for side, p in [('incumbent', self.s['research']['policy']), ('candidate', candidate['policy'])]:
            ws = self.root/'roles'/f'{key}-{side}'
            if not ws.exists():
                copy_seed(self.study/'seed', ws)
                for name in before['files']:
                    target = ws/name
                    target.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(seed/'source'/name, target)
            local = copy.deepcopy(self.s['research'])
            local['policy'] = p
            local['pending_policy'] = None
            receipts = []
            for n in range(self.p['policy_trial_rounds']):
                req = policy.request(local, n, self.p)
                req['comparison_branch'] = 'blinded-policy-continuation'
                if local['mode'] != 'baseline':
                    plan = self.call(f'{key}-{side}-plan-{n}', 'proposer', {**req, 'role': 'proposer'}, ws, True)
                    if plan['outcome'] != 'completed':
                        raise Invalid('branch prospective proposer failed within budget')
                    staged = copy.deepcopy(local)
                    policy.record(staged, plan['payload'], ws, n, self.p)
                    req = policy.request(staged, n, self.p)
                    req['committed_trial'] = plan['payload']['trial']
                result = self.call(f'{key}-{side}-{n}', 'researcher', req, ws)
                receipts.append(result)
                if result['outcome'] == 'completed':
                    # Record branch history; errors remain evidence, no fabricated success.
                    try:
                        policy.record(local, result['payload'], ws, n, self.p)
                    except (Invalid, KeyError, TypeError):
                        pass
            target = destination/side
            if not target.exists():
                snapshot(ws, target, p)
            outcomes[side] = {'snapshot': str(target), 'receipts': receipts}
        from .study_transfer import evaluate_pair
        comparison = evaluate_pair(self, Path(outcomes['incumbent']['snapshot']), Path(outcomes['candidate']['snapshot']), key)
        result = {'status': 'experimental finite-horizon comparison', 'seed_binding': before['binding'],
            'rounds_each': self.p['policy_trial_rounds'], 'outcomes': outcomes,
            'comparison': public_comparison(comparison), 'eligible': comparison['eligible'], 'certified_switch': False}
        write(destination/'result.json', result)
        self.s.setdefault('completed_policy_trials', []).append(key)
        self.s['policy_trials'] = len(self.s['completed_policy_trials'])
        self.save()
        return result


    def run(self):
        if self.s['resolution']:
            return
        self.recover()
        self.s['status'] = 'running'
        self.save()
        while self.s['round'] < self.p['rounds'] or self.s['phase'] == 'review':
            if self.stopped():
                self.s['status'] = 'stopped'
                break
            if self.s['failures'] >= self.p['failure_limit']:
                self.s['status'] = 'operationally_blocked'
                break
            try:
                if self.s['phase'] == 'review':
                    self.review()
                else:
                    self.research_round()
                verify(self.study)
            except Invalid as exc:
                self.s['status'] = 'stopped' if self.stopped() else 'bounded_or_blocked'
                self.s['reason'] = str(exc)
                break
        else:
            self.s['status'] = 'finite_budget_finished; root_open'
            from .study_transfer import evaluate_pair
            try:
                final = self.root/'snapshots'/f'round-{self.s["round"]-1:04d}'
                result = evaluate_pair(self, self.root/'snapshots/initial', final, f'final-{self.s["round"]}')
                self.s['final_evaluation'] = public_comparison(result)
                from .study_transfer import ablate
                for artifact in self.p['ablations']:
                    ablate(self, final, artifact)
            except Invalid as exc:
                self.s['final_evaluation'] = {'status': 'not_demonstrated_within_budget', 'reason': str(exc)}
        self.save()

def status(directory):
    result = {'study': str(directory), 'stop_requested': (directory/'STOP.json').exists(), 'arms': {}}
    try:
        with lock(directory/'controller.lock'):
            active = False
    except Invalid:
        active = True
    result['controller_or_watchdog_active'] = active
    for mode in ('baseline', 'exploration'):
        s = load_state(directory/'arms'/mode/'state.json')
        result['arms'][mode] = {k: s[k] for k in ('status', 'round', 'calls', 'meta_calls', 'seconds', 'active', 'phase', 'resolution')}
        if s['status'] == 'running' and not active:
            result['arms'][mode]['status'] = 'interrupted; recover without replay'
    return result

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest='command', required=True)
    f = sub.add_parser('freeze')
    f.add_argument('--study', type=Path, required=True)
    f.add_argument('--config', type=Path)
    f.add_argument('--suite', type=Path)
    for command in ('run', 'recover', 'status', 'stop', 'evaluate'):
        p = sub.add_parser(command)
        p.add_argument('--study', type=Path, required=True)
        if command in ('run', 'evaluate'):
            p.add_argument('--arm', choices=['both', 'baseline', 'exploration'], default='both')
        if command == 'run':
            p.add_argument('--resume', action='store_true')
            p.add_argument('--detach', action='store_true')
    args = parser.parse_args()
    directory = args.study.resolve()
    try:
        if args.command == 'freeze':
            freeze(directory, read(args.config) if args.config else None, read(args.suite) if args.suite else None)
        elif args.command == 'stop':
            write(directory/'STOP.json', {'requested': time.time()})
        elif args.command == 'status':
            print(canonical(status(directory)))
            return
        else:
            verify(directory)
            if args.command == 'run' and args.detach:
                argv = [PYTHON, '-m', 'machinery.study', 'run', '--study', str(directory), '--arm', args.arm]
                if args.resume:
                    argv.append('--resume')
                with (directory/'controller.log').open('ab') as log:
                    p = subprocess.Popen(argv, cwd=ROOT, stdout=log, stderr=log, stdin=subprocess.DEVNULL, start_new_session=True)
                print(canonical({'controller_pid': p.pid, 'study': str(directory)}))
                return
            with lock(directory/'controller.lock') as fd:
                if args.command == 'run' and args.resume:
                    (directory/'STOP.json').unlink(missing_ok=True)
                def stop_signal(signum, frame):
                    write(directory/'STOP.json', {'signal': signum, 'time': time.time()})
                signal.signal(signal.SIGTERM, stop_signal)
                signal.signal(signal.SIGINT, stop_signal)
                modes = ('baseline', 'exploration') if getattr(args, 'arm', 'both') == 'both' else (args.arm,)
                for mode in modes:
                    arm = Arm(directory, mode, fd)
                    if args.command == 'recover':
                        arm.recover()
                    elif args.command == 'run':
                        arm.run()
                    else:
                        from .study_transfer import evaluate_pair
                        final = arm.root/'snapshots'/f'round-{arm.s["round"]-1:04d}'
                        result = evaluate_pair(arm, arm.root/'snapshots/initial', final, f'final-{arm.s["round"]}')
                        print(canonical(result))
        print(canonical(status(directory)))
    except (Invalid, OSError, KeyError, TypeError) as exc:
        parser.exit(2, f'{type(exc).__name__}: {exc}\n')

if __name__ == '__main__':
    main()
