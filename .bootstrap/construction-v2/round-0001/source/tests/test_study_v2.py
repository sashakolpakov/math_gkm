"""Construction fixtures; no nested LLMs and no Markov progress claims.

Lifecycle tests run real deterministic subprocesses. Lean tests use the pinned
compiler and checker on toy obligations plus a negative exact-root attempt.
"""
import copy
import json
import os
from pathlib import Path
import signal
import subprocess
import tempfile
import time
import unittest
from unittest.mock import patch

from machinery.study_common import (ROOT, PYTHON, SEED, ROOT_SHA, Invalid, read, write,
    load_state, save_state, sha, digest, lock, snapshot, verify_snapshot, inventory)
from machinery import study, study_policy, study_worker, study_audit, completion
from machinery.study_transfer import check_task, evaluate_pair, copy_tasks, wrapper

def task(**changes):
    return {'id': 'toy', 'statement': '∀ n : Nat, Toy.component n = n', 'hypotheses': [],
        'scope': 'SYNTHETIC toy identity only; not a Markov result', 'source_sha256': ROOT_SHA,
        'kind': 'holdout', 'interface_type': 'Nat → Nat',
        'transport_type': '∀ n : Nat, Toy.component n = n', 'required_constants': ['Toy.component'], **changes}

def suite(tasks=None):
    return {'schema': 'math-gkm.suite.v2', 'selector': 'independent deterministic fixture selector',
        'selection_basis': 'fixed before any fixture trial, toy only', 'independent': True, 'tasks': tasks or []}

