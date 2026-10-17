"""Retain two authorized exact late-observed files as opaque bytes only."""
from pathlib import Path
from datetime import datetime,timezone
import hashlib,json,os,stat
T=Path('/private/tmp/math_gkm_godel_20261013');P=Path('/Users/sasha/math_gkm');PRE='markov_worker_000183_'
M=T/(PRE+'late_additions_metadata.json');ROOT=T/(PRE+'late_observed_bundle')
def now():return datetime.now(timezone.utc).isoformat()
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def meta(p):
 s=Path(p).lstat();return {'bytes':s.st_size,'mode':stat.S_IMODE(s.st_mode),'uid':s.st_uid,'gid':s.st_gid,'mtime_ns':s.st_mtime_ns,'atime_ns':s.st_atime_ns,'inode':s.st_ino,'ctime_ns':s.st_ctime_ns,'birthtime':s.st_birthtime}
d=json.loads(M.read_text());assert len(d['files'])==2
assert not ROOT.exists()
started=now();rows=[];stable=['bytes','mode','uid','gid','mtime_ns']
for r in d['files']:
 p=P/r['relative_path'];q=ROOT/r['relative_path'];before=meta(p);b=p.read_bytes();assert hashlib.sha256(b).hexdigest()==r['sha256']
 assert all(before[k]==r[k] for k in stable)
 q.parent.mkdir(parents=True,exist_ok=True)
 with q.open('xb') as f:f.write(b)
 os.chmod(q,before['mode']);os.chown(q,before['uid'],before['gid']);os.utime(q,ns=(before['atime_ns'],before['mtime_ns']))
 after=meta(p);copy=meta(q);assert all(before[k]==after[k]==copy[k] for k in stable);assert sha(q)==r['sha256'];assert before['inode']!=copy['inode']
 rows.append({'relative_path':r['relative_path'],'source':str(p),'copy':str(q),'sha256':r['sha256'],'bytes':len(b),'source_before':before,'source_after':after,'copy_metadata':copy,'bytes_and_stable_metadata_match':True,'source_unchanged_except_atime':all(before[k]==after[k] for k in before if k!='atime_ns'),'qualification':'Opaque preservation only; no source interpretation, bytecode decoding, execution, validation credit, or writer attribution.'})
finished=now();obs={'started_utc':started,'finished_utc':finished,'metadata_record_sha256':sha(M),'count':2,'total_bytes':sum(x['bytes'] for x in rows),'files':rows,'qualification':'Separate late-observed bundle. Original 24-file partial archive, 46-file text supplement, 9-file object supplement and method window remain unchanged. Atime is observational only.'}
o=T/(PRE+'late_observed_observation.json');o.write_text(json.dumps(obs,indent=2)+'\n')
manifest={'root':str(ROOT),'count':2,'total_bytes':obs['total_bytes'],'observation_path':str(o),'observation_sha256':sha(o),'files':[{'relative_path':r['relative_path'],'source':r['source'],'path':r['copy'],'bytes':r['bytes'],'sha256':r['sha256']} for r in rows]}
f=T/(PRE+'late_observed_bundle.json');f.write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps({'started_utc':started,'finished_utc':finished,'count':2,'total_bytes':obs['total_bytes'],'manifest':{'path':str(f),'bytes':f.stat().st_size,'sha256':sha(f)},'observation':{'path':str(o),'bytes':o.stat().st_size,'sha256':sha(o)}},indent=2))
