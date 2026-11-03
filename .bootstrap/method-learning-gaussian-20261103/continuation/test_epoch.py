"""Synthetic closed-epoch lifecycle tests; no models, compilers or proofs.

The genuine native freeze/verify/source snapshot APIs run. Validation outcomes
are explicitly simulated to exercise host preservation, not mathematical truth.
"""
import copy
import importlib.util
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from machinery import study, study_common as common, snapshot_routing
from tests.test_revision_static_checkpoint import neutral_contract

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('gaussian_epoch_under_test', HERE/'epoch.py')
epoch = importlib.util.module_from_spec(spec); spec.loader.exec_module(epoch)
PRIVATE = 'PRIVATE_EVALUATOR_NO_WORKSPACE'


def task(name, scope):
    return {'id': name, 'kind': 'holdout', 'evaluation_scope': scope,
        'statement': 'True', 'hypotheses': [], 'scope': 'Synthetic neutral application.',
        'source_sha256': neutral_contract()['root_sha256'],
        'interface_type': 'True', 'transport_type': 'True', 'required_constants': []}


def make_fixture(base, *, pending_method=True):
    """Construct a closed neutral study; callers patch dependency/receipt APIs."""
    base = Path(base)
    contract = neutral_contract()
    contract_path = base/'contract.json'; common.write(contract_path, contract)
    profile = {'rounds': 2, 'episode_rounds': 2, 'call_seconds': 1,
        'adaptation_seconds': 1, 'validation_seconds': 1,
        'arm_seconds': 10000, 'max_calls': 64, 'meta_calls': 32, 'policy_trials': 0,
        'method_learning': {'enabled': True, 'repetitions': 2, 'max_methods_per_review': 1,
            'max_methods': 16, 'holdout_tasks': 1, 'regression_limit': 1}}
    source_suite = {'schema': 'math-gkm.suite.v2', 'selector': 'independent synthetic selector',
        'selection_basis': 'Neutral experiment fixtures only.', 'independent': True,
        'tasks': [task('old-method', 'method'), task('old-assess', 'assessment'), task('old-final', 'final')]}
    parent = base/'parent'
    study.freeze(parent, profile, source_suite, contract)
    arm = parent/'arms/exploration'; workspace = arm/'workspace'
    state = common.load_state(arm/'state.json')
    source = workspace/'MathGKM/EpochClaim.lean'
    source.write_text('namespace Epoch\ntheorem claim : True := True.intro\nend Epoch\n')
    (workspace/'research/method.md').write_text('Own neutral method notes.')
    history = workspace/'history/objects'; history.mkdir(parents=True)
    (history/'a').write_text('Own immutable history.')
    validator = arm/'rounds/0000/checks/fake'
    common.write(validator/'source/evidence.json', {'kind': 'SYNTHETIC receipt fixture'})
    result = {'checked': True, 'classification': 'SYNTHETIC validation outcome'}
    common.write(validator/'FINISHED.json', {'files': {
        'source/evidence.json': common.sha(validator/'source/evidence.json')}})
    record = {'id': 'neutral-claim', 'kind': 'mathematical_claims',
        'proposal_hash': 'd'*64, 'receipt_hash': common.digest(result),
        'proposal': {'id': 'neutral-claim', 'module': 'MathGKM.EpochClaim', 'statement': 'True', 'term': 'Epoch.claim'},
        'task': {'id': 'neutral-claim', 'statement': 'True', 'hypotheses': [], 'required_constants': []},
        'solution': {'module': 'MathGKM.EpochClaim', 'term': 'Epoch.claim'},
        'source_files': {'MathGKM/EpochClaim.lean': common.sha(source)},
        'exports': ['Epoch.claim'], 'export_module': 'MathGKM.EpochClaim',
        'validation_bundle': {'directory': str(validator), 'finished_sha256': common.sha(validator/'FINISHED.json')}}
    state['research']['knowledge']['neutral-claim'] = record
    state['research']['method_plans']['epoch-method'] = {'id': 'epoch-method',
        'predictions': [{'consequence_id': 'neutral-prediction', 'statement': 'True'}],
        'reference': 'a'*64, 'start_round': 0}
    for index, role, elapsed in [('plan-0000', 'proposer', 2), ('round-0000', 'researcher', 5)]:
        job = arm/'jobs'/index
        spec = {'role': role, 'workspace': str(workspace), 'request_id': index}
        receipt = {'role': role, 'outcome': 'completed', 'request_id': index, 'elapsed_seconds': elapsed,
                   'payload': {'classification': 'SYNTHETIC own research'}}
        common.write(job/'spec.json', spec); common.write(job/'receipt.json', receipt)
        common.write(job/'request.json', {'role': role, 'synthetic': True})
        state['receipts'].append(str(job)); state.setdefault('counted_jobs', []).append(index)
        state['receipt_hashes'][str(job)] = common.digest(receipt)
    for r in (0, 1):
        common.snapshot(workspace, arm/'snapshots'/f'round-{r:04d}', state['research']['policy'],
                        [n for n in common.read(parent/'seed/seed-files.json') if n.endswith('.lean')]+['MathGKM/EpochClaim.lean'])
    initial = common.verify_snapshot(arm/'snapshots/initial')
    after = common.verify_snapshot(arm/'snapshots/round-0001')
    proposal = {'id': 'epoch-method', 'accepted_ids': ['neutral-claim'],
        'application_notes': ['research/method.md'], 'goal_connection': 'Synthetic fixture only.',
        'predictions': [{'consequence_id': 'neutral-prediction', 'accepted_id': 'neutral-claim'}]}
    binding = {'schema': 'math-gkm.method-acquisition.v1', 'proposal': proposal,
        'before': initial['binding'], 'after': after['binding'], 'concept_reference': None,
        'prediction_ids': ['neutral-prediction'], 'prediction_statements': {'neutral-prediction': 'True'}}
    reference = common.digest(binding)
    method = arm/'method-learning'/reference
    cm = common.snapshot(workspace, method/'candidate', state['research']['policy'], after['admitted_modules'])
    prepared = {'schema': 'math-gkm.method-acquisition.v1', 'reference': reference,
        'method_id': 'epoch-method', 'before': initial['binding'], 'candidate': cm['binding'],
        'before_path': str((arm/'snapshots/initial').resolve()),
        'candidate_path': str((method/'candidate').resolve()), 'required_exports': ['Epoch.claim'],
        'commitment': binding, 'selected_admissions': {'neutral-claim': {'receipt_hash': record['receipt_hash'],
            'exports': record['exports'], 'source_files': record['source_files'], 'export_module': record['export_module']}},
        'additions': {'MathGKM/EpochClaim.lean': common.sha(source)},
        'prediction_checks': [{'consequence_id': 'neutral-prediction', 'accepted_id': 'neutral-claim',
                               'status': 'statement_binding_pending'}]}
    common.write(method/'prepared.json', prepared); common.write(method/'commitment.json', binding)
    review = arm/'method-learning/reviews/2.json'; common.write(review, [{'private': PRIVATE}])
    common.write(arm/'method-learning/identities.json', {'epoch-method': reference, 'completed-old': 'c'*64})
    common.write(arm/'method-learning'/('c'*64)/'result.json', {'private': PRIVATE})
    common.write(arm/'method-learning/holdout-use.json', {'source_suite': 'b'*64, 'reservations': {}})
    common.write(arm/'method-learning/application-pool.json', {'schema': 'math-gkm.method-acquisition.v1',
        'entries': [{'task': task('repeat', 'method'), 'origin_method': 'c'*64, 'comparison_binding': 'e'*64}], 'cursor': 0})
    state['method_learning'] = {'pending': ([{'prepared': prepared, 'start_round': 0, 'end_round': 2, 'due_round': 2}]
        if pending_method else []), 'submitted': {'epoch-method': reference, 'completed-old': 'c'*64},
        'reviews': {'2': {'path': 'method-learning/reviews/2.json', 'sha256': common.sha(review)}}}
    state.update(round=2, phase='research', status='finite_budget_finished; root_open',
                 reviewed_rounds=[2], calls=2, meta_calls=1, seconds=1234.0)
    common.save_state(arm/'state.json', state)
    curation = base/'new-curation'
    fresh_suite = {**source_suite, 'tasks': [task('new-method', 'method'), task('new-assess', 'assessment'), task('new-final', 'final')]}
    common.write(curation/'suite.json', fresh_suite)
    common.write(curation/'provenance.json', {'classification': 'SYNTHETIC fixture, never live curation'})
    return SimpleNamespace(parent=parent, destination=base/'successor', profile=profile,
        contract_path=contract_path, curation=curation, arm=arm, workspace=workspace,
        state=state, record=record, result=result, prepared=prepared, suite=fresh_suite)


