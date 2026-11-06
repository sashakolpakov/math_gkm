"""SOURCE DRAFT ONLY: fixed19/r82 retention-scan revision; no CLI/installer.
Old EF2/B421 must be genuinely verified BEFORE installation. No old verifier is
executed with rebound globals. No import-time IO. No role launch or cleanup.
"""
import hashlib,json,math,os,re,signal,stat,sys,time,types
from pathlib import Path
ROOT=Path('/Users/sasha/math_gkm');OPS=ROOT/'.bootstrap/concept-driver-20261020/general-continuation'
PACKET=OPS/'retention-scan19-maintenance-20261024';STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000019'
OLD_PACKET=OPS/'claim-alias19-maintenance-20261023'
OLD_VERIFY_PACKET=OPS/'retention-scan20-20261024'
OLD_CORE='ef2a7656a54fade2d64256ea2ee527f25795f3e90bb1a0ca0c16045e69e10dbe'
NEW_CORE='996d37b699ebeff1f2966ab19268ded7c9b370f4c84362da76e99de23adce2ce'
OLD_HELPER='b421cab41917d0c0d73cd6529ab9db93d207418f910ccf0d59299ba1fd3cf4e0'
OLD_FOLLOW='4af3c266369958b14ecdf3a68b22f554608b43eb60145ea6068e449c116cc25c'
OLD_GUARD='e6e2fb11774a0d5914c2069fba4435f0e9208d5d58b35bd09837121a6a561996'
OLD_RESOURCES='341584d8a7d6d29c5f597253f08416f0b7f1d7828962d65f532da71c5f2c238f'
NEW_RESOURCES='6103109a36645809fd36cf9d3e963a30604463abb7b3d6614ddab25675e033cc'
NATIVE_SHA='701390ce43401f2c009abe8ab18de4ec785a089f96061f8c219251aaf37f30ed'
OBSERVER_SHA='6c52df2713b33fa0621659fb77ef132a5cd9a57c28cbc9cdb414a57af44ab94f'
STATE_NAMES=('seal.json','arms/baseline/state.json','arms/exploration/state.json')
FIXED_NAMES=('protocol.json','CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json')
INTENT='RETENTION_SCAN19_RESUME_INTENT.json';FIELD='retention_scan19_resume_intent'
MAX_JSON=32*1024**2;MAX_HASH=256*1024**2;CLEANUP=1900
_NATIVE=None;_OBSERVERS=None;_SETUP_DEADLINE=None

def need(ok,message='retention-scan19 evidence refused'):
 if not ok:raise RuntimeError(message)
def canonical(v):return json.dumps(v,sort_keys=True,separators=(',',':'),ensure_ascii=False,allow_nan=False).encode()
def digest(v):return hashlib.sha256(canonical(v)).hexdigest()
def finite(v):return type(v) in (int,float) and math.isfinite(v)
def is_hash(v):return type(v) is str and re.fullmatch('[0-9a-f]{64}',v) is not None
def reviewed(v):return type(v) is list and all(type(x) is str and x.strip() for x in v) and len(set(v))>=2

def _time_gate():
 if _SETUP_DEADLINE is not None:need(time.monotonic()<_SETUP_DEADLINE,'bounded capacity setup expired')

def _source(path,pin):
 """Hash exactly the owned descriptor bytes compiled; no path/symlink reload."""
 _time_gate();path=Path(path);need(path.is_absolute() and path.is_relative_to(ROOT) and '..' not in path.parts)
 flags=os.O_RDONLY|os.O_DIRECTORY|os.O_NOFOLLOW|os.O_CLOEXEC;d=os.open('/',flags);fd=None
 try:
  for part in path.parent.parts[1:]:n=os.open(part,flags,dir_fd=d);os.close(d);d=n
  fd=os.open(path.name,os.O_RDONLY|os.O_NOFOLLOW|os.O_CLOEXEC|os.O_NONBLOCK,dir_fd=d);before=os.fstat(fd)
  need(stat.S_ISREG(before.st_mode) and before.st_uid==os.getuid() and not before.st_mode&0o022 and 0<before.st_size<=1024**2)
  data=b''
  while True:
   b=os.read(fd,65536)
   if not b:break
   data+=b;need(len(data)<=1024**2)
  fingerprint=lambda r:(r.st_dev,r.st_ino,r.st_mode,r.st_uid,r.st_gid,r.st_size,r.st_mtime_ns,r.st_ctime_ns)
  need(fingerprint(before)==fingerprint(os.fstat(fd))==fingerprint(os.stat(path.name,dir_fd=d,follow_symlinks=False)) and hashlib.sha256(data).hexdigest()==pin)
  return data
 finally:
  if fd is not None:os.close(fd)
  os.close(d)
