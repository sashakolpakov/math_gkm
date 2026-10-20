"""Neutral concept-controller integration; no models or Markov research.

One test runs deterministic role subprocesses and the existing Lean protocol
transition. Mathematical comparison outcomes are explicitly simulated there;
no theorem admission or mathematical transfer is established by these tests.
Other tests exercise the actual controller API with in-process role doubles.
"""
import copy
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from machinery import study, study_policy as policy
from machinery import study_research_feedback as feedback
from machinery.study_common import ROOT, Invalid, digest, load_state, lock, read, write
from tests.test_revision_static_checkpoint import neutral_contract

CANARY = 'PRIVATE_SYNTHETIC_EVALUATOR_CONTENT'


def comparison(*, valid=True):
    return {'status': 'valid_finite_budget_comparison' if valid else 'invalid_frozen_context',
            'eligible': valid, 'all_frozen_declarations_retained': True,
            'task_gains': [CANARY], 'transfer': [CANARY], 'regressions': [],
            'binding': {'suite': CANARY, 'adaptation_seconds_each': 30,
                        'validation_seconds_each_task': 600},
            'catalog_failure': {'private_path': CANARY},
            'measured_costs': {'before': {'adapter_seconds': 3, 'validation_seconds': 2,
                'context_validation_seconds': 1, 'private_task': CANARY},
                'after': {'adapter_seconds': 4, 'validation_seconds': 2,
                          'context_validation_seconds': 1}},
            'sides': {'private_answer': CANARY}}


def ordinary():
    return {'agenda': ['Inspect the unchanged neutral goal.'], 'summary': 'Own neutral observation.',
            'hypotheses': [], 'evidence': [], 'trial': None, 'use_links': [],
            'policy_proposal': None, 'completion': None}


def review_packet(round_index=2, *, valid=True):
    receipt = {'outcome': 'completed', 'elapsed_seconds': 2,
               'payload': {'findings': [], 'scope': 'The own neutral bridge remains conditional.'}}
    return feedback.build_review_feedback(round_index, receipt, True,
        reviewer_scope=feedback.OWN_REVIEW_SCOPE, episode_transfer=comparison(valid=valid),
        comparison_context={'kind': 'ordinary_episode', 'concept_reference': None,
                            'start_round': 0, 'end_round': round_index, 'complete': True},
        development_role_seconds=7)


