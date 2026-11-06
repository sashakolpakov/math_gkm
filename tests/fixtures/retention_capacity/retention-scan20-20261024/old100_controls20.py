"""UNRUN source-only old100 metadata controls. No machinery import or role launch.
Only this module's explicit prepare CLI may create the new immutable input file.
Private mixed JSON is lexically skipped, never passed to json.loads.
"""
import argparse,hashlib,json,os,re,stat,sys,types
from pathlib import Path
sys.dont_write_bytecode=True
ROOT=Path('/Users/sasha/math_gkm')
OPS=ROOT/'.bootstrap/concept-driver-20261020/general-continuation'
PACKET=OPS/'retention-scan20-20261024'
OLD=OPS/'claim-alias19-maintenance-20261023'
STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000019'
MATH='70edbe288a6dd9a07ac57514013e30b758908abf67619fb28b43e76d854638bb'
CORE='ef2a7656a54fade2d64256ea2ee527f25795f3e90bb1a0ca0c16045e69e10dbe'
HELPER='b421cab41917d0c0d73cd6529ab9db93d207418f910ccf0d59299ba1fd3cf4e0'
CONTEXT='fd4addceb61ece31d8f224ff23ca1624a0c8975d5ec3b0a858211c566e27dce9'
RESOURCES='341584d8a7d6d29c5f597253f08416f0b7f1d7828962d65f532da71c5f2c238f'
PROFILE='fa7318100cea3a6bd4f06f96a2dd87249bb18339a9d259333ac3f40ac5c9411a'
PROFILE_PATH=ROOT/'config/darwin-memory-profile-007.json'
GUARD='79cb3a0af21d757291a46857b3aa38a51f493f22c521f734fdd039a93fbdb720'
NATIVE='71ee7452c2a1c0b9846dd58ef384a0a76e097fab38ddc6aefa931f21a5ea13cf'
MEMBER='92b2b5cca906b27ba6837fb16991461cdb5d49096552c2ed746f0ba67f51c96c'
NATIVE_DIR=OPS/'prompt-transport-maintenance-20261023/lineage-finalization'
AUTH=ROOT/'.bootstrap/study-authorization.json'
SOURCES=('old100_controls20.py','old100_effects20.py','old100_verify20.py','old100_outer20.py')
JOBS=('plan-0080','round-0080','plan-0081','round-0081','review-source-v1-82','select-82')
JOB_FILES=('before.json','request.json','spec.json','permissions.json','receipt.json','process.json','watchdog.json','final.json','validated-plan.json')
FIXED=(STUDY/'seal.json',STUDY/'protocol.json',STUDY/'CONTINUATION_PROVENANCE.json',
 STUDY/'MIGRATION_FINISHED.json',STUDY/'MIGRATION_INITIAL_STATE.json',
 STUDY/'arms/baseline/state.json',STUDY/'arms/exploration/state.json',
 OPS/'FOLLOW.json',AUTH,OLD/'CONFIG.json',OLD/'REVISION.json',OLD/'revision_guard.py',
 OPS/'continue_machine.py',OPS/'follow.py',OPS/'test_continue_machine.py',PROFILE_PATH,
 OLD/'guard_observers19.py',NATIVE_DIR/'native_io.py',NATIVE_DIR/'native_membership.py')
INPUT=PACKET/'OLD100_INPUTS.json'
MAX_METADATA=32*1024**2

def need(ok):
 if not ok:raise RuntimeError('old100 metadata contract refused')
