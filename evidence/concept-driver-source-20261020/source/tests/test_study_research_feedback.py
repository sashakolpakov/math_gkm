"""Pure feedback-channel checks: no researchers, models, evaluators or compilers."""
import copy
import json
import unittest

from machinery import study_research_feedback as feedback
from machinery.study_common import Invalid, digest

CANARY = 'PRIVATE_OBLIGATION_NEVER_IN_RESEARCH'
OWN_SCOPE = feedback.OWN_REVIEW_SCOPE


def receipt(outcome='completed'):
    return {'role': 'reviewer', 'outcome': outcome, 'elapsed_seconds': 3.5,
            'payload': {'findings': [{'path': 'MathGKM/Neutral.lean',
                'sha256': 'a' * 64, 'finding': 'The consumer retains a residual premise.'}],
                'correctness': 'Accepted fact has a checked own-source receipt.',
                'scope': 'The conditional result leaves its antecedent open.',
                'transfer': 'A common representation may connect the two own examples.',
                'costs': 'Development used one bounded invocation.',
                'recommendation': 'Distinguish the representation hypothesis from a case extension.'}}


def comparison(status='valid_finite_budget_comparison'):
    return {'status': status, 'eligible': True, 'all_frozen_declarations_retained': True,
            'task_gains': [CANARY + '-gain'], 'transfer': [CANARY + '-transfer'],
            'regressions': [], 'binding': {'suite': CANARY,
                'adaptation_seconds_each': 100, 'validation_seconds_each_task': 40},
            'sides': {'before': {'proof_term': CANARY}}, 'catalogs': {CANARY: CANARY},
            'scope': CANARY, 'costs': CANARY, 'catalog_failure': {'task': CANARY}}


def packet(round_index=2, **kwargs):
    return feedback.build_review_feedback(round_index, receipt(), True,
        reviewer_scope=OWN_SCOPE, **kwargs)


