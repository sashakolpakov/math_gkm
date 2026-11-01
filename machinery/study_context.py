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
CONTEXT_BYTE_LIMIT = 16 * 1024**2
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


def _pointer(*parts):
    return '/' + '/'.join(str(part).replace('~', '~0').replace('/', '~1') for part in parts)


def _compact_library_metadata(view, request, relative, content_hash):
    """Defer provenance maps, retaining every mathematical/typed task field.

    A value_binding is digest(JSON value), not either hash domain used inside
    source_files or task.context_sources. The complete request remains unchanged.
    """
    def reference(value, *parts):
        return {'path': relative, 'sha256': content_hash,
                'json_pointer': _pointer(*parts), 'value_binding': digest(value)}

    for field in ('knowledge', 'components', 'reuse_interfaces'):
        for identity, item in view.get(field, {}).items():
            original = request[field][identity]
            deferred = {}
            if 'source_files' in item:
                deferred['source_files'] = reference(item.pop('source_files'), field, identity, 'source_files')
            task = item.get('task')
            if isinstance(task, dict) and 'context_sources' in task:
                deferred['task.context_sources'] = reference(task.pop('context_sources'), field, identity, 'task', 'context_sources')
            if deferred:
                item['full_record']['deferred_fields'] = deferred

    # A selected interface is an alias only for an identical full original
    # record. Same ids with different provenance or versions never collapse.
    for identity, original in request.get('reuse_interfaces', {}).items():
        for field in ('knowledge', 'components'):
            if identity in request.get(field, {}) and original == request[field][identity]:
                full_record = view['reuse_interfaces'][identity]['full_record']
                view['reuse_interfaces'][identity] = {
                    'id': original.get('id', identity),
                    'library_record': {'json_pointer': _pointer(field, identity),
                                       'record_binding': digest(original)},
                    'full_record': full_record}
                break
    view['own_context']['transport_view'] = {
        'schema': 'math-gkm.own-library-metadata-index.v1',
        'interpretation': 'Only repeated provenance maps are indirect. full_record.deferred_fields '
            'names exact values in the complete own request; read them before reuse. '
            'library_record points to the identical displayed knowledge/components record. '
            'Map value_binding hashes JSON values, not source text or raw source-file bytes. '
            'The complete request controls permissions, identity and checking.'}


def _compact_exact_feedback_aliases(view, request, relative, content_hash):
    """Alias only canonically identical feedback copies; keep one full copy inline."""
    feedback = request.get('research_feedback')
    history = feedback.get('history') if isinstance(feedback, dict) else None
    if not isinstance(history, list) or not history:
        return
    aliases = []
    def alias(original, source_parts, target_index):
        target_parts = ('research_feedback', 'history', target_index)
        aliases.append(_pointer(*source_parts))
        return {'own_context_alias': {
            'schema': 'math-gkm.own-request-exact-alias.v1',
            'path': relative, 'sha256': content_hash,
            'json_pointer': _pointer(*target_parts),
            'inline_json_pointer': _pointer(*target_parts),
            'value_binding': digest(original)}}
    latest = feedback.get('latest')
    if isinstance(latest, dict) and canonical(latest) == canonical(history[-1]):
        view['research_feedback']['latest'] = alias(latest, ('research_feedback', 'latest'), len(history)-1)
    concept = request.get('concept_driver')
    repeated = concept.get('review_feedback') if isinstance(concept, dict) else None
    if isinstance(repeated, list):
        for index, packet in enumerate(repeated):
            if not isinstance(packet, dict):
                continue
            for target_index, original in enumerate(history):
                if canonical(packet) == canonical(original):
                    view['concept_driver']['review_feedback'][index] = alias(packet,
                        ('concept_driver', 'review_feedback', index), target_index)
                    break
    if aliases:
        view['own_context']['transport_view']['exact_feedback_aliases'] = aliases
        view['own_context']['transport_view']['interpretation'] += (
            ' Exact feedback aliases point to a canonically identical complete packet '
            'still inline in research_feedback.history and in the immutable own request. '
            'No commitment, feedback packet content, typed statement or source grant is changed.')


