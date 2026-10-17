"""Audit-only binding of separately authorized partial183 retention bundles."""
from pathlib import Path
import json,hashlib,stat
T=Path('/private/tmp/math_gkm_godel_20261013');P=T/'markov_worker_000183_replay_method_evidence.json';m=json.loads(P.read_text());H=m['static_input_sha256']
def read(p):
 p=Path(p);b=p.read_bytes();h=hashlib.sha256(b).hexdigest();assert str(p) not in H or H[str(p)]==h;H[str(p)]=h;return b
def js(p):return json.loads(read(p))
b=js(T/'markov_worker_000183_partial_binary_bundle.json');o=js(T/'markov_worker_000183_partial_binary_observation.json');assert b['count']==o['count']==9 and b['bytes']==o['bytes']==12946720 and not o['mismatches']
assert b['observation']['sha256']==H[str(T/'markov_worker_000183_partial_binary_observation.json')]
rows=[]
for z in b['files']:
 p=Path(z['path']);assert p.is_relative_to(T/'markov_worker_000183_partial_binary_bundle');read(p);assert H[str(p)]==z['sha256']==m['initial_inventory']['current'][z['relative_path']]['sha256'];s=p.stat();obs=next(x for x in o['files'] if x['relative_path']==z['relative_path']);meta=dict(bytes=s.st_size,mode=stat.S_IMODE(s.st_mode),uid=s.st_uid,gid=s.st_gid,mtime_ns=s.st_mtime_ns)
 assert all(meta[k]==obs['source_before'][k] for k in meta) and obs['source_unchanged_except_possible_atime'] and obs['independent_inode'] and obs['bytes_mode_uid_gid_mtime_match'];rows.append(dict(path=str(p),sha256=H[str(p)],bytes=s.st_size,selected_metadata_match=True))
nonbinary=[]
for z in m['partial_retention']['observation']['files']:
 p=Path(z['copy']);read(p);assert H[str(p)]==z['sha256'];s=p.stat();meta=dict(bytes=s.st_size,mode=stat.S_IMODE(s.st_mode),uid=s.st_uid,gid=s.st_gid,mtime_ns=s.st_mtime_ns);assert all(meta[k]==z['source_before'][k] for k in meta);nonbinary.append(dict(path=str(p),sha256=H[str(p)],bytes=s.st_size,selected_metadata_match=True))
assert len(nonbinary)==46
m['partial_binary_retention']=dict(bundle=b,observation=o,independent_copy_checks=rows,scope='Separate9 opaque ordinary-object clones retain current observed bytes; original empty/missing archive entries remain unchanged. No compiler/replay/axiom credit or historical archive repair.')
m['partial_retention']['independent_copy_checks']=nonbinary
m['partial_retention']['scope']='Separate46 nonbinary copies, not a repaired controller archive. Nine current ordinary objects are separately retained in the binary supplement, without validation credit.'
m['retention_boundary'].update(binary_copies_created_by_validator=9,binary_copy_bytes=12946720,binary_copy_window_start=o['copy_started_utc'],binary_copy_window_finish=o['copy_finished_utc'],scope='Original archive24 remains23 current-byte matches plus one empty object mismatch. Separate46 nonbinary copies and9 binary clones retain missing/differing current counterparts; the original archive is not repaired. Compiler receipts carry no output-object digest, so clones add retention only.')
m['retention_boundary'].pop('binary_copies_created_by_auditors',None)
m['audit_helper_refinements'].append(dict(scope='Pre-window retention-only authorization extension',detail='Initial hash-only choice for missing/different ordinary objects was superseded by parent authorization for9 separate APFS clones. Original archive/current objects and all mathematical validation statuses unchanged. Method hashes/stat-checks copies only.'))
read(Path(__file__));P.write_text(json.dumps(m,indent=2,sort_keys=True)+'\n');print(json.dumps(dict(inputs=len(H),copies=55,bytes=2952709+12946720)))
