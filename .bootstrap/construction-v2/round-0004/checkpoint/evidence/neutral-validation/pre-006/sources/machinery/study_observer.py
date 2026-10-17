"""One-way checkpoint producer. It performs NO complexity measurement.

Only bound mathematical state, witness sources and accounting are exported.
No observer output is read by this module or any research/control role.
"""
from .study_common import Invalid, digest, read, write, verify_snapshot, sha, inside


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
    if key == 'terminal':
        receipt = inside(study, state['resolution_receipt'])
        resolution = read(receipt)
        if (not resolution.get('resolved') or 'finished' not in resolution or
            not resolution.get('bundle_hash') or resolution != state['resolution']):
            raise Invalid('terminal requires exact finished resolution receipt')
        record['resolution'] = {'receipt': str(receipt.relative_to(study)),
            'receipt_sha256': sha(receipt), 'bundle_hash': resolution['bundle_hash'],
            'result_binding': digest(resolution)}
    target = study/'audit/inputs'/arm/(key+'.json')
    # Research-owned durable outbox; audit-side values never gate execution.
    outbox = study/'arms'/arm/'observer-outbox'/(key+'.json')
    if not outbox.exists():
        write(outbox, record)
    else:
        previous = read(outbox)
        if key == 'terminal' and (previous.get('resolution') != record['resolution'] or
                                  previous['snapshot_binding'] != record['snapshot_binding']):
            raise Invalid('terminal outbox conflicts with finished resolution')
        record = previous
    if not target.exists():
        write(target, record)
    else:
        write(study/'audit/reconciliations'/arm/(key+'-'+digest(record)+'.json'), record)
    return record
