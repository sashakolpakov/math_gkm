"""Final bounded closed183 identity/absence/metadata observation; no project execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,os,stat
P=Path('/Users/sasha/math_gkm');W=P/'.control/markov/workers/000183';A=W/'artifacts';E=P/'evidence/markov-55cf20d2'
T=Path('/private/tmp/math_gkm_godel_20261013');PRE='markov_worker_000183_';VP=T/(PRE+'validation_evidence.json')
def now():return datetime.now(timezone.utc).isoformat()
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def pin(p):
 p=Path(p);return {'path':str(p),'bytes':p.stat().st_size,'sha256':sha(p)}
def load(p):return json.loads(Path(p).read_text())
def meta(p):
 s=Path(p).lstat();return {'bytes':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns}
v=load(VP);assert v['final_static_stability'] is None and v['project_reads_closed_utc'] is None
M=T/(PRE+'replay_method_evidence.json');MN=T/(PRE+'replay_method.md')
assert sha(M)=='81d042048cc9a4b8e62f96945f5c2ba3156a344401506db654c72036274fbdd9'
assert sha(MN)=='be2adfad9dc126396a8ad3760ddbab6a8b5347fe90175c8832f6fb975a7b0639'
m=load(M);assert m['final_static_observation']['all_unchanged']
expected=dict(v['input_hashes']);rebindings=[]
for p,old in list(expected.items()):
 if p==str(M):
  new=sha(p)
  if old!=new:rebindings.append({'path':p,'previous_sha256':old,'current_sha256':new,'reason':'Final method evidence stabilized before validator closing window.'})
  expected[p]=new
for p,h in m['static_input_sha256'].items():
 if p in expected:assert expected[p]==h,p
 else:expected[p]=h
for p in [M,MN,T/(PRE+'completed_commands.json'),T/'static_validation_worker183.py',T/'enrich_validation_worker183.py',T/'render_validation_worker183.py',T/'retain_worker183_partial.py',T/'retain_worker183_partial_binary.py',T/'audit_worker183_static.py',Path(__file__)]:
 expected[str(p)]=sha(p)
watch=T/(PRE+'receipt_watch.json')
if watch.exists():expected[str(watch)]=sha(watch)
assert str(VP) not in expected and str(T/(PRE+'validation_audit.md')) not in expected
for k in v['method_crosscheck']:v['method_crosscheck'][k]=m[k]
v['method_support_hashes']={'evidence':pin(M),'note':pin(MN),'pairmap':pin(T/(PRE+'inherited_pair_expectations.json'))}
v['method_final_observation']=m['final_static_observation']
v['method_final_admin_absence_observation']=m['final_admin_absence_observation']
v['method_final_pending_object_absence_observation']=m['final_absence_observation']
v['pre_observation_input_rebinding']=rebindings
v['input_hashes']=expected
shared=set(expected)&set(m['static_input_sha256'])
assert all(expected[p]==m['static_input_sha256'][p] for p in shared)
v['method_shared_input_crosscheck']={'shared_count':len(shared),'mismatches':{}}
v['method_crosscheck_summary']['copied_fields']=len(v['method_crosscheck'])
# Save the exact expected map before opening the closing window.
VP.write_text(json.dumps(v,indent=2)+'\n')
started=now();changed={};missing=[]
for p,want in expected.items():
 path=Path(p)
 if not path.exists():missing.append(p);continue
 actual=sha(path)
 if actual!=want:changed[p]={'expected':want,'current':actual}
finished=now()
v['final_static_stability']={'started_utc':started,'finished_utc':finished,'input_count':len(expected),'all_unchanged':not changed and not missing,'changed':changed,'missing':missing,'expected_map_sha256':hashlib.sha256(json.dumps(expected,sort_keys=True,separators=(',',':')).encode()).hexdigest(),'scope':'Fresh stream hashes of only named closed183, explicit inherited and audit inputs. No digest cache; no proof/program execution.'}
assert not changed and not missing
absence={p:not Path(p).exists() for p in v['initial_absence_observation']['paths']}
v['final_absence_observation']={'kind':'administrative completion records','observed_at_utc':now(),'count':len(absence),'paths':absence}
assert len(absence)==10 and all(absence.values()) and absence==m['final_admin_absence_observation']['paths']
initial=v['initial_request_scope']
archive={str(p.relative_to(A)):sha(p) for p in sorted(A.rglob('*')) if p.is_file()}
current={}
for folder in [P/'research',P/'research/__pycache__']:
 if folder.exists():
  for entry in os.scandir(folder):
   if entry.is_file(follow_symlinks=False) and ('55cf20d2' in entry.name or 'M55C' in entry.name):
    p=Path(entry.path);current[str(p.relative_to(P))]=sha(p)
for p in sorted(E.rglob('*')):
 if p.is_file():current[str(p.relative_to(P))]=sha(p)
late={'observed_at_utc':now(),'archive_file_count':len(archive),'current_request_file_count':len(current),'archive_paths':sorted(archive),'current_paths':sorted(current),'archive_additions':sorted(set(archive)-set(initial['archive'])),'archive_missing':sorted(set(initial['archive'])-set(archive)),'current_additions':sorted(set(current)-set(initial['current'])),'current_missing':sorted(set(initial['current'])-set(current)),'archive_hash_changes':{k:{'expected':initial['archive'][k]['sha256'],'current':h} for k,h in archive.items() if k in initial['archive'] and h!=initial['archive'][k]['sha256']},'current_hash_changes':{k:{'expected':initial['current'][k]['sha256'],'current':h} for k,h in current.items() if k in initial['current'] and h!=initial['current'][k]['sha256']},'archive_current_mismatch':[k for k in sorted(archive) if k not in current or current[k]!=archive[k]],'scope':'Exact original183 archive/current pattern scope only. Discovery does not imply creation time; original partial archive remains incomplete.'}
assert late['archive_file_count']==24 and late['current_request_file_count']==78
assert all(not late[k] for k in ['archive_additions','archive_missing','current_additions','current_missing','archive_hash_changes','current_hash_changes'])
assert late['archive_current_mismatch']==['evidence/markov-55cf20d2/MarkovTopSecondGapM55C.olean']
records=[];sources=[];copies=[]
for stem,count in [('partial_retention',46),('partial_binary',9)]:
 bundle=load(T/(PRE+stem+'_bundle.json'));obs=load(T/(PRE+stem+'_observation.json'));assert bundle['count']==count
 for row in obs['files']:
  source=row['source'];copy=row.get('copy',row.get('path'));assert copy
  sources.append(source);copies.append(copy)
  for path,role,want in [(source,'source',row['source_before']),(copy,'copy',row.get('copy_metadata',row.get('copy_after_hash')))]:
   actual=meta(path);keys=['bytes','mode','uid','gid','mtime_ns'];exp={k:want[k] for k in keys};ok=all(actual[k]==exp[k] for k in keys)
   records.append({'path':path,'role':role,'bundle':stem,'expected':exp,'current':actual,'all_match':ok,'atime_is_observation_only':True})
late['supplemental_source_paths']=sorted(sources);late['supplemental_copy_paths']=sorted(copies)
late['supplemental_metadata']={'observed_at_utc':now(),'checked_count':len(records),'all_match':all(r['all_match'] for r in records),'mismatches':[r['path'] for r in records if not r['all_match']],'records':records}
assert len(set(sources))==len(set(copies))==55 and len(records)==110 and late['supplemental_metadata']['all_match']
v['late_scope_observation']=late
v['project_reads_closed_utc']=now()
# All remaining reads below are audit-file-only.
tmp={p:h for p,h in expected.items() if Path(p).is_relative_to(T)}
tmp_changed={p:{'expected':h,'current':sha(p)} for p,h in tmp.items() if sha(p)!=h};assert not tmp_changed
v['audit_only_input_recheck']={'observed_at_utc':now(),'count':len(tmp),'all_unchanged':True,'changed':{},'paths':sorted(tmp),'qualification':'Audit-file-only check after project reads closed.'}
v['preparation_history'].append('Final method evidence was rebound before the validator closing window, preserving the draft-to-final SHA transition; no post-window map substitutions.')
VP.write_text(json.dumps(v,indent=2)+'\n')
print(json.dumps({'final_window':v['final_static_stability'],'admin_absence':v['final_absence_observation'],'late_observed_at':late['observed_at_utc'],'metadata_observed_at':late['supplemental_metadata']['observed_at_utc'],'project_closed':v['project_reads_closed_utc'],'temporary_inputs':len(tmp),'shared_method_fields':len(v['method_crosscheck']),'shared_hashes':len(shared),'evidence':pin(VP)},indent=2))
