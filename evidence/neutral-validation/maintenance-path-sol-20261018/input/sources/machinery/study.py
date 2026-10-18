"""Fresh paired research studies; experimental policy changes, never Goedel switches.

CLI: freeze, run, stop, status, recover, evaluate, completion, audit-report.
All child calls and evaluation overhead debit the owning arm's frozen allowance.
"""
import argparse
import contextlib
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
    clean_contract, copy_seed, implementation, dependency_identity, authorize_live,
    validate_model, REASONING_EFFORT)
from . import study_policy as policy

DEFAULT = {'schema': 'math-gkm.study.v2', 'transport': 'fixture',
    'model': 'gpt-6-astra', 'provider': 'codex-configured-provider',
    'usage_semantics': 'unverified_raw_only', 'rounds': 4, 'episode_rounds': 2,
    'invention_rounds': 1, 'call_seconds': 30, 'adaptation_seconds': 30,
    'arm_seconds': 12000, 'max_calls': 24, 'meta_calls': 8,
    'policy_trials': 1, 'policy_trial_rounds': 2, 'output_bytes': 2097152,
    'validation_seconds': 120, 'failure_limit': 3, 'fixture_policy_trial': False,
    'fixture_behavior': 'normal', 'ablations': [], 'fixture_connected': False,
    'knowledge_checks_per_round': 6}

def public_receipt(receipt):
    """Evaluation answers and compiler diagnostics never enter research roles."""
    if receipt.get('role') == 'adapter':
        return {k: v for k, v in receipt.items() if k not in ('payload', 'before', 'after')}
    return receipt

def public_comparison(result):
    return {k: v for k, v in result.items() if k not in ('sides', 'outcomes')}

def episode_envelope(p, count, tasks):
    evaluation = 2*p['adaptation_seconds'] + 2*(tasks+1)*p['validation_seconds'] if tasks else 0
    return {'research': (count*(2*p['call_seconds'] + (p['knowledge_checks_per_round']+1)*p['validation_seconds']), 2*count, count),
            'evaluation': (evaluation, 2 if tasks else 0, 0),
            'review': (2*p['call_seconds'], 2, 2)}

def validate_commitment(p, tasks=0):
    pools = episode_envelope(p, min(p['episode_rounds'], p['rounds']), tasks)
    for index, limit in enumerate(('arm_seconds', 'max_calls', 'meta_calls')):
        if sum(v[index] for v in pools.values()) > p[limit]:
            raise Invalid('impossible episode through evaluation/review: '+limit)

def validate_protocol(p):
    if set(p) != set(DEFAULT) or p['schema'] != DEFAULT['schema']:
        raise Invalid('protocol keys/schema mismatch')
    if p['transport'] not in ('fixture', 'live'):
        raise Invalid('only explicitly selected fixture or live transport')
    validate_model(p['model'])
    if p['fixture_behavior'] not in ('normal', 'sleep', 'missing', 'exit') or (p['transport'] == 'live' and (p['fixture_behavior'] != 'normal' or p['fixture_policy_trial'] or p['fixture_connected'])):
        raise Invalid('deterministic fixture behaviors are never live research settings')
    for k in ('rounds', 'episode_rounds', 'call_seconds', 'adaptation_seconds', 'arm_seconds',
              'max_calls', 'meta_calls', 'policy_trial_rounds', 'output_bytes', 'validation_seconds', 'failure_limit', 'knowledge_checks_per_round'):
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

    validate_commitment(p)

def validate_suite(suite, contract=None):
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
        if task['source_sha256'] != (contract or clean_contract())['root_sha256']:
            raise Invalid('suite source does not match exact root')
        if not all(isinstance(task[k], str) and task[k] for k in ('statement', 'scope', 'interface_type', 'transport_type')):
            raise Invalid('missing exact obligation or scope')
        if not isinstance(task['hypotheses'], list) or not isinstance(task['required_constants'], list):
            raise Invalid('explicit hypotheses and use dependencies required')
        seen.add(task['id'])
    if suite['tasks'] and (not suite['selector'] or not suite['selection_basis']):
        raise Invalid('suite selection provenance required')

