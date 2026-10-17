from pathlib import Path
import concurrent.futures, datetime, hashlib, json, subprocess, urllib.request

ROOT=Path('/Users/sasha/math_gkm')
OUT=Path('/private/tmp/math_gkm_recovery_20261017')
data=json.loads((OUT/'manifest.json').read_text())
release=json.loads(subprocess.check_output(['gh','api','repos/sashakolpakov/math_gkm/releases/tags/recovery-cache-2026-10-17'],cwd=ROOT))
assert release['tag_name']==data['tag'] and not release['draft']
assets={a['name']:a for a in release['assets']}
expected={a['name']:a for a in data['assets']}
for name in ['manifest.json','SHA256SUMS']:
    p=OUT/name
    expected[name]=dict(name=name,size=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())

def verify(name):
    expected_asset=expected[name]
    actual=assets[name]
    assert actual['state']=='uploaded' and actual['size']==expected_asset['size']
    if actual.get('digest'):
        assert actual['digest']=='sha256:'+expected_asset['sha256']
    h=hashlib.sha256(); count=0
    req=urllib.request.Request(actual['browser_download_url'],headers={'User-Agent':'math-gkm-recovery-verifier'})
    with urllib.request.urlopen(req,timeout=180) as r:
        while chunk:=r.read(8*1024*1024):
            count+=len(chunk);h.update(chunk)
    assert count==expected_asset['size'] and h.hexdigest()==expected_asset['sha256']
    record=dict(name=name,url=actual['browser_download_url'],asset_id=actual['id'],bytes_downloaded=count,sha256=h.hexdigest())
    print(json.dumps(record),flush=True)
    return record

with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:
    results=list(pool.map(verify,expected))
record=dict(verified_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),method='Separate public HTTPS download of every asset; streamed SHA-256 and length verification, plus GitHub asset metadata digest when present.',release_id=release['id'],release_url=release['html_url'],manifest_sha256=hashlib.sha256((OUT/'manifest.json').read_bytes()).hexdigest(),assets=results)
(OUT/'remote-download-verification.json').write_text(json.dumps(record,indent=2)+'\n')
print('ALL RELEASE DOWNLOADS VERIFIED',flush=True)
