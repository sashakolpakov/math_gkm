"""INACTIVE extension for logical-byte preservation of frozen Markov records.

Only exact scope/data-file classification and a typed archival context differ
from the pinned V2 primitive. All copy/hash/fsync/backup/rollback/limit code is
loaded unchanged in a separate module instance. No native research code changes.
"""
import argparse
import contextlib
import importlib.util
import json
import os
from pathlib import Path
import re
import time

HERE=Path(__file__).resolve().parent
BASE=HERE/'compress_records.py'
BASE_SHA='0ef160cdbac52ae8793ac932af60ef2ef42dd8e167c454fa7557d2660246fd60'
import hashlib
assert hashlib.sha256(BASE.read_bytes()).hexdigest()==BASE_SHA
spec=importlib.util.spec_from_file_location('isolated_archival_v2_primitive',BASE)
c=importlib.util.module_from_spec(spec);spec.loader.exec_module(c)
ROOT=c.ROOT
EXTENSIONS={'.json','.jsonl','.log','.txt'}
CONTEXT='math-gkm.frozen-markov-archival-context.v1'
MANIFEST='math-gkm.markov-archival-manifest.v1'
REVIEW='math-gkm.markov-archival-review.v1'
ACTIVE={}
old_locks=c.locks

def scope_path(root,path):
    root=Path(root);p=Path(path)
    allowed=(p==root/'.bootstrap/concept-driver-20261020' or
             (p.parent==root/'.scratch' and c.SCOPE.fullmatch(p.name)))
    c.need(allowed and p.is_absolute() and p.resolve(strict=True)==p and p.is_dir(),
           'only exact frozen Markov archive roots allowed')
    return p

def classify(root,path,scopes):
    root=Path(root);p=Path(path)
    matches=[s for s in scopes if p.is_relative_to(s)]
    c.need(len(matches)==1,'record outside explicit frozen scope')
    scope=scope_path(root,matches[0]);relative=p.relative_to(scope)
    c.need(p.suffix in EXTENSIONS and not any(part in ('.git','.lake','__pycache__','node_modules','source','sources','MathGKM','machinery','packages','toolchain') for part in relative.parts),
           'only archival data files, not native/source/dependency files')
    c.need(not any('gaussian' in part.lower() or part in ('native','deployment-v4') or
                  any(date>'20261030' for date in re.findall(r'2026[0-9]{4}',part)) for part in relative.parts),
           'current Gaussian/native or later record excluded')
    m=c.metadata(p)
    c.need(c.eligible(m),'record is not within unchanged single-link/flags/256KiB..64MiB bounds')
    return scope,m

def load_contexts(root,attestation):
    c.need(attestation.get('schema')=='math-gkm.frozen-math-record-scopes.v1' and attestation.get('root')==str(root),
           'archival attestation scope differs')
    result={}
    for row in attestation['scopes']:
        scope=scope_path(root,row['path']);c.need(row.get('owned') is True and row.get('frozen') is True,'explicit frozen ownership required')
        ref=row['closure_evidence'];path=Path(ref['path'])
        c.need(path.is_relative_to(Path(root)/'.bootstrap') and not path.is_relative_to(Path(root)/'.bootstrap/concept-driver-20261020'),
               'archival context must be protected outside mutable archive roots')
        c.need(c.metadata(path)['size']<=1024**2,'bounded archival context required')
        value=c.public(path,ref['sha256'])
        c.need(value.get('schema')==CONTEXT and value.get('root')==str(root) and value.get('scope')==str(scope) and
               value.get('owned') is True and value.get('frozen') is True and
               value.get('mathematical_validity_claim') is False and value.get('whole_scope_process_liveness_claim') is False and
               value.get('research_resume_authorized') is False and isinstance(value.get('user_authority'),str) and bool(value['user_authority'].strip()),
               'typed archival-only freeze context required')
        c.need(scope not in result,'duplicate archival scope')
        result[scope]=dict(path=str(path),sha256=ref['sha256'])
    return result

@contextlib.contextmanager
def contexts(root,attestation):
    global ACTIVE
    previous=ACTIVE;ACTIVE=load_contexts(root,attestation)
    try:yield
    finally:ACTIVE=previous

def permitted(root,path,scopes):
    scope,m=classify(root,path,scopes);c.need(scope in ACTIVE,'typed archival context not loaded')
    ref=ACTIVE[scope];c.need(c.hashed(ref['path'])['sha256']==ref['sha256'],'archival context changed')
    return scope,m,dict(path=ref['path'],metadata=c.metadata(ref['path']))

@contextlib.contextmanager
def locks(root,scopes):
    # Bootstrap history can refer to any old follow scope; fence every existing
    # old controller alongside the shared heavy lease in that case. This is not
    # a process-liveness assertion or authority to resume any controller.
    scopes=set(scopes);root=Path(root)
    if root/'.bootstrap/concept-driver-20261020' in scopes:
        for p in (root/'.scratch').iterdir():
            if c.SCOPE.fullmatch(p.name) and p.is_dir() and not p.is_symlink():scopes.add(scope_path(root,p))
    with old_locks(root,scopes):yield

# Separate imported instance only; the pinned V2 file and active modules stay unchanged.
c.scope_path=scope_path
c.permitted=permitted
c.locks=locks

