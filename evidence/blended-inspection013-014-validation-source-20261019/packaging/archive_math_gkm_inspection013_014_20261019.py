from pathlib import Path,PurePosixPath
import json,hashlib,os,stat,tarfile,gzip,io,codecs,re,datetime,shutil
R=Path('/Users/sasha/math_gkm');I=Path('/private/tmp/math_gkm_inspection013_014_preservation_inventory_20261019.json');FIXED='27b5e13458a903504f706f495a9dbbcaef5efbdfa9aa1f62b8f66bd6090f0148';D=R/'evidence/blended-inspection013-014-validation-source-20261019';B=1048576

def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for block in iter(lambda:f.read(B),b''):h.update(block)
 return h.hexdigest()

def canon(o):return (json.dumps(o,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n').encode()

assert sha(I)==FIXED and I.stat().st_size<4*B
s=json.loads(I.read_text());rows=s['selected_files'];assert len(rows)==1384 and sum(r['bytes'] for r in rows)==68626012
names=set()
for row in rows:
 n=PurePosixPath(row['path']);p=Path(row['origin'])
 if n.is_absolute() or '..' in n.parts or not n.parts or str(n) in names:raise ValueError('unsafe/duplicate relative member')
 names.add(str(n))
 if p.is_symlink() or not stat.S_ISREG(p.lstat().st_mode):raise ValueError('nonregular selected source')
 if p.suffix in ['.olean','.ilean','.pyc','.o','.a','.so','.dylib','.c'] or any(v in n.parts for v in ['.lake','.git','objects','build','__pycache__','evaluation','evaluations','curation','curator']):raise ValueError('compiled/private/cache selected source')
D.mkdir(parents=True,exist_ok=False)
A=D/'inspection013-014-source-evidence.tar.gz'
m=dict(schema='math-gkm.closed-inspection013-014-source-evidence.v1',fixed_selection_sha256=FIXED,scope=s['scope'],versions=s['versions'],members=rows,original_source_files=len(rows),original_source_bytes=s['selected_source_bytes'],exclusions=s['excluded'],fixture_association=s['selection_note'],test_runs=s['test_runs'],buffer_bytes=B,tests_or_compilers_run_by_packager=False,private_evaluation_read_or_selected=False,active_files_selected=False)
raw=canon(m)
class CheckedReader:
 def __init__(self,p,row):self.f=p.open('rb');self.row=row;self.before=os.fstat(self.f.fileno());self.h=hashlib.sha256();self.count=0
 def read(self,n=-1):
  block=self.f.read(min(n,B) if n>=0 else B);self.h.update(block);self.count+=len(block);return block
 def close(self):
  after=os.fstat(self.f.fileno());self.f.close();identity=lambda v:(v.st_dev,v.st_ino,v.st_size,v.st_mtime_ns,v.st_ctime_ns)
  if identity(after)!=identity(self.before) or self.count!=self.row['bytes'] or self.h.hexdigest()!=self.row['sha256']:raise ValueError('selected source changed while archiving')
with A.open('xb') as f,gzip.GzipFile(fileobj=f,mode='wb',filename='',mtime=0) as gz,tarfile.open(fileobj=gz,mode='w|') as tar:
 for row in rows:
  t=tarfile.TarInfo(row['path']);t.mode=0o444;t.mtime=0;t.size=row['bytes'];reader=CheckedReader(Path(row['origin']),row)
  try:tar.addfile(t,reader)
  finally:reader.close()
 t=tarfile.TarInfo('MANIFEST.json');t.mode=0o444;t.mtime=0;t.size=len(raw);tar.addfile(t,io.BytesIO(raw))
(D/'MANIFEST.json').write_bytes(raw);shutil.copyfile(I,D/'SOURCE_SELECTION.json')
patterns=[('openai_key',re.compile(rb'sk-(?:proj-)?[A-Za-z0-9_-]{24,}')),('github_token',re.compile(rb'(?:ghp_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{40,})')),('aws_access_key',re.compile(rb'(?:AKIA|ASIA)[A-Z0-9]{16}')),('private_key',re.compile(rb'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----')),('private_network_url',re.compile(rb'https?://(?:10\.[0-9]|192\.168\.|127\.0\.0\.1|localhost)(?::[0-9]+)?(?:/|\b)'))]
findings=[];text_bytes=0

def scan(source,name,bound):
 global text_bytes
 h=hashlib.sha256();count=0;carry=b'';decoder=codecs.getincrementaldecoder('utf-8')()
 for block in iter(lambda:source.read(B),b''):
  count+=len(block)
  if count>bound or b'\x00' in block:raise ValueError('nontext/oversize source: '+name)
  decoder.decode(block);h.update(block);text_bytes+=len(block);window=carry+block
  for category,pattern in patterns:
   if pattern.search(window) and not any(x['path']==name and x['category']==category for x in findings):findings.append(dict(path=name,category=category))
  carry=window[-256:]
 decoder.decode(b'',final=True);return count,h.hexdigest()

expected={r['path']:r for r in rows};expected['MANIFEST.json']=dict(bytes=len(raw),sha256=hashlib.sha256(raw).hexdigest())
nested={f'checkpoints/{v}/sources/evidence/construction-v3/source-audit-005/inputs/construction-inspector.json.gz' for v in ['013','014']}
assert {r['path'] for r in rows if r['path'].endswith('.gz')}==nested
seen=set();archive_before=sha(A)
with A.open('rb') as f,gzip.GzipFile(fileobj=f,mode='rb') as gz,tarfile.open(fileobj=gz,mode='r|') as tar:
 for t in tar:
  if not t.isfile() or t.linkname or t.name not in expected or t.name in seen:raise ValueError('unexpected/link/nonregular/duplicate member')
  if t.size!=expected[t.name]['bytes']:raise ValueError('member size mismatch')
  seen.add(t.name);source=tar.extractfile(t)
  if t.name in nested:
   h=hashlib.sha256();count=0
   for block in iter(lambda:source.read(B),b''):h.update(block);count+=len(block)
   measured=count,h.hexdigest()
  else:measured=scan(source,t.name,t.size)
  if measured!=(t.size,expected[t.name]['sha256']):raise ValueError('member SHA mismatch: '+t.name)
assert seen==set(expected)
expanded=[]
with A.open('rb') as f,gzip.GzipFile(fileobj=f,mode='rb') as gz,tarfile.open(fileobj=gz,mode='r|') as tar:
 for t in tar:
  if t.name not in nested:continue
  with gzip.GzipFile(fileobj=tar.extractfile(t),mode='rb') as source:count,h=scan(source,t.name+' (expanded JSON text)',64*B)
  expanded.append(dict(path=t.name,compressed_bytes=t.size,compressed_sha256=expected[t.name]['sha256'],expanded_bytes=count,expanded_sha256=h,expanded_bound_bytes=64*B,disposition='Exact inventoried lossless compressed JSON source evidence, not executable/compiled; no whole JSON parsing; archival bound does not alter validator limits'))
assert len(expanded)==2 and sha(A)==archive_before
bad=[r['path'] for r in rows if sha(r['origin'])!=r['sha256']]
if bad:raise ValueError('original after-hash changed')
for v in ['013','014']:
 prefix='checkpoints/'+v+'/sources/';mp=next(r for r in rows if r['path']=='checkpoints/'+v+'/SOURCE_MANIFEST.json');original=json.loads(Path(mp['origin']).read_text())
 bindings={r['path'][len(prefix):]:r['sha256'] for r in rows if r['path'].startswith(prefix)}
 if bindings!=original['files_sha256']:raise ValueError('checkpoint source map mismatch')
verification=dict(schema='math-gkm.closed-source-evidence-verification.v3',UTC=datetime.datetime.now(datetime.timezone.utc).isoformat(),archive=A.name,archive_sha256=archive_before,compressed_bytes=A.stat().st_size,original_source_files=len(rows),archive_regular_members=len(seen),original_source_bytes=sum(r['bytes'] for r in rows),manifest_sha256=sha(D/'MANIFEST.json'),fixed_selection_sha256=FIXED,all_members_stream_verified=True,original_after_hashes_verified=len(rows),original_after_mismatches=[],links_or_compiled_payloads=0,private_evaluation_or_active_files_selected=False,source_bindings={'013':367,'014':368},nested_lossless_source_artifacts=expanded,buffer_bytes=B,tests_or_compilers_run_by_packager=False,scope='Closed source and engineering observations only;013 constructor timeout retained,014 producer and restricted-branch engineering validation positive, no installation/registry admission/general conjecture/cold bootstrap claim')
scan_record=dict(schema='math-gkm.bounded-publication-scan.v3',archive_sha256=archive_before,scanned_source_text_bytes=text_bytes,verified_regular_members=len(seen),UTF8_no_NUL_scope='All regular text members; exact two compressed JSON source members scanned after bounded decompression',pattern_categories=[p[0] for p in patterns],findings=findings,finding_count=len(findings),private_evaluation_sources_selected=False,active_sources_selected=False,nested_expansion_bound_bytes=64*B,scope='Bounded common credential/private-endpoint scan, not a proof that arbitrary secrets are absent')
(D/'VERIFICATION.json').write_bytes(canon(verification));(D/'PUBLICATION_SCAN.json').write_bytes(canon(scan_record))
if findings:raise ValueError('publication scan findings require review; values not printed')
# These separately authorized sidecars do not alter the fixed archive selection.
sidecars=[(Path('/private/tmp/math_gkm_v3_largepilot014_v2_finished_audit.md'),'b19577c0805f5e4ef6fcfb8410ad9b41035b3ecc624d19b2c1ce9ef6b91e8d1e'),(Path('/private/tmp/math_gkm_inspection013_014_preservation_proposal_20261019.md'),'05fa1210495897beb688e8ab8897adc972125777370a28426ab6fece825c2fcd')]
extra=[];(D/'sidecars').mkdir()
for p,h in sidecars:
 if sha(p)!=h:raise ValueError('authorized sidecar SHA mismatch')
 with p.open('rb') as f:scan(f,'sidecars/'+p.name,p.stat().st_size)
 shutil.copyfile(p,D/'sidecars'/p.name);extra.append(dict(path='sidecars/'+p.name,origin=str(p),bytes=p.stat().st_size,sha256=h,scope='Separate parent-authorized sidecar, not retroactively added to the fixed archive selection'))
if findings:raise ValueError('sidecar scan requires review')
(D/'SIDECARS.json').write_bytes(canon(dict(archive_sha256=archive_before,archive_unchanged=True,members=extra)))
(D/'README.md').write_text('''This package preserves the closed013/014 engineering sources, their actual failed and successful checks, and byte-exact PUBLIC proof fixture data. It does not establish installation or registry admission, the general Markov conjecture, a completed historical differential, full-Mathlib startup readiness or a cold bootstrap. No tests, Lean processes, source edits, deletions or Git actions were performed during packaging.

The archive contains the complete frozen367-source013 and368-source014 checkpoints, executed source constructor prompts/events/receipts and before/after protected inventories, independent source/resource reviews, actual pure013/producer013/producer014 records, and both closed largepilot attempts. The013 constructor exceeded its360-second deadline: child exit0 does not override its TimeoutError/outer exit1. The014 constructor completed normally, outer198.656 seconds/exit0. All original source bytes remain locally preserved.

Actual pure013 passed32 tests. Producer013 reported1PASS/1FAIL, but its apparent capacity-negative PASS was inconclusive because unrelated utility elaboration errors could also produce the later failure token. Producer014 passed both repaired methods: clean utility elaboration, eight SHA/chunk vectors, completed producer-consumer/content binding, record/total limits and a faithful unrelated-error negative. Raw failure evidence is preserved.

Largepilot v1 failed at workspace setup and receipt equality: the extra dependency symlink chain prevented Mathlib resolution, while persisted JSON normalizes integer process-ID dictionary keys. This is not a mathematical counterexample. V2 uses the ordinary existing resolved-package dependency layout in its fresh workspace and compares normalized persisted data. The same original PUBLIC task, solution, mathematical context, dependency pins and900-second validator budget then passed10 compiles,10 kernel replays and one complete trusted premise inspection. Its compact catalog is3,022,351 bytes; checked:true, FINISHED-bound reuse and standard-only reported axioms were independently verified. The target is the restricted all-false branch theorem for the1/n family, not arbitrary Markov paths or completion of the manuscript root. The engineering result does not retroactively admit the original pilot submission to a registry. A separate final independent scope audit is provided under sidecars/ and SIDECARS.json; it is not a retroactive archive selection change.

inspection013-014-source-evidence.tar.gz has stable relative regular members only. MANIFEST.json, both embedded and alongside the archive, records exact original hashes, sizes and source maps. SOURCE_SELECTION.json is the byte-exact parent-approved selection. VERIFICATION.json records a streamed reread of every member and all original after-hashes; PUBLICATION_SCAN.json records bounded UTF8/no-NUL and common credential/private-endpoint scanning, not a guarantee that arbitrary secrets are absent. Buffers are at most1MiB. Two exact frozen construction-inspector.json.gz members preserve lossless historical JSON source evidence; expanded text was scanned under a64MiB per-member archival bound, without whole-catalog parsing. This archival bound does not change validator limits.

The selection includes31 synthetic fixture roots:27 associated with pure013 and two with each producer run. Known test-specific prefixes and the closed intent/result intervals with0.2-second tolerance establish timestamp association, not proven causal ownership. Selected files were then fixed by exact hashes. Thirteen link/build/evaluation exclusions are declared; excluded synthetic evaluation derivatives regenerate from retained tests. No actual private evaluation suite, curator task or answer, active output, compiled object or dependency cache is selected.

For reconstruction, restore checkpoints/<version>/sources/ according to that version's SOURCE_MANIFEST.json into a separate reviewed source tree. Retain historical MathGKM.lean and main mathematical sources when applying a reviewed harness overlay. Exact helper sources, fixture task/solution/context, generated Lean utility/proof files, pins, REBUILD maps, sandbox profiles, executed commands and actual receipts are retained. Use the recorded pinned Lean4.32.2/mathlib and Darwin Python host; ordinary dependencies(workspace) resolves the package links as the successfulv2 operator specifies. This source archive does not ship dependency cache blobs or prove fresh-platform setup. Old010 inspector references remain the exact report-repair008-009-010 public source archive from733914c8e7883f3eb6340d7f213ee7e3e4800d9b, SHAe164c426cb48ba26a467e29c7a4717498b7285d3fb80a76579bf1c1d724eba96. The preceding closed011/012 failures remain in ../blended-inspection-repair-source-20261018/.

The fixed007 profile is unchanged: Darwin OS free percentage30/25, charged footprint4/5GiB, absolute aggregate RSS8GiB, disk8/5GiB, one heavy lease and one Lean elaborator. The successfulv2 observation peaked at native1,004,835,296 bytes and RSS5,847,498,752 bytes; outer187.574 seconds/exit0/cleanup[]. All22 recorded owned native process identities were subsequently absent. These are bounded observations, not an absolute OOM guarantee. Parent approval and independent review remain necessary before publication or installation. Engineering fixture knowledge must remain outside future clean research seeds.
''')
# Keep the exact inventory/packaging tools as separately hashed reproduction sidecars.
(D/'packaging').mkdir();tools=[]
for p in [Path('/private/tmp/inventory_math_gkm_inspection013_014_20261019.py'),Path(__file__)]:
 q=D/'packaging'/p.name;shutil.copyfile(p,q);tools.append(dict(path='packaging/'+p.name,bytes=q.stat().st_size,sha256=sha(q)))
(D/'PACKAGING_TOOLS.json').write_bytes(canon(dict(archive_sha256=archive_before,scope='Packaging implementation only; not frozen harness changes or executed mathematical proofs',members=tools)))
print(json.dumps(dict(destination=str(D),archive_sha256=archive_before,compressed_bytes=A.stat().st_size,raw_source_bytes=verification['original_source_bytes'],regular_members=len(seen),original_files=len(rows),manifest_sha256=sha(D/'MANIFEST.json'),verification_sha256=sha(D/'VERIFICATION.json'),scan_sha256=sha(D/'PUBLICATION_SCAN.json'),scan_findings=len(findings),README_sha256=sha(D/'README.md'),sidecars_sha256=sha(D/'SIDECARS.json'),tools_sha256=sha(D/'PACKAGING_TOOLS.json')),indent=2))
