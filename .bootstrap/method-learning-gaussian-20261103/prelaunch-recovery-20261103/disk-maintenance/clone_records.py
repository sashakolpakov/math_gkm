"""INACTIVE APFS sharing for exact duplicates already preserved by qualified journals.

No new compression, hard-link deduplication, payload decoding or native research.
Only the 4049 explicitly indexed successful prior paths may participate. Physical
free space is measured separately; per-file st_blocks is never called reclaim.
"""
import argparse
import contextlib
import ctypes
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import time
import uuid

HERE=Path(__file__).resolve().parent
ARCHIVAL_SHA='e3ff38e388ab4440bca6bd5f07bab0732e7c14c9a2be936001220912c82edd23'
path=HERE/'archival_records.py';assert hashlib.sha256(path.read_bytes()).hexdigest()==ARCHIVAL_SHA
spec=importlib.util.spec_from_file_location('qualified_clone_archival_support',path)
a=importlib.util.module_from_spec(spec);spec.loader.exec_module(a)
c=a.c
BASE_SHA=a.BASE_SHA
ROOT=c.ROOT
QUALIFIED_COUNT=4049


def valid_content(content):
    return (isinstance(content,dict) and set(content)=={'sha256','bytes'} and
            re.fullmatch('[0-9a-f]{64}',str(content['sha256'])) and type(content['bytes']) is int and
            c.MIN<=content['bytes']<=c.MAX)


def index_records(index,root):
    c.need(index.get('schema')=='math-gkm.qualified-compressed-records.v1' and index.get('root')==str(root) and
           index.get('record_count')==QUALIFIED_COUNT and len(index['records'])==QUALIFIED_COUNT and
           index.get('source_base_sha256')==BASE_SHA,'exact qualified compressed-record index required')
    records={}
    for record in index['records']:
        scope=Path(record['scope']);p=Path(record['path'])
        c.need(scope.parent==root/'.scratch' and c.SCOPE.fullmatch(scope.name) and
               a.scope_path(root,scope)==scope and p.is_absolute() and p.is_relative_to(scope) and
               p.suffix in a.EXTENSIONS and valid_content(record['content']), 'indexed path/content scope differs')
        m=record['metadata']
        c.need(m['flags']==32 and m['nlink']==1 and m['size']==record['content']['bytes'] and c.MIN<=m['size']<=c.MAX,
               'only already-compressed single-link bounded records allowed')
        c.need(str(p) not in records,'duplicate indexed path');records[str(p)]=record
    return records


def group_targets(groups,index_pin,records,root):
    c.need(groups.get('schema')=='math-gkm.compressed-clone-groups.v1' and groups.get('root')==str(root) and
           groups.get('index_sha256')==index_pin and groups.get('physical_reclaim_claimed') is False,
           'exact clone group/index binding required')
    used=set();tasks=[]
    for group in groups['groups']:
        content=group['content'];canonical=group['canonical_path'];targets=group['target_paths'];members=[canonical,*targets]
        c.need(valid_content(content) and targets and len(set(members))==len(members) and not used.intersection(members),
               'distinct disjoint canonical/target groups required')
        c.need(all(p in records and records[p]['content']==content for p in members),'group contains unqualified or unequal record')
        c.need(canonical==min(members,key=lambda p:(records[p]['metadata']['blocks'],p)),
               'canonical must be smallest allocated representation, then lexical path')
        used.update(members)
        tasks.extend((records[canonical],records[target]) for target in targets)
    return tasks


def journal_record(record,root):
    journal_ref=record['journal'];finished_ref=record['batch_finished']
    jp=Path(journal_ref['path']);fp=Path(finished_ref['path'])
    c.need(jp.is_relative_to(root/'.bootstrap') and fp.parent==jp.parent and fp.name=='FINISHED.json' and
           re.fullmatch(r'[0-9]{6}\.json',jp.name),'protected qualified journal/closed batch required')
    journal=c.public(jp,journal_ref['sha256']);finished=c.public(fp,finished_ref['sha256'])
    c.need(journal.get('schema')=='math-gkm.byte-preserving-file.v1' and journal.get('phase')=='finished' and
           journal.get('path')==record['path'] and journal.get('content')==record['content'] and
           journal.get('replacement')==record['metadata'] and finished.get('schema')=='math-gkm.byte-preserving-batch.v1' and finished.get('phase')=='closed' and
           type(finished.get('completed')) is int and finished['completed']>0,
           'original successful compressed journal does not bind indexed record')
    return journal


def verify_record(record,root):
    journal_record(record,root);scope=Path(record['scope'])
    c.need(scope in a.ACTIVE,'frozen context missing for indexed record')
    ref=a.ACTIVE[scope]
    c.need(c.hashed(ref['path'])['sha256']==ref['sha256'],'frozen archival context changed')
    m=c.metadata(record['path'])
    c.need(m==record['metadata'] and m['flags']==32 and m['nlink']==1,'indexed compressed metadata changed')
    c.need(c.hashed(record['path'])==record['content'],'indexed logical bytes/hash changed')
    return m


