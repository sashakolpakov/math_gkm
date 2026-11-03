"""Neutral method-learning integration, separate from mathematical research.

Controller cases simulate role/admission/comparison outcomes to test real
lifecycle wiring. RealLeanMethodChecks uses the real bounded Lean validator on
neutral statements; it does not call a model or assert proposer improvement.
"""
import copy
import json
from pathlib import Path
import tempfile
from types import MethodType, SimpleNamespace
import unittest
from unittest.mock import patch

from machinery import study, study_policy as policy
from machinery import study_research_feedback as feedback
from machinery.study_common import (ROOT, Invalid, digest, load_state, lock, read, write,
                                    snapshot, sha, verify_snapshot, REASONING_EFFORT)
from tests.test_revision_static_checkpoint import neutral_contract

CANARY = 'PRIVATE_METHOD_CHALLENGE_AND_SOLUTION'


def ordinary():
    return {'agenda': ['Inspect the unchanged neutral goal.'], 'summary': 'Neutral own observation.',
            'hypotheses': [], 'evidence': [], 'trial': None, 'use_links': [],
            'policy_proposal': None, 'completion': None}


def synthetic_trial(before='a'*64, after='b'*64, *, valid=True):
    """Explicitly simulated mathematical outcomes for controller wiring only."""
    return {'status': 'valid_finite_budget_comparison' if valid else 'invalid_frozen_context',
        'eligible': valid, 'all_frozen_declarations_retained': True,
        'task_gains': [CANARY] if valid else [], 'transfer': [CANARY] if valid else [],
        'regressions': [], 'binding': {'before': before, 'after': after, 'suite': CANARY,
            'adaptation_seconds_each': 30, 'validation_seconds_each_task': 600,
            'catalog_seconds_each': 1800},
        'measured_costs': {'before': {'adapter_seconds': 2, 'validation_seconds': 1,
            'context_validation_seconds': 1}, 'after': {'adapter_seconds': 1,
                'validation_seconds': 1, 'context_validation_seconds': 1}},
        'sides': {'private_answer': CANARY}, 'catalogs': {CANARY: CANARY}}


