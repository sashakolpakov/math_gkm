"""Bounded prompt views of complete own requests; no change to proof state.

The protected operational grant is consumed only for the one already closed
historical input rejection. It is never supplied by a research report.
"""
import copy
import json
from pathlib import Path
import re
from .study_common import (ROOT, Invalid, canonical, digest, sha, read, write,
    atomic_text, retention_room, implementation, REASONING_EFFORT)

PROMPT_CHAR_LIMIT = 900_000
CONTEXT_BYTE_LIMIT = 8 * 1024**2
INDEX_OMISSIONS = {'used_declarations', 'proposal', 'solution', 'validation_bundle'}
RECOVERY_FIELDS = ('calls','meta_calls','seconds','reservations','budget_pools',
    'counted_jobs','receipts','receipt_hashes','round','phase','status','failures',
    'policy_trials','research','active','active_intent','resolution')
GRANT_FIELDS = {'schema','study','arm','failed_request_id','next_request_id',
    'request_binding','receipt_binding','receipt_file_sha256','spec_sha256',
    'events_sha256','stderr_sha256','old_implementation_sha256',
    'implementation_sha256','old_seal_sha256','stopped_state_sha256',
    'recovery_projection_sha256','no_model_started','native_cleanup_verified','classification',
    'revision_core','revision_binding'}

class PromptContextLimit(Invalid):
    """A transport preflight failure, never a mathematical outcome."""


def check_prompt(text):
    if not isinstance(text,str) or len(text)>PROMPT_CHAR_LIMIT:
        raise PromptContextLimit('complete prompt exceeds transport character bound')
    return text


def check_prompt_file(path):
    with Path(path).open('rb') as source:
        raw=source.read(CONTEXT_BYTE_LIMIT+1)
    if len(raw)>CONTEXT_BYTE_LIMIT:
        raise PromptContextLimit('prompt file exceeds bounded transport capacity')
    check_prompt(raw.decode('utf-8'))


def _safe_history_path(workspace, name):
    workspace=Path(workspace).resolve()
    parent=workspace/'history'/'context'
    for part in (workspace/'history',parent):
        if part.is_symlink(): raise Invalid('own context history cannot be a symlink')
    path=parent/name
    if path.is_symlink() or not path.resolve().is_relative_to(workspace):
        raise Invalid('own context escaped workspace')
    return path


def prepare_prompt(request, workspace, role, renderer):
    """Render only. The caller retains its original request and source grants."""
    rendered=renderer(request)
    if len(rendered)<=PROMPT_CHAR_LIMIT:
        return rendered
    if role not in ('proposer','researcher') or request.get('role')!=role:
        raise PromptContextLimit('large nonresearch context cannot enter own history')
    raw=(canonical(request)+'\n').encode('utf-8')
    if len(raw)>CONTEXT_BYTE_LIMIT:
        raise PromptContextLimit('complete own context exceeds retained-file bound')
    import hashlib
    content_hash=hashlib.sha256(raw).hexdigest()
    relative='history/context/'+content_hash+'.json'
    view=copy.deepcopy(request)
    for field in ('knowledge','components','reuse_interfaces'):
        if field not in view: continue
        if not isinstance(view[field],dict): raise Invalid('accepted library must be an object')
        index={}
        for identity, record in view[field].items():
            if not isinstance(record,dict): raise Invalid('accepted record must be an object')
            item={key:copy.deepcopy(value) for key,value in record.items() if key not in INDEX_OMISSIONS}
            # Exact claim, typed task conditions, exports and all source hashes
            # remain inline. Only bulky provenance/proof details are indirect.
            item['full_record']={'path':relative,'sha256':content_hash,
                'json_pointer':'/'+field+'/'+str(identity).replace('~','~0').replace('/','~1'),
                'record_binding':digest(record)}
            index[identity]=item
        view[field]=index
    view['own_context']={'schema':'math-gkm.own-prompt-context.v1','path':relative,
        'sha256':content_hash,'bytes':len(raw),'request_binding':digest(request),
        'scope':'Exact full OWN role request. Read omitted proof/provenance details on demand; indexes do not change mathematical admission or obligations.'}
    rendered=check_prompt(renderer(view))
    path=_safe_history_path(workspace,content_hash+'.json')
    if path.exists():
        if path.read_bytes()!=raw: raise Invalid('immutable own context changed')
    else:
        retention_room(Path(workspace),len(raw))
        atomic_text(path,raw.decode('utf-8'))
        path.chmod(0o444)
    if sha(path)!=content_hash: raise Invalid('own context integrity check failed')
    return rendered


def recovery_projection(state):
    return {key:copy.deepcopy(state.get(key)) for key in RECOVERY_FIELDS}


def _protected_grant(pointer):
    if not isinstance(pointer,dict) or set(pointer)!={'path','sha256'}:
        raise Invalid('protected operational recovery pointer is malformed')
    if not isinstance(pointer['path'],str) or not re.fullmatch('[0-9a-f]{64}',str(pointer['sha256'])):
        raise Invalid('protected operational recovery pointer is invalid')
    path=Path(pointer['path'])
    base=(ROOT/'.bootstrap').resolve()
    if not path.is_absolute(): path=ROOT/path
    if not path.resolve().is_relative_to(base) or path.is_symlink() or not path.is_file():
        raise Invalid('operational recovery grant is not a protected file')
    relative=path.relative_to(ROOT)
    if any((ROOT.joinpath(*relative.parts[:i])).is_symlink() for i in range(1,len(relative.parts))):
        raise Invalid('operational recovery grant has a symlink parent')
    if sha(path)!=pointer['sha256']: raise Invalid('operational recovery grant changed')
    return read(path),pointer['sha256'],path.resolve()


