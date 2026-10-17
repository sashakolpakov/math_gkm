"""Storage-only read-only preflight; never imports/executes project or clone code."""
from pathlib import Path
from datetime import datetime, timezone
import ast, collections, hashlib, json, os, stat, subprocess

R = Path('/Users/sasha/math_gkm')
T = Path('/private/tmp')
I = T / 'math_gkm_storage_inventory_20261017_0444.json'
C = T / 'math_gkm_storage_clone_20261017_0444.py'
O = T / 'math_gkm_storage_inventory_20261017_0444_independent_review.json'
assert not O.exists()
start = datetime.now(timezone.utc).isoformat()

def digest(p):
    with Path(p).open('rb') as f:
        return hashlib.file_digest(f, 'sha256').hexdigest()

def file_pin(p):
    p = Path(p)
    return {'path': str(p), 'bytes': p.stat().st_size, 'sha256': digest(p)}

def meta(s):
    return {'bytes': s.st_size, 'mode': stat.S_IMODE(s.st_mode), 'uid': s.st_uid,
            'gid': s.st_gid, 'mtime_ns': s.st_mtime_ns, 'atime_ns': s.st_atime_ns,
            'inode': s.st_ino, 'device': s.st_dev, 'links': s.st_nlink,
            'flags': s.st_flags}

def stable(m):
    return {k: v for k, v in m.items() if k != 'atime_ns'}

assert digest(I) == 'b55b281ef8fcdcc3fbad6600fa43cc6c8ad5041bddc877183ace437b3ca64c88'
assert digest(C) == '93f16eb00fdaaa3ca9dba8fdbb770fffc075ac8fbee67dd137037188d0debc83'
inventory = json.loads(I.read_text())
ast.parse(C.read_text())
inventory_helper = Path(inventory['inventory_helper']['path'])
assert inventory_helper == T / 'math_gkm_storage_inventory_20261017_0444.py'
assert digest(inventory_helper) == inventory['inventory_helper']['sha256']
ast.parse(inventory_helper.read_text())

excluded = set()
def norm(s):
    return str(R / s) if s.startswith(('.control/', '.bootstrap/', 'evidence/')) else s
def collect(x, context=''):
    if isinstance(x, dict):
        for k, v in x.items():
            if k in ('target', 'archive', 'object') and isinstance(v, str) and '/' in v:
                excluded.add(norm(v))
            if k == 'path' and context == 'targets' and isinstance(v, str):
                excluded.add(norm(v))
            collect(v, k if k == 'targets' else context)
    elif isinstance(x, list):
        for v in x:
            collect(v, context)

prior_pins = []
assert len(inventory['exclusion_plans']) == len(set(inventory['exclusion_plans'])) == 32
for name in inventory['exclusion_plans']:
    p = Path(name)
    assert p.is_relative_to(R / '.bootstrap') and p.suffix == '.json'
    raw = p.read_bytes()
    collect(json.loads(raw))
    prior_pins.append({'path': name, 'bytes': len(raw), 'sha256': hashlib.sha256(raw).hexdigest()})
assert len(excluded) == inventory['excluded_target_count'] == 5849