class EpochFixtures(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='gaussian-epoch-', dir=common.ROOT/'.scratch')
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name)
        patches = [patch('machinery.study.dependency_identity', return_value={'fixture': 'fixed'}),
                   patch.object(epoch, 'headroom'), patch.object(epoch.knowledge, 'verify_record'),
                   patch.object(epoch, 'reuse', return_value={'checked': True, 'classification': 'SYNTHETIC validation outcome'})]
        for item in patches:
            item.start(); self.addCleanup(item.stop)
        self.fixture = make_fixture(self.base)

    def migrate(self, **kwargs):
        f = self.fixture
        return epoch.migrate(f.parent, kwargs.pop('destination', f.destination),
            curation=f.curation, profile=kwargs.pop('profile', f.profile),
            contract_path=f.contract_path, **kwargs)

    def test_closed_epoch_preserves_theory_methods_costs_and_original_predecessor(self):
        f = self.fixture
        old_hash = common.sha(f.arm/'state.json')
        result = self.migrate()
        self.assertEqual((result['start_round'], result['end_round']), (2, 4))
        state = common.load_state(f.destination/'arms/exploration/state.json')
        self.assertEqual(state['round'], 2)
        self.assertEqual(state['calls'], 0)
        self.assertEqual(state['seconds'], 0)
        self.assertEqual(len(state['receipts']), 2)
        self.assertEqual(state['research']['method_plans'], f.state['research']['method_plans'])
        self.assertEqual(state['research']['knowledge']['neutral-claim']['receipt_hash'], f.record['receipt_hash'])
        self.assertEqual(common.sha(f.arm/'state.json'), old_hash)
        old_initial = common.verify_snapshot(f.arm/'snapshots/initial')
        new_initial = common.verify_snapshot(f.destination/'arms/exploration/snapshots/initial')
        self.assertEqual(old_initial['binding'], new_initial['binding'])
        epoch_start = common.verify_snapshot(f.destination/'arms/exploration/snapshots/epoch-start')
        self.assertIn('MathGKM/EpochClaim.lean', epoch_start['files'])
        self.assertNotIn('MathGKM/EpochClaim.lean', new_initial['files'])
        queue = state['method_learning']; prepared = queue['pending'][0]['prepared']
        self.assertEqual(prepared['reference'], f.prepared['reference'])
        self.assertEqual(prepared['before'], old_initial['binding'])
        self.assertTrue(Path(prepared['before_path']).is_relative_to(f.destination/'arms/exploration'))
        self.assertTrue(Path(prepared['candidate_path']).is_relative_to(f.destination/'arms/exploration'))
        provenance = common.read(result['provenance_path'])
        self.assertEqual(provenance['old_accounting']['seconds'], 1234)
        self.assertIn('after acquisition', provenance['method_panel_chronology'])
        self.assertFalse((f.destination/'arms/exploration/method-learning/holdout-use.json').exists())
        self.assertEqual(queue['submitted'], f.state['method_learning']['submitted'])
        self.assertFalse((f.destination/'arms/exploration/method-learning'/('c'*64)).exists())
        self.assertTrue((f.arm/'method-learning'/('c'*64)/'result.json').exists())
        self.assertEqual(common.read(f.destination/'arms/exploration/method-learning/reviews/2.json'), [{'private': PRIVATE}])
        for path in (f.destination/'arms/exploration/workspace').rglob('*'):
            if path.is_file() and not path.is_symlink() and '.lake' not in path.parts:
                self.assertNotIn(PRIVATE, path.read_text())
        self.assertTrue((f.destination/'MIGRATION_FINISHED.json').exists())

    def test_epoch_start_has_fresh_asof_capture_not_retroactive_initial(self):
        result = self.migrate()
        arm = Path(result['study'])/'arms/exploration'
        seal = common.read(arm/'snapshots/epoch-start/routing-seal.json')
        current = common.load_state(arm/'state.json')
        self.assertEqual(seal['research_state_sha256'], common.digest(current['research']))
        self.assertIn('neutral-claim', seal['asof_formal_ledger']['knowledge'])
        self.assertEqual(common.read(Path(result['study'])/'audit/plan.json')['checkpoints'][1], 'epoch-start')

    def test_copy_is_not_a_writable_inode_alias(self):
        self.migrate()
        original = self.fixture.workspace/'research/method.md'
        copied = self.fixture.destination/'arms/exploration/workspace/research/method.md'
        self.assertNotEqual(original.stat().st_ino, copied.stat().st_ino)
        copied.write_text('Changed new own notes.')
        self.assertEqual(original.read_text(), 'Own neutral method notes.')

    def test_partially_started_method_is_not_retargeted_to_fresh_panel(self):
        f = self.fixture
        common.write(f.arm/'method-learning'/f.prepared['reference']/'suite.json', {'old_panel': PRIVATE})
        with self.assertRaisesRegex(common.Invalid, 'partially started'):
            self.migrate()
        self.assertFalse(f.destination.exists())

    def test_changed_contract_or_active_parent_rejected_without_new_epoch(self):
        f = self.fixture
        state = common.load_state(f.arm/'state.json'); state['active'] = 'not-a-live-test-handle'
        common.save_state(f.arm/'state.json', state)
        with self.assertRaisesRegex(common.Invalid, 'active or resolved'):
            self.migrate()
        self.assertFalse(f.destination.exists())

    def test_repeated_destination_is_not_overwritten_or_restarted(self):
        self.migrate()
        before = common.sha(self.fixture.destination/'MIGRATION_FINISHED.json')
        with self.assertRaisesRegex(common.Invalid, 'fresh own'):
            self.migrate()
        self.assertEqual(common.sha(self.fixture.destination/'MIGRATION_FINISHED.json'), before)

    def test_original_cost_development_receipts_remain_available_once(self):
        self.migrate()
        state = common.load_state(self.fixture.destination/'arms/exploration/state.json')
        self.assertEqual(sum(common.read(Path(p)/'receipt.json')['elapsed_seconds'] for p in state['receipts']), 7)
        self.assertEqual(len(state['counted_jobs']), len(set(state['counted_jobs'])))
        self.assertEqual(state['calls'], 0)

    def test_pending_discovery_core_and_original_dependency_survive_two_hops(self):
        f = self.fixture
        job = f.arm/'jobs/pending-source'
        common.write(job/'spec.json', {'role': 'researcher', 'workspace': str(f.workspace)})
        receipt = {'role': 'researcher', 'outcome': 'completed', 'elapsed_seconds': 3,
                   'payload': {'classification': 'SYNTHETIC pending discovery'}}
        common.write(job/'receipt.json', receipt)
        common.write(job/'request.json', {'role': 'researcher', 'synthetic': True})
        core = {'origin': {'arm': 'exploration', 'trial': 'synthetic', 'side': 'candidate',
            'round': 0, 'job_key': 'pending-source', 'receipt_sha256': common.sha(job/'receipt.json'),
            'spec_sha256': common.sha(job/'spec.json')},
            'kind': 'mathematical_claims', 'proposal': copy.deepcopy(f.record['proposal']),
            'record': copy.deepcopy(f.record), 'source_files': copy.deepcopy(f.record['source_files']),
            'status': 'pending_paid_main_recheck'}
        key = common.digest(core)
        source_paths = {}
        for name, expected in core['source_files'].items():
            relative = 'inbox/discoveries/'+key+'/source/'+name
            destination = f.workspace/relative; destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_bytes((f.workspace/name).read_bytes())
            self.assertEqual(common.sha(destination), expected)
            source_paths[name] = relative
        entry = {'binding': key, 'core': core, 'source_paths': source_paths,
                 'manifest': 'inbox/discoveries/'+key+'/manifest.json', 'status': core['status']}
        common.write(f.workspace/entry['manifest'], entry)
        state = common.load_state(f.arm/'state.json')
        state['research']['pending_discoveries'] = {key: entry}
        state['receipts'].append(str(job)); state['receipt_hashes'][str(job)] = common.digest(receipt)
        state.setdefault('counted_jobs', []).append('pending-source')
        common.save_state(f.arm/'state.json', state)
        with patch('machinery.validation_receipts.reuse', return_value=f.result):
            first = self.migrate()
            first_arm = f.destination/'arms/exploration'
            first_state = common.load_state(first_arm/'state.json')
            self.assertEqual(first_state['research']['pending_discoveries'][key]['core'], core)
            self.assertEqual(len(first_state['receipts']), 3)
            for r in (2, 3):
                common.snapshot(first_arm/'workspace', first_arm/'snapshots'/f'round-{r:04d}',
                    first_state['research']['policy'], study.Arm(f.destination, 'exploration', -1).admitted(first_state['research']))
            first_state.update(round=4, status='finite_budget_finished; root_open', phase='research',
                               reviewed_rounds=[2, 4])
            common.save_state(first_arm/'state.json', first_state)
            curation = self.base/'third-curation'
            third_suite = {**f.suite, 'tasks': [task('third-method', 'method'), task('third-assess', 'assessment'), task('third-final', 'final')]}
            common.write(curation/'suite.json', third_suite)
            common.write(curation/'provenance.json', {'classification': 'SYNTHETIC second continuation'})
            third = self.base/'third'
            final = epoch.migrate(f.destination, third, curation=curation,
                profile=f.profile, contract_path=f.contract_path)
            last = common.load_state(third/'arms/exploration/state.json')
            self.assertEqual(last['research']['pending_discoveries'][key]['core'], core)
            self.assertEqual(last['round'], 4)
            self.assertEqual(last['calls'], 0)
            self.assertEqual((final['start_round'], final['end_round']), (4, 6))
            self.assertTrue(Path(core['record']['validation_bundle']['directory']).exists())
            self.assertTrue((third/'arms/exploration/inherited/pending-validators'/key/'FINISHED.json').exists())
            self.assertEqual(common.verify_snapshot(third/'arms/exploration/snapshots/initial')['binding'],
                             common.verify_snapshot(f.arm/'snapshots/initial')['binding'])

    def test_serial_copy_fallback_preserves_bytes_and_separate_inode(self):
        source = self.base/'fallback-source.txt'; source.write_text('Neutral copy bytes.')
        destination = self.base/'fallback-copy.txt'
        with patch.object(epoch, 'clone_file', return_value=False):
            epoch.CopyBudget().file(source, destination, common.sha(source))
        self.assertEqual(source.read_bytes(), destination.read_bytes())
        self.assertNotEqual(source.stat().st_ino, destination.stat().st_ino)

    def test_private_adapter_context_cannot_enter_own_research_history(self):
        f = self.fixture
        import hashlib
        raw = (common.canonical({'role': 'adapter', 'private': PRIVATE})+'\n').encode()
        path = f.workspace/'history/context'/(hashlib.sha256(raw).hexdigest()+'.json')
        path.parent.mkdir(parents=True, exist_ok=True); path.write_bytes(raw)
        with self.assertRaisesRegex(common.Invalid, 'non-research context'):
            self.migrate()
        self.assertFalse((f.destination/'MIGRATION_FINISHED.json').exists())

    def test_changed_method_commitment_journal_is_not_inherited(self):
        f = self.fixture
        path = f.arm/'method-learning'/f.prepared['reference']/'commitment.json'
        corrupted = copy.deepcopy(f.prepared['commitment'])
        corrupted['prediction_statements']['neutral-prediction'] = 'False'
        common.write(path, corrupted)
        with self.assertRaisesRegex(common.Invalid, 'commitment journal changed'):
            self.migrate()
        self.assertFalse((f.destination/'MIGRATION_FINISHED.json').exists())
        self.assertEqual(common.read(path), corrupted)

    def test_an_old_panel_cannot_be_relabelled_as_fresh(self):
        f = self.fixture
        common.write(f.curation/'suite.json', common.read(f.parent/'evaluation/suite.json'))
        with self.assertRaisesRegex(common.Invalid, 'fresh independent'):
            self.migrate()
        self.assertFalse(f.destination.exists())

    def test_actual_native_verify_is_used_after_migration(self):
        self.migrate()
        study.verify(self.fixture.destination)
        source = self.fixture.destination/'arms/exploration/workspace/MathGKM/HarnessFixture.lean'
        source.write_text(source.read_text()+'\n-- changed seed\n')
        with self.assertRaisesRegex(common.Invalid, 'protected arm seed'):
            study.verify(self.fixture.destination)


if __name__ == '__main__':
    unittest.main()