def _load(path,pin,name):
 data=_source(path,pin);module=types.ModuleType(name);module.__file__=str(path);exec(compile(data,str(path),'exec'),module.__dict__);return module

def _native():
 global _NATIVE
 path=OLD_PACKET/'native_once19.py'
 if _NATIVE is None:_NATIVE=_load(path,NATIVE_SHA,'retention_scan19_readonly_primitives')
 need(_NATIVE.protected_hash(path,under=ROOT)==NATIVE_SHA);return _NATIVE
def _sha(path):
 _time_gate();h=_native().protected_hash(path,under=ROOT,maximum=MAX_HASH);_time_gate();return h
def _raw(path):
 h=_sha(path);return _native().protected_read(path,h,under=ROOT,maximum=MAX_JSON)
def _json(path):return json.loads(_raw(path))
def _pointer(row,under=ROOT):
 need(type(row) is dict and set(row)=={'path','sha256'} and is_hash(row['sha256']));p=Path(row['path'])
 need(p.is_absolute() and p.is_relative_to(under) and _sha(p)==row['sha256']);return p
def _reference(row,under=ROOT):return _json(_pointer(row,under))
def _manifest(rows):
 need(type(rows) is dict and 1<=len(rows)<=10000)
 mutable={ROOT/'machinery/resources.py',OPS/'continue_machine.py',OPS/'follow.py',OPS/'FOLLOW.json',ROOT/'.bootstrap/study-authorization.json'}|{STUDY/n for n in STATE_NAMES}
 for name,pin in rows.items():need(Path(name) not in mutable and is_hash(pin) and _sha(Path(name))==pin)

# Literal reviewed lexical splitter: only selected operational/accepted metadata is
# decoded. Private state values are compared as raw canonical byte spans.
def _value_end(data,start):
 stack=[];quoted=escaped=False;i=start
 while i<len(data):
  byte=data[i]
  if quoted:
   if escaped:escaped=False
   elif byte==92:escaped=True
   elif byte==34:
    quoted=False
    if not stack and data[start]==34:return i+1
  elif byte==34:quoted=True
  elif byte in (123,91):stack.append(byte)
  elif byte in (125,93):
   if not stack:return i
   need((stack.pop(),byte) in ((123,125),(91,93)))
   if not stack:return i+1
  elif byte==44 and not stack:return i
  i+=1
 need(not stack and not quoted);return i
def _fields(data):
 need(data[:1]==b'{' and data[-1:]==b'}');result={};i=1
 while i<len(data)-1:
  need(data[i]==34);end=_value_end(data,i);key=json.loads(data[i:end]);need(key not in result and data[end:end+1]==b':')
  start=end+1;end=_value_end(data,start);result[key]=data[start:end];i=end
  if i<len(data)-1:need(data[i]==44);i+=1
 return result
def _state(path):
 data=_raw(path);need(data.endswith(b'\n') and not data.endswith(b'\n\n'));env=_fields(data[:-1]);need(set(env)=={'state','sha256'} and hashlib.sha256(env['state']).hexdigest()==json.loads(env['sha256']));return _fields(env['state'])
def _state_without_seal(fields):return b'{'+b','.join(canonical(k)+b':'+v for k,v in sorted(fields.items()) if k!='seal_hash')+b'}'
def state_frames(before,after,old_seal,new_seal):
 need(set(before)==set(after)=={'baseline','exploration'})
 for mode in before:need(json.loads(before[mode]['seal_hash'])==digest(old_seal) and json.loads(after[mode]['seal_hash'])==digest(new_seal) and _state_without_seal(before[mode])==_state_without_seal(after[mode]))
def _select(fields,keys):return {k:json.loads(fields[k]) for k in keys if k in fields}
def _idle(fields):
 if any(fields.get(k,b'null')!=b'null' for k in ('active','active_intent','resolution')):return False
 raw=fields.get('protocol_state',b'null')
 if raw==b'null':return True
 p=_fields(raw);return p.get('pending',b'null')==b'null' and p.get('inflight',b'null') in (b'null',b'false')

def tip_map(base,cfg):
 need(type(base) is dict and len(base)==76 and digest(base)==OLD_CORE and cfg.get('old_core')==OLD_CORE and cfg.get('new_core')==NEW_CORE)
 need(cfg.get('old_implementation')==base and cfg.get('changes')=={'machinery/resources.py':[OLD_RESOURCES,NEW_RESOURCES]} and base.get('machinery/resources.py')==OLD_RESOURCES)
 result={**base,'machinery/resources.py':NEW_RESOURCES};need(cfg.get('implementation')==result and digest(result)==NEW_CORE);return result