def canonical(value):return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False,allow_nan=False).encode()
def digest(value):return hashlib.sha256(canonical(value)).hexdigest()
def bytesha(value):return hashlib.sha256(value).hexdigest()
def fingerprint(row):return (row.st_dev,row.st_ino,row.st_mode,row.st_uid,row.st_gid,row.st_nlink,row.st_size,row.st_mtime_ns,row.st_ctime_ns)
def raw(path,maximum=MAX_METADATA):
 path=Path(path);need(path.is_absolute() and '..' not in path.parts and type(maximum) is int and 0<maximum<=256*1024**2)
 flags=os.O_RDONLY|os.O_DIRECTORY|os.O_NOFOLLOW|os.O_CLOEXEC;directory=os.open('/',flags);fd=None
 try:
  for part in path.parent.parts[1:]:
   fresh=os.open(part,flags,dir_fd=directory);os.close(directory);directory=fresh
  fd=os.open(path.name,os.O_RDONLY|os.O_NOFOLLOW|os.O_CLOEXEC|os.O_NONBLOCK,dir_fd=directory)
  before=os.fstat(fd);need(stat.S_ISREG(before.st_mode) and before.st_uid in (0,os.getuid()) and not before.st_mode&0o022 and 0<=before.st_size<=maximum)
  chunks=[];total=0
  while True:
   block=os.read(fd,min(65536,maximum+1-total))
   if not block:break
   chunks.append(block);total+=len(block);need(total<=maximum)
  need(total==before.st_size and fingerprint(before)==fingerprint(os.fstat(fd)) and fingerprint(before)==fingerprint(os.stat(path.name,dir_fd=directory,follow_symlinks=False)))
  return b''.join(chunks)
 finally:
  if fd is not None:os.close(fd)
  os.close(directory)
def sha(path,maximum=MAX_METADATA):return bytesha(raw(path,maximum))
def private(path,pin,name):
 data=raw(path);need(bytesha(data)==pin)
 module=types.ModuleType(name);module.__file__=str(path);exec(compile(data,str(path),'exec'),module.__dict__);return module
def exclusive(path,data):
 need(type(data) is bytes and len(data)<=1024**2 and path.is_absolute() and '..' not in path.parts and path.is_relative_to(PACKET))
 flags=os.O_RDONLY|os.O_DIRECTORY|os.O_NOFOLLOW|os.O_CLOEXEC;directory=os.open('/',flags);fd=None
 try:
  for part in path.parent.parts[1:]:
   fresh=os.open(part,flags,dir_fd=directory);os.close(directory);directory=fresh
  fd=os.open(path.name,os.O_WRONLY|os.O_CREAT|os.O_EXCL|os.O_NOFOLLOW|os.O_CLOEXEC,0o400,dir_fd=directory)
  written=0
  while written<len(data):
   count=os.write(fd,data[written:]);need(count>0);written+=count
  os.fsync(fd);os.fsync(directory)
 finally:
  if fd is not None:os.close(fd)
  os.close(directory)

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

def scalar_array(scan,parts):
 start,end=scan.path(parts);data=scan.data;need(data[start]==91);i=scan.ws(start+1);values=[]
 if data[i]==93:return values
 while True:
  stop=scan.end(i);need(data[i] not in b'{[' and stop-i<=512 and len(values)<128)
  values.append(json.loads(data[i:stop]));i=scan.ws(stop)
  if data[i]==93:need(i+1==end);return values
  need(data[i]==44);i=scan.ws(i+1)

def canonical_receipt_digest(data):
 """Match consume(read(receipt)) without decoding any private body span.

 Guard emits owned_identities with int PID keys. write sorts those numerically;
 read converts them to strings, so consume/digest sorts them lexicographically.
 This source-derived public metadata map is the sole adjusted span.
 """
 scan=Lexical(data);need(data[:1]==b'{' and data[-1:]==b'\n' and scan.end(0)==len(data)-1)
 start,end=scan.path(('resources','owned_identities'));members=scan.members(start)
 owned={key:scan.scalar(('resources','owned_identities',key)) for key in members}
 return bytesha(data[:start]+canonical(owned)+data[end:-1])