def clonefile(source,destination):
    # Called only by the explicitly reviewed escalated host operation. The root
    # separately qualifies the genuine syscall and ordinary-reader behavior.
    library=ctypes.CDLL('/usr/lib/libSystem.B.dylib',use_errno=True)
    call=library.clonefile;call.argtypes=(ctypes.c_char_p,ctypes.c_char_p,ctypes.c_uint32);call.restype=ctypes.c_int
    if call(os.fsencode(source),os.fsencode(destination),0)!=0:
        error=ctypes.get_errno();raise OSError(error,os.strerror(error))


def own_metadata(path,original,atime_ns):
    actual=c.metadata(path)
    if (actual['uid'],actual['gid'])!=(original['uid'],original['gid']):os.chown(path,original['uid'],original['gid'])
    os.chmod(path,original['mode']);os.utime(path,ns=(atime_ns,original['mtime_ns']))


def clone_one(canonical,target,root,journal,cloner=clonefile):
    source=Path(canonical['path']);path=Path(target['path'])
    c.need(source!=path and canonical['content']==target['content'],'different exact-duplicate source/target required')
    source_meta=verify_record(canonical,root);original=verify_record(target,root)
    c.need((source_meta['dev'],source_meta['ino'])!=(original['dev'],original['ino']),'hard-linked canonical/target refused')
    atime_ns=path.stat().st_atime_ns;content=target['content'];token=uuid.uuid4().hex
    temporary=path.with_name('.math-gkm-clone-'+token+'.tmp');backup=path.with_name('.math-gkm-clone-'+token+'.backup')
    c.need(not temporary.exists() and not backup.exists(),'fresh clone/backup required')
    state=dict(schema='math-gkm.byte-preserving-clone-file.v1',canonical_path=str(source),path=str(path),content=content,
        original=original,canonical_metadata=source_meta,temporary=str(temporary),backup=str(backup),phase='clone_intent')
    def phase(name,**extra):state.update(phase=name,**extra);c.save(journal,state)
    c.save(journal,state,fresh=True);copied=None;linked=False;replaced=False
    def intact_backup():
        return c.same_identity(original,c.metadata(backup),nlink=1 if replaced else 2) and c.hashed(backup)==content
    try:
        cloner(source,temporary);copied=c.metadata(temporary);phase('clone_created',cloned_metadata=copied)
        c.need(copied['flags']==32 and copied['nlink']==1 and copied['size']==original['size'] and
               copied['dev']==original['dev'] and copied['ino'] not in (original['ino'],source_meta['ino']) and
               c.hashed(temporary)==content,'clone must have an independent single-link inode before metadata restoration')
        own_metadata(temporary,original,atime_ns);copied=c.metadata(temporary)
        phase('cloned',cloned_metadata=copied)
        c.need(copied['flags']==32 and copied['nlink']==1 and c.content_metadata(original,copied) and
               copied['ino'] not in (original['ino'],source_meta['ino']) and copied['dev']==original['dev'] and
               c.hashed(temporary)==content,'clone integrity/independent-inode/metadata check failed')
        c.sync_file(temporary)
        c.need(c.metadata(source)==source_meta and c.hashed(source)==content and
               c.same_identity(original,c.metadata(path)) and c.hashed(path)==content,'canonical or target changed before replacement')
        phase('backup_intent');os.link(path,backup,follow_symlinks=False);linked=True;c.sync(path.parent);phase('backup_created')
        c.need(c.same_identity(original,c.metadata(path),nlink=2) and intact_backup() and c.hashed(path)==content,
               'target/owned original backup changed')
        phase('replace_intent');os.replace(temporary,path);replaced=True;c.sync(path.parent);phase('replaced')
        c.need(c.same_identity(copied,c.metadata(path)) and c.hashed(path)==content and intact_backup(),
               'clone post-check failed')
        c.need(c.metadata(source)==source_meta and c.hashed(source)==content,'canonical changed after clone')
        c.sync_file(path);phase('postchecked')
        c.need(c.same_identity(copied,c.metadata(path)) and c.hashed(path)==content and intact_backup(),
               'foreign change before original-backup deletion')
        os.unlink(backup);linked=False;c.sync(path.parent)
        phase('finished',replacement=c.metadata(path),hard_link_deduplication=False,per_file_reclaim_claimed=False)
        return True
    except BaseException as error:
        try:
            if replaced:
                c.need(copied is not None and c.same_identity(copied,c.metadata(path)) and linked and intact_backup(),
                       'uncertain clone/backup divergence; preserve both')
                os.replace(backup,path);linked=False;c.sync(path.parent)
                c.need(c.same_identity(original,c.metadata(path)) and c.hashed(path)==content,'restored original changed')
                phase('rolled_back',error_class=type(error).__name__)
            elif linked:
                c.need(c.same_identity(original,c.metadata(path),nlink=2) and intact_backup() and c.hashed(path)==content,
                       'uncertain target/backup divergence')
                os.unlink(backup);linked=False;c.sync(path.parent);phase('original_retained',error_class=type(error).__name__)
            else:phase('original_retained',error_class=type(error).__name__)
            if temporary.exists():
                c.need(copied is not None and c.same_identity(copied,c.metadata(temporary)),'foreign or unregistered temporary clone retained')
                os.unlink(temporary);c.sync(path.parent)
        except BaseException:phase('needs_reconciliation',error_class=type(error).__name__)
        raise


