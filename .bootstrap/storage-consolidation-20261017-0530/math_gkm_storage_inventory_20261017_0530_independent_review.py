"""Independent read-only storage preflight. Never invokes the reviewed clone operation."""
from pathlib import Path
import json,hashlib,datetime,stat,subprocess,os,ast,collections,re
R=Path('/Users/sasha/math_gkm');T=Path('/private/tmp/math_gkm_godel_20261013');B=R/'.bootstrap/independent-controller-audit'
I=Path('/private/tmp/math_gkm_storage_inventory_20261017_0530.json');IH=I.with_suffix('.py');C=Path('/private/tmp/math_gkm_storage_clone_20261017_0530.py');O=Path('/private/tmp/math_gkm_storage_inventory_20261017_0530_independent_review.json')
assert not O.exists()
def now():return datetime.datetime.now(datetime.timezone.utc).isoformat()
def digest(p):
 with Path(p).open('rb')as f:return hashlib.file_digest(f,'sha256').hexdigest()
def pin(p):p=Path(p);return dict(path=str(p),bytes=p.stat().st_size,sha256=digest(p))
def meta(p):
 s=Path(p).lstat();return dict(bytes=s.st_size,mode=stat.S_IMODE(s.st_mode),uid=s.st_uid,gid=s.st_gid,mtime_ns=s.st_mtime_ns,atime_ns=s.st_atime_ns,inode=s.st_ino,device=s.st_dev,nlink=s.st_nlink,flags=s.st_flags,ctime_ns=s.st_ctime_ns,birthtime=getattr(s,'st_birthtime',None),regular=stat.S_ISREG(s.st_mode),symlink=stat.S_ISLNK(s.st_mode))