def bind_manifest(candidates,attestation,root=ROOT):
    root=Path(root);c.need(candidates.get('archival_schema')==MANIFEST and candidates.get('root')==str(root),'candidate manifest differs')
    with contexts(root,attestation):
        scopes=list(ACTIVE);rows=[]
        for row in candidates['files']:
            _,m,marker=permitted(root,Path(row['path']),scopes)
            c.need(m==row['metadata'],'archival candidate metadata changed')
            rows.append(dict(path=row['path'],metadata=m,finished=marker))
    return {**candidates,'schema':'math-gkm.byte-preserving-maintenance-manifest.v1','files':rows}

def batch(manifest_path,manifest_pin,attestation_path,attestation_pin,review_path,review_pin,output,*,root=ROOT,runner=c.ditto,escalated=False,target_free_gib=12):
    root=Path(root);c.need(c.hashed(BASE)['sha256']==BASE_SHA,'pinned V2 changed')
    manifest=c.public(manifest_path,manifest_pin);attestation=c.public(attestation_path,attestation_pin);review=c.public(review_path,review_pin)
    c.need(manifest.get('archival_schema')==MANIFEST and manifest.get('source_sha256')==c.hashed(__file__)['sha256'] and
           manifest.get('base_sha256')==BASE_SHA,'explicit current-source archival manifest required')
    c.need(Path(review_path).is_relative_to(root/'.bootstrap') and not Path(review_path).is_relative_to(root/'.bootstrap/concept-driver-20261020') and review.get('schema')==REVIEW and review.get('approved') is True and
           review.get('source_sha256')==c.hashed(__file__)['sha256'] and review.get('base_sha256')==BASE_SHA and
           review.get('manifest_sha256')==manifest_pin and review.get('attestation_sha256')==attestation_pin,
           'explicit source/manifest/attestation archival review required')
    with contexts(root,attestation):
        return c.batch(manifest_path,manifest_pin,attestation_path,attestation_pin,output,root=root,runner=runner,
                       escalated=escalated,target_free_gib=target_free_gib)

def discover(scopes,root=ROOT,max_entries=100000,seconds=60):
    root=Path(root);scopes=[scope_path(root,p) for p in scopes];rows=[];seen=0;incomplete=False;start=time.monotonic()
    def walk(path,depth=0):
        nonlocal seen,incomplete
        if depth>30:return
        with os.scandir(path) as it:
            for entry in it:
                if seen>=max_entries or time.monotonic()-start>=seconds:incomplete=True;return
                seen+=1
                if entry.is_symlink():continue
                p=Path(entry.path)
                if entry.is_dir(follow_symlinks=False):
                    if entry.name not in ('.git','.lake','__pycache__','node_modules','source','sources','MathGKM','machinery','packages','toolchain'):walk(p,depth+1)
                elif p.suffix in EXTENSIONS and entry.is_file(follow_symlinks=False):
                    try:_,m=classify(root,p,scopes)
                    except (c.Hold,OSError):continue
                    rows.append(dict(path=str(p),metadata=m))
    for scope in scopes:
        walk(scope)
        if incomplete:break
    rows.sort(key=lambda row:row['metadata']['blocks'],reverse=True)
    return dict(archival_schema=MANIFEST,root=str(root),scopes=list(map(str,scopes)),files=rows,entries=seen,incomplete=incomplete,
                elapsed_seconds=time.monotonic()-start,eligible_files=len(rows),eligible_allocated_bytes=sum(row['metadata']['blocks'] for row in rows),
                eligible_logical_bytes=sum(row['metadata']['size'] for row in rows),context_required=True,source_sha256=c.hashed(__file__)['sha256'],base_sha256=BASE_SHA)

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('action',choices=('discover','bind','compress'))
    p.add_argument('--source-sha256',required=True);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--scope',type=Path,action='append');p.add_argument('--manifest',type=Path);p.add_argument('--manifest-sha256')
    p.add_argument('--frozen-scopes',type=Path);p.add_argument('--frozen-scopes-sha256');p.add_argument('--review',type=Path);p.add_argument('--review-sha256')
    p.add_argument('--escalated-context-qualified',action='store_true');p.add_argument('--target-free-gib',type=int,default=12);a=p.parse_args()
    c.need(c.hashed(__file__)['sha256']==a.source_sha256,'archival source changed')
    if a.action=='discover':
        c.need(bool(a.scope),'explicit old scopes required');value=discover(a.scope);c.save(a.out,value,fresh=True)
    elif a.action=='bind':
        value=bind_manifest(c.public(a.manifest,a.manifest_sha256),c.public(a.frozen_scopes,a.frozen_scopes_sha256));c.save(a.out,value,fresh=True)
    else:value=batch(a.manifest,a.manifest_sha256,a.frozen_scopes,a.frozen_scopes_sha256,a.review,a.review_sha256,a.out,
                     escalated=a.escalated_context_qualified,target_free_gib=a.target_free_gib)
    print(json.dumps({k:v for k,v in value.items() if k in ('eligible_files','eligible_allocated_bytes','entries','incomplete','phase','completed','saved_bytes')}))

if __name__=='__main__':main()
