"""Mathematics and optional report metadata are independent transactions."""
import copy
from .study_common import Invalid, digest, write

def accept_report(arm,state,report,workspace,directory,round_index,protocol,commitment):
    from . import study_policy
    from .study_knowledge import ingest,SCHEMAS
    # Pending sources enter only on an explicit researcher request, charged by
    # the same admission gate and aggregate envelope as ordinary submissions.
    from .study_discoveries import recheck
    try:
        recheck(arm,state,report,workspace,directory/'discovery-rechecks')
    except (Invalid,KeyError,TypeError,ValueError,OSError) as exc:
        receipt=dict(status='discovery_recheck_rejected',reason=str(exc),report_hash=digest(report))
        write(directory/('discovery-rejection-'+digest(receipt)+'.json'),receipt)
        state.setdefault('submission_failures',[]).append(receipt)
        # Envelope rejection cannot be bypassed by processing ordinary items.
        selected=report.get('discovery_rechecks',[])
        count=(len(selected) if isinstance(selected,list) else 0)+sum(len(report[k]) for k in SCHEMAS if isinstance(report.get(k),list))
        if count>arm.p.get('knowledge_checks_per_round',6):
            return False
    # Every item is independently checked, even if optional prose is invalid.
    ingest(arm,state,report,workspace,directory/'math')
    metadata=copy.deepcopy(state)
    try:
        study_policy.record(metadata,report,workspace,round_index,protocol,prospective=commitment)
    except (Invalid,KeyError,TypeError,ValueError) as exc:
        receipt={'report_hash':digest(report),'status':'optional_metadata_rejected',
                 'error_class':type(exc).__name__, 'reason':str(exc), 'math_rollback':False}
        path=directory/('metadata-'+digest(receipt)+'.json')
        if not path.exists(): write(path,receipt)
        state.setdefault('metadata_failures',[]).append(receipt)
        return False
    state.clear(); state.update(metadata)
    return True
