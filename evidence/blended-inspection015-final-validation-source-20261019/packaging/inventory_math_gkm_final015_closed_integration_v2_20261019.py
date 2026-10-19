from pathlib import Path
import json,os,hashlib,stat,datetime,re
R=Path('/Users/sasha/math_gkm');C=R/'.scratch/strategy-v3-blended-20261018';O=R/'.bootstrap/construction-v3-20261018';V=C/'.scratch/v3-validation';B=1024**2;BASE=Path('/private/tmp/math_gkm_final015_closed_integration_preservation_inventory_20261019.json');BASE_SHA='fa04c71e66a65cea3433aeada3b001ca8af5a55909c4e1b9dce615ab756714e9';MATCHED=C/'.scratch/v3-ivkn_c_f/matched'

def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for block in iter(lambda:f.read(B),b''):h.update(block)
 return h.hexdigest()
assert sha(BASE)==BASE_SHA
base=json.loads(BASE.read_text());rows={r['path']:r for r in base['selected_files']};excluded=list(base['excluded']);assert len(rows)==772
for r in rows.values():assert sha(Path(r['origin']))==r['sha256'] and Path(r['origin']).stat().st_size==r['bytes']
original_names=set(rows);synthetic_evaluation=[];control_roots=[]
def add(p,name,expected=None):
 p=Path(p)
 if p.is_symlink() or not stat.S_ISREG(p.lstat().st_mode):raise ValueError('selected nonregular source')
 if name.startswith('/') or '..' in Path(name).parts:raise ValueError('unsafe member')
 if p.name in ['SESSION_STATE.json','study-authorization.json','STOP.json','LIVE_AUTHORIZATION.json']:raise ValueError('mutable authority/session source must not be selected')
 h=sha(p)
 if expected and h!=expected:raise ValueError('selected source SHA changed')
 row=dict(path=name,origin=str(p),bytes=p.stat().st_size,sha256=h)
 if name in rows:
  assert rows[name]==row;return
 rows[name]=row
 if p.is_relative_to(MATCHED) and any(q in ['evaluation','evaluations'] for q in p.relative_to(MATCHED).parts):synthetic_evaluation.append(row)
def tree(p,prefix):
 p=Path(p)
 if not p.is_dir() or p.is_symlink():raise ValueError('invalid selected root')
 for folder,dirs,files in os.walk(p,followlinks=False):
  parent=Path(folder);keep=[]
  for n in dirs:
   q=parent/n;synthetic_allowed=q.is_relative_to(MATCHED)
   if q.is_symlink() or n in ['.lake','.git','build','objects','__pycache__','curation','curator'] or (n in ['evaluation','evaluations'] and not synthetic_allowed):
    excluded.append(dict(origin=str(q),reason='link/build/cache/REAL-evaluation exclusion; only exact matched synthetic subtree may retain evaluation'));continue
   keep.append(n)
  dirs[:]=keep
  for n in files:
   q=parent/n
   if q.is_symlink() or q.suffix in ['.olean','.ilean','.pyc','.o','.a','.so','.dylib','.c'] or '.olean.' in n or '.ilean.' in n:
    excluded.append(dict(origin=str(q),reason='compiled/link exclusion'));continue
   if q.suffix not in ['.lean','.py','.json','.jsonl','.md','.txt','.toml','.log','.sb','.sh','.stdout','.diff','.csv','.tsv'] and n!='lean-toolchain':
    excluded.append(dict(origin=str(q),reason='non-source/derived/lock suffix exclusion'));continue
   add(q,prefix+'/'+str(q.relative_to(p)))
# Readiness and all four source-only positive/negative/exact-root bundles are CLOSED.
D=C/'.scratch/cp015-deployment';assert json.loads((D/'result.json').read_text())['ready'] is True;tree(D,'tests/deployment/cp015-deployment');tree(V/'cp015-deployment','tests/cp015-deployment')
for suffix in ['json','jsonl','stdout']:
 n='testwatch-cp015-deployment.'+suffix;add(O/n,'tests/operator/'+n)
for n,h in json.loads((D/'receipt.json').read_text())['files'].items():assert rows['tests/deployment/cp015-deployment/'+n]['sha256']==h
# Only explicit roots printed by these CLOSED runs are traversed. The ninth's
# exact fixture includes its own public synthetic evaluation artifacts by authority.
for label,count in [('cp015-fresh-consumer',1),('cp015-construction',1),('cp015-premise-transport',4),('cp015-context-controls',2),('cp015-matched-continuation',1)]:
 out=V/label;record=json.loads((out/'result.json').read_text());assert record['returncode']==0 and record['termination'] is None and record['source_mismatches_after']==[]
 log=(out/'run.log').read_text();assert f'Ran {count} test' in log;tree(out,'tests/'+label)
 for suffix in ['json','jsonl','stdout']:
  n='testwatch-'+label+'.'+suffix;add(O/n,'tests/operator/'+n)
 retained=re.findall(r'RETAINED (/Users/sasha/math_gkm/[^\n]+)',log);assert len(retained)==count
 for value in retained:
  p=Path(value);assert p.parent==C/'.scratch';control_roots.append(dict(run=label,path=str(p),explicit_log_binding=True));tree(p,'tests/fixtures/'+label+'/'+p.name)
