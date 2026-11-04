"""INACTIVE byte-preserving maintenance for explicitly frozen old Markov records.

Real ditto must run in the reviewed require_escalated operator context: the default
sandbox silently produced an empty destination during qualification. Every copy
still has to pass independent byte/hash/metadata checks. No mathematical payload
is decoded; native Lean/model guards are neither invoked nor changed.
"""
import argparse
import contextlib
import fcntl
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import stat
import subprocess
import time
import uuid

ROOT=Path('/Users/sasha/math_gkm')
MIN=256*1024
MAX=64*1024**2
GIB=1024**3
SCOPE=re.compile(r'concept-driver-20261020-follow-[0-9]{6}')
BLOCK=65536
COMPRESSED=32

class Hold(RuntimeError):pass

def need(value,message):
    if not value:raise Hold(message)

def canonical(value):return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode()
def digest(value):return hashlib.sha256(canonical(value)).hexdigest()

def metadata(path):
    p=Path(path);s=p.lstat()
    need(stat.S_ISREG(s.st_mode) and p.resolve(strict=True)==p,'unlinked regular file required')
    return dict(dev=s.st_dev,ino=s.st_ino,size=s.st_size,blocks=s.st_blocks*512,nlink=s.st_nlink,
                mode=stat.S_IMODE(s.st_mode),uid=s.st_uid,gid=s.st_gid,mtime_ns=s.st_mtime_ns,
                flags=getattr(s,'st_flags',0))

def hashed(path):
    h=hashlib.sha256();count=0
    with Path(path).open('rb') as inp:
        for block in iter(lambda:inp.read(BLOCK),b''):h.update(block);count+=len(block)
    return {'sha256':h.hexdigest(),'bytes':count}

def public(path,pin=None):
    path=Path(path);m=metadata(path)
    need(m['size']<=16*1024**2,'public maintenance metadata bound')
    if pin:need(hashed(path)['sha256']==pin,'public maintenance input changed')
    return json.loads(path.read_bytes())

def sync(path):
    fd=os.open(path,os.O_RDONLY)
    try:os.fsync(fd)
    finally:os.close(fd)

def sync_file(path):
    fd=os.open(path,os.O_RDONLY | getattr(os,'O_NOFOLLOW',0))
    try:os.fsync(fd)
    finally:os.close(fd)

def save(path,value,fresh=False):
    p=Path(path);p.parent.mkdir(parents=True,exist_ok=True)
    temporary=p if fresh else p.with_name(p.name+'.next')
    with temporary.open('xb') as out:out.write(canonical(value)+b'\n');out.flush();os.fsync(out.fileno())
    if not fresh:os.replace(temporary,p)
    sync(p.parent)

def scope_path(root,path):
    p=Path(path)
    need(p.is_absolute() and p.parent==root/'.scratch' and SCOPE.fullmatch(p.name) and
         p.resolve(strict=True)==p and p.is_dir(),'only explicit old Markov own scope permitted')
    return p

def permitted(root,path,scopes):
    p=Path(path);matches=[s for s in scopes if p.is_relative_to(s)]
    need(len(matches)==1,'record is outside frozen scope')
    s=scope_path(root,matches[0]);parts=p.relative_to(s).parts
    # Inherited records have exactly one validator directory.
    inherited=(len(parts)==7 and parts[0]=='arms' and parts[1] in ('baseline','exploration') and
               parts[2:4]==('inherited','validators') and parts[-2:]==('source','declarations.json'))
    checked=(8<=len(parts)<=11 and parts[0]=='arms' and parts[1] in ('baseline','exploration') and
             parts[2]=='rounds' and parts[4]=='checks' and parts[-2:]==('source','declarations.json'))
    need(inherited or checked,'only closed validator source/declarations.json allowed')
    m=metadata(p);marker=p.parent.parent/'FINISHED.json';finished=metadata(marker)
    need(finished['nlink']==1,'aliased finished marker refused')
    return s,m,dict(path=str(marker),metadata=finished)

