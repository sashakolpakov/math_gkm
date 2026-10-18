"""Synthetic acceptance-boundary tests only. No sandbox or deployment result."""
from pathlib import Path
import copy
import tempfile
import unittest
from host_mathlib_smoke import ROOT, accepted_catalog, dependency_paths


class CatalogBoundary(unittest.TestCase):
    def setUp(self):
        self.base = Path(tempfile.mkdtemp(dir=ROOT/'.scratch', prefix='host-smoke-unit-'))
        print('RETAINED', self.base, flush=True)
        self.deps = dependency_paths(ROOT)
        self.good = {'checked': True, 'validation_mode': 'deployed_sandbox',
            'dependency_paths': list(map(str, self.deps)),
            'declarations': [{'catalog': [{'name': n} for n in
                ('MathGKM.HarnessFixture.Root', 'MathGKM.DeploymentMathlib.identity')]}],
            'checks': [{'operation': op, 'argv': ['/usr/bin/sandbox-exec'], 'returncode': 0,
                        'termination': None} for op in ('compile', 'kernel_replay', 'trusted_premise_inspection')]}

    def test_different_workspace_aliases_bind_the_same_full_dependency_roots(self):
        aliases = []
        for i, dep in enumerate(self.deps):
            alias = self.base/str(i)
            alias.symlink_to(dep.resolve(), target_is_directory=True)
            aliases.append(str(alias))
        self.good['dependency_paths'] = aliases
        self.assertTrue(accepted_catalog(self.good, self.deps))

    def test_extra_or_replaced_dependency_root_is_rejected(self):
        for paths in (self.good['dependency_paths']+[str(self.base)],
                      self.good['dependency_paths'][:-1]+[str(self.base)]):
            result = {**self.good, 'dependency_paths': paths}
            self.assertFalse(accepted_catalog(result, self.deps))

    def test_unwrapped_missing_root_or_failed_replay_is_rejected(self):
        for kind in ('unwrapped', 'missing-root', 'failed-replay'):
            result = copy.deepcopy(self.good)
            if kind == 'unwrapped':
                result['validation_mode'] = 'unwrapped_fixture'
            elif kind == 'missing-root':
                result['declarations'][0]['catalog'] = result['declarations'][0]['catalog'][1:]
            else:
                result['checks'][1]['returncode'] = 1
            self.assertFalse(accepted_catalog(result, self.deps), kind)


if __name__ == '__main__':
    unittest.main(verbosity=2)