def config():
 need(Path(__file__)==PACKET/'retention_scan_guard.py');authority_path=ROOT/'.bootstrap/study-authorization.json';need(authority_path.stat().st_mode&0o222==0);auth=_json(authority_path);grant=auth.get('retention_scan19_maintenance',{})
 need(grant.get('schema')=='math-gkm.retention-scan19-maintenance.v1' and grant.get('authorized') is True and reviewed(grant.get('independent_reviewers')))
 need(grant.get('module_path')==str(Path(__file__)) and grant.get('module_sha256')==_sha(Path(__file__)))
 p=_pointer({'path':grant.get('config_path'),'sha256':grant.get('config_sha256')},PACKET);need(p==PACKET/'CONFIG.json' and p.stat().st_mode&0o222==0)
 cfg=_json(p);tip_map(cfg.get('old_implementation'),cfg)
 need(cfg.get('schema')=='math-gkm.retention-scan19-config.v1' and cfg.get('status')=='reviewed' and cfg.get('study')==str(STUDY) and cfg.get('stopped_round')==82 and cfg.get('next_sequence')==20)
 need(cfg.get('old_helper_sha256')==OLD_HELPER and cfg.get('old_follow_sha256')==OLD_FOLLOW and cfg.get('module_sha256')==_sha(Path(__file__)) and cfg.get('new_helper_sha256')==_sha(OPS/'continue_machine.py') and cfg.get('new_follow_sha256')==_sha(OPS/'follow.py'))
 need(auth.get('implementation_sha256')==NEW_CORE and auth.get('ongoing_migration_sha256')==cfg['new_helper_sha256'] and auth.get('ongoing_follow_sha256')==cfg['new_follow_sha256'] and auth.get('user_explicit_ok') is True and auth.get('ongoing_goal_authorized') is True)
 need(cfg.get('additional_paid_allowance')==0 and cfg.get('role_replay_authorized') is False and cfg.get('automatic_retry') is False)
 for name,pin in cfg['implementation'].items():need(_sha(ROOT/name)==pin)
 _witness(cfg)  # Physical genuine old verification is mandatory before new API.
 return cfg

def _old_profile(cfg):
 old=_reference(cfg['old_authority'],PACKET)
 need(old.get('implementation_sha256')==OLD_CORE and old.get('ongoing_migration_sha256')==OLD_HELPER and old.get('ongoing_follow_sha256')==OLD_FOLLOW)
 current=_json(ROOT/'.bootstrap/study-authorization.json');mutable={'implementation_sha256','ongoing_migration_sha256','ongoing_follow_sha256','ongoing_source_reviewer','retention_scan19_maintenance','retention_scan19_resume','retention_scan19_revision'}
 need({k:v for k,v in current.items() if k not in mutable}=={k:v for k,v in old.items() if k not in mutable})
 grant=old['claim_alias19_maintenance'];need(grant['module_path']==str(OLD_PACKET/'revision_guard.py') and grant['module_sha256']==OLD_GUARD and _sha(OLD_PACKET/'revision_guard.py')==OLD_GUARD)
 oldcfg=_reference({'path':grant['config_path'],'sha256':grant['config_sha256']},OLD_PACKET);need(oldcfg['new_core']==OLD_CORE and oldcfg['implementation']==cfg['old_implementation'])
 return oldcfg

def historical17_config():
 cfg=config();oldcfg=_old_profile(cfg);authority=_reference(oldcfg['old_authority'],OLD_PACKET);grant=authority['prompt_transport_maintenance'];p=Path(grant['module_path']).parent
 need(authority.get('implementation_sha256')==oldcfg['old_core'] and grant['authorized'] is True and grant['module_sha256']=='e631063d2c8540213bb565169b413119fc8d21a36634f7e861d0724bd94cddbf' and _sha(Path(grant['module_path']))==grant['module_sha256'])
 result=_reference({'path':grant['config_path'],'sha256':grant['config_sha256']},p);need(result['new_core']==oldcfg['old_core']);return result

def historical19_map(base):
 cfg=config();old=_old_profile(cfg);need(digest(base)==old['old_core'] and old['old_implementation']==base and set(old['changes'])=={'machinery/study_context.py'})
 pair=old['changes']['machinery/study_context.py'];need(base['machinery/study_context.py']==pair[0] and pair[1]=='fd4addceb61ece31d8f224ff23ca1624a0c8975d5ec3b0a858211c566e27dce9')
 result={**base,'machinery/study_context.py':pair[1]};need(result==cfg['old_implementation'] and digest(result)==OLD_CORE);return result

def operation_scope(kind):
 need(kind in ('old_immutable_bindings','old_study_verify','new_neutral_readiness','new_study_verify','old_effects'))
 return OLD_VERIFY_PACKET if kind in ('old_immutable_bindings','old_study_verify') else PACKET

