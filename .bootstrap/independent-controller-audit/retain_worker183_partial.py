"""Retain only authorized exact missing nonbinary183 counterparts; no execution or interpretation."""
from pathlib import Path
import hashlib,json,os,stat,shutil
from datetime import datetime,timezone
P=Path('/Users/sasha/math_gkm');T=Path('/private/tmp/math_gkm_godel_20261013')
I=T/'markov_worker_000183_initial_inventory.json'
B=T/'markov_worker_000183_partial_retention_bundle'
O=T/'markov_worker_000183_partial_retention_observation.json'
M=T/'markov_worker_000183_partial_retention_bundle.json'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def meta(p):
 s=Path(p).lstat()
 return {'bytes':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'inode':s.st_ino,'ctime_ns':s.st_ctime_ns}
def stable(d):return {k:v for k,v in d.items() if k!='atime_ns'}
assert sha(I)=='aa702d9fd001bc0e48615c2b61dd108da16ce23048426735aa7f59e85b2cbfc4'
d=json.loads(I.read_text());names=[k for k in d['current_unarchived'] if Path(k).suffix not in ('.olean','.ilean','.pyc')]
assert len(names)==46 and sum(d['current'][k]['bytes'] for k in names)==2952709
assert not B.exists() and not O.exists() and not M.exists()
started=datetime.now(timezone.utc).isoformat();rows=[]
for name in names:
 src=P/name;dst=B/name;assert src.resolve()==src and src.is_file() and src.suffix in ('.lean','.json','.py','.md')
 before=meta(src);b=src.read_bytes();after=meta(src)
 assert stable(before)==stable(after) and hashlib.sha256(b).hexdigest()==d['current'][name]['sha256']
 assert all(before[k]==d['current'][name][k] for k in ('bytes','mode','uid','gid','mtime_ns'))
 dst.parent.mkdir(parents=True,exist_ok=True);dst.write_bytes(b)
 os.chown(dst,before['uid'],before['gid']);os.chmod(dst,before['mode']);os.utime(dst,ns=(before['atime_ns'],before['mtime_ns']))
 copied=meta(dst);assert sha(dst)==d['current'][name]['sha256'] and all(copied[k]==before[k] for k in ('bytes','mode','uid','gid','mtime_ns'))
 rows.append({'relative_path':name,'source':str(src),'copy':str(dst),'sha256':sha(dst),'bytes':len(b),'source_before':before,'source_after_read':after,'copy_metadata':copied,'bytes_and_stable_metadata_match':True})
finished=datetime.now(timezone.utc).isoformat()
obs={'scope':'Authorized separate retention of 46 current nonbinary183 counterparts absent from original partial archive; original24 archive files unchanged. No object copies, interpretation, execution, source/process attribution or historical validation upgrade.','worker':183,'request':'55cf20d29efe4eebb6677e949f2beb36','initial_inventory':{'path':str(I),'sha256':sha(I),'observed_at':d['observed_at']},'copy_started_utc':started,'copy_finished_utc':finished,'count':46,'bytes':2952709,'files':rows,'mismatches':[],'limits':'Discovery and copy times do not establish creation time or invocation-time source version. Read access may affect atime; bytes, mode, uid, gid and mtime independently matched before copying and on retained copies. Current ordinary objects are hash-only, including the zero-byte archived TopSecondGap mismatch.'}
O.write_text(json.dumps(obs,indent=2)+'\n')
m={'worker':183,'request':obs['request'],'bundle_root':str(B),'count':46,'bytes':2952709,'observation':{'path':str(O),'bytes':O.stat().st_size,'sha256':sha(O)},'files':[{'source':r['source'],'path':r['copy'],'relative_path':r['relative_path'],'bytes':r['bytes'],'sha256':r['sha256']} for r in rows],'preservation_paths':[r['copy'] for r in rows]+[str(O),str(M)]}
M.write_text(json.dumps(m,indent=2)+'\n')
print(json.dumps({'count':46,'bytes':2952709,'observation':m['observation'],'manifest':{'path':str(M),'bytes':M.stat().st_size,'sha256':sha(M)},'copy_window':[started,finished]},indent=2))