def eligible(m):
    return m['nlink']==1 and m['flags']==0 and MIN<=m['size']<=MAX and MIN<=m['blocks']<=MAX

def discover(root=ROOT,max_entries=100000,seconds=60):
    """Only physical metadata; incomplete scans never claim whole-tree totals."""
    root=Path(root);start=time.monotonic();seen=0;incomplete=False;rows=[];scopes=[]
    skip={'jobs','roles','evaluation','research','workspace','snapshots','review-inputs','history','.git','.lake','build'}
    def walk(directory,depth=0):
        nonlocal seen,incomplete
        if depth>12:return
        with os.scandir(directory) as entries:
            for entry in entries:
                if seen>=max_entries or time.monotonic()-start>=seconds:incomplete=True;return
                seen+=1
                if entry.is_symlink():continue
                if entry.is_dir(follow_symlinks=False):
                    if entry.name not in skip:walk(Path(entry.path),depth+1)
                elif entry.name=='declarations.json' and entry.is_file(follow_symlinks=False):
                    try:
                        _,m,marker=permitted(root,Path(entry.path),scopes)
                        if eligible(m):rows.append(dict(path=entry.path,metadata=m,finished=marker))
                    except (Hold,OSError):pass
    for directory in sorted((root/'.scratch').iterdir()):
        if not SCOPE.fullmatch(directory.name) or directory.is_symlink() or not directory.is_dir():continue
        scopes.append(scope_path(root,directory))
    priority={'concept-driver-20261020-follow-000026':0,'concept-driver-20261020-follow-000019':1}
    scopes.sort(key=lambda scope:(priority.get(scope.name,2),-int(scope.name[-6:])))
    for scope in scopes:
        for arm in ('baseline','exploration'):
            for relative in ('inherited/validators','rounds'):
                path=scope/'arms'/arm/relative
                if path.is_dir() and not path.is_symlink():walk(path)
                if incomplete:break
            if incomplete:break
        if incomplete:break
    rows.sort(key=lambda x:x['metadata']['blocks'],reverse=True)
    return dict(schema='math-gkm.byte-preserving-maintenance-manifest.v1',root=str(root),
                scopes=list(map(str,scopes)),entries=seen,incomplete=incomplete,elapsed_seconds=time.monotonic()-start,
                files=rows,eligible_files=len(rows),eligible_allocated_bytes=sum(r['metadata']['blocks'] for r in rows),
                eligible_logical_bytes=sum(r['metadata']['size'] for r in rows),
                authority='Metadata candidates only; separate frozen/owned closure attestation and review required.')

