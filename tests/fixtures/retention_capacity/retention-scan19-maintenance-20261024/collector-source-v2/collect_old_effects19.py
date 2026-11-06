"""SOURCE ONLY/UNRUN: closed original19 effects collector, no role launch.
Capture never claims its own exit; finalize observes the captured collector gone.
Finalizer writer identity remains explicitly deferred to root/final late closure.
No process-list commands, signals, tools, machinery imports or private JSON decode.
"""
import argparse,hashlib,json,math,os,re,signal,stat,time,types
from pathlib import Path
ROOT=Path('/Users/sasha/math_gkm');OPS=ROOT/'.bootstrap/concept-driver-20261020/general-continuation'
STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000019';OLD=OPS/'retention-scan20-20261024';PACKET=OPS/'retention-scan19-maintenance-20261024'
NATIVE_PATH=OPS/'claim-alias19-maintenance-20261023/native_once19.py'
NATIVE_SHA='701390ce43401f2c009abe8ab18de4ec785a089f96061f8c219251aaf37f30ed'
OLD_CORE='ef2a7656a54fade2d64256ea2ee527f25795f3e90bb1a0ca0c16045e69e10dbe';OLD_HELPER='b421cab41917d0c0d73cd6529ab9db93d207418f910ccf0d59299ba1fd3cf4e0'
LEXICAL_PUBLIC_SOURCE_SHA='61df7a5e607d24b6143c2f86fc93083830d0f501155a5fe310da7beb8800ce01'
JOBS=('plan-0080','round-0080','plan-0081','round-0081','review-source-v1-82','select-82')
LEAVES=('before.json','request.json','spec.json','permissions.json','receipt.json','process.json','watchdog.json','final.json','validated-plan.json')
CAPTURE=PACKET/'OLD_EFFECTS_CAPTURED.json';CLOSED=PACKET/'OLD_EFFECTS_CLOSED.json'
MAX_JSON=64*1024**2;MAX_IDS=65536

def need(ok):
 if not ok:raise RuntimeError('retention-scan19 collector refused')
def canonical(v):return json.dumps(v,sort_keys=True,separators=(',',':'),ensure_ascii=False,allow_nan=False).encode()
def bytesha(v):return hashlib.sha256(v).hexdigest()
def digest(v):return bytesha(canonical(v))
def is_hash(v):return type(v) is str and re.fullmatch('[0-9a-f]{64}',v) is not None
def pid(v):need(type(v) is int and 0<v<=2147483647);return v
def birth(v):
 need(type(v) is str and re.fullmatch('[1-9][0-9]*:[0-9]{1,6}',v) is not None)
 a,b=(int(x) for x in v.split(':'));need(b<1000000 and v==f'{a}:{b}');return v

def source_bytes(path,pin):
 path=Path(path);need(path==NATIVE_PATH)
 flags=os.O_RDONLY|os.O_DIRECTORY|os.O_NOFOLLOW|os.O_CLOEXEC;directory=os.open('/',flags);fd=None
 try:
  for part in path.parent.parts[1:]:fresh=os.open(part,flags,dir_fd=directory);os.close(directory);directory=fresh
  fd=os.open(path.name,os.O_RDONLY|os.O_NOFOLLOW|os.O_CLOEXEC|os.O_NONBLOCK,dir_fd=directory);before=os.fstat(fd)
  need(stat.S_ISREG(before.st_mode) and before.st_uid==os.getuid() and not before.st_mode&0o022 and 0<before.st_size<=1024**2)
  data=b''
  while True:
   b=os.read(fd,65536)
   if not b:break
   data+=b;need(len(data)<=1024**2)
  mark=lambda r:(r.st_dev,r.st_ino,r.st_mode,r.st_uid,r.st_gid,r.st_size,r.st_mtime_ns,r.st_ctime_ns)
  need(mark(before)==mark(os.fstat(fd))==mark(os.stat(path.name,dir_fd=directory,follow_symlinks=False)) and bytesha(data)==pin);return data
 finally:
  if fd is not None:os.close(fd)
  os.close(directory)
def native():
 data=source_bytes(NATIVE_PATH,NATIVE_SHA);m=types.ModuleType('retention_scan19_collector_primitives');m.__file__=str(NATIVE_PATH);exec(compile(data,str(NATIVE_PATH),'exec'),m.__dict__);return m

