"""INACTIVE origin-only settlement of a source-certified read-only role nonlaunch.

No receipt is changed, no return code is invented, and no retry is authorized.
The old source-certified proposer settlement remains an independent exact case.
"""
import ast
import hashlib
import importlib.util
from pathlib import Path

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
OLD_HISTORY=HERE.parent/'continuation/history.py'
OLD_HISTORY_SHA='1fee76a68a967cda5045d17f806eac6a27d35bed24f1038cbc3d952a96cbe849'
if hashlib.sha256(OLD_HISTORY.read_bytes()).hexdigest()!=OLD_HISTORY_SHA:raise RuntimeError('published historical settlement source changed')
spec=importlib.util.spec_from_file_location('gaussian_resume_original_history',OLD_HISTORY)
H=importlib.util.module_from_spec(spec);spec.loader.exec_module(H)
Hold=H.Hold;need=H.need;raw=H.raw;sha=H.sha;digest=H.digest;projection=H.projection;pointer=H.pointer;public=H.public
SCHEMA='math-gkm.closed-readonly-role-nonlaunch.v1'
OBSERVATION_SCHEMA='math-gkm.closed-readonly-role-prelaunch-observation.v1'


def closure(row,success):
    need(row.get('actual_numeric_exit_observed') is True and type(row.get('returncode')) is int and
         (row['returncode']==0)==success and isinstance(row.get('completion_reference'),str) and
         bool(row['completion_reference'].strip()),'actual closed invocation evidence missing')


def validate_certificate(reference,c):
    certificate=public(pointer(reference));study=Path(c['parent_study']);mode='exploration';e=projection()
    need(certificate.get('schema')==SCHEMA and certificate.get('study')==str(study) and certificate.get('arm')==mode and
         certificate.get('implementation_sha256')==c['implementation_sha256'] and
         certificate.get('contract_sha256')==c['contract_sha256'] and certificate.get('role')=='reviewer' and
         certificate.get('paid_retry_authorized') is False,'read-only nonlaunch certificate scope differs')
    key=certificate.get('request_id');round_index=certificate.get('round')
    need(type(round_index) is int and round_index>=0 and key==f'review-source-v1-{round_index}',
         'nonlaunch certificate is not the native own-source review identity')
    job=study/'arms'/mode/'jobs'/key
    names={'spec':'spec.json','request':'request.json','prompt':'prompt.txt','receipt':'receipt.json'}
    for field,name in names.items():need(pointer(certificate[field])==job/name,'review nonlaunch artifact escaped its original job')
    need({p.name for p in job.iterdir()}==set(names.values()),'review nonlaunch has worker/watchdog or unknown effects')
    receipt_fields=e.fields(raw(job/'receipt.json').strip())
    receipt=e.select(receipt_fields,('request_id','role','outcome','elapsed_seconds','model','reasoning_effort','mathematical_resolution'))
    spec=e.select(e.fields(raw(job/'spec.json').strip()),('request_id','role','readonly','model','reasoning_effort','seconds','transport','workspace'))
    request=e.select(e.fields(raw(job/'request.json').strip()),('request_id','role','model','reasoning_effort','review_scope'))
    protocol_path=pointer(certificate['protocol']);need(protocol_path==study/'protocol.json','review protocol escaped original study')
    protocol=e.select(e.fields(raw(protocol_path).strip()),('call_seconds','model','transport'))
    need(receipt.get('request_id')==spec.get('request_id')==request.get('request_id')==key and
         receipt.get('role')==spec.get('role')==request.get('role')=='reviewer' and
         receipt.get('outcome')=='uncertain_effects_not_replayed' and 'returncode' not in receipt_fields and
         receipt_fields.get('payload')==b'null' and receipt.get('mathematical_resolution') is False and
         spec.get('readonly') is True and spec.get('transport')==protocol.get('transport')=='live' and
         receipt.get('elapsed_seconds')==spec.get('seconds')==protocol.get('call_seconds')==1800 and
         receipt.get('model')==spec.get('model')==request.get('model')==protocol.get('model') and
         receipt.get('reasoning_effort')==spec.get('reasoning_effort')==request.get('reasoning_effort')=='high' and
         request.get('review_scope')=='own_sources_only','review uncertainty is not the original fully charged read-only role')
    workspace=Path(spec.get('workspace',''))
    need(workspace==study/'arms'/mode/'roles'/key and workspace.is_absolute() and workspace.resolve().is_relative_to(study/'arms'/mode),
         'read-only review workspace escaped its arm')
    archive=pointer(certificate['recovered_state']);envelope=e.fields(raw(archive).strip());body=envelope['state']
    need(e.select(envelope,('sha256',)).get('sha256')==hashlib.sha256(body).hexdigest(),'recovered accounting envelope differs')
    state=e.fields(body);accounting=e.select(state,('round','phase','reservations','counted_jobs','receipts','receipt_hashes','budget_pools','protocol_attempts','protocol_reserved_seconds','protocol_state'))
    need(accounting.get('round')==round_index and accounting.get('phase')=='review' and
         all(state.get(k,b'null')==b'null' for k in ('active','active_intent','resolution')) and
         accounting.get('reservations',{}).get('call-'+key)==1800 and accounting.get('counted_jobs',[]).count(key)==1 and
         accounting.get('receipts',[]).count(str(job))==1 and
         accounting.get('receipt_hashes',{}).get(str(job))==hashlib.sha256(raw(job/'receipt.json').strip()).hexdigest(),
         'original review call or exact recovered receipt was refunded, duplicated, or remains active')
    pool_key='review-'+str(round_index);guard=accounting.get('protocol_state',{})
    need(accounting.get('budget_pools',{}).get(pool_key)=={'cap':3600,'spent':1800,'calls':2,'calls_spent':1,'meta_calls':2,'meta_calls_spent':1} and
         accounting.get('reservations',{}).get('pool-'+pool_key)==3600 and
         type(accounting.get('protocol_attempts')) is int and accounting['protocol_attempts']>=0 and
         accounting.get('protocol_reserved_seconds')==30*accounting['protocol_attempts'] and
         guard.get('pending') is None and guard.get('inflight') is False,
         'native review pool or charged protocol accounting was changed')
    observation=public(pointer(certificate['observation']))
    handoff=public(pointer(c['resume_handoff']))
    need(certificate['recovered_state']==handoff.get('recovered_states',{}).get(mode,{}).get('archive') and
         certificate['protocol']==handoff.get('protocol') and
         all(observation.get(k)==handoff.get(k) for k in ('owner_exit','native_exit','recovery_exit','predecessor_owner','predecessor_config','predecessor_output')) and
         observation.get('predecessor_config')==c['resume_predecessor_config'],
         'no-launch evidence belongs to another closed owner or recovered state')
    need(observation.get('schema')==OBSERVATION_SCHEMA and
         all(observation.get(k)==certificate[k] for k in ('study','arm','request_id','role','round','implementation_sha256','contract_sha256')) and
         observation.get('watchdog_popen_reached') is False and observation.get('model_started') is False and
         observation.get('cleanup_verified') is True,'read-only observation lacks positive no-launch evidence')
    for key_name,success in (('owner_exit',False),('native_exit',False),('recovery_exit',True)):closure(observation.get(key_name,{}),success)
    need(isinstance(observation['owner_exit'].get('owned_tool_handle'),str) and
         bool(observation['owner_exit']['owned_tool_handle']),'actual old owner handle observation missing')
    native_log=pointer(observation['native_log']);exit_path=pointer(observation['native_exit']['record'])
    exit_record=public(exit_path)
    need(exit_record.get('actual_numeric_exit_observed') is True and exit_record.get('owned_handle') is True and
         exit_record.get('returncode')==observation['native_exit']['returncode'] and
         exit_record.get('log_sha256')==sha(native_log),'exact owned native closed exit/log differs')
    source=pointer(observation['native_study_source'])
    need(source==ROOT/'machinery/study.py','nonlaunch source is not the actual native call implementation')
    seal_fields=e.fields(raw(study/'seal.json').strip());implementation=e.select(seal_fields,('implementation',)).get('implementation')
    need(isinstance(implementation,dict) and digest(implementation)==c['implementation_sha256'] and
         implementation.get('machinery/study.py')==sha(source),'review no-launch source is not the sealed current implementation')
    trace=raw(pointer(observation['trace']),1024**2)
    need(trace and trace in raw(native_log,16*1024**2),'no-launch stack is not the exact retained native trace')
    frame=observation.get('failed_frame',{});line=frame.get('lineno')
    need(frame.get('filename')==str(source) and frame.get('function')=='call' and type(line) is int,
         'no-launch frame is not the original native role call')
    tree=ast.parse(raw(source).decode());cls=next((x for x in tree.body if isinstance(x,ast.ClassDef) and x.name=='Arm'),None)
    function=next((x for x in cls.body if isinstance(x,ast.FunctionDef) and x.name=='call'),None) if cls else None
    need(function is not None,'native role-call function absent')
    launches=[x.lineno for x in ast.walk(function) if isinstance(x,ast.Call) and isinstance(x.func,ast.Attribute) and
        isinstance(x.func.value,ast.Name) and x.func.value.id=='subprocess' and x.func.attr=='Popen']
    guards=[x.lineno for x in ast.walk(function) if isinstance(x,ast.Call) and isinstance(x.func,ast.Name) and x.func.id=='event']
    need(launches and line in guards and line<min(launches) and
         f'File "{source}", line {line}, in call'.encode() in trace,
         'failure is not source-verified before watchdog Popen')
    return {'settled':True,'role':'reviewer','request_id':key,'paid_retry_authorized':False,
            'observation':certificate['observation'],'receipt_sha256':certificate['receipt']['sha256']}


