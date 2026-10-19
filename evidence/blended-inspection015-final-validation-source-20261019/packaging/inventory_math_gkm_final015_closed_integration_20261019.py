from pathlib import Path
import json,os,hashlib,stat,datetime,re
R=Path('/Users/sasha/math_gkm');C=R/'.scratch/strategy-v3-blended-20261018';O=R/'.bootstrap/construction-v3-20261018';V=C/'.scratch/v3-validation';B=1024**2
rows={};excluded=[]
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for block in iter(lambda:f.read(B),b''):h.update(block)
 return h.hexdigest()
def add(p,name,expected=None):
 p=Path(p)
 if p.is_symlink() or not stat.S_ISREG(p.lstat().st_mode):raise ValueError('selected nonregular source')
 if name.startswith('/') or '..' in Path(name).parts or name in rows:raise ValueError('unsafe/duplicate member')
 h=sha(p)
 if expected and h!=expected:raise ValueError('selected source SHA changed')
 rows[name]=dict(path=name,origin=str(p),bytes=p.stat().st_size,sha256=h)
def tree(p,prefix):
 p=Path(p)
 if not p.is_dir() or p.is_symlink():raise ValueError('invalid selected root')
 for folder,dirs,files in os.walk(p,followlinks=False):
  base=Path(folder);keep=[]
  for n in dirs:
   q=base/n
   if q.is_symlink() or n in ['.lake','.git','build','objects','__pycache__','evaluation','evaluations','curation','curator']:
    excluded.append(dict(origin=str(q),reason='link/build/cache/evaluation exclusion'));continue
   keep.append(n)
  dirs[:]=keep
  for n in files:
   q=base/n
   if q.is_symlink() or q.suffix in ['.olean','.ilean','.pyc','.o','.a','.so','.dylib','.c'] or '.olean.' in n or '.ilean.' in n:
    excluded.append(dict(origin=str(q),reason='compiled/link exclusion'));continue
   if q.suffix not in ['.lean','.py','.json','.jsonl','.md','.txt','.toml','.log','.sb','.sh','.stdout','.diff'] and n!='lean-toolchain':
    excluded.append(dict(origin=str(q),reason='non-source suffix exclusion'));continue
   add(q,prefix+'/'+str(q.relative_to(p)))
D=C/'evidence/construction-v3/source-audit-015';source_sha='bfec46aa82823a1424ee4ae1ea3c8facb8c06f9926db8adb3bb4cd16262780a2';m=json.loads((D/'SOURCE_MANIFEST.json').read_text());add(D/'SOURCE_MANIFEST.json','checkpoints/015/SOURCE_MANIFEST.json',source_sha)
for n,h in m['files_sha256'].items():add(D/'sources'/n,'checkpoints/015/sources/'+n,h)
for p in D.iterdir():
 if p.is_file():
  if p.name!='SOURCE_MANIFEST.json':add(p,'checkpoints/015/metadata/'+p.name)
 elif p.name!='sources':tree(p,'checkpoints/015/metadata/'+p.name)
tree(O/'round-0014-executed','constructors/015/executed')
for n in ['round-0014-PROTECTED_BEFORE_015.json','round-0014-PROTECTED_AFTER_015.json','round-0014-prompt-015.txt','PRE015_FIXTURE_QUIESCENCE.json','PRE_PURE015_QUIESCENCE.json']:
 add(O/n,'constructors/015/operator/'+n)
for suffix in ['json','jsonl','stdout']:
 n='testwatch-external-constructor-round14-serialization015.'+suffix;add(O/n,'constructors/015/operator/'+n)
tree(O/'independent-source-review-015','reviews/015/preserved')
for n in ['RESOURCE_SOURCE_REVIEW_015.md','PROVISIONAL_SOURCE015_OVERLAY_PLAN.json','FIXTURE014_REMAINING_INACTIVE_PLAN.json','FIXTURE014_REMAINING_INACTIVE_PLAN_V2.json','FIXTURE014_REMAINING_INACTIVE_PLAN_V3.json','fixture014_single_operator.py','fixture014_old_operator.py','fixture014_old_operator_v2.py','fixture014_old_operator_v3.py','bounded_test_watch_v7b.py','preflight015_operator.py']:
 add(O/n,'operations/'+n)
# Completed public neutral/full-Mathlib and all neutral new/old-v3 identity stages.
closed_new=[];closed_old=[]
for tag in ['neutral','full_mathlib','identity_base','identity_repeat','identity_changed_unused']:
 label='cp014-fixture-'+tag+'-new';p=V/label
 assert json.loads((p/'result.json').read_text())['returncode']==0
 tree(p,'tests/'+label)
 for suffix in ['json','jsonl','stdout']:
  n='testwatch-'+label+'.'+suffix;add(O/n,'tests/operator/'+n)
 a=json.loads((p/'ASSERTIONS.json').read_text());workspace=Path(a['check_directory']).parent;tree(workspace,'tests/workspaces/'+label)
 closed_new.append(dict(label=label,workspace=str(workspace),result_sha256=sha(p/'result.json'),FINISHED_sha256=sha(workspace/'check/FINISHED.json')))
 if tag.startswith('identity_'):
  label='cp014-fixture-'+tag+'-old-v3';p=V/label;assert json.loads((p/'result.json').read_text())['returncode']==0
  tree(p,'tests/'+label)
  for suffix in ['json','jsonl','stdout']:
   n='testwatch-'+label+'.'+suffix;add(O/n,'tests/operator/'+n)
  closed_old.append(dict(label=label,IDENTITIES_sha256=sha(p/'IDENTITIES.json')))
