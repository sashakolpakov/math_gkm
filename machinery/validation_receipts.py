"""Finished exact validator bundles. Partial result.json is never reusable."""
from .study_common import ROOT,Invalid,digest,sha,read,write

def finish(directory,task,solution,required):
    result=read(directory/'result.json',max_bytes=64*1024**2)
    if 'finished' not in result: raise Invalid('unfinished validator result')
    files={}; total=0
    for p in directory.rglob('*'):
        if p.is_symlink(): raise Invalid('symlink in validator receipt')
        if p.is_file() and 'build' not in p.relative_to(directory).parts and p.name!='FINISHED.json':
            total+=p.stat().st_size
            if total>256*1024**2 or len(files)>=10000:
                raise Invalid('finished validator bundle bound; preserve artifacts without reusable acceptance')
            files[str(p.relative_to(directory))]=sha(p)
    write(directory/'FINISHED.json',dict(schema='math-gkm.finished-validator.v1',
        task_hash=digest(task),solution_hash=digest(solution),required=list(required),
        files=files,files_binding=digest(files),finished=True))

def reuse(directory,task,solution,required):
    marker=directory/'FINISHED.json'
    if not marker.is_file(): raise Invalid('unfinished validator receipt; charged new attempt required')
    receipt=read(marker)
    if (receipt.get('finished') is not True or receipt.get('task_hash')!=digest(task) or
        receipt.get('solution_hash')!=digest(solution) or receipt.get('required')!=list(required) or
        receipt.get('files_binding')!=digest(receipt.get('files',{}))):
        raise Invalid('validator receipt exact binding changed')
    for name,expected in receipt['files'].items():
        path=directory/name
        if path.is_symlink() or not path.resolve().is_relative_to(directory.resolve()) or sha(path)!=expected:
            raise Invalid('validator receipt artifact changed')
    result=read(directory/'result.json',max_bytes=64*1024**2)
    if 'finished' not in result: raise Invalid('unfinished validator result')
    for name,expected in result.get('binary_hashes',{}).items():
        if sha(name)!=expected: raise Invalid('validator binary identity changed')
    for name,expected in result.get('pin_hashes',{}).items():
        if sha(ROOT/name)!=expected: raise Invalid('validator pin identity changed')
    return result
