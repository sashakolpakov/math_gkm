"""Method-level feedback projection: actual constructors, no models or compilers."""
import copy
import json
import unittest

from machinery import study_research_feedback as feedback
from machinery.study_common import Invalid, digest

CANARY = 'PRIVATE_TARGET_ANSWER_AND_PATH'


def trial(*, gain=True, invalid=False):
    return {'status': 'invalid_frozen_context' if invalid else 'valid_finite_budget_comparison',
        'eligible': gain and not invalid, 'all_frozen_declarations_retained': True,
        'task_gains': [CANARY] if gain else [], 'transfer': [CANARY] if gain else [],
        'regressions': [], 'binding': {'before': 'a'*64, 'after': 'b'*64,
            'suite': CANARY, 'adaptation_seconds_each': 30,
            'validation_seconds_each_task': 20, 'catalog_seconds_each': 60},
        'measured_costs': {'before': {'adapter_seconds': 3, 'validation_seconds': 2,
            'context_validation_seconds': 1, 'private_task': CANARY},
            'after': {'adapter_seconds': 2, 'validation_seconds': 2,
                'context_validation_seconds': 1}},
        'sides': {'before': {'solution': CANARY}}, 'catalogs': {CANARY: CANARY}}


def method(*, trials=None, expected=2, status='completed'):
    return {'method_id': 'own-method', 'reference': 'c'*64,
        'before': 'a'*64, 'candidate': 'b'*64,
        'expected_trials': expected, 'trials': [trial(), trial()] if trials is None else trials,
        'development_role_seconds': 7, 'status': status,
        'private_target': CANARY, 'scope': CANARY}


def packet(**kwargs):
    return feedback.build_review_feedback(2,
        {'outcome': 'completed', 'elapsed_seconds': 1, 'payload': {'findings': []}},
        True, reviewer_scope=feedback.OWN_REVIEW_SCOPE, **kwargs)


