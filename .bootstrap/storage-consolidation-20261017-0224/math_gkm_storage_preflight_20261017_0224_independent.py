"""Independent read-only named-pair storage review. Never imports/runs the proposed operation."""
from pathlib import Path
from datetime import datetime,timezone
import json,hashlib,stat,subprocess,collections,ast
R=Path('/Users/sasha/math_gkm');I=Path('/private/tmp/math_gkm_storage_inventory_20261017_0224.json');S=Path('/private/tmp/math_gkm_storage_clone_20261017_0224.py');O=Path('/private/tmp/math_gkm_storage_inventory_20261017_0224_independent_review.json')
expected='0bcd386de67cf2b08868b5c14c9d6413b1a023675749be90d161767e874cea80'
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def md(s):return {'bytes':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,'mtime_ns':s.st_mtime_ns,'inode':s.st_ino,'device':s.st_dev,'nlink':s.st_nlink,'flags':s.st_flags}
start=datetime.now(timezone.utc).isoformat();assert sha(I)==expected;inv=json.loads(I.read_text());script_sha=sha(S);ast.parse(S.read_text());assert len(inv['pairs'])==inv['candidate_count']==188 and inv['mismatch']==[];assert sum(x['bytes'] for x in inv['pairs'])==inv['candidate_bytes']==2394524272
assert len(inv['exclusion_plans'])==22
pins={str(I):expected,str(S):script_sha};prior_targets=set();prior_rows=[]
def abs_path(s):return str(R/s) if s.startswith(('.control/','.bootstrap/','evidence/')) else s
for p in inv['exclusion_plans']:
 p=Path(p);assert p.is_relative_to(R/'.bootstrap');d=json.loads(p.read_text());pins[str(p)]=sha(p);found=set()
 def walk(x,context=''):
  if isinstance(x,dict):
   for k,v in x.items():
    if k in ('target','archive','object') and isinstance(v,str) and ('/' in v):found.add(abs_path(v))
    if k=='path' and context=='targets' and isinstance(v,str):found.add(abs_path(v))
    walk(v,k if k=='targets' else context)
  elif isinstance(x,list):
   for v in x:walk(v,context)
 walk(d)
 prior_targets.update(found);prior_rows.append({'path':str(p),'sha256':pins[str(p)],'target_paths_collected':len(found)})
receipts=[];tags={}
for x in inv['receipts']:
 assert 164<=x['worker']<=168
 p=R/'.control/markov/workers'/f"{x['worker']:06d}"/'receipt.json';assert sha(p)==x['sha256'];d=json.loads(p.read_text());assert d['request_id']==x['request'] and d['outcome']=='completed' and d['returncode']==0
 pins[str(p)]=x['sha256'];receipts.append({'worker':x['worker'],'path':str(p),'sha256':x['sha256'],'request_id':d['request_id'],'outcome':d['outcome'],'returncode':d['returncode']});tags['markov-'+x['request'][:8]]=x['worker']
assert set(tags.values())==set(range(164,169))
sources={x['source'] for x in inv['pairs']};targets={x['target'] for x in inv['pairs']};assert len(sources)==94 and len(targets)==188 and not sources&targets
assert not targets&prior_targets,targets&prior_targets
allpaths=sorted(sources|targets);observed={};tmpdev=Path('/private/tmp').stat().st_dev
for index,path in enumerate(allpaths):
 p=Path(path);assert p.is_relative_to(R) and p.resolve()==p
 before=p.lstat();assert stat.S_ISREG(before.st_mode) and before.st_nlink==1 and before.st_flags==0 and before.st_dev==tmpdev
 assert not subprocess.check_output(['/usr/bin/xattr',str(p)]).strip()
 assert len(subprocess.check_output(['/bin/ls','-lde',str(p)]).splitlines())==1
 digest=sha(p);after=p.lstat();assert md(before)==md(after),path
 observed[path]={'sha256':digest,**md(after),'atime_before_hash_ns':before.st_atime_ns,'atime_after_hash_ns':after.st_atime_ns}
 if (index+1)%50==0:print('Hashed named files',index+1,'of',len(allpaths),flush=True)