def operational_recovery(arm,key,receipt,request,workspace,index):
    """Permit one new paid repair ID; never rerun or refund the failed job."""
    if key!='plan-0030' or index!=30 or getattr(arm,'mode',None)!='exploration':
        return None
    authority=ROOT/'.bootstrap/study-authorization.json'
    if not authority.is_file(): return None
    authorization=read(authority)
    if 'operational_recovery' not in authorization: return None
    grant,grant_hash,grant_path=_protected_grant(authorization['operational_recovery'])
    # Extra version-provenance metadata is hash-bound but cannot add actions.
    if not isinstance(grant,dict) or not GRANT_FIELDS<=set(grant):
        raise Invalid('closed proposer recovery schema mismatch')
    hashes=[k for k in GRANT_FIELDS if k.endswith(('_sha256','_binding'))]
    if any(not re.fullmatch('[0-9a-f]{64}',str(grant[k])) for k in hashes):
        raise Invalid('closed proposer recovery hash is invalid')
    seal=read(arm.study/'seal.json')
    revision=seal.get('source_revision',{})
    if (not isinstance(grant['revision_core'],dict) or
        digest(grant['revision_core'])!=grant['revision_binding'] or
        revision.get('record')!=str(grant_path) or
        revision.get('binding')!=grant['revision_binding'] or
        revision.get('old_seal_sha256')!=grant['old_seal_sha256'] or
        arm.s.get('seal_hash')!=digest(seal)):
        raise Invalid('closed proposer recovery does not bind the reviewed source revision')
    current=digest(implementation())
    if (grant['schema']!='math-gkm.closed-proposer-recovery.v1' or
        grant['study']!=str(arm.study.resolve()) or grant['arm']!=arm.mode or
        grant['failed_request_id']!=key or grant['next_request_id']!=key+'-repair-1' or
        grant['classification']!='closed_input_too_large_no_model' or
        grant['no_model_started'] is not True or grant['native_cleanup_verified'] is not True or
        grant['old_implementation_sha256']!='bac1b8f622077e362fc2d078e87bab3bad4114882700d722b09498f3481878fa' or
        grant['implementation_sha256']!=current or authorization.get('implementation_sha256')!=current or
        authorization.get('user_explicit_ok') is not True or arm.p['transport']!='live'):
        raise Invalid('closed proposer recovery does not bind current reviewed execution')
    job=arm.root/'jobs'/key
    full_request={**request,'model':arm.p['model'],'reasoning_effort':REASONING_EFFORT,'request_id':key}
    if (read(job/'request.json')!=full_request or digest(full_request)!=grant['request_binding'] or
        sha(job/'receipt.json')!=grant['receipt_file_sha256'] or digest(receipt)!=grant['receipt_binding'] or
        read(job/'receipt.json')!=receipt or
        any(sha(job/name)!=grant[field] for name,field in [('spec.json','spec_sha256'),('events.jsonl','events_sha256'),('stderr.log','stderr_sha256')])):
        raise Invalid('closed proposer original artifacts changed')
    spec=read(job/'spec.json')
    if (receipt.get('returncode')!=1 or receipt.get('payload') is not None or
        receipt.get('role')!='proposer' or receipt.get('operationally_incomplete') or
        not isinstance(receipt.get('before'),dict) or receipt['before']!=receipt.get('after') or
        receipt.get('resources',{}).get('termination_cause') is not None or
        (job/'final.json').exists() or spec.get('readonly') is not True or
        spec.get('role')!='proposer' or spec.get('request_id')!=key or
        Path(spec.get('workspace','')).resolve()!=Path(workspace).resolve() or
        spec.get('seconds')!=arm.p['call_seconds'] or
        arm.s.get('reservations',{}).get('call-'+key)!=spec['seconds'] or
        arm.s.get('receipts',[]).count(str(job))!=1 or arm.s.get('counted_jobs',[]).count(key)!=1 or
        arm.s.get('receipt_hashes',{}).get(str(job))!=digest(receipt) or
        arm.s.get('active') or arm.s.get('active_intent') or arm.p['proposal_repairs']<1):
        raise Invalid('closed proposer failure is not eligible for explicit recovery')
    if len((job/'prompt.txt').read_text())<=1048576:
        raise Invalid('historical input rejection has no oversized original prompt')
    marker=job/'operational-recovery.json'
    binding={'schema':'math-gkm.closed-proposer-recovery-consumption.v1','grant_sha256':grant_hash,
        'request_binding':grant['request_binding'],'receipt_binding':grant['receipt_binding'],
        'next_request_id':grant['next_request_id'],'accounting':'Original full reservation remains charged; the unique repair uses its ordinary allowance.'}
    if marker.exists():
        if read(marker)!=binding: raise Invalid('operational recovery consumption changed')
    else:
        if digest(recovery_projection(arm.s))!=grant['recovery_projection_sha256']:
            raise Invalid('closed proposer accounting/research state changed before recovery')
        if (job/'validated-plan.json').exists() or (arm.root/'jobs'/grant['next_request_id']).exists():
            raise Invalid('operational recovery cannot authorize an existing action')
        write(marker,binding)
    return {'previous_request':key,'receipt_hash':digest(receipt),
        'error':'Closed input-size rejection before model proposal; full own context remains available. Submit a new plan under this separately charged repair identity.',
        'previous_payload':None,'operational_recovery_binding':digest(binding)}
