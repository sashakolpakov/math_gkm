from pathlib import Path,PurePosixPath
import json,hashlib,os,stat,tarfile,gzip,io,codecs,re,datetime
ROOT=Path('/Users/sasha/math_gkm'); INV=Path('/private/tmp/math_gkm_inspection011_012_preservation_inventory_v2_20261018.json'); EXPECTED='090f190bc3042bad5cf3adfe54d69d015be41f7fa7cf3c6781e9f298e31b34e1'; DEST=ROOT/'evidence/blended-inspection-repair-source-20261018'; BUFFER=1048576
def sha(path):
 h=hashlib.sha256()
 with Path(path).open('rb') as f:
  for b in iter(lambda:f.read(BUFFER),b''):h.update(b)
 return h.hexdigest()
def canon(o):return (json.dumps(o,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n').encode()
if sha(INV)!=EXPECTED:raise ValueError('fixed selection changed')
if INV.stat().st_size>4*BUFFER:raise ValueError('inventory bound')
selection=json.loads(INV.read_text());rows=selection['selected_files'];names={r['path'] for r in rows}
assert len(names)==1016 and sum(r['bytes'] for r in rows)==53431956
for row in rows:
 n=PurePosixPath(row['path']);p=Path(row['origin'])
 if n.is_absolute() or '..' in n.parts or not n.parts or p.is_symlink() or not stat.S_ISREG(p.lstat().st_mode):raise ValueError('unsafe selected member')
 if p.suffix in ('.olean','.ilean','.pyc','.o','.a','.so','.dylib'):raise ValueError('compiled selection')
 if any(x in n.parts for x in ('source-audit-013','round-0012-executed','evaluation','evaluations','curation','curator','.lake','build','__pycache__')):raise ValueError('excluded active/private/build selection')
DEST.mkdir(parents=True,exist_ok=True);archive=DEST/'inspection011-012-source-evidence.tar.gz'
for n in [archive.name,'MANIFEST.json','SOURCE_SELECTION.json','VERIFICATION.json','PUBLICATION_SCAN.json','README.md']:
 if (DEST/n).exists():raise ValueError('fresh output required: '+n)
manifest=dict(schema='math-gkm.closed-inspection011-012-source-evidence.v1',selection_sha256=EXPECTED,scope=selection['scope'],versions=selection['versions'],members=rows,original_source_bytes=selection['selected_source_bytes'],original_source_files=len(rows),exclusions=selection['excluded'],fixture_association=selection['selection_note'],buffer_bytes=BUFFER,tests_run_by_packager=False,private_evaluation_read_or_selected=False,active013_excluded=True)
raw_manifest=canon(manifest)
class CheckedReader:
 def __init__(self,p,row):self.f=p.open('rb');self.row=row;self.h=hashlib.sha256();self.count=0;self.before=os.fstat(self.f.fileno())
 def read(self,size=-1):
  if size<0 or size>BUFFER:size=BUFFER
  b=self.f.read(size);self.h.update(b);self.count+=len(b);return b
 def close(self):
  after=os.fstat(self.f.fileno());self.f.close()
  ident=lambda st:(st.st_dev,st.st_ino,st.st_size,st.st_mtime_ns,st.st_ctime_ns)
  if ident(after)!=ident(self.before) or self.count!=self.row['bytes'] or self.h.hexdigest()!=self.row['sha256']:raise ValueError('selected source changed during archive')
with archive.open('xb') as fout,gzip.GzipFile(fileobj=fout,mode='wb',mtime=0,filename='') as gz,tarfile.open(fileobj=gz,mode='w|') as tar:
 for row in rows:
  t=tarfile.TarInfo(row['path']);t.size=row['bytes'];t.mode=0o444;t.mtime=0
  reader=CheckedReader(Path(row['origin']),row)
  try:tar.addfile(t,reader)
  finally:reader.close()
 t=tarfile.TarInfo('MANIFEST.json');t.size=len(raw_manifest);t.mode=0o444;t.mtime=0;tar.addfile(t,io.BytesIO(raw_manifest))
(DEST/'MANIFEST.json').write_bytes(raw_manifest);(DEST/'SOURCE_SELECTION.json').write_bytes(INV.read_bytes())
patterns=[('openai_key',re.compile(rb'sk-(?:proj-)?[A-Za-z0-9_-]{24,}')),('github_token',re.compile(rb'(?:ghp_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{40,})')),('aws_access_key',re.compile(rb'(?:AKIA|ASIA)[A-Z0-9]{16}')),('private_key',re.compile(rb'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----')),('private_network_url',re.compile(rb'https?://(?:10\.[0-9]|192\.168\.|127\.0\.0\.1|localhost)(?::[0-9]+)?(?:/|\b)'))]
expected={r['path']:r for r in rows};expected['MANIFEST.json']=dict(bytes=len(raw_manifest),sha256=hashlib.sha256(raw_manifest).hexdigest());seen=set();findings=[];scanned_bytes=0
with archive.open('rb') as fin,gzip.GzipFile(fileobj=fin,mode='rb') as gz,tarfile.open(fileobj=gz,mode='r|') as tar:
 for item in tar:
  if not item.isfile() or item.linkname or item.name not in expected or item.name in seen:raise ValueError('unexpected/link/duplicate member')
  if item.size!=expected[item.name]['bytes']:raise ValueError('member size mismatch')
  seen.add(item.name);h=hashlib.sha256();count=0;carry=b'';decode=codecs.getincrementaldecoder('utf-8')();source=tar.extractfile(item)
  for block in iter(lambda:source.read(BUFFER),b''):
   if b'\x00' in block:raise ValueError('binary NUL in source member: '+item.name)
   decode.decode(block);h.update(block);count+=len(block);scanned_bytes+=len(block);window=carry+block
   for category,pattern in patterns:
    if pattern.search(window) and not any(v['path']==item.name and v['category']==category for v in findings):findings.append(dict(path=item.name,category=category))
   carry=window[-256:]
  decode.decode(b'',final=True)
  if count!=item.size or h.hexdigest()!=expected[item.name]['sha256']:raise ValueError('member hash mismatch')
assert seen==set(expected)
after_bad=[r['path'] for r in rows if sha(r['origin'])!=r['sha256']]
if after_bad:raise ValueError('original changed after packaging')
archive_sha=sha(archive);verification=dict(schema='math-gkm.closed-source-evidence-verification.v1',UTC=datetime.datetime.now(datetime.timezone.utc).isoformat(),archive=archive.name,archive_sha256=archive_sha,compressed_bytes=archive.stat().st_size,original_source_files=len(rows),archive_regular_members=len(seen),original_source_bytes=sum(r['bytes'] for r in rows),manifest_sha256=hashlib.sha256(raw_manifest).hexdigest(),fixed_selection_sha256=EXPECTED,all_members_independently_stream_verified=True,original_after_hashes_verified=len(rows),original_after_mismatches=[],links_or_compiled_payloads=0,active013_or_private_evaluation_files=0,source_bindings={'011':364,'012':366},buffer_bytes=BUFFER,tests_or_compilers_run_by_packager=False,scope='Closed engineering evidence only; no successful producer/admission/cold bootstrap claim')
scan=dict(schema='math-gkm.bounded-publication-scan.v1',archive_sha256=archive_sha,scanned_bytes=scanned_bytes,scanned_regular_members=len(seen),UTF8_and_no_NUL_verified=True,pattern_categories=[p[0] for p in patterns],findings=findings,finding_count=len(findings),private_evaluation_sources_selected=False,active013_sources_selected=False,scope='Bounded common credential/private-endpoint content scan; not proof that arbitrary secrets are absent')
(DEST/'VERIFICATION.json').write_bytes(canon(verification));(DEST/'PUBLICATION_SCAN.json').write_bytes(canon(scan))
(DEST/'README.md').write_text('''This package preserves the closed011/012 engineering source revisions and their actual observations. It contains the full frozen364-source011 and366-source012 checkpoints, completed own-constructor rounds10/11 prompts/receipts/events and operator records, independent source/resource reviews, and the two completed012 test runs with selected source-only synthetic fixtures. Active013 work, private evaluation/curator data, links, package caches and compiled objects are excluded. Original files remain unchanged locally.

The actual results are28 pure tests PASS, followed by one producer test FAIL and one ERROR. The producer code collided with Lean's existing Stream declaration and the dependent M declarations failed elaboration. An empty-input SHA256 string printed in the failed run; the full vector suite and completed producer-consumer path did not pass. These records establish no mathematical admission, full premise-inspection success, complete capacity repair or cold rebuild. No tests were run while packaging.

`inspection011-012-source-evidence.tar.gz` has stable relative names; `MANIFEST.json` records every original member hash/size/path and exact checkpoint hashes. The embedded and sidecar manifests match. `VERIFICATION.json` records an independent streamed reread of every member and all selected original after-hashes. `PUBLICATION_SCAN.json` records bounded UTF8/no-NUL, common credential/private-endpoint checks; it is not a guarantee that arbitrary secrets are absent. All streaming buffers are at most1MiB.

The fixed selection includes25 synthetic fixture roots:23 associated with the pure run and2 with the producer run. Unlogged fixture roots were associated using known test-specific prefixes (repair012-, parser005-, feedback011-, report008-, role-report-repair-) and creation times inside the recorded closed intent/result intervals, with0.2-second tolerance. This is timestamp association, not independently proved causal ownership. Every selected path was fixed by hash before archival. Ten declared link/build/evaluation exclusions are recorded; synthetic evaluation directories regenerate from retained test source. No actual heldout suite/task/answer was selected or read.

To reconstruct either revision, use its checkpoints/<version>/SOURCE_MANIFEST.json file map and copy the byte-exact checkpoints/<version>/sources/<relative-path> files into a separate source tree, preserving the original installed historical MathGKM.lean when applying a reviewed overlay. Full current helper sources are present, including inspection_stream.py and own_feedback.py. Use the pinned lean-toolchain/lake manifests and recorded finite test commands/host environment. The tested host uses Darwin and /opt/homebrew/bin/python3 with pinned Lean4.32.2; this package does not duplicate dependency caches or establish fresh-platform setup. Reproduction should preserve the recorded failures rather than substitute later013 repairs.

Old010 inspector comparison references remain an explicit external prerequisite: obtain the exact published008-009-010 repair source archive from source release733914c8e7883f3eb6340d7f213ee7e3e4800d9b, verify its010 manifest SHA91849c3534793fc2c9b0c77303816bc3d7c322b310eb09d5a9745734953cbd7b, and restore exact referenced files when a later reviewed differential selector requires them. No old controller execution or successful cross-version differential is claimed here. The stale011 installation-disposition table retained inside012 is historical evidence, not installation authorization; independent reviews identify it.

Publication, installation and future clean comparative runs remain parent-controlled. Fixture or learned mathematical source must not enter a future clean seed through this engineering package.
''')
print(json.dumps(dict(destination=str(DEST),archive_sha256=archive_sha,compressed_bytes=archive.stat().st_size,raw_source_bytes=verification['original_source_bytes'],regular_members=len(seen),manifest_sha256=verification['manifest_sha256'],verification_sha256=sha(DEST/'VERIFICATION.json'),scan_sha256=sha(DEST/'PUBLICATION_SCAN.json'),scan_findings=findings,README_sha256=sha(DEST/'README.md')),indent=2))