class MethodLearningControllerIntegration(unittest.TestCase):
    """Actual Arm lifecycle; admissions, role calls and comparisons are doubles."""
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='method-loop-', dir=ROOT/'.scratch')
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name)
        for target, value in [('machinery.study.dependency_identity', {'fixture': 'fixed'}),
                              ('machinery.snapshot_routing.ENABLED', False)]:
            item = patch(target, return_value=value) if isinstance(value, dict) else patch(target, value)
            item.start(); self.addCleanup(item.stop)
        self.directory = self.base/'study'
        study.freeze(self.directory, {'rounds': 4, 'episode_rounds': 2, 'policy_trials': 0,
            'arm_seconds': 100000, 'max_calls': 100, 'meta_calls': 50,
            'method_learning': {'enabled': True, 'repetitions': 2,
                'max_methods_per_review': 1, 'max_methods': 4,
                'holdout_tasks': 1, 'regression_limit': 1}}, contract=neutral_contract())

    def add_method(self, arm, identifier='method-neutral'):
        plan = {**ordinary(), 'method_plan': {'id': identifier, 'predictions': [
            {'consequence_id': 'neutral-identity', 'statement': '∀ n : Nat, n = n'}]}}
        arm.s['research'], _ = policy.commit(arm.s['research'], plan, arm.workspace, 0, arm.p)
        source = arm.workspace/'MathGKM/MethodAcquired.lean'
        source.write_text('namespace MathGKM.MethodAcquired\n'
                          'theorem identity (n : Nat) : n = n := rfl\n'
                          'end MathGKM.MethodAcquired\n')
        note = arm.workspace/'research/method-use.md'
        note.write_text('Own neutral application instructions.')
        arm.s['research']['knowledge']['neutral-proof'] = {
            'id': 'neutral-proof', 'kind': 'mathematical_claims',
            'proposal_hash': 'f'*64, 'receipt_hash': 'e'*64,
            'proposal': {'statement': '∀ n : Nat, n = n'},
            'task': {'statement': '∀ n : Nat, n = n', 'hypotheses': []},
            'claim': {'statement': '∀ n : Nat, n = n', 'hypotheses': []},
            'source_files': {'MathGKM/MethodAcquired.lean': sha(source)},
            'exports': ['MathGKM.MethodAcquired.identity'],
            'export_module': 'MathGKM.MethodAcquired'}
        target = arm.root/'snapshots/round-0000'
        snapshot(arm.workspace, target, arm.s['research']['policy'], arm.admitted(arm.s['research']))
        candidate = {'id': identifier, 'accepted_ids': ['neutral-proof'],
            'application_notes': ['research/method-use.md'],
            'goal_connection': 'Neutral fixture identity only.',
            'predictions': [{'consequence_id': 'neutral-identity', 'accepted_id': 'neutral-proof'}]}
        with patch('machinery.study_knowledge.verify_record'):
            arm.queue_method_candidate(candidate, target, 0)
        snapshot(arm.workspace, arm.root/'snapshots/round-0001',
            arm.s['research']['policy'], arm.admitted(arm.s['research']))
        return candidate

    def role_double(self, arm, seen):
        def call(current, key, role, req, workspace=None, readonly=False, seconds=None):
            job = current.root/'jobs'/key
            if (job/'receipt.json').exists():
                return read(job/'receipt.json')
            seen.append((key, role, copy.deepcopy(req)))
            duration = seconds or current.p['call_seconds']
            current.reserve('call-'+key, duration)
            current.s['calls'] += 1
            is_meta = role in ('proposer', 'reviewer', 'selector')
            current.s['meta_calls'] += int(is_meta)
            if current.active_budget:
                pool = current.s['budget_pools'][current.active_budget]
                if 'calls' in pool:
                    pool['calls_spent'] += 1
                    pool['meta_calls_spent'] += int(is_meta)
            if role == 'reviewer':
                payload = {'findings': [{'path': 'MathGKM/HarnessFixture.lean',
                    'sha256': neutral_contract()['root_sha256'],
                    'finding': 'Neutral source remains available.'}],
                    'scope': 'Synthetic own-source diagnosis.'}
            elif role == 'selector':
                payload = {'choice': 'incumbent', 'reason': 'No strategy change proposed.',
                           'evidence': []}
            else:
                payload = ordinary()
                if role == 'researcher':
                    payload['prospective_binding'] = req['prospective_binding']
            request = {**req, 'role': role, 'request_id': key,
                'model': current.p['model'], 'reasoning_effort': REASONING_EFFORT}
            receipt = {'request_id': key, 'role': role, 'outcome': 'completed',
                'payload': payload, 'elapsed_seconds': 1, 'returncode': 0,
                'model': current.p['model'], 'reasoning_effort': REASONING_EFFORT,
                'before': {}, 'after': {}, 'resources': {'termination_cause': None}}
            write(job/'request.json', request)
            write(job/'final.json', {'payload_json': payload})
            write(job/'receipt.json', receipt)
            current.s.setdefault('counted_jobs', []).append(key)
            current.s['receipts'].append(str(job))
            current.s['receipt_hashes'][str(job)] = digest(receipt)
            current.save()
            return receipt
        arm.call = MethodType(call, arm)

    def test_method_review_reaches_next_actual_planning_and_execution_requests(self):
        from machinery import study_methods
        seen, comparisons = [], []
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            self.role_double(arm, seen)
            underlying_call = arm.call
            planned = {'id': 'method-neutral', 'predictions': [
                {'consequence_id': 'neutral-identity', 'statement': '∀ n : Nat, n = n'}]}
            candidate = {'id': 'method-neutral', 'accepted_ids': ['neutral-proof'],
                'application_notes': ['research/method-use.md'],
                'goal_connection': 'Neutral fixture only.',
                'predictions': [{'consequence_id': 'neutral-identity', 'accepted_id': 'neutral-proof'}]}
            def planned_calls(current, key, role, req, workspace=None, readonly=False, seconds=None):
                receipt = underlying_call(key, role, req, workspace, readonly, seconds)
                if key == 'plan-0000':
                    receipt['payload']['method_plan'] = copy.deepcopy(planned)
                if key == 'round-0000':
                    source = current.workspace/'MathGKM/MethodAcquired.lean'
                    source.write_text('namespace MathGKM.MethodAcquired\n'
                        'theorem identity (n : Nat) : n = n := rfl\nend MathGKM.MethodAcquired\n')
                    (current.workspace/'research/method-use.md').write_text('Own neutral application note.')
                    receipt['payload']['method_candidate'] = copy.deepcopy(candidate)
                job = current.root/'jobs'/key
                write(job/'receipt.json', receipt)
                write(job/'final.json', {'payload_json': receipt['payload']})
                current.s['receipt_hashes'][str(job)] = digest(receipt)
                current.save()
                return receipt
            arm.call = MethodType(planned_calls, arm)
            def simulated_admit(current, state, report, workspace, directory):
                if report.get('method_candidate'):
                    state['knowledge']['neutral-proof'] = {
                        'id': 'neutral-proof', 'kind': 'mathematical_claims',
                        'proposal_hash': 'f'*64, 'receipt_hash': 'e'*64,
                        'proposal': {'statement': '∀ n : Nat, n = n'},
                        'task': {'statement': '∀ n : Nat, n = n', 'hypotheses': []},
                        'claim': {'statement': '∀ n : Nat, n = n', 'hypotheses': []},
                        'source_files': {'MathGKM/MethodAcquired.lean': sha(workspace/'MathGKM/MethodAcquired.lean')},
                        'exports': ['MathGKM.MethodAcquired.identity'],
                        'export_module': 'MathGKM.MethodAcquired'}
            with patch.object(arm, 'closed_planner_receipt', return_value={'fixture': 'synthetic authenticated role'}), \
                    patch('machinery.study_knowledge.ingest', side_effect=simulated_admit), \
                    patch('machinery.study_knowledge.verify_record'):
                arm.research_round()
                self.assertEqual(len(arm.s['method_learning']['pending']), 1)
                queued = arm.s['method_learning']['pending'][0]
                self.assertEqual(Path(queued['prepared']['before_path']).name, 'initial')
                self.assertEqual(queued['start_round'], 0)
                arm.research_round()
            self.assertEqual(arm.s['round'], 2)
            self.assertEqual(arm.s['phase'], 'review')
            def compare(current, prepared, **kwargs):
                comparisons.append(prepared['reference'])
                return {'method_id': prepared['method_id'], 'reference': prepared['reference'],
                    'before': prepared['before'], 'candidate': prepared['candidate'],
                    'expected_trials': 2, 'trials': [synthetic_trial(prepared['before'], prepared['candidate'])]*2,
                    'development_role_seconds': kwargs.get('development_role_seconds'), 'status': 'completed'}
            with patch.object(study_methods, 'compare_method', side_effect=compare), \
                    patch('machinery.study_transfer.evaluate_pair', side_effect=lambda *a, **k: synthetic_trial()), \
                    patch.object(arm, 'closed_planner_receipt', return_value={'fixture': 'synthetic authenticated role'}):
                arm.review()
                self.assertEqual(len(comparisons), 1)
                current = arm.s['research']['review_feedback'][-1]
                method = current['method_comparisons'][0]
                self.assertEqual(method['method_id'], 'method-neutral')
                self.assertEqual(method['valid_trials'], 2)
                self.assertTrue(method['eligible'])
                self.assertNotIn(CANARY, json.dumps(current))
                calls = arm.s['calls']
                arm.review()
                self.assertEqual(arm.s['calls'], calls)
                # A completed review remains idempotent after a durable reload.
                resumed = study.Arm(self.directory, 'exploration', fd)
                with patch.object(study_methods, 'compare_method', side_effect=AssertionError('must not repeat')):
                    resumed.review()
                self.assertEqual(resumed.s['calls'], calls)
                arm.research_round()
            for role in ('proposer', 'researcher'):
                key = 'plan-0002' if role == 'proposer' else 'round-0002'
                delivered = [req for actual_key, actual_role, req in seen
                             if actual_key == key and actual_role == role]
                self.assertEqual(len(delivered), 1)
                packet = delivered[0]['research_feedback']['latest']
                self.assertEqual(packet['method_comparisons'], current['method_comparisons'])
                self.assertNotIn(CANARY, json.dumps(delivered[0]))
            source_review = read(arm.root/'roles/review-source-v1-2/inbox/records.json')
            self.assertNotIn(CANARY, json.dumps(source_review))
            self.assertEqual(len(comparisons), 1)

    def test_invalid_method_comparison_reaches_research_as_inconclusive(self):
        from machinery import study_methods
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            self.add_method(arm)
            arm.s['round'] = 2; arm.s['phase'] = 'review'; arm.save()
            self.role_double(arm, [])
            def invalid(current, prepared, **kwargs):
                return {'method_id': prepared['method_id'], 'reference': prepared['reference'],
                    'before': prepared['before'], 'candidate': prepared['candidate'],
                    'expected_trials': 2, 'trials': [synthetic_trial(prepared['before'],
                        prepared['candidate'], valid=False)]*2,
                    'development_role_seconds': None, 'status': 'completed'}
            with patch.object(study_methods, 'compare_method', side_effect=invalid), \
                    patch('machinery.study_transfer.evaluate_pair', side_effect=lambda *a, **k: synthetic_trial()):
                arm.review()
            for role in ('proposer', 'researcher'):
                req = policy.request(arm.s['research'], 2, arm.p, role)
                method = req['research_feedback']['latest']['method_comparisons'][0]
                self.assertEqual(method['assessment'], 'inconclusive')
                self.assertIsNone(method['gains'])
                self.assertFalse(method['eligible'])
                self.assertNotIn(CANARY, json.dumps(req))
            self.assertIsNone(arm.s['resolution'])

    def test_nested_comparison_call_reservations_are_transferred_once(self):
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            arm.fund_many({'method-parent': (210, 4, 0)})
            with arm.budget('method-parent'):
                arm.fund_many({'pair-0': (100, 2, 0), 'pair-1': (100, 2, 0)})
                self.assertEqual(arm.available_calls(), 0)
                self.assertEqual(arm.available(), 10)
                # Reopening an identical completed reservation cannot charge it twice.
                arm.fund_many({'pair-0': (100, 2, 0), 'pair-1': (100, 2, 0)})
                self.assertEqual(arm.s['budget_pools']['method-parent']['calls_spent'], 4)
                with self.assertRaises(Invalid):
                    arm.fund_many({'unfunded-third-pair': (1, 1, 0)})
            # These counter increments simulate the ordinary Arm.call accounting;
            # no actual model or subprocess is invoked by this funding test.
            for name in ('pair-0', 'pair-1'):
                with arm.budget(name):
                    for index in range(2):
                        self.assertEqual(arm.available_calls(), 2-index)
                        arm.reserve(name+'-adapter-'+str(index), 10)
                        arm.s['calls'] += 1
                        arm.s['budget_pools'][name]['calls_spent'] += 1
                    self.assertEqual(arm.available_calls(), 0)
            self.assertEqual(arm.s['calls'], 4)
            self.assertEqual(arm.available_calls(), arm.p['max_calls']-4)
            self.assertEqual(arm.s['seconds'], 210)
            self.assertEqual(arm.s['budget_pools']['method-parent']['spent'], 200)

    def test_baseline_does_not_pay_for_unavailable_method_comparisons(self):
        with lock(self.directory/'controller.lock') as fd:
            baseline = study.Arm(self.directory, 'baseline', fd)
            with patch.object(baseline, '_research_round'):
                baseline.research_round()
            self.assertFalse(any(k.startswith('method-learning-review-')
                                 for k in baseline.s['budget_pools']))
            explorer = study.Arm(self.directory, 'exploration', fd)
            with patch.object(explorer, '_research_round'):
                explorer.research_round()
            self.assertIn('method-learning-review-2', explorer.s['budget_pools'])
            self.assertGreater(explorer.s['seconds'], baseline.s['seconds'])

    def test_live_method_study_requires_a_complete_fresh_batch_before_preflight(self):
        cfg = {**read(self.directory/'protocol.json'), 'transport': 'live'}
        source = neutral_contract()['root_sha256']
        def task(name, scope):
            return {'id': name, 'statement': 'True', 'hypotheses': [],
                'scope': 'Neutral preflight refusal fixture.', 'source_sha256': source,
                'kind': 'holdout', 'interface_type': 'True', 'transport_type': 'True',
                'required_constants': [], 'evaluation_scope': scope}
        for name, tasks in [('no_fresh_method', [task('final', 'final')]),
                            ('no_final_assessment', [task('method', 'method')])]:
            suite = {'schema': 'math-gkm.suite.v2', 'selector': 'independent fixture',
                'selection_basis': 'Frozen neutral preflight test.', 'independent': True,
                'tasks': tasks}
            with patch('machinery.study.authorize_live'), \
                    patch('machinery.study_deployment.require_deployment',
                          side_effect=AssertionError('must refuse before deployment')):
                with self.assertRaisesRegex(Invalid, 'disjoint independently curated'):
                    study.freeze(self.base/name, cfg, suite, neutral_contract())
            self.assertFalse((self.base/name).exists())

    def test_bad_method_metadata_preserves_already_admitted_mathematics(self):
        from machinery.study_reports import accept_report
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            staged, commitment = policy.commit(arm.s['research'], ordinary(), arm.workspace, 0, arm.p)
            report = {**ordinary(), 'prospective_binding': digest(commitment),
                      'agenda': 'invalid optional report metadata',
                      'method_candidate': {'id': 'malformed-method'}}
            def simulated_admit(current, state, payload, workspace, directory):
                state['knowledge']['kept-proof'] = {'status': 'synthetic admitted marker'}
            with patch('machinery.study_knowledge.ingest', side_effect=simulated_admit):
                accepted = accept_report(arm, staged, report, arm.workspace,
                    arm.root/'neutral-report', 0, arm.p, commitment)
            self.assertFalse(accepted)
            self.assertIn('kept-proof', staged['knowledge'])
            self.assertTrue(staged['metadata_failures'])
            self.assertFalse(staged['metadata_failures'][-1]['math_rollback'])

    def test_prospective_method_statement_and_start_are_immutable(self):
        protocol = read(self.directory/'protocol.json')
        source = policy.initial('exploration', protocol)
        planned = {**ordinary(), 'method_plan': {'id': 'prospective-neutral',
            'predictions': [{'consequence_id': 'identity', 'statement': '∀ n : Nat, n = n'}]}}
        staged, _ = policy.commit(source, planned, self.base, 0, protocol)
        original = copy.deepcopy(staged['method_plans']['prospective-neutral'])
        again, _ = policy.commit(staged, planned, self.base, 1, protocol)
        self.assertEqual(again['method_plans']['prospective-neutral'], original)
        changed = copy.deepcopy(planned)
        changed['method_plan']['predictions'][0]['statement'] = 'False'
        with self.assertRaises(Invalid):
            policy.commit(staged, changed, self.base, 1, protocol)

    def test_candidate_without_prospective_plan_is_not_queued_and_math_remains(self):
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            arm.s['research']['knowledge']['kept-proof'] = {'synthetic': 'already admitted marker'}
            proposal = {'id': 'unplanned', 'accepted_ids': ['kept-proof'],
                'application_notes': [], 'goal_connection': 'Neutral fixture only.',
                'predictions': [{'consequence_id': 'identity', 'accepted_id': 'kept-proof'}]}
            arm.queue_method_candidate(proposal, arm.root/'snapshots/initial', 0)
            self.assertEqual(arm.s.get('method_learning', {}).get('pending', []), [])
            self.assertIn('kept-proof', arm.s['research']['knowledge'])
            rejection = arm.s['research']['metadata_failures'][-1]
            self.assertEqual(rejection['status'], 'method_candidate_rejected')
            self.assertFalse(rejection['math_rollback'])

    def test_method_feature_is_explicit_and_baseline_stays_unmodified(self):
        plain = {**study.DEFAULT, 'method_learning': None}
        state = policy.initial('exploration', plain)
        req = policy.request(state, 0, plain)
        self.assertNotIn('method_learning', req)
        enabled = read(self.directory/'protocol.json')
        baseline = policy.request(policy.initial('baseline', enabled), 0, enabled)
        self.assertNotIn('method_learning', baseline)
        exploratory = policy.request(policy.initial('exploration', enabled), 0, enabled)
        self.assertTrue(exploratory['method_learning']['config']['enabled'])
        self.assertIn('method_candidate', exploratory['method_learning']['schemas'])