def _operation(row,kind,core,helper,files,cfg):
 report=_reference(row,operation_scope(kind))
 if kind in ('old_immutable_bindings','old_study_verify'):
  need(report.get('schema')=='math-gkm.old100-operation.v1' and report.get('status')=='completed' and report.get('passed') is True and report.get('ordinary_source_verification') is True and report.get('round')==82 and report.get('accepted_count')==100)
  need(report.get('study')==str(STUDY) and report.get('implementation_sha256')==OLD_CORE==core and report.get('helper_sha256')==OLD_HELPER==helper and report.get('returncode')==0 and report.get('reaped') is True and report.get('termination') is None)
  need(report.get('effect_journal_complete') is True and report.get('Popen_restored') is True and report.get('only_exact_genuine_resources_observation_spawned') is True and report.get('before_snapshot_sha256')==report.get('after_snapshot_sha256')==digest(report['public_frame']))
  op=report['operations'][kind];need(op.get('completed') is True and all(finite(op.get(n)) for n in ('started','finished','elapsed_seconds')) and op['elapsed_seconds']>=0 and op['finished']>=op['started'] and is_hash(op.get('result_sha256')))
  if kind=='old_immutable_bindings':need(op.get('ongoing') is True)
  frames=report['public_frame']['frame_sha256']
  for n,pin in files.items():need(frames.get(str((STUDY/n).relative_to(ROOT)))==pin)
  for key in ('producer','child_producer'):
   source=_pointer(report[key],OLD_VERIFY_PACKET);need(cfg['trusted_producers'].get(str(source))==_sha(source))
  for name,pin in report['sources'].items():
   need(type(name) is str and Path(name).name==name and name.endswith('.py'));source=OLD_VERIFY_PACKET/name;need(cfg['trusted_producers'].get(str(source))==pin==_sha(source))
  _pointer(report['child_report'],OLD_VERIFY_PACKET);_pointer(report['effect_journal'],OLD_VERIFY_PACKET)
 else:
  need(report.get('schema')=='math-gkm.study19-source-operation.v1' and report.get('operation')==kind and report.get('status')=='completed' and report.get('passed') is True and report.get('returncode')==0)
  need(report.get('study')==str(STUDY) and report.get('implementation_sha256')==core and report.get('helper_sha256')==helper and report.get('study_files_sha256')==files and report.get('no_paid_role_launch') is True)
  source=_pointer(report.get('producer'),PACKET);need(cfg['trusted_producers'].get(str(source))==_sha(source))
 return report

def _registry_projection(state):
 research=_fields(state['research']);return {k:{'sha256':hashlib.sha256(research[k]).hexdigest(),'count':len(_fields(research[k]))} for k in ('knowledge','components')}

def _witness(cfg):
 w=_reference(cfg['old_verification'],PACKET);need(w.get('schema')=='math-gkm.retention-scan19-old-verification.v1' and w.get('study')==str(STUDY) and w.get('old_core')==OLD_CORE and w.get('old_helper_sha256')==OLD_HELPER and w.get('accepted_count')==100 and w.get('round')==82)
 need(set(w['before_files'])==set(STATE_NAMES));files={n:w['before_files'][n]['sha256'] for n in STATE_NAMES}
 for row in w['before_files'].values():_pointer(row,PACKET)
 archive=_state(_pointer(w['before_files']['arms/exploration/state.json'],PACKET));projection=_registry_projection(archive)
 need(sum(v['count'] for v in projection.values())==100 and _select(archive,{'round','phase','status'})=={'round':82,'phase':'research','status':'running'} and w.get('accepted_registry_binding')==digest(projection))
 for kind in ('old_immutable_bindings','old_study_verify'):
  report=_operation(w['operations'][kind],kind,OLD_CORE,OLD_HELPER,files,cfg);need(report['public_frame']['exploration']['accepted_registry']==projection and report['mathematical_inventory_binding']==w['mathematical_inventory_binding'])
 _manifest(w['historical_files']);_old_profile(cfg)
 _old_effects(w,cfg,report)
 return w

def _old_effects(w,cfg,old_operation):
 effects=_reference(w['closed_effects'],PACKET)
 need(effects.get('schema')=='math-gkm.retention-scan19-old-effects-closed.v1'
  and effects.get('study')==str(STUDY) and effects.get('closed') is True
  and effects.get('old100_operation')==w['operations']['old_study_verify']
  and effects.get('job_files_sha256')==old_operation['public_frame']['job_files_sha256'])
 tail=old_operation['public_frame']['terminal_tail'];need(tail.get('exact_accounted_six_jobs') is True and tail.get('calls')==6 and tail.get('meta_calls')==4)
 jobs=tail['terminal_jobs'];expected={'plan-0080','round-0080','plan-0081','round-0081','review-source-v1-82','select-82'}
 need(set(jobs)==expected and effects.get('terminal_tail_binding')==digest(tail))
 inventory=_inventory(effects)
 watchdogs=sorted({j['watchdog_pid'] for j in jobs.values()})
 need(all(type(pid) is int and pid>0 for pid in watchdogs) and len(watchdogs)==6 and effects.get('known_birthless_watchdog_pids')==watchdogs)
 for job in jobs.values():need(job['pid'] in inventory['pids'] and job['pid'] in inventory['groups'] and inventory['identities'].get(str(job['pid']))=={'pid':job['pid'],'birth':job['owned_root_birth']})
 return effects,watchdogs

