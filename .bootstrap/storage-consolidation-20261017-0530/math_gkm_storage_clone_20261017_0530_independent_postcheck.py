"""Read-only named-file storage postcheck; never runs storage or research programs."""
from pathlib import Path
from datetime import datetime, timezone
from collections import Counter
import hashlib, json, re, stat, subprocess

T = Path('/private/tmp')
R = Path('/Users/sasha/math_gkm')
A = T / 'math_gkm_godel_20261013'
B = R / '.bootstrap/independent-controller-audit'
I = T / 'math_gkm_storage_inventory_20261017_0530.json'
P = T / 'math_gkm_storage_inventory_20261017_0530_independent_review.json'
Q = T / 'math_gkm_storage_clone_20261017_0530_result.json'
C = T / 'math_gkm_storage_clone_20261017_0530.py'
IH = T / 'math_gkm_storage_inventory_20261017_0530.py'
PH = T / 'math_gkm_storage_inventory_20261017_0530_independent_review.py'
O = T / 'math_gkm_storage_clone_20261017_0530_independent_postcheck.json'
assert not O.exists()
started = datetime.now(timezone.utc).isoformat()

def digest(p):
    with Path(p).open('rb') as f:
        return hashlib.file_digest(f, 'sha256').hexdigest()

def pin(p):
    p = Path(p)
    return {'path': str(p), 'bytes': p.stat().st_size, 'sha256': digest(p)}

def meta(s):
    return {'bytes': s.st_size, 'mode': stat.S_IMODE(s.st_mode), 'uid': s.st_uid,
            'gid': s.st_gid, 'mtime_ns': s.st_mtime_ns, 'atime_ns': s.st_atime_ns,
            'inode': s.st_ino, 'device': s.st_dev, 'nlink': s.st_nlink,
            'flags': s.st_flags, 'ctime_ns': s.st_ctime_ns,
            'birthtime': getattr(s, 'st_birthtime', None),
            'regular': stat.S_ISREG(s.st_mode), 'symlink': stat.S_ISLNK(s.st_mode)}

expected_pins = {
    I: '3e13b4418998f37432ffe9cd5dca6e229660536d426fac5a52d6d1773c87d10d',
    IH: 'be5d62b0ae1a83d6698617946721ca3e24996bebf86c5e40861cb5458ee306ca',
    P: 'bb37b12d4485a10f4800a2e60f8ddefa42fa79115301d30b003908af416da7de',
    PH: '9269bcb601264ad2bf9129b1ccdfdd64dff90d9da51ea48efe1dfed26da466bf',
    C: 'c0026e9e6277e3a47fb9dfdd43ab5e014557ff1291e04b31d3c88aa789357acc',
    Q: '3f27f406a97b41f0b43a7c16d72f6150f78d2a53ccecfe4a6c332f21107dc24f',
}
for path, expected in expected_pins.items():
    assert digest(path) == expected, str(path)
inv, pre, result = (json.loads(p.read_text()) for p in (I, P, Q))
assert pre['concurrence'] is True and not pre['necessary_corrections'] and not pre['mismatches']
assert pre['clone_semantics']['no_operation_executed_by_reviewer'] is True
assert result['status'] == 'complete' and result['processed'] == len(result['records']) == 94
assert result['inventory_sha256'] == expected_pins[I]
assert result['review_sha256'] == expected_pins[P]
assert inv['candidate_count'] == pre['candidate_count'] == len(inv['pairs']) == 94
assert inv['candidate_bytes'] == pre['candidate_bytes'] == 1104425681
assert pre['canonical_source_count'] == 68
assert pre['classes'] == {'temporary_audit': 42, 'archive': 26, 'object': 26}
assert inv['repository_head'] == pre['repository_head'] == 'd13904f42ace96abaf48406c02a32c3930e1e52d'
assert pre['no_prior_target_overlap'] is True and pre['excluded_target_count'] == 5971
assert len(pre['prior_records']) == 36
assert pre['finished_utc'] < result['started_utc'] < result['finished_utc'] < started
prior_targets = {x['target']: x for x in pre['targets']}
prior_sources = {x['path']: x for x in pre['canonical_sources']}
planned = {x['target']: x for x in inv['pairs']}
completed = {x['target']: x for x in result['records']}
assert len(planned) == len(completed) == len(prior_targets) == 94
assert set(planned) == set(completed) == set(prior_targets)
assert [x['target'] for x in result['records']] == [x['target'] for x in inv['pairs']]
assert set(prior_sources) == {x['source'] for x in inv['pairs']}
assert len(prior_sources) == 68 and not (set(prior_sources) & set(planned))
assert sum(x['bytes'] for x in inv['pairs']) == 1104425681
assert dict(Counter(x['kind'] for x in inv['pairs'])) == pre['classes']
tags = {('markov-' + x['request'][:8]): x['worker'] for x in pre['receipt_checks']}
assert set(tags.values()) == {175, 176}
assert len(pre['seal_checks']) == 13
assert {x['worker'] for x in pre['seal_checks']} == set(range(164, 177))
assert all(x['bytes_equal'] for x in pre['seal_checks'])
assert all(x['seal_and_receipt_match'] for x in pre['receipt_checks'])
device = T.stat().st_dev
assert device == pre['same_volume_device']
canonical_rows, target_rows = [], []
target_atime_differences, canonical_atime_differences = [], []
read_atime_changes, operation_atime_differences = [], []
stable_keys = ['bytes', 'mode', 'uid', 'gid', 'mtime_ns', 'inode', 'device', 'nlink', 'flags']

