"""UNRUN pure collector controls: selected AST and synthetic in-memory IO only."""
import ast,hashlib,json,re,types,unittest
from pathlib import Path,PurePosixPath
STAGE=Path('/private/tmp/math-gkm-retention-scan19-runtime-20261024/collector/v2')
SOURCE_SHA='9050091b8d055a7d396a029bd3428fb436ad7d63bf2a18b8209232da2ca72526'
class VirtualPath(PurePosixPath):
 def exists(self):return False
 def is_symlink(self):return False

def load():
 raw=(STAGE/'collect_old_effects19.py').read_bytes();assert hashlib.sha256(raw).hexdigest()==SOURCE_SHA;t=ast.parse(raw)
 functions={'need','canonical','bytesha','digest','is_hash','pid','birth','merge','selected_json','resource_projection','normalized_inventory','job_inventory','capture','finalize','private_collector_group'}
 constants={'ROOT','OPS','STUDY','OLD','PACKET','NATIVE_SHA','JOBS','LEAVES','CAPTURE','CLOSED','MAX_IDS'}
 nodes=[n for n in t.body if (isinstance(n,ast.FunctionDef) and n.name in functions) or (isinstance(n,ast.ClassDef) and n.name=='Lexical') or (isinstance(n,ast.Assign) and all(isinstance(x,ast.Name) and x.id in constants for x in n.targets))]
 ns={'Path':VirtualPath,'hashlib':hashlib,'json':json,'re':re,'os':types.SimpleNamespace(getuid=lambda:501),'__file__':'/synthetic/collector.py'}
 exec(compile(ast.Module(body=nodes,type_ignores=[]),'<pinned-pure-collector>','exec'),ns);return ns

