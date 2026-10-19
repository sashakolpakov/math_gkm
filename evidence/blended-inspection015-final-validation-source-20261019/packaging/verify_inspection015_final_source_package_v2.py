"""Stream-verify the preserved source package; no Lean, network or extraction.

python3 verify_inspection015_final_source_package.py --directory /PATH/TO/PACKAGE
Add --check-originals only on the original retained host tree.
"""
from pathlib import Path,PurePosixPath
import argparse,codecs,datetime,gzip,hashlib,json,re,tarfile
B=1048576
FIXED='b74c04047392f09f6710408f38dd90661e0ab9f6d860dce6734de61ebcb54f0f'
NESTED='checkpoints/015/sources/evidence/construction-v3/source-audit-005/inputs/construction-inspector.json.gz'
CONTROL_PREFIXES=tuple('tests/fixtures/'+label+'/' for label in ['cp015-fresh-consumer','cp015-construction','cp015-premise-transport','cp015-context-controls','cp015-matched-continuation'])
OLD014='tests/workspaces/cp014-fixture-'
DEPLOY='tests/deployment/cp015-deployment/'
SYNTH='tests/fixtures/cp015-matched-continuation/v3-ivkn_c_f/matched/'
PATTERNS=[('openai_key',re.compile(rb'sk-(?:proj-)?[A-Za-z0-9_-]{24,}')),('github_token',re.compile(rb'(?:ghp_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{40,})')),('aws_access_key',re.compile(rb'(?:AKIA|ASIA)[A-Z0-9]{16}')),('private_key',re.compile(rb'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----')),('private_network_url',re.compile(rb'https?://(?:10\.[0-9]|192\.168\.|127\.0\.0\.1|localhost)(?::[0-9]+)?(?:/|\b)'))]

def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for block in iter(lambda:f.read(B),b''):h.update(block)
 return h.hexdigest()
