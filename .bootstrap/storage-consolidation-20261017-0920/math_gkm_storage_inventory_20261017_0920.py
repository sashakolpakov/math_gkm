"""Supervisor inventory of identical copies from already sealed and committed rounds."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,stat,subprocess,sys
R=Path('/Users/sasha/math_gkm');T=Path('/private/tmp/math_gkm_godel_20261013');A=R/'.bootstrap/independent-controller-audit';O=Path('/private/tmp/math_gkm_storage_inventory_20261017_0920.json')
assert Path.cwd()==R and len(sys.argv)==2 and not O.exists()
head=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip();assert head==sys.argv[1]
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def committed(p):
 rel=str(p.relative_to(R));blob=subprocess.check_output(['git','rev-parse',head+':'+rel],text=True).strip()
 data=subprocess.check_output(['git','cat-file','blob',blob]);digest=hashlib.sha256(data).hexdigest();assert sha(p)==digest
 return {'path':str(p),'git_blob':blob,'sha256':digest,'bytes':len(data)}
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
pairs=[];seen=set();pins=[];receipts=[]
def pair(source,target,kind):
 if str(target) in excluded or str(target) in seen:return
 assert source.resolve()==source and target.resolve()==target and source.exists() and target.exists()
 a=source.lstat();b=target.lstat();assert stat.S_ISREG(a.st_mode) and stat.S_ISREG(b.st_mode)
 assert a.st_size==b.st_size and a.st_dev==b.st_dev==Path('/private/tmp').stat().st_dev and a.st_ino!=b.st_ino
 assert a.st_nlink==b.st_nlink==1 and a.st_flags==b.st_flags==0
 digest=sha(source);assert sha(target)==digest
 if kind=='object':assert target.name==digest
 b=target.lstat();seen.add(str(target))
 pairs.append({'source':str(source),'target':str(target),'kind':kind,'sha256':digest,'bytes':b.st_size,'mode':stat.S_IMODE(b.st_mode),'uid':b.st_uid,'gid':b.st_gid,'mtime_ns':b.st_mtime_ns,'atime_ns':b.st_atime_ns,'inode_before':b.st_ino})
for w in (184,):
 seal=A/f'markov_worker_{w:06d}_audit_integrity.json';pin=committed(seal);pins.append(pin)
 assert sha(T/seal.name)==pin['sha256'];s=json.loads(seal.read_text())
 # New184 audit retention used APFS clones already; compiled copies only here.
 if w == 184:
  worker=R/'.control/markov/workers'/f'{w:06d}';receipt=worker/'receipt.json';rp=committed(receipt);pins.append(rp)
  r=json.loads(receipt.read_text());assert r['outcome']=='completed' and r['returncode']==0
  request=r['request_id'];receipts.append({'worker':w,'request':request,'sha256':rp['sha256'],'outcome':r['outcome'],'returncode':r['returncode'],'audit_seal':str(seal),'audit_seal_sha256':pin['sha256']})
  archive=worker/'artifacts'
  for archived in sorted(archive.rglob('*')):
   if archived.suffix not in ('.olean','.ilean') or not archived.is_file():continue
   source=R/archived.relative_to(archive);assert source.parent==R/'evidence'/('markov-'+request[:8])
   digest=sha(source);pair(source,archived,'archive');pair(source,R/'.control/markov/objects'/digest,'object')
assert subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()==head
out={'scope':'Sealed committed184 compiled archive/object copies only. No183 partial archive,185+ or active research reads. New184 audit retention already uses APFS clones. Canonical current evidence and committed audit records are never replacement targets. Bytes and stable metadata retained; audit observation windows and proof statuses unchanged.','created_utc':datetime.now(timezone.utc).isoformat(),'repository_head':head,'committed_input_pins':pins,'receipts':receipts,'exclusion_plans':[str(p) for p in prior],'excluded_target_count':len(excluded),'mismatch':[],'candidate_count':len(pairs),'candidate_bytes':sum(x['bytes'] for x in pairs),'pairs':pairs,'inventory_helper':{'path':str(Path(__file__)),'sha256':sha(Path(__file__))}}
O.write_text(json.dumps(out,indent=2)+'\n')
from collections import Counter
print(json.dumps({'inventory':str(O),'sha256':sha(O),'count':len(pairs),'bytes':out['candidate_bytes'],'classes':dict(Counter(x['kind'] for x in pairs)),'sources':len(set(x['source'] for x in pairs)),'prior_records':len(prior),'prior_targets':len(excluded)},indent=2))
