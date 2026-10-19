"""Create only the exact parent-approved CLOSED source-evidence package."""
from pathlib import Path,PurePosixPath
import json,hashlib,os,stat,tarfile,gzip,io,shutil,importlib.util,datetime
R=Path('/Users/sasha/math_gkm');I=Path('/private/tmp/math_gkm_final015_closed_integration_preservation_inventory_v2_20261019.json');FIXED='b74c04047392f09f6710408f38dd90661e0ab9f6d860dce6734de61ebcb54f0f';D=R/'evidence/blended-inspection015-final-validation-source-20261019';B=1048576

def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for block in iter(lambda:f.read(B),b''):h.update(block)
 return h.hexdigest()
def canonical(v):return (json.dumps(v,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n').encode()
assert sha(I)==FIXED and I.stat().st_size<8*B
s=json.loads(I.read_text());rows=s['selected_files'];assert len(rows)==2481 and sum(r['bytes'] for r in rows)==68093307
for row in rows:
 p=Path(row['origin']);n=PurePosixPath(row['path']);assert not n.is_absolute() and '..' not in n.parts and not p.is_symlink() and stat.S_ISREG(p.lstat().st_mode)
D.mkdir(parents=True,exist_ok=False);A=D/'inspection015-final-source-evidence.tar.gz'
m=dict(schema='math-gkm.inspection015-final-source-package.v1',fixed_selection_sha256=FIXED,source_checkpoint=s['source_checkpoint'],scope=s['scope'],members=rows,original_source_files=len(rows),original_source_bytes=s['selected_source_bytes'],base_inventory_sha256=s['base_inventory_sha256'],base_files=s['base_files'],all_base_hashes_unchanged=s['all_base_hashes_unchanged'],added_files=s['added_files'],exclusions=s['excluded'],synthetic_evaluation_exception=s['synthetic_evaluation_exception'],constructor_status=s['constructor_status'],installation_evidence_policy=s['installation_evidence_policy'],buffer_bytes=B,Lean_tests_or_model_calls_run_by_packager=False,real_private_curator_read_or_selected=False)
raw=canonical(m)
class CheckedReader:
 def __init__(self,p,row):self.f=p.open('rb');self.row=row;self.before=os.fstat(self.f.fileno());self.h=hashlib.sha256();self.count=0
 def read(self,n=-1):
  block=self.f.read(min(n,B) if n>=0 else B);self.h.update(block);self.count+=len(block);return block
 def close(self):
  after=os.fstat(self.f.fileno());self.f.close();ident=lambda q:(q.st_dev,q.st_ino,q.st_size,q.st_mtime_ns,q.st_ctime_ns)
  if ident(self.before)!=ident(after) or self.count!=self.row['bytes'] or self.h.hexdigest()!=self.row['sha256']:raise ValueError('selected original changed during archive')
with A.open('xb') as out,gzip.GzipFile(fileobj=out,mode='wb',filename='',mtime=0) as gz,tarfile.open(fileobj=gz,mode='w|') as tar:
 for row in rows:
  item=tarfile.TarInfo(row['path']);item.mode=0o444;item.mtime=0;item.size=row['bytes'];reader=CheckedReader(Path(row['origin']),row)
  try:tar.addfile(item,reader)
  finally:reader.close()
 item=tarfile.TarInfo('MANIFEST.json');item.mode=0o444;item.mtime=0;item.size=len(raw);tar.addfile(item,io.BytesIO(raw))
(D/'MANIFEST.json').write_bytes(raw);shutil.copyfile(I,D/'SOURCE_SELECTION.json')
module_path=Path('/private/tmp/verify_inspection015_final_source_package.py');spec=importlib.util.spec_from_file_location('archive_source_verification',module_path);mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod);verification,scan=mod.verify(D,check_originals=True)
(D/'VERIFICATION.json').write_bytes(canonical(verification));(D/'PUBLICATION_SCAN.json').write_bytes(canonical(scan));(D/'SYNTHETIC_EVALUATION_SCOPE.json').write_bytes(canonical(s['synthetic_evaluation_exception']))
(D/'README.md').write_text('''This package preserves the final015 harness source and its CLOSED engineering validation. It contains the complete369-source frozen checkpoint; its source-only constructor TIMEOUT history; three actual pure015 tests; the actual full-Mathlib deployed positive, wrong-target, missing-required and exact-root checks; all nine current-parser integration methods; and remaining014 source/fixture provenance. No tests, Lean processes, model calls, source changes, installation, deletion or Git operation were performed during packaging.

The015 constructor remains FAILED: receipt180.126 seconds with TimeoutError and child exit0; outer182.666 seconds/exit1/cleanup[]. A final response and coherent frozen source do not override the timeout. Later actual tests independently passed. The full-Mathlib preflight has ready:true,324.0928457500013 seconds within1200; all67 readiness member bindings and51 FINISHED file bindings are preserved. Of its29 Lean operations,27 succeed and two fail for authentic intended semantic reasons: an actual wrong-target type mismatch and nonce-authenticated missing-required rejection after successful compile/kernel replay. Exact-root Lean checking succeeds while independent English/source correspondence deliberately remains unresolved. Raw outcomes are retained, including historical source-only status notes.

The nine current-parser methods are fresh consumer1, formal Construction1, premise/transport4, context2 and matched continuation1. Their31 FINISHED bundles and417 file bindings are preserved. Nine authentic rejection artifacts are separately hash-bound in the cause records. Counts of339 retained Lean-operation records are receipt evidence and may repeat records across preserved bundles; they are not unique provider expenditure. Neutral proofs and the formal Construction model do not prove arbitrary host edits or close D1-D3. The earlier PUBLIC restricted-branch pilot recheck is engineering evidence, not a new main registry admission or general Markov conjecture proof. Inactive old-v1/v2 operator drafts remain UNEXECUTED source history, with actual old-v3 inspector comparisons scoped separately.

The ninth test has an explicit synthetic-data exception. Exactly216 suite/evaluation/transfer/catalog artifacts under its unique v3-ivkn_c_f/matched tree are necessary evidence, not real curator data. SYNTHETIC_EVALUATION_SCOPE.json binds their exact hashes to the retained public test source. It fixes one task,∀n:Nat,n=n, and the public canary HIDDEN-004-ANSWER-DO-NOT-HANDOFF. The raw suite SHA and canonical seal digest are recorded separately. Its experimentally accepted policy is not a certified switch. Legitimate pending checked sources reach the next proposer/researcher requests; the canary does not. A different fresh main FINISHED bundle and600-second synthetic validation reservation establish ordinary main admission rather than uncharged branch reuse. Budget charging here is not live LLM research or verified provider money. Formal obligations remain open and independent root resolution is absent. Actual sealed old/new Markov curator suites and answers were neither inspected nor selected. Engineering fixture knowledge must remain outside future clean research seeds.

inspection015-final-source-evidence.tar.gz contains2,481 original regular source/evidence members plus the exact embedded MANIFEST.json. The2,481 selected originals total68,093,307 bytes. SOURCE_SELECTION.json is the exact parent-approved V2 inventory: its original772 files remain unchanged, with1,709 explicit additions. The initial proposal is retained as historical provenance. Fifty-one link/cache/compiled/derived exclusions are declared. Frozen sources, closed test artifacts and fixed operator/audit records are the origins; mutable installed runtime, authority/session state and active streams are excluded. Completed installation records and installed-byte reviews are published separately and do not retroactively change this archive.

MANIFEST.json records every original hash/size/stable relative path and source maps. VERIFICATION.json records a streamed reread of all2,482 members and all2,481 original after-hashes, complete frozen369-source and FINISHED/readiness coverage. PUBLICATION_SCAN.json records bounded UTF8/no-NUL and common credential/private-endpoint checks, not a guarantee that arbitrary secrets are absent. The one exact frozen historical construction-inspector.json.gz preserves lossless JSON source evidence; expanded text is checked under a64MiB archival bound without loading the catalog JSON. No other compressed or compiled binary payload is allowed. Buffers stay at most1MiB; this archival bound does not change validator caps.

For independent portable artifact verification, run:

    python3 packaging/verify_inspection015_final_source_package.py --directory /PATH/TO/THIS/PACKAGE

The verifier needs only Python's standard library and does not extract files, run Lean or access a network. On the original retained host only, --check-originals also rehashes all historical selected origins. The packaging writer and both inventory generators are retained verbatim under packaging/; they are recorded-host preservation tools, not production harness changes. PACKAGING_TOOLS.json binds their exact source bytes.

For proof and harness reconstruction, restore checkpoints/015/sources according to its SOURCE_MANIFEST.json in a separate reviewed source tree. Necessary helper/test/operator source, exact task/solution/context data, pinned toolchain/lake files, generated Lean proofs and inspectors, raw records, profiles, REBUILD maps and retained object identities are included. Replay the retained fresh NEW fixture operator before its OLD-v3 inspector comparison to recreate identical fresh objects; compiled build trees and package cache blobs are excluded. Use the recorded ordinary dependencies(workspace) layout and pinned Lean4.32.2/mathlib host inputs. These commands are host-bound observations, not a fresh-platform or cold dependency bootstrap guarantee. The original execution source paths are mapped explicitly by the archive manifest. The public013/014 prerequisite is ../blended-inspection013-014-validation-source-20261019/, archive878a320fcad060585c8299b9a4d7cd6b83dad97b6afe42179ba2d5d577645e49, public065af2092d1c8c7bb42f7cb6114c0dc13f8c8181. Exact old010 inspector references are included and provenance points to its earlier published source archive.

Root controls publication, installed-byte review and any later fresh research activation. This package establishes bounded operational observations under unchanged007 limits; it is not whole-program formal refinement, independent paper/root resolution, a general Markov result or automatic campaign authorization.
''')
(D/'packaging').mkdir();tools=[]
for p in [Path(__file__),module_path,Path('/private/tmp/inventory_math_gkm_final015_closed_integration_20261019.py'),Path('/private/tmp/inventory_math_gkm_final015_closed_integration_v2_20261019.py')]:
 q=D/'packaging'/p.name;shutil.copyfile(p,q);tools.append(dict(path='packaging/'+p.name,bytes=q.stat().st_size,sha256=sha(q)))
(D/'PACKAGING_TOOLS.json').write_bytes(canonical(dict(archive_sha256=verification['archive_sha256'],members=tools,scope='Preservation/portable verification tools only; no production source changes')))
closed=dict(schema='math-gkm.closed-source-package.v1',closed_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),archive=A.name,archive_sha256=verification['archive_sha256'],compressed_bytes=A.stat().st_size,original_files=2481,original_source_bytes=68093307,regular_archive_members=2482,fixed_selection_sha256=FIXED,independent_publication_review_pending=True,archive_bytes_immutable=True,sidecars={n:sha(D/n) for n in ['MANIFEST.json','SOURCE_SELECTION.json','VERIFICATION.json','PUBLICATION_SCAN.json','SYNTHETIC_EVALUATION_SCOPE.json','PACKAGING_TOOLS.json','README.md']})
(D/'CLOSED.json').write_bytes(canonical(closed))
print(json.dumps(dict(directory=str(D),archive_sha256=verification['archive_sha256'],compressed_bytes=A.stat().st_size,raw_source_bytes=68093307,regular_members=2482,manifest_sha256=sha(D/'MANIFEST.json'),verification_sha256=sha(D/'VERIFICATION.json'),scan_sha256=sha(D/'PUBLICATION_SCAN.json'),scan_findings=scan['finding_count'],CLOSED_sha256=sha(D/'CLOSED.json'),README_sha256=sha(D/'README.md'),frozen_sources=369,control_FINISHED_bindings=417,preflight_FINISHED_bindings=51,ready_bindings=67,synthetic_eval_members=216),indent=2))