def batch(index_path,index_pin,groups_path,groups_pin,attestation_path,attestation_pin,review_path,review_pin,output,*,root=ROOT,cloner=clonefile,escalated=False,target_free_gib=12):
    root=Path(root);c.need(escalated,'explicit escalated clone operation required')
    c.need(type(target_free_gib) is int and 12<=target_free_gib<=32,'integer free-space target 12..32 required')
    c.need(c.hashed(HERE/'compress_records.py')['sha256']==BASE_SHA and c.hashed(HERE/'archival_records.py')['sha256']==ARCHIVAL_SHA,
           'reviewed supporting source changed')
    index=c.public(index_path,index_pin);groups=c.public(groups_path,groups_pin);attestation=c.public(attestation_path,attestation_pin)
    review=c.public(review_path,review_pin)
    c.need(review.get('schema')=='math-gkm.compressed-clone-review.v1' and review.get('approved') is True and
           review.get('source_sha256')==c.hashed(__file__)['sha256'] and review.get('base_sha256')==BASE_SHA and
           review.get('index_sha256')==index_pin and review.get('groups_sha256')==groups_pin and
           review.get('attestation_sha256')==attestation_pin and Path(review_path).is_relative_to(root/'.bootstrap'),
           'explicit clone source/index/groups/attestation review required')
    c.need(index.get('attestation')=={'path':str(attestation_path),'sha256':attestation_pin},'qualified index attestation changed')
    records=index_records(index,root);tasks=group_targets(groups,index_pin,records,root)
    needed={Path(record['scope']) for task in tasks for record in task}
    output=Path(output);c.need(output.is_absolute() and output.parent.resolve()==output.parent and
                             output.is_relative_to(root/'.bootstrap') and not output.exists(),'fresh protected clone output required')
    started=time.monotonic();completed=0
    with a.contexts(root,attestation),a.locks(root,needed):
        output.mkdir(mode=0o700);free_before=shutil.disk_usage(root).free
        c.save(output/'INTENT.json',dict(schema='math-gkm.compressed-clone-batch.v1',source_sha256=c.hashed(__file__)['sha256'],base_sha256=BASE_SHA,
            index_sha256=index_pin,groups_sha256=groups_pin,attestation_sha256=attestation_pin,review_sha256=review_pin,
            target_free_gib=target_free_gib,free_before_bytes=free_before,per_file_blocks_reclaim_claimed=False,native_guards_changed=False),fresh=True)
        for number,(canonical,target) in enumerate(tasks):
            free=shutil.disk_usage(root).free
            if time.monotonic()-started>=55 or free>=target_free_gib*c.GIB or free-free_before>=8*c.GIB:break
            c.need(free>=2*c.GIB+target['content']['bytes'],'unchanged clone temporary-space floor')
            clone_one(canonical,target,root,output/f'{number:06d}.json',cloner);completed+=1
        free_after=shutil.disk_usage(root).free
        result=dict(schema='math-gkm.compressed-clone-batch.v1',phase='closed',completed=completed,elapsed_seconds=time.monotonic()-started,
            free_before_bytes=free_before,free_after_bytes=free_after,observed_free_delta_bytes=free_after-free_before,
            physical_delta_is_observation_not_attribution=True,per_file_blocks_reclaim_claimed=False,native_guards_changed=False)
        c.save(output/'FINISHED.json',result,fresh=True);return result


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--source-sha256',required=True);p.add_argument('--out',type=Path,required=True)
    for name in ('index','groups','attestation','review'):
        p.add_argument('--'+name,type=Path,required=True);p.add_argument('--'+name+'-sha256',required=True)
    p.add_argument('--escalated-context-qualified',action='store_true');p.add_argument('--target-free-gib',type=int,default=12);args=p.parse_args()
    c.need(c.hashed(__file__)['sha256']==args.source_sha256,'clone source changed')
    result=batch(args.index,args.index_sha256,args.groups,args.groups_sha256,args.attestation,args.attestation_sha256,args.review,args.review_sha256,args.out,
                 escalated=args.escalated_context_qualified,target_free_gib=args.target_free_gib)
    print(json.dumps(result,sort_keys=True))

if __name__=='__main__':main()
