from pathlib import Path
import json,hashlib,tarfile,gzip,codecs,re,datetime,ast
D=Path('/Users/sasha/math_gkm/evidence/blended-inspection-repair-source-20261018');A=D/'inspection011-012-source-evidence.tar.gz';B=1048576
I=D/'SOURCE_SELECTION.json';EXPECTED='090f190bc3042bad5cf3adfe54d69d015be41f7fa7cf3c6781e9f298e31b34e1'
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(B),b''):h.update(b)
 return h.hexdigest()
def canon(o):return (json.dumps(o,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n').encode()
assert sha(I)==EXPECTED
m=json.loads((D/'MANIFEST.json').read_text());selection=json.loads(I.read_text());rows=m['members'];original={r['path']:r for r in rows};expected={**original,'MANIFEST.json':dict(bytes=(D/'MANIFEST.json').stat().st_size,sha256=sha(D/'MANIFEST.json'))}
nested={f'checkpoints/{v}/sources/evidence/construction-v3/source-audit-005/inputs/construction-inspector.json.gz' for v in ['011','012']}
assert {r['path'] for r in rows if r['path'].endswith('.gz')}==nested
if (D/'VERIFICATION.json').exists():raise ValueError('fresh verifier result required')
(D/'FAILED_VERIFICATION_ATTEMPT_001.json').write_bytes(canon(dict(schema='math-gkm.retained-verification-failure.v1',failure='Generic source UTF8/no-NUL check encountered exact frozen lossless construction-inspector.json.gz compressed source evidence',failed_script='/private/tmp/archive_math_gkm_inspection011_012_20261018.py',failed_script_sha256=sha('/private/tmp/archive_math_gkm_inspection011_012_20261018.py'),archive_fully_written_before_verification=True,archive_or_frozen_bytes_modified=False,revised_scope='Only two exact frozen005 .json.gz paths; compressed SHA and bounded64MiB UTF8/content verification; no validator limit change')))
patterns=[('openai_key',re.compile(rb'sk-(?:proj-)?[A-Za-z0-9_-]{24,}')),('github_token',re.compile(rb'(?:ghp_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{40,})')),('aws_access_key',re.compile(rb'(?:AKIA|ASIA)[A-Z0-9]{16}')),('private_key',re.compile(rb'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----')),('private_network_url',re.compile(rb'https?://(?:10\.[0-9]|192\.168\.|127\.0\.0\.1|localhost)(?::[0-9]+)?(?:/|\b)'))]
findings=[];text_bytes=0
def scan(source,name,bound):
 global text_bytes
 h=hashlib.sha256();count=0;carry=b'';decode=codecs.getincrementaldecoder('utf-8')()
 for block in iter(lambda:source.read(B),b''):
  count+=len(block)
  if count>bound:raise ValueError('finite text expansion bound')
  if b'\x00' in block:raise ValueError('NUL in text: '+name)
  decode.decode(block);h.update(block);text_bytes+=len(block);window=carry+block
  for category,pattern in patterns:
   if pattern.search(window) and not any(v['path']==name and v['category']==category for v in findings):findings.append(dict(path=name,category=category))
  carry=window[-256:]
 decode.decode(b'',final=True);return count,h.hexdigest()
seen=set();archive_before=sha(A)
with A.open('rb') as f,gzip.GzipFile(fileobj=f,mode='rb') as gz,tarfile.open(fileobj=gz,mode='r|') as tar:
 for t in tar:
  if not t.isfile() or t.linkname or t.name not in expected or t.name in seen:raise ValueError('unexpected/nonregular/link/duplicate member')
  if t.size!=expected[t.name]['bytes']:raise ValueError('member size')
  seen.add(t.name);source=tar.extractfile(t)
  if t.name in nested:
   h=hashlib.sha256();count=0
   for block in iter(lambda:source.read(B),b''):h.update(block);count+=len(block)
   measured=(count,h.hexdigest())
  else:measured=scan(source,t.name,t.size)
  if measured!=(t.size,expected[t.name]['sha256']):raise ValueError('member hash: '+t.name)
assert seen==set(expected)
expanded=[]
with A.open('rb') as f,gzip.GzipFile(fileobj=f,mode='rb') as gz,tarfile.open(fileobj=gz,mode='r|') as tar:
 for t in tar:
  if t.name not in nested:continue
  with gzip.GzipFile(fileobj=tar.extractfile(t),mode='rb') as source:count,h=scan(source,t.name+' (expanded JSON text)',64*1024**2)
  expanded.append(dict(path=t.name,compressed_bytes=t.size,compressed_sha256=expected[t.name]['sha256'],expanded_bytes=count,expanded_sha256=h,expanded_bound_bytes=64*1024**2,disposition='Exact inventoried lossless compressed JSON source evidence; not executable/compiled payload; no full JSON parse'))
assert len(expanded)==2
assert sha(A)==archive_before
bad=[r['path'] for r in rows if sha(r['origin'])!=r['sha256']]
assert not bad
verification=dict(schema='math-gkm.closed-source-evidence-verification.v2',UTC=datetime.datetime.now(datetime.timezone.utc).isoformat(),archive=A.name,archive_sha256=archive_before,compressed_bytes=A.stat().st_size,original_source_files=len(rows),archive_regular_members=len(seen),original_source_bytes=sum(r['bytes'] for r in rows),manifest_sha256=sha(D/'MANIFEST.json'),fixed_selection_sha256=EXPECTED,all_members_independently_stream_verified=True,original_after_hashes_verified=len(rows),original_after_mismatches=[],links_or_compiled_payloads=0,active013_or_private_evaluation_files=0,source_bindings={'011':364,'012':366},buffer_bytes=B,nested_lossless_source_artifacts=expanded,failed_first_verification_preserved=True,archive_unchanged_across_verification=True,tests_or_compilers_run_by_packager=False,scope='Closed engineering evidence only; no successful producer/admission/cold bootstrap claim')
scan_record=dict(schema='math-gkm.bounded-publication-scan.v2',archive_sha256=archive_before,scanned_source_text_bytes=text_bytes,verified_regular_members=len(seen),UTF8_no_NUL_scope='All regular text members; only exact two compressed JSON members scanned after finite bounded decompression',pattern_categories=[p[0] for p in patterns],findings=findings,finding_count=len(findings),private_evaluation_sources_selected=False,active013_sources_selected=False,nested_expansion_bound_bytes=64*1024**2,scope='Bounded common credential/private-endpoint scan, not proof that arbitrary secrets are absent')
(D/'VERIFICATION.json').write_bytes(canon(verification));(D/'PUBLICATION_SCAN.json').write_bytes(canon(scan_record))
old=ast.parse(Path('/private/tmp/archive_math_gkm_inspection011_012_20261018.py').read_text());readme=None
for n in ast.walk(old):
 if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and n.func.attr=='write_text' and n.args and isinstance(n.args[0],ast.Constant) and isinstance(n.args[0].value,str) and n.args[0].value.startswith('This package preserves'):readme=n.args[0].value
assert readme
readme+='\nTwo exact frozen source members are losslessly compressed construction-inspector.json.gz artifacts. Their original compressed bytes/hashes are retained to preserve checkpoint identity. Verification separately streamed the expanded UTF8 JSON text under a64MiB per-member archival bound (actual24807578 bytes each), recording expanded hashes without loading catalog JSON. This bound does not change any validator limit. The initial generic UTF8 verifier failure on compressed bytes is preserved in FAILED_VERIFICATION_ATTEMPT_001.json; archive bytes and selection were unchanged.\n'
(D/'README.md').write_text(readme)
print(json.dumps(dict(directory=str(D),archive_sha256=archive_before,compressed_bytes=A.stat().st_size,original_source_bytes=verification['original_source_bytes'],original_files=len(rows),regular_members=len(seen),manifest_sha256=sha(D/'MANIFEST.json'),verification_sha256=sha(D/'VERIFICATION.json'),publication_scan_sha256=sha(D/'PUBLICATION_SCAN.json'),README_sha256=sha(D/'README.md'),expanded=expanded,scan_findings=findings),indent=2))
