"""Neutral deterministic concept-loop regressions; no models or Lean processes."""
import copy
from pathlib import Path
import unittest

from machinery import study_concepts as concepts
from machinery import study_research_feedback as feedback
from machinery.study_common import Invalid, canonical, digest

CFG = {'enabled': True}


def plan(identity='mechanism-v0', horizon=3):
    return {
        'id': identity,
        'explanations': [
            {'id': 'representation', 'claim': 'The representation obscures a shared operation.',
             'discriminator': 'Compare the same identity in the proposed representation.',
             'changes_choice': 'Keep the representation only if the correspondence survives.'},
            {'id': 'missing-assumption', 'claim': 'An extra hypothesis is actually needed.',
             'discriminator': 'Test whether the proposed correspondence requires that hypothesis.',
             'changes_choice': 'Expose the hypothesis rather than silently strengthening the task.'}],
        'selected_explanation': 'representation',
        'mechanism': 'A common operation with a checked interpretation back to the original objects.',
        'explains': ['The first independent identity.', 'The second independent identity.'],
        'goal_bridge': {'claim': 'Transport the shared operation to the original goal.',
                        'status': 'conjectural',
                        'remaining_obligations': ['Prove the interpretation preserves the required relation.']},
        'consequences': [
            {'id': 'transport', 'target': 'Transport the original relation.',
             'structural_difference': 'This tests interpretation rather than a motivating identity.',
             'observable_check': 'The unchanged relation admits a checked transport.',
             'changes_choice': 'A failed interpretation calls for revising the bridge.'},
            {'id': 'composition', 'target': 'Compose two instances of the common operation.',
             'structural_difference': 'This tests closure under composition on new inputs.',
             'observable_check': 'A separately checked composition consumer uses the component.',
             'changes_choice': 'Keep the mechanism only with its actual domain restrictions.'}],
        'horizon_rounds': horizon,
        'checkpoints': [{'after_rounds': horizon, 'consequence_ids': ['transport','composition'],
                         'question': 'Which prospective consequences have independently checked evidence?'}],
    }


def observation(reference=None, scope='ordinary', items=None):
    return {'episode_reference': reference, 'work_scope': scope,
            'observations': items or [], 'component_ids': [],
            'next_question': 'Which prospective consequence remains unresolved?'}


def review(round_index, comparison=None, *, prose='The bridge remains an unresolved research question.', context=None):
    receipt = {'outcome': 'completed', 'elapsed_seconds': 2.0,
               'payload': {'correctness': prose, 'scope': 'Own neutral sources only.',
                           'findings': []}}
    return feedback.build_review_feedback(round_index, receipt, True,
             reviewer_scope=feedback.OWN_REVIEW_SCOPE, episode_transfer=comparison, comparison_context=context)


def comparison(*, gains=True, use=True, regression=False, status='valid_finite_budget_comparison'):
    return {'status': status, 'task_gains': ['PRIVATE-TARGET'] if gains else [],
            'transfer': ['PRIVATE-TARGET'] if use else [],
            'regressions': ['PRIVATE-REGRESSION'] if regression else [],
            'eligible': gains and use and not regression,
            'all_frozen_declarations_retained': True,
            'binding': {'adaptation_seconds_each': 20, 'validation_seconds_each_task': 20}}


