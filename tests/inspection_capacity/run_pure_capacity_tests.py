"""Portable offline fixtures; outputs go to a fresh TMPDIR child, never sources."""
import importlib.util
import io
import json
import os
from pathlib import Path
import shutil
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

HOME = Path(__file__).resolve().parent


def resolve_repo():
    root = Path(os.environ.get('MATH_GKM_CAPACITY_REPO', os.getcwd())).expanduser().resolve()
    if not (root/'machinery/study_common.py').is_file() or not (root/'lean-toolchain').is_file():
        raise RuntimeError('Set MATH_GKM_CAPACITY_REPO or run from a repository with machinery/study_common.py and lean-toolchain')
    return root


def main():
    repo = resolve_repo()
    sys.dont_write_bytecode = True
    sys.path.insert(0, str(repo))
    import machinery
    overlay = os.environ.get('MATH_GKM_CAPACITY_STAGE')
    paths = [str(repo/'machinery')]
    if overlay:
        stage = Path(overlay).expanduser().resolve()
        for name in ('proof_audit.py','inspection_stream.py','own_feedback.py'):
            if not (stage/'machinery'/name).is_file(): raise RuntimeError('Incomplete explicit capacity overlay')
        paths.insert(0, str(stage/'machinery'))
    machinery.__path__ = paths
    import tests
    tests.__path__ = [str(repo/'tests')]
    outputs = Path(tempfile.mkdtemp(prefix='math-gkm-capacity-pure-'))
    scratch = outputs/'scratch'; scratch.mkdir()
    tempfile.tempdir = str(scratch)
    fixtures = outputs/'fixtures'
    (fixtures/'.scratch').mkdir(parents=True)
    (fixtures/'local.scratch').mkdir()

    def load(name, filename):
        candidates = [HOME/filename, HOME/'tests'/filename, repo/'tests'/filename]
        path = next((p for p in candidates if p.is_file()), None)
        if path is None: raise RuntimeError('Missing reviewed test source: '+filename)
        spec = importlib.util.spec_from_file_location(name,path)
        module = importlib.util.module_from_spec(spec); sys.modules[name] = module
        spec.loader.exec_module(module)
        if hasattr(module,'ROOT'): module.ROOT = fixtures
        return module

    compact = load('tests.test_inspection011','test_inspection011.py')
    entrypoints = load('tests.test_inspection012','test_inspection012.py')
    deployment = load('tests.test_deployment_receipt_reuse','test_deployment_receipt_reuse.py')
    cache = load('tests.test_snapshot_catalog_cache','test_snapshot_catalog_cache.py')
    capacity = load('tests.test_inspection_capacity','test_inspection_capacity.py')
    classes = [compact.Compact011,compact.Feedback011,entrypoints.Entrypoints012,
               deployment.DeploymentReuse,cache.FrozenCatalogCache,
               capacity.EdgeCapacity,capacity.CompletionBindings]
    suite = unittest.TestSuite(unittest.defaultTestLoader.loadTestsFromTestCase(c) for c in classes)
    text = io.StringIO(); start = time.monotonic()
    try:
        with patch('subprocess.Popen',side_effect=AssertionError('pure fixture must not launch external processes')):
            result = unittest.TextTestRunner(stream=text,verbosity=2).run(suite)
        summary = dict(scope='offline synthetic parser/source/feedback/receipt/cache/deployment fixtures; no Lean/model/native probe',
            tests_run=result.testsRun,failures=len(result.failures),errors=len(result.errors),skips=len(result.skipped),
            passed=result.wasSuccessful() and not result.skipped,elapsed_seconds=time.monotonic()-start,
            neutral_producer_controls_executed=False,subprocess_launches=0,
            bootstrap_provenance='Initial pre-portability runner bootstrap stopped before tests on namespace __path__.insert; list overlay corrected that runner only.')
        (outputs/'PURE_TESTS.log').write_text(text.getvalue())
        (outputs/'PURE_TEST_RESULT.json').write_text(json.dumps(summary,indent=2,sort_keys=True)+'\n')
        print(text.getvalue()); print(json.dumps(summary,indent=2,sort_keys=True))
        print('RESULT_DIRECTORY', outputs)
        return 0 if summary['passed'] else 1
    finally:
        shutil.rmtree(scratch); shutil.rmtree(fixtures)


if __name__ == '__main__':
    raise SystemExit(main())