def canonical(v):return json.dumps(v,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode()
def digest(v):return hashlib.sha256(canonical(v)).hexdigest()
def load(p,cap=8*B):
 if p.stat().st_size>cap:raise ValueError('bounded metadata limit')
 return json.loads(p.read_text())
def verify(directory,check_originals=False):
 d=Path(directory);archive=d/'inspection015-final-source-evidence.tar.gz';selection=d/'SOURCE_SELECTION.json'
 if sha(selection)!=FIXED:raise ValueError('fixed selection changed')
 s=load(selection);m=load(d/'MANIFEST.json');rows=m['members']
 if rows!=s['selected_files'] or len(rows)!=2481 or sum(r['bytes'] for r in rows)!=68093307:raise ValueError('source selection differs')
 expected={r['path']:r for r in rows};expected['MANIFEST.json']=dict(bytes=(d/'MANIFEST.json').stat().st_size,sha256=sha(d/'MANIFEST.json'))
 if len(expected)!=2482 or {r['path'] for r in rows if r['path'].endswith('.gz')}!={NESTED}:raise ValueError('duplicate/unapproved compressed member')
 archive_before=sha(archive);closed=d/'CLOSED.json'
 if closed.exists() and load(closed)['archive_sha256']!=archive_before:raise ValueError('CLOSED archive changed')
 findings=[];text_bytes=0;cache={};seen=set()
 def scan(stream,name,bound,retain=False):
  nonlocal text_bytes
  h=hashlib.sha256();count=0;carry=b'';decoder=codecs.getincrementaldecoder('utf-8')();blocks=[]
  for block in iter(lambda:stream.read(B),b''):
   count+=len(block)
   if count>bound or b'\x00' in block:raise ValueError('nontext/oversize source: '+name)
   decoder.decode(block);h.update(block);text_bytes+=len(block);window=carry+block
   for category,pattern in PATTERNS:
    if pattern.search(window) and not any(q['path']==name and q['category']==category for q in findings):findings.append(dict(path=name,category=category))
   carry=window[-256:]
   if retain:blocks.append(block)
  decoder.decode(b'',final=True)
  return count,h.hexdigest(),b''.join(blocks) if retain else None
 with archive.open('rb') as f,gzip.GzipFile(fileobj=f,mode='rb') as gz,tarfile.open(fileobj=gz,mode='r|') as tar:
  for item in tar:
   n=PurePosixPath(item.name)
   if (not item.isfile() or item.linkname or n.is_absolute() or '..' in n.parts or item.name not in expected or item.name in seen):raise ValueError('unexpected/unsafe/nonregular/link/duplicate member')
   row=expected[item.name]
   if item.size!=row['bytes']:raise ValueError('member size mismatch')
   if any(q in n.parts for q in ['.git','.lake','build','objects','__pycache__','curator','curation']) or n.suffix in ['.olean','.ilean','.pyc','.o','.a','.so','.dylib','.c']:raise ValueError('compiled/cache/private member')
   if any(q in n.parts for q in ['evaluation','evaluations']) and not item.name.startswith(SYNTH):raise ValueError('unapproved evaluation origin')
   source=tar.extractfile(item);seen.add(item.name)
   keep=(item.name=='checkpoints/015/SOURCE_MANIFEST.json' or item.name.endswith('/FINISHED.json') or item.name==DEPLOY+'receipt.json' or item.name==SYNTH+'evaluation/suite.json' or item.name=='checkpoints/015/sources/tests/test_construction_v3.py')
   if keep and item.size>B:raise ValueError('small binding metadata cap')
   if item.name==NESTED:
    h=hashlib.sha256();count=0
    for block in iter(lambda:source.read(B),b''):h.update(block);count+=len(block)
    measured=count,h.hexdigest(),None
   else:measured=scan(source,item.name,item.size,keep)
   if measured[:2]!=(item.size,row['sha256']):raise ValueError('member hash mismatch: '+item.name)
   if keep:cache[item.name]=measured[2]
 if seen!=set(expected):raise ValueError('missing source member')
 expanded=None
 with archive.open('rb') as f,gzip.GzipFile(fileobj=f,mode='rb') as gz,tarfile.open(fileobj=gz,mode='r|') as tar:
  for item in tar:
   if item.name!=NESTED:continue
   with gzip.GzipFile(fileobj=tar.extractfile(item),mode='rb') as stream:count,h,_=scan(stream,NESTED+' (expanded JSON text)',64*B)
   expanded=dict(path=NESTED,compressed_bytes=item.size,compressed_sha256=expected[NESTED]['sha256'],expanded_bytes=count,expanded_sha256=h,expanded_bound_bytes=64*B,policy='Exact frozen lossless historical JSON source only; no full catalog JSON load; archival bound does not change validator caps')
 if expanded is None or sha(archive)!=archive_before:raise ValueError('nested binding/immutable archive failure')
 frozen=json.loads(cache['checkpoints/015/SOURCE_MANIFEST.json']);prefix='checkpoints/015/sources/';mapping={r['path'][len(prefix):]:r['sha256'] for r in rows if r['path'].startswith(prefix)}
 if mapping!=frozen['files_sha256'] or len(mapping)!=369:raise ValueError('frozen015 source map mismatch')
 finished=[];unvalidated_fixture_markers=[];control_bindings=deploy_bindings=old014_bindings=0;control_bundles=deploy_bundles=old014_bundles=0
 for name,data in cache.items():
  if not name.endswith('/FINISHED.json'):continue
  if not name.startswith(CONTROL_PREFIXES) and not name.startswith(DEPLOY) and not name.startswith(OLD014):
   unvalidated_fixture_markers.append(dict(path=name,sha256=expected[name]['sha256'],scope='Preserved synthetic fault-test input; not interpreted or claimed as authenticated acceptance.'))
   continue
  value=json.loads(data)
  if value.get('schema')!='math-gkm.finished-validator.v3' or value.get('finished') is not True or value.get('files_binding')!=digest(value['files']):raise ValueError('FINISHED metadata binding')
  parent=str(PurePosixPath(name).parent)
  for rel,h in value['files'].items():
   path=parent+'/'+rel
   if path not in expected or expected[path]['sha256']!=h:raise ValueError('FINISHED source missing/changed')
  finished.append(dict(path=name,file_bindings=len(value['files'])))
  if name.startswith(CONTROL_PREFIXES):control_bindings+=len(value['files']);control_bundles+=1
  if name.startswith(DEPLOY):deploy_bindings+=len(value['files']);deploy_bundles+=1
  if name.startswith(OLD014):old014_bindings+=len(value['files']);old014_bundles+=1
 if (control_bindings,control_bundles,deploy_bindings,deploy_bundles)!=(417,31,51,4):raise ValueError('targeted FINISHED coverage count')
 if (old014_bindings,old014_bundles)!=(53,5):raise ValueError('closed014 FINISHED coverage count')
 receipt=json.loads(cache[DEPLOY+'receipt.json'])
 if receipt.get('ready') is not True or receipt['files_binding']!=digest(receipt['files']) or len(receipt['files'])!=67:raise ValueError('deployment readiness binding')
 for rel,h in receipt['files'].items():
  path=DEPLOY+rel
  if path not in expected or expected[path]['sha256']!=h:raise ValueError('deployment readiness source missing')
 synthetic=s['synthetic_evaluation_exception'];ev=synthetic['selected_evaluation_files']
 if len(ev)!=216 or {r['path'] for r in ev}!={r['path'] for r in rows if any(q in PurePosixPath(r['path']).parts for q in ['evaluation','evaluations'])}:raise ValueError('synthetic selection coverage')
 for row in ev:
  if not row['path'].startswith(SYNTH) or row!=expected[row['path']]:raise ValueError('synthetic origin scope mismatch')
 suite=json.loads(cache[SYNTH+'evaluation/suite.json']);binding=synthetic['source_binding'];source=cache['checkpoints/015/sources/tests/test_construction_v3.py']
 if (len(suite['tasks'])!=1 or suite['tasks'][0]['statement']!='∀ n : Nat, n = n' or suite['tasks'][0]['reference_answer']!='HIDDEN-004-ANSWER-DO-NOT-HANDOFF' or suite['tasks'][0]['reference_answer'].encode() not in source or digest(suite)!=binding['suite_canonical_digest'] or hashlib.sha256(cache[SYNTH+'evaluation/suite.json']).hexdigest()!=binding['suite_raw_sha256'] or hashlib.sha256(source).hexdigest()!=binding['test_source_sha256']):raise ValueError('public synthetic fixture binding')
 after_bad=[]
 if check_originals:
  for row in rows:
   p=Path(row['origin'])
   if p.is_symlink() or not p.is_file() or p.stat().st_size!=row['bytes'] or sha(p)!=row['sha256']:after_bad.append(row['path'])
  if after_bad:raise ValueError('original after-hash mismatch')
 result=dict(schema='math-gkm.inspection015-final-package-verification.v2',UTC=datetime.datetime.now(datetime.timezone.utc).isoformat(),archive=archive.name,archive_sha256=archive_before,compressed_bytes=archive.stat().st_size,original_source_files=2481,original_source_bytes=68093307,archive_regular_members=len(seen),manifest_sha256=sha(d/'MANIFEST.json'),fixed_selection_sha256=FIXED,all_members_stream_verified=True,original_after_hashes_verified=2481 if check_originals else 0,original_after_hash_mismatches=after_bad,source015_bindings=369,all_FINISHED_receipts_verified=len(finished),all_FINISHED_file_bindings_verified=sum(x['file_bindings'] for x in finished),current_control_FINISHED_bundles=control_bundles,current_control_FINISHED_bindings=control_bindings,preflight_FINISHED_bundles=deploy_bundles,preflight_FINISHED_bindings=deploy_bindings,closed014_FINISHED_bundles=old014_bundles,closed014_FINISHED_bindings=old014_bindings,preserved_nonacceptance_FINISHED_fixture_members=unvalidated_fixture_markers,preflight_ready_bindings=67,authorized_synthetic_evaluation_members=216,synthetic_source_suite_binding_verified=True,real_curator_or_mutable_runtime_authority_selected=False,links_or_compiled_payloads=0,nested_lossless_source_artifact=expanded,buffer_bytes=B,tests_Lean_or_model_calls_run_by_verifier=False)
 scan_record=dict(schema='math-gkm.bounded-publication-scan.v4',archive_sha256=archive_before,scanned_source_text_bytes=text_bytes,verified_regular_members=len(seen),UTF8_no_NUL_scope='All regular text members plus exact historical compressed JSON under bounded nested scan',pattern_categories=[p[0] for p in PATTERNS],findings=findings,finding_count=len(findings),authorized_public_synthetic_evaluation_members=216,real_private_curator_data_selected=False,scope='Bounded common credential/private-endpoint scan, not proof arbitrary secrets are absent')
 if findings:raise ValueError('publication scan findings require review; values not emitted')
 return result,scan_record

def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--directory',type=Path,default=Path(__file__).resolve().parent.parent);parser.add_argument('--check-originals',action='store_true');args=parser.parse_args();result,scan=verify(args.directory,args.check_originals);print(json.dumps(dict(verification=result,publication_scan=scan),indent=2))
if __name__=='__main__':main()
