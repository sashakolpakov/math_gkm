from pathlib import Path
import datetime, gzip, hashlib, io, json, tarfile

ROOT = Path('/Users/sasha/math_gkm')
PLAN = Path('/private/tmp/math_gkm_cleanup_public_source_plan_20261017_1130.json')
OUT = Path('/private/tmp/math_gkm_recovery_20261017')
assert hashlib.sha256(PLAN.read_bytes()).hexdigest() == 'a5cf811953a60072acce235dbe0c05335d75fc2f759d7a208ec137fed50b0851'
plan = json.loads(PLAN.read_text())
OUT.mkdir(exist_ok=True)
entries = {}
for c in plan['candidates']:
    h = c['expected_sha256']
    e = entries.setdefault(h, dict(sha256=h, size=c['bytes'], current_paths=[], restore_paths=[], sources=[]))
    e['current_paths'].append(c['relative_path'])
    e['restore_paths'].extend(str(Path(p).relative_to(ROOT)) for p in c['deletion_candidate_paths_after_release_verification'])
    e['sources'].extend(dict(path=s['relative_path'], sha256=s['sha256'], git_blob=s['public_tree_blob']) for s in c['retained_public_source_candidates'])
for e in entries.values():
    e['current_paths'] = sorted(set(e['current_paths']))
    e['restore_paths'] = sorted(set(e['restore_paths']))
    e['sources'] = list({s['path']: s for s in e['sources']}.values())
groups = []
for h, e in entries.items():
    if not groups or sum(entries[x]['size'] for x in groups[-1]) + e['size'] > 700 * 1024**2:
        groups.append([])
    groups[-1].append(h)
assets = []
for number, group in enumerate(groups, 1):
    name = f'inactive-lean-cache-{number:03d}.tar.gz'
    path = OUT / name
    assert not path.exists(), path
    with path.open('xb') as raw:
        with gzip.GzipFile(filename='', fileobj=raw, mode='wb', compresslevel=6, mtime=0) as compressed:
            with tarfile.open(fileobj=compressed, mode='w|', format=tarfile.USTAR_FORMAT) as archive:
                for h in group:
                    e = entries[h]
                    source = ROOT / e['current_paths'][0]
                    assert source.is_file() and not source.is_symlink()
                    before = source.stat()
                    with source.open('rb') as f:
                        assert hashlib.file_digest(f, 'sha256').hexdigest() == h
                    info = tarfile.TarInfo('objects/' + h)
                    info.size = e['size']
                    info.mode = 0o644
                    with source.open('rb') as f:
                        archive.addfile(info, f)
                    assert source.stat() == before
                    e['asset'] = name
    assert path.stat().st_size < 2 * 1024**3
    with path.open('rb') as f:
        digest = hashlib.file_digest(f, 'sha256').hexdigest()
    assets.append(dict(name=name, size=path.stat().st_size, sha256=digest, objects=group))
    print(json.dumps(dict(asset=name, bytes=path.stat().st_size, objects=len(group))), flush=True)
manifest = dict(schema=1, created_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(), repository='sashakolpakov/math_gkm', tag='recovery-cache-2026-10-17', public_source_commit=plan['public_source_reference']['tree'], local_plan_sha256=hashlib.sha256(PLAN.read_bytes()).hexdigest(), purpose='Exact optional historical Lean cache recovery before local-only cleanup. Source availability does not establish successful fresh compilation; cached objects retain their historical validation status. Active accepted188 and interrupted189 objects are excluded.', lean_toolchain=(ROOT/'lean-toolchain').read_text().strip(), platform='darwin-arm64', objects=entries, assets=assets)
(OUT/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
(OUT/'SHA256SUMS').write_text(''.join(f"{a['sha256']}  {a['name']}\n" for a in assets) + hashlib.sha256((OUT/'manifest.json').read_bytes()).hexdigest()+'  manifest.json\n')
print(json.dumps(dict(output=str(OUT), assets=len(assets), objects=len(entries), compressed_bytes=sum(a['size'] for a in assets))), flush=True)