def freeze(directory, config=None, suite=None, contract=None, curation=None):
    setup_start = time.monotonic()
    directory = Path(directory).resolve()
    if not directory.is_relative_to(ROOT) or directory == ROOT:
        raise Invalid('study must be a fresh directory inside this workspace')
    p = {**DEFAULT, **(config or {})}
    validate_protocol(p)
    contract = copy.deepcopy(contract or clean_contract())
    from .completion import NAME
    from .study_common import inside
    if (not NAME.fullmatch(contract['root_declaration']) or
        sha(inside(ROOT, contract['root_file'])) != contract['root_sha256'] or
        not all(contract.get(k) for k in ('root_meaning', 'assumptions', 'preference', 'correspondence_obligations'))):
        raise Invalid('incomplete exact versioned problem contract')
    if p['transport'] == 'live':
        authorize_live(contract)
    suite = suite or {'schema': 'math-gkm.suite.v2', 'selector': 'none',
        'selection_basis': 'No independent holdout available; no transfer claim authorized.',
        'independent': False, 'tasks': []}
    validate_suite(suite, contract)
    validate_commitment(p, len(suite['tasks']))
    if p['transport'] == 'live' and suite['tasks']:
        if not curation:
            raise Invalid('live heldout suite requires retained pretrial curation provenance')
        receipt_path = Path(curation['receipt'])
        if not receipt_path.resolve().is_relative_to(ROOT):
            raise Invalid('curation provenance outside construction workspace')
        receipt = read(receipt_path)
        if (sha(receipt_path) != curation['receipt_sha256'] or receipt.get('role') != 'curator' or
            receipt.get('outcome') != 'completed' or receipt.get('payload', {}).get('suite') != suite or
            digest(suite) != curation['suite_sha256']):
            raise Invalid('curation receipt/suite mismatch')
    if p['transport'] == 'live' and any(any(k.startswith('fixture_') for k in t) for t in suite['tasks']):
        raise Invalid('fixture answers cannot enter a live suite')
    directory.mkdir(parents=True, exist_ok=False)
    deployment = None
    if p['transport'] == 'live':
        from .study_deployment import require_deployment
        deployment = require_deployment(directory/'deployment-preflight')
    seed = directory/'seed'
    seed.mkdir()
    seed_files = list(dict.fromkeys([x for x in SEED if x != 'MathGKM/Markov.lean'] +
        [contract['root_file'], 'MathGKM/ResearchSemantics.lean', 'MathGKM/ContinuationObligations.lean'] +
        contract.get('seed_sources', [])))
    for name in seed_files:
        inside(ROOT, name)
        target = seed/name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT/name, target)
    write(seed/'contract.json', contract)
    write(seed/'seed-files.json', seed_files)
    write(directory/'protocol.json', p)
    write(directory/'evaluation/suite.json', suite)
    seal = {'seed': {name: sha(seed/name) for name in seed_files + ['contract.json']},
        'seed_files_sha256': sha(seed/'seed-files.json'),
        'curation': curation, 'deployment_preflight': deployment,
        'protocol': digest(p), 'suite': digest(suite), 'implementation': implementation(),
        'dependencies': dependency_identity(),
        'baseline_adjustments': ['empty history and agenda; no inherited artifacts',
            'same read-isolated filesystem and resource accounting as exploration',
            'same external independent reviews and withheld evaluation overhead charged',
            'single-agenda incumbent; no portfolio or policy installation',
            'shared prospective-plan guard added to both arms and charged equally'],
        'frozen_at': time.time(), 'status': 'experimental construction; no mathematical results'}
    write(directory/'seal.json', seal)
    write(directory/'audit/plan.json', {'encoding': 'conditional-source-witness-v1',
        'root': contract['root_sha256'], 'panel_hash': digest(suite),
        'checkpoints': ['initial']+[f'round-{r:04d}' for r in range(p['rounds'])]+['terminal'],
        'measurements': 'explicit checked witnesses and full definition/adapter/bridge overhead; unknown minimum stays unknown',
        'decision_channel': 'none'})
    seal['audit_plan_sha256'] = sha(directory/'audit/plan.json')
    seal['observer_plan'] = read(directory/'audit/plan.json')
    write(directory/'seal.json', seal)
    for mode in ('baseline', 'exploration'):
        arm = directory/'arms'/mode
        copy_seed(seed, arm/'workspace')
        snapshot(arm/'workspace', arm/'snapshots/initial', policy.initial(mode)['policy'],
                 [n for n in seed_files if n.endswith('.lean')])
        save_state(arm/'state.json', {'research': policy.initial(mode), 'round': 0,
            'calls': 0, 'meta_calls': 0, 'seconds': 0., 'status': 'ready',
            'active': None, 'receipts': [], 'policy_trials': 0, 'failures': 0,
            'phase': 'research', 'reviewed_rounds': [], 'evaluations': [],
            'resolution': None, 'receipt_hashes': {}, 'seal_hash': digest(seal)})
        from .study_observer import checkpoint
        checkpoint(directory, mode, 'initial', load_state(arm/'state.json'), arm/'snapshots/initial')
    write(directory/'setup-cost.json', {'elapsed_seconds': time.monotonic()-setup_start,
        'deployment_preflight': deployment,
        'accounting': 'common setup overhead, separately disclosed, no token/currency equivalence',
        'curation': curation or {'status': 'not provided', 'selection_basis': suite.get('selection_basis')},
        'ordering': 'baseline then exploration unless operator specifies; provider drift uncontrolled'})
    return directory