def observe(path, expected_hash):
    p = Path(path)
    assert p.resolve() == p
    before = meta(p.lstat())
    assert before['regular'] and not before['symlink']
    assert before['nlink'] == 1 and before['flags'] == 0 and before['device'] == device
    xattrs = subprocess.check_output(['/usr/bin/xattr', str(p)], text=True)
    acl = subprocess.check_output(['/bin/ls', '-lde', str(p)], text=True)
    assert not xattrs.strip() and len(acl.splitlines()) == 1
    actual = digest(p)
    assert actual == expected_hash, str(p)
    after = meta(p.lstat())
    assert {k:v for k,v in before.items() if k != 'atime_ns'} == {
        k:v for k,v in after.items() if k != 'atime_ns'}, str(p)
    if before['atime_ns'] != after['atime_ns']:
        read_atime_changes.append(str(p))
    return {'path': str(p), 'sha256': actual, 'before_hash': before, 'after_hash': after,
            'acl': acl, 'xattrs': xattrs, 'bytes_match': True,
            'stable_during_postcheck_except_atime': True}

for path, old in sorted(prior_sources.items()):
    p = Path(path)
    if p.parent == B:
        match = re.fullmatch(r'markov_worker_(\d{6})_.+\.json', p.name)
        assert match and 164 <= int(match.group(1)) <= 176
        worker = int(match.group(1))
        kind = 'committed_audit_copy'
    else:
        assert p.parent.parent == R / 'evidence' and p.parent.name in tags
        assert p.suffix in ('.olean', '.ilean')
        worker, kind = tags[p.parent.name], 'canonical_compiled_evidence'
    row = observe(p, old['sha256'])
    prior = old['metadata_after_read']
    assert all(row['before_hash'][k] == prior[k] for k in stable_keys), str(p)
    same_atime = row['before_hash']['atime_ns'] == prior['atime_ns']
    if not same_atime:
        canonical_atime_differences.append(path)
    row.update(worker=worker, kind=kind, canonical_inode_preserved=True,
               canonical_bytes_and_stable_metadata_preserved=True,
               atime_equals_preflight=same_atime, preflight_atime_ns=prior['atime_ns'],
               ctime_equals_preflight=row['before_hash']['ctime_ns'] == prior['ctime_ns'],
               birthtime_equals_preflight=row['before_hash']['birthtime'] == prior['birthtime'])
    canonical_rows.append(row)

for path, entry in planned.items():
    done = completed[path]
    old = prior_targets[path]
    assert all(done[k] == entry[k] for k in ['source', 'target', 'sha256', 'bytes'])
    assert done['old_inode'] == entry['inode_before'] == old['target_metadata_after_read']['inode']
    assert done['new_inode'] != done['old_inode']
    assert all(done['metadata_preserved'][k] == entry[k] for k in ['mode', 'uid', 'gid', 'mtime_ns'])
    p, source = Path(path), Path(entry['source'])
    if entry['kind'] == 'temporary_audit':
        assert p.parent == A and source.parent == B and p.name == source.name
        match = re.fullmatch(r'markov_worker_(\d{6})_.+\.json', p.name)
        assert match and 164 <= int(match.group(1)) <= 176
        worker = int(match.group(1))
    else:
        assert source.parent.parent == R / 'evidence' and source.parent.name in tags
        worker = tags[source.parent.name]
        if entry['kind'] == 'archive':
            assert p == R / '.control/markov/workers' / f'{worker:06d}' / 'artifacts' / source.relative_to(R)
        else:
            assert entry['kind'] == 'object'
            assert p == R / '.control/markov/objects' / entry['sha256']
    assert worker == old['worker']
    row = observe(p, entry['sha256'])
    assert all(row['before_hash'][k] == entry[k] for k in ['bytes', 'mode', 'uid', 'gid', 'mtime_ns'])
    assert row['before_hash']['inode'] == done['new_inode']
    assert row['before_hash']['inode'] != prior_sources[entry['source']]['metadata_after_read']['inode']
    same_atime = row['before_hash']['atime_ns'] == done['metadata_preserved']['atime_ns']
    if not same_atime:
        target_atime_differences.append(path)
    if done['metadata_preserved']['atime_ns'] != entry['atime_ns']:
        operation_atime_differences.append(path)
    row.update(worker=worker, kind=entry['kind'], source=entry['source'],
               inventory_stable_metadata_match=True, result_new_inode_match=True,
               old_inode=done['old_inode'], new_inode=done['new_inode'],
               operation_recorded_atime_ns=done['metadata_preserved']['atime_ns'],
               current_atime_equals_operation_record=same_atime,
               inventory_atime_ns=entry['atime_ns'],
               preflight_atime_ns=old['target_metadata_after_read']['atime_ns'],
               preflight_ctime_ns=old['target_metadata_after_read']['ctime_ns'],
               preflight_birthtime=old['target_metadata_after_read']['birthtime'])
    target_rows.append(row)
