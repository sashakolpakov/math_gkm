"""Finished exact validator bundles. Partial result.json is never reusable."""
from .study_common import ROOT,Invalid,digest,sha,read,write

class UnfinishedReceipt(Invalid):
    """Typed controller recovery failure, independent of exception prose."""


def completion_binding(result):
    """A checked stream retains the producer's independent completion evidence."""
    from .proof_audit import SCHEMA
    rows=result.get('declarations',[])
    evidence=result.get('producer_completion')
    if not rows:
        if result.get('checked') or result.get('resolved'):
            raise Invalid('successful result lacks producer completion')
        return None
    if (not isinstance(evidence,dict) or evidence.get('schema')!='math-gkm.producer-completion.v3' or
            result.get('inspection_schema')!=SCHEMA or
            evidence.get('artifact_sha256')!=result.get('declaration_artifact_sha256') or
            any(r.get('producer_completion')!=evidence or r.get('artifact_sha256')!=evidence.get('artifact_sha256')
                or r.get('artifact_bytes')!=evidence.get('artifact_bytes') for r in rows)):
        raise Invalid('result producer completion binding changed')
    import re
    if (not re.fullmatch('[0-9a-f]{64}',str(evidence.get('nonce'))) or
            not re.fullmatch('[0-9a-f]{64}',str(evidence.get('artifact_sha256'))) or
            type(evidence.get('artifact_bytes')) is not int or not 0<evidence['artifact_bytes']<=32*1024**2):
        raise Invalid('invalid producer completion evidence')
    inspected=[c for c in result.get('checks',[]) if c.get('operation')=='trusted_premise_inspection']
    marker=f"GKM_DECLARATIONS_COMPLETE_V3:{evidence['nonce']}:{evidence['artifact_bytes']}:{evidence['artifact_sha256']}"
    if (len(inspected)!=1 or inspected[0].get('returncode')!=0 or inspected[0].get('termination') or
            [s for s in inspected[0].get('stdout','').splitlines() if s.startswith('GKM_DECLARATIONS')]!=[marker]):
        raise Invalid('missing trusted producer completion record')
    return evidence

def finish(directory,task,solution,required):
    result=read(directory/'result.json',max_bytes=64*1024**2)
    if 'finished' not in result: raise Invalid('unfinished validator result')
    evidence=completion_binding(result)
    if evidence and sha(directory/'source/declarations.json')!=evidence['artifact_sha256']:
        raise Invalid('completed producer artifact changed before finalization')
    files={}; total=0
    for p in directory.rglob('*'):
        if p.is_symlink(): raise Invalid('symlink in validator receipt')
        if p.is_file() and 'build' not in p.relative_to(directory).parts and p.name!='FINISHED.json':
            total+=p.stat().st_size
            if total>256*1024**2 or len(files)>=10000:
                raise Invalid('finished validator bundle bound; preserve artifacts without reusable acceptance')
            files[str(p.relative_to(directory))]=sha(p)
    write(directory/'FINISHED.json',dict(schema='math-gkm.finished-validator.v3',
        inspection_schema=result.get('inspection_schema'),
        producer_completion=evidence,
        task_hash=digest(task),solution_hash=digest(solution),required=list(required),
        files=files,files_binding=digest(files),finished=True))

def reuse(directory,task,solution,required):
    marker=directory/'FINISHED.json'
    if not marker.is_file(): raise UnfinishedReceipt('unfinished validator receipt; charged new attempt required')
    receipt=read(marker)
    from .proof_audit import SCHEMA
    if receipt.get('schema')!='math-gkm.finished-validator.v3' or receipt.get('inspection_schema')!=SCHEMA:
        raise Invalid('validator identity schema changed; charged fresh attempt required')
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
    if completion_binding(result)!=receipt.get('producer_completion'):
        raise Invalid('receipt producer completion binding changed')
    for name,expected in result.get('binary_hashes',{}).items():
        if sha(name)!=expected: raise Invalid('validator binary identity changed')
    for name,expected in result.get('pin_hashes',{}).items():
        if sha(ROOT/name)!=expected: raise Invalid('validator pin identity changed')
    return result