class ConceptLoopTests(unittest.TestCase):
    def start(self, *, horizon=3, config=CFG):
        state = concepts.initial(config)
        return concepts.commit(state, plan(horizon=horizon), 0, config, round_limit=8)

    def test_absent_configuration_is_legacy_noop(self):
        state = concepts.initial()
        self.assertFalse(state['enabled'])
        self.assertIsNone(concepts.project(state, 0))
        after, commitment = concepts.commit(state, None, 0)
        self.assertEqual(after, state)
        self.assertIsNone(commitment)
        self.assertEqual(concepts.report(state, None, 0), state)
        with self.assertRaises(Invalid): concepts.commit(state, plan(), 0)

    def test_strict_configuration_and_numeric_bounds(self):
        for changes in ({'enabled': 1}, {'max_horizon_rounds': 0},
                        {'min_horizon_rounds': 5, 'max_horizon_rounds': 4},
                        {'max_history': 8, 'projection_feedback_limit': 9},
                        {'complexity_score': 9}, {'max_ordinary_rounds': True}):
            with self.subTest(changes=changes), self.assertRaises(Invalid):
                concepts.validate_config(changes)

    def test_competing_explanations_and_prospective_consequences_required(self):
        for field in ('explanations','consequences','explains'):
            value = plan(); value[field] = value[field][:1]
            with self.subTest(field=field), self.assertRaises(Invalid): concepts.validate(value, CFG)
        value = plan(); value['selected_explanation'] = 'unknown'
        with self.assertRaises(Invalid): concepts.validate(value, CFG)

    def test_consequences_have_distinct_ids_targets_and_checkpoint_coverage(self):
        for field in ('id','target'):
            value = plan(); value['consequences'][1][field] = value['consequences'][0][field]
            with self.subTest(field=field), self.assertRaises(Invalid): concepts.validate(value, CFG)
        value = plan(); value['checkpoints'][0]['consequence_ids'] = ['transport']
        with self.assertRaises(Invalid): concepts.validate(value, CFG)
        value = plan(); value['checkpoints'][0]['after_rounds'] = 4
        with self.assertRaises(Invalid): concepts.validate(value, CFG)

    def test_commitment_is_content_bound_before_action_and_does_not_mutate_input(self):
        before = concepts.initial(CFG); saved = copy.deepcopy(before); candidate = plan()
        after, commitment = concepts.commit(before, candidate, 0, CFG, round_limit=8)
        self.assertEqual(before, saved)
        reference = digest(candidate)
        self.assertEqual(commitment['state_binding'], digest(before))
        self.assertEqual(commitment['episode_reference'], reference)
        self.assertEqual(after['plans'][reference], candidate)
        self.assertEqual((commitment['start_round'],commitment['end_round'],commitment['horizon_rounds']), (0,2,3))
        candidate['mechanism'] = 'Mutated outside the retained immutable record.'
        self.assertNotEqual(after['plans'][reference], candidate)

    def test_immutable_plan_cannot_be_replaced_inside_protected_horizon(self):
        state, _ = self.start()
        changed = plan('new-version'); changed['mechanism'] = 'A different explanation.'
        with self.assertRaisesRegex(Invalid, 'protected'):
            concepts.commit(state, changed, 1, CFG, round_limit=8)
        after, commitment = concepts.commit(state, {'continue': digest(plan())}, 1, CFG, round_limit=8)
        self.assertEqual(commitment['end_round'], 2)
        self.assertEqual(after['plans'], state['plans'])

    def test_protected_horizon_survives_missing_report_and_no_theorem(self):
        state, commitment = self.start()
        state = concepts.report(state, None, 0, CFG, commitment=commitment)
        self.assertEqual(state['active']['missing_report_rounds'], [0])
        state = concepts.finish(state, 1, review(1), CFG)
        self.assertIsNotNone(state['active'])
        self.assertEqual(state['active']['end_round'], 2)
        state, commitment = concepts.commit(state, None, 1, CFG, round_limit=8)
        state = concepts.report(state, observation(digest(plan()), 'mechanism'), 1, CFG, commitment=commitment)
        self.assertEqual(state['active']['status'], 'protected; usefulness_unresolved')
        self.assertEqual(concepts.project(state, 2, CFG)['required_action'], 'continue_protected_episode')

    def test_null_report_does_not_create_failure_or_refutation(self):
        state, commitment = self.start()
        after = concepts.report(state, None, 0, CFG, commitment=commitment)
        self.assertNotIn('refuted', after['active']['status'])
        self.assertEqual(after['active']['observations'], [])
        self.assertEqual(state['active']['missing_report_rounds'], [])

    def test_interim_review_preserves_horizon_and_final_review_closes_it(self):
        state, _ = self.start()
        state = concepts.finish(state, 2, review(2), CFG)
        self.assertIsNotNone(state['active'])
        state = concepts.finish(state, 3, review(3), CFG)
        self.assertIsNone(state['active'])
        self.assertIn('inconclusive', state['episodes'][0]['status'])
        self.assertNotIn('refuted', state['episodes'][0]['status'])

    def test_invalid_comparison_is_inconclusive_not_zero_gain_or_refutation(self):
        state, _ = self.start()
        bad = comparison(status='invalid_frozen_context')
        bad['eligible'] = True
        state = concepts.finish(state, 3, review(3, bad, prose='This mechanism is perfect.'), CFG)
        packet = state['review_feedback'][-1]
        self.assertIsNone(packet['episode_transfer']['gains'])
        self.assertIn('inconclusive', packet['evidence_status'])
        self.assertNotIn('refuted', state['episodes'][0]['status'])
        self.assertNotIn('PRIVATE-TARGET', canonical(state))

    def test_valid_matched_checked_use_supports_only_finite_budget_transfer(self):
        state, _ = self.start()
        context = {'kind':'concept_episode_package','concept_reference':digest(plan()),
                   'start_round':0,'end_round':3,'complete':True}
        state = concepts.finish(state, 3, review(3, comparison(), context=context), CFG)
        packet = state['review_feedback'][-1]
        self.assertIn('checked_concept_package_transfer', packet['evidence_status'])
        self.assertIn('causality_unproved', packet['evidence_status'])
        self.assertIn('finite_budget_only', packet['evidence_status'])
        self.assertFalse(packet['mathematical_admission_changed'])
        self.assertFalse(packet['hypothesis_statuses_changed'])
        self.assertNotIn('PRIVATE-TARGET', canonical(packet))

    def test_valid_zero_gain_is_observation_not_mathematical_refutation(self):
        state, _ = self.start()
        context = {'kind':'concept_episode_package','concept_reference':digest(plan()),
                   'start_round':0,'end_round':3,'complete':True}
        state = concepts.finish(state, 3, review(3, comparison(gains=False,use=False), context=context), CFG)
        packet = state['review_feedback'][-1]
        self.assertEqual(packet['episode_transfer']['gains'], 0)
        self.assertIn('transfer_not_demonstrated', packet['evidence_status'])
        self.assertNotIn('refuted', state['episodes'][0]['status'])

    def test_prose_and_new_vocabulary_cannot_self_certify_success(self):
        state, commitment = self.start()
        reported = observation(digest(plan()), 'mechanism', [
            {'consequence_id':'transport','status':'observed',
             'observation':'I have discovered an excellent universal explanation.', 'evidence':[]}])
        state = concepts.report(state, reported, 0, CFG, commitment=commitment)
        state = concepts.finish(state, 3, review(3, prose='A revolutionary new mechanism.'), CFG)
        self.assertIn('inconclusive', state['episodes'][0]['status'])
        self.assertEqual(state['episodes'][0]['observations'][0]['status'], 'research_report; not independently verified')

    def test_report_requires_exact_committed_prediction_and_cannot_claim_certification(self):
        state, commitment = self.start()
        item = {'consequence_id':'uncommitted','status':'observed','observation':'Some outcome.', 'evidence':[]}
        with self.assertRaises(Invalid):
            concepts.report(state, observation(digest(plan()),'mechanism',[item]), 0, CFG, commitment=commitment)
        item['consequence_id'] = 'transport'; item['status'] = 'proved'
        with self.assertRaises(Invalid):
            concepts.report(state, observation(digest(plan()),'mechanism',[item]), 0, CFG, commitment=commitment)
        altered = copy.deepcopy(commitment); altered['plan_binding'] = '0'*64
        with self.assertRaises(Invalid):
            concepts.report(state, observation(digest(plan())), 0, CFG, commitment=altered)

    def test_ordinary_exploitation_is_available_before_periodic_concept_start(self):
        state = concepts.initial(CFG)
        for round_index in (0,1):
            state, commitment = concepts.commit(state, None, round_index, CFG, round_limit=8)
            state = concepts.report(state, observation(), round_index, CFG, commitment=commitment)
        self.assertEqual(concepts.project(state, 2, CFG, round_limit=8)['required_action'], 'start_concept_episode')
        with self.assertRaises(Invalid): concepts.commit(state, None, 2, CFG, round_limit=8)
        state, commitment = concepts.commit(state, plan(), 2, CFG, round_limit=8)
        self.assertEqual(commitment['mode'], 'protected_concept')

    def test_ordinary_proof_work_can_support_a_protected_episode(self):
        state, commitment = self.start()
        state = concepts.report(state, observation(digest(plan()), 'ordinary'), 0, CFG, commitment=commitment)
        state, commitment = concepts.commit(state, None, 1, CFG, round_limit=8)
        state = concepts.report(state, observation(digest(plan()), 'ordinary'), 1, CFG, commitment=commitment)
        self.assertEqual(state['active']['end_round'], 2)

    def test_repeated_cases_trigger_reassessment_but_informative_cases_are_permitted(self):
        cfg = {**CFG, 'max_ordinary_rounds': 4}
        state = concepts.initial(cfg)
        for round_index in (0,1):
            state, commitment = concepts.commit(state, None, round_index, cfg, round_limit=8)
            state = concepts.report(state, observation(scope='parameter_case'), round_index, cfg, commitment=commitment)
        self.assertTrue(concepts.project(state, 2, cfg)['case_reassessment_required'])
        with self.assertRaisesRegex(Invalid,'reassessment'):
            concepts.commit(state, None, 2, cfg, round_limit=8)
        reason = {'ordinary':{'purpose':'Distinguish competing explanations.',
                              'discriminates':'This case changes whether the interpretation is available.'}}
        state, commitment = concepts.commit(state, reason, 2, cfg, round_limit=8)
        state = concepts.report(state, observation(scope='parameter_case'), 2, cfg, commitment=commitment)
        self.assertEqual(state['consecutive_case_steps'], 3)

    def test_protected_episode_can_switch_from_cases_to_mechanism_without_new_plan(self):
        state, commitment = self.start()
        for round_index in (0,1):
            if round_index:
                state, commitment = concepts.commit(state, None, round_index, CFG, round_limit=8)
            state = concepts.report(state, observation(digest(plan()),'parameter_case'), round_index, CFG, commitment=commitment)
        state, commitment = concepts.commit(state, None, 2, CFG, round_limit=8)
        with self.assertRaisesRegex(Invalid,'reassessment'):
            concepts.report(state, observation(digest(plan()),'parameter_case'), 2, CFG, commitment=commitment)
        state = concepts.report(state, observation(digest(plan()),'mechanism'), 2, CFG, commitment=commitment)
        self.assertEqual(state['consecutive_case_steps'],0)

    def test_horizon_must_fit_actual_campaign_without_silent_truncation(self):
        state = concepts.initial(CFG)
        with self.assertRaisesRegex(Invalid,'remaining campaign'):
            concepts.commit(state, plan(horizon=3), 2, CFG, round_limit=4)
        self.assertIsNone(state['active'])
        with self.assertRaises(Invalid): concepts.commit(state, None, 4, CFG, round_limit=4)

    def test_final_short_remainder_allows_exploitation_instead_of_impossible_episode(self):
        cfg = {**CFG, 'max_ordinary_rounds': 0}
        state = concepts.initial(cfg)
        self.assertEqual(concepts.project(state, 3, cfg, round_limit=4)['required_action'], 'final_exploitation_or_review')
        after, commitment = concepts.commit(state, None, 3, cfg, round_limit=4)
        self.assertEqual(commitment['mode'], 'ordinary_exploitation')
        self.assertIsNone(after['active'])

    def test_duplicate_reports_and_rewritten_reviews_are_rejected(self):
        state, commitment = self.start()
        state = concepts.report(state, None, 0, CFG, commitment=commitment)
        with self.assertRaises(Invalid): concepts.report(state, None, 0, CFG, commitment=commitment)
        first = review(1); state = concepts.finish(state, 1, first, CFG)
        self.assertEqual(concepts.finish(state, 1, first, CFG), state)
        with self.assertRaises(Invalid): concepts.finish(state, 1, review(1,prose='Rewritten.'), CFG)

    def test_feedback_history_and_request_projection_are_bounded_and_nonaliasing(self):
        cfg = {**CFG, 'max_history': 8, 'projection_feedback_limit': 3}
        state = concepts.initial(cfg)
        for round_index in range(10):
            state = concepts.finish(state, round_index, review(round_index), cfg)
        self.assertEqual(len(state['review_feedback']),8)
        projected = concepts.project(state, 10, cfg)
        self.assertEqual(len(projected['review_feedback']),3)
        projected['review_feedback'][0]['source_review']['findings'].append('external mutation')
        self.assertEqual(state['review_feedback'][-3]['source_review']['findings'],[])

    def test_old_concept_identity_cannot_be_silently_recycled(self):
        state, _ = self.start()
        state = concepts.finish(state, 3, review(3), CFG)
        with self.assertRaisesRegex(Invalid,'already committed'):
            concepts.commit(state, plan(), 3, CFG, round_limit=8)
        after, _ = concepts.commit(state, plan('mechanism-v1'), 3, CFG, round_limit=8)
        self.assertEqual(len(after['plans']),2)

    def test_concept_retention_cap_preserves_existing_records(self):
        cfg = {**CFG,'max_concepts':1}
        state, _ = self.start(config=cfg)
        state = concepts.finish(state, 3, review(3), cfg)
        saved = copy.deepcopy(state)
        with self.assertRaisesRegex(Invalid,'retention bound'):
            concepts.commit(state, plan('new'), 3, cfg, round_limit=8)
        self.assertEqual(state,saved)

    def test_ordinary_or_misaligned_comparison_cannot_support_a_concept(self):
        contexts = [None,
            {'kind':'ordinary_episode','concept_reference':None,'start_round':0,'end_round':3,'complete':True},
            {'kind':'concept_episode_package','concept_reference':'0'*64,'start_round':0,'end_round':3,'complete':True},
            {'kind':'concept_episode_package','concept_reference':digest(plan()),'start_round':1,'end_round':3,'complete':True},
            {'kind':'concept_episode_package','concept_reference':digest(plan()),'start_round':0,'end_round':2,'complete':True},
            {'kind':'concept_episode_package','concept_reference':digest(plan()),'start_round':0,'end_round':3,'complete':False}]
        for context in contexts:
            state, _ = self.start()
            state = concepts.finish(state, 3, review(3, comparison(),context=context), CFG)
            with self.subTest(context=context):
                self.assertIn('general_library_transfer_only', state['episodes'][0]['status'])
                self.assertIn('inconclusive_for_concept', state['episodes'][0]['status'])

    def test_checkpoint_projection_identifies_missing_observations_without_certifying_them(self):
        state, commitment = self.start()
        projected = concepts.project(state, 0, CFG)
        self.assertEqual(projected['checkpoints'][0]['due_after_round'], 2)
        self.assertEqual(projected['checkpoints'][0]['missing_reported_consequences'], ['transport','composition'])
        item = {'consequence_id':'transport','status':'observed','observation':'An unverified observation.', 'evidence':[]}
        state = concepts.report(state, observation(digest(plan()),'mechanism',[item]), 0, CFG, commitment=commitment)
        projected = concepts.project(state, 1, CFG)
        self.assertEqual(projected['checkpoints'][0]['missing_reported_consequences'], ['composition'])
        self.assertIn('not independently checked',projected['checkpoints'][0]['interpretation'])

    def test_audit_only_complexity_fields_have_no_accepted_input_channel(self):
        value = plan(); value['compression_gain'] = 999
        with self.assertRaises(Invalid): concepts.validate(value, CFG)
        state, commitment = self.start()
        observed = observation(digest(plan())); observed['complexity_score'] = 999
        with self.assertRaises(Invalid): concepts.report(state, observed, 0, CFG, commitment=commitment)
        packet = review(1); packet['complexity_score'] = 999
        packet['reference'] = digest({k:v for k,v in packet.items() if k!='reference'})
        with self.assertRaises(Invalid): concepts.finish(state, 1, packet, CFG)


