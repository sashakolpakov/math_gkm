"""Neutral maintenance regressions. Mocks never attest real host deployment."""
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import study, study_worker, study_deployment as deployment
from machinery.study_common import ROOT, Invalid, read, write, sha, digest, lock, load_state
from machinery.study_transfer import check_task
from tests.test_revision_static_checkpoint import neutral_contract


class SolDeployment(unittest.TestCase):
    def setUp(self):
        self.base = Path(tempfile.mkdtemp(dir=ROOT/'.scratch', prefix='sol-deployment-neutral-'))
        print('RETAINED', self.base, flush=True)

    def freeze(self, model='gpt-6.1-sol'):
        directory = self.base/'study'
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.freeze(directory, {'model': model, 'rounds': 2}, contract=neutral_contract())
        return directory

    def test_exact_model_admission_and_config_parity(self):
        original = read(ROOT/'studies/v2-study.json')
        self.assertEqual(study.DEFAULT['model'], 'gpt-6-astra')
        for label, model in [('sol', 'gpt-6.1-sol'), ('astra', 'gpt-6-astra')]:
            config = read(ROOT/('studies/v2-study-'+label+'.json'))
            self.assertEqual(config, {**original, 'model': model})
            for transport in ('fixture', 'live'):
                study.validate_protocol({**study.DEFAULT, 'transport': transport, 'model': model})
        for model in ('gpt-6-sol', 'gpt-6.1', 'gpt-6-astra ', '', None):
            with self.subTest(model=model), self.assertRaises(Invalid):
                study.validate_protocol({**study.DEFAULT, 'model': model})

    def test_worker_argv_only_model_changes_and_high_effort_is_fixed(self):
        ws = self.base/'workspace'
        ws.mkdir()
        astra = study_worker.command(self.base/'astra', {'workspace': str(ws), 'readonly': False,
                                                        'model': 'gpt-6-astra'})
        sol = study_worker.command(self.base/'sol', {'workspace': str(ws), 'readonly': False,
                                                    'model': 'gpt-6.1-sol'})
        normalized = lambda argv, label: [x.replace(str(self.base/label), 'JOB').replace('gpt-6.1-sol', 'MODEL').replace('gpt-6-astra', 'MODEL') for x in argv]
        self.assertEqual(normalized(astra, 'astra'), normalized(sol, 'sol'))
        self.assertEqual(sol[sol.index('--model')+1], 'gpt-6.1-sol')
        self.assertIn('model_reasoning_effort="high"', sol)
        for spec in ({'model': 'unknown'}, {'model': 'gpt-6.1-sol', 'reasoning_effort': 'low'}):
            with self.assertRaises(Invalid):
                study_worker.command(self.base/'rejected', {'workspace': str(ws), 'readonly': False, **spec})

    def test_sol_reaches_frozen_protocol_role_request_spec_and_real_fixture_receipt(self):
        directory = self.freeze()
        with lock(directory/'controller.lock') as fd:
            arm = study.Arm(directory, 'baseline', fd)
            # This is an actual deterministic subprocess, never a model.
            receipt = arm.call('selection-test', 'adapter', {'role': 'adapter', 'tasks': []})
        job = directory/'arms/baseline/jobs/selection-test'
        self.assertEqual(receipt['outcome'], 'completed', receipt)
        for item in (read(directory/'protocol.json'), read(job/'spec.json'),
                     read(job/'request.json'), read(job/'receipt.json')):
            self.assertEqual(item['model'], 'gpt-6.1-sol')
        for item in (read(job/'spec.json'), read(job/'request.json'), receipt):
            self.assertEqual(item['reasoning_effort'], 'high')
        self.assertEqual(receipt['transport'], 'fixture')
        sol_prompt = (job/'prompt.txt').read_text()
        self.assertNotIn('gpt-6.1-sol', sol_prompt)
        self.assertNotIn('reasoning_effort', sol_prompt)
        self.assertEqual(read(directory/'seal.json')['protocol'], digest(read(directory/'protocol.json')))
        with patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}):
            study.verify(directory)
            protocol = read(directory/'protocol.json')
            write(directory/'protocol.json', {**protocol, 'model': 'gpt-6-astra'})
            with self.assertRaises(Invalid):
                study.verify(directory)

    def test_uncertain_recovery_records_sol_without_any_relaunch(self):
        directory = self.freeze()
        with lock(directory/'controller.lock') as fd:
            arm = study.Arm(directory, 'baseline', fd)
            job = arm.root/'jobs/interrupted'
            write(job/'spec.json', {'seconds': 3, 'role': 'researcher', 'request_id': 'interrupted',
                                    'model': 'gpt-6.1-sol'})
            arm.s['active'] = str(job)
            arm.save()
            with patch('machinery.study.subprocess.Popen', side_effect=AssertionError('no replay')):
                receipt = arm.recover()
            self.assertEqual(receipt['model'], 'gpt-6.1-sol')
            self.assertEqual(receipt['reasoning_effort'], 'high')
            self.assertEqual(receipt['outcome'], 'uncertain_effects_not_replayed')

    def test_live_freeze_failure_precedes_seed_and_roles(self):
        directory = self.base/'live'
        with patch('machinery.study.authorize_live'), patch(
            'machinery.study_deployment.require_deployment', side_effect=Invalid('neutral deployment failure')) as guard, patch(
            'machinery.study.subprocess.Popen', side_effect=AssertionError('model launch forbidden')):
            with self.assertRaisesRegex(Invalid, 'neutral deployment failure'):
                study.freeze(directory, {'transport': 'live', 'model': 'gpt-6.1-sol'}, contract=neutral_contract())
        guard.assert_called_once_with(directory/'deployment-preflight')
        self.assertFalse((directory/'seed').exists())
        self.assertFalse((directory/'seal.json').exists())

    def test_each_live_arm_session_blocks_before_call_accounting(self):
        directory = self.freeze()
        with lock(directory/'controller.lock') as fd:
            arm = study.Arm(directory, 'baseline', fd)
            arm.p['transport'] = 'live'  # unit branch only; no frozen-study activation
            with patch('machinery.study_deployment.require_deployment', side_effect=Invalid('blocked')):
                with self.assertRaisesRegex(Invalid, 'blocked'):
                    arm.call('forbidden', 'researcher', {'role': 'researcher'})
            self.assertEqual(arm.s['calls'], 0)
            self.assertEqual(arm.s['seconds'], 0)
            self.assertFalse((arm.root/'jobs/forbidden').exists())

    def test_real_wrapper_startup_failure_is_preserved_without_unwrapped_retry(self):
        failed = {'returncode': -6, 'stdout': '', 'stderr': '', 'termination': None,
                  'argv': [], 'elapsed_ns': 10000000, 'captured_bytes': 0}
        out = self.base/'preflight'
        with patch('machinery.study_deployment.run', return_value=failed) as runner, patch(
            'machinery.study_deployment.check_task', side_effect=AssertionError('startup failed')):
            result = deployment.preflight(out)
        self.assertFalse(result['ready'])
        self.assertEqual(runner.call_count, 2)
        for call in runner.call_args_list:
            self.assertEqual(call.args[0][0], '/usr/bin/sandbox-exec')
            self.assertLessEqual(call.kwargs['timeout'], 5)
        self.assertEqual([p['returncode'] for p in result['probes']], [-6, -6])
        self.assertEqual(read(out/'receipt.json')['result_sha256'], sha(out/'result.json'))
        with self.assertRaises(Invalid):
            deployment.preflight(out)

    def test_signal_on_first_live_compile_is_infrastructure_not_math(self):
        directory = self.freeze()
        ws = directory/'arms/baseline/workspace'
        contract = neutral_contract()
        task = {'id': 'neutral', 'statement': 'True', 'hypotheses': [], 'scope': 'neutral',
                'source_sha256': contract['root_sha256'], 'kind': 'regression',
                'interface_type': 'True', 'transport_type': 'True', 'required_constants': []}
        solution = {'module': 'MathGKM.HarnessFixture', 'term': 'True.intro',
                    'interface_term': 'True.intro', 'transport_term': 'True.intro'}
        failed = {'returncode': -6, 'stdout': '', 'stderr': '', 'termination': None,
                  'argv': [], 'elapsed_ns': 10000000}
        with patch('machinery.study_transfer.run', return_value=failed) as runner:
            result = check_task(ws, task, solution, self.base/'first-failure', 10, live=True)
        self.assertFalse(result['checked'])
        self.assertEqual(result['status'], 'validator_infrastructure_failure')
        self.assertEqual(runner.call_count, 1)
        self.assertEqual(runner.call_args.args[0][0], '/usr/bin/sandbox-exec')
        self.assertEqual(result['checks'][0]['returncode'], -6)
        self.assertTrue(result['sandbox_profile_sha256'])

    def test_control_criteria_reject_infrastructure_negatives_and_unwrapped_evidence(self):
        good = {'checked': True, 'validation_mode': 'deployed_sandbox', 'component_use_checked': True,
            'checks': [{'operation': op} for op in ('compile', 'kernel_replay', 'trusted_premise_inspection')]}
        wrong = {'checked': False, 'checks': [{'module': 'StudyCheck', 'operation': 'compile',
            'returncode': 1, 'termination': None, 'stdout': 'Type mismatch'}]}
        missing = {'checked': False, 'failure': 'trusted premise inspector failed',
            'checks': [{'operation': 'trusted_premise_inspection', 'returncode': 1,
                'termination': None, 'stdout': 'consumer does not use MathGKM.DeploymentRoot.Root'}]}
        completed = {'resolved': False, 'lean_exact_root_checked': True,
            'rejection': 'independent source/English correspondence audit required for this exact bundle'}
        self.assertTrue(deployment.accepted_controls(good, wrong, missing, completed))
        cases = [(dict(good, validation_mode='unwrapped_fixture'), wrong, missing, completed),
                 (dict(good, checked=False), wrong, missing, completed),
                 (good, dict(wrong, checks=[]), missing, completed),
                 (good, wrong, dict(missing, checks=[]), completed),
                 (good, wrong, missing, dict(completed, resolved=True))]
        for case in cases:
            self.assertFalse(deployment.accepted_controls(*case))

    def test_receipt_tampering_and_missing_success_rejected(self):
        out = self.base/'receipt'
        out.mkdir()
        write(out/'result.json', {'ready': True})
        files = {'result.json': sha(out/'result.json')}
        write(out/'receipt.json', {'ready': True, 'files': files, 'files_binding': digest(files),
                                  'result_sha256': files['result.json']})
        binding = {'ready': True, 'receipt': str(out/'receipt.json'), 'receipt_sha256': sha(out/'receipt.json')}
        deployment.verify_receipt(binding)  # serialization unit fixture only
        write(out/'result.json', {'ready': False})
        with self.assertRaises(Invalid):
            deployment.verify_receipt(binding)
        with self.assertRaises(Invalid):
            deployment.verify_receipt(None)


if __name__ == '__main__':
    unittest.main()