class CollectorControls(unittest.TestCase):
 def test_resources_only_projection_never_decodes_private_body(self):
  g=load();seen=[]
  def safe_loads(raw):
   data=raw.encode() if isinstance(raw,str) else raw
   self.assertNotIn(b'PRIVATE',data);seen.append(data);return json.loads(raw)
  g['json']=types.SimpleNamespace(loads=safe_loads,dumps=json.dumps)
  raw=json.dumps({'resources':{'owned_identities':{'101':'1792840520:185712','102':'1792840520:185713'}},'payload':{'PRIVATE_MATH_KEY':'PRIVATE_BODY'}}).encode()
  result=g['resource_projection'](raw);self.assertEqual(set(result),{'101','102'});self.assertEqual(result['101'],{'pid':101,'birth':'1792840520:185712'});self.assertTrue(seen)
 def test_invalid_birth_pid_and_conflicting_identity_refused(self):
  g=load()
  for value in ('0:1','1792840520:000001','1792840520:1000000',True,None):
   with self.subTest(value=value),self.assertRaises(RuntimeError):g['birth'](value)
  for value in (True,0,-1,2147483648,1.0):
   with self.assertRaises(RuntimeError):g['pid'](value)
  ids={'101':{'pid':101,'birth':'1792840520:1'}}
  with self.assertRaises(RuntimeError):g['merge'](ids,'101',{'pid':101,'birth':'1792840520:2'})
 def test_native_operation_split_preserves_privileged_no_birth(self):
  g=load();special={'pid':102,'ppid':101,'executable':'/bin/ps','euid':0,'svuid':0,'ruid':501,'pgid':101,'parent_birth':'1792840520:1','argv':['/bin/ps','-axo','pid=,pgid=,stat='],'full_bsdinfo_errno':1,'public_validator_source_sha256':'341584d8a7d6d29c5f597253f08416f0b7f1d7828962d65f532da71c5f2c238f','source_owned_Popen':True,'unreaped_at_observation':True,'public_API_has_no_birth':True,'returncode':0,'identity_kind':'privileged_observer_no_birth'}
  report={'native_inventory':{'pids':[101,102],'groups':[101]},'native_identities':{'101':{'pid':101,'birth':'1792840520:1'}},'privileged_observer_no_birth_identities':{'102':special}}
  inv=g['normalized_inventory'](report);self.assertEqual(inv['identities']['102'],special);self.assertNotIn('birth',inv['identities']['102'])
  special['parent_birth']='1792840520:9'
  with self.assertRaises(RuntimeError):g['normalized_inventory'](report)
 def test_job_projection_binds_all_resources_and_worker_groups(self):
  g=load();files={};tail={};frame={};allowed=[]
  def encode(x):return json.dumps(x,sort_keys=True,separators=(',',':')).encode()+b'\n'
  for i,name in enumerate(g['JOBS']):
   root=101+i;watch=201+i;base=g['STUDY']/'arms/exploration/jobs'/name
   receipt=encode({'resources':{'owned_identities':{str(root):'1792840520:1',str(1001+i):'1792840520:2'}},'payload':{'PRIVATE_MATH':'PRIVATE_BODY'}})
   parts={'receipt.json':receipt,'process.json':encode({'pid':root,'watchdog_pid':watch}),'watchdog.json':encode({'pid':watch}),'request.json':b'PRIVATE_OPAQUE_REQUEST','spec.json':b'PRIVATE_OPAQUE_SPEC'}
   for leaf in g['LEAVES']:
    p=base/leaf;data=parts.get(leaf);frame[str(p.relative_to(g['ROOT']))]=None if data is None else hashlib.sha256(data).hexdigest()
    if data is not None:files[str(p)]=data
   allowed += [str(base/leaf) for leaf in ('receipt.json','process.json','watchdog.json')]
   tail[name]={'pid':root,'watchdog_pid':watch,'owned_root_birth':'1792840520:1'}
  class Fake:
   def protected_hash(self,p,**kw):return hashlib.sha256(files[str(p)]).hexdigest()
  def fake_read(n,p,pin=None,**kw):
   self.assertIn(str(p),allowed);data=files[str(p)];self.assertEqual(hashlib.sha256(data).hexdigest(),pin);return data
  g['read']=fake_read;report={'public_frame':{'terminal_tail':{'exact_accounted_six_jobs':True,'calls':6,'meta_calls':4,'terminal_jobs':tail},'job_files_sha256':frame}}
  result=g['job_inventory'](Fake(),report);self.assertEqual(len(result['identities']),12);self.assertEqual(result['groups'],set(range(101,107)));self.assertEqual(result['watchdogs'],list(range(201,207)))
  tail[g['JOBS'][0]]['owned_root_birth']='1792840520:9'
  with self.assertRaises(RuntimeError):g['job_inventory'](Fake(),report)
 def test_capture_and_finalize_defer_only_the_actual_writer(self):
  g=load();events=[]
  class PrivateGroup:
   group=7
   def getpid(self):return 99
   def getpgrp(self):return self.group
   def setsid(self):events.append('setsid');self.group=99
   def getuid(self):return 501
  group=PrivateGroup();g['os']=group;g['private_collector_group']();self.assertEqual(group.group,99);self.assertEqual(events,['setsid']);g['private_collector_group']();self.assertEqual(events,['setsid'])
  tree=ast.parse((STAGE/'collect_old_effects19.py').read_bytes());main=next(n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name=='main');calls={n.func.id:n.lineno for n in ast.walk(main) if isinstance(n,ast.Call) and isinstance(n.func,ast.Name) and n.func.id in {'private_collector_group','native','capture','finalize'}}
  self.assertLess(calls['private_collector_group'],calls['capture']);self.assertLessEqual(calls['private_collector_group'],calls['native']);self.assertLess(calls['private_collector_group'],calls['finalize'])
  store={};queries=[];base_report={'native_inventory':{'pids':[11],'groups':[11]},'native_identities':{'11':{'pid':11,'birth':'1792840520:1'}},'privileged_observer_no_birth_identities':{}}
  job={'identities':{'12':{'pid':12,'birth':'1792840520:2'}},'groups':{12},'watchdogs':list(range(201,207)),'roots':{},'files':{},'tail_binding':'a'*64};born={'13':{'pid':13,'birth':'1792840520:3'}}
  g['old_operation']=lambda n,row:base_report;g['job_inventory']=lambda n,r:job;g['owners']=lambda n,row:(born,{13})
  g['observe']=lambda n,m,inv,w:(queries.append(inv.copy()) or [])
  def fake_read(n,p,pin=None,**kw):
   data=store[str(p)];self.assertEqual(hashlib.sha256(data).hexdigest(),pin);return data
  g['read']=fake_read
  class Fake:
   NATIVE_PINS={'native_io':'1'*64,'native_membership':'2'*64}
   owner={'pid':99,'birth':'1792840520:4','pgid':99}
   def load_source_pinned_native(self):return types.SimpleNamespace(native=lambda p:self.owner),None
   def protected_hash(self,p,**kw):return '0'*64
   def exclusive_once(self,p,data,**kw):self_result={'path':str(p),'sha256':hashlib.sha256(data).hexdigest()};store[str(p)]=data;return self_result
  n=Fake();operation={'path':'/synthetic/old100','sha256':'a'*64};owners={'path':'/synthetic/owners','sha256':'b'*64}
  captured=g['capture'](n,operation,owners);body=json.loads(store[str(g['CAPTURE'])]);self.assertFalse(body['closed']);self.assertEqual(body['collector_identity_closure_deferred']['pid'],99);self.assertNotIn(99,body['native_inventory']['pids'])
  n.owner={'pid':100,'birth':'1792840520:5','pgid':100};closed=g['finalize'](n,captured['sha256']);final=json.loads(store[str(g['CLOSED'])]);self.assertTrue(closed['closed']);self.assertIn(99,final['native_inventory']['pids']);self.assertIn(99,final['native_inventory']['groups']);self.assertNotIn(100,final['native_inventory']['pids']);self.assertEqual(final['metadata_writer_identity_closure_deferred']['pid'],100);self.assertFalse(final['own_writer_exit_claimed']);self.assertEqual(len(queries),2)
if __name__=='__main__':unittest.main(verbosity=2)
