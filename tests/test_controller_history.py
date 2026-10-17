"""Isolated completion-history unit fixtures; no LLM or Lean process is run.

The toy root and simulated successful compiler/replay responses exercise Python
selection, binding and audit checks only. They establish no mathematical result.
"""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import completion
from machinery.controller import Controller, ROOT, read
from machinery.engine import atomic
from machinery.gate import digest
from machinery.trust import sha


class CompletionHistoryFixtures(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix='completion-history-', dir=ROOT/'.scratch')
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        source = self.root/'MathGKM/Markov.lean'
        source.parent.mkdir()
        source.write_text('def ToyRoot : Prop := True\ntheorem toy_proof : ToyRoot := True.intro\n')
        (self.root/'correspondence.md').write_text('Isolated toy correspondence fixture.\n')
        self.contract = {
            'root_file': 'MathGKM/Markov.lean', 'root_sha256': sha(source),
            'root_declaration': 'ToyRoot',
            'correspondence_obligations': read(ROOT/'contracts/markov-goal.json')['correspondence_obligations'],
        }
        self.claim = {'kind': 'proof', 'module': 'MathGKM.Markov',
                      'declaration': 'toy_proof', 'correspondence': 'correspondence.md'}
        self.directory = self.root/'goal'
        atomic(self.directory/'contract.json', self.contract)
        atomic(self.directory/'implementation.json', {'MathGKM/Markov.lean': sha(source)})
        atomic(self.directory/'limits.json', {
            'workers': 1, 'worker_seconds': 5, 'total_seconds': None,
            'tokens': None, 'failure_limit': 3,
        })
        atomic(self.directory/'state.json', {
            'contract_hash': digest(self.contract), 'transport': 'live',
            'status': 'stopped',
        })
        for target, value in (
            ('machinery.controller.ROOT', self.root),
            ('machinery.completion.ROOT', self.root),
            ('machinery.completion.dependency_paths', lambda: []),
        ):
            context = patch(target, value)
            context.start()
            self.addCleanup(context.stop)
        # Only the expensive external compiler boundary is simulated. Real
        # prepare/verify code enforces bundle binding and audit obligations.
        compiler = patch('machinery.completion.run', return_value={
            'returncode': 0, 'termination': None,
            'stdout': 'GKM_DECLARATIONS_V1:[{"name":"ControllerRootCheck","axioms":[],"constants":[]}]\n',
        })
        self.compiler = compiler.start()
        self.addCleanup(compiler.stop)
        self.audit = {
            'bundle_hash': completion.prepare(self.contract, self.claim)['bundle_hash'],
            'accepted': True, 'reviewer': 'isolated unit fixture reviewer',
            'checks': {key: 'Toy fixture finding: '+key
                       for key in self.contract['correspondence_obligations']},
        }

    def observation(self, request_id, outcome='completed', claim=True):
        return {
            'request_id': request_id, 'outcome': outcome, 'elapsed_seconds': 1,
            'report': {'agenda': [], 'completion': copy.deepcopy(self.claim) if claim else None},
        }

    def run_history(self, observations, audit=True):
        atomic(self.directory/'engine/state.json', {'events': [
            {'index': i, 'action': {'kind': 'research_worker'}, 'result': observation}
            for i, observation in enumerate(observations)
        ]})
        if audit:
            atomic(self.directory/'audit.json', self.audit)
        controller = Controller(self.directory)
        with patch.object(controller.engine, 'request', side_effect=AssertionError('unexpected new work')), \
             patch.object(controller, 'worker', side_effect=AssertionError('unexpected worker')), \
             patch.object(controller, 'verify_claim', wraps=controller.verify_claim) as verify:
            controller.run()
        return read(self.directory/'state.json'), verify.call_args.args[0]

    def test_later_timeout_cannot_shadow_completed_bundle(self):
        state, selected = self.run_history([
            self.observation('earlier'), self.observation('later', 'timeout')])
        self.assertEqual(selected['request_id'], 'earlier')
        self.assertEqual(state['status'], 'mathematically_resolved')
        self.assertEqual(state['resolution']['bundle_hash'], self.audit['bundle_hash'])
        self.assertTrue(state['resolution']['lean_exact_root_checked'])
        self.compiler.assert_called()

    def test_later_nonzero_exit_cannot_shadow_completed_bundle(self):
        state, selected = self.run_history([
            self.observation('earlier'), self.observation('later', 'nonzero_exit')])
        self.assertEqual(selected['request_id'], 'earlier')
        self.assertEqual(state['status'], 'mathematically_resolved')

    def test_latest_completed_matching_bundle_is_selected(self):
        state, selected = self.run_history([
            self.observation('oldest'), self.observation('newest-completed'),
            self.observation('failed', 'timeout')])
        self.assertEqual(selected['request_id'], 'newest-completed')
        self.assertEqual(state['status'], 'mathematically_resolved')

    def test_later_report_without_completion_preserves_history(self):
        state, selected = self.run_history([
            self.observation('earlier'), self.observation('later', claim=False)])
        self.assertEqual(selected['request_id'], 'earlier')
        self.assertEqual(state['status'], 'mathematically_resolved')

    def test_failed_reports_alone_cannot_resolve(self):
        state, _ = self.run_history([
            self.observation('timeout', 'timeout'), self.observation('exit', 'nonzero_exit')])
        self.assertEqual(state['status'], 'exhausted')
        self.compiler.assert_not_called()

    def test_absent_audit_keeps_completed_claim_unresolved(self):
        state, _ = self.run_history([self.observation('completed')], audit=False)
        self.assertEqual(state['status'], 'exhausted')
        self.assertIn('audit required', state['last_validation']['rejection'])

    def test_wrong_bundle_audit_keeps_completed_claim_unresolved(self):
        self.audit['bundle_hash'] = 'wrong-bundle'
        state, _ = self.run_history([self.observation('completed')])
        self.assertEqual(state['status'], 'exhausted')
        self.assertIn('audit required', state['last_validation']['rejection'])

    def test_missing_obligation_keeps_recovered_claim_unresolved(self):
        del self.audit['checks']['coverage']
        state, selected = self.run_history([
            self.observation('earlier'), self.observation('later', 'timeout')])
        self.assertEqual(selected['request_id'], 'earlier')
        self.assertEqual(state['status'], 'exhausted')
        self.assertIn('undischarged source obligation: coverage', state['last_validation']['rejection'])

    def test_changed_correspondence_does_not_reuse_old_audit(self):
        (self.root/'correspondence.md').write_text('Changed toy correspondence.\n')
        state, selected = self.run_history([
            self.observation('earlier'), self.observation('later', 'timeout')])
        self.assertEqual(selected['request_id'], 'later')
        self.assertEqual(state['status'], 'exhausted')
        self.compiler.assert_not_called()

    def test_fixture_transport_still_cannot_resolve(self):
        state = read(self.directory/'state.json')
        state['transport'] = 'fixture'
        atomic(self.directory/'state.json', state)
        state, selected = self.run_history([
            self.observation('earlier'), self.observation('later', 'timeout')])
        self.assertEqual(selected['request_id'], 'earlier')
        self.assertEqual(state['status'], 'exhausted')
        self.assertIn('fixture can never resolve', state['last_validation']['rejection'])
        self.compiler.assert_not_called()


if __name__ == '__main__':
    unittest.main(verbosity=2)