receipt_bindings = []
proof_pins = {}
tags = {}
assert [x['worker'] for x in inventory['receipts']] == [172, 173, 174]
for row in inventory['receipts']:
    worker = row['worker']
    request = row['request']
    tags['markov-' + request[:8]] = worker
    receipt = R / '.control/markov/workers' / f'{worker:06d}' / 'receipt.json'
    assert digest(receipt) == row['sha256']
    r = json.loads(receipt.read_text())
    assert r['request_id'] == request and r['outcome'] == row['outcome'] == 'completed'
    assert r['returncode'] == row['returncode'] == 0 and r['report'] is not None
    seal_path = Path(row['audit_seal'])
    assert seal_path == R / '.bootstrap/independent-controller-audit' / f'markov_worker_{worker:06d}_audit_integrity.json'
    assert digest(seal_path) == row['audit_seal_sha256']
    seal = json.loads(seal_path.read_text())
    assert seal['worker'] == worker and seal['request'] == request
    assert seal['historical_outcome']['outcome'] == 'completed' and seal['historical_outcome']['returncode'] == 0
    assert seal['crossreview']['both_final_audit_files_only_reviews_received'] is True
    assert seal['final_observations']['project_reads_closed'] is True
    evidence_name = f'markov_worker_{worker:06d}_validation_evidence.json'
    binding = next(x for x in seal['files'] if Path(x['path']).name == evidence_name)
    evidence_path = R / '.bootstrap/independent-controller-audit' / evidence_name
    assert evidence_path.stat().st_size == binding['bytes'] and digest(evidence_path) == binding['sha256']
    evidence = json.loads(evidence_path.read_text())
    proof_pins[worker] = evidence['input_hashes']
    receipt_bindings.append({'worker': worker, 'request': request, 'receipt': file_pin(receipt),
                             'seal': file_pin(seal_path), 'sealed_validation': file_pin(evidence_path),
                             'receipt_and_seal_agree': True})

pairs = inventory['pairs']
assert not inventory['mismatch'] and len(pairs) == inventory['candidate_count'] == 122
assert sum(x['bytes'] for x in pairs) == inventory['candidate_bytes'] == 662869984
sources = {x['source'] for x in pairs}
targets = {x['target'] for x in pairs}
assert len(sources) == 61 and len(targets) == 122 and not (sources & targets)
assert not (targets & excluded)
expected_targets = set()
source_rows = []
target_rows = []
checked = {}
device = T.stat().st_dev

def inspect(path, expected_hash):
    p = Path(path)
    assert p.resolve() == p
    before = p.lstat()
    assert stat.S_ISREG(before.st_mode) and before.st_nlink == 1 and before.st_flags == 0
    assert before.st_dev == device
    attrs = subprocess.check_output(['/usr/bin/xattr', str(p)]).strip()
    acl_lines = subprocess.check_output(['/bin/ls', '-lde', str(p)], text=True).splitlines()
    assert not attrs and len(acl_lines) == 1
    assert digest(p) == expected_hash
    after = p.lstat()
    assert stable(meta(before)) == stable(meta(after))
    return {'path': str(p), 'sha256': expected_hash, 'before_review': meta(before),
            'after_review': meta(after), 'empty_xattrs': True, 'no_acl_entries': True,
            'hash_matches': True, 'stable_during_review': True}

for source_name in sorted(sources):
    source = Path(source_name)
    assert source.parent.parent == R / 'evidence' and source.parent.name in tags
    assert source.suffix in ('.olean', '.ilean')
    worker = tags[source.parent.name]
    rows = [x for x in pairs if x['source'] == source_name]
    assert len(rows) == 2 and len({x['sha256'] for x in rows}) == 1
    expected_hash = rows[0]['sha256']
    archive = R / '.control/markov/workers' / f'{worker:06d}' / 'artifacts' / source.relative_to(R)
    object_path = R / '.control/markov/objects' / expected_hash
    expected_targets.update([str(archive), str(object_path)])
    assert {x['target'] for x in rows} == {str(archive), str(object_path)}
    assert proof_pins[worker][source_name] == proof_pins[worker][str(archive)] == expected_hash
    row = inspect(source, expected_hash)
    row.update(worker=worker, sealed_source_and_archive_hash_binding=True,
               archive_target=str(archive), content_addressed_target=str(object_path))
    checked[source_name] = row
    source_rows.append(row)
assert expected_targets == targets

