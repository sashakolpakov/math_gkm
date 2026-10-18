"""Actual wrapped neutral Mathlib/root-catalog smoke; never research or a model.

Run from the candidate root under tools/run.py for an outer watchdog. No mock,
unwrapped fallback, downloads, root correspondence approval or source edits.
"""
from pathlib import Path
import argparse
import sys
import time
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parents[4]))
from machinery.study_common import (ROOT, Invalid, dependencies, digest, read,
                                    sha, snapshot, write)
from machinery.study_transfer import catalog_snapshot, dependency_paths
from tests.test_revision_static_checkpoint import neutral_contract


def smoke(directory, seconds):
    directory = directory.resolve()
    if (not directory.is_relative_to(ROOT/'.scratch') or directory.exists() or
            type(seconds) is not int or not 30 <= seconds <= 600):
        raise Invalid('fresh .scratch output and 30..600 seconds required')
    directory.mkdir(parents=True)
    started = time.monotonic()
    report = {'schema': 'math-gkm.neutral-mathlib-catalog-smoke.v1', 'ready': False,
              'hosted_model_calls': 0, 'budget_seconds': seconds,
              'scope': 'actual wrapped neutral catalog only; host refinement and continuation proof open'}
    try:
        sources = sorted((ROOT/'machinery').glob('*.py')) + [
            ROOT/'MathGKM/HarnessFixture.lean', ROOT/'MathGKM/ResearchSemantics.lean',
            ROOT/'tests/test_revision_static_checkpoint.py', Path(__file__).resolve()]
        hashes = {str(p.relative_to(ROOT)): sha(p) for p in sources}
        report['source_hashes'] = hashes
        seed = directory/'seed'
        (seed/'MathGKM').mkdir(parents=True)
        names = ['MathGKM/HarnessFixture.lean', 'MathGKM/ResearchSemantics.lean']
        for name in names:
            (seed/name).write_bytes((ROOT/name).read_bytes())
        # This neutral import forces all pinned package search paths. Its simple
        # identity carries no new mathematical claim or research-root content.
        probe = 'MathGKM/DeploymentMathlib.lean'
        (seed/probe).write_text('import Mathlib.Data.Nat.Basic\n'
            'import MathGKM.HarnessFixture\nimport MathGKM.ResearchSemantics\n'
            'theorem MathGKM.DeploymentMathlib.identity (n : Nat) : n = n := rfl\n')
        names.append(probe)
        contract = neutral_contract()
        write(seed/'contract.json', contract)
        write(seed/'seed-files.json', names)
        dependencies(seed)
        frozen = directory/'snapshot'
        manifest = snapshot(seed, frozen, {}, names)
        reservations = []
        remaining = seconds-(time.monotonic()-started)
        if remaining <= 0:
            raise Invalid('smoke budget exhausted during setup')
        arm = SimpleNamespace(study=directory,
            p={'transport': 'live', 'validation_seconds': remaining},
            reserve=lambda key, cap: reservations.append({'key': key, 'seconds': cap}),
            stopped=lambda: False)
        result = catalog_snapshot(arm, frozen, manifest, directory/'catalog', 'neutral-mathlib')
        report.update(catalog=result, reservations=reservations,
                      contract=contract, snapshot_binding=manifest['binding'])
        expected_deps = list(map(str, dependency_paths(seed)))
        catalog = {item['name'] for d in result.get('declarations', []) for item in d.get('catalog', [])}
        required_names = {'MathGKM.HarnessFixture.Root', 'MathGKM.DeploymentMathlib.identity'}
        if (not result.get('checked') or result.get('validation_mode') != 'deployed_sandbox' or
                result.get('dependency_paths') != expected_deps or len(expected_deps) < 2 or
                not required_names <= catalog or
                not {'compile', 'kernel_replay', 'trusted_premise_inspection'} <=
                    {c['operation'] for c in result.get('checks', [])} or
                not all(c['argv'][0] == '/usr/bin/sandbox-exec' and c['returncode'] == 0
                        and not c['termination'] for c in result.get('checks', []))):
            raise Invalid('actual full-dependency catalog/replay/inspection not established')
        if read(seed/'contract.json') != neutral_contract() or any(sha(ROOT/n) != h for n, h in hashes.items()):
            raise Invalid('source or unchanged neutral contract drift')
        if time.monotonic()-started > seconds:
            raise Invalid('smoke total budget exhausted')
        report['ready'] = True
    except (Invalid, OSError, KeyError, ValueError, TypeError) as exc:
        report['failure'] = type(exc).__name__+': '+str(exc)
    report['elapsed_seconds'] = time.monotonic()-started
    write(directory/'result.json', report)
    files = {str(p.relative_to(directory)): sha(p) for p in directory.rglob('*')
             if p.is_file() and not p.is_symlink() and '.lake' not in p.relative_to(directory).parts}
    write(directory/'receipt.json', {'ready': report['ready'], 'files': files,
                                    'files_binding': digest(files)})
    return report


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--seconds', type=int, default=600)
    args = parser.parse_args()
    result = smoke(args.out, args.seconds)
    print('READY' if result['ready'] else 'FAILED', args.out/'result.json')
    sys.exit(0 if result['ready'] else 1)
