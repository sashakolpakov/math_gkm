"""Named-file read-only storage postcheck; no consolidation or research execution."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, stat, subprocess

T = Path('/private/tmp')
R = Path('/Users/sasha/math_gkm')
I = T / 'math_gkm_storage_inventory_20261017_0444.json'
P = T / 'math_gkm_storage_inventory_20261017_0444_independent_review.json'
Q = T / 'math_gkm_storage_clone_20261017_0444_result.json'
C = T / 'math_gkm_storage_clone_20261017_0444.py'
O = T / 'math_gkm_storage_clone_20261017_0444_independent_postcheck.json'
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
            'inode': s.st_ino, 'device': s.st_dev, 'links': s.st_nlink,
            'flags': s.st_flags, 'ctime_ns': s.st_ctime_ns,
            'birthtime_seconds': getattr(s, 'st_birthtime', None)}

assert digest(I) == 'b55b281ef8fcdcc3fbad6600fa43cc6c8ad5041bddc877183ace437b3ca64c88'
assert digest(P) == '64debcb1fd7ee5b05298a13d671fdb6685f67420cbd806568b32e42cee5321aa'
assert digest(C) == '93f16eb00fdaaa3ca9dba8fdbb770fffc075ac8fbee67dd137037188d0debc83'
assert digest(Q) == 'ee683508dc6fdc1943eb84383c4166f87e4b0595666711321d7e9df95cc84eae'
inv = json.loads(I.read_text())
pre = json.loads(P.read_text())
result = json.loads(Q.read_text())
assert pre['concurrence'] is True and not pre['operation_executed'] and not pre['necessary_corrections']
assert result['status'] == 'complete' and result['processed'] == len(result['records']) == 122
assert result['inventory_sha256'] == digest(I) and result['review_sha256'] == digest(P)
assert inv['candidate_count'] == pre['candidate_count'] == 122
assert inv['candidate_bytes'] == pre['candidate_bytes'] == 662869984
assert pre['canonical_source_count'] == 61
prior_targets = {x['path']: x for x in pre['targets']}
prior_sources = {x['path']: x for x in pre['canonical_sources']}
planned = {x['target']: x for x in inv['pairs']}
observed = {x['target']: x for x in result['records']}
assert len(planned) == len(observed) == 122 and set(planned) == set(observed) == set(prior_targets)
assert len(prior_sources) == 61 and set(prior_sources) == {x['source'] for x in inv['pairs']}
assert not (set(prior_sources) & set(planned))
canonical_rows = []
target_rows = []
atime_differences = []
source_atime_differences = []
device = T.stat().st_dev

def observe(path, expected_hash):
    p = Path(path)
    assert p.resolve() == p
    before = p.lstat()
    assert stat.S_ISREG(before.st_mode) and before.st_nlink == 1 and before.st_flags == 0
    assert before.st_dev == device
    assert not subprocess.check_output(['/usr/bin/xattr', str(p)]).strip()
    assert len(subprocess.check_output(['/bin/ls', '-lde', str(p)], text=True).splitlines()) == 1
    assert digest(p) == expected_hash
    after = p.lstat()
    b, a = meta(before), meta(after)
    assert {k:v for k,v in b.items() if k != 'atime_ns'} == {k:v for k,v in a.items() if k != 'atime_ns'}
    return {'path': str(p), 'sha256': expected_hash, 'before_hash': b, 'after_hash': a,
            'bytes_match': True, 'no_acl_or_xattrs': True, 'stable_during_postcheck_except_atime': True}

tags = {('markov-' + x['request'][:8]): x['worker'] for x in pre['receipt_and_seal_bindings']}
assert set(tags.values()) == {172, 173, 174}
for path, old in sorted(prior_sources.items()):
    p = Path(path)
    assert p.parent.parent == R / 'evidence' and p.parent.name in tags
    assert p.suffix in ('.olean', '.ilean')
    now = observe(p, old['sha256'])
    stable_keys = ['bytes', 'mode', 'uid', 'gid', 'mtime_ns', 'inode', 'device', 'links', 'flags']
    assert all(now['before_hash'][k] == old['after_review'][k] for k in stable_keys)
    same_atime = now['before_hash']['atime_ns'] == old['after_review']['atime_ns']
    if not same_atime:
        source_atime_differences.append(path)
    now.update(worker=tags[p.parent.name], canonical_inode_preserved=True,
               canonical_bytes_and_stable_metadata_preserved=True,
               atime_equals_preflight=same_atime,
               preflight_atime_ns=old['after_review']['atime_ns'])
    canonical_rows.append(now)

for path, entry in planned.items():
    done = observed[path]
    assert all(done[k] == entry[k] for k in ['source', 'target', 'sha256', 'bytes'])
    assert done['old_inode'] == entry['inode_before'] == prior_targets[path]['after_review']['inode']
    assert done['new_inode'] != done['old_inode']
    assert all(done['metadata_preserved'][k] == entry[k] for k in ['mode', 'uid', 'gid', 'mtime_ns'])
    p = Path(path)
    source = Path(entry['source'])
    worker = tags[source.parent.name]
    archive = R / '.control/markov/workers' / f'{worker:06d}' / 'artifacts' / source.relative_to(R)
    obj = R / '.control/markov/objects' / entry['sha256']
    assert p in [archive, obj]
    row = observe(p, entry['sha256'])
    assert all(row['before_hash'][k] == entry[k] for k in ['bytes', 'mode', 'uid', 'gid', 'mtime_ns'])
    assert row['before_hash']['inode'] == done['new_inode']
    assert row['before_hash']['inode'] != prior_sources[entry['source']]['after_review']['inode']
    same_atime = row['before_hash']['atime_ns'] == done['metadata_preserved']['atime_ns']
    if not same_atime:
        atime_differences.append(path)
    row.update(worker=worker, source=entry['source'], inventory_stable_metadata_match=True,
               result_new_inode_match=True, old_inode=done['old_inode'],
               new_inode=done['new_inode'], operation_recorded_atime_ns=done['metadata_preserved']['atime_ns'],
               current_atime_equals_operation_record=same_atime,
               inventory_atime_ns=entry['atime_ns'])
    target_rows.append(row)

preserve = [
    T / 'math_gkm_storage_inventory_20261017_0444.py', I, C,
    T / 'math_gkm_storage_inventory_20261017_0444_independent_checks.py', P, Q,
    Path(__file__), O,
]
assert len(preserve) == len(set(preserve)) == 8
input_pins = [pin(p) for p in preserve if p != O]
assert digest(I) == result['inventory_sha256'] and digest(P) == result['review_sha256']
assert digest(Q) == 'ee683508dc6fdc1943eb84383c4166f87e4b0595666711321d7e9df95cc84eae'
out = {
    'operation': 'Independent read-only postcheck of closed172-174 storage consolidation',
    'scope': 'Only exact inventory targets, canonical source counterparts and named storage records read. No175+ inspection, no project or mathematical program execution, no replacement or metadata restoration by this checker. Prior mathematical audits/observation windows unchanged.',
    'started_utc': started, 'finished_utc': datetime.now(timezone.utc).isoformat(),
    'concurrence': True, 'necessary_corrections': [], 'all_byte_and_stable_metadata_checks_pass': True,
    'operation_reexecuted': False, 'further_storage_mutation': False,
    'inventory_sha256': digest(I), 'preflight_sha256': digest(P), 'result_sha256': digest(Q),
    'operation_script_sha256': digest(C), 'input_files': input_pins,
    'target_count': 122, 'canonical_source_count': 61, 'logical_duplicate_bytes': 662869984,
    'target_records': target_rows, 'canonical_source_records': canonical_rows,
    'atime_observation': {
        'targets_matching_operation_atime': 122 - len(atime_differences),
        'targets_differing_from_operation_atime': atime_differences,
        'canonical_matching_preflight_atime': 61 - len(source_atime_differences),
        'canonical_differing_from_preflight_atime': source_atime_differences,
        'postcheck_hash_reads_may_update_atime': True,
        'atime_was_not_reset_by_postcheck': True,
        'qualification': 'The operation record reports atime restored to its immediately preceding target observation; reviewed code checks that equality. This later check compares current atime before its own hash read to that reported value, not to an assumed permanent inventory atime. Any difference can reflect intervening access; no producing process is attributed. Matching values do not establish continuous absence of access.',
    },
    'metadata_boundary': 'All target bytes/mode/uid/gid/mtime match original inventory and result; target inodes match the recorded replacements. All canonical bytes/stable metadata and inodes match preflight, supporting read-only treatment. Target inode/ctime/birth changes are permitted; access times are separately observed. No inode or timestamp history is rewritten in prior mathematical records.',
    'operation_window': {k: result[k] for k in ['started_utc', 'finished_utc', 'free_before', 'free_after', 'status', 'processed']},
    'free_space_qualification': 'These are filesystem free-space observations made by the operation, not independently attributed reclaimed physical allocation. Other filesystem activity may contribute; logical duplicate bytes are not asserted to equal physical savings.',
    'concurrency_limits': 'No global lock or multi-file rollback was implemented. This bounded postcheck confirms the named files at observation time; it does not authenticate continuous filesystem state. The result reports all122 replacements complete.',
    'preservation_paths': [str(p) for p in preserve],
}
O.write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps({'postcheck': pin(O), 'helper': pin(Path(__file__)),
                  'targets': 122, 'canonical_sources': 61,
                  'atime_target_differences': len(atime_differences),
                  'atime_source_differences': len(source_atime_differences),
                  'preservation_paths': out['preservation_paths']}, indent=2))