for entry in pairs:
    source, target = Path(entry['source']), Path(entry['target'])
    row = inspect(target, entry['sha256'])
    before = row['before_review']
    assert all(before[k] == entry[k] for k in ['bytes', 'mode', 'uid', 'gid', 'mtime_ns'])
    assert before['inode'] == entry['inode_before']
    assert before['inode'] != checked[str(source)]['after_review']['inode']
    assert before['bytes'] == checked[str(source)]['after_review']['bytes']
    row.update(source=str(source), inventory_metadata_match=True,
               inventory_inode_match=True, outside_prior_target_exclusions=True,
               inventory_atime_ns=entry['atime_ns'], atime_change_since_inventory_permitted=True)
    target_rows.append(row)

assert digest(I) == 'b55b281ef8fcdcc3fbad6600fa43cc6c8ad5041bddc877183ace437b3ca64c88'
assert digest(C) == '93f16eb00fdaaa3ca9dba8fdbb770fffc075ac8fbee67dd137037188d0debc83'
out = {
    'operation': 'Independent storage-only preflight',
    'scope': 'Exact sealed closed172-174 compiled archive/object targets only. No175+ inspection, project or mathematical program execution, operation execution, research advice or project mutation. Canonical current evidence is read-only; hash reads may alter atime. Historical mathematical audit windows remain unchanged.',
    'started_utc': start, 'finished_utc': datetime.now(timezone.utc).isoformat(),
    'concurrence': True, 'necessary_corrections': [], 'operation_executed': False,
    'own_pre_output_refinement': {'prior_helper_sha256': 'fcfb39ae4aa9d7c672b8cbc3fc8d5064e9750c59214b35548cf5548fe873155b', 'reason': 'The environment os module has no listxattr API. First read-only check stopped before output or mutation; switched to the same read-only /usr/bin/xattr listing used by the proposed operation.'},
    'inventory': file_pin(I), 'inventory_helper': file_pin(inventory_helper), 'proposed_operation': file_pin(C),
    'independent_check_helper': file_pin(Path(__file__)),
    'candidate_count': len(pairs), 'canonical_source_count': len(sources),
    'candidate_bytes': sum(x['bytes'] for x in pairs),
    'worker_target_counts': dict(collections.Counter(tags[Path(x['source']).parent.name] for x in pairs)),
    'archive_target_count': 61, 'content_addressed_target_count': 61,
    'receipt_and_seal_bindings': receipt_bindings,
    'prior_record_count': len(prior_pins), 'prior_target_exclusion_count': len(excluded),
    'prior_records': prior_pins, 'prior_target_intersection': [],
    'canonical_sources': source_rows, 'targets': target_rows,
    'script_review': {
        'ast_parsed_without_execution': True, 'inventory_and_review_digests_required': True,
        'closed_archive_targets_or_exact_hash_object_targets_only': True,
        'canonical_paths_never_replacement_targets': True,
        'regular_distinct_same_volume_single_link_files_required': True,
        'no_acl_xattrs_flags_required': True,
        'hashes_checked_before_staging_and_again_before_replace': True,
        'clone_staged_and_digest_verified_before_atomic_replace': True,
        'bytes_mode_uid_gid_mtime_preserved': True,
        'target_atime_restored_to_immediate_per_operation_observation': True,
        'inode_ctime_birth_time_may_change': True,
        'temporary_cleanup_in_finally': True,
        'per_target_progress_recorded': True,
        'interprocess_lock': False, 'multi_file_rollback': False,
        'limits': 'No global transaction or lock: per-target rechecks are bounded observations, not a concurrency-proof guarantee. A later failure may leave earlier verified replacements and a partial result record. Canonical evidence is not written; source hashing may affect its atime. The operation must preserve its own immediately preceding target atime rather than the older inventory/review atime.',
        'child_static_concurrence': '/root/monitoring_audit/sealed136_review/method138 independently read exact inventory and both helpers; no necessary correction; no operation or project execution.',
    },
}
O.write_text(json.dumps(out, indent=2) + '\n')
print(json.dumps({'review': file_pin(O), 'candidates': len(pairs), 'sources': len(sources),
                  'bytes': out['candidate_bytes'], 'concurrence': True,
                  'started_utc': start, 'finished_utc': out['finished_utc']}, indent=2))
