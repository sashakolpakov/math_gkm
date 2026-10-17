"""Independent read-only storage preflight; no project code is imported or executed."""
from pathlib import Path
from datetime import datetime, timezone
import ast, hashlib, json, os, stat, subprocess

P = Path('/Users/sasha/math_gkm')
T = Path('/private/tmp/math_gkm_godel_20261013')
BASE = '/private/tmp/math_gkm_storage_inventory_20261017_1048'
INV = Path(BASE + '.json')
IH = Path(BASE + '.py')
CLONE = Path('/private/tmp/math_gkm_storage_clone_20261017_1048.py')
RESULT = Path('/private/tmp/math_gkm_storage_clone_20261017_1048_result.json')
OUT = Path(BASE + '_independent_review.json')
HEAD = '0e1f1d8e44cfddd7d0a253e69112575d9df95585'
EXPECTED = {
 str(INV): '130c069893f0741af85f4073ca9327d690890582967bb22a1483bd9caca2951a',
 str(IH): '6e8227471358f1e50301237b5192241b6595b326b21a89033230745041f105a2',
 str(CLONE): '45b79afb54de1e4364bd64934ac1ac9a1907f2a9d6bb3ede1d99f1296a1e3fdb',
}
def now(): return datetime.now(timezone.utc).isoformat()
def digest(p):
 h = hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576), b''): h.update(b)
 return h.hexdigest()
def cmd(args): return subprocess.check_output(args, cwd=P)
def git(*args): return cmd(['git', *args])
def pin(p):
 p = Path(p)
 return {'path':str(p), 'sha256':digest(p), 'bytes':p.stat().st_size}
def committed(p):
 p = Path(p)
 blob = git('rev-parse', HEAD + ':' + str(p.relative_to(P))).decode().strip()
 raw = git('cat-file', 'blob', blob)
 h = hashlib.sha256(raw).hexdigest()
 assert digest(p) == h
 return dict(pin(p), git_blob=blob)
def sample(p):
 s = Path(p).lstat()
 return {'bytes':s.st_size, 'mode':stat.S_IMODE(s.st_mode), 'uid':s.st_uid,
         'gid':s.st_gid, 'mtime_ns':s.st_mtime_ns, 'atime_ns':s.st_atime_ns,
         'ctime_ns':s.st_ctime_ns, 'birthtime':s.st_birthtime, 'inode':s.st_ino,
         'device':s.st_dev, 'nlink':s.st_nlink, 'flags':s.st_flags,
         'regular':stat.S_ISREG(s.st_mode)}
STABLE = ('bytes','mode','uid','gid','mtime_ns')
IDENTITY = STABLE + ('ctime_ns','birthtime','inode','device','nlink','flags','regular')
started = now()
assert not OUT.exists() and not RESULT.exists()
assert git('rev-parse','HEAD').decode().strip() == HEAD
for p,h in EXPECTED.items(): assert digest(p) == h
for p in (IH,CLONE): ast.parse(p.read_text())
inv = json.loads(INV.read_text())
assert inv['repository_head'] == HEAD and inv['mismatch'] == []
assert inv['candidate_count'] == len(inv['pairs']) == 22
assert inv['candidate_bytes'] == sum(x['bytes'] for x in inv['pairs']) == 46498576
assert len(inv['exclusion_plans']) == len(set(inv['exclusion_plans'])) == 64
assert inv['excluded_target_count'] == 6323
input_commits = [committed(x['path']) for x in inv['committed_input_pins']]
assert input_commits == inv['committed_input_pins']
sealpath = P/'.bootstrap/independent-controller-audit/markov_worker_000187_audit_integrity.json'
seal = json.loads(sealpath.read_text())
assert digest(T/sealpath.name) == digest(sealpath)
assert seal['worker'] == 187 and seal['request'] == '2082509481ba44c7bfe6fb10865a70b1'
receiptpath = P/'.control/markov/workers/000187/receipt.json'
receipt = json.loads(receiptpath.read_text())
assert receipt['request_id'] == seal['request']
assert receipt['outcome'] == 'completed' and receipt['returncode'] == 0
vp = next(x for x in seal['files'] if x['path'].endswith('_validation_evidence.json'))
assert pin(vp['path']) == vp
v = json.loads(Path(vp['path']).read_text())
assert len(v['objects']) == 11
by_target = {}
by_source = {}
for o in v['objects']:
 src = o['current']; by_source[src['path']] = src
 for key,kind in [('archive','archive'),('content_addressed_object','object')]:
  q = o[key]
  by_target[q['path']] = {'source':src['path'], 'kind':kind, **q}