class RealLeanMethodChecks(unittest.TestCase):
    """Real proofs and explicit declines; no stochastic model comparison."""
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='method-real-lean-', dir=ROOT/'.scratch')
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name)
        self.directory = self.base/'study'
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(self.directory, {'validation_seconds': 120}, contract=neutral_contract())
        self.ws = self.directory/'arms/exploration/workspace'

    def task(self, **changes):
        return {'id': 'method-identity', 'statement': '∀ n : Nat, n = n',
                'hypotheses': [], 'scope': 'neutral acquired-method validator control',
                'source_sha256': neutral_contract()['root_sha256'], 'kind': 'holdout',
                'interface_type': 'True', 'transport_type': 'True',
                'required_constants': ['MathGKM.MethodNeutral.identity'], **changes}

    def solution(self, **changes):
        return {'module': 'MathGKM.HarnessFixture', 'term': 'fun _ => rfl',
                'interface_term': 'True.intro', 'transport_term': 'True.intro', **changes}

    def test_prediction_gate_uses_old_language_and_rejects_a_future_predicate(self):
        from machinery.study_methods import prediction_gate
        module = 'MathGKM.MethodSemantic'
        path = self.ws/'MathGKM/MethodSemantic.lean'
        path.write_text('namespace MathGKM.MethodSemantic\n'
            'theorem identity (n : Nat) : n = n := rfl\n'
            'def futurePredicate : Prop := True\n'
            'theorem futureProof : futurePredicate := True.intro\n'
            'end MathGKM.MethodSemantic\n')
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            before = arm.root/'snapshots/initial'
            bm = verify_snapshot(before)
            candidate = arm.root/'neutral-semantic-candidate'
            cm = snapshot(self.ws, candidate, arm.s['research']['policy'],
                bm['admitted_modules'] + ['MathGKM/MethodSemantic.lean'])
            def prepared(case, statement, term):
                return {'reference': digest({'neutral-semantic-case': case}),
                    'before': bm['binding'], 'candidate': cm['binding'],
                    'before_path': str(before), 'candidate_path': str(candidate),
                    'prediction_checks': [{'consequence_id': case, 'accepted_id': case,
                                           'status': 'statement_binding_pending'}],
                    'commitment': {'prediction_statements': {case: statement}},
                    # Synthetic admission metadata; the gate itself checks the
                    # actual exported proof against the OLD-context proposition.
                    'selected_admissions': {case: {'export_module': module, 'exports': [term]}}}
            good_input = prepared('old-language-identity', '∀ n : Nat, n = n', module+'.identity')
            good = prediction_gate(arm, good_input)
            self.assertTrue(good['checked'], good)
            self.assertEqual(good['checked_predictions'], 1)
            reservations = copy.deepcopy(arm.s['reservations'])
            self.assertEqual(prediction_gate(arm, good_input), good)
            self.assertEqual(arm.s['reservations'], reservations)
            bad_input = prepared('future-predicate', module+'.futurePredicate', module+'.futureProof')
            bad = prediction_gate(arm, bad_input)
            self.assertFalse(bad['checked'])
            self.assertEqual(bad['checked_predictions'], 0)
            evidence = read(arm.root/'method-learning'/bad_input['reference']/'prediction-validation/result.json')
            failed_targets = [item for item in evidence['checks']
                if item.get('operation') == 'compile' and
                item.get('module', '').startswith('MathGKM.Target') and item.get('returncode')]
            self.assertEqual(len(failed_targets), 1, evidence)
            self.assertIn('futurePredicate', failed_targets[0]['stdout']+failed_targets[0]['stderr'])

    def test_prediction_gate_rejects_an_unbound_implicit_proposition(self):
        from machinery.study_methods import prediction_gate
        module = 'MathGKM.MethodImplicit'
        (self.ws/'MathGKM/MethodImplicit.lean').write_text(
            'namespace MathGKM.MethodImplicit\n'
            'theorem truth : True := True.intro\n'
            'end MathGKM.MethodImplicit\n')
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            before = arm.root/'snapshots/initial'
            bm = verify_snapshot(before)
            candidate = arm.root/'neutral-implicit-candidate'
            cm = snapshot(self.ws, candidate, arm.s['research']['policy'],
                bm['admitted_modules'] + ['MathGKM/MethodImplicit.lean'])
            prepared = {'reference': digest({'neutral-implicit-case': 'unknown-p'}),
                'before': bm['binding'], 'candidate': cm['binding'],
                'before_path': str(before), 'candidate_path': str(candidate),
                'prediction_checks': [{'consequence_id': 'unknown-p', 'accepted_id': 'truth',
                                       'status': 'statement_binding_pending'}],
                'commitment': {'prediction_statements': {'unknown-p': 'p'}},
                'selected_admissions': {'truth': {'export_module': module,
                                                 'exports': [module+'.truth']}}}
            result = prediction_gate(arm, prepared)
            self.assertFalse(result['checked'], result)
            self.assertEqual(result['checked_predictions'], 0)
            evidence = read(arm.root/'method-learning'/prepared['reference']/'prediction-validation/result.json')
            failed_targets = [item for item in evidence['checks']
                if item.get('operation') == 'compile' and
                item.get('module', '').startswith('MathGKM.Target') and item.get('returncode')]
            self.assertEqual(len(failed_targets), 1, evidence)
            message = failed_targets[0]['stdout']+failed_targets[0]['stderr']
            self.assertIn('Unknown identifier', message)
            self.assertIn('p', message)

    def test_method_use_bounded_failure_and_predecessor_rediscovery(self):
        from machinery.study_transfer import check_task
        # The old solver is allowed to rediscover the argument. A future method
        # name in the use request cannot prevent a valid independent proof.
        old = check_task(self.ws, self.task(), self.solution(), self.base/'old', 120)
        self.assertTrue(old['checked'], old)
        self.assertFalse(old['component_use_checked'])
        declined = check_task(self.ws, self.task(),
            {'status': 'bounded_non_solution', 'reason': 'Neutral explicit decline'},
            self.base/'declined', 120)
        self.assertFalse(declined['checked'])
        self.assertTrue(declined['valid_attempt'])
        self.assertEqual(declined['status'], 'bounded_valid_non_solution')
        module = self.ws/'MathGKM/MethodNeutral.lean'
        module.write_text('namespace MathGKM.MethodNeutral\n'
                          'theorem identity (n : Nat) : n = n := rfl\n'
                          'end MathGKM.MethodNeutral\n')
        new = check_task(self.ws, self.task(),
            self.solution(module='MathGKM.MethodNeutral', term='MathGKM.MethodNeutral.identity'),
            self.base/'new', 120)
        self.assertTrue(new['checked'], new)
        self.assertTrue(new['component_use_checked'])
        missing = check_task(self.ws, self.task(), None, self.base/'missing', 120)
        self.assertFalse(missing['checked'])
        self.assertFalse(missing.get('valid_attempt', False))


if __name__ == '__main__':
    unittest.main()
