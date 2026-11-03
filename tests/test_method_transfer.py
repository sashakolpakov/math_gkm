"""Real method-comparison control flow with explicitly synthetic math outcomes.

These tests execute evaluate_pair/_evaluate_pair, source freezing, task binding
and genuine Arm resource accounting. Catalogue, adapter execution and checking
outcomes are deterministic doubles; no model, compiler or research campaign runs.
They establish controller behavior, never mathematical discovery or transfer.
"""
import contextlib
import copy
from pathlib import Path
import tempfile
from types import MethodType
import unittest
from unittest.mock import patch

from machinery import study, study_methods, study_transfer as transfer
from machinery.inspection_profiles import resolve
from machinery.study_common import ROOT, Invalid, digest, lock, read, snapshot, write
from tests.test_revision_static_checkpoint import neutral_contract

BASE = 'MathGKM.HarnessFixture.Root'
METHOD = 'MathGKM.MethodTransferSynthetic.method'
UNRELATED = 'MathGKM.MethodTransferSynthetic.unrelated'
IDENTITY_SCHEMA = 'synthetic-declaration-identity-for-controller-test'
FINGERPRINTS = {BASE: 'a'*64, METHOD: 'b'*64, UNRELATED: 'c'*64}


def task(identifier, kind='holdout', scope='method'):
    value = {'id': identifier, 'kind': kind, 'statement': 'True', 'hypotheses': [],
        'scope': 'neutral synthetic comparison control',
        'source_sha256': neutral_contract()['root_sha256'],
        'interface_type': 'True', 'transport_type': 'True', 'required_constants': []}
    if kind == 'holdout':
        value['evaluation_scope'] = scope
    return value


