"""Neutral real-Lean context, budget, observer and continuation regressions.

Deterministic role fixtures are protocol evidence, never research evidence.
Temporary workspaces are retained under .scratch for independent replay.
"""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from machinery import study, study_policy, study_burden, study_observer
from machinery.study_common import ROOT, Invalid, digest, read, write, lock, load_state, snapshot
from machinery.study_transfer import bind_task, check_task
from machinery.study_knowledge import ingest
from tests import test_revision_static_checkpoint as previous
neutral_contract = previous.neutral_contract


class ContextRevision(unittest.TestCase):
    task = previous.RealLeanMechanisms.task
    solution = previous.RealLeanMechanisms.solution

    def setUp(self):
        self.base = Path(tempfile.mkdtemp(dir=ROOT/'.scratch', prefix='context-validation-'))
        self.study = self.base/'study'
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(self.study, contract=neutral_contract())
        self.ws = self.study/'arms/exploration/workspace'
        print('RETAINED', self.base, flush=True)

    def test_canonical_root_and_foundation_cannot_be_substituted(self):
        (self.ws/'MathGKM/Fake.lean').write_text('import Lean\nnamespace MathGKM.HarnessFixture\ndef Root : Prop := True\nend MathGKM.HarnessFixture\n')
        with lock(self.study/'controller.lock') as fd:
            arm = study.Arm(self.study, 'exploration', fd)
            state = study_policy.initial('exploration')
            ingest(arm, state, {'reductions': [{'id': 'fake-root', 'module': 'MathGKM.Fake',
                'residuals': [{'id': 'r', 'statement': 'True'}], 'term': 'fun _ => True.intro'}]}, self.ws, self.base/'root-check')
            self.assertNotIn('fake-root', state['knowledge'])
        (self.ws/'MathGKM/FakeFoundation.lean').write_text('import Lean\nnamespace MathGKM.ResearchSemantics\ndef ConservativeExtension (B E : Type) := True\nend MathGKM.ResearchSemantics\n')
        task = self.task(statement='True', context_modules=['MathGKM.ResearchSemantics'])
        bad = check_task(self.ws, task, self.solution(module='MathGKM.FakeFoundation', term='True.intro'), self.base/'foundation', 120)
        self.assertFalse(bad['checked'], bad)

    def test_residual_same_text_different_context_and_positive_discharge(self):
        (self.ws/'MathGKM/Original.lean').write_text('import Lean\ndef Goal : Prop := False\nnamespace Neutral\ndef P : Prop := False\ndef Q : Prop := True\nend Neutral\n')
        (self.ws/'MathGKM/Counterfeit.lean').write_text('import Lean\nnamespace Neutral\ndef P : Prop := True\nend Neutral\n')
        with lock(self.study/'controller.lock') as fd:
            arm = study.Arm(self.study, 'exploration', fd)
            state = study_policy.initial('exploration')
            ingest(arm, state, {'reductions': [{'id': 'reduction', 'module': 'MathGKM.Original',
                'residuals': [{'id': 'p', 'statement': 'Neutral.P'}, {'id': 'q', 'statement': 'Neutral.Q'}, {'id': 'shadow', 'statement': 'Goal'}],
                'term': 'fun _ n => rfl'}]}, self.ws, self.base/'reduction')
            self.assertIn('reduction', state['knowledge'], state)
            ingest(arm, state, {'mathematical_claims': [{'id': 'fake', 'module': 'MathGKM.Counterfeit',
                'statement': 'Neutral.P', 'term': 'True.intro', 'discharges': ['p']}]}, self.ws, self.base/'fake')
            self.assertEqual(state['remaining_obligations']['p']['status'], 'open')
            ingest(arm, state, {'mathematical_claims': [{'id': 'good', 'module': 'MathGKM.Original',
                'statement': 'Neutral.Q', 'term': 'True.intro', 'discharges': ['q']}]}, self.ws, self.base/'good')
            self.assertEqual(state['remaining_obligations']['q']['status'], 'checked', state)
            ingest(arm, state, {'mathematical_claims': [{'id': 'false-shadow', 'module': 'MathGKM.Original',
                'statement': 'True', 'term': 'True.intro', 'discharges': ['shadow']}]}, self.ws, self.base/'shadow')
            self.assertEqual(state['remaining_obligations']['shadow']['status'], 'open')

    def test_task_absent_before_cannot_acquire_adapter_meaning(self):
        task = bind_task(self.ws, self.task(statement='FreshGoal'))
        none = check_task(self.ws, task, {'status': 'bounded_non_solution', 'reason': 'no proof'}, self.base/'none', 120)
        self.assertFalse(none.get('valid_attempt', False), none)
        (self.ws/'MathGKM/Easy.lean').write_text('import Lean\ndef FreshGoal : Prop := True\n')
        bad = check_task(self.ws, task, self.solution(module='MathGKM.Easy', term='True.intro'), self.base/'easy', 120)
        self.assertFalse(bad.get('valid_attempt', False), bad)
        good = check_task(self.ws, self.task(), self.solution(), self.base/'valid', 120)
        self.assertTrue(good['checked'], good)

    def test_continuation_foundation_compilation_replay_and_trace_theorem(self):
        task = self.task(context_modules=['MathGKM.ContinuationObligations'],
            statement='∀ (sem : MathGKM.ContinuationObligations.WholeSemantics) (s : MathGKM.ContinuationObligations.State) (env : Nat → MathGKM.ContinuationObligations.Input) (n : Nat), sem.trace s env n = MathGKM.ContinuationObligations.run n s env')
        result = check_task(self.ws, task, self.solution(module='MathGKM.ContinuationObligations',
            term='MathGKM.ContinuationObligations.continuation_eq_run'), self.base/'continuation', 120)
        self.assertTrue(result['checked'], result)

    def test_only_actual_open_obligations_select_open_branch(self):
        from machinery import study_program
        program = {'schema': study_program.REFERENCE['schema'], 'code': [{'op': 'if_open_obligations',
            'then': [{'op': 'reverse_agenda'}], 'else': []}]}
        for ledger, expected in [({}, ['a','b']), ({'x': {'status': 'checked'}}, ['a','b']),
            ({'x': {'status': 'open'}}, ['b','a']),
            ({'x': {'status': 'checked'}, 'y': {'status': 'open'}}, ['b','a'])]:
            request = {'agenda': ['a','b'], 'remaining_obligations': ledger}
            self.assertEqual(study_program.execute(program, request)['agenda'], expected)

    def test_finished_completion_reused_without_new_allowance(self):
        from machinery import completion, study_completion
        (self.ws/'research/correspondence.md').write_text('Neutral identity; no independent correspondence approval claimed.')
        claim = {'kind': 'proof', 'module': 'MathGKM.HarnessFixture', 'declaration': 'MathGKM.HarnessFixture.identity',
                 'correspondence': 'research/correspondence.md'}
        with lock(self.study/'controller.lock') as fd:
            arm = study.Arm(self.study, 'exploration', fd)
            key = digest({'claim': claim, 'audit': None, 'round': 0})
            with patch('machinery.completion.ROOT', self.ws):
                result = completion.verify(neutral_contract(), claim, arm.root/'completion'/key)
            self.assertTrue(result.get('lean_exact_root_checked'), result)
            self.assertFalse(result['resolved'])
            arm.p['transport'] = 'live'  # recovery path only, no role or compiler invocation
            arm.s['seconds'] = arm.p['arm_seconds']
            with patch('machinery.completion.run', side_effect=AssertionError('finished validation must not repeat')):
                reused = study_completion.check(arm, claim)
            self.assertEqual(reused, result)

    def test_distinct_real_validations_charged_once_each_and_protected_sides(self):
        item = {'id': 'same', 'module': 'MathGKM.HarnessFixture', 'statement': '∀ n : Nat, n = n', 'term': 'fun _ => rfl'}
        with lock(self.study/'controller.lock') as fd:
            arm = study.Arm(self.study, 'exploration', fd)
            arm.fund('left', 120)
            arm.fund('right', 120)
            a, b = study_policy.initial('exploration'), study_policy.initial('exploration')
            with arm.budget('left'):
                ingest(arm, a, {'mathematical_claims': [item]}, self.ws, self.base/'left')
                self.assertIn('same', a['knowledge'], a)
                with self.assertRaises(Invalid):
                    arm.reserve('excess-left-validation', 120)
            with arm.budget('right'):
                self.assertEqual(arm.available(), 120)
                ingest(arm, b, {'mathematical_claims': [item]}, self.ws, self.base/'right')
                self.assertIn('same', b['knowledge'], b)
                ingest(arm, b, {'mathematical_claims': [item]}, self.ws, self.base/'right')
            checks = [k for k in arm.s['reservations'] if k.startswith('knowledge-')]
            self.assertEqual(len(checks), 2)
            self.assertEqual(arm.s['seconds'], 240)
            self.assertEqual([v['spent'] for v in arm.s['budget_pools'].values()], [120,120])

    def test_audit_corruption_does_not_change_actual_fixture_requests(self):
        # Two real role subprocess continuations, including real Lean ingestion.
        requests = []
        for side in ('clean', 'changed-audit'):
            directory = self.base/side
            with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
                study.freeze(directory, {'rounds': 2, 'fixture_connected': True}, contract=neutral_contract())
                if side == 'changed-audit':
                    write(directory/'audit/inputs/exploration/initial.json', {'corrupted': 1e99})
                    write(directory/'audit/plan.json', {'forged_score': -1e99})
                    write(directory/'audit/inputs/exploration/round-0000.json', {'wrong_context': True})
                with lock(directory/'controller.lock') as fd:
                    arm = study.Arm(directory, 'exploration', fd)
                    arm.run()
                state = load_state(directory/'arms/exploration/state.json')
                self.assertEqual(state['round'], 2, state)
                self.assertEqual(state['research']['remaining_obligations']['fixture-residual']['status'], 'checked')
                req = read(directory/'arms/exploration/jobs/round-0001/request.json')
                # Independent actual runs have distinct elapsed-time receipts and
                # therefore distinct provenance input_hash values. Compare actual
                # decisions, executed code and exact mathematical targets, keeping
                # both raw requests for audit rather than equating wall times.
                projection = {k: req[k] for k in ('agenda', 'policy', 'remaining_obligations')}
                projection['program_execution'] = {k: req['program_execution'][k] for k in ('program_hash', 'executed')}
                requests.append(projection)
                if side == 'clean':
                    study_burden.report(directory, directory/'audit/report')
                    pairs = read(directory/'audit/report/conditional-paired.json')
                    measured = [p for p in pairs if p['arm'] == 'exploration']
                    self.assertTrue(all(p['enlargement'] for p in measured), measured)
                    self.assertEqual(measured[0]['reference_binding'], measured[1]['reference_binding'])
        self.assertEqual(requests[0], requests[1])


if __name__ == '__main__':
    unittest.main()