assert len(by_target) == 22 and len(by_source) == 11
assert set(by_target) == {x['target'] for x in inv['pairs']}
assert {x['source'] for x in inv['pairs']} == set(by_source)
receipt_compiled = {str(P/k):q['after'] for k,q in receipt['changes'].items()
                    if Path(k).suffix in ('.olean','.ilean')}
assert receipt_compiled == {p:q['sha256'] for p,q in by_source.items()}
excluded = set()
def collect(obj, target_context=False):
 if isinstance(obj, dict):
  for key,value in obj.items():
   if isinstance(value,str) and ((key in ('target','archive','object') and '/' in value)
                               or (key == 'path' and target_context)):
    excluded.add(str(P/value) if value.startswith(('.control/','.bootstrap/','evidence/')) else value)
   collect(value, target_context or key == 'targets')
 elif isinstance(obj,list):
  for value in obj: collect(value,target_context)
prior_pins=[]
for p in inv['exclusion_plans']:
 q=Path(p)
 assert q.is_relative_to(P/'.bootstrap') and q.suffix=='.json'
 prior_pins.append(committed(q))
 collect(json.loads(q.read_text()))
assert len(excluded) == 6323
assert set(by_target).isdisjoint(excluded)
apfs_output = cmd(['/bin/df','-T','apfs','/private/tmp']).decode()
assert len(apfs_output.strip().splitlines()) == 2 and '/System/Volumes/Data' in apfs_output
device = Path('/private/tmp').stat().st_dev
canonical_records=[]
target_records=[]
def inspect(p, expected):
 p=Path(p)
 assert p.resolve() == p
 a=sample(p)
 assert a['regular'] and a['device']==device and a['nlink']==1 and a['flags']==0
 assert all(a[k]==expected[k] for k in STABLE)
 acl=cmd(['/bin/ls','-lde',str(p)]).decode()
 attrs=cmd(['/usr/bin/xattr',str(p)]).decode()
 assert len(acl.splitlines())==1 and not attrs.strip()
 h=digest(p);b=sample(p)
 assert h==expected['sha256'] and all(a[k]==b[k] for k in IDENTITY)
 return {'path':str(p),'sha256':h,'before':a,'after':b,'acl_listing':acl,
         'extended_attributes':attrs,'stable_metadata_and_identity':True}
for p,q in sorted(by_source.items()):
 assert Path(p).parent == P/'evidence/markov-20825094'
 canonical_records.append(inspect(p,q))
canonical_inodes={q['path']:q['after']['inode'] for q in canonical_records}
for row in inv['pairs']:
 expected=by_target[row['target']]
 assert row['source']==expected['source'] and row['kind']==expected['kind']
 assert row['sha256']==expected['sha256']
 assert all(row[k]==expected[k] for k in STABLE)
 p=Path(row['target'])
 if row['kind']=='archive':
  assert p == P/'.control/markov/workers/000187/artifacts'/Path(row['source']).relative_to(P)
 else:
  assert p.parent==P/'.control/markov/objects' and p.name==row['sha256']
 rec=inspect(p,row)
 assert rec['before']['inode']==row['inode_before']
 assert rec['before']['inode']!=canonical_inodes[row['source']]
 rec.update(source=row['source'],kind=row['kind'],inventory_atime_ns=row['atime_ns'],
            inventory_atime_equal_at_sample=rec['before']['atime_ns']==row['atime_ns'])
 target_records.append(rec)
