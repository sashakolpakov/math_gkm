"""Explicit source-only publication packet; no Git, network, models or proofs.

prepare writes a bounded exact-source inventory; build verifies that inventory
and copies only its allowlisted files into a new archive. Never copy a research
workspace, role payload, curator output, live state, or authorization record.
Public Git publication is a separate, independently reviewed operation.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import sys
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parents[2]
OPS = Path(__file__).resolve().parent
PLAN = OPS/'PUBLICATION_PLAN.json'
PUBLIC_BASE = 'c82be721e592ca2dd88484e0cbe811e135ffc446'
SCHEMA = 'math-gkm.concept-driver-publication-plan.v1'
ARCHIVE_NAME = 'concept-driver-source-20261020'
MAX_FILE = 8*1024**2
MAX_TOTAL = 16*1024**2

STATIC = (
    '.gitignore', 'MISSION.md', 'README.md', 'MathGKM.lean',
    'lakefile.toml', 'lake-manifest.json', 'lean-toolchain',
    'contracts/construction.json', 'contracts/gate_fixture.json',
    'contracts/markov-clean-v2.json', 'contracts/markov-goal.json',
    'contracts/markov.json', 'contracts/round2.json',
    'docs/DESIGN.md', 'docs/CONCEPT_DRIVER.md', 'docs/GKM.md', 'docs/GLUING.md',
    'repro/repro.py', 'repro/test_repro.py', 'repro/README.md',
    'repro/manifest.json', 'repro/manifest-construction-v3.json',
    '.bootstrap/concept-driver-20261020/launch.py',
    '.bootstrap/concept-driver-20261020/test_launch.py',
    '.bootstrap/concept-driver-20261020/README.md',
    '.bootstrap/concept-driver-20261020/archive_public.py',
    '.bootstrap/concept-driver-20261020/run_public_tests.py',
    '.bootstrap/concept-driver-20261020/PUBLIC_REPRODUCTION.md',
    '.bootstrap/concept-driver-20261020/monitor30m/monitor30m.py',
    '.bootstrap/concept-driver-20261020/monitor30m/test_monitor.py',
    '.bootstrap/concept-driver-20261020/monitor30m/MONITOR_INSTRUCTIONS.md',
    '.bootstrap/concept-driver-20261020/monitor30m/ACTIVATION_RECIPE.md',
    '.bootstrap/concept-driver-20261020/monitor30m/org.sasha.math-gkm.concept-driver-20261020-monitor30m.plist',
    '.bootstrap/concept-driver-20261020/monitor30m/org.sasha.math-gkm.concept-driver-20261020-monitor30m-idle-validation.plist',
)
# These are explicit completed test summaries, never arbitrary files under OPS.
OPTIONAL_SUMMARIES = (
    '.bootstrap/concept-driver-20261020/TEST_RESULT.json',
    '.bootstrap/concept-driver-20261020/INTEGRATION_TEST_RESULT.json',
    '.bootstrap/concept-driver-20261020/PUBLIC_TEST_RESULT.json',
    '.bootstrap/concept-driver-20261020/ACCEPTANCE_TEST_RESULT.json',
    '.bootstrap/concept-driver-20261020/monitor30m/TEST_RESULT.json',
)
EXCLUSIONS = (
    '.bootstrap/study-authorization.json', '*.lock', 'STATUS.json', 'state.json',
    'STOP', 'STOP.json', 'PLAN.json live-launch authority', 'REVIEW.json live-launch authority',
    'independent-pretrial-curation/**', 'evaluation/**', '*adapter*/**',
    'roles/**', 'jobs/**', '.scratch/**', 'history/**', 'events.jsonl',
    'provider configuration, credentials and auth state', 'raw role/process logs',
    'legacy cleanup holds and process inventories', '.lake/**', '*.olean', '*.ilean',
)


def sha(path):
    result = hashlib.sha256()
    with path.open('rb') as source:
        for block in iter(lambda:source.read(1024**2), b''):
            result.update(block)
    return result.hexdigest()


def canonical(value):
    return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False)


def digest(value):
    return hashlib.sha256(canonical(value).encode()).hexdigest()


def write(path, value):
    path.parent.mkdir(parents=True,exist_ok=True)
    temporary = path.with_name(path.name+'.next')
    with temporary.open('w') as out:
        out.write(canonical(value)+'\n'); out.flush(); os.fsync(out.fileno())
    os.replace(temporary,path)


def relative(name):
    path = Path(name)
    if path.is_absolute() or '..' in path.parts or not path.parts:
        raise ValueError('unsafe publication path')
    return path


def checked_file(root, name):
    path = root/relative(name)
    if path.is_symlink() or not path.resolve().is_relative_to(root.resolve()) or not path.is_file():
        raise ValueError('publication file is not a regular owned source: '+name)
    size = path.stat().st_size
    if size > MAX_FILE:
        raise ValueError('publication source exceeds reviewed file bound: '+name)
    # Public inputs are text sources, never renamed binary build output.
    raw = path.read_bytes()
    if b'\0' in raw:
        raise ValueError('binary data in publication source: '+name)
    raw.decode('utf-8')
    return {'sha256':sha(path),'bytes':size}


def inventory():
    names = set(STATIC)
    for pattern in ('machinery/*.py','MathGKM/*.lean','tests/*.py','config/*.json'):
        names.update(str(p.relative_to(ROOT)) for p in ROOT.glob(pattern))
    names.update(name for name in OPTIONAL_SUMMARIES if (ROOT/name).is_file())
    files = {name:checked_file(ROOT,name) for name in sorted(names)}
    if sum(value['bytes'] for value in files.values()) > MAX_TOTAL:
        raise ValueError('publication source closure exceeds reviewed aggregate bound')
    return files


def prepare():
    files = inventory()
    plan = {'schema':SCHEMA, 'created_utc':datetime.now(timezone.utc).isoformat(),
            'status':'prepared_source_inventory; final source/test review and public-base verification required',
            'repository':'https://github.com/sashakolpakov/math_gkm',
            'reported_public_parent':PUBLIC_BASE,
            'public_parent_verified_here':False,
            'private_local_ancestry_used':False, 'network_calls':0,
            'publication_authorized_by_root':False,
            'archive_name':ARCHIVE_NAME, 'files':files,'files_binding':digest(files),
            'total_bytes':sum(v['bytes'] for v in files.values()),
            'excluded':list(EXCLUSIONS),
            'source_scope':'Full current implementation/Lean/config/test closure plus pinned inputs, selected docs, static operations and completed bounded test summaries. Historical public evidence remains in public-base ancestry.',
            'not_claimed':'No cold bootstrap, live autonomous run, new proof, full private campaign replay, or operating-system portability is established by packaging.',
            'required_external_dependencies':'Pinned Lean/toolchain and all lake-manifest commits; Python standard library; reviewed macOS/Codex runtime for the live harness. Rebuild caches are optional.',
            'reproduction_commands':[
                'python3 .bootstrap/concept-driver-20261020/run_public_tests.py',
                'python3 -m unittest tests.test_study_concepts tests.test_study_research_feedback tests.test_snapshot_catalog_cache tests.test_curator_task_limits tests.test_deployment_receipt_reuse tests.test_resource_exit_race -v',
                'python3 -m unittest tests.test_concept_loop_integration -v',
                'python3 .bootstrap/concept-driver-20261020/test_launch.py',
                'python3 .bootstrap/concept-driver-20261020/monitor30m/test_monitor.py'],
            'publication_steps':['Verify current public main, preserving its ancestry.',
                'Refresh source inventory after final tests and inspect the exact allowlist.',
                'Materialize source-only packet and verify every archived digest.',
                'Overlay only allowlisted sources and packet in a fresh public-base Git tree; never use private local HEAD.',
                'Review staged diff explicitly against the public parent; no deletions, private payloads or authority files.',
                'Commit/push only after explicit root go; verify remote commit/blob identities before any local cleanup.']}
    write(PLAN,plan)
    return {'plan':str(PLAN),'files':len(files),'bytes':plan['total_bytes'],'network_calls':0,'processes_launched':0}


def load_plan():
    plan = json.loads(PLAN.read_text())
    if plan.get('schema') != SCHEMA or plan.get('files_binding') != digest(plan.get('files',{})):
        raise ValueError('publication inventory binding changed')
    if plan.get('private_local_ancestry_used') is not False:
        raise ValueError('private ancestry is not a public publication base')
    for name,record in plan['files'].items():
        if checked_file(ROOT,name) != record:
            raise ValueError('source changed since inventory; review and prepare again: '+name)
    return plan


def build(destination):
    plan = load_plan()
    destination = destination.resolve()
    expected = ROOT/'evidence'/ARCHIVE_NAME
    if destination != expected.resolve() or destination.exists():
        raise ValueError('publication packet requires its fresh designated evidence directory')
    destination.mkdir(parents=True,exist_ok=False)
    for name in plan['files']:
        target = destination/'source'/relative(name)
        target.parent.mkdir(parents=True,exist_ok=True)
        shutil.copyfile(ROOT/name,target)
        if checked_file(destination/'source',name) != plan['files'][name]:
            raise ValueError('publication source changed during archive copy')
    write(destination/'MANIFEST.json',{
        'schema':'math-gkm.concept-driver-source-packet.v1',
        'files':plan['files'],'files_binding':plan['files_binding'],
        'contains_private_evaluation_inputs':False,'contains_live_authority_or_status':False,
        'contains_build_caches':False,'automatic_activation':False,
        'scope':plan['source_scope'],'not_claimed':plan['not_claimed'],
        'required_external_dependencies':plan['required_external_dependencies'],
        'reproduction_commands':plan['reproduction_commands']})
    return {'archive':str(destination),'files':len(plan['files']),
            'bytes':plan['total_bytes'],'network_calls':0,'processes_launched':0}


def verify_packet(destination):
    destination = destination.resolve()
    manifest = json.loads((destination/'MANIFEST.json').read_text())
    if (manifest.get('schema') != 'math-gkm.concept-driver-source-packet.v1' or
            manifest.get('files_binding') != digest(manifest.get('files',{}))):
        raise ValueError('publication packet manifest binding changed')
    for name,record in manifest['files'].items():
        if checked_file(destination/'source',name) != record:
            raise ValueError('archived publication source changed: '+name)
    return {'verified':True,'files':len(manifest['files']),'network_calls':0,'processes_launched':0}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command',choices=('prepare','check','build','verify-packet'))
    parser.add_argument('--destination',type=Path,default=ROOT/'evidence'/ARCHIVE_NAME)
    args = parser.parse_args()
    if args.command == 'prepare':
        result = prepare()
    elif args.command == 'check':
        plan = load_plan(); result = {'matching':True,'files':len(plan['files']),'network_calls':0,'processes_launched':0}
    elif args.command == 'verify-packet':
        result = verify_packet(args.destination)
    else:
        result = build(args.destination)
    print(json.dumps(result,sort_keys=True))


if __name__ == '__main__':
    main()
