"""Supervisor storage maintenance: retain identical bytes in APFS clones."""
from pathlib import Path
import datetime
import hashlib
import json
import os
import shutil
import stat
import subprocess
import sys
import uuid

ROOT = Path('/Users/sasha/math_gkm')
INVENTORY = Path('/private/tmp/math_gkm_storage_inventory_20261017_1048.json')
REVIEW = Path('/private/tmp/math_gkm_storage_inventory_20261017_1048_independent_review.json')
RESULT = Path('/private/tmp/math_gkm_storage_clone_20261017_1048_result.json')

def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        for chunk in iter(lambda: f.read(1048576), b''):
            h.update(chunk)
    return h.hexdigest()

def metadata(s):
    return {'mode': stat.S_IMODE(s.st_mode), 'uid': s.st_uid,
            'gid': s.st_gid, 'mtime_ns': s.st_mtime_ns,
            'atime_ns': s.st_atime_ns}

def stable_metadata(s):
    return {k: v for k, v in metadata(s).items() if k != 'atime_ns'}

def xattrs(path):
    return subprocess.check_output(['/usr/bin/xattr', str(path)]).strip()

assert Path.cwd() == ROOT
assert len(sys.argv) == 2 and digest(REVIEW) == sys.argv[1]
assert digest(INVENTORY) == '130c069893f0741af85f4073ca9327d690890582967bb22a1483bd9caca2951a'
inventory = json.loads(INVENTORY.read_text())
assert len(inventory['pairs']) == 22 and not inventory['mismatch']
assert sum(p['bytes'] for p in inventory['pairs']) == 46498576
assert not RESULT.exists()
report = {'operation': 'APFS copy-on-write consolidation of identical retained copies',
          'inventory_sha256': digest(INVENTORY), 'review_sha256': digest(REVIEW),
          'started_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
          'free_before': shutil.disk_usage(ROOT).free, 'records': [],
          'scope': 'Closed audited187 compiled archive/object copies only; no partial183 archive or188+ research. Canonical current evidence and committed audit files never replaced; prior consolidation targets excluded.',
          'metadata_boundary': 'Bytes, mode, uid, gid and mtime retain their inventory identity. Each replacement preserves its immediately preceding atime; audit reads may have changed atime since inventory. Inode, ctime and birth time can change. No historical access-time or filesystem identity claim.',
          'status': 'running'}

def save():
    RESULT.write_text(json.dumps(report, indent=2) + '\n')

save()
for entry in inventory['pairs']:
    source, target = Path(entry['source']), Path(entry['target'])
    assert source.resolve() == source and target.resolve() == target
    assert entry['kind'] in ('archive', 'object')
    assert source.parent == ROOT / 'evidence/markov-20825094'
    assert source.suffix in ('.olean', '.ilean')
    if entry['kind'] == 'archive':
        relative = target.relative_to(ROOT / '.control/markov/workers')
        assert int(relative.parts[0]) == 187 and relative.parts[1] == 'artifacts'
        assert source == ROOT.joinpath(*relative.parts[2:])
    else:
        assert target.parent == ROOT / '.control/markov/objects'
        assert target.name == entry['sha256']
    assert len(subprocess.check_output(['/bin/ls', '-lde', str(source)]).splitlines()) == 1
    assert len(subprocess.check_output(['/bin/ls', '-lde', str(target)]).splitlines()) == 1
    before, src = target.lstat(), source.lstat()
    assert stat.S_ISREG(before.st_mode) and stat.S_ISREG(src.st_mode)
    assert before.st_dev == src.st_dev == Path('/private/tmp').stat().st_dev
    assert before.st_ino == entry['inode_before']
    assert before.st_ino != src.st_ino and before.st_nlink == src.st_nlink == 1
    assert before.st_size == src.st_size == entry['bytes']
    assert stable_metadata(before) == {k: entry[k] for k in stable_metadata(before)}
    assert before.st_flags == src.st_flags == 0
    assert not xattrs(source) and not xattrs(target)
    assert digest(source) == digest(target) == entry['sha256']
    temporary = Path('/private/tmp') / ('math_gkm_cow_' + uuid.uuid4().hex)
    try:
        subprocess.run(['/bin/cp', '-c', str(source), str(temporary)], check=True)
        assert digest(temporary) == entry['sha256']
        os.chown(temporary, before.st_uid, before.st_gid)
        os.chmod(temporary, stat.S_IMODE(before.st_mode))
        with temporary.open('rb') as f:
            os.fsync(f.fileno())
        os.utime(temporary, ns=(before.st_atime_ns, before.st_mtime_ns))
        now = target.lstat()
        assert (now.st_ino, now.st_dev) == (before.st_ino, before.st_dev)
        assert stable_metadata(now) == stable_metadata(before)
        assert digest(target) == digest(source) == entry['sha256']
        os.replace(temporary, target)
        assert digest(target) == entry['sha256']
        os.utime(target, ns=(before.st_atime_ns, before.st_mtime_ns))
        after = target.lstat()
        assert metadata(after) == metadata(before) and after.st_size == before.st_size
        assert not xattrs(target) and after.st_flags == before.st_flags
        report['records'].append({'source': str(source), 'target': str(target),
                                  'sha256': entry['sha256'], 'bytes': entry['bytes'],
                                  'metadata_preserved': metadata(after),
                                  'old_inode': before.st_ino, 'new_inode': after.st_ino})
        save()
    finally:
        if temporary.exists():
            temporary.unlink()

report.update(status='complete', finished_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),
              free_after=shutil.disk_usage(ROOT).free, processed=len(report['records']))
save()
print(json.dumps({'status': report['status'], 'processed': report['processed'],
                  'logical_duplicate_bytes': inventory['candidate_bytes'],
                  'free_before_GiB': round(report['free_before']/2**30, 3),
                  'free_after_GiB': round(report['free_after']/2**30, 3),
                  'result': str(RESULT)}, indent=2))