def verify(directory):
    seal = read(directory/'seal.json')
    if digest(read(directory/'protocol.json')) != seal['protocol'] or digest(read(directory/'evaluation/suite.json')) != seal['suite']:
        raise Invalid('frozen protocol/evaluation suite changed')
    if implementation() != seal['implementation']:
        raise Invalid('implementation changed since freeze; new reviewed study required')
    if read(directory/'protocol.json')['transport'] == 'live':
        from .study_deployment import verify_receipt
        verify_receipt(seal.get('deployment_preflight'))
    for name, expected in seal['seed'].items():
        if sha(directory/'seed'/name) != expected:
            raise Invalid('frozen seed changed')
    if sha(directory/'seed/seed-files.json') != seal['seed_files_sha256']:
        raise Invalid('seed input manifest changed')
    # Audit-side files are not a control input. Their integrity is assessed by
    # the observer against the seal, without changing research decisions.
    if dependency_identity() != seal['dependencies']:
        raise Invalid('dependency contents or tool identities changed')
    for mode in ('baseline', 'exploration'):
        arm = directory/'arms'/mode
        state = load_state(arm/'state.json')
        if state['seal_hash'] != digest(seal):
            raise Invalid('seal/state binding mismatch')
        for name, expected in seal['seed'].items():
            if sha(arm/'workspace'/name) != expected:
                raise Invalid('protected arm seed changed')
        for record in list(state['research'].get('knowledge', {}).values()) + list(state['research'].get('components', {}).values()):
            for name, expected in record['source_files'].items():
                if sha(arm/'workspace'/name) != expected:
                    raise Invalid('retained checked source capability changed')
    return read(directory/'protocol.json')

