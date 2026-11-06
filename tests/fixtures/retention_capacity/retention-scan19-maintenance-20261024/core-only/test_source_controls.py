"""UNRUN pure exact-source controls; synthetic iteration only, no host walks."""
import ast,hashlib,json,unittest
from pathlib import Path
from types import SimpleNamespace
STAGE=Path('/private/tmp/math-gkm-retention-scan19-source-20261024/core-only')
BEFORE_SHA='341584d8a7d6d29c5f597253f08416f0b7f1d7828962d65f532da71c5f2c238f'
CANDIDATE_SHA='6103109a36645809fd36cf9d3e963a30604463abb7b3d6614ddab25675e033cc'
MAP_SHA='84efdb13e4c8599887328725ccb0270f3b4571bd9f0627d1b8dab39e09779806'
OLD_CORE='ef2a7656a54fade2d64256ea2ee527f25795f3e90bb1a0ca0c16045e69e10dbe'
NEW_CORE='996d37b699ebeff1f2966ab19268ded7c9b370f4c84362da76e99de23adce2ce'
def digest(v):return hashlib.sha256(json.dumps(v,sort_keys=True,separators=(',',':'),ensure_ascii=False,allow_nan=False).encode()).hexdigest()
def sources():
 a=(STAGE/'resources.before.py').read_bytes();b=(STAGE/'resources.candidate.py').read_bytes();m=(STAGE/'CORE_MAPS.json').read_bytes()
 assert hashlib.sha256(a).hexdigest()==BEFORE_SHA
 assert hashlib.sha256(b).hexdigest()==CANDIDATE_SHA
 assert hashlib.sha256(m).hexdigest()==MAP_SHA
 return a,b,json.loads(m)
def constant(t,name):
 rows=[n for n in t.body if isinstance(n,ast.Assign) and any(isinstance(x,ast.Name) and x.id==name for x in n.targets)]
 assert len(rows)==1
 return ast.literal_eval(rows[0].value)
class SyntheticResourceFailure(RuntimeError):pass
class SyntheticStat:st_size=1
class SyntheticPath:
 name='own'
 def __init__(self,*args):pass
 def __truediv__(self,name):return self
 def is_symlink(self):return False
 def stat(self):return SyntheticStat()
def selected(raw,count):
 t=ast.parse(raw);nodes=[n for n in t.body if isinstance(n,ast.FunctionDef) and n.name in {'_disk_bytes','disk_bytes'}]
 assert len(nodes)==2
 ns={'os':SimpleNamespace(walk=lambda root,**kw:iter([('own',[],range(count))])), 'Path':SyntheticPath,
     'ResourceFailure':SyntheticResourceFailure,'RETENTION_SCAN_ENTRY_LIMIT':constant(t,'RETENTION_SCAN_ENTRY_LIMIT'),
     'DISK_SCAN_ENTRY_LIMIT':constant(t,'DISK_SCAN_ENTRY_LIMIT')}
 exec(compile(ast.fix_missing_locations(ast.Module(body=nodes,type_ignores=[])),'<pinned-pure-resource-functions>','exec'),ns)
 return ns
class SourceControls(unittest.TestCase):
 def test_only_literal_retention_constant_changes(self):
  a,b,_=sources();self.assertEqual(a.count(b'RETENTION_SCAN_ENTRY_LIMIT = 250000\n'),1)
  self.assertEqual(b,a.replace(b'RETENTION_SCAN_ENTRY_LIMIT = 250000\n',b'RETENTION_SCAN_ENTRY_LIMIT = 1000000\n'))
  self.assertEqual(constant(ast.parse(a),'RETENTION_SCAN_ENTRY_LIMIT'),250000)
  self.assertEqual(constant(ast.parse(b),'RETENTION_SCAN_ENTRY_LIMIT'),1000000)
  self.assertEqual(constant(ast.parse(a),'DISK_SCAN_ENTRY_LIMIT'),100000)
  self.assertEqual(constant(ast.parse(b),'DISK_SCAN_ENTRY_LIMIT'),100000)
 def test_full76_exactly_one_source_delta(self):
  a,b,m=sources();self.assertEqual(len(m['old_implementation']),76)
  self.assertEqual(set(m['old_implementation']),set(m['implementation']))
  self.assertEqual(digest(m['old_implementation']),OLD_CORE);self.assertEqual(digest(m['implementation']),NEW_CORE)
  self.assertEqual(m['old_core'],OLD_CORE);self.assertEqual(m['new_core'],NEW_CORE)
  self.assertEqual([n for n in m['old_implementation'] if m['old_implementation'][n]!=m['implementation'][n]],['machinery/resources.py'])
  self.assertEqual(m['changes'],{'machinery/resources.py':[BEFORE_SHA,CANDIDATE_SHA]})
  self.assertEqual(m['retained_source_history_bytes_unchanged'],8*1024**3)
 def test_old_rejects_new_accepts_250001(self):
  a,b,_=sources()
  with self.assertRaises(SyntheticResourceFailure):selected(a,250001)['_disk_bytes'](('own',),250000)
  self.assertEqual(selected(b,250001)['_disk_bytes'](('own',),1000000),250001)
 def test_new_exact_million_boundary(self):
  _,b,_=sources();self.assertEqual(selected(b,1000000)['_disk_bytes'](('own',),1000000),1000000)
  with self.assertRaises(SyntheticResourceFailure):selected(b,1000001)['_disk_bytes'](('own',),1000000)
 def test_ordinary_default_still_100000(self):
  a,b,_=sources()
  for raw in (a,b):
   self.assertEqual(selected(raw,100000)['disk_bytes']('own'),100000)
   with self.assertRaises(SyntheticResourceFailure):selected(raw,100001)['disk_bytes']('own')
 def test_invalid_or_excess_allowance_refused(self):
  _,b,_=sources();f=selected(b,0)['_disk_bytes']
  for v in (True,False,0,-1,1000001,1.0,None,'1000000'):
   with self.subTest(value=v):
    with self.assertRaises(SyntheticResourceFailure):f(('own',),v)
if __name__=='__main__':unittest.main(verbosity=2)
