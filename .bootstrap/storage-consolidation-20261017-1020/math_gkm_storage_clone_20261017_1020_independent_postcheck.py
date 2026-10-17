"""Read-only postcheck of the exact authorized storage1020 targets and sources."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,stat,subprocess

P=Path('/Users/sasha/math_gkm')
HEAD='9ba8fdb35d20e77723946b913d6309906d1da0ec'
IB='/private/tmp/math_gkm_storage_inventory_20261017_1020'
CB='/private/tmp/math_gkm_storage_clone_20261017_1020'
OUT=Path(CB+'_independent_postcheck.json')
EXPECTED={
 IB+'.json':'c7b09d54333b6aef9e33f2f56530dcf648167e363b49a4a0e04364bb91ef509c',
 IB+'.py':'318f1e53e91b7594054c2eaf717ede067464abd7f9029fdc761657c4e08ee465',
 CB+'.py':'7b4b1150ef55323a9d205f4a2823e63c0374f99064a72f8e36164b318148b663',
 IB+'_independent_review.json':'5942c73ddb6424c141156c072e4bee6f9dd0d6abc59d68599419d3a0b246fdf1',
 IB+'_independent_review.py':'c250e6bf801011f8269c46388929960914e1ae86da078c87d712520104da1f34',
 CB+'_result.json':'fc4166a0e368ab886e0f5e9b0e170b127471af7f478bdfa0fe579085cc9eb14e',
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
assert result['status']=='complete' and result['processed']==len(result['records'])==28
assert result['inventory_sha256']==EXPECTED[IB+'.json']
assert result['review_sha256']==EXPECTED[IB+'_independent_review.json']
assert inv['candidate_count']==len(inv['pairs'])==28
assert inv['candidate_bytes']==sum(x['bytes'] for x in inv['pairs'])==221734528
assert datetime.fromisoformat(review['finished_utc'])<=datetime.fromisoformat(result['started_utc'])
assert datetime.fromisoformat(result['started_utc'])<=datetime.fromisoformat(result['finished_utc'])
assert datetime.fromisoformat(result['finished_utc'])<=datetime.fromisoformat(started)
old_targets={x['path']:x for x in review['targets']}
old_sources={x['path']:x for x in review['canonical_sources']}
operations={x['target']:x for x in result['records']}
assert len(operations)==28 and set(operations)==set(old_targets)=={x['target'] for x in inv['pairs']}
assert len(old_sources)==14 and set(old_sources)=={x['source'] for x in inv['pairs']}
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
 assert Path(p).parent==P/'evidence/markov-ca9709f2'
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
assert len({x['after_hash']['inode'] for x in sources+targets})==42
for p,h in EXPECTED.items():assert digest(p)==h
assert cmd(['git','rev-parse','HEAD']).decode().strip()==HEAD
records=[pin(p) for p in EXPECTED]+[pin(Path(__file__))]
preservation_paths=[x['path'] for x in records]+[str(OUT)]
out={'task':'Independent postcheck of storage1020','verdict':'concur',
 'started_utc':started,'finished_utc':now(),'repository_head':HEAD,
 'scope':'Exact28 closed186 compiled archive/controller copies and14 canonical sources only; no187/188 research reads or project programs.',
 'record_pins':records,'preservation_paths':preservation_paths,
 'committed_input_pins':committed,'operation_started_utc':result['started_utc'],
 'operation_finished_utc':result['finished_utc'],
 'target_count':28,'canonical_count':14,'logical_duplicate_bytes':221734528,
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