def validate_terminal_tail(state_data,job_names,bundles):
 """Pure, whitelisted scalar validation; payload bodies remain byte spans."""
 need(type(job_names) in (tuple,list) and len(job_names)==len(JOBS) and set(job_names)==set(JOBS) and set(bundles)==set(JOBS))
 state=Lexical(state_data);base=('state',);calls=state.scalar(base+('calls',));meta=state.scalar(base+('meta_calls',))
 need(type(calls) is int and calls==6 and type(meta) is int and meta==4)
 counted=scalar_array(state,base+('counted_jobs',));receipts=scalar_array(state,base+('receipts',))
 paths={name:str(STUDY/'arms/exploration/jobs'/name) for name in JOBS}
 need(all(type(name) is str for name in counted+receipts) and len(counted)==len(set(counted))==6 and set(counted)==set(JOBS) and len(receipts)==len(set(receipts))==6 and set(receipts)==set(paths.values()))
 hashes=state.members(state.path(base+('receipt_hashes',))[0]);need(set(hashes)==set(paths.values()))
 expected_roles={'plan-0080':'proposer','round-0080':'researcher','plan-0081':'proposer','round-0081':'researcher','review-source-v1-82':'reviewer','select-82':'selector'}
 result={}
 for name in JOBS:
  bundle=bundles[name];need(set(bundle)=={'request','spec','receipt','process','watchdog'})
  scans={key:Lexical(value) for key,value in bundle.items()};receipt=scans['receipt'];spec=scans['spec'];request=scans['request'];process=scans['process'];watchdog=scans['watchdog']
  expected_role=expected_roles[name]
  need(all(scans[key].scalar(('request_id',))==name for key in ('request','spec','receipt')) and spec.scalar(('role',))==receipt.scalar(('role',))==expected_role)
  if 'role' in request.members(request.path(())[0]):need(request.scalar(('role',))==expected_role)
  outcome=receipt.scalar(('outcome',));rc=receipt.scalar(('returncode',));expected_outcome,expected_rc=('output_budget_exceeded',-9) if name=='review-source-v1-82' else ('completed',0)
  need(type(outcome) is str and outcome==expected_outcome and type(rc) is int and rc==expected_rc)
  pid=process.scalar(('pid',));watchdog_pid=process.scalar(('watchdog_pid',));watchdog_record_pid=watchdog.scalar(('pid',))
  need(type(pid) is int and pid>0 and type(watchdog_pid) is int and watchdog_pid>0 and watchdog_pid!=pid and type(watchdog_record_pid) is int and watchdog_record_pid==watchdog_pid)
  root_birth=receipt.scalar(('resources','owned_identities',str(pid)));need(type(root_birth) is str and re.fullmatch('[0-9]+:[0-9]+',root_birth) is not None)
  canonical_digest=canonical_receipt_digest(bundle['receipt']);stored=state.scalar(base+('receipt_hashes',paths[name]))
  need(type(stored) is str and stored==canonical_digest)
  result[name]={'request_id':name,'role':expected_role,'outcome':outcome,'returncode':rc,'canonical_receipt_sha256':canonical_digest,'pid':pid,'watchdog_pid':watchdog_pid,'owned_root_birth':root_birth}
 return {'calls':calls,'meta_calls':meta,'counted_jobs':counted,'receipt_names':receipts,'terminal_jobs':result,'exact_accounted_six_jobs':True}

def public_state(path,exploration):
 scan=Lexical(raw(path));base=('state',);members=scan.members(scan.path(base)[0])
 values={key:scan.scalar(base+(key,)) for key in ('round','phase','status','active','resolution')}
 values['active_intent']=scan.scalar(base+('active_intent',)) if 'active_intent' in members else None
 values['accounting']={key:scan.binding(base+(key,)) for key in ('calls','meta_calls','seconds','receipts','receipt_hashes','counted_jobs','reservations','budget_pools','controller_active_seconds') if key in members}
 research=scan.members(scan.path(base+('research',))[0])
 values['accepted_registry']={key:scan.binding(base+('research',key),True) for key in ('knowledge','components') if key in research}
 if exploration:
  need(values['round']==82 and values['phase']=='research' and values['status']=='running' and all(values[key] is None for key in ('active','active_intent','resolution')))
  need(sum(row['count'] for row in values['accepted_registry'].values())==100)
 return values

