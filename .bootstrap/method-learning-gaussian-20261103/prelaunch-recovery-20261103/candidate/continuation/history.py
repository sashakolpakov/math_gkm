"""Read-only exact provenance for one source-certified prelaunch uncertainty.

A settlement is not a numeric process exit. Unknown uncertainty is never settled
by this module. Private request/state fields remain lexical opaque bytes.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
import stat

ROOT=Path('/Users/sasha/math_gkm')
PARSER=ROOT/'.bootstrap/gaussian-native-operator-20261031/public_json_projection.py'
PARSER_SHA='5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec'
EPOCH_SHA='ccce0ae7147894b20b3b5afa6911a1fc334ef35bebab2bc286cd11911adf5e9d'
class Hold(RuntimeError):pass

def need(value,message):
    if not value:raise Hold(message)

def raw(path,cap=64*1024**2):
    path=Path(path)
    need(path.is_absolute() and path.resolve(strict=True)==path and
         stat.S_ISREG(path.lstat().st_mode) and path.stat().st_size<=cap,'bounded unaliased regular artifact required')
    return path.read_bytes()

def sha(path):return hashlib.sha256(raw(path)).hexdigest()
def digest(value):return hashlib.sha256(json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode()).hexdigest()
def public(path):
    value=json.loads(raw(path,8*1024**2));need(isinstance(value,dict),'public metadata object required');return value

def projection():
    need(sha(PARSER)==PARSER_SHA,'lexical projection source changed')
    spec=importlib.util.spec_from_file_location('gaussian_revision_history_projection',PARSER)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module

def pointer(row):
    need(isinstance(row,dict) and set(row)=={'path','sha256'},'typed immutable public reference required')
    path=Path(row['path'])
    need(path.is_relative_to(ROOT) and sha(path)==row['sha256'],'public reference changed or escaped')
    return path

def grant(reference):
    value=public(pointer(reference));core=value.get('revision_core',{})
    need(value.get('schema')=='math-gkm.closed-prelaunch-proposer-recovery.v1' and
         value.get('classification')=='closed_protocol_guard_failure_before_watchdog' and
         value.get('no_model_started') is True and value.get('native_cleanup_verified') is True and
         core.get('schema')=='math-gkm.prelaunch-source-revision.v1' and
         digest(core)==value.get('revision_binding') and
         all(core.get(k)==value.get(k) for k in ('study','arm','failed_request_id','implementation_sha256','old_implementation_sha256','receipt_file_sha256','spec_sha256','request_binding','protocol_sha256')),
         'source-qualified prelaunch grant differs')
    return value

def migration_parent(study,mode,key,receipt_binding,e):
    """Read only selected provenance fields; never decode old_accounting."""
    marker=public(study/'MIGRATION_FINISHED.json')
    need(marker.get('schema')=='math-gkm.closed-own-epoch.v1' and marker.get('source_sha256')==EPOCH_SHA,
         'inherited uncertainty lacks exact epoch-source provenance')
    path=study/'CONTINUATION_PROVENANCE.json'
    need(sha(path)==marker.get('provenance_sha256'),'migration provenance changed')
    f=e.fields(raw(path).strip());row=e.select(f,('schema','parent_study','arm','parent_state_sha256','parent_seal_sha256','inherited_main_jobs'))
    need(row.get('schema')=='math-gkm.closed-own-epoch.v1' and row.get('arm')==mode,'inherited arm identity differs')
    seal=e.fields(raw(study/'seal.json').strip())
    need(e.select(seal,('continuation_provenance_sha256',)).get('continuation_provenance_sha256')==sha(path),
         'inherited provenance is not bound to the sealed epoch')
    entries=[x for x in row.get('inherited_main_jobs',[]) if x.get('key')==key]
    need(len(entries)==1 and entries[0].get('path')==str(study/'arms'/mode/'jobs'/key) and
         entries[0].get('receipt_hash')==receipt_binding,'uncertain job is not exact inherited own history')
    parent=Path(row.get('parent_study',''))
    need(parent.is_absolute() and parent.resolve()==parent and parent.parent==ROOT/'.scratch/studies' and
         parent!=study and sha(parent/'arms'/mode/'state.json')==row.get('parent_state_sha256') and
         sha(parent/'seal.json')==row.get('parent_seal_sha256'),'historical parent changed')
    return parent

def certified_uncertainty(study,mode,job,g,e=None):
    e=e or projection();study=Path(study);origin=Path(g['study']);key=g['failed_request_id']
    need(mode==g['arm'] and job.name==key,'uncertainty is not the uniquely certified proposer slot')
    need(sha(job/'receipt.json')==g['receipt_file_sha256'] and sha(job/'spec.json')==g['spec_sha256'],
         'historical proposer receipt or specification changed')
    # Native requests are canonical JSON; hash opaque raw tokens, never decode them.
    need(hashlib.sha256(raw(job/'request.json').strip()).hexdigest()==g['request_binding'],
         'historical proposer request changed')
    f=e.fields(raw(job/'receipt.json').strip());r=e.select(f,('request_id','role','outcome','elapsed_seconds','mathematical_resolution','returncode'))
    need(r.get('request_id')==key and r.get('role')=='proposer' and
         r.get('outcome')=='uncertain_effects_not_replayed' and r.get('mathematical_resolution') is False and
         f.get('payload')==b'null' and 'returncode' not in f and
         type(r.get('elapsed_seconds')) in (int,float) and r['elapsed_seconds']>0,
         'uncertainty receipt is not preserved as nonnumeric and fully charged')
    need(hashlib.sha256(raw(job/'receipt.json').strip()).hexdigest()==g['receipt_binding'],
         'historical receipt semantic binding differs')
    seen=set();cursor=study
    for _ in range(256):
        need(cursor not in seen,'historical continuation cycle');seen.add(cursor)
        current=cursor/'arms'/mode/'jobs'/key
        for name in ('receipt.json','spec.json','request.json'):
            need(sha(current/name)==sha(job/name),'inherited proposer artifact differs from canonical history')
        if cursor==origin:break
        cursor=migration_parent(cursor,mode,key,g['receipt_binding'],e)
    else:raise Hold('historical continuation chain exceeds bounded verification')
    original=origin/'arms'/mode/'jobs'/key
    allowed={'receipt.json','spec.json','request.json','prompt.txt','prelaunch-recovery.json'}
    need({p.name for p in original.iterdir()}<=allowed and
         sha(original/'prompt.txt')==g['prompt_sha256'] and sha(origin/'protocol.json')==g['protocol_sha256'],
         'canonical prelaunch history contains worker effects or changed protocol/prompt')
    protocol=e.select(e.fields(raw(origin/'protocol.json').strip()),('model','transport','call_seconds'))
    specification=e.select(e.fields(raw(original/'spec.json').strip()),
        ('request_id','role','readonly','model','reasoning_effort','seconds','workspace','transport'))
    receipt=e.select(f,('model','reasoning_effort','elapsed_seconds'))
    need(specification.get('request_id')==key and specification.get('role')=='proposer' and
         specification.get('readonly') is True and specification.get('transport')=='live' and
         protocol.get('transport')=='live' and specification.get('model')==protocol.get('model')==receipt.get('model') and
         specification.get('reasoning_effort')==receipt.get('reasoning_effort')=='high' and
         specification.get('seconds')==protocol.get('call_seconds')==receipt.get('elapsed_seconds') and
         specification.get('workspace')==str(origin/'arms'/mode/'workspace'),
         'canonical uncertainty is not the original fully charged read-only live proposer')
    archive=g['revision_core'].get('old_files',{}).get(str(origin/'arms'/mode/'state.json'))
    need(archive is not None and archive.get('sha256')==g['stopped_state_sha256'],
         'original stopped accounting archive is not bound to the grant')
    envelope=e.fields(raw(pointer(archive)).strip());body=envelope['state']
    need(e.select(envelope,('sha256',)).get('sha256')==hashlib.sha256(body).hexdigest(),
         'original stopped accounting integrity differs')
    counters=e.select(e.fields(body),('reservations','counted_jobs','receipts','receipt_hashes'))
    original_name=str(original)
    need(counters.get('reservations',{}).get('call-'+key)==specification['seconds'] and
         counters.get('counted_jobs',[]).count(key)==1 and
         counters.get('receipts',[]).count(original_name)==1 and
         counters.get('receipt_hashes',{}).get(original_name)==g['receipt_binding'],
         'original uncertainty charge or exact receipt registry was not preserved')
    return True

def settlement(study,mode,reference,e=None):
    e=e or projection();g=grant(reference);jobs=Path(study)/'arms'/mode/'jobs'
    numeric=True;settled=True;certified=0
    for job in sorted(jobs.iterdir()) if jobs.exists() else ():
        need(job.is_dir() and not job.is_symlink(),'job directory alias')
        receipt=job/'receipt.json'
        if not receipt.exists():numeric=False;settled=False;continue
        f=e.fields(raw(receipt).strip());r=e.select(f,('request_id','returncode'))
        if r.get('request_id')==job.name and type(r.get('returncode')) is int:continue
        numeric=False
        try:certified_uncertainty(Path(study),mode,job,g,e);certified+=1
        except (Hold,OSError,ValueError,KeyError):settled=False
    return {'all_job_receipts_numeric':numeric,'all_jobs_settled':settled,
            'certified_prelaunch_uncertainty_count':certified}
