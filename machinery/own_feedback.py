"""Bounded controller-derived OWN validation feedback, never evaluator feedback.

Only callers holding an own-ingest result invoke retain. Report fields are never
used as classification or provenance. Raw immutable result/receipt stays retained.
"""
from .study_common import Invalid, digest, write

SCHEMA = 'math-gkm.own-check-feedback.v1'
STAGES = {'intake','context','compile','kernel_replay','trusted_premise_inspection','binding','complete','finalization','unknown'}
CATEGORIES = {'accepted','artifact_size_limit','record_size_limit','finalization_failure','unfinished_receipt','dependency_node_limit','dependency_edge_limit',
    'expression_node_limit','expression_depth_limit','catalog_node_limit','resource_termination',
    'output_limit','timeout','interruption','premise_rejection','required_constant_rejection',
    'context_rejection','type_or_elaboration_rejection','kernel_rejection','unknown'}
NUMBERS = {'observed_bytes','limit_bytes','limit_nodes','limit_edges','elapsed_ns',
    'peak_rss_bytes','peak_native_bytes','budget_seconds','returncode'}
TOKENS = {'dependency_node_limit','dependency_edge_limit','expression_node_limit',
    'expression_depth_limit','catalog_node_limit','artifact_size_limit','record_size_limit',
    'forbidden_axiom','missing_required','missing_root','missing_body','unknown_dependency'}


def diagnostic(result, exc=None):
    stage=result.get('controller_stage','unknown')
    if stage not in STAGES: stage='unknown'
    category='accepted' if result.get('checked') is True else 'unknown'
    measured={}
    checks=result.get('checks',[])
    record=checks[-1] if checks else {}
    termination=record.get('termination')
    if termination=='timeout': category='timeout'
    elif termination=='output_limit': category='output_limit'
    elif isinstance(termination,str) and termination.startswith(('resource_guard:','unresolved_cleanup:','operationally_incomplete:')):
        category='resource_termination'
    elif type(record.get('returncode')) is int and record['returncode']<0:
        category='resource_termination'
    elif stage=='trusted_premise_inspection' and result.get('trusted_inspector_failure'):
        # This typed field is read by check_task from the bound producer artifact.
        # Arbitrary stdout/stderr and report fields cannot classify failures.
        failure=result['trusted_inspector_failure']
        token=failure.get('category') if isinstance(failure,dict) else failure
        if isinstance(failure,dict): measured.update(failure.get('measured',{}))
        if token in TOKENS:
            category={'forbidden_axiom':'premise_rejection','missing_required':'required_constant_rejection',
                'missing_root':'context_rejection','missing_body':'context_rejection',
                'unknown_dependency':'context_rejection'}.get(token,token)
    elif stage=='compile' and record.get('returncode')==1:
        # Compilation includes elaborator effects: this does not claim falsity.
        category='type_or_elaboration_rejection'
    elif stage=='kernel_replay' and record.get('returncode')==1:
        category='kernel_rejection'
    from .proof_audit import InspectionFailure, EDGE_LIMIT
    if type(exc) is InspectionFailure:
        category=exc.category
        measured.update(exc.measured)
    elif type(exc) is Invalid:
        reason=str(exc)
        if reason in ('validation stopped; no mathematical conclusion','interrupted or exhausted before premise inspection'):
            category='interruption'
        elif reason=='failure within validation budget': category='timeout'
        elif reason in ('exact source check failed','adaptation altered frozen solver sources','frozen target context changed'):
            category='context_rejection'
    if category not in CATEGORIES: category='unknown'
    if category in ('dependency_node_limit','catalog_node_limit'): measured['limit_nodes']=200000
    if category=='dependency_edge_limit': measured['limit_edges']=EDGE_LIMIT
    if category=='expression_node_limit': measured['limit_nodes']=1000000
    if category=='artifact_size_limit': measured.setdefault('limit_bytes',32*1024**2)
    if category=='record_size_limit': measured.setdefault('limit_bytes',1024**2)
    for key,target in (('elapsed_ns','elapsed_ns'),('returncode','returncode')):
        if key in record: measured[target]=record[key]
    resources=record.get('resources',{})
    for key,target in (('peak_rss_observed','peak_rss_bytes'),('peak_charged_phys_footprint_observed','peak_native_bytes')):
        if key in resources: measured[target]=resources[key]
    if 'budget_seconds' in result: measured['budget_seconds']=result['budget_seconds']
    measured={k:v for k,v in measured.items() if k in NUMBERS and type(v) is int and -2**63<v<2**63}
    return dict(schema=SCHEMA,stage=stage,category=category,measured=measured,
        mathematical_conclusion='exact_checked_roots_only' if result.get('checked') is True else 'none')


def operational_failure(raw, raw_hash=None, *, category='finalization_failure'):
    """Own controller catch sites only; immutable raw stage result is untouched."""
    if category not in ('finalization_failure','unfinished_receipt'):
        raise Invalid('invalid operational classification')
    result={**raw,'checked':False,'resolved':False,'controller_stage':'finalization',
        'status':'validator_infrastructure_failure','infrastructure_failure':True,
        'raw_result_sha256':raw_hash or digest(raw)}
    result['controller_diagnostic']=dict(schema=SCHEMA,stage='finalization',category=category,
        measured={},mathematical_conclusion='none')
    return result


def retain(state,workspace,result,*,kind,proposal_hash):
    """Called only on own submissions, never adapter/evaluation result paths."""
    feedback=result.get('controller_diagnostic') or diagnostic(result)
    # Revalidate fixed vocabulary and numeric projection, even on recovery.
    if (feedback.get('schema')!=SCHEMA or feedback.get('stage') not in STAGES or
            feedback.get('category') not in CATEGORIES):
        feedback=diagnostic({})
    feedback={k:feedback[k] for k in ('schema','stage','category','measured','mathematical_conclusion')}
    # Cached stage success is never authority for effective FINAL admission.
    if result.get('checked') is not True:
        feedback['mathematical_conclusion']='none'
        if feedback['category']=='accepted':
            feedback=diagnostic({**result,'checked':False})
    feedback['measured']={k:v for k,v in feedback['measured'].items()
        if k in NUMBERS and type(v) is int and -2**63<v<2**63}
    value=dict(schema=SCHEMA,provenance='controller_own_validation',kind=kind,
        proposal_hash=proposal_hash,result_sha256=digest(result),checked=result.get('checked') is True,
        diagnostic=feedback)
    # Preserve raw-result provenance when a finished result lacks FINISHED.json.
    if isinstance(result.get('raw_result_sha256'),str) and len(result['raw_result_sha256'])==64:
        value['raw_result_sha256']=result['raw_result_sha256']
    key=digest(value)
    path=workspace/'history/own-checks'/(key+'.json')
    if path.exists():
        from .study_common import read
        if read(path)!=value: raise Invalid('own feedback projection changed')
    else:
        write(path,value)
        path.chmod(0o444)
    record={**value,'projection_path':str(path.relative_to(workspace)),'projection_hash':key}
    history=state.setdefault('own_check_feedback',[])
    if record not in history: history.append(record)
    # Immutable files retain full history; requests carry the last 32, independently
    # of keep_observations and of reported hypothesis/evidence metadata.
    state['own_check_feedback']=history[-32:]
    return record