env=dict(os.environ,GIT_OPTIONAL_LOCKS='0',GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null')
def git(*args):return subprocess.check_output(['git','-C',str(R),*args],env=env)
start=now();assert digest(I)=='3e13b4418998f37432ffe9cd5dca6e229660536d426fac5a52d6d1773c87d10d';assert digest(C)=='c0026e9e6277e3a47fb9dfdd43ab5e014557ff1291e04b31d3c88aa789357acc'
d=json.loads(I.read_text());assert digest(IH)==d['inventory_helper']['sha256'];ast.parse(IH.read_text());ast.parse(C.read_text())
head=git('rev-parse','HEAD').decode().strip();assert head==d['repository_head']=='d13904f42ace96abaf48406c02a32c3930e1e52d'
rows=d['pairs'];assert len(rows)==d['candidate_count']==94 and sum(x['bytes']for x in rows)==d['candidate_bytes']==1104425681
assert collections.Counter(x['kind']for x in rows)=={'temporary_audit':42,'archive':26,'object':26}
assert len({x['target']for x in rows})==94 and len({x['source']for x in rows})==68
assert not {x['target']for x in rows}&{x['source']for x in rows};assert not d['mismatch']
excluded=set();priorpins=[]
def norm(p):return str(R/p)if p.startswith(('.control/','.bootstrap/','evidence/'))else p
def collect(x,ctx=''):
 if isinstance(x,dict):
  for k,v in x.items():
   if k in ('target','archive','object')and isinstance(v,str)and'/'in v:excluded.add(norm(v))
   if k=='path'and ctx=='targets'and isinstance(v,str):excluded.add(norm(v))
   collect(v,k if k=='targets'else ctx)
 elif isinstance(x,list):
  for v in x:collect(v,ctx)
for p in d['exclusion_plans']:
 p=Path(p);assert p.is_relative_to(R/'.bootstrap')and p.resolve()==p
 priorpins.append(pin(p));collect(json.loads(p.read_text()))
assert len(priorpins)==36 and len(excluded)==d['excluded_target_count']==5971
assert not excluded&{x['target']for x in rows}
committed=[]
for x in d['committed_input_pins']:
 p=Path(x['path']);assert p.resolve()==p and p.is_relative_to(R)
 rel=str(p.relative_to(R));blob=git('rev-parse',head+':'+rel).decode().strip();assert blob==x['git_blob']
 proc=subprocess.Popen(['git','-C',str(R),'cat-file','blob',blob],stdout=subprocess.PIPE,env=env);h=hashlib.sha256();n=0
 for chunk in iter(lambda:proc.stdout.read(1048576),b''):h.update(chunk);n+=len(chunk)
 proc.stdout.close();assert proc.wait()==0
 assert h.hexdigest()==x['sha256']==digest(p)and n==x['bytes']==p.stat().st_size
 committed.append(dict(**x,current_and_committed_match=True))
assert len(committed)==57
seals={};sealchecks=[]
def allpins(x,result):
 if isinstance(x,dict):
  if isinstance(x.get('path'),str)and isinstance(x.get('sha256'),str):result.setdefault(x['path'],set()).add(x['sha256'])
  for v in x.values():allpins(v,result)
 elif isinstance(x,list):
  for v in x:allpins(v,result)
for w in range(164,177):
 p=B/f'markov_worker_{w:06}_audit_integrity.json';s=json.loads(p.read_text());assert s['worker']==w
 tp=T/p.name;assert digest(tp)==digest(p)
 sp={};allpins(s,sp);seals[w]=(s,sp)
 sealchecks.append(dict(worker=w,committed_seal=pin(p),temporary_seal=pin(tp),bytes_equal=True))
receipts={};receiptchecks=[]
for record in d['receipts']:
 w=record['worker'];assert w in(175,176);p=R/f'.control/markov/workers/{w:06}/receipt.json';r=json.loads(p.read_text());assert digest(p)==record['sha256'];assert r['request_id']==record['request']and r['outcome']==record['outcome']=='completed'and r['returncode']==record['returncode']==0
 s,_=seals[w];assert digest(record['audit_seal'])==record['audit_seal_sha256'];assert s['request']==r['request_id']and s['historical_outcome']['outcome']==r['outcome']and s['historical_outcome']['returncode']==r['returncode']
 receipts[w]=r;receiptchecks.append(dict(**record,seal_and_receipt_match=True))
assert set(receipts)=={175,176}
cache={};checks=[];canonical=[];tmpdev=Path('/private/tmp').stat().st_dev
for row in rows:
 source,target=Path(row['source']),Path(row['target']);assert source.resolve()==source and target.resolve()==target
 assert str(target)not in excluded and str(source)not in {x['target']for x in rows}
 if row['kind']=='temporary_audit':
  assert target.parent==T and source==B/target.name and row['bytes']>=1048576 and target.suffix in('.json','.md')
  w=int(target.name.split('_')[2]);assert 164<=w<=176;s,sp=seals[w];assert str(target)in set(s['preservation_paths'])|{str(T/f'markov_worker_{w:06}_audit_integrity.json')}
  if target.name!=f'markov_worker_{w:06}_audit_integrity.json':assert row['sha256']in sp[str(target)]
  binding='Committed sealed audit record and exact preservation/hash pin'
 else:
  assert source.parent.parent==R/'evidence'and source.suffix in('.olean','.ilean')
  w=175 if source.parent.name=='markov-6576ccc5' else 176 if source.parent.name=='markov-be355177' else 0;assert w in receipts
  rel=str(source.relative_to(R));assert receipts[w]['changes'][rel]['after']==row['sha256']
  if row['kind']=='archive':assert target==R/f'.control/markov/workers/{w:06}/artifacts'/rel
  else:assert row['kind']=='object'and target.parent==R/'.control/markov/objects'and target.name==row['sha256']
  binding='Closed receipt change digest and canonical current evidence identity'
 if str(source)not in cache:
  sm=meta(source);sh=digest(source);acl=subprocess.check_output(['/bin/ls','-lde',str(source)]).decode();xa=subprocess.check_output(['/usr/bin/xattr',str(source)]).decode();assert len(acl.splitlines())==1 and not xa.strip()
  cache[str(source)]=(sm,sh);canonical.append(dict(path=str(source),metadata_before_read=sm,sha256=sh,acl=acl,xattrs=xa,metadata_after_read=meta(source)))
 sm,sh=cache[str(source)];tm=meta(target);th=digest(target);acl=subprocess.check_output(['/bin/ls','-lde',str(target)]).decode();xa=subprocess.check_output(['/usr/bin/xattr',str(target)]).decode()
 assert len(acl.splitlines())==1 and not xa.strip()
 assert sm['regular']and tm['regular']and not sm['symlink']and not tm['symlink'];assert sm['device']==tm['device']==tmpdev
 assert sm['nlink']==tm['nlink']==1 and sm['flags']==tm['flags']==0 and sm['inode']!=tm['inode']
 assert tm['inode']==row['inode_before'];assert sh==th==row['sha256'];assert sm['bytes']==tm['bytes']==row['bytes']
 assert all(tm[k]==row[k]for k in ['mode','uid','gid','mtime_ns'])
 checks.append(dict(source=str(source),target=str(target),kind=row['kind'],worker=w,binding=binding,bytes=row['bytes'],sha256=th,target_metadata_before_read=tm,target_metadata_after_read=meta(target),source_metadata=sm,acl=acl,xattrs=xa,inventory_metadata_match=True,source_target_bytes_match=True,regular_distinct_single_link_same_volume=True))
assert len(cache)==68 and len(checks)==94
assert git('rev-parse','HEAD').decode().strip()==head
assert digest(I)=='3e13b4418998f37432ffe9cd5dca6e229660536d426fac5a52d6d1773c87d10d'and digest(C)=='c0026e9e6277e3a47fb9dfdd43ab5e014557ff1291e04b31d3c88aa789357acc'
result={'scope':'Separate storage-only preflight. Exact named closed164–176 sealed audit files and175–176 compiled archive/object copies only. No177+ source/event read, research execution, object interpretation, source edits or storage operation. Prior mathematical observations/statuses unchanged.','started_utc':start,'finished_utc':now(),'reviewer':'/root/monitoring_audit/sealed136_review','inventory':pin(I),'inventory_helper':pin(IH),'clone_helper':pin(C),'review_helper':pin(Path(__file__)),'repository_head':head,'candidate_count':94,'candidate_bytes':1104425681,'canonical_source_count':68,'classes':dict(collections.Counter(x['kind']for x in rows)),'prior_records':priorpins,'excluded_target_count':len(excluded),'no_prior_target_overlap':True,'committed_input_checks':committed,'seal_checks':sealchecks,'receipt_checks':receiptchecks,'targets':checks,'canonical_sources':canonical,'same_volume_device':tmpdev,'mismatches':[],'concurrence':True,'necessary_corrections':[],
'clone_semantics':{'inventory_and_review_hash_pinned':True,'target_scope_rechecked':True,'canonical_sources_never_replaced':True,'distinct_regular_single_link_same_volume_rechecked':True,'stable_metadata_and_bytes_rechecked_before_replace':True,'staged_clone_then_atomic_replace':True,'mode_uid_gid_mtime_preserved':True,'atime_preserved_from_per_operation_snapshot':True,'inode_ctime_birth_may_change':True,'source_target_disjoint':True,'temporary_uuid_only_cleanup':True,'no_operation_executed_by_reviewer':True},
'limits':['Single operator/exact reviewed script required. There is no filesystem lock or automatic post-replace rollback; source/target inode, stable metadata and hashes are rechecked before replacement.','Atime is observed per operation; these preflight hash/ACL/xattr reads may advance atime. The clone restores the atime sampled before that replacement, not historical inventory atime. Concurrent access after that sample is not protected by a lock.','Canonical sources have no explicit writes in the operation; read-induced access-time changes remain possible. Inode/ctime/birth metadata can change for replaced targets.','Same-volume metadata and cp -c invocation are verified; extent sharing or actual reclaimed disk space is not proven by this preflight. No durability or uninterrupted-operation guarantee is inferred.','Only exact inventory candidates and named receipt/seal/prior-plan files were read. This does not extend any mathematical audit window.'],
'child_static_review':{'reviewer':'/root/monitoring_audit/sealed136_review/method138','scope':'Only the three authorized inventory/script temporary files; no project reads or operation execution.','concurrence':True,'necessary_corrections':[],'limits':'No lock or automatic rollback; exact script and single operator required.'}}
O.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'review':pin(O),'helper':pin(Path(__file__)),'targets':94,'sources':68,'bytes':1104425681,'concurrence':True},indent=2))