@contextlib.contextmanager
def locks(root,scopes):
    handles=[]
    try:
        for path in [root/'.scratch/resources/heavy.lock']+[s/'controller.lock' for s in sorted(scopes)]:
            need(path.parent.resolve()==path.parent,'lock scope escaped')
            handle=path.open('a');handles.append(handle)
            try:fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
            except BlockingIOError:raise Hold('maintenance scope or shared heavy work busy')
        need(not (root/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists(),'unresolved cleanup hold')
        yield
    finally:
        for handle in reversed(handles):fcntl.flock(handle,fcntl.LOCK_UN);handle.close()

def same_identity(a,b,nlink=None):
    fields=('dev','ino','size','mode','uid','gid','mtime_ns','flags')
    return all(a[k]==b[k] for k in fields) and b['nlink']==(a['nlink'] if nlink is None else nlink)

def content_metadata(a,b):
    return all(a[k]==b[k] for k in ('size','mode','uid','gid','mtime_ns'))

def ditto(source,destination,timeout):
    # A single trusted child, no shell, model or compiler; no output-generating
    # options. stdout/stderr go directly to DEVNULL to keep RAM bounded.
    return subprocess.run(['/usr/bin/ditto','--hfsCompression','--nocache','--noclone',str(source),str(destination)],
                          stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,timeout=timeout,check=False).returncode

def compress_one(root,row,scopes,journal,timeout=30,runner=ditto):
    path=Path(row['path']);_,original,finished=permitted(root,path,scopes)
    need(original==row['metadata'] and finished==row['finished'] and eligible(original),'manifest source metadata changed')
    before=hashed(path);need(before['bytes']==original['size'],'source read count differs')
    token=uuid.uuid4().hex;temporary=path.with_name('.math-gkm-compress-'+token+'.tmp')
    backup=path.with_name('.math-gkm-compress-'+token+'.backup')
    need(not temporary.exists() and not backup.exists(),'fresh owned file names required')
    state=dict(schema='math-gkm.byte-preserving-file.v1',path=str(path),temporary=str(temporary),backup=str(backup),
               original=original,content=before,finished=finished,phase='copy_intent')
    def phase(name,**extra):state.update(phase=name,**extra);save(journal,state)
    save(journal,state,fresh=True)
    copied=None;linked=False;replaced=False
    def intact_backup():
        m=metadata(backup)
        return same_identity(original,m,nlink=1 if replaced else 2) and hashed(backup)==before
    try:
        need(0<timeout<=30,'bounded one-file timeout required')
        need(runner(path,temporary,timeout)==0,'ditto did not finish successfully')
        copied=metadata(temporary);phase('copied',copied=copied)
        need(content_metadata(original,copied) and copied['nlink']==1 and copied['flags']==COMPRESSED and
             copied['blocks']<original['blocks'] and hashed(temporary)==before,'compressed copy failed byte/metadata verification')
        sync_file(temporary)  # Persist the complete verified copy before retaining/replacing links.
        need(same_identity(original,metadata(path)) and hashed(path)==before,'source changed during copy')
        phase('backup_intent');os.link(path,backup,follow_symlinks=False);linked=True;sync(path.parent)
        phase('backup_created')
        need(same_identity(original,metadata(path),nlink=2) and intact_backup() and hashed(path)==before,
             'source/owned backup changed before replacement')
        phase('replace_intent');os.replace(temporary,path);replaced=True;sync(path.parent);phase('replaced')
        current=metadata(path)
        need(same_identity(copied,current) and content_metadata(original,current) and hashed(path)==before,
             'replacement post-check failed')
        need(intact_backup(),'owned original backup changed after replacement')
        phase('postchecked',replacement=current)
        sync_file(path)  # Persist data/xattrs before the original backup can be removed.
        need(same_identity(copied,metadata(path)) and hashed(path)==before and intact_backup(),
             'foreign change before own backup deletion')
        os.unlink(backup);linked=False;sync(path.parent)
        saved=original['blocks']-metadata(path)['blocks'];phase('finished',saved_bytes=saved)
        return saved
    except BaseException as error:
        try:
            if replaced:
                need(copied is not None and same_identity(copied,metadata(path)) and linked and intact_backup(),
                     'uncertain foreign divergence; retain replacement and backup')
                os.replace(backup,path);linked=False;sync(path.parent)
                need(same_identity(original,metadata(path)) and hashed(path)==before,'restored original differs')
                phase('rolled_back',error_class=type(error).__name__)
            elif linked:
                need(same_identity(original,metadata(path),nlink=2) and intact_backup() and hashed(path)==before,
                     'uncertain original/backup divergence')
                os.unlink(backup);linked=False;sync(path.parent);phase('original_retained',error_class=type(error).__name__)
            else:phase('original_retained',error_class=type(error).__name__)
            if temporary.exists() and copied is not None:
                need(same_identity(copied,metadata(temporary)),'foreign temporary file changed')
                os.unlink(temporary);sync(path.parent)
        except BaseException:
            phase('needs_reconciliation',error_class=type(error).__name__)
        raise

def batch(manifest_path,manifest_pin,attestation_path,attestation_pin,output,*,root=ROOT,runner=ditto,escalated=False,target_free_gib=12):
    need(type(target_free_gib) is int and 12<=target_free_gib<=32,'target_free_gib must be an integer in 12..32')
    root=Path(root);need(escalated,'require_escalated host context must be explicitly selected')
    manifest=public(manifest_path,manifest_pin);attestation=public(attestation_path,attestation_pin)
    need(manifest.get('schema')=='math-gkm.byte-preserving-maintenance-manifest.v1' and manifest.get('root')==str(root),
         'maintenance manifest scope differs')
    need(attestation.get('schema')=='math-gkm.frozen-math-record-scopes.v1' and attestation.get('root')==str(root),
         'frozen scope authority differs')
    scopes=[]
    for row in attestation['scopes']:
        scope=scope_path(root,row['path']);need(row.get('owned') is True and row.get('frozen') is True,'scope is not explicitly frozen/owned')
        evidence=row['closure_evidence'];p=Path(evidence['path'])
        need(p.is_relative_to(root/'.bootstrap') and hashed(p)['sha256']==evidence['sha256'],'protected closed-scope evidence differs')
        scopes.append(scope)
    needed=set()
    for row in manifest['files']:
        scope,_,_=permitted(root,Path(row['path']),scopes);needed.add(scope)
    output=Path(output);need(output.is_absolute() and output.parent.resolve()==output.parent and
                             output.is_relative_to(root/'.bootstrap') and not output.exists(),'fresh private batch output required')
    rows=sorted(manifest['files'],key=lambda r:r['metadata']['blocks'],reverse=True)
    start=time.monotonic();saved=0;completed=0
    with locks(root,needed):
        output.mkdir(mode=0o700)
        save(output/'INTENT.json',dict(schema='math-gkm.byte-preserving-batch.v1',manifest_sha256=manifest_pin,
             attestation_sha256=attestation_pin,source_sha256=hashed(__file__)['sha256'],source_frozen_by_operator=True,
             liveness_claim=False,native_guards_changed=False,target_free_gib=target_free_gib),fresh=True)
        for i,row in enumerate(rows):
            remaining=60-(time.monotonic()-start)
            if remaining<5 or saved>=8*GIB or shutil.disk_usage(root).free>=target_free_gib*GIB:break
            need(shutil.disk_usage(root).free>=2*GIB+row['metadata']['size'],'maintenance temporary-space floor')
            saved+=compress_one(root,row,scopes,output/f'{i:06d}.json',min(30,remaining-2),runner)
            completed+=1
        result=dict(schema='math-gkm.byte-preserving-batch.v1',phase='closed',completed=completed,
                    saved_bytes=saved,elapsed_seconds=time.monotonic()-start,native_guards_changed=False,target_free_gib=target_free_gib)
        save(output/'FINISHED.json',result,fresh=True);return result

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('action',choices=('discover','compress'))
    p.add_argument('--output',type=Path,required=True);p.add_argument('--source-sha256',required=True)
    p.add_argument('--manifest',type=Path);p.add_argument('--manifest-sha256')
    p.add_argument('--frozen-scopes',type=Path);p.add_argument('--frozen-scopes-sha256')
    p.add_argument('--escalated-context-qualified',action='store_true')
    p.add_argument('--target-free-gib',type=int,default=12);a=p.parse_args()
    need(hashed(__file__)['sha256']==a.source_sha256,'maintenance source changed')
    if a.action=='discover':
        value=discover();save(a.output,value,fresh=True)
        print(json.dumps({k:value[k] for k in ('entries','incomplete','eligible_files','eligible_allocated_bytes','eligible_logical_bytes')}))
    else:
        need(all((a.manifest,a.manifest_sha256,a.frozen_scopes,a.frozen_scopes_sha256)),'explicit manifest and frozen scope evidence required')
        print(json.dumps(batch(a.manifest,a.manifest_sha256,a.frozen_scopes,a.frozen_scopes_sha256,a.output,
                               escalated=a.escalated_context_qualified,target_free_gib=a.target_free_gib)))

if __name__=='__main__':main()
