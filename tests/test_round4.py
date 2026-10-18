"""Neutral connected-loop corrections. Synthetic audit data never certifies math."""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from machinery import study, study_burden, study_observer, study_policy, study_completion
from machinery.study_common import ROOT, Invalid, read, write, sha, digest, lock, snapshot, load_state
from tests import test_revision_static_checkpoint as previous
neutral_contract = previous.neutral_contract


class Round4(unittest.TestCase):
    def setUp(self):
        self.base = Path(tempfile.mkdtemp(dir=ROOT/'.scratch', prefix='round4-neutral-'))
        self.directory = self.base/'study'
        print('RETAINED', self.base, flush=True)

    def freeze(self, config=None, suite=None):
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(self.directory, config, suite, neutral_contract())

    def test_profiles_and_impossible_commitments_fail_before_role(self):
        for name in ('v2-fixture.json', 'v2-canary.json'):
            study.validate_protocol({**study.DEFAULT, **read(ROOT/'studies'/name)})
        # Configuration inspection only for canary. No live freeze/authorization.
        for bad in ({'arm_seconds': 1700}, {'max_calls': 5}, {'meta_calls': 3}):
            with self.assertRaises(Invalid), patch.object(study.Arm, 'call', side_effect=AssertionError('role executed')):
                self.freeze({**read(ROOT/'studies/v2-fixture.json'), **bad})
            self.assertFalse(self.directory.exists())
        task = previous.RealLeanMechanisms.task(self, id='neutral-panel')
        suite = {'schema': 'math-gkm.suite.v2', 'selector': 'fixture', 'selection_basis': 'neutral fixed panel', 'independent': True, 'tasks': [task]}
        with self.assertRaises(Invalid):
            self.freeze({'arm_seconds': 1900}, suite)
        self.assertFalse(self.directory.exists())

    def test_complete_episode_pools_protect_seconds_and_calls(self):
        with self.assertRaises(Invalid), patch.object(study.Arm, 'call', side_effect=AssertionError('role executed')):
            self.freeze({'rounds': 2, 'max_calls': 6, 'meta_calls': 4})
        self.assertFalse(self.directory.exists())
        self.freeze({'rounds': 2, 'max_calls': 8, 'meta_calls': 6})
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            with patch.object(arm, '_research_round') as execute:
                arm.research_round()
                execute.assert_called_once()
            pools = arm.s['budget_pools']
            self.assertEqual(pools['review-2']['calls'], 2)
            self.assertEqual(pools['review-2']['meta_calls'], 2)
            self.assertEqual(arm.available_calls(), 0)
            self.assertFalse(arm.permitted('reviewer', 1))
            with arm.budget('review-2'):
                self.assertTrue(arm.permitted('reviewer', 1))
            with arm.budget('episode-research-0'):
                with self.assertRaises(Invalid):
                    arm.reserve('steal-review', arm.available()+1)
            before = copy.deepcopy(pools)
            with patch.object(arm, '_research_round'):
                arm.research_round()
            self.assertEqual(before, arm.s['budget_pools'])

    def test_requests_disclose_exact_aggregate_and_validation_limits(self):
        from machinery.study_knowledge import SCHEMAS, ingest
        self.freeze()
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            req = study_policy.request(arm.s['research'], 0, arm.p)
            for name in SCHEMAS:
                self.assertIn(name, req['limits']['knowledge_counting'])
            self.assertEqual(req['limits']['knowledge_checks_per_round'], arm.p['knowledge_checks_per_round'])
            self.assertEqual(req['limits']['validation_seconds'], arm.p['validation_seconds'])
            with patch('machinery.study_knowledge.check_task', side_effect=AssertionError('over-limit validation')):
                before=copy.deepcopy(arm.s)
                ingest(arm, arm.s['research'], {'mathematical_claims': [{}]*7}, arm.workspace, self.base/'invalid')
            state=arm.s['research']
            failures=state['submission_failures']
            self.assertEqual(len(failures),7)
            self.assertTrue(all(f['status']=='submission_rejected_or_operationally_incomplete' for f in failures[:6]))
            self.assertTrue(all(f['reason']=='invalid knowledge identity' for f in failures[:6]))
            self.assertEqual(failures[6]['status'],'per_round_cap_exhausted; not checked')
            self.assertEqual(len(list((self.base/'invalid').rglob('rejection-*.json'))),7)
            for name in ('knowledge','components','remaining_obligations'):
                self.assertEqual(state[name],before['research'][name])
            for name in ('seconds','calls','meta_calls','reservations','budget_pools'):
                self.assertEqual(arm.s.get(name),before.get(name))

    def test_seven_valid_proposals_route_only_six_failed_checks(self):
        from machinery.study_knowledge import ingest
        self.freeze()
        with lock(self.directory/'controller.lock') as fd:
            arm=study.Arm(self.directory,'exploration',fd)
            state=arm.s['research']; before=copy.deepcopy(state)
            proposals=[dict(id='boundary-'+str(i),module='MathGKM.HarnessFixture',
                            statement='True',term='True.intro') for i in range(7)]
            seconds=arm.s['seconds']; reservations=set(arm.s.get('reservations',{}))
            with patch('machinery.study_knowledge.check_task',return_value={'checked':False,'status':'simulated_checked_false'}) as checker:
                ingest(arm,state,{'mathematical_claims':proposals},arm.workspace,self.base/'boundary')
            self.assertEqual(checker.call_count,6)
            self.assertEqual(len(set(arm.s['reservations'])-reservations),6)
            self.assertEqual(arm.s['seconds']-seconds,6*arm.p['validation_seconds'])
            self.assertEqual(len(list((self.base/'boundary').rglob('*.reservation.json'))),6)
            self.assertEqual(len(state['observations'])-len(before['observations']),6)
            self.assertEqual(state['submission_failures'][-1]['index'],6)
            self.assertEqual(state['submission_failures'][-1]['status'],'per_round_cap_exhausted; not checked')
            for name in ('knowledge','components','remaining_obligations'):
                self.assertEqual(state[name],before[name])

    def test_reference_mutations_invalidate_direct_and_report_audits(self):
        self.freeze()
        for name in ('seed/contract.json', 'seed/seed-files.json', 'seed/MathGKM/HarnessFixture.lean', 'evaluation/suite.json'):
            p = self.directory/name
            old = p.read_bytes()
            p.write_bytes(old+b' ')
            # JSON whitespace changes are semantically ignored only for the
            # suite, whose seal intentionally binds its canonical object.
            if name == 'evaluation/suite.json':
                suite = read(p); suite['selection_basis'] = 'changed panel provenance'; write(p, suite)
            with self.assertRaises(Invalid):
                study_burden.conditional_pair(self.directory, 'exploration', 'initial', 'initial')
            with self.assertRaises(Invalid):
                study_burden.report(self.directory, self.base/'invalid-report')
            p.write_bytes(old)
        study_burden.report(self.directory, self.base/'valid-report')

    def test_terminal_schedule_receipt_binding_and_interrupted_export(self):
        self.freeze()
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            result = self.synthetic_resolution(arm)
            receipt = arm.root/'completion/synthetic/result.json'
            write(receipt, result)
            arm.s.update(resolution=result, resolution_receipt=str(receipt.relative_to(self.directory)))
            arm.save()
            original = study_observer.write
            def interrupt(path, value):
                if '/audit/inputs/' in str(path):
                    raise OSError('injected export interruption')
                original(path, value)
            with patch('machinery.study_observer.write', side_effect=interrupt), self.assertRaises(OSError):
                study_completion.terminal(arm)
            study_completion.terminal(arm)
            feed = read(arm.root/'observer-outbox/terminal.json')
            self.assertEqual(feed['resolution']['receipt_sha256'], sha(receipt))
            study_burden.report(self.directory, self.base/'terminal-report')
            rows = read(self.base/'terminal-report/raw.json')
            terminal = [r for r in rows if r['key'] == 'terminal']
            self.assertEqual(len(terminal), 2)
            self.assertEqual(terminal[0]['status'], 'missing_scheduled_checkpoint')
            self.assertEqual(terminal[1]['resolution']['bundle_hash'], result['bundle_hash'])
            write(receipt, {**result, 'bundle_hash': 'changed'})
            with self.assertRaises(Invalid):
                study_burden.report(self.directory, self.base/'changed-terminal')
            write(receipt, result)
            changed = read(arm.root/'observer-outbox/terminal.json'); changed['resolution']['bundle_hash'] = 'forged'
            write(arm.root/'observer-outbox/terminal.json', changed)
            with self.assertRaises(Invalid):
                study_completion.terminal(arm)

    def synthetic_resolution(self, arm):
        correspondence = 'research/terminal-fixture.md'
        (arm.workspace/correspondence).write_text('SYNTHETIC receipt fixture; never a mathematical approval.')
        binding = {'contract_hash': digest(read(arm.workspace/'contract.json')),
            'claim': {'correspondence': correspondence},
            'sources': {'MathGKM.HarnessFixture': sha(arm.workspace/'MathGKM/HarnessFixture.lean')},
            'correspondence_sha256': sha(arm.workspace/correspondence)}
        return {'resolved': True, 'finished': 1, 'bundle_hash': digest(binding), 'binding': binding,
                'scope': 'synthetic serialization fixture; not a gate result'}

    def test_terminal_rejects_source_change_after_finished_receipt(self):
        self.freeze()
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            result = self.synthetic_resolution(arm)
            receipt = arm.root/'completion/synthetic/result.json'
            write(receipt, result)
            arm.s.update(resolution=result, resolution_receipt=str(receipt.relative_to(self.directory)))
            (arm.workspace/'research/terminal-fixture.md').write_text('changed after receipt')
            with self.assertRaisesRegex(Invalid, 'snapshot differs'):
                study_completion.terminal(arm)
            self.assertFalse((arm.root/'observer-outbox/terminal.json').exists())

    def test_exact_episode_allowance_reaches_real_evaluation_and_review(self):
        config = {**read(ROOT/'studies/v2-fixture.json'), 'rounds': 2, 'policy_trials': 0,
                  'fixture_policy_trial': False, 'max_calls': 8, 'meta_calls': 4}
        p = {**study.DEFAULT, **config}
        config['arm_seconds'] = sum(v[0] for v in study.episode_envelope(p, 2, 1).values())
        task = previous.RealLeanMechanisms.task(self, fixture_module='MathGKM.HarnessFixture',
            fixture_term='fun n => rfl', fixture_interface_term='True.intro', fixture_transport_term='True.intro')
        suite = {'schema': 'math-gkm.suite.v2', 'selector': 'neutral fixture',
            'selection_basis': 'same fixed identity', 'independent': True, 'tasks': [task]}
        self.freeze(config, suite)
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            with lock(self.directory/'controller.lock') as fd:
                arm = study.Arm(self.directory, 'exploration', fd)
                arm.run()
        self.assertEqual(arm.s['reviewed_rounds'], [2], arm.s)
        self.assertEqual((arm.s['calls'], arm.s['meta_calls']), (8,4))
        self.assertEqual(arm.s['seconds'], config['arm_seconds'])
        pair = read(arm.root/'evaluations/episode-2/result.json')
        self.assertEqual(pair['status'], 'valid_finite_budget_comparison')
        self.assertTrue(all(c['checked'] for side in pair['sides'].values() for c in side['checks']))
        self.assertEqual(read(arm.root/'jobs/select-2/receipt.json')['outcome'], 'completed')
        self.assertEqual(arm.s['final_evaluation']['status'], 'not_demonstrated_within_budget')

    def test_unused_route_does_not_inflate_fixed_witness_description(self):
        self.freeze()
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            # Synthetic observer metadata tests encoding, never admission.
            def route(identifier):
                return {'id': identifier, 'kind': 'reductions', 'task': {}, 'proposal': {},
                    'exports': ['Neutral.'+identifier], 'receipt_hash': 'synthetic-'+identifier,
                    'dependencies': [], 'source_files': {}}
            arm.s['research']['knowledge']['route-a'] = route('route-a')
            arm.s['research']['remaining_obligations']['hole'] = {'source': 'route-a', 'status': 'open', 'target_constant': 'Unknown', 'context_binding': 'synthetic'}
            for index in range(2):
                key = f'round-{index:04d}'
                if index:
                    arm.s['research']['knowledge']['unused-route-b'] = route('unused-route-b')
                target = arm.root/'snapshots'/key
                snapshot(arm.workspace, target, arm.s['research']['policy'], arm.admitted(arm.s['research']))
                study_observer.checkpoint(self.directory, arm.mode, key, arm.s, target)
            pair = study_burden.conditional_pair(self.directory, arm.mode, 'round-0000', 'round-0001')
            a,b = (pair['theories'][k] for k in ('round-0000','round-0001'))
            self.assertGreater(b['conditional_portfolio_description_bytes'], a['conditional_portfolio_description_bytes'])
            self.assertEqual(a['per_witness']['route-a'], b['per_witness']['route-a'])
            self.assertEqual(b['per_witness']['route-a']['unknown_proof_holes'], ['hole'])
            self.assertEqual(pair['per_witness_pairs'][0]['description_change_bytes'], 0)
            study_burden.report(self.directory, self.base/'route-report')
            for name in ('conditional-descriptions.svg','overhead.svg','costs.svg'):
                self.assertIn('<circle', (self.base/'route-report'/name).read_text())

    def test_shipped_neutral_profile_completes_with_actual_roles(self):
        self.freeze(read(ROOT/'studies/v2-fixture.json'))
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            with lock(self.directory/'controller.lock') as fd:
                arm = study.Arm(self.directory, 'exploration', fd)
                arm.run()
        self.assertEqual(arm.s['round'], 4, arm.s)
        self.assertEqual(arm.s['reviewed_rounds'], [2,4])
        self.assertTrue(all(read(p+'/receipt.json')['outcome'] == 'completed' for p in arm.s['receipts']))
        self.assertTrue(all(p.get('calls_spent',0) <= p.get('calls',0) for p in arm.s['budget_pools'].values()))
        study_burden.report(self.directory, self.base/'profile-report')


if __name__ == '__main__':
    unittest.main()
