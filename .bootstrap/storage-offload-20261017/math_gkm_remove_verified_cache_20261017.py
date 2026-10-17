from pathlib import Path
import datetime, fcntl, hashlib, json, shutil, subprocess

ROOT=Path('/Users/sasha/math_gkm')
workspace_lock=(ROOT/'.control/workspace.lock').open('a')
fcntl.flock(workspace_lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
OUT=Path('/private/tmp/math_gkm_recovery_20261017')
PLAN=Path('/private/tmp/math_gkm_cleanup_public_source_plan_20261017_1130.json')
assert hashlib.sha256(PLAN.read_bytes()).hexdigest()=='a5cf811953a60072acce235dbe0c05335d75fc2f759d7a208ec137fed50b0851'
plan=json.loads(PLAN.read_text())
manifest=json.loads((OUT/'manifest.json').read_text())
download=json.loads((OUT/'remote-download-verification.json').read_text())
contents=json.loads((OUT/'archive-content-verification.json').read_text())
manifest_hash=hashlib.sha256((OUT/'manifest.json').read_bytes()).hexdigest()
assert download['manifest_sha256']==contents['manifest_sha256']==manifest_hash
remote={a['name']:a for a in download['assets']}
checked={a['asset']:a for a in contents['results']}
for a in manifest['assets']:
    assert remote[a['name']]['sha256']==a['sha256'] and remote[a['name']]['bytes_downloaded']==a['size']
    assert checked[a['name']]['objects_verified']==len(a['objects'])
tracked=set(subprocess.check_output(['git','ls-files','-z'],cwd=ROOT).decode().split('\0'))
paths={}
for c in plan['candidates']:
    e=manifest['objects'][c['expected_sha256']]
    assert c['relative_path'] in e['current_paths']
    for value in c['deletion_candidate_paths_after_release_verification']:
        p=Path(value); rel=str(p.relative_to(ROOT))
        assert rel not in tracked and rel in e['restore_paths']
        assert rel.startswith(('evidence/','.control/markov/workers/','.control/markov/objects/'))
        assert '/markov-73199834/' not in rel and '/markov-97b019af/' not in rel
        assert p.resolve()==p and not p.is_symlink() and p.is_file()
        assert p.stat().st_size==e['size']
        with p.open('rb') as f: assert hashlib.file_digest(f,'sha256').hexdigest()==e['sha256']
        paths[rel]=dict(sha256=e['sha256'],size=e['size'],mtime_ns=p.stat().st_mtime_ns,inode=p.stat().st_ino)
assert len(paths)==1864
record_path=OUT/'local-cleanup.json'
assert not record_path.exists()
record=dict(started_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),manifest_sha256=manifest_hash,release_url=download['release_url'],plan_sha256=hashlib.sha256(PLAN.read_bytes()).hexdigest(),git_head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT).decode().strip(),free_before=shutil.disk_usage(ROOT).free,planned_paths=paths,removed_paths=[],status='validated; deleting untracked cache copies only')
record_path.write_text(json.dumps(record,indent=2)+'\n')
for rel, pin in paths.items():
    p=ROOT/rel
    s=p.stat()
    assert s.st_ino==pin['inode'] and s.st_mtime_ns==pin['mtime_ns'] and s.st_size==pin['size']
    p.unlink()
    record['removed_paths'].append(rel)
record.update(status='complete',finished_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),free_after=shutil.disk_usage(ROOT).free)
record_path.write_text(json.dumps(record,indent=2)+'\n')
assert not any((ROOT/p).exists() for p in paths)
print(json.dumps({k:v for k,v in record.items() if k not in ('planned_paths','removed_paths')}),flush=True)
print('removed',len(paths),'untracked cache paths; no Git tracked paths removed',flush=True)
