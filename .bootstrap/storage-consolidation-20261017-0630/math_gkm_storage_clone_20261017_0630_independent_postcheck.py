"""Read-only independent postcheck of exact storage0630 paths; no replacement/research execution."""
from pathlib import Path
from datetime import datetime,timezone
import ast,hashlib,json,stat,subprocess
R=Path('/Users/sasha/math_gkm')
I=Path('/private/tmp/math_gkm_storage_inventory_20261017_0630.json')
V=Path('/private/tmp/math_gkm_storage_inventory_20261017_0630_independent_review.json')
C=Path('/private/tmp/math_gkm_storage_clone_20261017_0630.py')
RESULT=Path('/private/tmp/math_gkm_storage_clone_20261017_0630_result.json')
OUT=Path('/private/tmp/math_gkm_storage_clone_20261017_0630_independent_postcheck.json')
HEAD='f356f76c5e62902fb6a844d74320e1d7a003a395'
started=datetime.now(timezone.utc).isoformat();assert not OUT.exists()
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def pin(p):
 p=Path(p);return {'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}
def command(args):return subprocess.check_output(args,cwd=R)
def meta(p):
 s=Path(p).lstat();return {'mode':stat.S_IMODE(s.st_mode),'file_type':stat.S_IFMT(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,
 'bytes':s.st_size,'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'ctime_ns':s.st_ctime_ns,'birthtime':s.st_birthtime,
 'inode':s.st_ino,'device':s.st_dev,'nlink':s.st_nlink,'flags':s.st_flags}
def non_atime(m):return {k:v for k,v in m.items() if k!='atime_ns'}
def sample(p):
 p=Path(p);assert p.resolve()==p
 before=meta(p);assert before['file_type']==stat.S_IFREG and before['nlink']==1 and before['flags']==0
 acl=command(['/bin/ls','-lde',str(p)]).decode();xattr=command(['/usr/bin/xattr',str(p)]).decode()
 assert len(acl.splitlines())==1 and not xattr.strip()
 digest=sha(p);after=meta(p);assert non_atime(before)==non_atime(after)
 return {'path':str(p),'sha256':digest,'before_read':before,'after_read':after,'acl_output':acl,'xattr_output':xattr,
         'stable_metadata_unchanged_during_sample':True,'atime_changed_during_postcheck_read':before['atime_ns']!=after['atime_ns']}
assert sha(I)=='8eaa14426da4b6da7a3ccdbfcd5900d5f0a64149376bd0a95a1817ad8a7f9a45'
assert sha(V)=='60c0f2834bdd78ecae76f84d71204c3ad5ace9ba6ed8bbf0e62a8c7dec8e8633'
assert sha(C)=='8227c9450ec32800f9c97b25f2a6a93e31691b6c62006e0d8e9c9ef0cc9048cb'
result_pin=pin(RESULT)
assert result_pin['sha256']=='6cdeb4e50802346939ec8cada3dfc863c3d2e37997186d7ba598373588f36c8b'
i=json.loads(I.read_text());v=json.loads(V.read_text());result=json.loads(RESULT.read_text())
assert v['concurrence'] is True and v['mismatches']==[] and result['status']=='complete' and result['processed']==58
assert result['inventory_sha256']==sha(I) and result['review_sha256']==sha(V)
assert i['repository_head']==v['repository_head']==HEAD==command(['git','rev-parse','HEAD']).decode().strip()
records={r['target']:r for r in result['records']};ipairs={r['target']:r for r in i['pairs']}
prior_targets={r['path']:r for r in v['targets']};prior_sources={r['path']:r for r in v['canonical_sources']}
assert len(result['records'])==len(records)==len(ipairs)==len(prior_targets)==58
assert records.keys()==ipairs.keys()==prior_targets.keys() and len(prior_sources)==33
assert sum(p['bytes'] for p in i['pairs'])==i['candidate_bytes']==546506823
assert {p['source'] for p in i['pairs']}==set(prior_sources)
assert not set(prior_sources)&set(records)
volume=Path('/private/tmp').stat().st_dev
target_rows=[];source_rows=[]
for target,p in ipairs.items():
 r=records[target];old=prior_targets[target]
 assert r['source']==p['source'] and r['sha256']==p['sha256']==old['sha256'] and r['bytes']==p['bytes']
 assert r['old_inode']==p['inode_before']==old['after_read']['inode'] and r['new_inode']!=r['old_inode']
 assert {k:r['metadata_preserved'][k] for k in ['mode','uid','gid','mtime_ns']}=={k:p[k] for k in ['mode','uid','gid','mtime_ns']}
 row=sample(target);m=row['before_read']
 assert row['sha256']==p['sha256'] and m['bytes']==p['bytes'] and m['device']==volume
 assert m['inode']==r['new_inode'] and all(m[k]==p[k] for k in ['mode','uid','gid','mtime_ns'])
 row.update(kind=p['kind'],source=p['source'],inventory_bytes_and_stable_metadata_match=True,
            recorded_new_inode_matches=True,old_inode=r['old_inode'],new_inode=r['new_inode'],
            operation_preserved_metadata=r['metadata_preserved'],
            atime_at_postcheck_matches_operation_record=m['atime_ns']==r['metadata_preserved']['atime_ns'],
            operation_atime_matches_preflight_sample=r['metadata_preserved']['atime_ns']==old['after_read']['atime_ns'],
            ctime_changed_since_preflight=m['ctime_ns']!=old['after_read']['ctime_ns'],
            birthtime_changed_since_preflight=m['birthtime']!=old['after_read']['birthtime'])
 target_rows.append(row)
for source,old in prior_sources.items():
 row=sample(source);m=row['before_read']
 assert row['sha256']==old['sha256'] and non_atime(m)==non_atime(old['after_read']) and m['device']==volume
 row.update(canonical_bytes_and_all_non_atime_metadata_unchanged=True,
            inode_unchanged=True,ctime_unchanged=True,birthtime_unchanged=True,
            atime_since_preflight_changed=m['atime_ns']!=old['after_read']['atime_ns'],
            preflight_atime_ns=old['after_read']['atime_ns'])
 source_rows.append(row)
assert len({row['before_read']['inode'] for row in target_rows})==58
assert len({row['before_read']['inode'] for row in source_rows})==33
assert not {row['before_read']['inode'] for row in target_rows}&{row['before_read']['inode'] for row in source_rows}
committed=[]
for p in {r['path']:r for r in i['committed_input_pins']}.values():
 path=Path(p['path']);blob=command(['git','rev-parse',HEAD+':'+str(path.relative_to(R))]).decode().strip()
 data=command(['git','cat-file','blob',blob])
 assert blob==p['git_blob'] and hashlib.sha256(data).hexdigest()==p['sha256']==sha(path) and len(data)==p['bytes']
 committed.append(p)
assert len(committed)==10
assert command(['git','rev-parse','HEAD']).decode().strip()==HEAD
assert pin(RESULT)==result_pin
paths=[I.with_suffix('.py'),I,C,V.with_suffix('.py'),V,RESULT,Path(__file__),OUT]
assert len(paths)==len(set(paths))==8
for path in [I.with_suffix('.py'),C,V.with_suffix('.py'),Path(__file__)]:ast.parse(path.read_text())
pins=[pin(p) for p in paths if p!=OUT]
assert next(p for p in pins if p['path']==str(V.with_suffix('.py')))['sha256']=='499d39d32629f92262ef07a9d2eafd2c87c1baa421b386aec694c314757f5882'
out={'scope':'Independent storage-only read-only postcheck of the exact58 replaced targets and33 canonical sources for sealed177-178. No active179+ paths, research execution, object interpretation, further replacement or mathematical audit-window extension.',
 'started_utc':started,'finished_utc':datetime.now(timezone.utc).isoformat(),'concurrence':True,'verdict':'All58 replacements and33 canonical identities pass independent sampled postcheck.',
 'repository_head':HEAD,'inventory':pin(I),'preflight':pin(V),'result':result_pin,'operation_status':result['status'],
 'operation_window':{'started_utc':result['started_utc'],'finished_utc':result['finished_utc']},
 'target_count':58,'canonical_source_count':33,'logical_duplicate_bytes':546506823,'mismatches':[],
 'target_rows':target_rows,'canonical_source_rows':source_rows,'committed_identity_rechecks':committed,
 'summary':{'all_target_bytes_mode_uid_gid_mtime_match':True,'all_target_inodes_match_operation_record':True,'all58_target_inodes_changed':True,
  'all_canonical_bytes_mode_uid_gid_mtime_inode_ctime_birthtime_unchanged':True,'all_files_regular_single_link_no_acl_xattrs_flags':True,
  'same_volume':True,'canonical_and_target_inode_sets_disjoint':True,
  'target_atime_matches_operation_record_count':sum(r['atime_at_postcheck_matches_operation_record'] for r in target_rows),
  'operation_atime_matches_preflight_count':sum(r['operation_atime_matches_preflight_sample'] for r in target_rows),
  'target_atime_changes_during_postcheck_reads':sum(r['atime_changed_during_postcheck_read'] for r in target_rows),
  'canonical_atime_changes_since_preflight':sum(r['atime_since_preflight_changed'] for r in source_rows),
  'canonical_atime_changes_during_postcheck_reads':sum(r['atime_changed_during_postcheck_read'] for r in source_rows)},
 'access_time_boundary':'Operation record preserves each target atime sampled before that per-file operation\'s own hashes, not historical atime. Current pre-read and post-read values are recorded independently. Concurrent-reader or operation-reader attribution cannot be established from these samples; canonical atime can change through read access without source content/identity mutation.',
 'observation_limits':'Preflight, operation record and postcheck are bounded samples, not continuous monitoring. Inode/ctime/birthtime changes on targets are authorized; canonical inode/ctime/birthtime were independently compared. No filesystem lock, batch rollback or exclusive attribution of disk free-space changes is asserted.',
 'free_space_record_only':{'before_bytes':result['free_before'],'after_bytes':result['free_after'],'difference_bytes':result['free_after']-result['free_before'],
  'qualification':'Root operation-window observations only; postcheck does not attribute all change exclusively to this operation.'},
 'prior_mathematical_windows_and_statuses_unchanged':True,'operation_executed_by_reviewer':False,
 'retained_record_pins_excluding_self':pins,'preservation_paths':[str(p) for p in paths],
 'self_hash_boundary':'This JSON cannot contain its own final digest; the separately returned eight-file hash list supplies it.'}
OUT.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'concurrence':True,'summary':out['summary'],'preservation_files':[pin(p) for p in paths]},indent=2))
