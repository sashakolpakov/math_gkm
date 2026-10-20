"""Exact deployment receipt reuse fixtures. No models, Lean or native probes."""
import copy
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import study_deployment as deployment
from machinery import resources
from machinery.study_common import Invalid, digest, read, sha, write


class DeploymentReuse(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='math-gkm-deployment-reuse-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.directory = self.root/'preflight'
        self.identity = {
            'source_hashes': {'machinery/fixture.py': 'source'},
            'binary_hashes': {'/fixture/lean': 'lean', '/fixture/leanchecker': 'checker'},
            'dependency_identity': {'fixture': 'pinned compiled objects'},
            'implementation_hashes': {'fixture': 'implementation'},
            'resource_profile': {'fixture': 'unchanged resource profile'},
        }
        self.report = {'ready': True, 'neutral': True, **self.identity}
        write(self.directory/'neutral-evidence.json', {'fixture_only': True})
        write(self.directory/'result.json', self.report)
        self.bind()
        self.root_patch = patch.object(deployment, 'ROOT', self.root)
        self.root_patch.start()
        self.addCleanup(self.root_patch.stop)

    def bind(self):
        files = {str(p.relative_to(self.directory)): sha(p)
                 for p in self.directory.rglob('*') if p.is_file() and p.name != 'receipt.json'}
        write(self.directory/'receipt.json', {
            'ready': True, 'files': files, 'files_binding': digest(files),
            'result_sha256': sha(self.directory/'result.json'),
        })
        self.binding = {'ready': True, 'receipt': str(self.directory/'receipt.json'),
                        'receipt_sha256': sha(self.directory/'receipt.json')}

    def reuse(self, identity=None, observation=None):
        with patch.object(deployment, 'deployment_identity', return_value=identity or self.identity), \
             patch.object(resources, 'headroom', return_value=observation or {'fixture': 'fresh headroom'}) as guard, \
             patch.object(deployment, 'preflight', side_effect=AssertionError('controls must not replay')), \
             patch.object(deployment, 'run', side_effect=AssertionError('no process execution')):
            result = deployment.reuse_deployment(self.binding)
        return result, guard

    def test_exact_receipt_reuse_still_checks_fresh_headroom(self):
        result, guard = self.reuse()
        self.assertTrue(result['ready'])
        self.assertTrue(result['reused'])
        self.assertEqual(result['identity_sha256'], digest(self.identity))
        self.assertEqual(result['receipt_sha256'], self.binding['receipt_sha256'])
        self.assertEqual(result['resource_observation'], {'fixture': 'fresh headroom'})
        guard.assert_called_once_with(resources.limits())

    def test_every_current_identity_field_must_match(self):
        for field in self.identity:
            with self.subTest(field=field):
                changed = copy.deepcopy(self.identity)
                changed[field] = {'fixture': 'changed'}
                with self.assertRaisesRegex(Invalid, field):
                    self.reuse(changed)

    def test_legacy_receipt_without_complete_identity_is_ineligible(self):
        del self.report['resource_profile']
        write(self.directory/'result.json', self.report)
        self.bind()
        with self.assertRaisesRegex(Invalid, 'resource_profile'):
            self.reuse()

    def test_mutated_neutral_artifact_is_rejected_before_headroom(self):
        write(self.directory/'neutral-evidence.json', {'fixture_only': 'changed'})
        with patch.object(resources, 'headroom') as guard:
            with self.assertRaisesRegex(Invalid, 'artifact changed'):
                self.reuse()
            guard.assert_not_called()

    def test_mutated_result_is_rejected(self):
        write(self.directory/'result.json', {**self.report, 'neutral': False})
        with self.assertRaisesRegex(Invalid, 'artifact changed'):
            self.reuse()

    def test_mutated_receipt_is_rejected(self):
        receipt = read(self.directory/'receipt.json')
        write(self.directory/'receipt.json', {**receipt, 'ready': False})
        with self.assertRaisesRegex(Invalid, 'receipt binding changed'):
            self.reuse()

    def test_failed_preflight_binding_is_rejected(self):
        self.binding['ready'] = False
        with self.assertRaisesRegex(Invalid, 'missing successful'):
            self.reuse()

    def test_path_outside_workspace_is_rejected(self):
        with patch.object(deployment, 'ROOT', self.root/'different-root'):
            with self.assertRaisesRegex(Invalid, 'receipt binding changed'):
                self.reuse()

    def test_resource_admission_failure_is_not_replaced_with_success(self):
        with patch.object(deployment, 'deployment_identity', return_value=self.identity), \
             patch.object(resources, 'headroom', side_effect=resources.ResourceFailure('fixture low memory')):
            with self.assertRaisesRegex(resources.ResourceFailure, 'low memory'):
                deployment.reuse_deployment(self.binding)

    def test_cleanup_hold_failure_is_not_replaced_with_success(self):
        with patch.object(deployment, 'deployment_identity', return_value=self.identity), \
             patch.object(resources, 'headroom', side_effect=resources.ResourceFailure('unresolved_owned_cleanup_hold')):
            with self.assertRaisesRegex(resources.ResourceFailure, 'cleanup_hold'):
                deployment.reuse_deployment(self.binding)

    def test_identity_collection_binds_sources_binaries_dependencies_and_profile(self):
        machinery = self.root/'machinery'
        machinery.mkdir()
        (machinery/'fixture.py').write_text('# neutral fixture\n')
        lean = self.root/'lean'; lean.write_bytes(b'fixture lean')
        checker = self.root/'leanchecker'; checker.write_bytes(b'fixture checker')
        with patch.object(deployment, 'LEAN', lean), patch.object(deployment, 'CHECKER', checker), \
             patch.object(deployment, 'dependency_identity', return_value={'fixture': 'deps'}), \
             patch.object(deployment, 'implementation', return_value={'fixture': 'impl'}), \
             patch.object(resources, 'profile_identity', return_value={'fixture': 'profile'}):
            identity = deployment.deployment_identity()
        self.assertEqual(identity, {
            'source_hashes': {'machinery/fixture.py': sha(machinery/'fixture.py')},
            'binary_hashes': {str(lean): sha(lean), str(checker): sha(checker)},
            'dependency_identity': {'fixture': 'deps'},
            'implementation_hashes': {'fixture': 'impl'},
            'resource_profile': {'fixture': 'profile'},
        })


if __name__ == '__main__':
    unittest.main()