class MethodFeedbackTests(unittest.TestCase):
    def test_projection_counts_fresh_repetitions_and_never_private_content(self):
        raw = method(); before = copy.deepcopy(raw)
        public = feedback.project_method_comparison(raw)
        self.assertNotIn(CANARY, json.dumps(public))
        self.assertEqual(public['expected_trials'], 2)
        self.assertEqual(public['attempted_trials'], 2)
        self.assertEqual(public['valid_trials'], 2)
        self.assertEqual(public['supported_trials'], 2)
        self.assertEqual(public['gains'], 2)
        self.assertEqual(public['checked_component_transfer'], 2)
        self.assertEqual(public['regressions'], 0)
        self.assertTrue(public['eligible'])
        self.assertEqual(public['measured_costs']['before']['adapter_seconds'], 6)
        self.assertEqual(public['development_role_seconds'], 7)
        self.assertIn('not mathematical unprovability', public['interpretation'])
        self.assertEqual(raw, before)
        self.assertEqual(feedback.validate_method_feedback(public), public)

    def test_no_success_is_distinct_from_no_valid_comparison(self):
        zero = feedback.project_method_comparison(method(trials=[trial(gain=False)]*2))
        self.assertEqual(zero['assessment'], 'valid_finite_budget_evidence')
        self.assertEqual(zero['gains'], 0)
        self.assertFalse(zero['eligible'])
        for status in ('unavailable', 'insufficient_budget', 'invalid_candidate'):
            missing = feedback.project_method_comparison(method(trials=[], status=status))
            self.assertEqual(missing['assessment'], 'inconclusive')
            self.assertEqual(missing['valid_trials'], 0)
            self.assertEqual(missing['invalid_or_missing_trials'], 2)
            self.assertIsNone(missing['gains'])
            self.assertFalse(missing['eligible'])
            self.assertNotIn(CANARY, json.dumps(missing))

    def test_invalid_or_missing_repetition_cannot_be_hidden_by_a_success(self):
        for trials in ([trial()], [trial(), trial(invalid=True)]):
            public = feedback.project_method_comparison(method(trials=trials))
            self.assertEqual(public['assessment'], 'inconclusive')
            self.assertEqual(public['valid_trials'], 1)
            self.assertEqual(public['gains'], 1)  # Explicitly a valid-subset count.
            self.assertEqual(public['invalid_or_missing_trials'], 1)
            self.assertFalse(public['eligible'])
        invalid = feedback.project_method_comparison(method(trials=[trial(invalid=True)]*2))
        self.assertIsNone(invalid['gains'])

    def test_snapshot_identity_and_equal_caps_must_match_each_trial(self):
        for field, value in [('before', 'd'*64), ('after', 'd'*64),
                ('adaptation_seconds_each', 40), ('catalog_seconds_each', None)]:
            trials = [trial(), trial()]; trials[1]['binding'][field] = value
            result = feedback.project_method_comparison(method(trials=trials))
            self.assertEqual(result['assessment'], 'inconclusive')
            self.assertEqual(result['invalid_or_missing_trials'], 1)
            self.assertFalse(result['eligible'])
        no_candidate = method(trials=[]); no_candidate['candidate'] = None
        self.assertIsNone(feedback.project_method_comparison(no_candidate)['candidate'])

    def test_missing_independent_eligibility_cannot_be_recreated_from_use_counts(self):
        trials = [trial(), trial()]
        for item in trials:
            item['eligible'] = False  # For example, no independently curated suite.
        result = feedback.project_method_comparison(method(trials=trials))
        self.assertEqual(result['checked_component_transfer'], 2)
        self.assertEqual(result['supported_trials'], 0)
        self.assertFalse(result['eligible'])

    def test_both_succeed_coverage_is_distinct_from_zero_new_gains(self):
        trials = [trial(gain=False), trial(gain=False)]
        for item in trials:
            item['bounded_counts'] = {'before_successes': 2, 'after_successes': 2,
                'obligations': 2, 'holdouts': 1, 'regressions': 1}
        result = feedback.project_method_comparison(method(trials=trials))
        self.assertEqual(result['gains'], 0)
        self.assertEqual(result['before_successes'], 4)
        self.assertEqual(result['after_successes'], 4)
        self.assertEqual(result['obligations'], 4)
        self.assertEqual(result['measured_costs']['before']['adapter_seconds'], 6)
        self.assertEqual(result['measured_costs']['after']['adapter_seconds'], 4)
        self.assertFalse(result['eligible'])  # Cost evidence does not manufacture a new-task gain.

    def test_missing_or_malformed_coverage_is_unknown_and_invalid_trials_are_excluded(self):
        good = trial(); good['bounded_counts'] = {'before_successes': 0,
            'after_successes': 1, 'obligations': 1, 'holdouts': 1, 'regressions': 0}
        for key, value in [('before_successes', True), ('after_successes', -1),
                ('after_successes', 2), ('holdouts', 0), ('obligations', None)]:
            bad = copy.deepcopy(good); bad['bounded_counts'][key] = value
            result = feedback.project_method_comparison(method(trials=[good, bad]))
            self.assertIsNone(result['before_successes'])
            self.assertIsNone(result['after_successes'])
            self.assertIsNone(result['obligations'])
        result = feedback.project_method_comparison(method(trials=[good, trial()]))
        self.assertIsNone(result['obligations'])
        result = feedback.project_method_comparison(method(trials=[good, trial(invalid=True)]))
        self.assertEqual(result['before_successes'], 0)
        self.assertEqual(result['after_successes'], 1)
        self.assertEqual(result['obligations'], 1)
        self.assertEqual(result['assessment'], 'inconclusive')
        self.assertTrue(all(feedback.project_method_comparison(method())[key] is None
            for key in ('before_successes', 'after_successes', 'obligations')))

    def test_prediction_counters_are_typed_separate_from_proof_or_usefulness(self):
        raw = method(); raw['prediction_counts'] = {'checked': 2, 'pending': 1}
        result = feedback.project_method_comparison(raw)
        self.assertEqual(result['prediction_checked'], 2)
        self.assertEqual(result['prediction_pending'], 1)
        for value in ({'checked': True, 'pending': 1}, {'checked': 1, 'pending': -1},
                {'checked': 17, 'pending': 0}, {'checked': 1, 'pending': 1, 'private': CANARY}, None):
            raw['prediction_counts'] = value
            result = feedback.project_method_comparison(raw)
            self.assertIsNone(result['prediction_checked'])
            self.assertIsNone(result['prediction_pending'])
            self.assertNotIn(CANARY, json.dumps(result))

    def test_regression_is_not_positive_eligibility(self):
        a = trial(); a['regressions'] = [CANARY]
        result = feedback.project_method_comparison(method(trials=[trial(), a]))
        self.assertEqual(result['assessment'], 'valid_finite_budget_evidence')
        self.assertEqual(result['regressions'], 1)
        self.assertFalse(result['eligible'])
        self.assertEqual(result['supported_trials'], 1)

    def test_measured_costs_unknown_stay_null_and_do_not_replace_caps(self):
        raw = method(); raw['development_role_seconds'] = float('nan')
        raw['trials'][1]['measured_costs']['before']['adapter_seconds'] = float('inf')
        result = feedback.project_method_comparison(raw)
        self.assertIsNone(result['development_role_seconds'])
        self.assertIsNone(result['measured_costs']['before']['adapter_seconds'])
        self.assertEqual(result['budget_caps_seconds']['adaptation_seconds_each'], 30)
        for item in raw['trials']:
            item['measured_costs']['after']['adapter_seconds'] = 1e308
        self.assertIsNone(feedback.project_method_comparison(raw)['measured_costs']['after']['adapter_seconds'])

    def test_prediction_validation_cost_is_original_elapsed_not_current_reuse(self):
        for raw_cost in (0, 1.25, 17):
            raw = method(); raw['prediction_validation_seconds'] = raw_cost
            result = feedback.project_method_comparison(raw)
            self.assertEqual(result['prediction_validation_seconds'], raw_cost)
            self.assertIn('original validation execution elapsed', result['interpretation'])
            self.assertIn('do not measure current reuse cost', result['interpretation'])
        self.assertIsNone(feedback.project_method_comparison(method())['prediction_validation_seconds'])
        for raw_cost in (True, False, float('nan'), float('inf'), -1, '7', None):
            raw = method(); raw['prediction_validation_seconds'] = raw_cost
            self.assertIsNone(feedback.project_method_comparison(raw)['prediction_validation_seconds'])
        forged = feedback.project_method_comparison(method())
        for raw_cost in (True, float('nan'), -1):
            forged['prediction_validation_seconds'] = raw_cost
            with self.assertRaises(Invalid): feedback.validate_method_feedback(forged)

    def test_legacy_packets_unchanged_optional_method_delivery_and_digest(self):
        old = packet()
        self.assertNotIn('method_comparisons', old)
        self.assertEqual(old, packet(method_comparisons=None))
        feedback.validate_feedback(old)
        current = packet(method_comparisons=[method()])
        self.assertEqual(len(current['method_comparisons']), 1)
        self.assertEqual(current['reference'], digest({k: v for k, v in current.items() if k != 'reference'}))
        state = {}; feedback.append_review_feedback(state, current)
        restored = json.loads(json.dumps(state))
        delivered = feedback.request_feedback(restored)
        self.assertEqual(delivered['latest']['method_comparisons'], current['method_comparisons'])
        self.assertNotIn(CANARY, json.dumps(delivered))
        current['method_comparisons'][0]['gains'] = 100
        self.assertNotEqual(delivered['latest'], current)

    def test_strict_public_packet_rejects_forged_private_fields_and_bad_counters(self):
        original = feedback.project_method_comparison(method())
        mutations = [lambda p: p.update(task_ids=[CANARY]),
            lambda p: p.update(expected_trials=True), lambda p: p.update(valid_trials=3),
            lambda p: p.update(invalid_or_missing_trials=1), lambda p: p.update(gains=True),
            lambda p: p.update(checked_component_transfer=3),
            lambda p: p.update(eligible=False), lambda p: p.update(reason=CANARY),
            lambda p: p['measured_costs']['before'].update(answer_path=CANARY),
            lambda p: p['budget_caps_seconds'].update(private=CANARY),
            lambda p: p.update(development_role_seconds=-1),
            lambda p: p.update(before_successes=True, after_successes=1, obligations=1),
            lambda p: p.update(before_successes=2, after_successes=1, obligations=1),
            lambda p: p.update(before_successes=0, after_successes=0, obligations=1),
            lambda p: p.update(before_successes=0),
            lambda p: p.update(prediction_checked=True, prediction_pending=0),
            lambda p: p.update(prediction_checked=17, prediction_pending=0),
            lambda p: p.update(prediction_pending=1)]
        for mutate in mutations:
            value = copy.deepcopy(original); mutate(value)
            with self.assertRaises(Invalid): feedback.validate_method_feedback(value)
        current = packet(method_comparisons=[method()])
        current['method_comparisons'][0]['private_target'] = CANARY
        current['reference'] = digest({k: v for k,v in current.items() if k != 'reference'})
        with self.assertRaises(Invalid): feedback.validate_feedback(current)

    def test_raw_identity_repetition_and_list_bounds(self):
        for key, value in [('method_id', '../private'), ('reference', CANARY),
                ('before', None), ('candidate', CANARY), ('expected_trials', True),
                ('expected_trials', 0), ('expected_trials', 9), ('expected_trials', 1),
                ('trials', CANARY)]:
            raw = method(); raw[key] = value
            with self.assertRaises(Invalid): feedback.project_method_comparison(raw)
        missing = method(); del missing['candidate']
        with self.assertRaises(Invalid): feedback.project_method_comparison(missing)
        with self.assertRaises(Invalid): packet(method_comparisons=[method(), method()])
        with self.assertRaises(Invalid): packet(method_comparisons=[method()]*9)


if __name__ == '__main__':
    unittest.main()
