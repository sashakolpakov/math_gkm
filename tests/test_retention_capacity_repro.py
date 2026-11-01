"""Run 32 frozen pure controls from any checkout; no live study/API inputs.
From the repository root: python3 -I -B -S tests/test_retention_capacity_repro.py -v
Only top-level STAGE fixture assignments are redirected; originals stay pinned.
"""
import ast
import hashlib
from pathlib import Path
import sys
import types
import unittest

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
OPS = ROOT / '.bootstrap/concept-driver-20261020/general-continuation'
NEW = OPS / 'retention-scan19-maintenance-20261024'
OLD = OPS / 'retention-scan20-20261024'
CASES = (
    (NEW / 'test_capacity_profile.py', NEW, 13,
     '83933b2a24dc9be5f0ee0c93ed47df9ff1e88923f6ca1e108b80a46f2dfe5c9b'),
    (NEW / 'core-only/test_source_controls.py', NEW / 'core-only', 6,
     '86a28249f4c03900e3cec16e19f1cd074f56ae12c7c1575efa22f8e304053af4'),
    (OLD / 'test_old100_terminal20.py', None, 8,
     '5794f5a58d890a602b24f0011f79007b5665d8422d809ef75e01eae6297015ab'),
    (NEW / 'collector-source-v2/test_collector_controls.py',
     NEW / 'collector-source-v2', 5,
     '823bf4797bec67aa09dbc147d511393239dcbe2af105b5d395aa05d20b87b08d'),
)

def pinned(path, expected):
    data = path.read_bytes()
    if hashlib.sha256(data).hexdigest() != expected:
        raise RuntimeError('Frozen test/source differs: ' + str(path))
    return data

def load_tests(loader, tests, pattern):
    pinned(OLD / 'old100_controls20.py',
           '61df7a5e607d24b6143c2f86fc93083830d0f501155a5fe310da7beb8800ce01')
    suite = unittest.TestSuite()
    for index, (path, stage, expected_count, expected_sha) in enumerate(CASES):
        tree = ast.parse(pinned(path, expected_sha), filename=str(path))
        stages = [node for node in tree.body if isinstance(node, ast.Assign)
                  and len(node.targets) == 1
                  and isinstance(node.targets[0], ast.Name)
                  and node.targets[0].id == 'STAGE']
        if len(stages) != (stage is not None):
            raise RuntimeError('Unexpected STAGE assignments: ' + str(path))
        if stage is not None:
            stages[0].value = ast.Call(func=ast.Name(id='Path', ctx=ast.Load()),
                                      args=[ast.Constant(str(stage))], keywords=[])
        module = types.ModuleType('retention_capacity_' + str(index))
        module.__file__ = str(path)  # Terminal tests import their sibling controls.
        exec(compile(ast.fix_missing_locations(tree), str(path), 'exec'), module.__dict__)
        group = loader.loadTestsFromModule(module)
        if group.countTestCases() != expected_count:
            raise RuntimeError('Unexpected test count: ' + str(path))
        suite.addTests(group)
    return suite

if __name__ == '__main__':
    unittest.main()
