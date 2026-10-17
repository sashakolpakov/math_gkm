"""Independent read-only postcheck of exact closed 185 storage targets and canonical files."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib, json, shutil, stat, subprocess

R=Path('/Users/sasha/math_gkm'); P=Path('/private/tmp')
I=P/'math_gkm_storage_inventory_20261017_0952.json'
C=P/'math_gkm_storage_clone_20261017_0952.py'
V=P/'math_gkm_storage_inventory_20261017_0952_independent_review.json'
S=P/'math_gkm_storage_clone_20261017_0952_result.json'
O=P/'math_gkm_storage_clone_20261017_0952_independent_postcheck.json'
HEAD='e75aaed597091d8a0c8a8cc7f9a72b5c5b998975'
def utc(): return datetime.now(timezone.utc).isoformat()
def sha(p):
    h=hashlib.sha256()
    with p.open('rb') as f:
        for b in iter(lambda:f.read(1024*1024),b''):h.update(b)
    return h.hexdigest()
def pin(p):return {'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}
def cmd(a):return subprocess.check_output(a,cwd=R)
def meta(s):
    return {'size':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,
            'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'ctime_ns':s.st_ctime_ns,
            'birthtime':s.st_birthtime,'inode':s.st_ino,'device':s.st_dev,
            'nlink':s.st_nlink,'flags':s.st_flags}
def nonatime(m):return {k:v for k,v in m.items() if k!='atime_ns'}
started=utc();assert not O.exists()
expected={I:'56ff43f01330ea76d20b6445ed0954895bc9f4f0a208688853f79435429dc606',
 C:'e6eaf30376018a67f3a5eab5a06c5a19d8a9ee4142b2c71fa6183588f37006d3',
 V:'0b00fcc2498bc83dc4cef72c384a3c6d40d7b0c86a31cf7de476aecbeb09a883',
 S:'b5a7f17b3f9be998c36727fb30c18be5d1333c74e66fbee0d1c9005f3f353323'}
assert all(sha(p)==h for p,h in expected.items())
d=json.loads(I.read_text());v=json.loads(V.read_text());s=json.loads(S.read_text())
assert v['concurrence'] is True and v['mismatches']==[]
assert s['status']=='complete' and s['processed']==22 and len(s['records'])==22
assert s['inventory_sha256']==expected[I] and s['review_sha256']==expected[V]
assert v['inventory']['sha256']==expected[I] and v['operation_helper']['sha256']==expected[C]
assert cmd(['git','rev-parse','HEAD']).decode().strip()==HEAD==v['repository_head']==d['repository_head']
assert len(d['pairs'])==22 and sum(e['bytes'] for e in d['pairs'])==86494176
assert len({e['source'] for e in d['pairs']})==11
bytarget={e['target']:e for e in s['records']}
assert len(bytarget)==22 and set(bytarget)=={e['target'] for e in d['pairs']}
pretarget={e['path']:e for e in v['targets']}
presource={e['path']:e for e in v['canonical_sources']}
dev=P.stat().st_dev
def observe(p, expected_hash):
    assert p.resolve()==p
    b=p.lstat();assert stat.S_ISREG(b.st_mode)
    assert b.st_dev==dev and b.st_nlink==1 and b.st_flags==0
    assert not cmd(['/usr/bin/xattr',str(p)]).strip()
    assert len(cmd(['/bin/ls','-lde',str(p)]).splitlines())==1
    h=sha(p);a=p.lstat()
    assert h==expected_hash and nonatime(meta(b))==nonatime(meta(a))
    return {'path':str(p),'sha256':h,'before_read':meta(b),'after_read':meta(a),
            'ordinary_file_no_acl_xattrs':True}
sources={};targets=[]
for e in d['pairs']:
    source=Path(e['source']);target=Path(e['target']);rec=bytarget[str(target)]
    assert source.parent==R/'evidence/markov-dcb64029' and source.suffix in ('.olean','.ilean')
    if e['kind']=='archive':assert target==R/'.control/markov/workers/000185/artifacts'/source.relative_to(R)
    else:assert e['kind']=='object' and target==R/'.control/markov/objects'/e['sha256']
    assert all(rec[k]==e[k] for k in ('source','target','sha256','bytes'))
    assert rec['old_inode']==e['inode_before']==pretarget[str(target)]['before']['inode']
    assert all(rec['metadata_preserved'][k]==e[k] for k in ('mode','uid','gid','mtime_ns'))
    if str(source) not in sources:
        z=observe(source,e['sha256']);old=presource[str(source)]['before']
        assert nonatime(z['before_read'])==nonatime(old)
        z['source_bytes_and_non_atime_identity_unchanged']=True
        z['preflight_atime_ns']=old['atime_ns']
        sources[str(source)]=z
    x=observe(target,e['sha256']);m=x['before_read'];a=sources[str(source)]['before_read']
    assert m['size']==a['size']==e['bytes']
    assert m['inode']==rec['new_inode'] and m['inode']!=rec['old_inode'] and m['inode']!=a['inode']
    assert all(m[k]==e[k] for k in ('mode','uid','gid','mtime_ns'))
    x.update(source=str(source),kind=e['kind'],old_inode=rec['old_inode'],recorded_new_inode=rec['new_inode'],
        operation_preserved_atime_ns=rec['metadata_preserved']['atime_ns'],
        atime_matches_operation_before_postcheck_read=m['atime_ns']==rec['metadata_preserved']['atime_ns'],
        atime_matches_inventory=m['atime_ns']==e['atime_ns'],
        byte_and_stable_metadata_match=True)
    targets.append(x)
assert len({x['before_read']['inode'] for x in targets})==22
assert len({x['before_read']['inode'] for x in sources.values()})==11
assert not({x['before_read']['inode'] for x in targets}&{x['before_read']['inode'] for x in sources.values()})
for cp in d['committed_input_pins']:
    p=Path(cp['path']);blob=cmd(['git','rev-parse',HEAD+':'+str(p.relative_to(R))]).decode().strip()
    assert blob==cp['git_blob'] and sha(p)==cp['sha256']
    data=cmd(['git','cat-file','blob',blob]);assert hashlib.sha256(data).hexdigest()==cp['sha256']
assert cmd(['git','rev-parse','HEAD']).decode().strip()==HEAD
assert all(sha(p)==h for p,h in expected.items())
paths=[P/'math_gkm_storage_inventory_20261017_0952.py',I,C,
       P/'math_gkm_storage_inventory_20261017_0952_independent_review.py',V,S,Path(__file__),O]
assert len(set(paths))==8
for k in ('inventory_helper','independent_review_helper'):
    old=v[k];assert pin(Path(old['path']))==old
out={'scope':'Independent read-only postcheck of 22 closed 185 replacements and 11 exact canonical files only; no worker 183 partial/186+ reads, object interpretation or research execution.',
 'started_utc':started,'finished_utc':utc(),'all_checks_passed':True,'mismatches':[],
 'repository_head':HEAD,'input_pins':[pin(p) for p in paths[:-1]],
 'operation_started_utc':s['started_utc'],'operation_finished_utc':s['finished_utc'],
 'operation_processed':22,'logical_duplicate_bytes':86494176,'canonical_count':11,
 'target_classes':{'archive':11,'object':11},'targets':targets,'canonical_sources':list(sources.values()),
 'all_targets_have_recorded_changed_inodes':True,'canonical_non_atime_metadata_including_inode_ctime_birth_unchanged':True,
 'target_and_canonical_inode_sets_distinct':True,'same_volume_device':dev,
 'committed_receipt_seal_and_head_unchanged':True,'inventory_review_script_result_digest_chain_matches':True,
 'atime_summary':{'match_operation_before_postcheck_reads':sum(x['atime_matches_operation_before_postcheck_read'] for x in targets),
  'differ_operation_before_postcheck_reads':[x['path'] for x in targets if not x['atime_matches_operation_before_postcheck_read']],
  'meaning':'Result records preservation of each immediately preceding operation atime, not historical inventory atime. Later reads may change access times; this postcheck never restores them. A differing later atime alone cannot identify its cause.'},
 'observed_free_bytes':{'operation_before':s['free_before'],'operation_after':s['free_after'],'postcheck_finish':shutil.disk_usage(R).free},
 'space_attribution':'Observed free-space change is concurrent filesystem accounting, not independently isolated physical savings; logical duplicate bytes are a separate measure.',
 'no_source_target_mutations_by_postcheck':True,'mathematical_audit_windows_and_validation_status_unchanged':True,'optional_CAS_history':v['optional_CAS_history'],
 'preservation_paths':[str(p) for p in paths]}
O.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(pin(O)))
