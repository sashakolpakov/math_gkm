"""Use the strengthened exact-root verifier with explicit workspace binding.

The legacy source-to-root and independent correspondence requirements are not
weakened. Fixture transport cannot resolve mathematics, even with a fake audit.
"""
import argparse
from pathlib import Path
import time
from . import completion
from .study_common import Invalid, read, write, canonical, lock, digest
from .study import Arm, verify
from .study_transfer import sandbox_prefix, dependency_paths

def check(arm, claim, audit=None):
    if arm.p['transport'] == 'fixture':
        return {'resolved': False, 'rejection': 'fixture can never resolve mathematics'}
    seconds = arm.p['validation_seconds']
    key = digest({'claim': claim, 'audit': audit, 'round': arm.s['round']})
    directory = arm.root/'completion'/key
    if (directory/'result.json').exists():
        result = read(directory/'result.json')
        # A result file is written during validation too. Only a finished exact
        # bundle may be reused, and resolution survives recovery.
        if 'finished' not in result:
            raise Invalid('interrupted completion validation; never replayed')
        old_root = completion.ROOT
        try:
            completion.ROOT = arm.workspace
            if completion.prepare(read(arm.workspace/'contract.json'), claim)['bundle_hash'] != result.get('bundle_hash'):
                raise Invalid('completion bundle changed since checked receipt')
        finally:
            completion.ROOT = old_root
        if result['resolved']:
            arm.s.update(resolution=result, status='mathematically_resolved')
            arm.s['resolution_receipt'] = str((directory/'result.json').relative_to(arm.study))
            arm.save()
            terminal(arm)
        return result
    if directory.exists():
        raise Invalid('interrupted completion validation; new independently reviewed attempt required')
    arm.reserve('completion-'+key, seconds)
    directory.mkdir(parents=True)
    start = time.monotonic()
    old_root, old_run = completion.ROOT, completion.run
    prefix = sandbox_prefix(directory, dependency_paths(arm.workspace))
    def bounded(argv, **kwargs):
        remaining = seconds - (time.monotonic()-start)
        if remaining <= 0:
            raise completion.Rejected('failure within completion validation budget')
        kwargs['timeout'] = min(kwargs['timeout'], remaining)
        kwargs['env'] = {**kwargs['env'], 'TMPDIR': str(directory)}
        return old_run(prefix+argv, **kwargs)
    try:
        completion.ROOT = arm.workspace
        completion.run = bounded
        result = completion.verify(read(arm.workspace/'contract.json'), claim, directory,
                                   audit=audit, stop=arm.stopped)
    finally:
        completion.ROOT, completion.run = old_root, old_run
    if result['resolved']:
        arm.s['resolution'] = result
        arm.s['resolution_receipt'] = str((directory/'result.json').relative_to(arm.study))
        arm.s['status'] = 'mathematically_resolved'
        arm.save()
        terminal(arm)
    return result


def terminal(arm):
    from .study_common import snapshot
    from .study_observer import checkpoint
    target = arm.root/'snapshots/terminal'
    if not target.exists():
        snapshot(arm.workspace, target, arm.s['research']['policy'], arm.admitted(arm.s['research']))
    checkpoint(arm.study, arm.mode, 'terminal', arm.s, target)

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--study', type=Path, required=True)
    p.add_argument('--arm', choices=['baseline', 'exploration'], required=True)
    p.add_argument('--claim', type=Path, required=True)
    p.add_argument('--audit', type=Path)
    a = p.parse_args()
    directory = a.study.resolve()
    verify(directory)
    with lock(directory/'controller.lock') as fd:
        result = check(Arm(directory, a.arm, fd), read(a.claim), read(a.audit) if a.audit else None)
    print(canonical(result))

if __name__ == '__main__':
    main()
