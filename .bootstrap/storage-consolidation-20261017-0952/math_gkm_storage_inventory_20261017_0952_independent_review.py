"""Independent read-only storage preflight; never imports or executes operation/project code."""
from pathlib import Path
from datetime import datetime, timezone
import ast, hashlib, json, os, shutil, stat, subprocess
from collections import Counter

R = Path('/Users/sasha/math_gkm')
P = Path('/private/tmp')
I = P/'math_gkm_storage_inventory_20261017_0952.json'
C = P/'math_gkm_storage_clone_20261017_0952.py'
IH = P/'math_gkm_storage_inventory_20261017_0952.py'
O = P/'math_gkm_storage_inventory_20261017_0952_independent_review.json'
HEAD = 'e75aaed597091d8a0c8a8cc7f9a72b5c5b998975'
def utc(): return datetime.now(timezone.utc).isoformat()
def sha(p):
    h = hashlib.sha256()
    with p.open('rb') as f:
        for b in iter(lambda:f.read(1024*1024), b''): h.update(b)
    return h.hexdigest()
def pin(p): return {'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}
def cmd(args): return subprocess.check_output(args, cwd=R)
def meta(s):
    return {'size':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,
            'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'ctime_ns':s.st_ctime_ns,
            'birthtime':s.st_birthtime,'inode':s.st_ino,'device':s.st_dev,
            'nlink':s.st_nlink,'flags':s.st_flags}
def stable(s): return {k:v for k,v in meta(s).items() if k!='atime_ns'}
started = utc()
assert not O.exists()
assert sha(I) == '56ff43f01330ea76d20b6445ed0954895bc9f4f0a208688853f79435429dc606'
assert sha(C) == 'e6eaf30376018a67f3a5eab5a06c5a19d8a9ee4142b2c71fa6183588f37006d3'
d = json.loads(I.read_text())
assert sha(IH) == d['inventory_helper']['sha256'] == 'a4de22958cc229e9f8768c89c1f05e6f3b78d572dffeeab5834c9423e9ad6a3b'
ast.parse(C.read_text()); ast.parse(IH.read_text())
assert cmd(['git','rev-parse','HEAD']).decode().strip() == HEAD == d['repository_head']
assert len(d['pairs']) == d['candidate_count'] == 22 and d['mismatch'] == []
assert sum(x['bytes'] for x in d['pairs']) == d['candidate_bytes'] == 86494176
assert Counter(x['kind'] for x in d['pairs']) == {'archive':11,'object':11}

prior_pins=[]; excluded=set()
def norm(v): return str(R/v) if v.startswith(('.control/','.bootstrap/','evidence/')) else v
def walk(v, context=''):
    if isinstance(v,dict):
        for k,x in v.items():
            if k in ('target','archive','object') and isinstance(x,str) and '/' in x: excluded.add(norm(x))
            if k=='path' and context=='targets' and isinstance(x,str): excluded.add(norm(x))
            walk(x,k if k=='targets' else context)
    elif isinstance(v,list):
        for x in v: walk(x,context)
assert len(d['exclusion_plans']) == 56
for name in d['exclusion_plans']:
    p=Path(name); assert p.is_relative_to(R/'.bootstrap')
    prior_pins.append(pin(p)); walk(json.loads(p.read_text()))
assert len(excluded) == d['excluded_target_count'] == 6273

for cp in d['committed_input_pins']:
    p=Path(cp['path']); rel=str(p.relative_to(R))
    blob=cmd(['git','rev-parse',HEAD+':'+rel]).decode().strip()
    data=cmd(['git','cat-file','blob',blob])
    assert blob==cp['git_blob'] and hashlib.sha256(data).hexdigest()==sha(p)==cp['sha256']
    assert len(data)==cp['bytes']
receipt_path=R/'.control/markov/workers/000185/receipt.json'
receipt=json.loads(receipt_path.read_text())
assert receipt['outcome']=='completed' and receipt['returncode']==0
assert receipt['request_id']=='dcb6402998ac4eed9feb37199e0f0cee'
assert sha(receipt_path)=='330d9363efd22ff503710adf8919ebf0e834026139fe4223ee87a8b54a3741f4'
seal_path=R/'.bootstrap/independent-controller-audit/markov_worker_000185_audit_integrity.json'
assert sha(seal_path)=='8b3615d2cf20a50683f7d5ee60e571e45005ee73024bc832fe4e0cab22f47e09'
seal=json.loads(seal_path.read_text())
assert seal['worker']==185 and seal['request']==receipt['request_id']

sources={}; targets=[]; source_paths={x['source'] for x in d['pairs']}
target_paths={x['target'] for x in d['pairs']}
assert len(source_paths)==11 and len(target_paths)==22
assert not(source_paths & target_paths) and not(target_paths & excluded)
dev=P.stat().st_dev
def observed(p, expected):
    assert p.resolve()==p
    before=p.lstat(); assert stat.S_ISREG(before.st_mode)
    assert before.st_dev==dev and before.st_nlink==1 and before.st_flags==0
    assert not cmd(['/usr/bin/xattr',str(p)]).strip()
    acl=cmd(['/bin/ls','-lde',str(p)]).decode()
    assert len(acl.splitlines())==1
    digest=sha(p); after=p.lstat()
    assert digest==expected and stable(before)==stable(after)
    return {'path':str(p),'sha256':digest,'before':meta(before),'after_read':meta(after),
            'no_acl_or_xattrs':True,'ordinary_file':True}
for x in d['pairs']:
    source=Path(x['source']); target=Path(x['target'])
    assert source.parent==R/'evidence/markov-dcb64029' and source.suffix in ('.olean','.ilean')
    assert receipt['changes'][str(source.relative_to(R))]['after']==x['sha256']
    if x['kind']=='archive':
        assert target==R/'.control/markov/workers/000185/artifacts'/source.relative_to(R)
    else:
        assert x['kind']=='object' and target==R/'.control/markov/objects'/x['sha256']
    if str(source) not in sources: sources[str(source)]=observed(source,x['sha256'])
    a=sources[str(source)]['before']; b=observed(target,x['sha256'])
    bm=b['before']; assert a['size']==bm['size']==x['bytes']
    assert bm['inode']==x['inode_before'] and bm['inode']!=a['inode']
    assert all(bm[k]==x[k] for k in ('mode','uid','gid','mtime_ns'))
    b.update(source=str(source),kind=x['kind'],inventory_atime_ns=x['atime_ns'],
             atime_equals_inventory_at_observation=bm['atime_ns']==x['atime_ns'])
    targets.append(b)
assert len({x['before']['inode'] for x in targets})==22
assert len({x['before']['inode'] for x in sources.values()})==11
assert not({x['before']['inode'] for x in targets}&{x['before']['inode'] for x in sources.values()})
assert cmd(['git','rev-parse','HEAD']).decode().strip()==HEAD
mounts=cmd(['/sbin/mount']).decode().splitlines()
mount_row=next(x for x in mounts if ' on /System/Volumes/Data ' in x)
assert '(apfs,' in mount_row
assert not (P/'math_gkm_storage_clone_20261017_0952_result.json').exists()

out={'scope':'Separate storage-only preflight of exact closed 185 retained compiled copies; no worker 183 partial or worker 186+ records paths, research interpretation, operation execution or mathematical-window extension.',
 'started_utc':started,'finished_utc':utc(),'concurrence':True,
 'verdict':'No necessary correction; the exact pinned operation may proceed under its retained preconditions and root exclusive orchestration.',
 'inventory':pin(I),'inventory_helper':pin(IH),'operation_helper':pin(C),
 'independent_review_helper':pin(Path(__file__)),'repository_head':HEAD,
 'candidate_count':22,'candidate_bytes':86494176,'target_classes':{'archive':11,'object':11},
 'canonical_source_count':11,'same_volume_device':dev,'filesystem_mount':mount_row,
 'prior_record_count':56,'excluded_prior_target_count':6273,'prior_target_overlap':[],
 'prior_record_pins':prior_pins,'committed_input_pins':d['committed_input_pins'],
 'receipt_and_seal_bindings':d['receipts'],'targets':targets,'canonical_sources':list(sources.values()),
 'mismatches':[],
 'audit_helper_refinement':'Adapted reviewed 0920 independent helper to exact 0952 paths, pins, counts and worker 185. Uses read-only xattr queries from the start; operation/inventory programs are parsed, never executed.',
 'operation_static_review':{
   'full_source_read_and_AST_parsed_not_executed':True,
   'inventory_digest_hardcoded':True,'review_digest_supplied_as_single_argument':True,
   'script_digest_bound_in_review_root_must_execute_exact_bytes':True,
   'closed185_exact_paths_and_hash_named_object_targets':True,
   'canonical_sources_are_read_only_and_never_replaced':True,
   'per_target_same_volume_cp_c_then_atomic_os_replace':True,
   'checks_bytes_mode_uid_gid_mtime_inode_regular_single_link_flags_acl_xattrs':True,
   'rechecks_target_inode_stable_metadata_and_both_hashes_before_replace':True,
   'post_replace_digest_and_selected_metadata_checked':True,
   'atime':'Captured per target before operation hash reads, restored after final hash; inventory atime is not immutable evidence. Independent reads can subsequently change it.',
   'staging_cleanup':'Unique temporary clone removed in finally if still present. Each successful replacement is journaled.',
   'failure_and_locking':'No global lock or transaction rollback. Root executes once serially against closed immutable paths; pre-replace assertions abort on detected drift. Completed replacements retain identical bytes and stable metadata; result may be partial on failure.',
   'allowed_identity_changes':['inode','ctime','birth time']},
 'optional_CAS_history':'The eleven optional controller objects were absent in initial worker-185 inspection, present and hash-matching at its final bounded observation. This separate storage observation preserves that history and adds no validation credit.',
 'limits':['Logical duplicate bytes do not measure exclusive physical allocation or guarantee free-space gain.',
           'No object decoding, proof execution, freshness upgrade or historical audit-window change.',
           'No source/target writes were made by this preflight; read access times may change.'],
 'free_bytes_at_preflight_finish':shutil.disk_usage(R).free,
 'preservation_paths':[str(I),str(IH),str(C),str(Path(__file__)),str(O)]}
O.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(pin(O)))