def stop_clear():
 need(not (OPS/'STOP.json').exists() and not (STUDY/'STOP.json').exists() and not (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists())
def snapshot():
 stop_clear();need(stat.S_IMODE(AUTH.stat().st_mode)==0o400)
 implementation={str(p.relative_to(ROOT)):sha(p) for p in sorted((ROOT/'machinery').glob('*.py'))+sorted((ROOT/'MathGKM').glob('*.lean'))+[ROOT/'config/study-base-permissions.json']}
 need(len(implementation)==76 and digest(implementation)==CORE and implementation['machinery/resources.py']==RESOURCES and implementation['machinery/study_context.py']==CONTEXT and sha(OPS/'continue_machine.py')==HELPER and sha(PROFILE_PATH)==PROFILE and sha(OLD/'guard_observers19.py')==GUARD and sha(NATIVE_DIR/'native_io.py')==NATIVE and sha(NATIVE_DIR/'native_membership.py')==MEMBER)
 jobs=STUDY/'arms/exploration/jobs';need(sorted(p.name for p in jobs.iterdir())==sorted(JOBS) and all((jobs/name).is_dir() and not (jobs/name).is_symlink() for name in JOBS))
 frame={str(p.relative_to(ROOT)):sha(p) for p in FIXED}
 jobframe={}
 for name in JOBS:
  for filename in JOB_FILES:
   path=jobs/name/filename;jobframe[str(path.relative_to(ROOT))]=sha(path) if path.exists() else None
  need(jobframe[str((jobs/name/'spec.json').relative_to(ROOT))] is not None and jobframe[str((jobs/name/'receipt.json').relative_to(ROOT))] is not None)
 bundles={name:{kind:raw(jobs/name/(kind+'.json')) for kind in ('request','spec','receipt','process','watchdog')} for name in JOBS}
 terminal_tail=validate_terminal_tail(raw(STUDY/'arms/exploration/state.json'),JOBS,bundles)
 return {'terminal_tail':terminal_tail,'study':str(STUDY),'implementation':implementation,'implementation_sha256':CORE,'helper_sha256':HELPER,'context_sha256':CONTEXT,'profile_sha256':PROFILE,'authority_mode':'0400','frame_sha256':frame,'job_files_sha256':jobframe,'job_names':list(JOBS),'baseline':public_state(STUDY/'arms/baseline/state.json',False),'exploration':public_state(STUDY/'arms/exploration/state.json',True)}
def source_pins():return {name:sha(PACKET/name,1024**2) for name in SOURCES}
def inputs(pin,seconds):
 need(type(seconds) is int and 10<=seconds<=1770 and re.fullmatch('[0-9a-f]{64}',pin) is not None and stat.S_IMODE(INPUT.stat().st_mode)==0o400)
 data=raw(INPUT,1024**2);need(bytesha(data)==pin);plan=json.loads(data)
 need(data==canonical(plan)+b'\n' and set(plan)=={'schema','seconds','snapshot','sources','mathematical_inventory_binding'} and plan['schema']=='math-gkm.old100-inputs.v1' and plan['seconds']==seconds and type(plan['seconds']) is int and plan['sources']==source_pins() and plan['snapshot']==snapshot() and plan['mathematical_inventory_binding']==MATH)
 return plan

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--prepare-inputs',action='store_true',required=True);parser.add_argument('--seconds',type=int,default=600);args=parser.parse_args()
 need(Path.cwd()==ROOT and Path(__file__).resolve()==PACKET/SOURCES[0] and 10<=args.seconds<=1770 and not INPUT.exists())
 need(not any(name=='machinery' or name.startswith('machinery.') for name in sys.modules))
 plan={'schema':'math-gkm.old100-inputs.v1','seconds':args.seconds,'snapshot':snapshot(),'sources':source_pins(),'mathematical_inventory_binding':MATH}
 data=canonical(plan)+b'\n';exclusive(INPUT,data)
 print(canonical({'schema':'math-gkm.old100-input-preparation.v1','passed':True,'input_sha256':bytesha(data),'accepted_count':100,'round':82}).decode())
if __name__=='__main__':
 try:main()
 except BaseException:
  print('{"schema":"math-gkm.old100-input-preparation.v1","passed":false,"error":"sanitized_metadata_failure"}');raise SystemExit(2)