def read(n,p,pin=None,maximum=MAX_JSON,under=ROOT):
 p=Path(p);need(p.is_absolute() and p.is_relative_to(under))
 h=n.protected_hash(p,under=under,maximum=256*1024**2);need(pin is None or h==pin)
 return n.protected_read(p,h,under=under,maximum=maximum)
def pointer(n,row,under=ROOT):
 need(type(row) is dict and set(row)=={'path','sha256'} and is_hash(row['sha256']));return read(n,Path(row['path']),row['sha256'],under=under)
def merge(ids,key,value):
 key=str(pid(int(key)));need(value.get('pid')==int(key));need(key not in ids or ids[key]==value);ids[key]=value

class Lexical:
 """JSON structural scanner; only explicit public scalar/key tokens decode."""
 def __init__(self,data):self.data=data;self.n=len(data);self.nodes=0;self.ends={};self.objects={};self.paths={}
 def ws(self,i):
  while i<self.n and self.data[i] in b' \t\r\n':i+=1
  return i
 def string_end(self,i):
  need(i<self.n and self.data[i]==34);i+=1
  while i<self.n:
   c=self.data[i];i+=1
   if c==34:return i
   need(c>=32)
   if c==92:
    need(i<self.n);c=self.data[i];i+=1
    if c==117:need(i+4<=self.n and re.fullmatch(b'[0-9a-fA-F]{4}',self.data[i:i+4]) is not None);i+=4
    else:need(c in b'"\\/bfnrt')
  need(False)
 def end(self,i,depth=0):
  i=self.ws(i)
  if i in self.ends:return self.ends[i]
  result=self._end(i,depth);self.ends[i]=result;return result
 def _end(self,i,depth=0):
  self.nodes+=1;need(depth<=128 and self.nodes<=2000000);i=self.ws(i);need(i<self.n);c=self.data[i]
  if c==34:return self.string_end(i)
  if c in (123,91):
   closing=125 if c==123 else 93;i=self.ws(i+1)
   if i<self.n and self.data[i]==closing:return i+1
   while True:
    if c==123:
     i=self.ws(self.string_end(i));need(i<self.n and self.data[i]==58);i=self.ws(i+1)
    i=self.ws(self.end(i,depth+1));need(i<self.n)
    if self.data[i]==closing:return i+1
    need(self.data[i]==44);i=self.ws(i+1)
  match=re.compile(b'(?:null|true|false|-?(?:0|[1-9][0-9]*)(?:\\.[0-9]+)?(?:[eE][+-]?[0-9]+)?)').match(self.data,i)
  need(match is not None);return match.end()
 def members(self,start):
  if start in self.objects:return self.objects[start]
  result=self._members(start);self.objects[start]=result;return result
 def _members(self,start):
  i=self.ws(start);need(self.data[i]==123);i=self.ws(i+1);result={}
  if self.data[i]==125:return result
  while True:
   end=self.string_end(i);key=json.loads(self.data[i:end]);need(type(key) is str and key not in result and len(key)<=4096)
   i=self.ws(end);need(self.data[i]==58);start=self.ws(i+1);end=self.end(start);result[key]=(start,end)
   i=self.ws(end)
   if self.data[i]==125:return result
   need(self.data[i]==44);i=self.ws(i+1)
 def path(self,parts):
  if parts in self.paths:return self.paths[parts]
  span=(self.ws(0),self.end(0));need(self.ws(span[1])==self.n)
  for key in parts:
   members=self.members(span[0]);need(key in members);span=members[key]
  self.paths[parts]=span;return span
 def scalar(self,parts):
  start,end=self.path(parts);need(self.data[start] not in b'{[' and end-start<=512);return json.loads(self.data[start:end])
 def binding(self,parts,count=False):
  start,end=self.path(parts);result={'sha256':bytesha(self.data[start:end])}
  if count:result['count']=len(self.members(start))
  return result

def selected_json(scan,parts):
 a,b=scan.path(parts);return json.loads(scan.data[a:b])
def resource_projection(data):
 scan=Lexical(data);a,b=scan.path(('resources','owned_identities'));members=scan.members(a);ids={}
 for key,(start,end) in members.items():
  need(type(key) is str and key==str(pid(int(key))) and scan.data[start] not in b'{[' and end-start<=128)
  merge(ids,key,{'pid':int(key),'birth':birth(json.loads(scan.data[start:end]))})
 need(0<len(ids)<=MAX_IDS)
 # Only resource-owned identity scalars decode; the receipt body/payload is opaque.
 return ids

