"""Read-only postcheck of the exact authorized storage1048 targets and sources."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,stat,subprocess

P=Path('/Users/sasha/math_gkm')
HEAD='0e1f1d8e44cfddd7d0a253e69112575d9df95585'
IB='/private/tmp/math_gkm_storage_inventory_20261017_1048'
CB='/private/tmp/math_gkm_storage_clone_20261017_1048'
OUT=Path(CB+'_independent_postcheck.json')
EXPECTED={
 IB+'.json':'130c069893f0741af85f4073ca9327d690890582967bb22a1483bd9caca2951a',
 IB+'.py':'6e8227471358f1e50301237b5192241b6595b326b21a89033230745041f105a2',
 CB+'.py':'45b79afb54de1e4364bd64934ac1ac9a1907f2a9d6bb3ede1d99f1296a1e3fdb',
 IB+'_independent_review.json':'167f76cf3a34744278979aef3eba207c4a7ae6189fb130bcd2c4340ffdc4b2f1',
 IB+'_independent_review.py':'182a7856f839ddeb210eccf6e7e22f776b1872a4ecc20668a224f15c921537cc',
 CB+'_result.json':'ee58b15c69736ad82509b3fdfec090ccaaa4a5686d0b3120e697592a060caa20',
}
def now():return datetime.now(timezone.utc).isoformat()
def digest(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def pin(p):
 p=Path(p);return {'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)}
def cmd(args):return subprocess.check_output(args,cwd=P)
def sample(p):
 s=Path(p).lstat()
 return {'bytes':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,
  'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'ctime_ns':s.st_ctime_ns,
  'birthtime':s.st_birthtime,'inode':s.st_ino,'device':s.st_dev,'nlink':s.st_nlink,
  'flags':s.st_flags,'regular':stat.S_ISREG(s.st_mode)}
STABLE=('bytes','mode','uid','gid','mtime_ns')
IDENTITY=STABLE+('ctime_ns','birthtime','inode','device','nlink','flags','regular')
started=now();assert not OUT.exists()
assert cmd(['git','rev-parse','HEAD']).decode().strip()==HEAD
for p,h in EXPECTED.items():assert digest(p)==h
inv=json.loads(Path(IB+'.json').read_text())
review=json.loads(Path(IB+'_independent_review.json').read_text())
result=json.loads(Path(CB+'_result.json').read_text())
assert review['verdict']=='concur' and review['operation_executed_by_reviewer'] is False
assert inv['repository_head']==review['repository_head']==HEAD
assert result['status']=='complete' and result['processed']==len(result['records'])==22
assert result['inventory_sha256']==EXPECTED[IB+'.json']
assert result['review_sha256']==EXPECTED[IB+'_independent_review.json']
assert inv['candidate_count']==len(inv['pairs'])==22
assert inv['candidate_bytes']==sum(x['bytes'] for x in inv['pairs'])==46498576
assert datetime.fromisoformat(review['finished_utc'])<=datetime.fromisoformat(result['started_utc'])
assert datetime.fromisoformat(result['started_utc'])<=datetime.fromisoformat(result['finished_utc'])
assert datetime.fromisoformat(result['finished_utc'])<=datetime.fromisoformat(started)
old_targets={x['path']:x for x in review['targets']}
old_sources={x['path']:x for x in review['canonical_sources']}
operations={x['target']:x for x in result['records']}
assert len(operations)==22 and set(operations)==set(old_targets)=={x['target'] for x in inv['pairs']}
assert len(old_sources)==11 and set(old_sources)=={x['source'] for x in inv['pairs']}
committed=[]
for q in review['committed_input_pins']:
 path=Path(q['path']);blob=cmd(['git','rev-parse',HEAD+':'+str(path.relative_to(P))]).decode().strip()
 data=cmd(['git','cat-file','blob',blob])
 assert blob==q['git_blob'] and len(data)==q['bytes']
 assert hashlib.sha256(data).hexdigest()==digest(path)==q['sha256']
 committed.append(q)
device=Path('/private/tmp').stat().st_dev
def inspect(p,h):
 p=Path(p);assert p.resolve()==p
 a=sample(p)
 assert a['regular'] and a['device']==device and a['nlink']==1 and a['flags']==0
 acl=cmd(['/bin/ls','-lde',str(p)]).decode();attrs=cmd(['/usr/bin/xattr',str(p)]).decode()
 assert len(acl.splitlines())==1 and not attrs.strip()
 assert digest(p)==h
 b=sample(p);assert all(a[k]==b[k] for k in IDENTITY)
 return {'path':str(p),'sha256':h,'before_hash':a,'after_hash':b,
         'acl_listing':acl,'extended_attributes':attrs,'stable_during_sample':True}
sources=[];targets=[]
for p,old in sorted(old_sources.items()):
 assert Path(p).parent==P/'evidence/markov-20825094'
 r=inspect(p,old['sha256']);a=r['before_hash']
 assert all(a[k]==old['after'][k] for k in IDENTITY)
 r.update(preflight_after=old['after'],canonical_identity_unchanged=True,
  atime_equal_to_preflight=a['atime_ns']==old['after']['atime_ns'])
 sources.append(r)
source_inodes={x['path']:x['after_hash']['inode'] for x in sources}
for row in inv['pairs']:
 p=row['target'];op=operations[p];old=old_targets[p]
 assert op['source']==row['source'] and op['sha256']==row['sha256'] and op['bytes']==row['bytes']
 assert op['old_inode']==row['inode_before']==old['after']['inode']
 assert op['new_inode']!=op['old_inode']
 assert all(op['metadata_preserved'][k]==row[k] for k in STABLE if k!='bytes')
 r=inspect(p,row['sha256']);a=r['before_hash']
 assert all(a[k]==row[k] for k in STABLE)
 assert a['inode']==op['new_inode'] and a['inode']!=source_inodes[row['source']]
 r.update(source=row['source'],kind=row['kind'],preflight_after=old['after'],operation=op,
  old_to_new_inode_confirmed=True,
  atime_equal_to_operation_record=a['atime_ns']==op['metadata_preserved']['atime_ns'],
  operation_atime_equal_to_preflight=op['metadata_preserved']['atime_ns']==old['after']['atime_ns'],
  inode_changed=a['inode']!=old['after']['inode'],
  ctime_changed=a['ctime_ns']!=old['after']['ctime_ns'],
  birthtime_changed=a['birthtime']!=old['after']['birthtime'])
 targets.append(r)
assert len({x['after_hash']['inode'] for x in sources+targets})==33
for p,h in EXPECTED.items():assert digest(p)==h
assert cmd(['git','rev-parse','HEAD']).decode().strip()==HEAD
records=[pin(p) for p in EXPECTED]+[pin(Path(__file__))]
preservation_paths=[x['path'] for x in records]+[str(OUT)]
out={'task':'Independent postcheck of storage1048','verdict':'concur',
 'started_utc':started,'finished_utc':now(),'repository_head':HEAD,
 'scope':'Exactly22 closed187 compiled archive/controller copies and11 canonical sources only; no188-or-later research reads or project programs.',
 'record_pins':records,'preservation_paths':preservation_paths,
 'committed_input_pins':committed,'operation_started_utc':result['started_utc'],
 'operation_finished_utc':result['finished_utc'],
 'target_count':22,'canonical_count':11,'logical_duplicate_bytes':46498576,
 'targets':targets,'canonical_sources':sources,
 'checks':{'digest_chain_unchanged':True,'repository_head_unchanged':True,
  'exact_inventory_result_target_sets':True,'all_target_bytes_and_stable_metadata_match':True,
  'all_result_new_inodes_match_current':True,'all_canonical_bytes_metadata_inode_ctime_birth_match_preflight':True,
  'all_regular_single_link_distinct_inodes_same_device':True,'empty_acl_xattrs_flags':True},
 'atime_observations':{
  'target_samples_equal_operation_atime':sum(x['atime_equal_to_operation_record'] for x in targets),
  'operation_atimes_equal_preflight_samples':sum(x['operation_atime_equal_to_preflight'] for x in targets),
  'canonical_samples_equal_preflight_atime':sum(x['atime_equal_to_preflight'] for x in sources),
  'qualification':'Operation records retain immediately preceding target atime. Postcheck reads may affect atime; a mismatch would not identify a writer or demonstrate lost historical atime. No continuous atime monitoring occurred.'},
 'free_space_observed_by_operation':{'before_bytes':result['free_before'],'after_bytes':result['free_after'],
  'qualification':'Two operation-window samples only; concurrent allocations and release are not attributed solely to this operation.'},
 'limitations':[
  'Read-only bounded samples verify identities at the sampled boundaries, not continuous stability.',
  'Target inode/ctime/birth changes are permitted; canonical inode/ctime/birth matched the preflight samples.',
  'No compiled-object interpretation, replay, compilation, project or mathematical execution, replacement, or metadata mutation was performed by this postcheck.',
  'Earlier research audit windows, source statuses and validation conclusions remain unchanged.'],
 'postcheck_performed_mutations':False}
OUT.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'verdict':'concur','postcheck':pin(OUT),'helper':pin(Path(__file__)),
                 'atime_observations':out['atime_observations'],
                 'preservation_record_pins':records+[pin(OUT)]},indent=2))