class ResearchFeedbackTests(unittest.TestCase):
    def test_fresh_reviewer_sees_only_own_records_and_sources(self):
        records = {'round': 2, 'knowledge': {'own': {'statement': 'True'}},
            'components': {}, 'remaining_obligations': {'root': 'Own open statement'},
            'formal_obligations': {'root': 'Own fixed goal'},
            'receipts': [dict(role=role, payload={'value': role if role in
                ('researcher', 'proposer') else CANARY})
                for role in ('researcher', 'adapter', 'reviewer', 'selector', 'proposer')],
            'evaluations': [CANARY], 'episode_transfer': comparison(),
            'policy_comparison': comparison(), 'compared_sources': CANARY,
            'private_tasks': CANARY, 'audit': {'complexity': CANARY}}
        original = copy.deepcopy(records)
        projected = feedback.own_source_review_records(records)
        self.assertNotIn(CANARY, json.dumps(projected))
        self.assertEqual([r['role'] for r in projected['receipts']], ['researcher', 'proposer'])
        self.assertEqual(projected['review_scope'], OWN_SCOPE)
        self.assertEqual(projected['knowledge'], records['knowledge'])
        projected['knowledge']['own']['statement'] = 'Mutated copy'
        self.assertEqual(records, original)

    def test_legacy_reviewer_prose_is_not_returned_even_with_valid_references(self):
        unsafe = receipt(); unsafe['payload'] = {k: CANARY for k in
            ('findings', 'correctness', 'scope', 'transfer', 'costs', 'recommendation')}
        for scope in ('untrusted_or_legacy', 'private_assessment', None):
            projected = feedback.build_review_feedback(2, unsafe, True, reviewer_scope=scope)
            self.assertNotIn(CANARY, json.dumps(projected))
            self.assertEqual(projected['source_review']['status'], 'unavailable_private_or_legacy_scope')

    def test_substantive_own_diagnosis_has_bound_artifact_but_no_new_authority(self):
        result = packet(episode_transfer=comparison())
        diagnosis = result['source_review']
        self.assertEqual(diagnosis['status'], 'artifact_bound_source_assessment')
        self.assertIn('antecedent open', diagnosis['scope'])
        self.assertIn('common representation', diagnosis['transfer'])
        self.assertEqual(len(diagnosis['findings']), 1)
        self.assertEqual(diagnosis['authority'], 'interpretation_only')
        self.assertFalse(result['mathematical_admission_changed'])
        self.assertFalse(result['hypothesis_statuses_changed'])
        self.assertIn('not mathematical admission', result['interpretation'])
        self.assertEqual(result['reference'], digest({k: v for k, v in result.items() if k != 'reference'}))

    def test_aggregate_comparison_omits_all_private_identifiers_and_text(self):
        source = comparison(); original = copy.deepcopy(source)
        public = feedback.comparison_feedback(source)
        self.assertNotIn(CANARY, json.dumps(public))
        self.assertEqual(public['assessment'], 'valid_finite_budget_evidence')
        self.assertEqual(public['gains'], 1)
        self.assertEqual(public['checked_component_transfer'], 1)
        self.assertEqual(public['regressions'], 0)
        self.assertEqual(public['budget_caps_seconds'],
            {'adaptation_seconds_each': 100, 'validation_seconds_each_task': 40})
        self.assertEqual(source, original)

    def test_missing_invalid_and_operational_comparisons_are_inconclusive_not_zero(self):
        examples = [None, {}, comparison('invalid_frozen_context'),
            comparison('invalid_comparison_or_capability_regression'),
            comparison('no_independent_holdout; transfer_not_demonstrated'),
            comparison(CANARY)]
        for example in examples:
            with self.subTest(example=None if example is None else example.get('status')):
                public = feedback.comparison_feedback(example)
                self.assertEqual(public['assessment'], 'inconclusive')
                self.assertIsNone(public['gains'])
                self.assertIsNone(public['checked_component_transfer'])
                self.assertIsNone(public['regressions'])
                self.assertFalse(public['eligible'])
                self.assertNotIn(CANARY, json.dumps(public))

    def test_valid_zero_gain_distinguished_from_unavailable(self):
        source = comparison(); source.update(task_gains=[], transfer=[], eligible=False)
        result = feedback.comparison_feedback(source)
        self.assertEqual(result['assessment'], 'valid_finite_budget_evidence')
        self.assertEqual(result['gains'], 0)
        self.assertFalse(result['eligible'])
        for field, value in [('transfer', None), ('task_gains', {}),
                ('all_frozen_declarations_retained', False), ('eligible', 1)]:
            malformed = comparison(); malformed[field] = value
            self.assertEqual(feedback.comparison_feedback(malformed)['assessment'], 'inconclusive')

    def test_failed_outer_policy_comparison_does_not_inherit_nested_success(self):
        public = feedback.comparison_feedback({'eligible': False, 'comparison': comparison(),
            'outcomes': CANARY, 'status': CANARY})
        self.assertEqual(public['assessment'], 'inconclusive')
        self.assertIsNone(public['gains'])
        self.assertFalse(public['eligible'])
        self.assertNotIn(CANARY, json.dumps(public))
        valid = feedback.comparison_feedback({'eligible': True, 'comparison': comparison()})
        self.assertEqual(valid['gains'], 1)

    def test_review_failures_and_unbound_findings_do_not_feed_prose_back(self):
        for outcome, bound in [('timeout', True), ('invalid_report:' + CANARY, True),
                ('completed', False), ('completed', 1), ('exit', False)]:
            unsafe = receipt(outcome); unsafe['payload']['scope'] = CANARY
            result = feedback.build_review_feedback(2, unsafe, bound, reviewer_scope=OWN_SCOPE)
            self.assertNotIn(CANARY, json.dumps(result))
            self.assertEqual(result['source_review']['findings'], [])
            self.assertFalse(result['hypothesis_statuses_changed'])

    def test_bounded_diagnosis_history_and_stable_references(self):
        huge = receipt(); huge['payload']['scope'] = 's' * 100000
        huge['payload']['findings'] *= 100
        huge['payload']['unrecognized'] = CANARY
        huge['private_path'] = CANARY
        result = feedback.build_review_feedback(0, huge, True, reviewer_scope=OWN_SCOPE)
        self.assertTrue(result['source_review']['truncated'])
        self.assertLessEqual(len(result['source_review']['findings']), feedback.FINDINGS_LIMIT)
        self.assertLess(len(result['source_review']['scope']), feedback.TEXT_LIMIT + 20)
        self.assertNotIn(CANARY, json.dumps(result))
        state = {'portfolio': {'own': {'status': 'open'}}, 'knowledge': {}}
        portfolio = copy.deepcopy(state['portfolio'])
        for r in range(20): feedback.append_review_feedback(state, packet(r))
        self.assertEqual(len(state['review_feedback']), feedback.HISTORY_LIMIT)
        projected = feedback.request_feedback(state)
        self.assertEqual(projected['latest']['round'], 19)
        self.assertEqual(projected['history'][0]['round'], 12)
        projected['latest']['source_review']['scope'] = 'Local mutation'
        self.assertNotEqual(projected['latest'], state['review_feedback'][-1])
        self.assertEqual(state['portfolio'], portfolio)
        self.assertEqual(state['knowledge'], {})

    def test_append_and_consumption_durable_idempotent_and_conflicts_reject(self):
        state = {}; p = packet(); feedback.append_review_feedback(state, p)
        feedback.append_review_feedback(state, p)
        self.assertEqual(len(state['review_feedback']), 1)
        # JSON save/reload preserves the feedback that the next request receives.
        restored = json.loads(json.dumps(state))
        request = feedback.request_feedback(restored)
        refs = [item['reference'] for item in request['history']]
        first = feedback.record_feedback_consumption(restored, 'plan-3', 3, 'proposer', refs)
        again = feedback.record_feedback_consumption(restored, 'plan-3', 3, 'proposer', refs)
        self.assertEqual(first, again)
        self.assertEqual(first['meaning'], 'delivered_not_proven_used')
        self.assertEqual(len(restored['review_feedback_deliveries']), 1)
        with self.assertRaises(Invalid):
            feedback.record_feedback_consumption(restored, 'plan-3', 3, 'proposer', [])
        with self.assertRaises(Invalid):
            feedback.record_feedback_consumption(restored, 'plan-4', 4, 'researcher', ['f' * 64])
        conflicting = packet(2, episode_transfer=comparison())
        with self.assertRaises(Invalid): feedback.append_review_feedback(state, conflicting)
        changed = copy.deepcopy(p); changed['source_review']['scope'] = 'Unbound change'
        with self.assertRaises(Invalid): feedback.append_review_feedback({}, changed)

    def test_malformed_and_nonfinite_numbers_do_not_become_feedback(self):
        source = comparison(); source['binding']['adaptation_seconds_each'] = float('nan')
        source['binding']['validation_seconds_each_task'] = True
        self.assertEqual(feedback.comparison_feedback(source)['budget_caps_seconds'], {})
        value = receipt(); value['elapsed_seconds'] = float('inf')
        result = feedback.build_review_feedback(2, value, True, reviewer_scope=OWN_SCOPE)
        self.assertIsNone(result['review_elapsed_seconds'])
        value['elapsed_seconds'] = 10 ** 1000
        self.assertIsNone(feedback.build_review_feedback(2, value, True,
            reviewer_scope=OWN_SCOPE)['review_elapsed_seconds'])
        for bad in (True, -1, '2', None):
            with self.assertRaises(Invalid): feedback.build_review_feedback(bad, receipt(), True)

    def test_rehashed_extra_fields_and_unbounded_or_private_nested_fields_reject(self):
        original = packet(episode_transfer=comparison())
        mutations = [
            lambda p: p.update(complexity_reward=CANARY),
            lambda p: p['source_review'].update(private_task=CANARY),
            lambda p: p['source_review'].update(scope='s' * 100000),
            lambda p: p['episode_transfer'].update(task_ids=[CANARY]),
            lambda p: p['episode_transfer'].update(gains=True),
            lambda p: p['policy_comparison'].update(gains=0),
            lambda p: p.update(mathematical_admission_changed=True),
            lambda p: p.update(hypothesis_statuses_changed=True),
        ]
        for mutate in mutations:
            value = copy.deepcopy(original); mutate(value)
            value['reference'] = digest({k: v for k, v in value.items() if k != 'reference'})
            with self.subTest(mutation=mutate), self.assertRaises(Invalid):
                feedback.validate_feedback(value)
        self.assertEqual(feedback.validate_feedback(original), original)

    def test_comparison_context_is_own_bounded_interval_and_not_concept_causality(self):
        ordinary = {'kind': 'ordinary_episode', 'concept_reference': None,
                    'start_round': 0, 'end_round': 2, 'complete': True}
        concept = {'kind': 'concept_episode_package', 'concept_reference': 'b' * 64,
                   'start_round': 1, 'end_round': 2, 'complete': True}
        for context in (None, ordinary, concept):
            value = packet(comparison_context=context)
            self.assertEqual(value['comparison_context'], context)
            feedback.validate_feedback(value)
        bad_contexts = [
            {**ordinary, 'private_task': CANARY},
            {**ordinary, 'concept_reference': 'b' * 64},
            {**concept, 'concept_reference': None},
            {**concept, 'concept_reference': CANARY},
            {**concept, 'kind': CANARY},
            {**concept, 'start_round': True},
            {**concept, 'end_round': 0},
            {**concept, 'end_round': 3},
            {**concept, 'complete': 1},
        ]
        for context in bad_contexts:
            with self.subTest(context=context), self.assertRaises(Invalid):
                packet(comparison_context=context)
        incomplete = {**concept, 'complete': False}
        self.assertFalse(packet(comparison_context=incomplete)['comparison_context']['complete'])
        # Own prospective concepts reach the reviewer; private tasks never do.
        records = feedback.own_source_review_records({'concepts': {'plan': 'own prospective'},
                                                      'private_tasks': CANARY})
        self.assertEqual(records['concepts'], {'plan': 'own prospective'})
        self.assertNotIn(CANARY, json.dumps(records))

    def test_measured_costs_are_typed_and_distinct_from_caps(self):
        source = comparison()
        source['measured_costs'] = {'before': {'adapter_seconds': 3.0, 'validation_seconds': 2,
            'context_validation_seconds': 1, 'private_task': CANARY},
            'after': {'adapter_seconds': 2.5, 'validation_seconds': 1.5,
                'context_validation_seconds': None, 'answer_path': CANARY}, 'private': CANARY}
        value = packet(episode_transfer=source, development_role_seconds=7.5)
        self.assertEqual(value['development_costs']['role_seconds'], 7.5)
        measured = value['episode_transfer']['measured_costs']
        self.assertEqual(measured['before']['adapter_seconds'], 3.0)
        self.assertIsNone(measured['after']['context_validation_seconds'])
        self.assertEqual(value['episode_transfer']['budget_caps_seconds']['adaptation_seconds_each'], 100)
        self.assertNotIn(CANARY, json.dumps(value))
        self.assertIsNone(packet()['development_costs']['role_seconds'])
        self.assertTrue(all(v is None for s in packet()['episode_transfer']['measured_costs'].values()
                            for v in s.values()))
        failed = {**source, 'status': 'invalid_frozen_context'}
        invalid = packet(episode_transfer=failed)
        self.assertIsNone(invalid['episode_transfer']['gains'])
        self.assertEqual(invalid['episode_transfer']['measured_costs']['before']['adapter_seconds'], 3.0)
        for key, bad in [('adapter_seconds', float('inf')), ('validation_seconds', True),
                         ('context_validation_seconds', -1)]:
            source['measured_costs']['before'][key] = bad
        filtered = packet(episode_transfer=source, development_role_seconds=float('nan'))
        self.assertTrue(all(v is None for v in filtered['episode_transfer']['measured_costs']['before'].values()))
        self.assertIsNone(filtered['development_costs']['role_seconds'])
        forged = copy.deepcopy(value)
        forged['episode_transfer']['measured_costs']['before']['private_path'] = CANARY
        forged['reference'] = digest({k:v for k,v in forged.items() if k != 'reference'})
        with self.assertRaises(Invalid): feedback.validate_feedback(forged)

    def test_audit_complexity_cannot_become_reward_or_policy(self):
        state = {'audit': {'complexity': 7, 'reward': CANARY}, 'portfolio': {}}
        source = comparison(); source['compression_reward'] = CANARY
        p = packet(episode_transfer=source); feedback.append_review_feedback(state, p)
        projected = feedback.request_feedback(state)
        self.assertNotIn(CANARY, json.dumps(projected))
        self.assertNotIn('compression_reward', json.dumps(projected))
        self.assertEqual(state['audit']['complexity'], 7)
        self.assertEqual(state['portfolio'], {})


if __name__ == '__main__':
    unittest.main()