def coherent_api(a):
 cfg=config();from machinery import study_context,study_research_feedback,study_worker
 common,resources=a['common'],a['resources']
 need(common.Invalid is a['study'].Invalid is study_context.Invalid is study_research_feedback.Invalid is a['deployment'].Invalid and study_worker.Guard is resources.Guard and study_worker.ResourceFailure is resources.ResourceFailure)
 need(common.retention_room.__globals__ is common.__dict__ and resources.Guard._disk_bytes.__globals__ is resources.__dict__ and study_worker.disk_scope_roots is resources.disk_scope_roots)
 need(resources.RETENTION_SCAN_ENTRY_LIMIT==1000000 and resources.DISK_SCAN_ENTRY_LIMIT==100000 and common.RETAINED_SOURCE_HISTORY_CAP==8*1024**3 and study_context.PROMPT_CHAR_LIMIT==900000 and study_context.CONTEXT_BYTE_LIMIT==8*1024**2 and common.implementation()==cfg['implementation'])
 for module,name in ((common,'study_common'),(resources,'resources'),(study_worker,'study_worker'),(a['study'],'study'),(a['deployment'],'study_deployment')):need(Path(module.__file__)==ROOT/'machinery'/(name+'.py'))
 return cfg

def applied_lineage():
 cfg=config();w=_witness(cfg);auth=_json(ROOT/'.bootstrap/study-authorization.json');grant=auth['retention_scan19_maintenance'];p=_pointer({'path':grant.get('record_path'),'sha256':grant.get('record_sha256')},PACKET);need(p==PACKET/'REVISION.json');record=_json(p);core=record['core']
 need(record.get('schema')=='math-gkm.retention-scan19-source-revision.v1' and record.get('status')=='applied' and record['binding']==digest(core) and core.get('config_sha256')==_sha(PACKET/'CONFIG.json') and core.get('study')==str(STUDY) and core.get('old_core')==OLD_CORE and core.get('new_core')==NEW_CORE and core.get('implementation')==cfg['implementation'] and core.get('old_files')==w['before_files'] and core.get('old_verification')==cfg['old_verification'])
 need(set(record['new_files'])==set(STATE_NAMES));old={n:_pointer(w['before_files'][n],PACKET) for n in STATE_NAMES};new={n:_pointer(record['new_files'][n],PACKET) for n in STATE_NAMES};oldseal=_json(old['seal.json']);newseal=_json(new['seal.json'])
 need(oldseal['implementation']==cfg['old_implementation'] and newseal['implementation']==cfg['implementation'])
 expected={**oldseal,'implementation':cfg['implementation'],'deployment_preflight':newseal['deployment_preflight'],'source_revision':{'record':str(p),'binding':record['binding'],'old_seal_sha256':w['before_files']['seal.json']['sha256']}}
 need(expected==newseal and _sha(STUDY/'seal.json')==record['new_files']['seal.json']['sha256'])
 state_frames({m:_state(old['arms/'+m+'/state.json']) for m in ('baseline','exploration')},{m:_state(new['arms/'+m+'/state.json']) for m in ('baseline','exploration')},oldseal,newseal)
 need(set(w['fixed_files'])==set(FIXED_NAMES))
 for n,pin in w['fixed_files'].items():need(_sha(STUDY/n)==pin)
 for mode in ('baseline','exploration'):need(json.loads(_state(STUDY/'arms'/mode/'state.json')['seal_hash'])==digest(newseal))
 neutral=_operation(cfg['new_neutral'],'new_neutral_readiness',NEW_CORE,cfg['new_helper_sha256'],{n:w['before_files'][n]['sha256'] for n in STATE_NAMES},cfg)
 need(neutral.get('deployment_preflight')==newseal['deployment_preflight'])
 need(auth.get('retention_scan19_revision')=={'path':str(p),'sha256':_sha(p)})
 from machinery import study_deployment
 study_deployment.reuse_deployment(newseal['deployment_preflight'])
 return record

def retention12_history():
 cfg=config();w=_witness(cfg);return {'implementation_sha256':NEW_CORE,'historical_implementation_sha256':OLD_CORE,'genuine_old_verification_sha256':cfg['old_verification']['sha256']}

