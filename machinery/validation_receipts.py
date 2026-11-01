"""Finished exact validator bundles. Partial result.json is never reusable."""
from .study_common import ROOT,Invalid,digest,sha,read,write

class UnfinishedReceipt(Invalid):
    """Typed controller recovery failure, independent of exception prose."""


def completion_binding(result, *, inspection_profile=None):
    """A checked stream retains the producer's independent completion evidence."""
    from .inspection_profiles import from_result, validate_binding
    profile=from_result(result,profile_id=inspection_profile)
    rows=result.get('declarations',[])
    evidence=result.get('producer_completion')
    if not rows:
        if result.get('checked') or result.get('resolved'):
            raise Invalid('successful result lacks producer completion')
        return None
    if (not isinstance(evidence,dict) or evidence.get('schema')!=profile.completion_schema or
            result.get('inspection_schema')!=profile.inspection_schema or
            evidence.get('artifact_sha256')!=result.get('declaration_artifact_sha256') or
            any(r.get('producer_completion')!=evidence or r.get('artifact_sha256')!=evidence.get('artifact_sha256')
                or r.get('artifact_bytes')!=evidence.get('artifact_bytes') for r in rows)):
        raise Invalid('result producer completion binding changed')
    if profile.catalogue:
        validate_binding(evidence.get('inspection_profile'),profile_id=profile.id)
        for row in rows:
            validate_binding(row.get('inspection_profile'),profile_id=profile.id)
            if row.get('inspection_schema')!=profile.inspection_schema:
                raise Invalid('declaration inspection profile schema changed')
    else:
        # Historical ordinary V3 evidence has no profile field. An optional
        # binding can only identify the same unchanged ordinary preset.
        for value in (evidence,*rows):
            if 'inspection_profile' in value:
                validate_binding(value['inspection_profile'],profile_id=profile.id)
    import re
    if (not re.fullmatch('[0-9a-f]{64}',str(evidence.get('nonce'))) or
            not re.fullmatch('[0-9a-f]{64}',str(evidence.get('artifact_sha256'))) or
            type(evidence.get('artifact_bytes')) is not int or not 0<evidence['artifact_bytes']<=profile.artifact_bytes):
        raise Invalid('invalid producer completion evidence')
    inspected=[c for c in result.get('checks',[]) if c.get('operation')=='trusted_premise_inspection']
    marker=(f"GKM_DECLARATIONS_COMPLETE_CATALOGUE_V1:{evidence['nonce']}:{profile.id}:{evidence['artifact_bytes']}:{evidence['artifact_sha256']}"
        if profile.catalogue else
        f"GKM_DECLARATIONS_COMPLETE_V3:{evidence['nonce']}:{evidence['artifact_bytes']}:{evidence['artifact_sha256']}")
    if (len(inspected)!=1 or inspected[0].get('returncode')!=0 or inspected[0].get('termination') or
            [s for s in inspected[0].get('stdout','').splitlines() if s.startswith('GKM_DECLARATIONS')]!=[marker]):
        raise Invalid('missing trusted producer completion record')
    return evidence

def finish(directory,task,solution,required,*,inspection_profile=None):
    result=read(directory/'result.json',max_bytes=64*1024**2)
    if 'finished' not in result: raise Invalid('unfinished validator result')
    from .inspection_profiles import from_result
    profile=from_result(result,profile_id=inspection_profile)
    evidence=completion_binding(result,inspection_profile=profile.id)
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
    receipt=dict(schema=('math-gkm.finished-validator.catalogue.v1' if profile.catalogue
            else 'math-gkm.finished-validator.v3'),
        inspection_schema=result.get('inspection_schema'),
        producer_completion=evidence,
        task_hash=digest(task),solution_hash=digest(solution),required=list(required),
        files=files,files_binding=digest(files),finished=True)
    if profile.catalogue or 'inspection_profile' in result:
        receipt['inspection_profile']=profile.binding()
    write(directory/'FINISHED.json',receipt)

def reuse(directory,task,solution,required,*,inspection_profile=None):
    marker=directory/'FINISHED.json'
    if not marker.is_file(): raise UnfinishedReceipt('unfinished validator receipt; charged new attempt required')
    receipt=read(marker)
    from .inspection_profiles import resolve, from_result, validate_binding
    profile=resolve(inspection_profile)
    receipt_schema=('math-gkm.finished-validator.catalogue.v1' if profile.catalogue
        else 'math-gkm.finished-validator.v3')
    if receipt.get('schema')!=receipt_schema or receipt.get('inspection_schema')!=profile.inspection_schema:
        raise Invalid('validator identity schema changed; charged fresh attempt required')
    if profile.catalogue or 'inspection_profile' in receipt:
        validate_binding(receipt.get('inspection_profile'),profile_id=profile.id)
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
    from_result(result,profile_id=profile.id)
    if completion_binding(result,inspection_profile=profile.id)!=receipt.get('producer_completion'):
        raise Invalid('receipt producer completion binding changed')
    for name,expected in result.get('binary_hashes',{}).items():
        if sha(name)!=expected: raise Invalid('validator binary identity changed')
    for name,expected in result.get('pin_hashes',{}).items():
        if sha(ROOT/name)!=expected: raise Invalid('validator pin identity changed')
    return result
