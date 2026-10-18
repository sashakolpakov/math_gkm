#!/usr/bin/env python3
"""UNEXECUTED preparation: exact POSTHOC verification of three old Astra claims.

Run only after root confirms the corrected, independently reviewed checker is
installed. No research role, task change, state admission or new idea is invoked.
The original failed checks remain failed historical records whatever happens here.
"""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import signal
import sys
import time

ROOT = Path('/Users/sasha/math_gkm')
STUDY = ROOT / '.control/markov-v2-20261018-restart/study'
OUT = ROOT / '.control/posthoc-astra-three-claims-20261018'
SECONDS = 120
TOTAL_WALL_SECONDS = 900
KIND = 'mathematical_claims'
TAG = 'POSTHOC mathematical verification; NOT original acceptance or clean model comparison'
ORIGINAL = {
    'seal.json': 'e97504a08d0e6df2ea5958136fba6315bda4f493417ab63faae5bf4101fea04f',
    'seed/seed-files.json': 'a910d61f2d9937dabb56cbce87088d82c97eaf9c22eee018851d8e07572dfb3d',
    'seed/contract.json': '495cf67ff80de3f6265a52266d8d212fc6e4ec411b0b2c0384cda47e84d29da3',
    'arms/baseline/jobs/round-0001/receipt.json': '2eede0c2ab2aa7bd26e60f7031431bec986625ef73d65b5b2354007f0fdb63d0',
    'arms/baseline/jobs/round-0004/receipt.json': '8b85ee1a0b3af4f40d1712d4bae89e5c661b0729effa8ff794b8218021510361',
    'arms/baseline/snapshots/round-0001/manifest.json': '9ceca78e9908dbc25ff71e4421ec1ba437a076dd95d4fddce084f325353ce7ea',
    'arms/baseline/snapshots/round-0004/manifest.json': '20155513b75d569f0e9864eb803578d3370bc6d4e30a6a25b2ade46c611ea944',
}
CLAIMS = [
    {'round': 1, 'id': 'r0001-universal-rational-coverage-20261018T100704Z',
     'key': 'feb7deecdd0dc0774bea75c2a7f1bfaf3c078eccf7b1378d16e8ba73ef000fd7',
     'task_hash': 'fc3bf84783bce9eb572df65d5cdf16e1401c5a97c6c82b8789a8be7dfddf3786',
     'result_sha256': 'c3543378cfe1f6d82622e7b8d865d4737ea940dcdaafa5114816ca2416623882'},
    {'round': 4, 'id': 'r0004-reachable-homogeneity-20261018T103442Z',
     'key': '60409dbde015379e12a8efb038c410ed3b97b874879a7bc90f3e45810f42b118',
     'task_hash': 'aaf2b31a287b957b7fe373a353fdda436e9af628f1d7012604084319febc6c87',
     'result_sha256': 'b93aae183897fce2a004a54da2d96c5bd9d02a160c8a1fe230c53f590f0976bb'},
    {'round': 4, 'id': 'r0004-unconditional-transport-20261018T103442Z',
     'key': '6f200898cdb6c937a847f917329ebd8f62f399f0e650fd259f2d49d4177d75c1',
     'task_hash': '2d7a61a51ed23cdbd38064a81f9b999742e2c2e6d2bba597399b14b25838bbc2',
     'result_sha256': '914bd4da89261bb853331154c5226685bad2b5933ba0f197cfdf488fdd11e70b'},
]


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':'),
                                    ensure_ascii=False).encode()).hexdigest()


def stamp():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()


def save(name, value):
    p = OUT / name
    require(p.resolve().is_relative_to(OUT.resolve()), 'write escaped POSTHOC output')
    p.parent.mkdir(parents=True, exist_ok=True)
    tmp = p.with_name(p.name + '.next')
    tmp.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n')
    os.replace(tmp, p)


def implementation():
    paths = sorted((ROOT/'machinery').glob('*.py'))
    paths += sorted((ROOT/'MathGKM').glob('*.lean'))
    paths += [ROOT/'.bootstrap/base-permissions.json']
    return {str(p.relative_to(ROOT)): sha(p) for p in paths}


def safe_relative(name):
    p = Path(name)
    require(not p.is_absolute() and '..' not in p.parts and
            not any(x.startswith('.') for x in p.parts), 'unsafe source pin: '+name)
    return p


def pin_original(path, pins):
    path = Path(path)
    require(path.resolve().is_relative_to(STUDY.resolve()) and not path.is_symlink(),
            'original record escaped old study')
    pins[str(path)] = sha(path)


def unchanged(pins):
    bad = [p for p, h in pins.items() if not Path(p).is_file() or sha(p) != h]
    require(not bad, 'original records changed: '+repr(bad))


class PosthocDeadlineExceeded(BaseException):
    pass