class Arm:
    def __init__(self, study, mode, fd):
        self.study, self.mode, self.fd = study, mode, fd
        self.root = study/'arms'/mode
        self.workspace = self.root/'workspace'
        self.p = read(study/'protocol.json')
        self.s = load_state(self.root/'state.json')
        self.tick = time.monotonic()
        self.active_budget = None
        self.deployment_ready = False

    def ensure_deployment(self):
        if self.p['transport'] == 'live' and not self.deployment_ready:
            from .study_deployment import require_deployment
            require_deployment(self.root/'deployment-preflights'/str(time.time_ns()))
            self.deployment_ready = True
            # Preflight is separately recorded common infrastructure overhead,
            # never a deduction from one arm's frozen research opportunities.
            # Controller wall still includes it; overlapping times are not summed.

    def admitted(self, research):
        seed = [n for n in read(self.study/'seed/seed-files.json') if n.endswith('.lean')]
        return sorted(set(seed) | {p for r in list(research['knowledge'].values()) +
            list(research['components'].values()) for p in r['source_files'] if p.endswith('.lean')})

    def available(self):
        if self.active_budget:
            pool = self.s['budget_pools'][self.active_budget]
            return pool['cap'] - pool['spent']
        return self.p['arm_seconds'] - self.s['seconds']

    def available_calls(self, meta=False):
        field, cap = ('meta_calls', 'meta_calls') if meta else ('calls', 'max_calls')
        pools = self.s.get('budget_pools', {})
        if self.active_budget and field in pools[self.active_budget]:
            pool = pools[self.active_budget]
            return pool[field] - pool.get(field+'_spent', 0)
        protected = sum(p.get(field, 0)-p.get(field+'_spent', 0) for p in pools.values())
        return self.p[cap] - self.s[field] - protected

    def fund_many(self, entries):
        # One durable commitment before any role effects, including call counters.
        pools = self.s.setdefault('budget_pools', {})
        fresh = {k: v for k,v in entries.items() if k not in pools}
        for k,(seconds,calls,meta) in entries.items():
            if k in pools and (pools[k]['cap'] != seconds or
                (calls is not None and pools[k].get('calls') != calls) or
                (meta is not None and pools[k].get('meta_calls') != meta)):
                raise Invalid('protected envelope changed')
        if sum(v[0] for v in fresh.values()) > self.available() or any(
            sum(v[i] or 0 for v in fresh.values()) > self.available_calls(meta=(i==2)) for i in (1,2)):
            raise Invalid('declared delayed horizon cannot be funded through review')
        for k,(seconds,calls,meta) in fresh.items():
            self.s.setdefault('reservations', {})['pool-'+k] = seconds
            if self.active_budget:
                pools[self.active_budget]['spent'] += seconds
            else:
                self.s['seconds'] += seconds
            pools[k] = {'cap': seconds, 'spent': 0}
            if calls is not None:
                pools[k].update(calls=calls, calls_spent=0, meta_calls=meta, meta_calls_spent=0)
        self.save()

    def fund(self, key, seconds):
        self.fund_many({key: (seconds, None, None)})

    @contextlib.contextmanager
    def budget(self, key):
        previous = self.active_budget
        self.active_budget = key
        try:
            yield
        finally:
            self.active_budget = previous

    def save(self):
        now = time.monotonic()
        self.s['controller_active_seconds'] = self.s.get('controller_active_seconds', 0) + now-self.tick
        self.tick = now
        save_state(self.root/'state.json', self.s)

    def stopped(self):
        return (self.study/'STOP.json').exists()

    def permitted(self, role, seconds):
        return (not self.stopped() and self.available_calls() > 0 and
            seconds <= self.available() and
            (role not in ('proposer', 'reviewer', 'selector') or self.available_calls(meta=True) > 0))

    def reserve(self, key, seconds):
        reservations = self.s.setdefault('reservations', {})
        if key in reservations:
            if reservations[key] != seconds:
                raise Invalid('reservation binding changed')
            return
        if seconds > self.available():
            raise Invalid('resource reservation exceeds allowance')
        reservations[key] = seconds
        if self.active_budget:
            self.s['budget_pools'][self.active_budget]['spent'] += seconds
        else:
            self.s['seconds'] += seconds
        self.save()

    def consume(self, job, receipt):
        if str(job) in self.s['receipts']:
            if self.s.get('receipt_hashes', {}).get(str(job)) != digest(receipt):
                raise Invalid('durable receipt changed after accounting')
            return receipt
        if 'call-'+job.name not in self.s.get('reservations', {}):
            self.s['seconds'] += receipt['elapsed_seconds']  # legacy interrupted job
        self.s['receipts'].append(str(job))
        self.s.setdefault('receipt_hashes', {})[str(job)] = digest(receipt)
        self.s['active'] = None
        self.s['active_intent'] = None
        self.s['failures'] = 0 if receipt['outcome'] == 'completed' else self.s['failures'] + 1
        self.save()
        return receipt

    def recover(self):
        active = self.s['active']
        if not active:
            # Legacy/pre-intent crashes can leave orphan jobs. They are never
            # ignored and never relaunched. Account and reconcile each one.
            for job in sorted((self.root/'jobs').glob('*')):
                if job.is_dir() and str(job) not in self.s['receipts']:
                    self.s['active'] = str(job)
                    if (job/'spec.json').exists() and job.name not in self.s.get('counted_jobs', []):
                        self.s['calls'] += 1
                        if read(job/'spec.json')['role'] in ('proposer', 'reviewer', 'selector'):
                            self.s['meta_calls'] += 1
                        self.s.setdefault('counted_jobs', []).append(job.name)
                    self.save()
                    return self.recover()
            return
        job = Path(active)
        intent = self.s.get('active_intent')
        if intent and not (job/'spec.json').exists():
            write(job/'spec.json', intent['spec'])
            write(job/'request.json', intent['request'])
        guard = self.s.get('protocol_state', {})
        if guard.get('pending'):
            from .study_bridge import event
            if not guard.get('inflight'):
                event(self, {'claim': {'id': guard['pending']}})
            event(self, 'finish')
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
        if not (job/'spec.json').exists():
            raise Invalid('orphan job lacks binding; manual reconciliation required; no replay')
        spec = read(job/'spec.json')
        receipt = {'outcome': 'uncertain_effects_not_replayed', 'payload': None,
            'model': self.p['model'], 'reasoning_effort': REASONING_EFFORT,
            'elapsed_seconds': spec['seconds'], 'role': spec['role'],
            'usage_raw': [], 'normalized_tokens': None, 'mathematical_resolution': False,
            'request_id': spec['request_id'], 'recovery': 'full reservation charged; inspect retained partial artifacts'}
        write(job/'receipt.json', receipt)
        return self.consume(job, receipt)

    def call(self, key, role, req, workspace=None, readonly=False, seconds=None):
        """Idempotent logical invocation; completed or uncertain effects never replay."""
        job = self.root/'jobs'/key
        req = {**req, 'model': self.p['model'], 'reasoning_effort': REASONING_EFFORT}
        if (job/'receipt.json').exists():
            expected = {**req, 'request_id': key}
            if (job/'request.json').exists() and read(job/'request.json') != expected:
                raise Invalid('logical invocation request changed after execution')
            return self.consume(job, read(job/'receipt.json'))
        self.ensure_deployment()
        seconds = seconds or self.p['call_seconds']
        if not self.permitted(role, seconds):
            raise Invalid('resource allowance exhausted or stop requested')
        if job.exists():
            raise Invalid('unreconciled invocation; use recover')
        workspace = workspace or self.workspace
        req = {**req, 'request_id': key}
        spec = {'request_id': key, 'workspace': str(workspace), 'role': role,
            'transport': self.p['transport'], 'model': self.p['model'], 'provider': self.p['provider'],
            'reasoning_effort': REASONING_EFFORT,
            'usage_semantics': self.p['usage_semantics'], 'readonly': readonly,
            'seconds': seconds, 'output_bytes': self.p['output_bytes'], 'stop': str(self.study/'STOP.json'),
            'fixture_policy_trial': self.p['fixture_policy_trial'], 'fixture_behavior': self.p['fixture_behavior'],
            'fixture_connected': self.p['fixture_connected']}
        spec['retained_sources'] = {p: h for record in
            list(req.get('knowledge', {}).values()) + list(req.get('components', {}).values())
            for p, h in record['source_files'].items()}
        # Persist intent and accounting BEFORE creating a job or any role effect.
        self.reserve('call-'+key, seconds)
        self.s['active'] = str(job)
        self.s['active_intent'] = {'spec': spec, 'request': req}
        self.s['calls'] += 1
        if self.active_budget and 'calls' in self.s['budget_pools'][self.active_budget]:
            pool = self.s['budget_pools'][self.active_budget]
            pool['calls_spent'] += 1
            if role in ('proposer', 'reviewer', 'selector'):
                pool['meta_calls_spent'] += 1
        self.s.setdefault('counted_jobs', []).append(key)
        if role in ('proposer', 'reviewer', 'selector'):
            self.s['meta_calls'] += 1
        self.save()
        write(job/'spec.json', spec)
        write(job/'request.json', req)
        from .study_policy import prompt
        # Retain execution identity in metadata without changing study prompts.
        prompt_req = {k: v for k, v in req.items() if k not in ('model', 'reasoning_effort')}
        (job/'prompt.txt').write_text(prompt(prompt_req) if role in ('proposer', 'researcher', 'reviewer', 'selector') else
            policy.COMMON + '\nAdapt the frozen solver to these exact obligations. Do not change hypotheses or source. '
            'Return solutions keyed by task id with module, term, interface_term and transport_term, or '
            '{status:"bounded_non_solution",reason:string} for a valid bounded attempt without a solution. '
            'No independent test answers are supplied.\n' + canonical(prompt_req))
        from .study_bridge import event
        event(self, {'issue': {'id': key}})
        event(self, {'claim': {'id': key}})
        event(self, 'record')
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
                if (source/'history').exists():
                    shutil.copytree(source/'history', workspace/'history', dirs_exist_ok=True)
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
        first = r - r % self.p['episode_rounds']
        count = min(self.p['episode_rounds'], self.p['rounds']-first)
        key = 'episode-research-'+str(first)
        if key not in self.s.get('budget_pools', {}):
            pools = episode_envelope(self.p, count, len(read(self.study/'evaluation/suite.json')['tasks']))
            end = first+count
            self.fund_many({key: pools['research'],
                'paired-evaluation-episode-'+str(end): pools['evaluation'],
                'review-'+str(end): pools['review']})
        with self.budget(key):
            self._research_round()

    def _research_round(self):
        r = self.s['round']
        self.archive_sources()
        transaction = self.root/'rounds'/f'{r:04d}'
        if not (transaction/'start.json').exists():
            write(transaction/'start.json', {'research': self.s['research'], 'source': inventory(self.workspace)})
        start = read(transaction/'start.json')
        req = policy.request(start['research'], r, self.p)
        planned = self.call(f'plan-{r:04d}', 'proposer', {**req, 'role': 'proposer'}, readonly=True)
        if planned['outcome'] != 'completed':
            raise Invalid('prospective proposer failed within budget; no trial authorized')
        committed = self.root/'jobs'/f'plan-{r:04d}'/'validated-plan.json'
        if committed.exists():
            binding = read(committed)
            if binding['receipt_hash'] != digest(planned):
                raise Invalid('committed prospective plan changed')
            staged, commitment = binding['research'], binding['commitment']
        else:
            staged, commitment = policy.commit(start['research'], planned['payload'], self.workspace, r, self.p)
            write(committed, {'receipt_hash': digest(planned), 'research': staged, 'commitment': commitment})
        req = policy.request(staged, r, self.p)
        req.update(committed_trial=commitment['trial'], prospective_binding=digest(commitment),
                   commitment=commitment)
        from .study_knowledge import SCHEMAS, ingest
        req['checked_submission_schemas'] = SCHEMAS
        result = self.call(f'round-{r:04d}', 'researcher', req)
        updated = copy.deepcopy(staged)
        if result['outcome'] == 'completed':
            try:
                policy.record(updated, result['payload'], self.workspace, r, self.p, prospective=commitment)
                ingest(self, updated, result['payload'], self.workspace, transaction/'checks')
                updated['next_trial'] = result['payload'].get('trial')
            except (Invalid, KeyError, TypeError) as exc:
                updated = copy.deepcopy(staged)
                updated['observations'].append({'round': r, 'validation_failure': str(exc),
                    'status': 'report_rejected; no theorem or refutation established'})
        else:
            updated['observations'].append({'round': r, 'outcome': result['outcome'],
                'meaning': 'failure within budget; no unprovability conclusion'})
        from .study_bridge import observation
        observation(self, 'research-report-and-checked-knowledge', start['research'], updated,
                    {'receipt': digest(result), 'commitment': digest(commitment)})
        self.s['research'] = updated
        write(self.workspace/f'history/round-{r:04d}.json', result)
        claim = result.get('payload', {}).get('completion') if result['outcome'] == 'completed' else None
        if claim:
            from .study_completion import check
            checked = check(self, claim)
            write(self.root/f'completion-claims/round-{r:04d}.json', {'claim': claim, 'result': checked})
        target = self.root/'snapshots'/f'round-{r:04d}'
        if not target.exists():
            snapshot(self.workspace, target, self.s['research']['policy'], self.admitted(self.s['research']))
        else:
            verify_snapshot(target)
        self.archive_sources()
        self.s['round'] += 1
        self.s['phase'] = 'review' if self.s['round'] % self.p['episode_rounds'] == 0 or self.s['round'] == self.p['rounds'] else 'research'
        from .study_observer import checkpoint
        checkpoint(self.study, self.mode, f'round-{r:04d}', self.s, target)
        self.save()

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
        pending_policy = self.s['research']['pending_policy']
        pending_program = self.s['research'].get('pending_program')
        candidate = None
        if self.mode != 'baseline' and (pending_policy or pending_program):
            candidate = {'policy': pending_policy['policy'] if pending_policy else self.s['research']['policy'],
                         'program': pending_program['program'] if pending_program else self.s['research']['program']}
            candidate['hash'] = digest(candidate)
        committed = self.root/f'review-inputs/review-{r}.json'
        if committed.exists():
            frozen = read(committed)
            records, trial = frozen['records'], frozen['trial']
        else:
            records = {'round': r, 'receipts': [public_receipt(read(Path(p)/'receipt.json')) for p in self.s['receipts']],
                'decisions': self.s['research']['decisions'], 'evaluations': self.s['evaluations'],
                'knowledge': self.s['research']['knowledge'], 'components': self.s['research']['components'],
                'remaining_obligations': self.s['research']['remaining_obligations'],
                'formal_obligations': self.s['research']['formal_obligations']}
            from .study_transfer import evaluate_pair
            episode_start = max(0, r-self.p['episode_rounds'])
            before = self.root/'snapshots'/('initial' if episode_start == 0 else f'round-{episode_start-1:04d}')
            after = self.root/'snapshots'/f'round-{r-1:04d}'
            records['episode_transfer'] = public_comparison(evaluate_pair(self, before, after, f'episode-{r}'))
            trial = None
            if candidate and self.s['policy_trials'] < self.p['policy_trials']:
                trial = self.policy_trial(candidate)
                records['policy_comparison'] = public_comparison(trial)
                records['compared_sources'] = {}
                for side, outcome in trial.get('outcomes', {}).items():
                    frozen_source = Path(outcome['snapshot'])
                    manifest = verify_snapshot(frozen_source)
                    records['compared_sources'][side] = {'binding': manifest['binding'],
                        'files': {name: (frozen_source/'source'/name).read_text()
                                  for name in manifest['files'] if name.endswith('.lean')}}
            records['receipts'] = [public_receipt(read(Path(p)/'receipt.json')) for p in self.s['receipts']]
            write(committed, {'records': records, 'trial': trial})
        ws = self.role_workspace(f'review-{r}', records, self.workspace)
        self.fund('review-'+str(r), 2*self.p['call_seconds'])
        with self.budget('review-'+str(r)):
            result = self.call(f'review-{r}', 'reviewer', {'role': 'reviewer', 'records': 'inbox/records.json'}, ws, True)
        valid = self.checked_findings(result, ws)
        selection_records = {'review': result, 'review_artifact_refs_valid': valid, 'comparison': public_comparison(trial) if trial else None}
        sel_ws = self.role_workspace(f'select-{r}', selection_records)
        with self.budget('review-'+str(r)):
            selected = self.call(f'select-{r}', 'selector', {'role': 'selector', 'records': 'inbox/records.json'}, sel_ws, True)
        accepted = (valid and self.checked_findings(selected, sel_ws, True) and
            selected['payload'].get('choice') == 'candidate' and trial and trial.get('eligible'))
        installed_before = copy.deepcopy(self.s['research'])
        install_start = time.monotonic()
        if accepted:
            self.s['research']['policy'] = candidate['policy']
            self.s['research']['program'] = candidate['program']
        from .study_bridge import observation
        observation(self, 'experimental-selection-and-identity-migration', installed_before, self.s['research'],
                    {'selection_receipt': digest(selected), 'review_receipt': digest(result),
                     'accepted': bool(accepted), 'comparison_hash': digest(trial), 'certified_switch': False})
        self.s['installation_observed_seconds'] = self.s.get('installation_observed_seconds', 0) + time.monotonic()-install_start
        write(self.root/f'decisions/review-{r}.json', {'accepted_experimental_change': bool(accepted),
            'candidate': candidate, 'review': result, 'selection': selected,
            'certified_switch': False, 'comparison': trial})
        self.s['research']['pending_policy'] = None
        self.s['research']['pending_program'] = None
        policy.finish_episode(self.s['research'], r, {'accepted': bool(accepted), 'decision': f'review-{r}'})
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
        calls = 4*self.p['policy_trial_rounds']
        side_budget = self.p['policy_trial_rounds'] * (2*self.p['call_seconds'] +
            self.p['knowledge_checks_per_round']*self.p['validation_seconds'])
        tasks = len(read(self.study/'evaluation/suite.json')['tasks'])
        downstream = 2*self.p['adaptation_seconds'] + 2*(tasks+1)*self.p['validation_seconds'] + 2*self.p['call_seconds']
        budget = 2*side_budget + downstream
        trial_commitment = destination/'trial-commitment.json'
        if not trial_commitment.exists():
            if budget > self.available():
                return {'eligible': False, 'status': 'insufficient_predetermined_continuation_budget'}
            if calls + 2 > self.available_calls() or 2*self.p['policy_trial_rounds'] > self.available_calls(meta=True):
                return {'eligible': False, 'status': 'insufficient_predetermined_call_or_meta_budget'}
            write(trial_commitment, {'candidate': candidate, 'calls': calls, 'seconds': budget,
                'rounds_each': self.p['policy_trial_rounds'], 'state_binding': digest(self.s['research'])})
        elif read(trial_commitment)['candidate'] != candidate:
            raise Invalid('executable/policy candidate changed after comparison commitment')
        for side in ('incumbent', 'candidate'):
            self.fund(key+'-'+side, side_budget)
        self.fund(key+'-evaluation', downstream - 2*self.p['call_seconds'])
        self.fund('review-'+str(self.s['round']), 2*self.p['call_seconds'])
        seed = destination/'before'
        if not seed.exists():
            snapshot(self.workspace, seed, self.s['research']['policy'], self.admitted(self.s['research']))
        before = verify_snapshot(seed)
        if not (destination/'decision-state.json').exists():
            write(destination/'decision-state.json', {'research': self.s['research'], 'round': self.s['round']})
        decision = read(destination/'decision-state.json')
        branch_protocol = {**self.p, 'rounds': max(self.p['rounds'], decision['round']+self.p['policy_trial_rounds'])}
        outcomes = {}
        for side, p, program in [('incumbent', decision['research']['policy'], decision['research']['program']),
                                  ('candidate', candidate['policy'], candidate['program'])]:
            ws = self.root/'roles'/f'{key}-{side}'
            if not ws.exists():
                copy_seed(self.study/'seed', ws)
                for name in before['files']:
                    target = ws/name
                    target.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(seed/'source'/name, target)
                if (self.workspace/'history').exists():
                    shutil.copytree(self.workspace/'history', ws/'history', dirs_exist_ok=True)
            branch_state = destination/f'{side}-state.json'
            if branch_state.exists():
                progress = load_state(branch_state)
            else:
                local = copy.deepcopy(decision['research'])
                local.update(policy=p, program=program, pending_policy=None, pending_program=None)
                progress = {'research': local, 'next': 0, 'receipts': [], 'valid': True}
                save_state(branch_state, progress)
            for n in range(progress['next'], self.p['policy_trial_rounds']):
                index = decision['round'] + n
                local = progress['research']
                req = policy.request(local, index, branch_protocol)
                req['comparison_branch'] = 'blinded-policy-continuation'
                with self.budget(key+'-'+side):
                    plan = self.call(f'{key}-{side}-plan-{n}', 'proposer', {**req, 'role': 'proposer'}, ws, True)
                if plan['outcome'] != 'completed':
                    raise Invalid('branch prospective proposer failed within budget')
                committed = destination/f'{side}-commit-{n}.json'
                if committed.exists():
                    binding = read(committed)
                    if binding['receipt_hash'] != digest(plan):
                        raise Invalid('branch prospective receipt changed')
                    staged, commitment = binding['research'], binding['commitment']
                else:
                    staged, commitment = policy.commit(local, plan['payload'], ws, index, branch_protocol)
                    write(committed, {'receipt_hash': digest(plan), 'research': staged, 'commitment': commitment})
                req = policy.request(staged, index, branch_protocol)
                from .study_knowledge import SCHEMAS, ingest
                req.update(committed_trial=commitment['trial'], prospective_binding=digest(commitment),
                           commitment=commitment, checked_submission_schemas=SCHEMAS)
                with self.budget(key+'-'+side):
                    result = self.call(f'{key}-{side}-{n}', 'researcher', req, ws)
                progress['receipts'].append(result)
                if result['outcome'] == 'completed':
                    try:
                        local = copy.deepcopy(staged)
                        policy.record(local, result['payload'], ws, index, branch_protocol, prospective=commitment)
                        with self.budget(key+'-'+side):
                            ingest(self, local, result['payload'], ws, destination/f'{side}-checks-{n}')
                    except (Invalid, KeyError, TypeError) as exc:
                        progress['valid'] = False
                        local = copy.deepcopy(staged)
                        local['observations'].append({'status': 'invalid_branch_report', 'reason': str(exc)})
                else:
                    progress['valid'] = False
                    local = copy.deepcopy(staged)
                write(ws/f'history/branch-round-{index}.json', result)
                progress.update(research=local, next=n+1)
                save_state(branch_state, progress)
            target = destination/side
            if not target.exists():
                snapshot(ws, target, p, self.admitted(progress['research']))
            outcomes[side] = {'snapshot': str(target), 'receipts': progress['receipts'], 'valid': progress['valid']}
        from .study_transfer import evaluate_pair
        with self.budget(key+'-evaluation'):
            comparison = evaluate_pair(self, Path(outcomes['incumbent']['snapshot']), Path(outcomes['candidate']['snapshot']), key,
                                       policy_comparison=True)
        result = {'status': 'experimental finite-horizon comparison', 'seed_binding': before['binding'],
            'rounds_each': self.p['policy_trial_rounds'], 'outcomes': outcomes,
            'comparison': public_comparison(comparison),
            'eligible': comparison['eligible'] and all(s['valid'] for s in outcomes.values()),
            'program_bindings': {'incumbent': digest(decision['research']['program']), 'candidate': digest(candidate['program'])},
            'scope': 'bounded continuation experiment; later policy selection is outside this trial, never whole-continuation certification',
            'certified_switch': False}
        write(destination/'result.json', result)
        self.s.setdefault('completed_policy_trials', []).append(key)
        self.s['policy_trials'] = len(self.s['completed_policy_trials'])
        self.save()
        return result


    def run(self):
        if self.s['resolution']:
            from .study_completion import terminal
            terminal(self)
            return
        if self.p['transport'] == 'live':
            authorize_live(read(self.workspace/'contract.json'))
        while self.s['active'] or any(str(p) not in self.s['receipts'] for p in (self.root/'jobs').glob('*') if p.is_dir()):
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
                if self.s['resolution']:
                    self.s['status'] = 'mathematically_resolved'
                    break
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
    f.add_argument('--contract', type=Path)
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
            freeze(directory, read(args.config) if args.config else None, read(args.suite) if args.suite else None,
                   read(args.contract) if args.contract else None,
                   read(args.suite.parent/'provenance.json') if args.suite and (args.suite.parent/'provenance.json').exists() else None)
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