def normalized_inventory(report):
 inv=report['native_inventory'];need(type(inv) is dict and set(inv)=={'pids','groups'})
 regular=report['native_identities'];special=report['privileged_observer_no_birth_identities'];need(type(regular) is dict and type(special) is dict and not set(regular)&set(special))
 ids={**regular,**special};need(set(ids)=={str(pid(p)) for p in inv['pids']})
 for key,row in ids.items():
  need(type(row) is dict and row.get('pid')==int(key))
  if set(row)=={'pid','birth'}:birth(row['birth']);continue
  required={'pid','ppid','executable','euid','ruid','pgid','parent_birth','svuid','argv','full_bsdinfo_errno','public_validator_source_sha256','source_owned_Popen','unreaped_at_observation','public_API_has_no_birth','returncode','identity_kind'}
  need(set(row)==required and row['identity_kind']=='privileged_observer_no_birth' and row['executable']=='/bin/ps' and row['euid']==row['svuid']==0 and row['ruid']==os.getuid() and row['full_bsdinfo_errno']==1 and row['source_owned_Popen'] is True and row['unreaped_at_observation'] is True and row['public_API_has_no_birth'] is True and row['returncode']==0 and type(row['returncode']) is int)
  need(row['public_validator_source_sha256']=='341584d8a7d6d29c5f597253f08416f0b7f1d7828962d65f532da71c5f2c238f' and tuple(row['argv']) in (('/bin/ps','-axo','pid=,pgid=,stat='),('/bin/ps','-axo','pid=,ppid=,rss=,lstart=,comm=')))
  need(regular.get(str(row['ppid']))=={'pid':row['ppid'],'birth':row['parent_birth']} and row['pgid'] in inv['groups'])
 groups=sorted({pid(x) for x in inv['groups']});pids=sorted({pid(x) for x in inv['pids']});need(len(pids)==len(inv['pids']) and len(groups)==len(inv['groups']) and len(pids)<=MAX_IDS)
 return {'pids':pids,'groups':groups,'identities':ids}

def old_operation(n,row):
 p=Path(row['path']);need(p.is_relative_to(OLD));report=json.loads(pointer(n,row,OLD))
 need(report.get('schema')=='math-gkm.old100-operation.v1' and report.get('status')=='completed' and report.get('passed') is True and report.get('ordinary_source_verification') is True and report.get('study')==str(STUDY) and report.get('round')==82 and report.get('accepted_count')==100 and report.get('implementation_sha256')==OLD_CORE and report.get('helper_sha256')==OLD_HELPER and report.get('returncode')==0 and report.get('reaped') is True and report.get('termination') is None and report.get('all_inputs_unchanged') is True and report.get('state_and_paid_accounting_unchanged') is True and report.get('no_paid_role_launch') is True and report.get('Popen_restored') is True and report.get('effect_journal_complete') is True and report.get('only_exact_genuine_resources_observation_spawned') is True)
 need(report['before_snapshot_sha256']==report['after_snapshot_sha256']==digest(report['public_frame']))
 for kind in ('old_immutable_bindings','old_study_verify'):need(report['operations'][kind]['completed'] is True)
 for key in ('producer','child_producer','child_report','effect_journal'):pointer(n,report[key],OLD)
 for name,pin in report['sources'].items():need(Path(name).name==name and name.endswith('.py') and is_hash(pin) and n.protected_hash(OLD/name,under=OLD)==pin)
 return report

def owners(n,row):
 value=json.loads(pointer(n,row,PACKET));need(value.get('schema')=='math-gkm.retention-scan19-recorded-owners.v1' and value.get('study')==str(STUDY) and value.get('scope')=='reviewed_recorded_native_owners;not_reconstructed_from_absence')
 rows=value['owners'];need(type(rows) is list and len(rows)==3 and {r['role'] for r in rows}=={'controller','operator','keeper'})
 need(type(value['source_bindings']) is dict and value['source_bindings'])
 for name,pin in value['source_bindings'].items():need(is_hash(pin) and n.protected_hash(Path(name),under=ROOT,maximum=256*1024**2)==pin)
 result={};groups=set()
 for r in rows:need(set(r)=={'role','pid','birth','pgid'});merge(result,str(pid(r['pid'])),{'pid':r['pid'],'birth':birth(r['birth'])});groups.add(pid(r['pgid']))
 return result,groups