def deadline(signum, frame):
    # Must not be caught by check_task's OSError handler and consume the alarm.
    raise PosthocDeadlineExceeded('POSTHOC operational wall-clock envelope exhausted')


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--execute-after-reviewed-install', action='store_true', required=True)
    ap.add_argument('--expected-implementation-sha256', required=True,
                    help='Supervisor-provided digest(study_common.implementation()) after reviewed installation')
    args = ap.parse_args()
    require(re.fullmatch('[0-9a-f]{64}', args.expected_implementation_sha256) is not None,
            'exact reviewed installed-implementation digest required')
    require(ROOT.resolve() == ROOT and (ROOT/'.control').resolve() == ROOT/'.control',
            'unexpected production output parent')
    require(not OUT.exists() and not OUT.is_symlink(), 'fresh output required; no rerun/overwrite')
    impl = implementation()
    require(digest(impl) == args.expected_implementation_sha256,
            'reviewed installed-implementation identity mismatch; do not run')
    require(sha(ROOT/'machinery/study_transfer.py') != read(STUDY/'seal.json')['implementation']['machinery/study_transfer.py'],
            'original broken validator is still installed; do not run')
    sys.dont_write_bytecode = True
    sys.path.insert(0, str(ROOT))
    from machinery import study_common as common
    from machinery import study_knowledge as knowledge
    from machinery import study_transfer as transfer
    for module in (common, knowledge, transfer):
        require(Path(module.__file__).resolve().is_relative_to(ROOT/'machinery'),
                'wrong implementation import origin')
    require(common.ROOT == ROOT and common.implementation() == impl,
            'production implementation changed during import')
    started = stamp()
    signal.signal(signal.SIGALRM, deadline)
    signal.alarm(TOTAL_WALL_SECONDS)
    OUT.mkdir(exist_ok=False)
    original_pins = {}
    results = []
    summary = {'tag': TAG, 'started_at_utc': started, 'status': 'preparing',
               'original_study': str(STUDY), 'output': str(OUT),
               'validation_seconds_each': SECONDS, 'claims': 3,
               'maximum_operational_wall_seconds': TOTAL_WALL_SECONDS,
               'no_state_admission': True, 'original_results_unchanged': None,
               'not_a_new_research_round': True, 'not_a_clean_model_comparison': True,
               'implementation_sha256': digest(impl), 'checks': results}
    try:
        for rel, h in ORIGINAL.items():
            require(sha(STUDY/rel) == h, 'pinned original changed: '+rel)
            pin_original(STUDY/rel, original_pins)
        seal = read(STUDY/'seal.json')
        seed = STUDY/'seed'
        require(sha(seed/'seed-files.json') == seal['seed_files_sha256'], 'original seed list changed')
        for rel, h in seal['seed'].items():
            safe_relative(rel)
            require(sha(seed/rel) == h, 'original seed file changed: '+rel)
            pin_original(seed/rel, original_pins)
        for p in [STUDY/'arms/baseline/state.json', STUDY/'arms/exploration/state.json', STUDY/'STOP.json']:
            require(p.is_file(), 'old stopped-study record missing: '+str(p))
            pin_original(p, original_pins)
        # No package install or build occurs: this is read-only pin verification.
        dependency_before = common.dependency_identity()
        require(dependency_before == seal['dependencies'], 'original pinned dependencies changed')
        save('implementation.json', impl)
        save('dependency-identity.json', dependency_before)
        save('ORIGINAL-SEAL.json', seal)
        prepared = []
        for spec in CLAIMS:
            r = spec['round']
            receipt_path = STUDY/f'arms/baseline/jobs/round-{r:04d}/receipt.json'
            snapshot = STUDY/f'arms/baseline/snapshots/round-{r:04d}'
            receipt = read(receipt_path)
            manifest = common.verify_snapshot(snapshot)
            require(receipt['outcome'] == 'completed' and receipt['returncode'] == 0,
                    'not an original delivered submission')
            require(receipt['after'] == manifest['files'], 'same-round receipt/snapshot mismatch')
            for rel, h in manifest['files'].items():
                safe_relative(rel)
                source = snapshot/'source'/rel
                require(sha(source) == h, 'same-round source pin mismatch')
                pin_original(source, original_pins)
            items = receipt['payload']['mathematical_claims']
            require(len(items) == (1 if r == 1 else 2), 'original claim count changed')
            matches = [item for item in items if item['id'] == spec['id']]
            require(len(matches) == 1, 'missing/duplicate exact original claim')
            item = matches[0]
            require(not item.get('discharges') and not item.get('dependencies') and
                    not item.get('required_constants'), 'original empty side conditions changed')
            old_dir = STUDY/f'arms/baseline/rounds/{r:04d}/checks'/spec['key']
            old_result_path = old_dir/'result.json'
            require(sha(old_result_path) == spec['result_sha256'], 'original failed-result pin changed')
            old_result = read(old_result_path)
            require(old_result['task_hash'] == spec['task_hash'] and
                    old_result['task_id'] == spec['id'] and old_result['budget_seconds'] == SECONDS and
                    old_result['checked'] is False, 'original task/budget/status differs')
            reservation = old_dir.parent/(spec['key']+'.reservation.json')
            require(read(reservation) == {'seconds': SECONDS, 'task_hash': spec['task_hash']},
                    'original reservation differs')
            for p in [old_result_path, reservation] + sorted((old_dir/'source').rglob('*.lean')):
                pin_original(p, original_pins)
            ws = OUT/'workspaces'/spec['id']
            common.copy_seed(seed, ws)
            for rel in manifest['files']:
                p = ws/safe_relative(rel)
                p.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(snapshot/'source'/rel, p)
            require(common.inventory(ws) == manifest['files'], 'copied snapshot differs')
            require(sha(ws/'contract.json') == ORIGINAL['seed/contract.json'], 'copied contract differs')
            contract = read(ws/'contract.json')
            task, solution = knowledge.task_for(KIND, item, contract)
            task = transfer.bind_task(ws, task, [item['module']])
            require(common.digest(task) == spec['task_hash'] == old_result['task_hash'],
                    'reconstructed task differs; no check allowed')
            key = common.digest({'kind': KIND, 'item': item, 'task': task})
            require(key == spec['key'] == old_dir.name, 'original check key differs; no check allowed')
            # Stronger source-to-wrapper correspondence with the failed old invocation.
            target_path = old_dir/'source'/(task['target_module'].replace('.', '/')+'.lean')
            require(transfer.target_source(task) == target_path.read_text(), 'original elaborated-target source differs')
            require(transfer.wrapper(task, solution) == (old_dir/'source/StudyCheck.lean').read_text(),
                    'original submitted wrapper differs')
            context, _ = transfer.collect(ws, item['module'])
            for module, text in context.items():
                old_source = old_dir/'source'/(module.replace('.', '/')+'.lean')
                require(old_source.read_text() == text, 'original checked project source differs')
            save('originals/'+spec['id']+'.json', {'receipt': receipt, 'snapshot_manifest': manifest,
                 'result': old_result, 'reservation': read(reservation)})
            save('tasks/'+spec['id']+'.json', {'tag': TAG, 'kind': KIND, 'item': item,
                 'task': task, 'solution': solution, 'original_check_key': key,
                 'snapshot_binding': manifest['binding'], 'original_result_sha256': spec['result_sha256']})
            prepared.append((spec, ws, task, solution, contract, manifest))
        require(len(prepared) == 3, 'exactly three prepared checks required')
        unchanged(original_pins)
        require(implementation() == impl, 'reviewed implementation changed before execution')
        save('original-input-pins.json', original_pins)
        summary['status'] = 'prepared_exact_original_tasks'
        save('summary.json', summary)
        for spec, ws, task, solution, contract, manifest in prepared:
            # This is the only proof-checking invocation; the existing checker
            # retains actual compile, kernel-replay and premise-inspection receipts.
            unchanged(original_pins)
            require(implementation() == impl, 'reviewed implementation changed between checks')
            result = transfer.check_task(ws, task, solution, OUT/'checks'/spec['key'], SECONDS,
                        live=True, required=(), contract=contract)
            require(result['task_hash'] == spec['task_hash'] and result['budget_seconds'] == SECONDS,
                    'returned verification changed original task/budget')
            require(common.inventory(ws) == manifest['files'], 'POSTHOC workspace changed')
            results.append({'tag': TAG, 'id': spec['id'], 'original_check_key': spec['key'],
                'checked': result['checked'], 'status': result['status'],
                'result_path': str(OUT/'checks'/spec['key']/'result.json'),
                'result_sha256': sha(OUT/'checks'/spec['key']/'result.json'),
                'original_checked': False, 'original_admission_unchanged': True,
                'meaning': 'POSTHOC check outcome only; no old/new knowledge state is updated'})
            summary['status'] = 'running_posthoc_checks'
            save('summary.json', summary)
        unchanged(original_pins)
        require(implementation() == impl, 'reviewed implementation changed during execution')
        require(common.dependency_identity() == dependency_before, 'pinned dependencies changed during verification')
        summary.update(status='finished_posthoc_verification', original_results_unchanged=True,
                       dependencies_unchanged=True, implementation_unchanged=True,
                       independently_checked_in_this_posthoc_run=sum(r['checked'] for r in results),
                       old_or_new_state_admissions=0)
    except BaseException as exc:
        summary.update(status='POSTHOC_aborted_no_admission', exception_type=type(exc).__name__,
                       failure=str(exc), old_or_new_state_admissions=0)
        try:
            unchanged(original_pins)
            summary['original_results_unchanged'] = True
        except BaseException as verify_exc:
            summary['original_results_unchanged'] = False
            summary['original_recheck_error'] = str(verify_exc)
        raise
    finally:
        signal.alarm(0)
        summary['finished_at_utc'] = stamp()
        save('summary.json', summary)
    print(json.dumps({'tag': TAG, 'summary': str(OUT/'summary.json'),
                      'checked_posthoc': summary['independently_checked_in_this_posthoc_run'],
                      'admissions': 0}))


if __name__ == '__main__':
    main()