assert len({x['new_inode'] for x in target_rows}) == 94

preserve = [IH, I, C, PH, P, Q, Path(__file__), O]
assert len(preserve) == len(set(preserve)) == 8
input_pins = [pin(p) for p in preserve if p != O]
for path, expected in expected_pins.items():
    assert digest(path) == expected, str(path)
out = {
    'operation': 'Independent read-only postcheck of storage consolidation 20261017_0530',
    'scope': 'Exact inventory targets and canonical source counterparts only: temporary sealed audit files164-176 and compiled archive/object copies175-176. No177+ inspection, research/object interpretation or project program execution. No replacement, metadata restoration or further storage operation by this checker. Prior mathematical audit windows and conclusions remain historical and unchanged.',
    'started_utc': started, 'finished_utc': datetime.now(timezone.utc).isoformat(),
    'concurrence': True, 'necessary_corrections': [], 'all_byte_and_stable_metadata_checks_pass': True,
    'operation_reexecuted': False, 'further_storage_mutation': False,
    'inventory_sha256': expected_pins[I], 'preflight_sha256': expected_pins[P],
    'result_sha256': expected_pins[Q], 'operation_script_sha256': expected_pins[C],
    'input_files': input_pins, 'original_repository_head': inv['repository_head'],
    'current_repository_head_not_asserted': True,
    'target_count': 94, 'canonical_source_count': 68, 'logical_duplicate_bytes': 1104425681,
    'classes': pre['classes'], 'target_records': target_rows, 'canonical_source_records': canonical_rows,
    'preflight_bindings': {'prior_exclusion_records': 36, 'excluded_targets': 5971,
                          'no_target_overlap': True, 'seal_workers': list(range(164, 177)),
                          'receipt_workers': [175, 176],
                          'qualification': 'The unchanged independently reviewed preflight retains exact committed, receipt and seal checks. This postcheck verifies its byte identity and rehashes each named source/target; it does not extend historical mathematical observations.'},
    'atime_observation': {
        'targets_matching_operation_atime': 94 - len(target_atime_differences),
        'targets_differing_from_operation_atime': target_atime_differences,
        'canonical_matching_preflight_atime': 68 - len(canonical_atime_differences),
        'canonical_differing_from_preflight_atime': canonical_atime_differences,
        'operation_recorded_target_atime_differing_from_inventory': operation_atime_differences,
        'files_with_atime_change_during_postcheck_read': read_atime_changes,
        'postcheck_hash_reads_may_update_atime': True, 'atime_was_not_reset_by_postcheck': True,
        'qualification': 'The operation records atime restored to its immediately preceding target sample. Current pre-read atime is compared with that record, separately from inventory and preflight samples. Changes may reflect intervening access; no writer, reader or process is attributed. Matching samples do not prove continuous stability or absence of concurrent access.'},
    'metadata_boundary': 'All target bytes/mode/uid/gid/mtime match inventory and result; inodes match recorded replacements. Canonical bytes/mode/uid/gid/mtime/inodes match preflight. Ordinary single-link files, empty ACL/xattrs and same-volume identity were checked. Target inode/ctime/birth changes are permitted and retained as observations. No earlier audit record is rewritten.',
    'operation_window': {k: result[k] for k in ['started_utc', 'finished_utc', 'free_before', 'free_after', 'status', 'processed']},
    'free_space_qualification': 'The result records filesystem free-space samples during its operation window. No exclusive causation, extent sharing or equality between logical duplicate bytes and physical savings is inferred.',
    'concurrency_limits': 'No global filesystem lock or automatic multi-file rollback was implemented. This bounded postcheck confirms the named files at observation times, not continuous filesystem history. The result reports all94 replacements completed.',
    'child_static_review': {'agent': '/root/monitoring_audit/sealed136_review/method138',
                            'concurrence': True, 'necessary_corrections': [],
                            'scope': 'Inventory/preflight/result JSON consistency only, independently confirming exact94 ordered rows,68 sources,42/26/26 classes, metadata and inode records. No current project file reads by child.'},
    'preservation_paths': [str(p) for p in preserve],
}
O.write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps({'postcheck': pin(O), 'helper': pin(Path(__file__)),
                  'targets': 94, 'canonical_sources': 68,
                  'atime_target_differences': len(target_atime_differences),
                  'atime_source_differences': len(canonical_atime_differences),
                  'postcheck_read_atime_changes': len(read_atime_changes),
                  'started_utc': started, 'finished_utc': out['finished_utc'],
                  'preservation_paths': out['preservation_paths']}, indent=2))