def job_inventory(n,report):
 frame=report['public_frame'];tail=frame['terminal_tail'];need(tail.get('exact_accounted_six_jobs') is True and tail.get('calls')==6 and tail.get('meta_calls')==4 and set(tail['terminal_jobs'])==set(JOBS))
 recorded=frame['job_files_sha256'];expected={str((STUDY/'arms/exploration/jobs'/job/leaf).relative_to(ROOT)) for job in JOBS for leaf in LEAVES};need(set(recorded)==expected)
 for name,pin in recorded.items():
  p=ROOT/name
  if pin is None:need(not p.exists() and not p.is_symlink())
  else:need(is_hash(pin) and n.protected_hash(p,under=STUDY,maximum=256*1024**2)==pin)
 ids={};groups=set();watchdogs=[];roots={}
 for job in JOBS:
  base=STUDY/'arms/exploration/jobs'/job;entry=tail['terminal_jobs'][job]
  receipt=read(n,base/'receipt.json',recorded[str((base/'receipt.json').relative_to(ROOT))]);owned=resource_projection(receipt)
  process=Lexical(read(n,base/'process.json',recorded[str((base/'process.json').relative_to(ROOT))],maximum=1024**2));watch=Lexical(read(n,base/'watchdog.json',recorded[str((base/'watchdog.json').relative_to(ROOT))],maximum=1024**2))
  root=pid(process.scalar(('pid',)));watchdog=pid(process.scalar(('watchdog_pid',)));need(watch.scalar(('pid',))==watchdog and root!=watchdog and root==entry['pid'] and watchdog==entry['watchdog_pid'] and owned.get(str(root))=={'pid':root,'birth':entry['owned_root_birth']})
  for key,value in owned.items():merge(ids,key,value)
  groups.add(root);watchdogs.append(watchdog);roots[job]={'pid':root,'birth':entry['owned_root_birth'],'pgid':root,'pgid_evidence':'machinery/study_worker.py:Popen(start_new_session=True); process.json pid=p.pid'}
 need(len(set(watchdogs))==6)
 return {'identities':ids,'groups':groups,'watchdogs':sorted(watchdogs),'roots':roots,'files':recorded,'tail_binding':digest(tail)}

def observe(n,member,inv,watchdogs):
 query={'pids':sorted(set(inv['pids'])|set(watchdogs)),'groups':inv['groups']};result=[]
 for _ in range(2):
  row=member.observe_closed(query['pids'],query['groups']);n.validate_closed_observation(query,row);result.append(row)
 return result

def capture(n,operation_ref,owners_ref):
 report=old_operation(n,operation_ref);job=job_inventory(n,report);born,groups=owners(n,owners_ref);op=normalized_inventory(report);ids=dict(op['identities'])
 for part in (job['identities'],born):
  for key,value in part.items():merge(ids,key,value)
 groups=sorted(set(op['groups'])|job['groups']|groups);inv={'pids':sorted(int(k) for k in ids),'groups':groups,'identities':ids}
 io,member=n.load_source_pinned_native();owner=io.native(os.getpid());need(owner is not None and owner['pid'] not in inv['pids'] and owner['pgid'] not in inv['groups'])
 observations=observe(n,member,inv,job['watchdogs'])
 need(old_operation(n,operation_ref)==report)
 for name,pin in job['files'].items():
  if pin is not None:need(n.protected_hash(ROOT/name,under=STUDY,maximum=256*1024**2)==pin)
 body={'schema':'math-gkm.retention-scan19-old-effects-capture.v1','study':str(STUDY),'closed':False,'recorded_effects_closed_at_capture':True,'old100_operation':operation_ref,'recorded_owners':owners_ref,'job_files_sha256':job['files'],'terminal_tail_binding':job['tail_binding'],'known_birthless_watchdog_pids':job['watchdogs'],'native_inventory':inv,'native_inventory_binding':digest(inv),'worker_roots':job['roots'],'membership_observations':observations,'collector_identity_closure_deferred':{k:owner[k] for k in ('pid','birth','pgid')},'group_scope':'source-proven six worker private groups plus recorded old100 and original-owner groups; no whole-host or reconstructed historical group claim','all_observed_inputs_rehashed':True,'ordinary_source_verification_replayed':False,'role_or_compiler_or_model_calls':0,'source':{'path':str(Path(__file__)),'sha256':n.protected_hash(Path(__file__),under=ROOT)},'native_sources':n.NATIVE_PINS,'native_protected_reader_sha256':NATIVE_SHA}
 n.exclusive_once(CAPTURE,canonical(body)+b'\n',under=PACKET)
 return {'status':'captured_deferred_own_exit','path':str(CAPTURE),'sha256':bytesha(canonical(body)+b'\n'),'closed':False}