def settlement(study,mode,original_grant,extra_reference,c):
    """Numeric exits OR exactly certified nonlaunch; uncertainty remains numericFalse."""
    e=projection();g=H.grant(original_grant);extra=public(pointer(extra_reference));checked=None
    numeric=True;settled=True;certified=0;extra_count=0;jobs=Path(study)/'arms'/mode/'jobs'
    for job in sorted(jobs.iterdir()) if jobs.exists() else ():
        need(job.is_dir() and not job.is_symlink(),'job directory alias')
        receipt=job/'receipt.json'
        if not receipt.exists():numeric=False;settled=False;continue
        values=e.select(e.fields(raw(receipt).strip()),('request_id','returncode'))
        if values.get('request_id')==job.name and type(values.get('returncode')) is int:continue
        numeric=False
        try:H.certified_uncertainty(Path(study),mode,job,g,e);certified+=1;continue
        except (Hold,OSError,ValueError,KeyError):pass
        try:
            need(Path(study)==Path(extra['study']) and mode==extra['arm'] and job.name==extra['request_id'],
                 'unknown uncertainty is not the exact original no-launch review')
            checked=checked or validate_certificate(extra_reference,c);certified+=1;extra_count+=1
        except (Hold,OSError,ValueError,KeyError):settled=False
    return {'all_job_receipts_numeric':numeric,'all_jobs_settled':settled,
            'certified_prelaunch_uncertainty_count':certified,'certified_readonly_role_nonlaunch_count':extra_count}