assert len({x['before']['inode'] for x in target_records+canonical_records})==33
for p,h in EXPECTED.items(): assert digest(p)==h
assert git('rev-parse','HEAD').decode().strip()==HEAD and not RESULT.exists()
finished=now()
out={'task':'Independent storage-only preflight1048','verdict':'concur',
 'started_utc':started,'finished_utc':finished,'repository_head':HEAD,
 'scope':'Exactly22 closed187 archive/controller compiled copies;11 canonical current evidence sources read-only. No188 or later research paths, no project code or compiled-object interpretation/execution.',
 'inputs':[pin(INV),pin(IH),pin(CLONE)],'review_helper':pin(Path(__file__)),
 'committed_input_pins':input_commits,'sealed_validation_evidence':vp,
 'prior_plan_pins':prior_pins,'excluded_target_count':len(excluded),
 'candidate_count':22,'candidate_bytes':46498576,'canonical_count':11,
 'filesystem':{'apfs_df_output':apfs_output,'same_device':device,
  'filesystem_qualification':'Read-only df -T apfs confirms the mounted APFS volume for all same-device paths; no allocation or exclusive-block saving claim is made.'},
 'canonical_sources':canonical_records,'targets':target_records,
 'checks':{'exact_expected_script_and_inventory_hashes':True,'head_frozen':True,
  'receipt_and_seal_committed_identities':True,'sealed_object_and_receipt_bindings':True,
  'prior_target_exclusion':True,'all_bytes_and_stable_metadata_match':True,
  'all_regular_single_link_distinct_inodes_same_apfs_volume':True,
  'no_flags_acls_or_xattrs':True,'result_absent_operation_not_executed':True},
 'script_review':{
  'read_without_execution':True,'inventory_and_review_digest_gates':True,
  'exact_closed187_source_and_target_constraints':True,
  'source_and_target_digest_rechecked_before_replace':True,
  'target_inode_and_stable_metadata_checked_before_replace':True,
  'unique_temporary_apfs_cp_c_then_atomic_replace':True,
  'target_mode_uid_gid_mtime_and_per_operation_atime_restored':True,
  'per_target_results_recorded':True,'canonical_sources_never_replaced':True,
  'review_gate_limit':'The clone helper verifies the supplied review digest; it does not parse this verdict or independently check HEAD. Root must execute only these reviewed bytes with this affirmative review digest and unchanged inventory/HEAD.'},
 'limitations':[
  'These are bounded read-only samples, not continuous stability observations; no earlier mathematical audit window is reopened or upgraded.',
  'Hash and metadata reads may affect access times. Inventory access time is not a required historical invariant. The proposed operation restores each target immediately preceding per-operation atime; concurrent accesses during a replacement may not be distinguishable.',
  'Replacement target inode, ctime and birth time may change. Canonical source inode/ctime/birth are sampled here for later comparison; canonical atime may change through reading.',
  'The script uses check-then-replace operations without a filesystem lock; root must retain the authorized quiescent closed-file boundary. No claim of immunity to concurrent external mutation is made.',
  'No clone/replacement, project program, compiler, proof, checker, replay, experiment, mathematical-value computation, or active-worker research read was performed.'],
 'pre_execution_helper_refinements':['The adapted independent helper\'s distinct-inode total was corrected from the prior operation\'s 42 to the present 22 targets plus 11 canonical sources (33) during static review, before its first execution.'],
 'second_static_reviewer':{'agent':'method138','scope':'Read only the three named proposed inventory/clone files; no project reads or operation execution.','verdict':'concur','limits':'No global filesystem lock or multi-file rollback. Independent named-file and committed binding checks are performed by this helper.'},
 'operation_executed_by_reviewer':False}
OUT.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'review':pin(OUT),'helper':pin(Path(__file__)),'verdict':out['verdict']},indent=2))