class ConceptControllerIntegration(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='concept-loop-integration-', dir=ROOT/'.scratch')
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name)
        dependency = patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'})
        dependency.start(); self.addCleanup(dependency.stop)

    def test_protocol_monitor_and_temporary_writes_use_only_own_invocation(self):
        from machinery import protocol
        directory = self.base/'protocol-own'; directory.mkdir()
        seen = []
        def observed(argv, **kwargs):
            seen.append((argv, kwargs))
            return {'returncode': 0, 'termination': None, 'stdout': '{"neutral":true}', 'stderr': ''}
        with patch('machinery.protocol.tempfile.mkdtemp', return_value=str(directory)), \
                patch('machinery.protocol.run', side_effect=observed):
            self.assertEqual(protocol.transition({'neutral': True}, 'record'), {'neutral': True})
        options = seen[0][1]
        self.assertEqual(Path(options['cwd']), directory)
        self.assertEqual(Path(options['scope']), directory)
        self.assertEqual(Path(options['env']['TMPDIR']), directory)
        self.assertEqual(read(directory/'invocation.json'), {'state': {'neutral': True}, 'command': 'record'})

    def test_actual_fixture_loop_feedback_and_protected_horizon(self):
        directory = self.base/'study'
        study.freeze(directory, {'rounds': 4, 'episode_rounds': 2,
            'meta_calls': 24, 'max_calls': 48, 'arm_seconds': 50000,
            'concept_driver': {'enabled': True, 'max_ordinary_rounds': 1,
                'min_horizon_rounds': 2, 'max_horizon_rounds': 3}},
            contract=neutral_contract())
        paired = []
        def simulated_pair(arm, before, after, key, **kwargs):
            paired.append((key, Path(before).name, Path(after).name))
            # Synthetic non-main receipts test the actual main-source projection,
            # not just the standalone feedback helper. They are never executed.
            if key == 'episode-2':
                for name, role in [('eval-synthetic-private', 'adapter'),
                        ('policy-synthetic-incumbent-0', 'researcher'),
                        ('review-synthetic-old', 'reviewer')]:
                    job = arm.root/'jobs'/name
                    write(job/'receipt.json', {'request_id': name, 'role': role,
                        'outcome': 'completed', 'payload': {'summary': CANARY},
                        'elapsed_seconds': 9999})
                    arm.s['receipts'].append(str(job))
            return comparison()
        with patch('machinery.study_transfer.evaluate_pair', side_effect=simulated_pair):
            with lock(directory/'controller.lock') as fd:
                arm = study.Arm(directory, 'exploration', fd)
                arm.run()
                state = load_state(arm.root/'state.json')
                self.assertEqual(state['round'], 4, state.get('reason'))
                self.assertIn('finite_budget_finished', state['status'], state.get('reason'))
                calls = state['calls']; feedback_count = len(state['research']['review_feedback'])
                # Already completed reviews are not repeated, even after a reload.
                resumed = study.Arm(directory, 'exploration', fd)
                resumed.review()
                self.assertEqual(resumed.s['calls'], calls)
                self.assertEqual(len(resumed.s['research']['review_feedback']), feedback_count)
        root = directory/'arms/exploration'
        research = state['research']
        self.assertEqual(research['knowledge'], {})
        self.assertEqual(research['components'], {})
        self.assertIsNone(state['resolution'])
        self.assertEqual(state['failures'], 0)
        # Round zero may exploit; the next proposer must start a concept.
        first = read(root/'jobs/plan-0000/request.json')
        forced = read(root/'jobs/plan-0001/request.json')
        self.assertEqual(first['concept_driver']['required_action'], 'choose_concept_or_exploitation')
        self.assertEqual(forced['concept_driver']['required_action'], 'start_concept_episode')
        active = read(root/'jobs/round-0001/request.json')['concept_driver']['active_episode']
        protected = read(root/'jobs/plan-0002/request.json')['concept_driver']['active_episode']
        self.assertEqual(active['reference'], protected['reference'])
        self.assertEqual(active['end_round'], 2)
        self.assertTrue(any(p[0] == 'episode-3' and p[1:] == ('round-0000', 'round-0002')
                            for p in paired), paired)
        # A real review packet reaches both the next planning and execution call.
        for role, key in [('proposer', 'plan-0002'), ('researcher', 'round-0002')]:
            req = read(root/'jobs'/key/'request.json')
            latest = req['research_feedback']['latest']
            self.assertEqual(latest['round'], 2)
            self.assertEqual(latest['source_review']['status'], 'artifact_bound_source_assessment')
            self.assertNotIn(CANARY, json.dumps(req))
            delivered = [d for d in research['review_feedback_deliveries'] if d['request_id'] == key]
            self.assertEqual(len(delivered), 1)
            self.assertEqual(delivered[0]['role'], role)
            self.assertIn(latest['reference'], delivered[0]['references'])
        for r in (2, 3, 4):
            source = read(root/f'roles/review-source-v1-{r}/inbox/records.json')
            self.assertEqual(source['review_scope'], feedback.OWN_REVIEW_SCOPE)
            self.assertNotIn(CANARY, json.dumps(source))
            self.assertTrue(all(item['role'] in ('proposer', 'researcher')
                                for item in source['receipts']))
            selection = read(root/f'roles/select-{r}/inbox/records.json')
            self.assertNotIn(CANARY, json.dumps(selection))
        finished = next(p for p in research['review_feedback'] if p['round'] == 3)
        self.assertEqual(finished['comparison_context'], {'kind': 'concept_episode_package',
            'concept_reference': active['reference'], 'start_round': 1, 'end_round': 3, 'complete': True})
        self.assertEqual(finished['episode_transfer']['gains'], 1)
        self.assertEqual(finished['episode_transfer']['measured_costs']['before']['adapter_seconds'], 3)
        self.assertEqual(finished['episode_transfer']['budget_caps_seconds']['adaptation_seconds_each'], 30)
        expected_development = sum(read(root/'jobs'/name/'receipt.json')['elapsed_seconds']
            for name in ('plan-0001', 'round-0001', 'plan-0002', 'round-0002'))
        self.assertAlmostEqual(finished['development_costs']['role_seconds'], expected_development)
        self.assertFalse(finished['mathematical_admission_changed'])
        self.assertFalse(finished['hypothesis_statuses_changed'])
        concept_review = next(p for p in research['concepts']['review_feedback'] if p['round'] == 3)
        self.assertIn('package', concept_review['evidence_status'])
        self.assertIn('no mathematical refutation, root proof or certified strategy switch', concept_review['certification'])

    def test_actual_plan_repair_records_real_delivery_identity(self):
        state = policy.initial('exploration')
        feedback.append_review_feedback(state, review_packet())
        seen = []
        arm = SimpleNamespace(root=self.base, p=study.DEFAULT)
        def call(key, role, req, workspace=None, readonly=False):
            cached = self.base/'jobs'/key/'receipt.json'
            if cached.exists():
                return read(cached)
            seen.append((key, role, copy.deepcopy(req)))
            payload = {'agenda': 'bad'} if key == 'plan-0003' else ordinary()
            result = {'role': role, 'outcome': 'completed', 'payload': payload,
                      'elapsed_seconds': 0, 'request_id': key}
            write(self.base/'jobs'/key/'final.json', {'payload_json': payload})
            write(self.base/'jobs'/key/'receipt.json', result)
            return result
        arm.call = call
        req = policy.request(state, 3, study.DEFAULT, 'proposer')
        staged, commitment = study.Arm.plan_with_repair(arm, 'plan-0003', req, state,
                                                       self.base, 3, study.DEFAULT)
        self.assertEqual([p[0] for p in seen], ['plan-0003', 'plan-0003-repair-1'])
        delivery = staged['review_feedback_deliveries'][-1]
        self.assertEqual(delivery['request_id'], 'plan-0003-repair-1')
        self.assertEqual(delivery['references'], [state['review_feedback'][-1]['reference']])
        # Recovery consumes the exact validated plan without another role call.
        recovered, again = study.Arm.plan_with_repair(arm, 'plan-0003', req, state,
                                                     self.base, 3, study.DEFAULT)
        self.assertEqual(recovered, staged)
        self.assertEqual(again, commitment)
        self.assertEqual(len(recovered['review_feedback_deliveries']), 1)
        self.assertEqual(len(seen), 2)

    def test_concept_exploration_does_not_need_duplicate_legacy_trial(self):
        from tests.test_study_concepts import plan as neutral_concept_plan
        protocol = {**study.DEFAULT, 'rounds': 6,
                    'concept_driver': {'enabled': True, 'max_ordinary_rounds': 1}}
        for work_kind in ('exploration', 'strategy'):
            state = policy.initial('exploration', protocol)
            proposed = {**ordinary(), 'work_kind': work_kind,
                        'concept_plan': neutral_concept_plan(horizon=2)}
            staged, commitment = policy.commit(state, proposed, self.base, 0, protocol)
            self.assertIsNone(commitment['trial'])
            self.assertEqual(commitment['concept_commitment']['mode'], 'protected_concept')
            execution = {**ordinary(), 'work_kind': work_kind, 'concept_report': None,
                         'prospective_binding': digest(commitment)}
            policy.record(staged, execution, self.base, 0, protocol, prospective=commitment)
            self.assertEqual(staged['concepts']['last_report_round'], 0)
            self.assertEqual(staged['concepts']['active']['missing_report_rounds'], [0])
            self.assertEqual(staged['knowledge'], {})
            # Merely claiming exploratory work never bypasses prospective form.
            absent = {**ordinary(), 'work_kind': work_kind}
            with self.assertRaises(Invalid):
                policy.commit(policy.initial('exploration', protocol), absent, self.base, 0, protocol)
            malformed = {**proposed, 'concept_plan': {'id': 'pretend-concept'}}
            with self.assertRaises(Invalid):
                policy.commit(policy.initial('exploration', protocol), malformed, self.base, 0, protocol)

    def test_invalid_comparison_is_delivered_as_unknown_and_proof_gate_unchanged(self):
        state = policy.initial('exploration')
        value = review_packet(valid=False)
        feedback.append_review_feedback(state, value)
        state['audit_only'] = {'compression_gain': CANARY}
        for role in ('proposer', 'researcher'):
            req = policy.request(state, 3, study.DEFAULT, role)
            current = req['research_feedback']['latest']
            self.assertEqual(current['episode_transfer']['assessment'], 'inconclusive')
            self.assertIsNone(current['episode_transfer']['gains'])
            self.assertEqual(current['episode_transfer']['measured_costs']['after']['adapter_seconds'], 4)
            self.assertNotIn(CANARY, json.dumps(req))
            self.assertEqual(req['knowledge'], {})
            self.assertFalse(current['mathematical_admission_changed'])
            self.assertFalse(current['hypothesis_statuses_changed'])
        self.assertEqual(state['portfolio'], {})


if __name__ == '__main__':
    unittest.main()