def finalize(n,capture_sha):
 need(is_hash(capture_sha));captured=json.loads(read(n,CAPTURE,capture_sha,under=PACKET));need(captured.get('schema')=='math-gkm.retention-scan19-old-effects-capture.v1' and captured.get('closed') is False and captured.get('recorded_effects_closed_at_capture') is True)
 report=old_operation(n,captured['old100_operation']);job=job_inventory(n,report);need(job['files']==captured['job_files_sha256'] and job['tail_binding']==captured['terminal_tail_binding'] and job['watchdogs']==captured['known_birthless_watchdog_pids'])
 recorded_born,recorded_groups=owners(n,captured['recorded_owners']);need(captured.get('native_protected_reader_sha256')==NATIVE_SHA and captured.get('native_sources')==n.NATIVE_PINS)
 need(captured.get('source')=={'path':str(Path(__file__)),'sha256':n.protected_hash(Path(__file__),under=ROOT)})
 inv=captured['native_inventory'];need(captured['native_inventory_binding']==digest(inv) and all(inv['identities'].get(k)==v for k,v in recorded_born.items()) and recorded_groups<=set(inv['groups']));inv=json.loads(canonical(inv));owner=captured['collector_identity_closure_deferred'];merge(inv['identities'],str(owner['pid']),{'pid':owner['pid'],'birth':birth(owner['birth'])});inv['pids']=sorted(set(inv['pids'])|{pid(owner['pid'])});inv['groups']=sorted(set(inv['groups'])|{pid(owner['pgid'])})
 io,member=n.load_source_pinned_native();writer=io.native(os.getpid());need(writer is not None and writer['pid'] not in inv['pids'] and writer['pgid'] not in inv['groups'])
 observations=observe(n,member,inv,job['watchdogs'])
 need(bytesha(read(n,CAPTURE,capture_sha,under=PACKET))==capture_sha and old_operation(n,captured['old100_operation'])==report)
 body={**captured,'schema':'math-gkm.retention-scan19-old-effects-closed.v1','closed':True,'native_inventory':inv,'native_inventory_binding':digest(inv),'membership_observations':observations,'capture':{'path':str(CAPTURE),'sha256':capture_sha},'collector_identity_closure_deferred':None,'metadata_writer_identity_closure_deferred':{k:writer[k] for k in ('pid','birth','pgid')},'own_writer_exit_claimed':False,'scope':'all recorded source-bound effects including exited capture collector; this metadata writer requires external late/root closure'}
 n.exclusive_once(CLOSED,canonical(body)+b'\n',under=PACKET)
 return {'status':'closed_recorded_effects_writer_deferred','path':str(CLOSED),'sha256':bytesha(canonical(body)+b'\n'),'closed':True,'metadata_writer_exit_claimed':False}

def private_collector_group():
 if os.getpgrp()!=os.getpid():os.setsid()
 need(os.getpgrp()==os.getpid())

def main():
 need(Path.cwd()==ROOT and signal.getitimer(signal.ITIMER_REAL)==(0.0,0.0));parser=argparse.ArgumentParser();sub=parser.add_subparsers(dest='mode',required=True)
 c=sub.add_parser('capture');c.add_argument('--old100',required=True);c.add_argument('--old100-sha',required=True);c.add_argument('--owners',required=True);c.add_argument('--owners-sha',required=True)
 f=sub.add_parser('finalize');f.add_argument('--capture-sha',required=True);args=parser.parse_args();old=signal.getsignal(signal.SIGALRM)
 def expired(number,frame):raise RuntimeError('bounded collector expired')
 try:
  signal.signal(signal.SIGALRM,expired);signal.setitimer(signal.ITIMER_REAL,180);private_collector_group();n=native()
  result=capture(n,{'path':args.old100,'sha256':args.old100_sha},{'path':args.owners,'sha256':args.owners_sha}) if args.mode=='capture' else finalize(n,args.capture_sha)
  print(json.dumps(result,sort_keys=True))
 finally:
  try:signal.setitimer(signal.ITIMER_REAL,0)
  finally:signal.signal(signal.SIGALRM,old)
if __name__=='__main__':
 try:main()
 except Exception as error:
  print(json.dumps({'status':'refused','public_error_class':type(error).__name__,'private_or_request_content_emitted':False},sort_keys=True));raise SystemExit(1)