# All417 FINISHED bindings from these roots must be represented exactly in v2.
control_audit=Path('/private/tmp/math_gkm_final015_nine_controls_repro_audit_20261019.json');a=json.loads(control_audit.read_text());assert a['methods']==9 and a['FINISHED_file_bindings']==417
for marker in a['FINISHED_bindings']:
 p=Path(marker['path']);f=json.loads(p.read_text());assert sha(p)==marker['sha256']
 for n,h in f['files'].items():
  original=str(p.parent/n);matches=[r for r in rows.values() if r['origin']==original]
  assert matches and all(r['sha256']==h for r in matches)
# Stable completed OPS records, never mutable installed runtime/authority/state.
for name,expected in [('VALIDATION015.json','53c20d7b9ef9d70dcc27b24b1a61141bfc2b51d8d656b6403fa51049506469d8'),('FINAL015_TEST_QUIESCENCE.json','c73cd7d298bad72274448853baf28b1f2640955bb2410ce135c6b43c0826ff2f')]:add(O/name,'operations/'+name,expected)
for name in ['NEGATIVE_CAUSES015_TRANSPORT.json','NEGATIVE_CAUSES015_CONTEXT.json']:add(O/name,'operations/'+name)
for name in ['FINAL_INSTALL_PLAN_015.json','SOURCE_REVIEW_015_FOR_INSTALL_PREPARE.json','math_gkm_v3_ops_install.py']:add(O/'installation-operator'/name,'operations/installation-operator/'+name)
for name in ['math_gkm_deployment015_closed_resource_repro_audit_20261019.json','math_gkm_deployment015_closed_quiescence_20261019.json','math_gkm_deployment015_final_resource_repro_review_20261019.md','math_gkm_final015_nine_controls_repro_audit_20261019.json','math_gkm_preinstall015_final_resource_clearance_20261019.json','math_gkm_install_plan015_independent_resource_repro_review_20261019.json','math_gkm_v3_matched_continuation015_finished_review.md']:
 add(Path('/private/tmp')/name,'reviews/final/'+name)
add(Path('/private/tmp/math_gkm_v3_matched_continuation015_finished_review.md'),'reviews/final/math_gkm_v3_matched_continuation015_finished_review.md','24e9f6982abe914ae6cba21f515211582b0030511291920444be28c6f464af45')
add(BASE,'provenance/INITIAL_SELECTION.json',BASE_SHA)
assert synthetic_evaluation
# The synthetic exception is exact and bound to the retained public test source,
# canonical suite seal, raw suite bytes and closed fifth control-group result.
synthetic_scope=dict(classification='SYNTHETIC DETERMINISTIC ENGINEERING EVALUATION ONLY',authorized_exact_fixture_root=str(MATCHED),source_binding=a['synthetic_ninth'],selected_evaluation_files=sorted(synthetic_evaluation,key=lambda r:r['path']),real_sealed_curator_suites_or_answers_read_or_selected=False)
added=[r for n,r in rows.items() if n not in original_names]
obj=dict(schema='math-gkm.final015-closed-integration-publication-proposal.v2',created_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),status='FIXED V2 PROPOSAL ONLY; parent selection review required before archive. All selected executions are CLOSED.',scope='Complete final015 source constructor TIMEOUT,3purePASS,actualdeployedpreflightPASS,9current-parserintegrationmethodsPASS,closedremaining014integration. This packet itself is not installed/main-registry/campaign/general-conjecture evidence.',base_inventory_sha256=BASE_SHA,base_files=772,base_source_bytes=34313915,all_base_hashes_unchanged=True,added_files=len(added),added_source_bytes=sum(r['bytes'] for r in added),removed_base_files=[],source_checkpoint=base['source_checkpoint'],selected_files=sorted(rows.values(),key=lambda r:r['path']),selected_file_count=len(rows),selected_source_bytes=sum(r['bytes'] for r in rows.values()),excluded=excluded,closed_control_fixture_roots=control_roots,synthetic_evaluation_exception=synthetic_scope,FINISHED_control_file_bindings_preserved=417,ready_preflight_file_bindings_preserved=67,FINISHED_preflight_file_bindings_preserved=51,source_only_buffer_bytes=B,active_streams_or_mutable_installed_runtime_authority_selected=False,real_private_curator_read_or_selected=False,prior_publication=base['previous_publication'],constructor_status='FAILED Timeout180.126s childexit0/outer182.666s exit1; later tests independently passed',installation_evidence_policy='Upcoming completed installation/installed review may be added as a separate immutable sidecar; no mutable installed-main source or .bootstrap authority is an origin in this fixed selection.',notes=['Superseded OLD-v1/v2 drafts remain accurately UNEXECUTED source history.','Synthetic eval/answers allowed ONLY within the ninth exact closedfixture root; real old/new Markov curator suites remain excluded/uninspected.','Paid fresh main admission means a600-second harness reservation in the deterministic test, not real provider payment or new mathematical discovery.','Recorded operation counts may repeat preserved receipts; no unique provider-cost or whole-root proof claim.'])
p=Path('/private/tmp/math_gkm_final015_closed_integration_preservation_inventory_v2_20261019.json');p.write_text(json.dumps(obj,sort_keys=True,indent=2)+'\n');print(json.dumps(dict(inventory=str(p),sha256=sha(p),files=len(rows),bytes=obj['selected_source_bytes'],base_files=772,added_files=len(added),added_bytes=obj['added_source_bytes'],excluded=len(excluded),synthetic_evaluation_files=len(synthetic_evaluation),control_fixture_roots=len(control_roots),source_frozen369=True,preflight_bindings=67,control_FINISHED_bindings=417,mutable_runtime_or_authority_selected=False),indent=2))