tree(V/'cp014-fixture-aggregate-old-v3','tests/cp014-fixture-aggregate-old-v3')
# The OLD inspectors' source/raw/artifact directories are children of the selected
# corresponding new workspaces; compiled build trees are excluded there.
label='cp015-json-evidence';p=V/label;assert json.loads((p/'result.json').read_text())['returncode']==0;tree(p,'tests/'+label)
for suffix in ['json','jsonl','stdout']:
 n='testwatch-'+label+'.'+suffix;add(O/n,'tests/operator/'+n)
log=(p/'run.log').read_text();pure_fixtures=[]
for name in re.findall(r'RETAINED (/Users/sasha/math_gkm/[^\n]+)',log):
 q=Path(name);assert q.parent==C/'.scratch' and q.name.startswith('sol-deployment-neutral-')
 tree(q,'tests/fixtures/'+label+'/'+q.name);pure_fixtures.append(str(q))
assert len(pure_fixtures)==3
# Exact task/solution and byte-hash-bound fixture DATA, never heldout tasks.
fixture=C/'local.scratch/inspection011-fixture.json';fixture_sha='26438fcf09ee851c40abd70727007e75d859357e185d5d2626208efb92b493c1';add(fixture,'fixture-data/candidate/local.scratch/inspection011-fixture.json',fixture_sha);f=json.loads(fixture.read_text())
for case in f['cases']+f['differential_cases']:
 for n,h in case['files_sha256'].items():add(C/case['source_directory']/n,'fixture-data/candidate/'+case['source_directory']+'/'+n,h)
tree(O/'immutable-fixture-data013','fixture-data/immutable-fixture-data013')
for rel,h in [('SOURCE_MANIFEST.json','91849c3534793fc2c9b0c77303816bc3d7c322b310eb09d5a9745734953cbd7b'),('sources/machinery/proof_audit.py','9c8f8de8c2512f78c7409668bc118ebfb554cb287b010c09c486bd217becf296')]:add(C/'evidence/construction-v3/source-audit-010'/rel,'old010-inspector-reference/'+rel,h)
for n in ['math_gkm_closed014_final_resource_repro_audit_20261019.md','math_gkm_closed014_integration_resource_repro_audit_20261019.json','math_gkm_closed014_final_quiescence_20261019.json','math_gkm_inspection015_resource_source_review_20261019.md','math_gkm_inspection015_quiescence_20261019.json','math_gkm_pre_actual_preflight015_quiescence_20261019.json','math_gkm_inspection015_provisional_overlay_plan_20261019.json']:
 add(Path('/private/tmp')/n,'reviews/operational/'+n)
summary=O/'VALIDATION014_CLOSED_FIXTURES.json'
if summary.exists():add(summary,'operations/'+summary.name)
obj=dict(schema='math-gkm.final015-closed-integration-publication-proposal.v1',created_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),status='PROPOSAL ONLY; no archive created, parent review required; active015 preflight must not be selected before closure',scope='CLOSED remaining014 integration engineering checks,015 source-only constructor TIMEOUT and3 completed pure tests. No installation, final deployment pass or research campaign claim.',source_checkpoint=dict(version='015',source_manifest_sha256=source_sha,frozen_sources=len(m['files_sha256'])),closed_new_stages=closed_new,closed_old_inspector_only_stages=closed_old,aggregate_comparisons=6,pure015_fixtures=pure_fixtures,old_operator_drafts=dict(versions=['v1','v2'],status='Superseded inactive source drafts retained for debugging; no corresponding actual old-v1/v2 result directories were found or selected, no execution/failure claim'),selected_files=sorted(rows.values(),key=lambda r:r['path']),selected_file_count=len(rows),selected_source_bytes=sum(r['bytes'] for r in rows.values()),excluded=excluded,active_preflight_outputs_selected=False,private_evaluation_read_or_selected=False,buffer_bytes=B,previous_publication=dict(commit='065af2092d1c8c7bb42f7cb6114c0dc13f8c8181',archive='evidence/blended-inspection013-014-validation-source-20261019/inspection013-014-source-evidence.tar.gz',sha256='878a320fcad060585c8299b9a4d7cd6b83dad97b6afe42179ba2d5d577645e49',scope='Full frozen013/014 checkpoints and closed first largepilot failures/success already preserved separately'),selection_note='All selected actual results are closed. Pure015 fixture roots explicitly occur in its retained log. One exact frozen005 construction-inspector.json.gz requires narrow bounded nested UTF8/content scanning. No active015 preflight paths, links, caches, compiled objects, curator or actual evaluation suite selected.')
p=Path('/private/tmp/math_gkm_final015_closed_integration_preservation_inventory_20261019.json');p.write_text(json.dumps(obj,sort_keys=True,indent=2)+'\n');print(json.dumps(dict(inventory=str(p),sha256=sha(p),files=len(rows),bytes=obj['selected_source_bytes'],excluded=len(excluded),source_count=len(m['files_sha256']),new_stages=len(closed_new),old_stages=len(closed_old),pure_fixture_roots=len(pure_fixtures),active_preflight_outputs_selected=False),indent=2))
