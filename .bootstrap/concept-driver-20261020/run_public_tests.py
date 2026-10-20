"""Portable, deterministic concept-harness tests: no models or Lean execution.

Uses Python's standard library and synthetic receipts/objects. The live research
runtime and real Lean protocol integration have separate host/pin requirements.
"""
import importlib.util
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[2]
OPS = Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
MODULES = ('tests.test_study_concepts','tests.test_study_research_feedback',
           'tests.test_snapshot_catalog_cache','tests.test_curator_task_limits',
           'tests.test_deployment_receipt_reuse')


def load_file(name,path):
    specification = importlib.util.spec_from_file_location(name,path)
    module = importlib.util.module_from_spec(specification)
    specification.loader.exec_module(module)
    return module


def main():
    (ROOT/'.scratch').mkdir(exist_ok=True)
    suite = unittest.TestSuite()
    loader = unittest.defaultTestLoader
    for name in MODULES:
        suite.addTests(loader.loadTestsFromName(name))
    for name,path in (('public_launch_fixtures',OPS/'test_launch.py'),
                      ('public_monitor_fixtures',OPS/'monitor30m/test_monitor.py')):
        suite.addTests(loader.loadTestsFromModule(load_file(name,path)))
    result = unittest.TextTestRunner(verbosity=2).run(suite)
    print('Synthetic controller evidence only; models=0, Lean processes=0, research campaigns=0.')
    return 0 if result.wasSuccessful() else 1


if __name__ == '__main__':
    raise SystemExit(main())
