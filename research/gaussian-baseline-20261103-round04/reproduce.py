#!/usr/bin/env python3
"""Recompile the archived sources and replay all archived original admissions.

No download, model, research controller, source rewrite or repository mutation.
Run under the host's normal resource wrapper. All generated files stay in an
explicit fresh directory outside this publication.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time

HERE = Path(__file__).resolve().parent


def need(ok, message):
    if not ok:
        raise RuntimeError(message)


def sha(path):
    value = hashlib.sha256()
    with Path(path).open('rb') as source:
        for block in iter(lambda: source.read(1024 * 1024), b''):
            value.update(block)
    return value.hexdigest()


def verify_bundle():
    manifest = json.loads((HERE/'BUNDLE_MANIFEST.json').read_bytes())
    for row in manifest['files']:
        relative = Path(row['path'])
        need(not relative.is_absolute() and '..' not in relative.parts,
             'nonlocal manifest member')
        path = HERE/relative
        need(path.is_file() and not path.is_symlink() and
             path.resolve().is_relative_to(HERE) and
             path.stat().st_size == row['bytes'] and sha(path) == row['sha256'],
             'publication file changed: '+str(relative))
    registry = json.loads((HERE/'PROOF_REGISTRY.json').read_bytes())
    expected = manifest['expected_counts']
    need(expected == {'admissions': 5, 'source_files': 14}, 'unexpected packet scope')
    need(len(registry['accepted_claims']) == expected['admissions'] and
         len(registry['source_files']) == expected['source_files'], 'unexpected admission/source set')
    modules = {name[:-5].replace('/', '.'): name
               for name in registry['source_files']}
    order, active, complete = [], set(), set()

    def visit(module):
        if module in complete:
            return
        need(module not in active, 'project import cycle')
        active.add(module)
        text = (HERE/modules[module]).read_text()
        for line in text.splitlines():
            match = re.match(r'^\s*import\s+(.+)$', line)
            if match:
                for dependency in match[1].split('--', 1)[0].split():
                    if dependency.startswith('MathGKM.'):
                        need(dependency in modules, 'missing project source: '+dependency)
                        visit(dependency)
        active.remove(module)
        complete.add(module)
        order.append(module)

    for module in sorted(modules):
        visit(module)
    return registry, order


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--verify-only', action='store_true')
    parser.add_argument('--toolchain', type=Path)
    parser.add_argument('--packages-dir', type=Path)
    parser.add_argument('--build-dir', type=Path)
    args = parser.parse_args()
    registry, order = verify_bundle()
    if args.verify_only:
        print(json.dumps({'verified_source_files': len(order), 'admissions': len(registry['accepted_claims']),
                          'compiler_or_checker_run': False}, sort_keys=True))
        return
    need(all((args.toolchain, args.packages_dir, args.build_dir)),
         'toolchain, packages-dir and fresh external build-dir are required')
    toolchain = args.toolchain.resolve(strict=True)
    packages = args.packages_dir.resolve(strict=True)
    build = args.build_dir.absolute()
    need(not build.exists() and not build.is_symlink() and
         not build.resolve().is_relative_to(HERE),
         'build-dir must be absent and outside publication')
    build.mkdir(mode=0o700)
    deadline = time.monotonic()+1800
    logs = build/'logs'
    logs.mkdir()
    records = []
    env = {key: value for key, value in os.environ.items()
           if not key.startswith(('GIT_', 'LEAN_'))}
    env.update(GIT_CONFIG_NOSYSTEM='1', GIT_CONFIG_GLOBAL=os.devnull,
               GIT_GRAFT_FILE=os.devnull, GIT_NO_REPLACE_OBJECTS='1',
               GIT_NO_LAZY_FETCH='1', GIT_ALLOW_PROTOCOL='',
               LEAN_SYSROOT=str(toolchain), TMPDIR=str(build), LANG='en_US.UTF-8')

    def run(argv, cwd, label, environment=None):
        remaining = deadline-time.monotonic()
        need(remaining > 0, 'fixed 1800-second reproduction window exhausted')
        stdout, stderr = logs/(label+'.stdout'), logs/(label+'.stderr')
        with stdout.open('xb') as out, stderr.open('xb') as err:
            result = subprocess.run(list(map(str, argv)), cwd=cwd,
                                    env=environment or env, stdout=out, stderr=err,
                                    timeout=remaining, check=False)
        need(stdout.stat().st_size <= 1024**2 and stderr.stat().st_size <= 1024**2,
             'checker diagnostic bound exceeded')
        records.append({'label': label, 'argv': list(map(str, argv)),
                        'returncode': result.returncode,
                        'stdout_sha256': sha(stdout), 'stderr_sha256': sha(stderr)})
        need(result.returncode == 0, 'command failed: '+label)
        return stdout.read_text()

    lean, checker = toolchain/'bin/lean', toolchain/'bin/leanchecker'
    for name, executable in [('lean', lean), ('leanchecker', checker)]:
        need(sha(executable) == registry['original_checker_binary_sha256'][name],
             'use the original pinned checker binaries: '+name)
    manifest = json.loads((HERE/'lake-manifest.json').read_bytes())
    dependency_paths = [toolchain/'lib/lean']
    missing_package_builds = []
    git = shutil.which('git')
    need(git, 'Git is required only for read-only dependency revision checks')
    for package in manifest['packages']:
        path = packages/package['name']
        prefix = [git, '--no-optional-locks', '--no-replace-objects', '-c',
                  'maintenance.auto=0', '-c', 'gc.auto=0', '-c',
                  'core.hooksPath='+os.devnull, '-C', path]
        revision = run(prefix+['rev-parse', 'HEAD'], HERE,
                       'dependency-'+package['name']).strip()
        need(revision == package['rev'], 'dependency revision differs: '+package['name'])
        run(prefix+['diff', '--quiet', '--ignore-submodules', 'HEAD', '--'], HERE,
            'dependency-clean-'+package['name'])
        library = path/'.lake/build/lib/lean'
        if library.is_dir():
            dependency_paths.append(library)
        else:
            missing_package_builds.append(package['name'])
    objects = build/'objects'
    objects.mkdir()

    def lean_environment(first):
        return {**env, 'LEAN_PATH': os.pathsep.join(map(str, [*first, *dependency_paths]))}

    for index, module in enumerate(order):
        relative = Path(module.replace('.', '/'))
        output = objects/relative.with_suffix('.olean')
        output.parent.mkdir(parents=True, exist_ok=True)
        run([lean, '-j', '1', '-o', output, relative.with_suffix('.lean')], HERE,
            'compile-'+str(index), lean_environment([objects]))
    for index, module in enumerate(order):
        run([checker, module], HERE, 'kernel-'+str(index), lean_environment([objects]))
    for index, claim in enumerate(registry['accepted_claims']):
        original = HERE/'validation'/claim['id']/'source'
        stage, local_objects = build/('admission-'+str(index)), build/('admission-objects-'+str(index))
        stage.mkdir()
        local_objects.mkdir()
        for name in ['StudyCheck.lean', 'StudyInspect.lean']:
            shutil.copyfile(original/name, stage/name)
        environment = lean_environment([local_objects, objects])
        run([lean, '-j', '1', '-o', local_objects/'StudyCheck.olean', 'StudyCheck.lean'],
            stage, 'admission-compile-'+str(index), environment)
        run([checker, 'StudyCheck'], stage, 'admission-kernel-'+str(index), environment)
        stdout = run([lean, '-j', '1', 'StudyInspect.lean'], stage,
                     'admission-inspect-'+str(index), environment)
        completion = claim['producer_completion']
        artifact = stage/'declarations.json'
        need(artifact.stat().st_size == completion['artifact_bytes'] and
             sha(artifact) == completion['artifact_sha256'],
             'fresh native inspector artifact differs: '+claim['id'])
        marker = ('GKM_DECLARATIONS_COMPLETE_V3:'+completion['nonce']+':'+
                  str(completion['artifact_bytes'])+':'+completion['artifact_sha256'])
        need([line for line in stdout.splitlines() if line.startswith('GKM_DECLARATIONS')] == [marker],
             'missing original native inspector completion: '+claim['id'])
    verify_bundle()
    for name, executable in [('lean', lean), ('leanchecker', checker)]:
        need(sha(executable) == registry['original_checker_binary_sha256'][name],
             'checker changed during reproduction')
    result = {'schema': 'math-gkm.gaussian-public-proof-reproduction.v1',
              'recompiled_project_modules': len(order), 'reproduced_admissions': len(registry['accepted_claims']),
              'all_original_inspector_artifacts_reproduced': True,
              'missing_package_builds': missing_package_builds,
              'full_conjecture_proved': False, 'checks': records}
    (build/'REPRODUCTION_RESULT.json').write_text(json.dumps(result, sort_keys=True, indent=2)+'\n')
    print(json.dumps({'recompiled_modules': len(order), 'reproduced_admissions': len(registry['accepted_claims']),
                      'result': str(build/'REPRODUCTION_RESULT.json')}, sort_keys=True))


if __name__ == '__main__':
    main()