class StudyFixtures(unittest.TestCase):
    def setUp(self):
        tmp = tempfile.TemporaryDirectory(prefix='study-v2-', dir=ROOT/'.scratch')
        self.addCleanup(tmp.cleanup)
        self.base = Path(tmp.name)
        self.directory = self.base/'study'

    def freeze(self, config=None, obligations=None):
        study.freeze(self.directory, {'rounds': 2, 'episode_rounds': 2, **(config or {})}, obligations)
        return self.directory

    def run_arm(self, mode):
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, mode, fd)
            arm.run()
        return load_state(arm.root/'state.json')

    def test_clean_paired_seed_and_legacy_contract_unchanged(self):
        original = sha(ROOT/'contracts/markov-goal.json')
        self.freeze()
        contract = read(self.directory/'seed/contract.json')
        self.assertEqual(contract['inherited'], [])
        self.assertEqual(len(contract['clean_start']['removed_inheritance_paths']), 6)
        old = read(ROOT/'contracts/markov-goal.json')
        for key in ('root_declaration', 'root_sha256', 'root_meaning', 'assumptions', 'completion', 'correspondence_obligations'):
            self.assertEqual(contract[key], old[key])
        for mode in ('baseline', 'exploration'):
            ws = self.directory/'arms'/mode/'workspace'
            self.assertEqual(sha(ws/'MathGKM/Markov.lean'), ROOT_SHA)
            self.assertEqual(set(inventory(ws)), {'MathGKM/Markov.lean', 'MathGKM/Protocol.lean'})
            for path in old['inherited']:
                self.assertFalse((ws/path).exists())
        self.assertEqual(original, sha(ROOT/'contracts/markov-goal.json'))
        self.assertEqual(read(self.directory/'arms/baseline/snapshots/initial/manifest.json')['files'],
                         read(self.directory/'arms/exploration/snapshots/initial/manifest.json')['files'])

    def test_full_lifecycle_portfolio_prospective_distinct_roles_delayed_horizon(self):
        self.freeze()
        baseline = self.run_arm('baseline')
        explored = self.run_arm('exploration')
        self.assertEqual(baseline['round'], 2)
        self.assertEqual(explored['round'], 2)
        self.assertFalse(baseline['research']['portfolio'])
        self.assertEqual(set(explored['research']['portfolio']), {'h-a', 'h-b'})
        self.assertEqual(explored['research']['episode']['review_round'], 1)
        self.assertEqual(explored['research']['episode']['continuation_rounds'], 2)
        self.assertEqual(explored['calls'], 6)
        root = self.directory/'arms/exploration'
        plan = read(root/'jobs/plan-0000/receipt.json')
        execute = read(root/'jobs/round-0000/receipt.json')
        self.assertLessEqual(plan['finished'], execute['started'])
        req = read(root/'jobs/round-0000/request.json')
        self.assertEqual(req['prospective_binding'], digest(plan))
        self.assertEqual(read(root/'jobs/review-2/spec.json')['readonly'], True)
        self.assertNotEqual(read(root/'jobs/review-2/spec.json')['workspace'], str(root/'workspace'))
        self.assertTrue((root/'workspace/history/objects').is_dir())
        self.assertIsNone(explored['resolution'])
        self.assertIn('root_open', explored['status'])
        self.assertFalse(read(root/'decisions/review-2.json')['certified_switch'])

    def test_frozen_suite_answers_not_in_any_research_request(self):
        self.freeze(obligations=suite([task(reference_answer='SECRET-DO-NOT-LEAK')]))
        self.run_arm('exploration')
        for p in (self.directory/'arms').glob('*/jobs/*/request.json'):
            self.assertNotIn('SECRET-DO-NOT-LEAK', p.read_text())
            if read(p)['role'] != 'adapter':
                self.assertNotIn('Toy.component', p.read_text())
        projected = copy_tasks(read(self.directory/'evaluation/suite.json')['tasks'], 'live')
        self.assertNotIn('reference_answer', projected[0])

    def test_protocol_suite_source_and_state_tampering_rejected(self):
        self.freeze()
        for path in [self.directory/'protocol.json', self.directory/'evaluation/suite.json',
                     self.directory/'seed/MathGKM/Markov.lean',
                     self.directory/'arms/exploration/workspace/MathGKM/Markov.lean',
                     self.directory/'arms/baseline/state.json']:
            before = path.read_bytes()
            try:
                if path.suffix == '.json':
                    data = read(path)
                    if 'state' in data:
                        data['state']['round'] = 99
                    else:
                        data['tampered'] = True
                    write(path, data)
                else:
                    path.write_bytes(before+b'\n-- mutation\n')
                with self.assertRaises(Invalid):
                    study.verify(self.directory)
            finally:
                path.write_bytes(before)

    def test_no_praise_or_self_report_can_choose_policy(self):
        self.freeze({'fixture_policy_trial': True, 'meta_calls': 16, 'max_calls': 40})
        state = self.run_arm('exploration')
        comparison = next((self.directory/'arms/exploration/policy_trials').glob('*/result.json'))
        result = read(comparison)
        self.assertEqual(result['rounds_each'], 2)
        self.assertFalse(result['eligible'])
        self.assertIn('no_independent_holdout', result['comparison']['status'])
        self.assertEqual(state['research']['policy'], study_policy.EXPLORATION)
        self.assertEqual(state['policy_trials'], 1)
        self.assertGreater(state['calls'], 6)
        self.assertGreater(state['seconds'], 0)

    def test_audit_only_metric_changes_cannot_change_requests_or_decisions(self):
        self.freeze()
        self.run_arm('exploration')
        state = load_state(self.directory/'arms/exploration/state.json')
        before = study_policy.request(state['research'], 2, read(self.directory/'protocol.json'))
        decision = (self.directory/'arms/exploration/decisions/review-2.json').read_bytes()
        for value in (0, 1e100, -1e100):
            write(self.directory/'audit/raw/mutated.json', {'complexity': value, 'compression_proxy': value})
            state['audit_only'] = {'description_length': value}
            after = study_policy.request(state['research'], 2, read(self.directory/'protocol.json'))
            self.assertEqual(before, after)
            self.assertEqual(decision, (self.directory/'arms/exploration/decisions/review-2.json').read_bytes())
        profile = study_worker.permissions(self.directory/'arms/exploration/workspace')
        self.assertEqual(profile['filesystem'][str(ROOT)], 'deny')
        self.assertNotIn('audit', canonical_profile := json.dumps(profile['filesystem'][':workspace_roots']))
        self.assertNotIn('evaluation', canonical_profile)

    def test_live_argv_constructed_only_and_read_grants_are_isolated(self):
        self.freeze()
        job = self.base/'argv'
        job.mkdir()
        ws = self.directory/'arms/exploration/workspace'
        argv = study_worker.command(job, {'workspace': str(ws), 'readonly': False, 'model': 'gpt-6-astra'})
        self.assertIn('--ephemeral', argv)
        self.assertIn('--ignore-user-config', argv)
        self.assertIn('features.skip_host_skill_discovery=true', argv)
        self.assertIn('features.multi_agent=false', argv)
        profile = read(job/'permissions.json')
        self.assertEqual(profile['filesystem'][str(ws)], 'write')
        self.assertEqual(profile['filesystem'][str(ROOT)], 'deny')
        self.assertEqual(profile['filesystem'][':workspace_roots']['history'], 'read')
        self.assertFalse(profile['network']['enabled'])

    def test_finite_budget_failure_and_uncertain_recovery_without_replay(self):
        self.freeze()
        root = self.directory/'arms/baseline'
        job = root/'jobs/round-0000'
        write(job/'spec.json', {'seconds': 7, 'role': 'researcher', 'request_id': 'round-0000'})
        state = load_state(root/'state.json')
        state.update(active=str(job), calls=1)
        save_state(root/'state.json', state)
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'baseline', fd)
            receipt = arm.recover()
            self.assertEqual(receipt['outcome'], 'uncertain_effects_not_replayed')
            self.assertEqual(arm.s['seconds'], 7)
            with patch('machinery.study.subprocess.Popen', side_effect=AssertionError('replayed effect')):
                self.assertEqual(arm.call('round-0000', 'researcher', {}), receipt)
            self.assertEqual(arm.s['seconds'], 7)

    def test_stop_and_resume_and_duplicate_exclusion(self):
        self.freeze()
        write(self.directory/'STOP.json', {})
        state = self.run_arm('baseline')
        self.assertEqual(state['calls'], 0)
        self.assertEqual(state['status'], 'stopped')
        with lock(self.directory/'controller.lock'):
            with self.assertRaises(Invalid):
                with lock(self.directory/'controller.lock'):
                    pass
        (self.directory/'STOP.json').unlink()
        self.assertEqual(self.run_arm('baseline')['round'], 2)

    def test_killed_controller_watchdog_retains_lock_and_receipt_recovers(self):
        self.freeze({'call_seconds': 2, 'fixture_behavior': 'sleep'})
        logfile = (self.base/'controller.log').open('wb')
        self.addCleanup(logfile.close)
        child = subprocess.Popen([PYTHON, '-m', 'machinery.study', 'run', '--study', str(self.directory),
            '--arm', 'baseline'], cwd=ROOT, stdout=logfile, stderr=logfile, start_new_session=True)
        self.addCleanup(lambda: child.poll() is None and child.kill())
        job = self.directory/'arms/baseline/jobs/round-0000'
        deadline = time.monotonic()+10
        while not (job/'process.json').exists() and time.monotonic() < deadline:
            time.sleep(.02)
        self.assertTrue((job/'process.json').exists())
        child.kill()
        child.wait(timeout=3)
        with self.assertRaises(Invalid):
            with lock(self.directory/'controller.lock'):
                pass
        while not (job/'receipt.json').exists() and time.monotonic() < deadline:
            time.sleep(.05)
        self.assertTrue((job/'receipt.json').exists())
        # Watchdog releases inherited lock after committing the receipt.
        time.sleep(.1)
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'baseline', fd)
            result = arm.recover()
            self.assertEqual(result['outcome'], 'failure_within_time_budget')
            self.assertEqual(arm.s['calls'], 1)
            self.assertFalse(result['mathematical_resolution'])
            self.assertIsNone(arm.s['active'])

    def test_plot_empty_single_and_same_data_pair(self):
        self.freeze()
        empty = study_audit.report(self.directory, self.base/'empty')
        self.assertEqual(empty['records'], 0)
        self.assertIn('No measurements', (self.base/'empty/burden.svg').read_text())
        live_empty = self.base/'live-empty'
        write(live_empty/'protocol.json', {'transport': 'live'})
        live_report = study_audit.report(live_empty, self.base/'live-plot')
        self.assertFalse(live_report['synthetic'])
        self.assertEqual(live_report['records'], 0)
        self.assertIn('No measurements', (self.base/'live-plot/burden.svg').read_text())
        self.assertNotIn('SYNTHETIC', (self.base/'live-plot/burden.svg').read_text())
        ws = self.directory/'arms/baseline/workspace'
        data = ws/'research/data.txt'
        data.write_text('same actual fixture data')
        a = ws/'research/old.txt'
        b = ws/'research/new.txt'
        a.write_text('x'*100)
        b.write_text('y'*140)  # deliberately unfavorable, no manufactured drop
        study_audit.measure(self.directory, 'baseline', a, data, 'fixed', 'old', pair_id='pair')
        study_audit.measure(self.directory, 'baseline', b, data, 'fixed', 'new', 'representation-change', 'pair')
        result = study_audit.report(self.directory, self.base/'plot')
        self.assertEqual(result['groups'], 1)
        self.assertIn('SYNTHETIC FIXTURE', (self.base/'plot/burden.svg').read_text())
        self.assertEqual(read(self.base/'plot/paired-comparisons.json')[0]['raw_byte_change'], 40)
        data.write_text('changed workload')
        study_audit.measure(self.directory, 'baseline', b, data, 'fixed', 'new')
        self.assertEqual(study_audit.report(self.directory, self.base/'plot')['groups'], 2)

    def test_no_evidence_and_exhausted_invention_are_rejected(self):
        self.freeze()
        self.run_arm('exploration')
        root = self.directory/'arms/exploration'
        report = read(root/'jobs/round-0000/receipt.json')['payload']
        p = read(self.directory/'protocol.json')
        state = study_policy.initial('exploration')
        report['trial']['invention'] = True
        study_policy.record(state, report, root/'workspace', 0, p)
        with self.assertRaises(Invalid):
            study_policy.record(state, report, root/'workspace', 1, p)
        report['evidence'][0]['sha256'] = 'forged'
        with self.assertRaises(Invalid):
            study_policy.record(study_policy.initial('exploration'), report, root/'workspace', 0, p)

    def test_retrospective_audit_uses_actual_snapshots_and_costs(self):
        self.freeze()
        self.run_arm('exploration')
        state_before = (self.directory/'arms/exploration/state.json').read_bytes()
        collected = study_audit.collect(self.directory)
        self.assertEqual(collected['observations'], 4)
        records = [read(p) for p in sorted((self.directory/'audit/raw').glob('collected-exploration-*.json'))]
        self.assertEqual(records[0]['cumulative_research_seconds'], 0)
        self.assertGreater(records[-1]['cumulative_research_seconds'], 0)
        self.assertEqual([r['raw_bytes'] for r in records], [records[0]['raw_bytes']]*3)
        self.assertEqual(state_before, (self.directory/'arms/exploration/state.json').read_bytes())

    def test_review_interruption_reuses_committed_inputs_and_receipt(self):
        self.freeze()
        with lock(self.directory/'controller.lock') as fd:
            arm = study.Arm(self.directory, 'exploration', fd)
            arm.research_round()
            arm.research_round()
            original_call = arm.call
            def interrupted(key, role, *args, **kwargs):
                if role == 'selector':
                    raise RuntimeError('synthetic controller interruption after reviewer')
                return original_call(key, role, *args, **kwargs)
            with patch.object(arm, 'call', side_effect=interrupted):
                with self.assertRaises(RuntimeError):
                    arm.review()
            reviewer = arm.root/'jobs/review-2/receipt.json'
            before = reviewer.read_bytes()
            recovered = study.Arm(self.directory, 'exploration', fd)
            recovered.review()
            self.assertEqual(before, reviewer.read_bytes())
            self.assertEqual(recovered.s['calls'], 6)
            self.assertEqual(recovered.s['reviewed_rounds'], [2])
            self.assertTrue((arm.root/'jobs/plan-0000/validated-plan.json').exists())

