"""Controller tests using neutral synthetic snapshots, no models or compilers."""
import copy
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from machinery import study_methods as methods
from machinery.study_common import Invalid, digest, read, sha, snapshot, verify_snapshot, write


def proposal(identity='shared-method'):
    return {'id': identity, 'accepted_ids': ['accepted-method'],
            'application_notes': ['research/method.md'],
            'goal_connection': 'A reusable neutral method with an unresolved root connection.',
            'predictions': []}


def task(identity, kind='holdout'):
    return {'id': identity, 'kind': kind, 'statement': 'True', 'hypotheses': [],
            'scope': 'synthetic public test proposition', 'source_sha256': 'a'*64,
            'interface_type': 'True', 'transport_type': 'True', 'required_constants': []}


class MethodTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='math-gkm-method-test-')
        self.addCleanup(self.tmp.cleanup)
        self.study = Path(self.tmp.name)
        self.root = self.study/'arms/exploration'
        self.root.mkdir(parents=True)
        self.old = self.root/'old-source'
        (self.old/'MathGKM').mkdir(parents=True)
        (self.old/'research').mkdir()
        (self.old/'MathGKM/Base.lean').write_text('theorem base : True := True.intro\n')
        (self.old/'research/base.md').write_text('Original neutral notes.\n')
        self.before = self.root/'snapshots/initial'
        snapshot(self.old, self.before, {'search': 'old policy'}, ['MathGKM/Base.lean'])
        self.new = self.root/'new-source'
        import shutil
        shutil.copytree(self.old, self.new)
        (self.new/'MathGKM/Method.lean').write_text('import MathGKM.Base\ntheorem shared : True := base\n')
        (self.new/'MathGKM/Unrelated.lean').write_text('theorem unrelated : True := True.intro\n')
        (self.new/'research/method.md').write_text('Apply the shared neutral method.\n')
        (self.new/'research/unrelated.md').write_text('UNRELATED_EPISODE_MATERIAL\n')
        self.after = self.root/'snapshots/round-0001'
        snapshot(self.new, self.after, {'search': 'changed unrelated policy'}, ['MathGKM/Base.lean', 'MathGKM/Method.lean', 'MathGKM/Unrelated.lean'])
        self.record = {'source_files': {name: sha(self.new/name) for name in
            ('MathGKM/Base.lean', 'MathGKM/Method.lean')}, 'exports': ['shared'], 'export_module': 'MathGKM.Method', 'receipt_hash': 'b'*64}
        self.arm = SimpleNamespace(root=self.root, study=self.study,
            p={'method_learning': {'enabled': True}, 'adaptation_seconds': 30,
               'validation_seconds': 60},
            s={'research': {'knowledge': {'accepted-method': self.record}, 'components': {}}},
            available_calls=lambda: 20)
        verifier = patch('machinery.study_knowledge.verify_record')
        self.verifier = verifier.start(); self.addCleanup(verifier.stop)
        self.suite = {'schema': 'math-gkm.suite.v2', 'selector': 'independent fixture',
                      'selection_basis': 'frozen pretrial neutral pool', 'independent': True,
                      'tasks': [{**task(name), 'evaluation_scope': 'method'} for name in
                                ('first', 'second', 'third', 'fourth')] +
                               [{**task('assessment'), 'evaluation_scope': 'assessment'}]}
        write(self.study/'evaluation/suite.json', self.suite)

    def prepare(self, value=None, **kwargs):
        return methods.prepare_method(self.arm, self.before, self.after,
                                      value or proposal(), **kwargs)

    def comparison(self, before, after, suite, **kwargs):
        return {'status': 'valid_finite_budget_comparison', 'eligible': True,
                'all_frozen_declarations_retained': True,
                'binding': {'before': verify_snapshot(before)['binding'],
                            'after': verify_snapshot(after)['binding'],
                            'adaptation_seconds_each': 30, 'validation_seconds_each_task': 60,
                            'catalog_seconds_each': 180},
                'task_gains': [t['id'] for t in suite['tasks'] if t['kind'] == 'holdout'],
                'transfer': [t['id'] for t in suite['tasks'] if t['kind'] == 'holdout'],
                'regressions': [],
                'sides': {'after': {'checks': [{'task_id': t['id'], 'checked': True}
                                              for t in suite['tasks']]}}}

    def test_exact_additive_candidate_excludes_unrelated_work_and_policy_changes(self):
        prepared = self.prepare()
        candidate = verify_snapshot(Path(prepared['candidate_path']))
        old = verify_snapshot(self.before)
        self.assertEqual(candidate['policy'], old['policy'])
        self.assertEqual(set(candidate['files']), {'MathGKM/Base.lean', 'MathGKM/Method.lean',
                                                 'research/base.md', 'research/method.md'})
        self.assertTrue(all(candidate['files'][p] == h for p, h in old['files'].items()))
        self.assertNotIn('MathGKM/Unrelated.lean', candidate['admitted_modules'])
        self.assertEqual(prepared['required_exports'], ['shared'])
        self.verifier.assert_called_once_with(self.record, self.after/'source')

    def test_prepare_is_idempotent_and_method_identity_immutable(self):
        prepared = self.prepare()
        self.assertEqual(self.prepare(), prepared)
        changed = proposal(); changed['goal_connection'] = 'A changed own method claim.'
        with self.assertRaisesRegex(Invalid, 'immutable'):
            self.prepare(changed)

    def test_unknown_unaccepted_item_is_rejected(self):
        value = proposal(); value['accepted_ids'] = ['unknown']
        with self.assertRaisesRegex(Invalid, 'unaccepted'):
            self.prepare(value)
        self.verifier.assert_not_called()

    def test_source_closure_cannot_change_predecessor_definition(self):
        other = copy.deepcopy(self.record)
        other['source_files']['MathGKM/Base.lean'] = 'f'*64
        self.arm.s['research']['knowledge']['accepted-method'] = other
        with self.assertRaisesRegex(Invalid, 'frozen development'):
            self.prepare()

    def test_new_notes_required_and_unsafe_paths_rejected(self):
        for name in ('research/base.md', 'research/missing.md', '../bad.md', 'MathGKM/Method.lean'):
            value = proposal(); value['application_notes'] = [name]
            with self.subTest(name=name), self.assertRaises(Invalid):
                self.prepare(value)

    def test_prospective_prediction_binding_required_and_no_truth_certification(self):
        value = proposal(); value['predictions'] = [{'consequence_id': 'transport', 'accepted_id': 'accepted-method'}]
        with self.assertRaisesRegex(Invalid, 'prospectively'):
            self.prepare(value)
        prepared = self.prepare(value, concept_reference='c'*64, prediction_ids=['transport'])
        self.assertEqual(prepared['commitment']['proposal']['predictions'], value['predictions'])
        self.assertNotIn('checked_prediction', prepared)

    def test_schema_rejects_nonstring_lists_and_complexity_channels(self):
        examples = []
        for key, value in [('accepted_ids', [{}]), ('application_notes', [[]]), ('goal_connection', 3), ('id', '../bad')]:
            malformed = proposal(); malformed[key] = value; examples.append(malformed)
        malformed = proposal(); malformed['complexity_score'] = 1; examples.append(malformed)
        for value in examples:
            with self.subTest(value=value), self.assertRaises(Invalid):
                methods.validate_candidate(value)
        for config in ({'enabled': 1}, {'repetitions': True}, {'regression_limit': -1}, {'max_methods': 0}, {'complexity': 5}):
            with self.subTest(config=config), self.assertRaises(Invalid):
                methods.validate_config(config)


    def test_method_plan_exact_statements_are_bounded_and_immutable_data(self):
        plan = {'id': 'method', 'predictions': [{'consequence_id': 'first', 'statement': 'True'}]}
        original = copy.deepcopy(plan)
        checked = methods.validate_plan(plan)
        checked['predictions'][0]['statement'] = 'False'
        self.assertEqual(plan, original)
        for value in ({'id': 'method', 'predictions': []},
                      {'id': 'method', 'predictions': [{'consequence_id': 'x', 'statement': ''}]},
                      {'id': '../method', 'predictions': plan['predictions']},
                      {**plan, 'complexity': 1}):
            with self.subTest(value=value), self.assertRaises(Invalid):
                methods.validate_plan(value)

    def test_exact_prospective_statement_must_match_checked_closed_claim(self):
        self.record.update(kind='mathematical_claims', task={'hypotheses': [], 'statement': 'True'})
        value = proposal(); value['predictions'] = [{'consequence_id': 'transport', 'accepted_id': 'accepted-method'}]
        prepared = self.prepare(value, prediction_statements={'transport': 'True', 'later': 'True'})
        checks = {p['consequence_id']: p for p in prepared['prediction_checks']}
        self.assertEqual(checks['transport']['status'], 'statement_binding_pending')
        self.assertEqual(checks['later']['status'], 'not_checked')
        self.assertEqual(prepared['commitment']['prediction_statements']['transport'], 'True')
        for task_value in ({'hypotheses': ['(h : True)'], 'statement': 'True'},
                           {'hypotheses': [], 'statement': 'False'}):
            self.record['task'] = task_value
            with self.subTest(task=task_value), self.assertRaisesRegex(Invalid, 'exact prospective'):
                self.prepare(value, prediction_statements={'transport': 'True', 'later': 'True'})

    def test_changed_comparison_cost_or_config_cannot_reuse_cached_result(self):
        prepared = self.prepare()
        with patch('machinery.study_transfer.evaluate_pair', side_effect=Invalid('fixture failure')):
            methods.compare_method(self.arm, prepared, development_role_seconds=3)
        for cost in (4, -1, True, float('inf')):
            with self.subTest(cost=cost), self.assertRaises(Invalid):
                methods.compare_method(self.arm, prepared, development_role_seconds=cost)
        self.arm.p['method_learning']['repetitions'] = 3
        with self.assertRaisesRegex(Invalid, 'configuration'):
            methods.compare_method(self.arm, prepared, development_role_seconds=3)

    def test_cached_comparison_cannot_be_rebound_to_another_method(self):
        prepared = self.prepare()
        self.arm.available_calls = lambda: 0
        methods.compare_method(self.arm, prepared)
        path = self.root/'method-learning'/prepared['reference']/'result.json'
        cached = read(path); cached['before'] = 'e'*64; write(path, cached)
        with self.assertRaisesRegex(Invalid, 'binding changed'):
            methods.compare_method(self.arm, prepared)


    def test_partition_explicit_method_holdouts_never_enter_assessment(self):
        parts = methods.partition_suite(self.suite, {'enabled': True})
        self.assertEqual([t['id'] for t in parts['assessment']['tasks']], ['assessment'])
        self.assertEqual([t['id'] for t in parts['methods']['tasks']],
                         ['first', 'second', 'third', 'fourth'])
        self.suite['tasks'].append({**task('untouched'), 'evaluation_scope': 'final'})
        self.suite['tasks'].append(task('unannotated'))
        self.suite['tasks'].append(task('regression', 'regression'))
        parts = methods.partition_suite(self.suite, {'enabled': True})
        self.assertEqual([t['id'] for t in parts['assessment']['tasks']],
                         ['assessment', 'unannotated', 'regression'])
        self.assertIn('regression', [t['id'] for t in parts['methods']['tasks']])
        self.assertEqual([t['id'] for t in parts['final']['tasks']], ['untouched', 'regression'])
        self.assertNotIn('untouched', [t['id'] for t in parts['methods']['tasks']])
        self.assertNotIn('untouched', [t['id'] for t in parts['assessment']['tasks']])

    def test_partition_unannotated_reserves_final_batch_for_assessment(self):
        suite = {**self.suite, 'tasks': [task(name) for name in ('a', 'b', 'c', 'd', 'e', 'f')]}
        parts = methods.partition_suite(suite, {'enabled': True, 'holdout_tasks': 2})
        self.assertEqual([t['id'] for t in parts['methods']['tasks']], ['a', 'b'])
        self.assertEqual([t['id'] for t in parts['assessment']['tasks']], ['c', 'd'])
        self.assertEqual([t['id'] for t in parts['final']['tasks']], ['e', 'f'])
        disabled = methods.partition_suite(suite)
        self.assertEqual(disabled, {'methods': suite, 'assessment': suite, 'final': suite})
        suite['tasks'][0]['evaluation_scope'] = 'arbitrary'
        with self.assertRaises(Invalid):
            methods.partition_suite(suite, {'enabled': True})

    def prediction_prepared(self):
        self.record.update(kind='mathematical_claims', task={'hypotheses': [], 'statement': 'True'})
        value = proposal(); value['predictions'] = [{'consequence_id': 'transport', 'accepted_id': 'accepted-method'}]
        prepared = self.prepare(value, prediction_statements={'transport': 'True'})
        self.arm.reserve = lambda *args: None
        self.arm.stopped = lambda: False
        return prepared

    def fake_seed(self, seed, workspace):
        workspace.mkdir(parents=True)
        (workspace/'MathGKM').mkdir()
        write(workspace/'contract.json', {'root_file': 'MathGKM/Base.lean',
              'root_declaration': 'base', 'root_sha256': sha(self.old/'MathGKM/Base.lean')})

    def test_prediction_gate_binds_old_context_before_solution_and_counts_only_after_check(self):
        prepared = self.prediction_prepared()
        seen = []
        def checked(workspace, task_value, solution, directory, seconds, **kwargs):
            seen.append((task_value, solution, kwargs))
            directory.mkdir()
            return {'checked': True, 'status': 'checked_exact_obligation_and_interfaces'}
        with patch('machinery.study_methods.copy_seed', side_effect=self.fake_seed), \
                patch('machinery.study_transfer.check_task', side_effect=checked):
            gate = methods.prediction_gate(self.arm, prepared)
        self.assertTrue(gate['checked'])
        self.assertEqual(gate['checked_predictions'], 1)
        self.assertEqual(seen[0][0]['context_modules'], ['MathGKM.Base'])
        self.assertEqual(seen[0][0]['statement'], '(True)')
        self.assertTrue(seen[0][0]['strict_closed_statement'])
        from machinery.study_transfer import target_source
        self.assertIn('set_option autoImplicit false', target_source(seen[0][0]))
        self.assertEqual(seen[0][1]['term'], 'shared')
        self.assertNotIn('MathGKM.Method', seen[0][0]['context_modules'])
        self.assertEqual(seen[0][2]['required'], ['shared'])
        self.assertEqual(prepared['prediction_checks'][0]['status'], 'statement_binding_pending')

    def test_failed_prediction_binding_stops_trials_and_retains_pending_status(self):
        prepared = self.prediction_prepared()
        with patch('machinery.study_methods.prediction_gate', return_value={
                'checked': False, 'status': 'invalid_prediction_context', 'checked_predictions': 0}), \
                patch('machinery.study_transfer.evaluate_pair') as pair:
            result = methods.compare_method(self.arm, prepared)
        pair.assert_not_called()
        self.assertEqual(result['status'], 'invalid_candidate_context')
        self.assertEqual(result['prediction_counts'], {'checked': 0, 'pending': 1})

    def test_interrupted_prediction_check_is_not_replayed(self):
        prepared = self.prediction_prepared()
        def interrupted(workspace, task_value, solution, directory, seconds, **kwargs):
            directory.mkdir()
            raise Invalid('interrupted compiler')
        with patch('machinery.study_methods.copy_seed', side_effect=self.fake_seed), \
                patch('machinery.study_transfer.check_task', side_effect=interrupted):
            with self.assertRaises(Invalid):
                methods.prediction_gate(self.arm, prepared)
        with patch('machinery.study_transfer.check_task') as checker:
            result = methods.prediction_gate(self.arm, prepared)
        checker.assert_not_called()
        self.assertFalse(result['checked'])
        self.assertEqual(result['status'], 'interrupted_prediction_not_replayed')

    def test_interrupted_constructor_is_not_silently_reexecuted(self):
        with patch('machinery.study_methods.snapshot', side_effect=Invalid('interrupted')):
            with self.assertRaisesRegex(Invalid, 'interrupted'):
                self.prepare()
        with self.assertRaisesRegex(Invalid, 'interrupted method construction'):
            self.prepare()

    def test_corrupt_frozen_candidate_rejected_on_reuse(self):
        prepared = self.prepare()
        p = Path(prepared['candidate_path'])/'source/MathGKM/Method.lean'
        p.chmod(0o644); p.write_text('changed')
        with self.assertRaises(Invalid):
            self.prepare()

    def test_repeated_pair_balanced_order_exact_exports_and_private_suite(self):
        prepared = self.prepare()
        calls = []
        def evaluate(arm, before, after, key, **kwargs):
            calls.append((key, copy.deepcopy(kwargs)))
            return self.comparison(before, after, **kwargs)
        with patch('machinery.study_transfer.evaluate_pair', side_effect=evaluate):
            result = methods.compare_method(self.arm, prepared, development_role_seconds=7)
            again = methods.compare_method(self.arm, prepared, development_role_seconds=7)
        self.assertEqual(result, again)
        self.assertEqual(len(calls), 2)
        self.assertEqual(calls[0][1]['side_order'], ('before', 'after'))
        self.assertEqual(calls[1][1]['side_order'], ('after', 'before'))
        self.assertFalse(calls[0][1]['route_snapshots'])
        self.assertEqual(calls[0][1]['required_exports'], ('shared',))
        self.assertEqual(calls[0][1]['suite'], calls[1][1]['suite'])
        self.assertEqual(result['status'], 'completed')
        self.assertEqual(result['expected_trials'], 2)
        self.assertEqual(result['development_role_seconds'], 7)
        self.assertEqual(len(read(self.root/'method-learning/application-pool.json')['entries']), 2)
        self.assertFalse((Path(prepared['candidate_path'])/'source/evaluation').exists())

    def test_fresh_holdouts_retired_and_previous_applications_become_regressions(self):
        def evaluate(arm, before, after, key, **kwargs):
            return self.comparison(before, after, **kwargs)
        with patch('machinery.study_transfer.evaluate_pair', side_effect=evaluate):
            first = self.prepare()
            methods.compare_method(self.arm, first)
            second = self.prepare(proposal('method-two'))
            methods.compare_method(self.arm, second)
            third = self.prepare(proposal('method-three'))
            exhausted = methods.compare_method(self.arm, third)
        frozen = read(self.root/'method-learning'/second['reference']/'suite.json')['suite']
        self.assertEqual([t['id'] for t in frozen['tasks'] if t['kind'] == 'regression'], ['second', 'first'])
        self.assertEqual([t['id'] for t in frozen['tasks'] if t['kind'] == 'holdout'], ['third', 'fourth'])
        self.assertEqual(exhausted['status'], 'unavailable')
        self.assertEqual(exhausted['trials'], [])
        self.assertEqual(len(read(self.root/'method-learning/application-pool.json')['entries']), 4)

    def test_interrupted_reservation_reuses_exact_tasks_not_next_subset(self):
        prepared = self.prepare()
        original = methods.write
        def fail_suite(path, value):
            if Path(path).name == 'suite.json':
                raise OSError('interrupted after reservation')
            return original(path, value)
        with patch('machinery.study_methods.write', side_effect=fail_suite):
            with self.assertRaises(OSError):
                methods._reserve_suite(self.arm, prepared, methods.validate_config({'enabled': True}))
        reserved = methods._reserve_suite(self.arm, prepared, methods.validate_config({'enabled': True}))
        self.assertEqual([t['id'] for t in reserved['suite']['tasks']], ['first', 'second'])

    def test_missing_repeat_or_operational_failure_remains_unavailable(self):
        prepared = self.prepare()
        with patch('machinery.study_transfer.evaluate_pair', side_effect=Invalid('temporary failure')):
            result = methods.compare_method(self.arm, prepared)
        self.assertEqual(result['status'], 'unavailable')
        self.assertEqual(result['trials'], [])
        self.assertEqual(result['expected_trials'], 2)
        self.assertEqual(read(self.root/'method-learning/application-pool.json')['entries'], [])

    def test_exhausted_call_budget_does_not_start_adapter(self):
        prepared = self.prepare()
        self.arm.available_calls = lambda: 1
        with patch('machinery.study_transfer.evaluate_pair') as pair:
            result = methods.compare_method(self.arm, prepared)
        pair.assert_not_called()
        self.assertEqual(result['status'], 'insufficient_budget')
        self.assertEqual(result['trials'], [])


if __name__ == '__main__':
    unittest.main()