class PolicyConceptIntegrationTests(unittest.TestCase):
    """Pure real-policy transitions; no files, subprocesses or proof admission."""
    def protocol(self, rounds=8):
        from machinery import study
        return {**study.DEFAULT, 'rounds': rounds, 'concept_driver': CFG}

    def payload(self, concept_plan=None):
        return {'agenda':['Investigate the prospective mechanism.'], 'summary':'A neutral conceptual plan.',
                'hypotheses':[], 'evidence':[], 'trial':None, 'work_kind':'exploration',
                'findings':[], 'use_links':[], 'policy_proposal':None,
                'completion':None, 'concept_plan':concept_plan}

    def test_concept_exploration_needs_no_duplicate_legacy_hypothesis_portfolio(self):
        from machinery import study_policy as policy
        protocol = self.protocol()
        original = policy.initial('exploration',protocol)
        staged, commitment = policy.commit(original,self.payload(plan()),Path('.'),0,protocol)
        self.assertEqual(staged['portfolio'],{})
        self.assertIsNone(commitment['trial'])
        self.assertEqual(commitment['concept_commitment']['episode_reference'],digest(plan()))
        execution = {**self.payload(), 'prospective_binding':digest(commitment), 'concept_report':None}
        policy.record(staged,execution,Path('.'),0,protocol,prospective=commitment)
        self.assertEqual(staged['concepts']['active']['missing_report_rounds'],[0])
        continued, next_commitment = policy.commit(staged,self.payload(),Path('.'),1,protocol)
        self.assertEqual(next_commitment['concept_commitment']['end_round'],2)
        self.assertEqual(continued['portfolio'],{})

    def test_invalid_or_absent_concept_cannot_bypass_existing_exploration_rules(self):
        from machinery import study_policy as policy
        protocol = self.protocol()
        original = policy.initial('exploration',protocol)
        for invalid_plan in (None,{'id':'missing-required-structure'}):
            with self.subTest(plan=invalid_plan), self.assertRaises(Invalid):
                policy.commit(original,self.payload(invalid_plan),Path('.'),0,protocol)
        self.assertIsNone(original['concepts']['active'])
        baseline = policy.initial('baseline',protocol)
        with self.assertRaises(Invalid):
            policy.commit(baseline,self.payload(plan()),Path('.'),0,protocol)

    def test_execution_cannot_substitute_a_different_concept_commitment(self):
        from machinery import study_policy as policy
        protocol = self.protocol()
        original = policy.initial('exploration',protocol)
        staged, commitment = policy.commit(original,self.payload(plan()),Path('.'),0,protocol)
        commitment['concept_commitment']['episode_reference'] = '0'*64
        execution = {**self.payload(), 'prospective_binding':digest(commitment), 'concept_report':None}
        with self.assertRaises(Invalid):
            policy.record(staged,execution,Path('.'),0,protocol,prospective=commitment)

    def test_new_branch_grant_is_bounded_to_the_actual_finite_prefix(self):
        from machinery import study_policy as policy
        protocol = self.protocol(rounds=4)
        state = policy.initial('exploration',protocol)
        # Two research rounds remain in this comparison branch. A new three-round
        # grant cannot borrow the longer parent campaign's allowance.
        with self.assertRaisesRegex(Invalid,'remaining campaign'):
            policy.commit(state,self.payload(plan(horizon=3)),Path('.'),2,protocol)
        staged, commitment = policy.commit(state,self.payload(plan(horizon=2)),Path('.'),2,protocol)
        self.assertEqual(commitment['concept_commitment']['end_round'],3)
        self.assertEqual(policy.request(staged,3,protocol)['concept_driver']['rounds_remaining'],1)

    def test_inherited_longer_horizon_remains_unresolved_in_a_shorter_branch(self):
        from machinery import study_policy as policy
        parent = self.protocol(rounds=8)
        state = policy.initial('exploration',parent)
        state, _ = policy.commit(state,self.payload(plan(horizon=4)),Path('.'),2,parent)
        branch = self.protocol(rounds=4)
        projected = policy.request(state,3,branch)
        self.assertEqual(projected['concept_driver']['active_episode']['end_round'],5)
        self.assertEqual(projected['concept_driver']['rounds_remaining'],1)
        self.assertIn('unresolved',projected['concept_driver']['active_episode']['status'])
        # Continuation preserves the original identity instead of pretending
        # that the finite prefix completes or truncates the inherited episode.
        _, commitment = policy.commit(state,self.payload(),Path('.'),3,branch)
        self.assertEqual(commitment['concept_commitment']['end_round'],5)


if __name__ == '__main__':
    unittest.main()
