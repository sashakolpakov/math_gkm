#!/usr/bin/env python3
"""Integrity verification and isolated reconstruction of historical admitted proofs.
Default command verifies bytes/metadata only. Only explicit `rebuild` executes Lean.
No researcher, model, private evaluation, or live campaign is used.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent

def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        for chunk in iter(lambda: f.read(1024*1024), b''):
            h.update(chunk)
    return h.hexdigest()

def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':'), ensure_ascii=False).encode()).hexdigest()

def check(ok, message):
    if not ok:
        raise ValueError(message)

def path_in(base, name, must_exist=True):
    p = PurePosixPath(name)
    check(bool(p.parts) and not p.is_absolute() and '..' not in p.parts and '\\' not in name, 'unsafe relative path: '+name)
    target = base
    for part in p.parts:
        target = target / part
        check(not target.is_symlink(), 'symlink forbidden: '+str(target))
    check(target.resolve().is_relative_to(base.resolve()), 'path escaped its root')
    if must_exist:
        check(target.is_file(), 'missing regular file: '+str(target))
    return target

def read(path):
    return json.loads(path.read_text())

def verify():
    manifest_path = path_in(ROOT, 'MANIFEST.json')
    anchor = path_in(ROOT, 'MANIFEST.sha256').read_text().split()
    check(anchor == [sha(manifest_path), 'MANIFEST.json'], 'manifest hash mismatch')
    m = read(manifest_path)
    check(m.get('schema') == 'math-gkm.admitted-proof-packet.v1', 'wrong packet schema')
    expected = set(m['files']) | {'MANIFEST.json', 'MANIFEST.sha256'}
    actual = set()
    for p in ROOT.rglob('*'):
        check(not p.is_symlink(), 'symlink in packet: '+str(p))
        if p.is_file():
            actual.add(str(p.relative_to(ROOT)))
    check(actual == expected, 'packet file set changed')
    for name, binding in m['files'].items():
        p = path_in(ROOT, name)
        check(p.stat().st_size == binding['bytes'] and sha(p) == binding['sha256'], 'packet content mismatch: '+name)
    for a in m['admissions']:
        registry = read(path_in(ROOT, a['registry_path']))
        record = registry[a['id']]
        check(digest(record) == a['registry_record_sha256'], 'registry record mismatch')
        bundle = ROOT / a['receipt_path']
        marker = read(path_in(bundle, 'FINISHED.json'))
        check(sha(bundle/'FINISHED.json') == a['finished_sha256'] == record['validation_bundle']['finished_sha256'], 'FINISHED mismatch')
        check(marker.get('finished') is True, 'unfinished bundle')
        check(marker['task_hash'] == a['task_sha256'] == digest(record['task']), 'task identity mismatch')
        check(marker['solution_hash'] == a['solution_sha256'] == digest(record['solution']), 'solution identity mismatch')
        check(marker['required'] == record['task'].get('required_constants', []), 'required constants mismatch')
        check(digest(marker['files']) == marker['files_binding'], 'FINISHED file binding mismatch')
        for name, h in marker['files'].items():
            check(sha(path_in(bundle, name)) == h, 'FINISHED-bound file mismatch')
        result = read(path_in(bundle, 'result.json'))
        check(result.get('checked') is True and result.get('valid_attempt') is True and 'finished' in result, 'unsuccessful historical result')
        evidence = result.get('producer_completion')
        check(isinstance(evidence, dict) and evidence == marker.get('producer_completion'), 'producer completion mismatch')
        artifact = path_in(bundle, 'source/declarations.json')
        check(sha(artifact) == evidence['artifact_sha256'] == result['declaration_artifact_sha256'], 'declaration artifact mismatch')
        check(artifact.stat().st_size == evidence['artifact_bytes'], 'declaration artifact size mismatch')
        checks = result.get('checks', [])
        check(all(c.get('returncode') == 0 and not c.get('termination') for c in checks), 'failed historical check')
    index = read(path_in(ROOT, 'registry-bound-exports/INDEX.json'))
    for e in index['exports']:
        check(sha(path_in(ROOT, e['packet_path'])) == e['sha256'], 'extra export hash mismatch')
        registry = read(path_in(ROOT, 'registries/'+e['arm']+'-knowledge.json'))
        check(bool(e['bound_by_registry_admissions']), 'unbound extra export')
        for key in e['bound_by_registry_admissions']:
            check(registry[key]['source_files'].get(e['original_relative_path']) == e['sha256'], 'extra export registry binding mismatch')
    return m

def select(m, arm, ident):
    matches = [a for a in m['admissions'] if a['arm'] == arm and a['id'] == ident]
    check(len(matches) == 1, 'unknown arm/admission pair')
    return matches[0]

def safe_project(value, m, new):
    p = Path(value).expanduser().absolute()
    for q in [p] + list(p.parents):
        check(not q.is_symlink(), 'symlink project path forbidden: '+str(q))
    p = p.resolve()
    original = Path(m['original_study_path']).resolve()
    check(not p.is_relative_to(ROOT) and not p.is_relative_to(original), 'project must be outside packet and original study')
    if new:
        check(not p.exists() and p.parent.is_dir(), 'restore requires a new project under an existing parent')
    else:
        check(p.is_dir(), 'missing reconstructed project')
    return p

def restore(m, a, value):
    project = safe_project(value, m, True)
    bundle = ROOT / a['receipt_path']
    marker = read(bundle/'FINISHED.json')
    project.mkdir()
    for name in marker['files']:
        if name.startswith('source/') and name.endswith('.lean'):
            source = path_in(bundle, name)
            target = path_in(project, name[len('source/'):], False)
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, target)
    for name in ['lean-toolchain', 'lakefile.toml', 'lake-manifest.json']:
        shutil.copyfile(path_in(bundle, 'rebuild-pins/'+name), project/name)
    (project/'HISTORICAL_ADMISSION.json').write_text(json.dumps({'arm':a['arm'], 'id':a['id'], 'finished_sha256':a['finished_sha256']}, indent=2)+'\n')
    print('Restored exact FINISHED-bound Lean source and pins to '+str(project))
    print('No dependency download, compiler, Lean, model or researcher was run.')

def verify_project(m, a, value):
    project = safe_project(value, m, False)
    tag = read(path_in(project, 'HISTORICAL_ADMISSION.json'))
    check(tag == {k:a[k] for k in ['arm','id','finished_sha256']}, 'wrong historical project identity')
    bundle = ROOT / a['receipt_path']
    marker = read(bundle/'FINISHED.json')
    for name, h in marker['files'].items():
        if name.startswith('source/') and name.endswith('.lean'):
            check(sha(path_in(project, name[len('source/'):])) == h, 'reconstructed source changed')
    for name in ['lean-toolchain','lakefile.toml','lake-manifest.json']:
        check(sha(path_in(project, name)) == marker['files']['rebuild-pins/'+name], 'reconstructed pin changed: '+name)
    return project

def rebuild(m, a, value):
    project = verify_project(m, a, value)
    pins = read(project/'lake-manifest.json')
    for package in pins['packages']:
        dep = project/pins.get('packagesDir', '.lake/packages')/package['name']
        check(dep.is_dir() and not dep.is_symlink(), 'fetch pinned dependencies first: '+str(dep))
        got = subprocess.run(['git','-C',str(dep),'rev-parse','HEAD'], check=True, capture_output=True, text=True).stdout.strip()
        check(got == package['rev'], 'dependency revision changed: '+package['name'])
    b = ROOT/a['receipt_path']
    plan = read(b/'REBUILD.json')
    original_build = Path(a['original_bundle_path'])/'build'
    for command in plan['commands']:
        operation, argv = command['operation'], command['argv']
        if operation == 'compile':
            index = argv.index('-o')
            rel = Path(argv[index+1]).relative_to(original_build)
            output = path_in(project, str(Path('.lake/build/lib/lean')/rel), False)
            output.parent.mkdir(parents=True, exist_ok=True)
            source = argv[-1]
            path_in(project, source)
            args = ['lake','env','lean','-j','1','-o',str(output),source]
        elif operation == 'kernel_replay':
            args = ['lake','env','leanchecker',argv[-1]]
        elif operation == 'trusted_premise_inspection':
            check(argv[-1] == 'StudyInspect.lean', 'unknown inspector source')
            args = ['lake','env','lean','-j','1','StudyInspect.lean']
        else:
            raise ValueError('unknown historical operation: '+str(operation))
        print(operation+': '+repr(args), flush=True)
        subprocess.run(args, cwd=project, check=True)
    artifact = project/'declarations.json'
    print('Reconstruction commands completed. Fresh declaration artifact SHA256: '+sha(artifact))
    print('Historical artifact SHA256: '+sha(b/'source/declarations.json'))
    print('This recompiles one historical proof; it does not replay the research campaign.')

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', nargs='?', choices=['verify','list','restore','verify-project','rebuild'], default='verify')
    parser.add_argument('--arm', choices=['exploration','baseline'])
    parser.add_argument('--id')
    parser.add_argument('--project')
    args = parser.parse_args()
    m = verify()
    if args.command == 'verify':
        print('Verified '+str(len(m['admissions']))+' admissions, exact packet bytes, FINISHED/task/solution bindings, and registry-bound extra exports. No Lean was run.')
    elif args.command == 'list':
        for a in m['admissions']:
            print(a['arm']+' '+a['id'])
    else:
        check(args.arm and args.id and args.project, '--arm, --id and --project are required')
        a = select(m, args.arm, args.id)
        if args.command == 'restore':
            restore(m, a, args.project)
        elif args.command == 'verify-project':
            print('Verified reconstructed source and pins: '+str(verify_project(m, a, args.project)))
        else:
            rebuild(m, a, args.project)

if __name__ == '__main__':
    try:
        main()
    except (ValueError, OSError, KeyError, subprocess.CalledProcessError) as exc:
        print('ERROR: '+str(exc), file=sys.stderr)
        sys.exit(1)
