"""Independent neutral continuation controls; no models, compilers or real runs.

Native seed/snapshot/verify transitions run against synthetic owned data. The
receipt verifier is explicitly simulated here; genuine Lean checking is covered
by the existing harness qualification, not claimed by these tests.
"""
import copy
import importlib.util
from pathlib import Path
import shutil
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('gaussian_epoch_fixture_for_audit', HERE/'test_epoch.py')
fixtures = importlib.util.module_from_spec(spec); spec.loader.exec_module(fixtures)
epoch, common = fixtures.epoch, fixtures.common


class EpochAdversarial(unittest.TestCase):
    setUp = fixtures.EpochFixtures.setUp
    migrate = fixtures.EpochFixtures.migrate

    def test_corrupt_bound_validator_source_never_becomes_a_finished_epoch(self):
        f = self.fixture
        marker = Path(f.record['validation_bundle']['directory'])
        (marker/'source/evidence.json').write_text('changed bound source')
        parent = common.sha(f.arm/'state.json')
        with self.assertRaisesRegex(common.Invalid, 'source hash changed'):
            self.migrate()
        self.assertFalse((f.destination/'MIGRATION_FINISHED.json').exists())
        self.assertEqual(common.sha(f.arm/'state.json'), parent)

    def test_relocated_validator_is_verified_again_before_acceptance(self):
        f = self.fixture
        with patch.object(epoch, 'reuse', side_effect=[f.result, {'checked': False}]) as verifier:
            with self.assertRaisesRegex(common.Invalid, 'relocated receipt changed'):
                self.migrate()
        self.assertEqual(verifier.call_count, 2)
        before, after = [Path(call.args[0]) for call in verifier.call_args_list]
        self.assertEqual(before, Path(f.record['validation_bundle']['directory']))
        self.assertTrue(after.is_relative_to(f.destination/'arms/exploration'))
        self.assertFalse((f.destination/'MIGRATION_FINISHED.json').exists())

    def test_original_clean_initial_cannot_be_replaced_by_accumulated_theory(self):
        f = self.fixture
        initial = f.arm/'snapshots/initial'
        shutil.rmtree(initial)
        common.snapshot(f.workspace, initial, f.state['research']['policy'],
                        common.verify_snapshot(f.arm/'snapshots/round-0001')['admitted_modules'])
        self.assertIn('MathGKM/EpochClaim.lean', common.verify_snapshot(initial)['files'])
        with self.assertRaisesRegex(common.Invalid, 'historical snapshot collision'):
            self.migrate()
        self.assertFalse((f.destination/'MIGRATION_FINISHED.json').exists())

    def test_each_started_assay_marker_prevents_panel_retargeting(self):
        f = self.fixture
        directory = f.arm/'method-learning'/f.prepared['reference']
        for name in epoch.PARTIAL_METHOD:
            with self.subTest(marker=name):
                marker = directory/name
                if name in ('prediction-validation', 'prediction-workspace'):
                    marker.mkdir()
                else:
                    marker.write_text('{}')
                try:
                    with self.assertRaisesRegex(common.Invalid, 'partially started'):
                        self.migrate()
                    self.assertFalse(f.destination.exists())
                finally:
                    if marker.is_dir(): marker.rmdir()
                    else: marker.unlink()

    def test_private_adapter_and_evaluation_trees_do_not_enter_research(self):
        f = self.fixture
        canary = 'UNSEEN_EVALUATION_ANSWER_NOT_FOR_THE_RESEARCHER'
        common.write(f.arm/'evaluations/answers.json', {'answer': canary})
        common.write(f.arm/'roles/eval-private/answer.json', {'answer': canary})
        self.migrate()
        workspace = f.destination/'arms/exploration/workspace'
        for path in workspace.rglob('*'):
            if path.is_file() and not path.is_symlink() and '.lake' not in path.parts:
                self.assertNotIn(canary, path.read_text(), str(path))
        self.assertFalse((workspace/'evaluations').exists())
        self.assertFalse((workspace/'roles').exists())
        self.assertEqual(common.sha(f.arm/'method-learning/reviews/2.json'),
                         common.sha(f.destination/'arms/exploration/method-learning/reviews/2.json'))

    def test_inherited_development_cost_is_retained_without_a_new_charge(self):
        f = self.fixture
        state = common.load_state(f.arm/'state.json')
        job = f.arm/'jobs/plan-0001'
        receipt = {'role': 'proposer', 'outcome': 'completed', 'request_id': 'plan-0001',
                   'elapsed_seconds': 11, 'payload': {'classification': 'SYNTHETIC own research'}}
        common.write(job/'spec.json', {'role': 'proposer', 'workspace': str(f.workspace)})
        common.write(job/'request.json', {'role': 'proposer', 'synthetic': True})
        common.write(job/'receipt.json', receipt)
        state['receipts'].append(str(job)); state['receipt_hashes'][str(job)] = common.digest(receipt)
        state['calls'] = 3; state['meta_calls'] = 2; state['seconds'] = 6000
        state.setdefault('counted_jobs', []).append('plan-0001')
        common.save_state(f.arm/'state.json', state)
        original = common.sha(f.arm/'state.json')
        result = self.migrate()
        fresh = common.load_state(f.destination/'arms/exploration/state.json')
        provenance = common.read(result['provenance_path'])
        self.assertEqual(provenance['old_accounting']['seconds'], 6000)
        self.assertEqual(provenance['old_accounting']['calls'], 3)
        self.assertEqual(sum(common.read(Path(p)/'receipt.json')['elapsed_seconds']
                             for p in fresh['receipts']), 18)
        self.assertEqual((fresh['calls'], fresh['meta_calls'], fresh['seconds']), (0, 0, 0))
        self.assertEqual(len(fresh['counted_jobs']), len(set(fresh['counted_jobs'])))
        self.assertEqual(common.sha(f.arm/'state.json'), original)
        self.assertEqual(fresh['method_learning']['submitted'], state['method_learning']['submitted'])

    def test_even_a_consistent_adapter_receipt_cannot_be_inherited_as_research(self):
        f = self.fixture
        state = common.load_state(f.arm/'state.json'); job = f.arm/'jobs/round-0000'
        spec = common.read(job/'spec.json'); spec['role'] = 'adapter'; common.write(job/'spec.json', spec)
        receipt = common.read(job/'receipt.json'); receipt['role'] = 'adapter'
        common.write(job/'receipt.json', receipt)
        state['receipt_hashes'][str(job)] = common.digest(receipt)
        common.save_state(f.arm/'state.json', state)
        with self.assertRaisesRegex(common.Invalid, 'not main research'):
            self.migrate()
        self.assertFalse((f.destination/'MIGRATION_FINISHED.json').exists())

    def test_changed_protected_seed_stops_before_any_successor_is_created(self):
        f = self.fixture
        source = f.workspace/'MathGKM/HarnessFixture.lean'
        source.write_text(source.read_text()+'\n-- changed protected source\n')
        with self.assertRaisesRegex(common.Invalid, 'protected arm seed'):
            self.migrate()
        self.assertFalse(f.destination.exists())


if __name__ == '__main__':
    unittest.main()
