"""One-way checkpoint producer. It performs NO complexity measurement.

Only bound mathematical state, witness sources and accounting are exported.
No observer output is read by this module or any research/control role.
"""
from .study_common import Invalid, digest, read, write, verify_snapshot


def checkpoint(study, arm, key, state, snapshot):
    manifest = verify_snapshot(snapshot)
    research = state['research']
    mathematical = {k: research.get(k, {}) for k in ('knowledge', 'components', 'remaining_obligations')}
    mathematical['program'] = research['program']
    mathematical['policy'] = research['policy']
    record = {'schema': 'math-gkm.observer-input.v1', 'key': key, 'arm': arm,
        'snapshot': str(snapshot.relative_to(study)), 'snapshot_binding': manifest['binding'],
        'mathematics': mathematical, 'mathematics_binding': digest(mathematical),
        'reservation_seconds': state['seconds'],
        'worker_observed_seconds': sum(read(p+'/receipt.json').get('elapsed_seconds', 0) for p in state['receipts']),
        'controller_active_seconds': state.get('controller_active_seconds', 0),
        'accounting': 'Reservations are caps, not measured cost; controller active wall overlaps subprocess wall. Never sum overlapping totals.',
        'created': manifest['created']}
    target = study/'audit/inputs'/arm/(key+'.json')
    # Research-owned durable outbox; audit-side values never gate execution.
    outbox = study/'arms'/arm/'observer-outbox'/(key+'.json')
    if not outbox.exists():
        write(outbox, record)
    else:
        record = read(outbox)
    if not target.exists():
        write(target, record)
    else:
        write(study/'audit/reconciliations'/arm/(key+'-'+digest(record)+'.json'), record)
    return record
