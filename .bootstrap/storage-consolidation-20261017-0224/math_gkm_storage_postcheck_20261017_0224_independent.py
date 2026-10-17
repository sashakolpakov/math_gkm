"""Read-only post-operation file-identity check; no project or operation execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,stat,collections
T=Path('/private/tmp');R=Path('/Users/sasha/math_gkm');I=T/'math_gkm_storage_inventory_20261017_0224.json';S=T/'math_gkm_storage_clone_20261017_0224.py';V=T/'math_gkm_storage_inventory_20261017_0224_independent_review.json';Q=T/'math_gkm_storage_clone_20261017_0224_result.json';O=T/'math_gkm_storage_clone_20261017_0224_independent_postcheck.json'
def digest(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def md(s):return {'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,'mtime_ns':s.st_mtime_ns}
def stable(s):return {**md(s),'inode':s.st_ino,'device':s.st_dev,'bytes':s.st_size,'nlink':s.st_nlink,'flags':s.st_flags}
start=datetime.now(timezone.utc).isoformat()
expected={str(I):'0bcd386de67cf2b08868b5c14c9d6413b1a023675749be90d161767e874cea80',str(S):'2c5f2b4c72a47e278029399fbd7276a59ae681f04eee75441224d1fc0e308e53',str(V):'6b51ac0e85b2eebe8d56da1a05c9233d6327de1b7c95513871a3849581e9757a',str(Q):'ec1a2897ffac5757794f84271744a379e635f3cf82606d54a8c07093a01f14a0'}
for p,h in expected.items():assert digest(p)==h,p
inv=json.loads(I.read_text());review=json.loads(V.read_text());result=json.loads(Q.read_text());assert result['status']=='complete' and result['processed']==len(result['records'])==len(inv['pairs'])==188
assert result['inventory_sha256']==review['inventory_sha256']==expected[str(I)]
assert result['review_sha256']==expected[str(V)] and review['script_sha256']==expected[str(S)]
assert review['status']=='preflight_passed_no_operation_executed' and review['necessary_corrections']==[]
assert sum(x['bytes'] for x in inv['pairs'])==inv['candidate_bytes']==review['logical_duplicate_bytes']==2394524272
assert result['started_utc']=='2026-10-17T02:34:05.500465+00:00' and result['finished_utc']=='2026-10-17T02:34:16.069311+00:00'
by_target={x['target']:x for x in result['records']};assert len(by_target)==188 and set(by_target)=={x['target'] for x in inv['pairs']}
sources={x['source'] for x in inv['pairs']};targets=set(by_target);assert len(sources)==94 and not sources&targets
tags={'markov-'+x['request'][:8]:x['worker'] for x in inv['receipts']};assert set(tags.values())==set(range(164,169))
for entry in inv['pairs']:
 row=by_target[entry['target']]
 for k in ['source','target','sha256','bytes']:assert row[k]==entry[k],(entry['target'],k)
 assert row['old_inode']==entry['inode_before'] and row['new_inode']!=row['old_inode']
 for k in ['mode','uid','gid','mtime_ns']:assert row['metadata_preserved'][k]==entry[k]
 s=Path(entry['source']);t=Path(entry['target']);assert s.parent.parent==R/'evidence' and s.parent.name in tags and s.suffix=='.olean'
 if t.is_relative_to(R/'.control/markov/workers'):
  rel=t.relative_to(R/'.control/markov/workers');assert int(rel.parts[0])==tags[s.parent.name] and rel.parts[1]=='artifacts' and R.joinpath(*rel.parts[2:])==s
 else:assert t.parent==R/'.control/markov/objects' and t.name==entry['sha256']
observed={};tmpdev=T.stat().st_dev
for index,path in enumerate(sorted(sources|targets)):
 p=Path(path);assert p.resolve()==p;before=p.lstat();assert stat.S_ISREG(before.st_mode) and before.st_nlink==1 and before.st_flags==0 and before.st_dev==tmpdev
 h=digest(p);after=p.lstat();assert stable(before)==stable(after),path
 observed[path]={**stable(after),'sha256':h,'atime_before_hash_ns':before.st_atime_ns,'atime_after_hash_ns':after.st_atime_ns}
 if (index+1)%50==0:print('Postchecked named files',index+1,'of',len(sources|targets),flush=True)
rows=[];classes=collections.Counter();atime_mismatch=[];atime_read_changed=[]
for entry in inv['pairs']:
 s=observed[entry['source']];t=observed[entry['target']];row=by_target[entry['target']]
 assert s['sha256']==t['sha256']==entry['sha256'] and s['bytes']==t['bytes']==entry['bytes']
 assert s['inode']!=t['inode'] and s['device']==t['device'] and t['inode']==row['new_inode']
 for k in ['mode','uid','gid','mtime_ns']:assert t[k]==row['metadata_preserved'][k]==entry[k]
 if t['atime_before_hash_ns']!=row['metadata_preserved']['atime_ns']:atime_mismatch.append({'target':entry['target'],'operation_atime_ns':row['metadata_preserved']['atime_ns'],'postcheck_before_hash_atime_ns':t['atime_before_hash_ns']})
 if t['atime_after_hash_ns']!=t['atime_before_hash_ns']:atime_read_changed.append(entry['target'])
 target_class='content_addressed_objects' if '/objects/' in entry['target'] else 'archive_'+entry['target'].split('/workers/')[1].split('/')[0];classes[target_class]+=1
 rows.append({'source':entry['source'],'target':entry['target'],'sha256':entry['sha256'],'bytes':entry['bytes'],'old_inode':row['old_inode'],'recorded_new_inode':row['new_inode'],'observed_new_inode':t['inode'],'stable_metadata':{k:t[k] for k in ['mode','uid','gid','mtime_ns']},'recorded_operation_atime_ns':row['metadata_preserved']['atime_ns'],'atime_before_postcheck_hash_ns':t['atime_before_hash_ns'],'atime_after_postcheck_hash_ns':t['atime_after_hash_ns'],'atime_matches_operation_before_read':t['atime_before_hash_ns']==row['metadata_preserved']['atime_ns']})
for p,h in expected.items():assert digest(p)==h,p
finish=datetime.now(timezone.utc).isoformat();assert not O.exists()
helper=Path(__file__);required=[str(I),str(S),str(V),str(Q),str(O),review['independent_hash_helper']['path'],str(helper)]
out={'status':'postcheck_passed','scope':'Separate read-only operational postcheck of exactly 188 retained compiled targets and their 94 canonical sources from closed workers 164–168. No 169+ file read, project program/proof/checker/replay/experiment execution, mathematical computation, object interpretation, clone, deletion, chmod, chown, utime or replacement. Does not extend any mathematical audit observation window.',
 'started_utc':start,'finished_utc':finish,'operation_started_utc':result['started_utc'],'operation_finished_utc':result['finished_utc'],'input_pins':[{'path':p,'bytes':Path(p).stat().st_size,'sha256':h} for p,h in expected.items()],'processed':188,'unique_canonical_sources':94,'unique_named_files_hashed':282,'logical_duplicate_bytes':2394524272,'target_classes':dict(classes),
 'checks':{'all_expected_source_target_hashes_and_sizes_match':True,'all_target_mode_uid_gid_mtime_match_inventory_and_result':True,'all_recorded_new_inodes_match_current_targets':True,'all_target_inodes_differ_from_inventory_old_inodes':True,'all_ordinary_single_link_distinct_same_volume_files':True,'all_source_paths_match_closed_worker_tags':True,'no_source_current_evidence_replacement_target':True,'exact_result_target_set_and_order_matches_inventory':result['records']==[by_target[x['target']] for x in inv['pairs']],'inventory_review_result_digest_chain_valid':True,'current_script_matches_reviewed_script_sha256':True,'input_records_unchanged_during_postcheck':True},
 'atime_observation':{'targets_matching_recorded_operation_atime_before_postcheck_hash':188-len(atime_mismatch),'targets_differing_before_hash':atime_mismatch,'targets_changed_during_this_postcheck_hash':atime_read_changed,'qualification':'Atime is read before each content hash. A pre-existing atime difference would be compatible with intervening reads and is not evidence of byte or stable-metadata mutation; no producing reader is inferred. Reading during this postcheck may advance atime. Inventory atime is not asserted immutable; operation records preserve each target at operation entry.'},
 'free_space':{'reported_before_bytes':result['free_before'],'reported_after_bytes':result['free_after'],'observed_change_bytes':result['free_after']-result['free_before'],'qualification':'These are operation-window free-space observations, not an independent attribution of every free byte to cloning. Logical duplicate size is not a guaranteed physical reclaim amount; unrelated concurrent changes are not attributed.'},
 'metadata_limitations':'Inode changes are intended and verified; ctime and birth time may change. This postcheck authenticates retained bytes and required stable metadata at its bounded observation, not future immutability or compiler/proof provenance.',
 'independent_helper':{'path':str(helper),'sha256':digest(helper)},'required_preservation_companions':required,'rows':rows,'necessary_corrections':[]}
O.write_text(json.dumps(out,indent=2,sort_keys=True)+'\n');print(json.dumps({'postcheck':str(O),'bytes':O.stat().st_size,'sha256':digest(O),'window':[start,finish],'atime_matches_before_hash':188-len(atime_mismatch),'atime_changed_during_hash':len(atime_read_changed),'preservation_files':required},indent=2))
