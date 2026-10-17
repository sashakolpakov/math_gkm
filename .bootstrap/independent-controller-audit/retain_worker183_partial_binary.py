"""Authorized byte-only COW retention of nine named partial183 ordinary objects; no interpretation."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,os,stat,subprocess
P=Path('/Users/sasha/math_gkm');T=Path('/private/tmp/math_gkm_godel_20261013');A=P/'.control/markov/workers/000183/artifacts'
I=T/'markov_worker_000183_initial_inventory.json';B=T/'markov_worker_000183_partial_binary_bundle'
O=T/'markov_worker_000183_partial_binary_observation.json';M=T/'markov_worker_000183_partial_binary_bundle.json'
def sha(p):
 h=hashlib.sha256()
 with Path(p).open('rb') as f:
  for b in iter(lambda:f.read(1048576),b''):h.update(b)
 return h.hexdigest()
def meta(p):
 s=Path(p).lstat()
 return {'bytes':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'inode':s.st_ino,'ctime_ns':s.st_ctime_ns,'birthtime':s.st_birthtime,'device':s.st_dev,'nlink':s.st_nlink}
def nonatime(m):return {k:v for k,v in m.items() if k!='atime_ns'}
assert sha(I)=='aa702d9fd001bc0e48615c2b61dd108da16ce23048426735aa7f59e85b2cbfc4'
d=json.loads(I.read_text())
names=[k for k,v in d['current'].items() if Path(k).suffix=='.olean' and (k not in d['archive'] or v['sha256']!=d['archive'][k]['sha256'])]
assert len(names)==9 and sum(d['current'][n]['bytes'] for n in names)==12946720
assert not B.exists() and not O.exists() and not M.exists()
began=datetime.now(timezone.utc).isoformat();rows=[]
for name in names:
 src=P/name;dst=B/name;before=meta(src);before_sha=sha(src)
 assert src.resolve()==src and before_sha==d['current'][name]['sha256']
 assert all(before[k]==d['current'][name][k] for k in ['bytes','mode','uid','gid','mtime_ns'])
 assert before['device']==T.stat().st_dev
 dst.parent.mkdir(parents=True,exist_ok=True);assert not dst.exists()
 subprocess.run(['/bin/cp','-c',str(src),str(dst)],check=True)
 os.chown(dst,before['uid'],before['gid']);os.chmod(dst,before['mode']);os.utime(dst,ns=(before['atime_ns'],before['mtime_ns']))
 copy_before=meta(dst);copied_sha=sha(dst);copy_after=meta(dst);after_sha=sha(src);after=meta(src)
 assert before_sha==copied_sha==after_sha and nonatime(before)==nonatime(after) and nonatime(copy_before)==nonatime(copy_after)
 assert all(copy_after[k]==before[k] for k in ['bytes','mode','uid','gid','mtime_ns']) and copy_after['inode']!=before['inode'] and copy_after['nlink']==1
 ap=A/name;archive={'path':str(ap),'sha256':sha(ap),'bytes':ap.stat().st_size} if ap.exists() else None
 if archive:assert archive['sha256']==d['archive'][name]['sha256']
 rows.append({'relative_path':name,'source':str(src),'path':str(dst),'bytes':before['bytes'],'sha256':before_sha,'source_before':before,'source_after':after,'copy_before_hash':copy_before,'copy_after_hash':copy_after,'source_unchanged_except_possible_atime':True,'bytes_mode_uid_gid_mtime_match':True,'independent_inode':True,'original_archive':archive,'clone_command':['/bin/cp','-c',str(src),str(dst)]})
ended=datetime.now(timezone.utc).isoformat()
o={'scope':'Separate authorized APFS COW retention of exactly nine initial-inventory current183 ordinary objects missing or mismatched in the original partial archive. Original archive and canonical current objects unchanged. No object loading, interpretation, proof/replay or mathematical computation.','worker':183,'request':'55cf20d29efe4eebb6677e949f2beb36','count':9,'bytes':12946720,'copy_started_utc':began,'copy_finished_utc':ended,'initial_inventory':{'path':str(I),'sha256':sha(I),'observed_at':d['observed_at']},'files':rows,'mismatches':[],'validation_credit':'None. Compiler receipts do not bind object-output digests; these are separately observed and retained current bytes.','atime_boundary':'Source access times are sampled before and after reads, without writer attribution. Historical atime or continuous stability is not claimed.','storage_boundary':'cp -c succeeded on the same device; independent inodes verified. No physical-space-sharing or savings inference.'}
O.write_text(json.dumps(o,indent=2)+'\n')
m={'worker':183,'request':o['request'],'bundle_root':str(B),'count':9,'bytes':12946720,'observation':{'path':str(O),'bytes':O.stat().st_size,'sha256':sha(O)},'files':[{'source':r['source'],'path':r['path'],'relative_path':r['relative_path'],'bytes':r['bytes'],'sha256':r['sha256']} for r in rows],'preservation_paths':[r['path'] for r in rows]+[str(O),str(M)]}
M.write_text(json.dumps(m,indent=2)+'\n')
print(json.dumps({'count':9,'bytes':12946720,'manifest':{'path':str(M),'bytes':M.stat().st_size,'sha256':sha(M)},'observation':m['observation'],'copy_window':[began,ended]},indent=2))
