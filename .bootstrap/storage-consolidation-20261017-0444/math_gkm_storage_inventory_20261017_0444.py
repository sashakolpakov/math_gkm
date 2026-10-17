"""Supervisor inventory: closed audited compiled copies only; no project execution."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,stat
R=Path('/Users/sasha/math_gkm'); O=Path('/private/tmp/math_gkm_storage_inventory_20261017_0444.json')
assert Path.cwd()==R and not O.exists()
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
prior=sorted(set(R.glob('.bootstrap/storage-consolidation-*/*.json'))|set(R.glob('.bootstrap/independent-controller-audit/storage_clone_*.json')))
excluded=set()
def norm(s):return str(R/s) if s.startswith(('.control/','.bootstrap/','evidence/')) else s
def walk(x,ctx=''):
 if isinstance(x,dict):
  for k,v in x.items():
   if k in ('target','archive','object') and isinstance(v,str) and '/' in v:excluded.add(norm(v))
   if k=='path' and ctx=='targets' and isinstance(v,str):excluded.add(norm(v))
   walk(v,k if k=='targets' else ctx)
 elif isinstance(x,list):
  for v in x:walk(v,ctx)
for p in prior:walk(json.loads(p.read_text()))
bindings=[(172,'9647c1ba01484705bdaa6edb4d3c7d32','33353f78bf1fbf82c561df415109da72c491ad607e485df9e97067b05d8592b9','9921d98a05ab71a83a33d6fb197150de637e089756a00cf1090503451cefa10d'),(173,'139fed75c29240ba95427717b28c29a7','b220e790beee945d904e2e8f2fa20b01874599b66fb21ecce788273ffb245d9a','f3a996adb76033eb89f4478630892bb8d46e64a851e42b29e58dba7cf442ede8'),(174,'831d426f49894488b2803a879f0bf56a','cd8f0b1bdd5390230c189e1f69b52476e367b6c9158f1399641c79d951cf46cb','9c37c6d7f7ff9d779575b592a438b7b8ca968812612898ce8a9068d3c1487b5f')]
receipts=[];pairs=[];seen=set();mismatch=[]
for w,request,rsha,asha in bindings:
 worker=R/'.control/markov/workers'/f'{w:06d}'; receipt=worker/'receipt.json'
 assert sha(receipt)==rsha
 r=json.loads(receipt.read_text());assert r['request_id']==request and r['outcome']=='completed' and r['returncode']==0
 seal=R/'.bootstrap/independent-controller-audit'/f'markov_worker_{w:06d}_audit_integrity.json';assert sha(seal)==asha
 receipts.append({'worker':w,'request':request,'sha256':rsha,'outcome':r['outcome'],'returncode':r['returncode'],'audit_seal':str(seal),'audit_seal_sha256':asha})
 archive=worker/'artifacts'
 for archived in sorted(archive.rglob('*')):
  if archived.suffix not in ('.olean','.ilean') or not archived.is_file():continue
  source=R/archived.relative_to(archive)
  assert source.parent==R/'evidence'/('markov-'+request[:8]) and source.resolve()==source
  digest=sha(source);assert sha(archived)==digest
  obj=R/'.control/markov/objects'/digest
  for target in (archived,obj):
   if str(target) in excluded or str(target) in seen:continue
   assert target.exists() and target.resolve()==target
   a=source.lstat();t=target.lstat()
   assert stat.S_ISREG(a.st_mode) and stat.S_ISREG(t.st_mode) and a.st_size==t.st_size
   assert a.st_dev==t.st_dev==Path('/private/tmp').stat().st_dev and a.st_ino!=t.st_ino
   assert a.st_nlink==t.st_nlink==1 and a.st_flags==t.st_flags==0
   assert sha(target)==digest
   t=target.lstat();seen.add(str(target))
   pairs.append({'source':str(source),'target':str(target),'sha256':digest,'bytes':t.st_size,'mode':stat.S_IMODE(t.st_mode),'uid':t.st_uid,'gid':t.st_gid,'mtime_ns':t.st_mtime_ns,'atime_ns':t.st_atime_ns,'inode_before':t.st_ino})
o={'scope':'Unconsolidated byte-identical compiled archive/object copies from independently sealed closed172-174 only. No175+ read; canonical current evidence and research sources are never replacement targets. Earlier mathematical audits and observation windows unchanged. Prior storage targets excluded.','created_utc':datetime.now(timezone.utc).isoformat(),'receipts':receipts,'exclusion_plans':[str(p) for p in prior],'excluded_target_count':len(excluded),'mismatch':mismatch,'candidate_count':len(pairs),'candidate_bytes':sum(x['bytes'] for x in pairs),'pairs':pairs,'inventory_helper':{'path':str(Path(__file__)),'sha256':sha(Path(__file__))}}
O.write_text(json.dumps(o,indent=2)+'\n')
print(json.dumps({'inventory':str(O),'sha256':sha(O),'candidates':len(pairs),'bytes':o['candidate_bytes'],'sources':len(set(p['source'] for p in pairs)),'prior_records':len(prior),'prior_targets':len(excluded)},indent=2))
