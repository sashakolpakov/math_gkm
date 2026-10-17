"""Independent read-only storage preflight; never imports or runs storage/research code."""
from pathlib import Path
from datetime import datetime, timezone
from collections import Counter
import ast, hashlib, json, os, stat, subprocess, plistlib

R=Path('/Users/sasha/math_gkm')
T=Path('/private/tmp/math_gkm_godel_20261013')
B=R/'.bootstrap/independent-controller-audit'
I=Path('/private/tmp/math_gkm_storage_inventory_20261017_0810.json')
IH=I.with_suffix('.py')
C=Path('/private/tmp/math_gkm_storage_clone_20261017_0810.py')
O=Path('/private/tmp/math_gkm_storage_inventory_20261017_0810_independent_review.json')
HEAD='fcfec2452bba30043e060fc3d40c7ef630743d53'
EXPECTED_I='f15ac88fe82fce308acb5b0b6a34d9b3546e7271e86f7448cf6ae2e7a3bfd9c4'
EXPECTED_C='27c0905b2636d9be20acf0d42d41c3bc95e9e71d314e80de417734721db15554'
started=datetime.now(timezone.utc).isoformat()
assert not O.exists()
def digest(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for block in iter(lambda:f.read(1048576),b''):h.update(block)
 return h.hexdigest()
def pin(p):
 p=Path(p);return {'path':str(p),'bytes':p.stat().st_size,'sha256':digest(p)}
def command(args):return subprocess.check_output(args,cwd=R)
def metadata(p):
 s=Path(p).lstat()
 return {'mode':stat.S_IMODE(s.st_mode),'file_type':stat.S_IFMT(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,
 'bytes':s.st_size,'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'ctime_ns':s.st_ctime_ns,
 'birthtime':s.st_birthtime,'inode':s.st_ino,'device':s.st_dev,'nlink':s.st_nlink,'flags':s.st_flags}
def stable(x):return {k:v for k,v in x.items() if k!='atime_ns'}
assert digest(I)==EXPECTED_I and digest(C)==EXPECTED_C
ast.parse(IH.read_text());ast.parse(C.read_text())
d=json.loads(I.read_text())
assert d['repository_head']==HEAD==command(['git','rev-parse','HEAD']).decode().strip()
assert d['inventory_helper']=={'path':str(IH),'sha256':digest(IH)}
pairs=d['pairs'];assert len(pairs)==d['candidate_count']==45
assert sum(p['bytes'] for p in pairs)==d['candidate_bytes']==106444500
assert Counter(p['kind'] for p in pairs)=={'temporary_audit':7,'archive':19,'object':19}
targets={p['target'] for p in pairs};sources={p['source'] for p in pairs}
assert len(targets)==45 and len(sources)==26 and not targets.intersection(sources)
assert d['mismatch']==[]

# Read only the forty-eight named prior storage records, not paths mentioned by their payloads.
prior_pins=[];excluded=set()
def normalized(value):return str(R/value) if value.startswith(('.control/','.bootstrap/','evidence/')) else value
def prior_walk(value,in_targets=False):
 if isinstance(value,dict):
  for key,item in value.items():
   if isinstance(item,str) and '/' in item and (key in ('target','archive','object') or (key=='path' and in_targets)):
    excluded.add(normalized(item))
   prior_walk(item,in_targets or key=='targets')
 elif isinstance(value,list):
  for item in value:prior_walk(item,in_targets)
assert len(d['exclusion_plans'])==len(set(d['exclusion_plans']))==48
for name in d['exclusion_plans']:
 p=Path(name);assert p.is_relative_to(R/'.bootstrap') and p.suffix=='.json'
 prior_pins.append(pin(p));prior_walk(json.loads(p.read_text()))
assert len(excluded)==d['excluded_target_count']==6184 and not targets.intersection(excluded)

# Authenticate each named committed input, including both seals and receipts.
committed=[];committed_by_path={}
for entry in d['committed_input_pins']:
 p=Path(entry['path']);assert p.is_relative_to(R)
 blob=command(['git','rev-parse',HEAD+':'+str(p.relative_to(R))]).decode().strip()
 content=command(['git','cat-file','blob',blob]);sha=hashlib.sha256(content).hexdigest()
 assert blob==entry['git_blob'] and sha==entry['sha256']==digest(p) and len(content)==entry['bytes']==p.stat().st_size
 committed.append(entry);committed_by_path[str(p)]=entry
assert len(committed)==11 and len(committed_by_path)==10
seals={};receipts={};validation={};allowed={};sealed_pins={}
def collect_pins(value,result):
 if isinstance(value,dict):
  if isinstance(value.get('path'),str) and isinstance(value.get('sha256'),str):result.setdefault(value['path'],set()).add(value['sha256'])
  for item in value.values():collect_pins(item,result)
 elif isinstance(value,list):
  for item in value:collect_pins(item,result)
for record in d['receipts']:
 w=record['worker'];assert w in (181,182)
 seal_path=B/f'markov_worker_{w:06d}_audit_integrity.json'
 receipt_path=R/f'.control/markov/workers/{w:06d}/receipt.json'
 assert str(seal_path)==record['audit_seal'] and digest(seal_path)==record['audit_seal_sha256']==digest(T/seal_path.name)
 assert digest(receipt_path)==record['sha256']
 s=json.loads(seal_path.read_text());r=json.loads(receipt_path.read_text())
 assert s['worker']==w and s['request']==r['request_id']==record['request']
 assert r['outcome']==record['outcome']=='completed' and r['returncode']==record['returncode']==0 and r['report'] is not None
 assert s['historical_outcome']['outcome']=='completed' and s['historical_outcome']['request_id']==r['request_id']
 allowed[w]=set(s['preservation_paths'])|{str(T/seal_path.name)}
 sealed_pins[w]={};collect_pins(s,sealed_pins[w])
 sealed_pins[w][str(T/seal_path.name)]={record['audit_seal_sha256']}
 vp=B/f'markov_worker_{w:06d}_validation_evidence.json'
 assert digest(vp) in sealed_pins[w][str(T/vp.name)]
 validation[w]=json.loads(vp.read_text());seals[w]=s;receipts[w]=r
assert set(seals)=={181,182}
assert len(allowed[181])==15 and len(allowed[182])==17
assert len(seals[182]['preservation']['supplemental_unindexed_cache_bundle']['files'])==5
assert not any('/__pycache__/'in p for p in targets)


volume=Path('/private/tmp').stat().st_dev
# DiskManagement framework is unavailable in this sandbox; mount-table and st_dev are independent readonly evidence.
mount_lines=command(['/sbin/mount']).decode().splitlines()
mount_line=next(line for line in mount_lines if ' on /System/Volumes/Data (' in line)
assert ' (apfs,' in mount_line and Path('/System/Volumes/Data').stat().st_dev==volume
volume_info={'FilesystemType':'apfs','DeviceIdentifier':mount_line.split(' on ')[0],'MountPoint':'/System/Volumes/Data','mount_line':mount_line}
source_records={};target_records=[]
def inspect(p):
 p=Path(p);assert p.is_absolute() and p.resolve()==p
 before=metadata(p)
 assert before['file_type']==stat.S_IFREG and before['device']==volume and before['nlink']==1 and before['flags']==0
 acl=command(['/bin/ls','-lde',str(p)]).decode()
 attrs=command(['/usr/bin/xattr',str(p)]).decode()
 assert len(acl.splitlines())==1 and not attrs.strip()
 sha=digest(p);after=metadata(p);assert stable(before)==stable(after)
 return {'path':str(p),'sha256':sha,'before_read':before,'after_read':after,'acl_output':acl,'xattr_output':attrs,
 'stable_metadata_unchanged_during_sample':True,'atime_changed_during_sample':before['atime_ns']!=after['atime_ns']}
for p in pairs:
 source=Path(p['source']);target=Path(p['target']);kind=p['kind']
 if kind=='temporary_audit':
  assert target.parent==T and source==B/target.name and p['bytes']>=1048576
  w=int(target.name.split('_')[2]);assert w in (181,182) and str(target) in allowed[w]
  assert p['sha256'] in sealed_pins[w][str(target)]
  assert committed_by_path[str(source)]['sha256']==p['sha256']
 else:
  assert source.suffix in ('.olean','.ilean')
  w=next(w for w,r in receipts.items() if source.parent==R/'evidence'/('markov-'+r['request_id'][:8]))
  rel=source.relative_to(R);archive=R/f'.control/markov/workers/{w:06d}/artifacts'/rel
  object_path=R/'.control/markov/objects'/p['sha256']
  assert target==(archive if kind=='archive' else object_path) and kind in ('archive','object')
  assert receipts[w]['changes'][str(rel)]['after']==p['sha256']
  for path in [source,archive]:assert validation[w]['input_hashes'][str(path)]==p['sha256']
  old_object_pin=validation[w]['input_hashes'].get(str(object_path))
  assert old_object_pin is None or old_object_pin==p['sha256']
  historical=next(row for row in validation[w]['changes'] if row['path']==str(rel))
  assert historical['archive']==historical['current']==historical['expected']==p['sha256']
 if str(source) not in source_records:source_records[str(source)]=inspect(source)
 src=source_records[str(source)];dst=inspect(target)
 assert src['sha256']==dst['sha256']==p['sha256']
 assert src['after_read']['bytes']==dst['after_read']['bytes']==p['bytes']
 assert dst['after_read']['inode']==p['inode_before']!=src['after_read']['inode']
 assert all(dst['after_read'][key]==p[key] for key in ['mode','uid','gid','mtime_ns'])
 dst.update(kind=kind,source=str(source),worker=w,inventory_matches=True,prior_target_excluded=True,
            receipt_or_seal_binding=True,inventory_atime_ns=p['atime_ns'],atime_since_inventory_changed=p['atime_ns']!=dst['before_read']['atime_ns'])
 target_records.append(dst)
assert len(source_records)==26 and len(target_records)==45
assert len({row['after_read']['inode'] for row in target_records})==45
assert len({row['after_read']['inode'] for row in source_records.values()})==26
assert not {row['after_read']['inode'] for row in target_records}&{row['after_read']['inode'] for row in source_records.values()}
assert command(['git','rev-parse','HEAD']).decode().strip()==HEAD
assert digest(I)==EXPECTED_I and digest(C)==EXPECTED_C

out={'scope':'Independent storage-only read-only preflight of exactly listed sealed181-182 copies. No worker183 or later sources/events, source interpretation, research execution, object loading, storage replacement, or extension of mathematical audit windows.',
 'started_utc':started,'finished_utc':datetime.now(timezone.utc).isoformat(),'concurrence':True,'verdict':'No necessary correction; the exact pinned operation may proceed under its retained preconditions.',
 'inventory':pin(I),'inventory_helper':pin(IH),'operation_helper':pin(C),'independent_review_helper':pin(Path(__file__)),
 'repository_head':HEAD,'candidate_count':45,'candidate_bytes':106444500,'target_classes':dict(Counter(p['kind'] for p in pairs)),
 'canonical_source_count':26,'target_canonical_path_and_inode_sets_disjoint':True,'same_volume_device':volume,'filesystem':{'type':volume_info['FilesystemType'],'device_identifier':volume_info.get('DeviceIdentifier'),'mount_point':volume_info.get('MountPoint'),'mount_table_evidence':volume_info['mount_line'],'same_device_as_private_tmp':True},
 'prior_record_count':48,'excluded_prior_target_count':6184,'prior_target_overlap':[],
 'prior_record_pins':prior_pins,'committed_input_pins':committed,'unique_committed_pin_count':10,'receipt_and_seal_bindings':d['receipts'],
 'targets':target_records,'canonical_sources':list(source_records.values()),'mismatches':[],
 'operation_static_review':{'inventory_hash_fixed':True,'review_digest_cli_gate':True,'review_concurrence_content_not_programmatically_asserted':'Root must select this exact affirmative review digest; helper checks its bytes, not its JSON verdict.',
  'target_scope':{'temporary_audit':'Seven flat T audit files for181-182, each >=1MiB; canonical committed bootstrap source remains read-only.',
   'compiled':'Nineteen archive and19 content-addressed object files; canonical request-specific current evidence remains read-only.'},
  'preconditions':'Exact inventory target inode, stable metadata, byte hash, regular files, one link, no flags/xattrs/ACLs, same device; rechecked per target. Source/target bytes checked before cloning and before replacement.',
  'replacement':'cp -c creates a unique temporary clone; clone digest verified, target owner/group/mode applied, file fsync, sampled atime/mtime applied; atomic os.replace of target only. Target digest and stable metadata then checked; temporary path cleaned in finally.',
  'result_tracking':'Result created before per-target checks, updated after each verified replacement; complete only after all45. Result writes are non-atomic. ENOSPC or an interrupted result write can follow a verified replacement without its complete record; preserve recording capacity and inspect partial state on failure. No automatic rollback.',
  'source_mutation':'No source writes or replacement; read calls may affect source atime.',
  'atime':'Per-operation before.lstat sample is taken before the operation\'s own hash reads. That sampled value is restored after replacement. It is not an inventory/historical-atime or concurrent-access preservation guarantee.',
  'filesystem_identity':'Target inode/ctime/birthtime may change; stable bytes/mode/uid/gid/mtime must match inventory. Directory durability is not independently fsynced. No exclusive filesystem lock or continuous stability claim.',
  'execution':'Only this retained independent static hash/metadata helper executed. Inventory and clone helpers were read and AST-parsed, never imported or executed.'},
 'free_bytes_at_preflight_finish':os.statvfs('/private/tmp').f_bavail*os.statvfs('/private/tmp').f_frsize,
 'initial_tool_limitation':'A preliminary read-only heredoc failed before Python execution because the shell could not create a temporary file (no space left). Subsequent read-only commands use python -c; no deletion or replacement was performed.',
 'audit_helper_refinement':{'scope':'Fresh0810 adaptation from independently retained0720 helper. Current exact counts, workers, hashes and committed uniqueness reviewed before execution; an overbroad draft text replacement produced 4584 instead of 6184 in one exclusion assertion, corrected before any execution/output. Current child concurrence is independently received for0810. First execution stopped before output writing because diskutil DiskManagement was unavailable; the second uses readonly mount-table plus identical device IDs to authenticate APFS.'},
 'method_crossreview':{'performed':True,'agent':'/root/monitoring_audit/sealed136_review/method138','scope':'Exact0810 inventory/clone static semantics and scope, no project reads or execution.','concurrence':True,'counts':[45,26,106444500],'qualification':'Result writes are non-atomic; recording capacity must remain available. No necessary code correction found.'},
 'limits':['Samples describe bounded observations, not continuous stability.','No assertion about causal attribution of concurrent atime changes or physical storage savings.','Committed receipts and sealed validation maps bind compiled canonical hashes; compiled objects are not interpreted or rerun.','All earlier mathematical statuses and observation windows are unchanged.'],
 'preservation_paths':[str(IH),str(I),str(C),str(Path(__file__)),str(O)]}
O.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'review':pin(O),'helper':pin(Path(__file__)),'concurrence':True,'targets':45,'sources':26,'preservation_paths':out['preservation_paths']},indent=2))