classes=collections.Counter();atime_diff=0
for x in inv['pairs']:
 s=Path(x['source']);t=Path(x['target']);ss=observed[str(s)];tt=observed[str(t)]
 assert s.parent.parent==R/'evidence' and s.parent.name in tags and s.suffix=='.olean'
 w=tags[s.parent.name]
 if t.is_relative_to(R/'.control/markov/workers'):
  rel=t.relative_to(R/'.control/markov/workers');assert int(rel.parts[0])==w and rel.parts[1]=='artifacts' and R.joinpath(*rel.parts[2:])==s;classes[f'archive_{w}']+=1
 else:
  assert t.parent==R/'.control/markov/objects' and t.name==x['sha256'];classes['content_addressed_objects']+=1
 assert ss['sha256']==tt['sha256']==x['sha256'] and ss['bytes']==tt['bytes']==x['bytes']
 assert ss['inode']!=tt['inode'] and ss['device']==tt['device']
 assert tt['inode']==x['inode_before']
 for k in ['mode','uid','gid','mtime_ns']:assert tt[k]==x[k],(str(t),k)
 atime_diff+=tt['atime_before_hash_ns']!=x['atime_ns']
assert sha(I)==expected and sha(S)==script_sha
finish=datetime.now(timezone.utc).isoformat();assert not O.exists()
result={'status':'preflight_passed_no_operation_executed','scope':'Separate operational static and named-file hash review of 188 compiled archive/object replacement targets for closed audited workers 164–168 only. No 169+ paths, active sources, project program, mathematical computation, bytecode/object interpretation, clone, deletion, chmod, chown, utime, rename, or target replacement was executed. Does not extend or rewrite any mathematical audit observation window.',
 'started_utc':start,'finished_utc':finish,'inventory_path':str(I),'inventory_sha256':expected,'script_path':str(S),'script_sha256':script_sha,'candidate_count':188,'logical_duplicate_bytes':2394524272,'unique_canonical_sources':94,'unique_named_files_hashed':len(observed),'target_classes':dict(classes),'receipt_bindings':receipts,'prior_exclusion_record_count':22,'prior_unique_target_count':len(prior_targets),'prior_plan_target_overlap':[],
 'checks':{'all_expected_pair_hashes_and_sizes_match':True,'all_targets_match_inventory_mode_uid_gid_mtime_inode':True,'all_ordinary_distinct_single_link_same_volume':True,'no_symlink_components_or_flags_xattrs_acl':True,'no_source_target_overlap':True,'all_source_tags_match_closed_worker_receipts':True,'targets_only_archive_or_content_addressed_objects':True,'no_source_or_current_evidence_replacement_target':True,'no_169_or_later_path_read':True,'proposed_script_AST_valid_not_executed':True,'inventory_and_script_unchanged_through_review':True},
 'script_review':{'inventory_digest_literal_authenticated':True,'review_digest_authenticated_from_required_cli_argument':True,'fresh_per_pair_preconditions_before_clone':True,'source_target_rehashed_before_replacement':True,'temporary_copy_rehashed_before_replacement':True,'target_mode_uid_gid_mtime_restored':True,'target_per_operation_atime_restored':True,'atomic_replace_only_verified_target':True,'result_progress_recorded_after_each_replacement':True,'no_requested_correction':True,'execution_contract':'Root must execute exactly this reviewed script and supply this review file SHA as its sole argument. The script pins the inventory SHA and authenticates that review-file digest; root retains responsibility for using the reviewed script version. No operation was performed by this reviewer.'},
 'metadata_boundary':{'inventory_atime_immutable':False,'targets_with_atime_different_from_inventory_before_hash':atime_diff,'per_operation_atime':'Script captures each target at operation entry, before its verification reads, and restores that atime after final hash. Inventory atime is not a historical immutability condition; this review may itself update atime.','allowed_changes':['inode','ctime','birth time'],'unchanged_required':['bytes','mode','uid','gid','mtime']},
 'limitations':['This is a bounded read-only preflight, not an execution or post-operation result. Script rechecks immediately before each operation.','Atomic replacement is per file; the full 188-file operation is not transactional. A later precondition failure can leave an already-verified partial prefix, recorded in the result.','No promise of physical bytes saved: logical duplicate size is not guaranteed free-space gain; unrelated concurrent changes must not be attributed to cloning.','No compiler/proof/replay or inherited-body validation credit is conferred.'],
 'input_sha256':pins,'prior_exclusion_records':prior_rows,'named_file_observations_canonical_sha256':hashlib.sha256(json.dumps(observed,sort_keys=True,separators=(',',':')).encode()).hexdigest(),'named_file_observations':observed,'necessary_corrections':[]}
O.write_text(json.dumps(result,indent=2,sort_keys=True)+'\n');print(json.dumps({'review':str(O),'bytes':O.stat().st_size,'sha256':sha(O),'counts':dict(classes),'unique_files':len(observed),'prior_targets':len(prior_targets),'atime_differences':atime_diff,'window':[start,finish]},indent=2))