class LeanTransferFixtures(StudyFixtures):
    # Inherit setup, not every lifecycle test (load_tests below avoids duplicates).
    def prepare_lean(self):
        self.freeze()
        ws = self.directory/'arms/exploration/workspace'
        (ws/'MathGKM/Toy.lean').write_text('import Lean\nnamespace Toy\ndef component (n : Nat) : Nat := n\ntheorem use (n : Nat) : component n = n := rfl\nend Toy\n')
        return ws

    def test_real_lean_use_transport_hypotheses_and_scope(self):
        ws = self.prepare_lean()
        solution = {'module': 'MathGKM.Toy', 'term': 'Toy.use', 'interface_term': 'Toy.component', 'transport_term': 'Toy.use'}
        accepted = check_task(ws, task(), solution, self.base/'pass', 120)
        self.assertTrue(accepted['checked'], json.dumps(accepted)[-5000:])
        self.assertTrue(accepted['component_use_checked'])
        write(ROOT/'evidence/construction-v2/lean-use-checked.json', accepted)
        frozen_without_component = {name: hashed for name, hashed in inventory(ws).items() if name != 'MathGKM/Toy.lean'}
        invented = check_task(ws, task(), solution, self.base/'invented-during-adaptation', 120,
                             frozen_files=frozen_without_component)
        self.assertFalse(invented['checked'])
        write(ROOT/'evidence/construction-v2/lean-adaptation-invention-rejected.json', invented)
        bad = check_task(ws, task(statement='∀ n : Nat, Toy.component n = n + 1'), solution, self.base/'bad-scope', 120)
        self.assertFalse(bad['checked'])
        conditional = {**solution, 'term': 'fun h : False => False.elim h'}
        bad = check_task(ws, task(), conditional, self.base/'bad-hypothesis', 120)
        self.assertFalse(bad['checked'])
        bad = check_task(ws, task(required_constants=['Toy.missing']), solution, self.base/'bad-use', 120)
        self.assertFalse(bad['checked'])
        bad = check_task(ws, task(source_sha256='forged'), solution, self.base/'bad-source', 120)
        self.assertFalse(bad['checked'])
        frozen = inventory(ws)
        (ws/'MathGKM/Toy.lean').write_text((ws/'MathGKM/Toy.lean').read_text()+'\n-- changed frozen artifact\n')
        bad = check_task(ws, task(), solution, self.base/'changed-frozen-source', 120, frozen_files=frozen)
        self.assertFalse(bad['checked'])
        self.assertIn('altered frozen', bad['failure'])

    def test_real_lean_exact_root_rejects_unrelated_and_mutated_source(self):
        ws = self.prepare_lean()
        (ws/'research/correspondence.md').write_text('Toy unrelated theorem has no source correspondence.')
        claim = {'kind': 'proof', 'module': 'MathGKM.Toy', 'declaration': 'Toy.use',
                 'correspondence': 'research/correspondence.md'}
        with patch('machinery.completion.ROOT', ws):
            result = completion.verify(read(ws/'contract.json'), claim, self.base/'root-rejection')
            self.assertFalse(result['resolved'])
            self.assertIn('Lean compile failed', result['rejection'])
            write(ROOT/'evidence/construction-v2/exact-root-negative.json', result)
            contract = read(ws/'contract.json')
            contract['root_sha256'] = 'forged'
            with self.assertRaises(completion.Rejected):
                completion.prepare(contract, claim)

    def test_checked_transfer_drives_experimental_policy_change_with_equal_branches(self):
        obligation = task(statement='∀ n : Nat, FixtureComponent.value n = n',
            transport_type='∀ n : Nat, FixtureComponent.value n = n', required_constants=['FixtureComponent.value'],
            fixture_module='MathGKM.FixtureComponent', fixture_term='FixtureComponent.use',
            fixture_interface_term='FixtureComponent.value', fixture_transport_term='FixtureComponent.use')
        self.freeze({'fixture_policy_trial': True, 'meta_calls': 16, 'max_calls': 40,
                     'arm_seconds': 1800}, suite([obligation]))
        state = self.run_arm('exploration')
        self.assertIn('fixture component', state['research']['policy']['memory'])
        decision = read(self.directory/'arms/exploration/decisions/review-2.json')
        self.assertTrue(decision['accepted_experimental_change'], json.dumps(decision)[-2000:])
        self.assertFalse(decision['certified_switch'])
        comparison = decision['comparison']['comparison']
        self.assertEqual(comparison['transfer'], ['toy'])
        self.assertEqual(comparison['regressions'], [])
        self.assertEqual(comparison['binding']['adaptation_seconds_each'], 30)
        self.assertGreaterEqual(state['seconds'], 240)
        write(ROOT/'evidence/construction-v2/checked-policy-trial.json', decision)

def load_tests(loader, tests, pattern):
    result = loader.loadTestsFromTestCase(StudyFixtures)
    for name in ('test_real_lean_use_transport_hypotheses_and_scope', 'test_real_lean_exact_root_rejects_unrelated_and_mutated_source',
                 'test_checked_transfer_drives_experimental_policy_change_with_equal_branches'):
        result.addTest(LeanTransferFixtures(name))
    return result

if __name__ == '__main__':
    unittest.main(verbosity=2)
