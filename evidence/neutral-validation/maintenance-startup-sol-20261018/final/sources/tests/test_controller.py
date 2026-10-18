"""Explicit deterministic transport fixtures: NOT mathematical discovery.

Subprocesses exercise the actual watchdog/controller. No Codex call is made.
Lean protocol execution is real, including rollover tests.
"""
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import tempfile
import time
import unittest
import uuid
from unittest.mock import patch

from machinery.controller import (Controller, Locks, initialize, read, status,
                                  ROOT, PYTHON, CONTROL)
from machinery.engine import Engine, atomic
from machinery.gate import Rejected
from machinery.worker import command, valid_report
from machinery import completion


class ControllerFixtures(unittest.TestCase):
    def setUp(self):
        self.name = 'fixture-test-'+uuid.uuid4().hex
        self.directory = None

    def init(self, workers=2, seconds=5, epoch=1, modes=()):
        self.directory = initialize(self.name, contract_path=ROOT/'contracts/markov-goal.json',
            mode='bounded', workers=workers, seconds=seconds, epoch_actions=epoch, transport='fixture')
        state = read(self.directory/'state.json')
        state['fixture_modes'] = list(modes)
        atomic(self.directory/'state.json', state)
        return self.directory

    def tearDown(self):
        # Preserve one named fixture archive separately via the documented CLI.
        if self.directory and self.directory.exists():
            shutil.rmtree(self.directory)

    def run_controller(self):
        locks = Locks(self.directory)
        try:
            Controller(self.directory, locks.fds).run()
        finally:
            locks.close()

    def test_two_automatic_iterations_feedback_epoch_rollover_and_false_success(self):
        d = self.init(modes=['feedback', 'false_completion'])
        self.run_controller()
        state = read(d/'state.json')
        self.assertEqual(state['status'], 'exhausted')
        self.assertEqual(state['workers_completed'], 2)
        self.assertEqual(state['tokens'], 30)
        self.assertFalse(state['last_validation']['resolved'])
        first = read(d/'workers/000000/receipt.json')
        second = read(d/'workers/000001/receipt.json')
        self.assertIn(first['request_id'], second['report']['observations'][0])
        self.assertEqual(read(d/'workers/000001/request.json')['feedback'][0]['report'], first['report'])
        engine = read(d/'engine/state.json')
        self.assertEqual(len(engine['events']), 2)
        self.assertEqual(engine['epoch'], 2)
        self.assertTrue((d/'engine/epoch-000000.json').exists())
        self.assertTrue((d/'engine/epoch-000001.json').exists())
        self.assertEqual(first['classification'], 'explicit_deterministic_transport_fixture')

    def test_missing_malformed_killed_and_timeout_are_feedback(self):
        d = self.init(workers=5, seconds=1, epoch=8,
                      modes=['missing', 'malformed', 'killed', 'timeout', 'feedback'])
        limits = read(d/'limits.json')
        limits['failure_limit'] = 6
        atomic(d/'limits.json', limits)
        self.run_controller()
        results = [read(p) for p in sorted((d/'workers').glob('*/receipt.json'))]
        self.assertEqual(len(results), 5)
        self.assertEqual(results[0]['outcome'], 'missing_or_malformed_report')
        self.assertEqual(results[1]['outcome'], 'missing_or_malformed_report')
        self.assertNotEqual(results[2]['returncode'], 0)
        self.assertEqual(results[3]['outcome'], 'timeout')
        self.assertEqual(results[4]['outcome'], 'completed')
        self.assertIn('timeout', results[4]['report']['agenda'][0])
        self.assertEqual(read(d/'state.json')['status'], 'exhausted')

    def test_duplicate_exclusion_stop_resume_and_stale_status(self):
        d = self.init()
        locks = Locks(d)
        try:
            with self.assertRaises(Rejected):
                Locks(d)
            self.assertTrue(status(d)['lock_held'])
        finally:
            locks.close()
        atomic(d/'STOP.json', {'fixture': True})
        self.run_controller()
        self.assertEqual(read(d/'state.json')['status'], 'stopped')
        self.assertEqual(read(d/'state.json')['workers_completed'], 0)
        (d/'STOP.json').unlink()
        self.run_controller()
        self.assertEqual(read(d/'state.json')['workers_completed'], 2)
        state = read(d/'state.json')
        state['status'] = 'running'
        atomic(d/'state.json', state)
        self.assertEqual(status(d)['status'], 'operationally_blocked')

    def test_interrupt_engine_no_completed_effect_replayed(self):
        d = ROOT/'.scratch'/('engine-fixture-'+uuid.uuid4().hex)
        effects = []
        def act(payload):
            effects.append(payload['n'])
            if payload['n'] == 2:
                raise KeyboardInterrupt('fixture crash after effect, before receipt')
            return {'evidence': 'fixture_effect', 'n': payload['n']}
        engine = Engine(d, adapters={'fixture_effect': act})
        req = engine.initialize({'limits': {'actions': 3}})
        response = {'request_id': req['id'], 'context_hash': req['context_hash'],
            'origin': 'explicit_protocol_fixture', 'actions': [
                {'kind': 'fixture_effect', 'payload': {'n': n}} for n in (1, 2, 3)]}
        with self.assertRaises(KeyboardInterrupt):
            engine.consume(response)
        s = read(engine.state_path)
        self.assertEqual(len(s['events']), 1)
        self.assertNotIn(req['id'], s['consumed'])
        self.assertEqual(s['inflight']['active'], 1)
        with self.assertRaises(Rejected):
            engine.consume(response)
        with self.assertRaises(Rejected):
            engine.recover()
        engine.recover({'evidence': 'explicit_fixture_reconciliation', 'n': 2,
                        'outcome': 'effect observed; do not replay'})
        self.assertEqual(effects, [1, 2, 3])
        self.assertEqual(len(read(engine.state_path)['events']), 3)
        self.assertIn(req['id'], read(engine.state_path)['consumed'])
        shutil.rmtree(d)

    def test_detached_fixture_survives_launcher_and_stop_is_effective(self):
        d = self.init(workers=2, seconds=10, modes=['timeout', 'feedback'])
        launch = subprocess.run([PYTHON, '-m', 'machinery.controller', 'run', '--goal', self.name],
                                cwd=ROOT, capture_output=True, text=True, timeout=15)
        self.assertEqual(launch.returncode, 0, launch.stderr)
        deadline = time.time()+30
        while not (d/'workers/000000/process.json').exists() and time.time() < deadline:
            time.sleep(0.1)
        self.assertTrue((d/'workers/000000/process.json').exists())
        self.assertTrue(status(d)['lock_held'])
        atomic(d/'STOP.json', {'origin': 'fixture stop'})
        while status(d)['lock_held'] and time.time() < deadline:
            time.sleep(0.1)
        self.assertFalse(status(d)['lock_held'])
        self.assertEqual(read(d/'state.json')['status'], 'stopped')
        self.assertEqual(read(d/'workers/000000/receipt.json')['outcome'], 'stopped')
        (d/'STOP.json').unlink()
        self.run_controller()
        self.assertEqual(read(d/'state.json')['status'], 'exhausted')
        self.assertEqual(read(d/'state.json')['workers_completed'], 2)

    def test_killed_controller_watchdog_holds_lock_and_resume_uses_receipt(self):
        d = self.init(workers=2, seconds=2, modes=['timeout', 'feedback'])
        launch = subprocess.run([PYTHON, '-m', 'machinery.controller', 'run', '--goal', self.name],
                                cwd=ROOT, capture_output=True, text=True, timeout=15)
        self.assertEqual(launch.returncode, 0, launch.stderr)
        deadline = time.time()+40
        while not (d/'workers/000000/process.json').exists() and time.time() < deadline:
            time.sleep(0.1)
        state = read(d/'state.json')
        os.kill(state['pid'], signal.SIGKILL)
        with self.assertRaises(Rejected):
            Locks(d)
        while status(d)['lock_held'] and time.time() < deadline:
            time.sleep(0.1)
        self.assertFalse(status(d)['lock_held'])
        self.run_controller()
        self.assertEqual(read(d/'state.json')['workers_completed'], 2)
        self.assertEqual(len(list((d/'workers').iterdir())), 2)
        self.assertEqual(read(d/'workers/000000/receipt.json')['outcome'], 'timeout')

    def test_live_argv_only_constructed_not_executed(self):
        d = self.init(workers=1)
        argv = command(d, {})
        self.assertEqual(argv[0], '/opt/homebrew/bin/codex')
        for value in ('gpt-6-astra', '--ephemeral', '--ignore-user-config', '--no-daemon',
                      '--skip-git-repo-check', 'web_search="live"'):
            self.assertIn(value, argv)
        profile = read(d/'permissions.json')
        self.assertEqual(profile['filesystem'][':workspace_roots']['.git'], 'deny')
        self.assertEqual(profile['filesystem'][':workspace_roots']['.control'], 'read')
        self.assertFalse(profile['network']['enabled'])

    def test_completion_real_lean_rejects_unrelated_theorem_and_pinned_mutation(self):
        d = self.init(workers=1)
        contract = read(d/'contract.json')
        claim = {'kind': 'proof', 'module': 'MathGKM.Markov', 'declaration': 'True.intro',
                 'correspondence': 'evidence/markov/english-lean-review.md'}
        result = completion.verify(contract, claim, d/'reject-completion')
        atomic(ROOT/'evidence/controller-negative-completion.json', result)
        self.assertFalse(result['resolved'])
        self.assertIn('Lean compile failed', result['rejection'])
        contract['root_sha256'] = 'forged'
        with self.assertRaises(Rejected):
            completion.prepare(contract, claim)


if __name__ == '__main__':
    unittest.main(verbosity=2)