def remaining_deadline(protocol,meta,old_intent,requested,now_mono,now_wall):
 need(type(requested) is int and requested>CLEANUP+30 and finite(now_mono) and finite(now_wall))
 for k,v in {'rounds':84,'call_seconds':1800,'adaptation_seconds':1800,'validation_seconds':1800,'arm_seconds':216000,'max_calls':64,'meta_calls':32}.items():need(protocol.get(k)==v)
 need(old_intent.get('schema')=='math-gkm.study19-administrative-resume-intent.v1' and old_intent.get('study')==str(STUDY))
 g=old_intent['guard'];need(g.get('schema')=='math-gkm.study19-administrative-guard.v1' and all(finite(g.get(k)) for k in ('guard_started_monotonic','deadline_monotonic','conservative_epoch_deadline_wall','duration_seconds')) and finite(old_intent.get('audit_wall_time_only')))
 need(now_mono>=g['guard_started_monotonic'] and now_wall>=old_intent['audit_wall_time_only'])
 seconds=meta['seconds'];attempts=meta['protocol_attempts'];need(finite(seconds) and 0<=seconds<=216000 and type(attempts) is int and 0<=attempts<=258 and meta['protocol_reserved_seconds']==30*attempts)
 balances=[]
 for pool in meta['budget_pools'].values():
  cap,spent=pool['cap'],pool['spent'];need(finite(cap) and finite(spent) and 0<=spent<=cap);balances.append(cap-spent)
 resource_seconds=216000-seconds+sum(balances)+30*(258-attempts)+1800+CLEANUP
 need(requested<=resource_seconds)
 wall_end=min(g['conservative_epoch_deadline_wall'],old_intent['audit_wall_time_only']+g['duration_seconds'])
 deadline=min(now_mono+requested,g['deadline_monotonic'],now_mono+wall_end-now_wall)
 need(deadline-now_mono>CLEANUP+30)
 return {'schema':'math-gkm.retention-scan19-remaining-guard.v1','deadline_monotonic':deadline,'guard_started_monotonic':now_mono,'remaining_resource_seconds':resource_seconds,'original_consumed_intent_used_as_evidence_only':True,'original_wall_ceiling':wall_end,'additional_paid_allowance':0,'timing_equivalence_claimed':False}