def _compact_exact_commitment_alternatives(view, request, relative, content_hash):
    """Alias ONLY exact public five-field copies already present inline.

    Original commitment, trial, selected prediction, resource grant and digest
    remain unchanged. JSON canonical equality, not id or Python equality,
    establishes every alias; the alternative list's positions/order remain.
    """
    commitment = request.get('commitment')
    portfolio = request.get('portfolio')
    if (not isinstance(commitment, dict) or commitment.get('schema') != 'math-gkm.prospective.v3'
            or not isinstance(commitment.get('alternatives'), list) or not isinstance(portfolio, list)):
        return
    fields = ('id', 'kind', 'claim', 'uncertainty', 'outcomes')
    projections = {}
    for index, item in enumerate(portfolio):
        if isinstance(item, dict) and all(field in item for field in fields):
            projected = {field: item[field] for field in fields}
            projections.setdefault(canonical(projected), index)
    aliases = []
    for index, original in enumerate(commitment['alternatives']):
        if not isinstance(original, dict) or set(original) != set(fields):
            continue
        target = projections.get(canonical(original))
        if target is None:
            continue
        parts = ('commitment', 'alternatives', index)
        view['commitment']['alternatives'][index] = {'own_context_alias': {
            'schema': 'math-gkm.own-request-exact-projection-alias.v1',
            'path': relative, 'sha256': content_hash, 'json_pointer': _pointer(*parts),
            'value_binding': digest(original), 'inline_json_pointer': _pointer('portfolio', target),
            'projection_fields': list(fields)}}
        aliases.append(_pointer(*parts))
    if aliases:
        view['own_context']['transport_view']['exact_commitment_alternative_aliases'] = aliases
        view['own_context']['transport_view']['interpretation'] += (
            ' Each commitment.alternatives alias means take exactly projection_fields '
            'from the unchanged inline portfolio entry at inline_json_pointer, retaining '
            'the alternative list order. That value is canonically identical to the '
            'original alternative bound by value_binding and its full-request pointer. '
            'Extra portfolio fields are not part of this projection. The complete original '
            'commitment, selected/trial/resource fields and prospective binding are unchanged.')


def _compact_exact_claim_aliases(view, request, relative, content_hash):
    """Alias exact claim copies while keeping their complete task text inline."""
    fields = ('statement', 'hypotheses')
    transport = view.get('own_context', {}).get('transport_view')
    if not isinstance(transport, dict) or 'exact_claim_aliases' in transport:
        return
    interpretation = transport.get('interpretation')
    if not isinstance(interpretation, str):
        return
    explanation = (' Exact claim aliases project statement and hypotheses from '
        'the canonically identical same-record task still inline at inline_json_pointer. '
        'All task types and conditions, and the complete original request, are unchanged.')
    candidate = copy.deepcopy(view)
    aliases = []
    for field in ('knowledge', 'components', 'reuse_interfaces'):
        original_library = request.get(field)
        displayed_library = candidate.get(field)
        if not isinstance(original_library, dict) or not isinstance(displayed_library, dict):
            continue
        for identity, item in displayed_library.items():
            original_record = original_library.get(identity)
            if not isinstance(item, dict) or not isinstance(original_record, dict):
                continue
            original = original_record.get('claim')
            original_task = original_record.get('task')
            task = item.get('task')
            if (not isinstance(original, dict) or set(original) != set(fields)
                    or not isinstance(original_task, dict) or not all(key in original_task for key in fields)
                    or not isinstance(task, dict) or not all(key in task for key in fields)
                    or canonical(item.get('claim')) != canonical(original)):
                continue
            projected = {key: task[key] for key in fields}
            if (canonical(original) != canonical(projected)
                    or canonical(projected) != canonical({key: original_task[key] for key in fields})):
                continue
            pointer = _pointer(field, identity, 'claim')
            alias = {'own_context_alias': {
                'schema': 'math-gkm.own-request-exact-projection-alias.v1',
                'path': relative, 'sha256': content_hash, 'json_pointer': pointer,
                'value_binding': digest(original),
                'inline_json_pointer': _pointer(field, identity, 'task'),
                'projection_fields': list(fields)}}
            # Charge each candidate the entire explanatory metadata overhead.
            # This is conservative when multiple exact copies are aliased.
            overhead = len(canonical({'exact_claim_aliases': [pointer]})) + len(canonical(explanation))
            if len(canonical(original)) <= len(canonical(alias)) + overhead:
                continue
            item['claim'] = alias
            aliases.append(pointer)
    if aliases:
        candidate['own_context']['transport_view']['exact_claim_aliases'] = aliases
        candidate['own_context']['transport_view']['interpretation'] = interpretation + explanation
        if len(canonical(candidate)) < len(canonical(view)):
            view.clear()
            view.update(candidate)