class MethodTransferControls(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='method-transfer-controls-', dir=ROOT/'.scratch')
        self.addCleanup(self.tmp.cleanup)
        self.stack = contextlib.ExitStack()
        self.addCleanup(self.stack.close)
        self.directory = Path(self.tmp.name)/'study'
        self.suite = {'schema': 'math-gkm.suite.v2', 'selector': 'synthetic independent curator',
            'selection_basis': 'pretrial disjoint neutral tasks; controller test only',
            'independent': True,
            'tasks': [task('method-one'), task('method-two'),
                      task('assessment-only', scope='assessment'), task('old-application', kind='regression')]}
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}), \
                patch('machinery.snapshot_routing.ENABLED', False):
            study.freeze(self.directory, {'rounds': 2, 'episode_rounds': 2,
                'call_seconds': 10, 'adaptation_seconds': 10, 'validation_seconds': 30,
                'arm_seconds': 100000, 'max_calls': 80, 'meta_calls': 40,
                'policy_trials': 0,
                'method_learning': {'enabled': True, 'repetitions': 2,
                    'holdout_tasks': 1, 'regression_limit': 1}},
                suite=self.suite, contract=neutral_contract())
        fd = self.stack.enter_context(lock(self.directory/'controller.lock'))
        self.arm = study.Arm(self.directory, 'exploration', fd)
        self.before = self.arm.root/'snapshots/initial'
        self.after = self.arm.root/'snapshots/method-candidate'
        (self.arm.workspace/'MathGKM/MethodTransferSynthetic.lean').write_text(
            'namespace MathGKM.MethodTransferSynthetic\n'
            'theorem method : True := True.intro\n'
            'theorem unrelated : True := True.intro\n'
            'end MathGKM.MethodTransferSynthetic\n')
        old = read(self.before/'manifest.json')
        snapshot(self.arm.workspace, self.after, copy.deepcopy(old['policy']),
                 old['admitted_modules']+['MathGKM/MethodTransferSynthetic.lean'])
        self.method_suite = {**copy.deepcopy(self.suite), 'tasks': [copy.deepcopy(self.suite['tasks'][0])]}
        self.calls, self.checks_seen = [], []
        self.outcomes, self.used = {}, {}
        self.stack.enter_context(patch('machinery.snapshot_routing.ENABLED', True))
        self.optimizer = self.stack.enter_context(patch('machinery.snapshot_routing.prepare_pair',
            side_effect=AssertionError('exact method comparison must not invoke routing optimizer')))
        self.stack.enter_context(patch.object(transfer, 'catalog_snapshot', side_effect=self.catalog))
        self.stack.enter_context(patch.object(transfer, 'from_result', return_value=None))
        self.stack.enter_context(patch.object(transfer, 'adapter_checks', side_effect=self.adapter_checks))
        self.arm.call = MethodType(self.call, self.arm)

    def catalog(self, arm, source, manifest, directory, key):
        arm.reserve('catalog-'+key, transfer.catalogue_seconds(arm.p))
        names = [BASE] if Path(source) == self.before else [BASE, METHOD, UNRELATED]
        profile = resolve(transfer.CATALOG_INSPECTION_PROFILE)
        return {'checked': True, 'inspection_schema': profile.inspection_schema,
            'inspection_profile': profile.binding(), 'elapsed_seconds': .01,
            'declarations': [{'catalog': [{'name': name, 'identity_schema': IDENTITY_SCHEMA,
                'semantic_sha256': FINGERPRINTS[name]} for name in names]}]}

    def call(self, arm, key, role, req, workspace=None, readonly=False, seconds=None):
        """Deterministic adapter execution; real allowance and counters apply."""
        self.assertEqual(role, 'adapter')
        self.assertTrue(arm.permitted(role, seconds), 'prepaid adapter allowance became inaccessible')
        arm.reserve('call-'+key, seconds)
        arm.s['calls'] += 1
        pool = arm.s['budget_pools'][arm.active_budget]
        if 'calls' in pool:
            pool['calls_spent'] += 1
        arm.save()
        self.calls.append((key, copy.deepcopy(req), str(workspace)))
        return {'outcome': 'completed', 'role': 'adapter', 'elapsed_seconds': .02, 'payload': {}}

    def adapter_checks(self, arm, receipt, tasks, bound_tasks, directory, side, ws,
                       key, binding, manifest, bm, am):
        result = []
        self.checks_seen.append((side, [t['id'] for t in bound_tasks]))
        for target in bound_tasks:
            arm.reserve('evaluation-'+key+'-'+side+'-'+target['id'], arm.p['validation_seconds'])
            default = 'success' if side == 'after' or target['kind'] == 'regression' else 'bounded'
            outcome = self.outcomes.get((side, target['id']), default)
            names = self.used.get((side, target['id']), [METHOD] if side == 'after' else [])
            result.append({'task_id': target['id'], 'checked': outcome == 'success',
                'valid_attempt': outcome != 'invalid',
                'status': {'success': 'checked', 'bounded': 'bounded_valid_non_solution',
                           'invalid': 'invalid_synthetic_check'}[outcome],
                'elapsed_seconds': .01, 'component_use_checked': True,
                'frozen_used_declarations': {name: {'identity_schema': IDENTITY_SCHEMA,
                    'semantic_sha256': FINGERPRINTS[name]} for name in names}})
        return result, {'schema': 'synthetic-adapter-intake'}, None

    def evaluate(self, key, *, suite='method', required_exports=(METHOD,), side_order=('before', 'after')):
        kwargs = {'required_exports': required_exports, 'side_order': side_order, 'route_snapshots': False}
        if suite == 'method':
            kwargs['suite'] = self.method_suite
        elif suite is not None:
            kwargs['suite'] = suite
        return transfer.evaluate_pair(self.arm, self.before, self.after, key, **kwargs)

    def test_explicit_method_subset_is_bound_and_does_not_use_assessment_or_optimizer(self):
        result = self.evaluate('method-subset')
        self.assertEqual(result['binding']['suite'], digest(self.method_suite))
        self.assertEqual(result['task_gains'], ['method-one'])
        self.assertEqual(result['transfer'], ['method-one'])
        self.assertEqual([target['id'] for target in read(self.arm.root/'evaluations/method-subset/bound-tasks.json')],
                         ['method-one'])
        for _, req, _ in self.calls:
            self.assertEqual([t['id'] for t in req['tasks']], ['method-one'])
        self.optimizer.assert_not_called()

    def test_ordinary_default_uses_disjoint_assessment_partition(self):
        expected = study_methods.partition_suite(self.suite, self.arm.p['method_learning'])['assessment']
        result = self.evaluate('ordinary-assessment', suite=None, required_exports=())
        self.assertEqual(result['binding']['suite'], digest(expected))
        self.assertEqual({t['id'] for t in expected['tasks']}, {'assessment-only', 'old-application'})
        self.assertEqual({t['id'] for _, req, _ in self.calls for t in req['tasks']},
                         {'assessment-only', 'old-application'})
        self.optimizer.assert_not_called()

    def test_balanced_order_reaches_real_call_sequence(self):
        result = self.evaluate('balanced', side_order=('after', 'before'))
        self.assertEqual([key for key, _, _ in self.calls], ['eval-balanced-after', 'eval-balanced-before'])
        self.assertEqual(result['binding']['method_controls']['side_order'], ['after', 'before'])
        self.assertTrue(result['eligible'])

    def test_transfer_requires_selected_export_not_an_unrelated_changed_declaration(self):
        self.used[('after', 'method-one')] = [UNRELATED]
        result = self.evaluate('unrelated-only')
        self.assertEqual(result['task_gains'], ['method-one'])
        self.assertEqual(result['transfer'], [])
        self.assertFalse(result['eligible'])
        after_check = result['sides']['after']['checks'][0]
        self.assertTrue(after_check['changed_component_use_checked'])
        self.assertEqual(after_check['method_exports_used'], {})
        self.used[('after', 'method-one')] = [METHOD, UNRELATED]
        result = self.evaluate('selected-used')
        self.assertEqual(result['transfer'], ['method-one'])
        self.assertEqual(set(result['sides']['after']['checks'][0]['method_exports_used']), {METHOD})

    def test_predecessor_rediscovery_counts_as_success_and_removes_new_task_gain(self):
        self.outcomes[('before', 'method-one')] = 'success'
        result = self.evaluate('rediscovery')
        self.assertEqual(result['status'], 'valid_finite_budget_comparison')
        self.assertEqual(result['task_gains'], [])
        self.assertEqual(result['transfer'], [])
        self.assertFalse(result['eligible'])
        self.assertEqual(result['bounded_counts'], {'before_successes': 1, 'after_successes': 1,
            'obligations': 1, 'holdouts': 1, 'regressions': 0})

    def test_valid_bounded_negative_is_distinct_from_invalid_checking(self):
        self.outcomes[('after', 'method-one')] = 'bounded'
        zero = self.evaluate('valid-zero')
        self.assertEqual(zero['status'], 'valid_finite_budget_comparison')
        self.assertEqual(zero['task_gains'], [])
        self.assertEqual(zero['bounded_counts']['after_successes'], 0)
        self.outcomes[('after', 'method-one')] = 'success'
        self.outcomes[('before', 'method-one')] = 'invalid'
        invalid = self.evaluate('invalid-before')
        self.assertEqual(invalid['status'], 'invalid_comparison_or_capability_regression')
        self.assertFalse(invalid['eligible'])
        self.assertEqual(invalid['task_gains'], [])

    def test_cached_pair_reuse_cannot_change_export_or_order_controls(self):
        result = self.evaluate('cached')
        state = copy.deepcopy(self.arm.s)
        calls = len(self.calls)
        self.assertEqual(digest(self.evaluate('cached')), digest(result))
        self.assertEqual(len(self.calls), calls)
        self.assertEqual(self.arm.s, state)
        for changed in ({'side_order': ('after', 'before')}, {'required_exports': (UNRELATED,)}):
            with self.assertRaisesRegex(Invalid, 'binding changed'):
                self.evaluate('cached', **changed)
        self.assertEqual(len(self.calls), calls)

    def test_coverage_counts_include_regression_applications(self):
        suite = {**copy.deepcopy(self.suite),
                 'tasks': [copy.deepcopy(self.suite['tasks'][0]), copy.deepcopy(self.suite['tasks'][3])]}
        result = self.evaluate('coverage', suite=suite)
        self.assertEqual(result['bounded_counts'], {'before_successes': 1, 'after_successes': 2,
            'obligations': 2, 'holdouts': 1, 'regressions': 1})
        self.assertEqual(result['regressions'], [])
        self.assertTrue(result['eligible'])

    def test_exact_parent_four_calls_fund_two_child_pairs_without_double_charging(self):
        cap = transfer.paired_evaluation_seconds(self.arm.p, len(self.method_suite['tasks']))
        # The earlier workload is synthetic. Precisely four calls and two pair
        # envelopes remain; no unreserved global slack can conceal a nested bug.
        previous_calls = self.arm.p['max_calls']-4
        self.arm.s['calls'] = previous_calls
        self.arm.s['seconds'] = self.arm.p['arm_seconds']-2*cap
        self.arm.fund_many({'method-parent': (2*cap, 4, 0)})
        self.assertEqual(self.arm.available_calls(), 0)
        self.assertEqual(self.arm.available(), 0)
        with self.arm.budget('method-parent'):
            self.assertEqual(self.arm.available_calls(), 4)
            self.evaluate('exact-first')
            self.assertEqual(self.arm.available_calls(), 2)
            self.evaluate('exact-second', side_order=('after', 'before'))
            self.assertEqual(self.arm.available_calls(), 0)
            self.assertEqual(self.arm.available(), 0)
        self.assertEqual(self.arm.s['calls'], previous_calls+4)
        self.assertEqual(self.arm.s['meta_calls'], 0)
        self.assertEqual(self.arm.s['seconds'], self.arm.p['arm_seconds'])
        self.assertEqual(self.arm.available_calls(), 0)
        self.assertEqual(self.arm.available(), 0)
        parent = self.arm.s['budget_pools']['method-parent']
        self.assertEqual(parent['calls_spent'], 4)
        self.assertEqual(parent['spent'], parent['cap'])
        for key in ('exact-first', 'exact-second'):
            child = self.arm.s['budget_pools']['paired-evaluation-'+key]
            self.assertEqual(child['calls'], 2)
            self.assertEqual(child['calls_spent'], 2)
            self.assertEqual(child['spent'], child['cap'])
        calls = len(self.calls)
        self.evaluate('exact-first')
        self.assertEqual(len(self.calls), calls)
        self.assertEqual(self.arm.s['calls'], previous_calls+4)


if __name__ == '__main__':
    unittest.main()