def _stops(cfg):
 follower=sys.modules.get('__main__');need(follower is not None and Path(getattr(follower,'__file__',''))==OPS/'follow.py' and getattr(follower,'STOPPED',None) is False and _sha(OPS/'follow.py')==cfg['new_follow_sha256'],'actual current follower stop/source differs')
 for p in (OPS/'STOP.json',STUDY/'STOP.json',ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json'):need(not p.exists(),'STOP or cleanup hold')

def _observers():
 global _OBSERVERS
 path=PACKET/'guard_observers.py'
 if _OBSERVERS is None:_OBSERVERS=_load(path,OBSERVER_SHA,'retention_scan19_guard_observers')
 need(_sha(path)==OBSERVER_SHA);return _OBSERVERS

def _inventory(report):
 original=report['native_inventory'];need(set(original) in ({'pids','groups'},{'pids','groups','identities'}))
 if 'identities' in original:inv=original
 else:
  regular=report.get('native_identities',{});special=report.get('privileged_observer_no_birth_identities',{});need(type(regular) is dict and type(special) is dict and not set(regular)&set(special));inv={**original,'identities':{**regular,**special}}
 if 'native_inventory_binding' in report:need(report['native_inventory_binding']==digest(inv))
 pids,groups,ids=inv['pids'],inv['groups'],inv['identities'];need(set(ids)=={str(p) for p in pids})
 for values in (pids,groups):need(type(values) is list and values==sorted(set(values)) and len(values)<=65536 and all(type(x) is int and 0<x<=2147483647 for x in values))
 for pid in pids:
  row=ids[str(pid)];need(row.get('pid')==pid)
  if set(row)=={'pid','birth'}:
   need(type(row['birth']) is str and re.fullmatch('[1-9][0-9]*:[0-9]{1,6}',row['birth']) is not None);seconds,micros=(int(x) for x in row['birth'].split(':'));need(micros<1000000 and row['birth']==f'{seconds}:{micros}');continue
  required={'pid','ppid','executable','euid','ruid','pgid','parent_birth','svuid','argv','full_bsdinfo_errno','public_validator_source_sha256','source_owned_Popen','unreaped_at_observation','public_API_has_no_birth','returncode','identity_kind'}
  need(set(row)==required and row['identity_kind']=='privileged_observer_no_birth' and row['executable']=='/bin/ps' and row['euid']==row['svuid']==0 and row['ruid']==os.getuid() and row['full_bsdinfo_errno']==1 and row['source_owned_Popen'] is True and row['unreaped_at_observation'] is True and row['public_API_has_no_birth'] is True and type(row['returncode']) is int and row['returncode']==0 and row['public_validator_source_sha256'] in (OLD_RESOURCES,NEW_RESOURCES))
  need(tuple(row['argv']) in (('/bin/ps','-axo','pid=,pgid=,stat='),('/bin/ps','-axo','pid=,ppid=,rss=,lstart=,comm=')) and str(row['ppid']) in ids and ids[str(row['ppid'])]=={'pid':row['ppid'],'birth':row['parent_birth']} and row['pgid'] in groups)
 return inv

def _resume(study,checkpoint,owned_outer,tracker):
 need(Path(study)==STUDY)
 with _native().study19_leases(owned_outer) as leases:
  cfg=config();_stops(cfg);w=_witness(cfg);record=applied_lineage();authority=_json(ROOT/'.bootstrap/study-authorization.json');grant=authority.get('retention_scan19_resume',{})
  need(grant.get('schema')=='math-gkm.retention-scan19-resume.v1' and grant.get('authorized') is True and reviewed(grant.get('independent_reviewers')) and grant==checkpoint.get('retention_scan19_resume') and checkpoint.get('phase')=='ready_to_resume_current' and checkpoint.get('current_study')==str(STUDY) and checkpoint.get('next_sequence')==19 and grant.get('next_sequence')==20)
  need(grant.get('record_sha256')==_sha(PACKET/'REVISION.json') and grant.get('config_sha256')==_sha(PACKET/'CONFIG.json') and grant.get('module_sha256')==_sha(Path(__file__)) and grant.get('helper_sha256')==cfg['new_helper_sha256'] and grant.get('follow_sha256')==cfg['new_follow_sha256'])
  need(not checkpoint.get(FIELD) and not (PACKET/INTENT).exists() and not(ROOT/'.scratch/concept-driver-20261020-follow-000020').exists())
  expected={n:record['new_files'][n]['sha256'] for n in STATE_NAMES}
  need(grant.get('study_files_sha256')==expected)
  for n,pin in expected.items():need(_sha(STUDY/n)==pin)
  for mode in ('baseline','exploration'):need(_idle(_state(STUDY/'arms'/mode/'state.json')))
  state=_state(STUDY/'arms/exploration/state.json');meta=_select(state,{'round','phase','status','calls','meta_calls','seconds','protocol_attempts','protocol_reserved_seconds','budget_pools'})
  need(meta['round']==82 and meta['phase']=='research' and meta['status']=='running' and meta['calls']==6 and meta['meta_calls']==4)
  for n in ('jobs/plan-0082','jobs/round-0082','rounds/0082/start.json'):need(not(STUDY/'arms/exploration'/n).exists())
  need(digest(_registry_projection(state))==w['accepted_registry_binding'])
  old_intent=_reference(cfg['consumed19_intent'],OLD_PACKET)
  need(Path(cfg['consumed19_intent']['path'])==OLD_PACKET/'STUDY19_ADMINISTRATIVE_RESUME_INTENT.json')
  verification=_operation(grant['new_verify'],'new_study_verify',NEW_CORE,cfg['new_helper_sha256'],expected,cfg)
  late=_reference(grant['late_closed'],PACKET);need(late.get('schema')=='math-gkm.retention-scan19-final-closed.v1' and late.get('config_sha256')==_sha(PACKET/'CONFIG.json') and late.get('record_sha256')==_sha(PACKET/'REVISION.json') and late.get('study_files_sha256')==expected)
  coverage={'old_effects':w['closed_effects'],'old_immutable_bindings':w['operations']['old_immutable_bindings'],'old_study_verify':w['operations']['old_study_verify'],'new_neutral_readiness':cfg['new_neutral'],'new_study_verify':grant['new_verify']}
  need(late.get('covered_operation_receipts')==coverage)
  complete=_inventory(late);need(late.get('native_inventory_binding')==digest(complete) and (complete['pids'] or complete['groups']))
  old_report=_operation(w['operations']['old_study_verify'],'old_study_verify',OLD_CORE,OLD_HELPER,{n:w['before_files'][n]['sha256'] for n in STATE_NAMES},cfg)
  effects,watchdogs=_old_effects(w,cfg,old_report)
  for kind,row in coverage.items():
   inv=_inventory(_reference(row,operation_scope(kind)));need(set(inv['pids'])<=set(complete['pids']) and set(inv['groups'])<=set(complete['groups']) and all(complete['identities'].get(k)==v for k,v in inv['identities'].items()))
  from machinery import study,study_common
  need(digest(study_common.inventory(STUDY/'arms/exploration/workspace'))==w['mathematical_inventory_binding']);study.verify(STUDY);need(applied_lineage()==record)
  for n,pin in expected.items():need(_sha(STUDY/n)==pin)
  io,member=_native().load_source_pinned_native();observations=[]
  query={'pids':sorted(set(complete['pids'])|set(watchdogs)),'groups':complete['groups']}
  for _ in range(2):
   leases.verify(complete=True);observed=member.observe_closed(query['pids'],query['groups']);_native().validate_closed_observation(query,observed);observations.append(observed)
  current=tracker.finish(old_groups=complete['groups']);need(current['resources_source_sha256']==NEW_RESOURCES)
  # No readiness/headroom/observer-creating operation may follow tracker.finish.
  before_follow=_sha(OPS/'FOLLOW.json');need(_json(OPS/'FOLLOW.json')==checkpoint and _json(ROOT/'.bootstrap/study-authorization.json')==authority)
  _stops(cfg);config();_manifest(w['historical_files'])
  for n,pin in expected.items():need(_sha(STUDY/n)==pin)
  need(digest(study_common.inventory(STUDY/'arms/exploration/workspace'))==w['mathematical_inventory_binding'])
  guard=remaining_deadline(_json(STUDY/'protocol.json'),meta,old_intent,grant.get('maximum_resume_seconds'),time.monotonic(),time.time())
  owner=io.native(os.getpid());need(owner is not None and owner['pgid'] not in complete['groups'])
  payload={'schema':'math-gkm.retention-scan19-resume-intent.v1','study':str(STUDY),'owner':{k:owner[k] for k in ('pid','birth','pgid')},'guard':guard,'consumed19_intent':cfg['consumed19_intent'],'current_guard_observers':current,'closure_observations':observations,'source_bound_watchdog_numbers_without_invented_birth':watchdogs,'record_sha256':_sha(PACKET/'REVISION.json'),'config_sha256':_sha(PACKET/'CONFIG.json'),'source_sha256':_sha(Path(__file__)),'role_replay_authorized':False}
  leases.verify(complete=True);need(_sha(OPS/'FOLLOW.json')==before_follow and _json(ROOT/'.bootstrap/study-authorization.json')==authority);_stops(cfg)
  pointer=_native().exclusive_once(PACKET/INTENT,canonical(payload)+b'\n',under=PACKET)
  # If this post-intent check/write fails, the unique intent stays consumed.
  need(_sha(OPS/'FOLLOW.json')==before_follow);updated={**checkpoint,FIELD:{**pointer,'guard':guard}};raw=canonical(updated)+b'\n';temporary=OPS/'FOLLOW.json.retention-scan19.next'
  _native().exclusive_once(temporary,raw,under=OPS);need(_sha(OPS/'FOLLOW.json')==before_follow);os.replace(temporary,OPS/'FOLLOW.json');fd=os.open(OPS,os.O_RDONLY|os.O_DIRECTORY)
  try:os.fsync(fd)
  finally:os.close(fd)
  need(_raw(OPS/'FOLLOW.json')==raw and guard['deadline_monotonic']-time.monotonic()>CLEANUP+30)
  return guard['deadline_monotonic']

def resume_deadline(study,checkpoint,*,owned_outer):
 global _SETUP_DEADLINE
 need(_SETUP_DEADLINE is None and signal.getitimer(signal.ITIMER_REAL)==(0.0,0.0),'no nested setup/foreign alarm')
 oldhandler=signal.getsignal(signal.SIGALRM)
 def expired(signum,frame):raise RuntimeError('bounded capacity setup expired')
 _SETUP_DEADLINE=time.monotonic()+300
 try:
  signal.signal(signal.SIGALRM,expired);signal.setitimer(signal.ITIMER_REAL,300)
  cfg=config();old=_reference(cfg['consumed19_intent'],OLD_PACKET);g=old['guard'];now=time.monotonic()
  need(finite(g.get('deadline_monotonic')) and finite(g.get('conservative_epoch_deadline_wall')))
  _SETUP_DEADLINE=min(_SETUP_DEADLINE,g['deadline_monotonic']-CLEANUP,now+g['conservative_epoch_deadline_wall']-time.time()-CLEANUP)
  need(_SETUP_DEADLINE>now+30,'original setup/cleanup ceiling exhausted');signal.setitimer(signal.ITIMER_REAL,_SETUP_DEADLINE-now)
  with _observers().GuardObservers19() as tracker:return _resume(study,checkpoint,owned_outer,tracker)
 finally:
  try:signal.setitimer(signal.ITIMER_REAL,0)
  finally:
   try:signal.signal(signal.SIGALRM,oldhandler)
   finally:_SETUP_DEADLINE=None