def _compact_context_file_references(view):
    """Share only exact generated library-reference file metadata, losslessly."""
    header = view.get('own_context')
    transport = header.get('transport_view') if isinstance(header, dict) else None
    if (not isinstance(transport, dict) or 'file_reference_defaults' in transport
            or not isinstance(transport.get('interpretation'), str)
            or not isinstance(header.get('path'), str)
            or not isinstance(header.get('sha256'), str)
            or not re.fullmatch('[0-9a-f]{64}', header['sha256'])):
        return
    candidate = copy.deepcopy(view)
    changed = False
    def compact(reference, pointer, binding):
        nonlocal changed
        if (not isinstance(reference, dict) or 'own_context_file' in reference
                or not {'path', 'sha256', 'json_pointer', binding} <= set(reference)
                or reference['json_pointer'] != pointer
                or not isinstance(reference[binding], str)
                or not re.fullmatch('[0-9a-f]{64}', reference[binding])
                or canonical(reference['path']) != canonical(header['path'])
                or canonical(reference['sha256']) != canonical(header['sha256'])):
            return
        del reference['path'], reference['sha256']
        reference['own_context_file'] = True
        changed = True
    for field in ('knowledge', 'components', 'reuse_interfaces'):
        library = candidate.get(field)
        if not isinstance(library, dict):
            continue
        for identity, item in library.items():
            if not isinstance(item, dict):
                continue
            reference = item.get('full_record')
            compact(reference, _pointer(field, identity), 'record_binding')
            deferred = reference.get('deferred_fields') if isinstance(reference, dict) else None
            if isinstance(deferred, dict):
                for name, parts in (('source_files', ('source_files',)),
                        ('task.context_sources', ('task', 'context_sources'))):
                    compact(deferred.get(name), _pointer(field, identity, *parts), 'value_binding')
    if changed:
        transport = candidate['own_context']['transport_view']
        transport['file_reference_defaults'] = 'math-gkm.own-context-file-reference-defaults.v1'
        transport['interpretation'] += (
            ' In library full_record and its source_files/task.context_sources '
            'deferred_fields only, own_context_file=true means restore path and sha256 '
            'from own_context and remove that marker. All other reference fields, '
            'pointers, bindings and inline mathematical content are unchanged.')
        if len(canonical(candidate)) < len(canonical(view)):
            view.clear()
            view.update(candidate)


def _file_reference_prompt(original, request, relative, content_hash, raw_bytes):
    """Factor only an exact canonical JSON suffix; retain all original input."""
    request_text = canonical(request)
    if not request_text or not original.endswith(request_text):
        raise PromptContextLimit('complete prompt lacks exact canonical request suffix')
    prefix = original[:-len(request_text)]
    import hashlib
    prefix_raw = prefix.encode('utf-8')
    original_raw = original.encode('utf-8')
    envelope = {
        'schema': 'math-gkm.own-request-file-transport.v1',
        'interpretation': (
            'This is a lossless transport envelope for the complete original role request. '
            'Before any substantive action, read complete_request.path in full as UTF-8, '
            'continuing across tool-output limits as necessary, and verify its byte count, '
            'SHA-256 and request_binding. Replace this entire JSON envelope with that '
            'file text excluding its single final LF; leave the preceding instruction '
            'prefix byte-for-byte unchanged. The result is the exact original prompt '
            'bound by original_prompt, and all of its instructions, task conditions, '
            'feedback, mathematical content and permissions are authoritative. '
            'request_binding is SHA-256 of canonical request JSON without the final LF. '
            'No original field is optional, summarized or selected by this envelope. '
            'This transport adds no source grant, mathematical suggestion, permission '
            'or resource allowance. If complete reading or verification fails, stop '
            'with a transport failure; do not infer or approximate missing contents.'),
        'complete_request': {'path': relative, 'sha256': content_hash,
            'bytes': raw_bytes, 'request_binding': digest(request)},
        'original_prompt': {'sha256': hashlib.sha256(original_raw).hexdigest(),
            'bytes': len(original_raw),
            'instruction_prefix_sha256': hashlib.sha256(prefix_raw).hexdigest(),
            'instruction_prefix_bytes': len(prefix_raw)}}
    return check_prompt(prefix + canonical(envelope))


def prepare_prompt(request, workspace, role, renderer):
    """Render only. The caller retains its original request and source grants."""
    rendered=renderer(request)
    original_rendered=rendered
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
    rendered=renderer(view)
    if len(rendered)>PROMPT_CHAR_LIMIT:
        _compact_library_metadata(view, request, relative, content_hash)
        rendered=renderer(view)
    if len(rendered)>PROMPT_CHAR_LIMIT:
        _compact_exact_feedback_aliases(view, request, relative, content_hash)
        _compact_exact_commitment_alternatives(view, request, relative, content_hash)
        _compact_exact_claim_aliases(view, request, relative, content_hash)
        rendered=renderer(view)
    _compact_context_file_references(view)
    rendered=renderer(view)
    if len(rendered)>PROMPT_CHAR_LIMIT:
        rendered=_file_reference_prompt(original_rendered, request, relative, content_hash, len(raw))
    rendered=check_prompt(rendered)
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
