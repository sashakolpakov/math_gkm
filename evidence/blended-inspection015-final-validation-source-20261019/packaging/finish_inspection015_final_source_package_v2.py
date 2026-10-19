from pathlib import Path
import ast,datetime,hashlib,importlib.util,json,shutil
D=Path('/Users/sasha/math_gkm/evidence/blended-inspection015-final-validation-source-20261019');B=1048576

def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(B),b''):h.update(b)
 return h.hexdigest()
def canonical(v):return (json.dumps(v,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n').encode()
failed=json.loads((D/'FAILED_VERIFICATION_ATTEMPT_001.json').read_text());assert sha(D/'inspection015-final-source-evidence.tar.gz')==failed['archive_sha256'] and sha(D/'MANIFEST.json')==failed['manifest_sha256']
module_path=Path('/private/tmp/verify_inspection015_final_source_package_v2.py');spec=importlib.util.spec_from_file_location('preserved_artifact_verification_v2',module_path);mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod);verification,scan=mod.verify(D,check_originals=True)
(D/'VERIFICATION.json').write_bytes(canonical(verification));(D/'PUBLICATION_SCAN.json').write_bytes(canonical(scan));selection=json.loads((D/'SOURCE_SELECTION.json').read_text());(D/'SYNTHETIC_EVALUATION_SCOPE.json').write_bytes(canonical(selection['synthetic_evaluation_exception']))
writer=Path('/private/tmp/archive_inspection015_final_source_package_v2.py');readme=None
for node in ast.walk(ast.parse(writer.read_text())):
 if isinstance(node,ast.Call) and isinstance(node.func,ast.Attribute) and node.func.attr=='write_text' and node.args and isinstance(node.args[0],ast.Constant) and isinstance(node.args[0].value,str) and node.args[0].value.startswith('This package preserves'):readme=node.args[0].value
assert readme
readme+='\nThe first artifact verifier incorrectly tried to authenticate deliberately corrupted FINISHED markers used by pure negative fixtures. FAILED_VERIFICATION_ATTEMPT_001.json and exact first tools preserve that failure. The corrected verifier authenticates only the actual31 integration,4 preflight and5 remaining014 bundles (417+51+53 file bindings), plus67 readiness bindings. Other negative-fixture markers remain byte-exact source inputs, explicitly outside accepted receipt claims. Archive, source selection and original bytes were unchanged; no Lean test was rerun and no validator limit changed.\n'
(D/'README.md').write_text(readme)
(D/'packaging').mkdir(exist_ok=False);tools=[]
for p in [Path('/private/tmp/archive_inspection015_final_source_package.py'),writer,Path('/private/tmp/verify_inspection015_final_source_package.py'),module_path,Path('/private/tmp/inventory_math_gkm_final015_closed_integration_20261019.py'),Path('/private/tmp/inventory_math_gkm_final015_closed_integration_v2_20261019.py'),Path(__file__)]:
 q=D/'packaging'/p.name;shutil.copyfile(p,q);tools.append(dict(path='packaging/'+p.name,bytes=q.stat().st_size,sha256=sha(q)))
(D/'PACKAGING_TOOLS.json').write_bytes(canonical(dict(archive_sha256=verification['archive_sha256'],current_verifier='packaging/verify_inspection015_final_source_package_v2.py',current_fresh_archive_writer='packaging/archive_inspection015_final_source_package_v2.py',preserved_failed_first_tools=['packaging/archive_inspection015_final_source_package.py','packaging/verify_inspection015_final_source_package.py'],members=tools,scope='Preservation/portable verification only; no production source or Lean changes')))
(D/'README.md').write_text((D/'README.md').read_text().replace('packaging/verify_inspection015_final_source_package.py --directory','packaging/verify_inspection015_final_source_package_v2.py --directory'))
closed=dict(schema='math-gkm.closed-source-package.v1',closed_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),archive='inspection015-final-source-evidence.tar.gz',archive_sha256=verification['archive_sha256'],compressed_bytes=verification['compressed_bytes'],original_files=2481,original_source_bytes=68093307,regular_archive_members=2482,fixed_selection_sha256=mod.FIXED,independent_publication_review_pending=True,archive_bytes_immutable=True,failed_first_verification_preserved=True,sidecars={n:sha(D/n) for n in ['MANIFEST.json','SOURCE_SELECTION.json','VERIFICATION.json','PUBLICATION_SCAN.json','SYNTHETIC_EVALUATION_SCOPE.json','PACKAGING_TOOLS.json','README.md','FAILED_VERIFICATION_ATTEMPT_001.json']})
(D/'CLOSED.json').write_bytes(canonical(closed))
print(json.dumps(dict(directory=str(D),archive_sha256=verification['archive_sha256'],compressed_bytes=verification['compressed_bytes'],raw_source_bytes=68093307,regular_members=2482,manifest_sha256=sha(D/'MANIFEST.json'),verification_sha256=sha(D/'VERIFICATION.json'),scan_sha256=sha(D/'PUBLICATION_SCAN.json'),scan_findings=scan['finding_count'],CLOSED_sha256=sha(D/'CLOSED.json'),README_sha256=sha(D/'README.md'),frozen_sources=369,control_FINISHED_bindings=417,preflight_FINISHED_bindings=51,closed014_FINISHED_bindings=53,ready_bindings=67,synthetic_eval_members=216,preserved_nonacceptance_markers=len(verification['preserved_nonacceptance_FINISHED_fixture_members'])),indent=2))
