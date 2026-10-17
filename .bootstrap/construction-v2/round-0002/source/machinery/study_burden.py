"""Conditional remaining-proof-burden observer. No controller imports this file.

The fixed encoding is a canonical source/term/task bundle with the pinned Lean
rebuild/replay decoder. Only a checked witness has a measured encoding. Unknown
residual proofs remain unknown; no search failure gives a lower bound. This is
not a Kolmogorov-complexity estimator. Source-storage audits remain separate.
"""
import argparse
import html
import time
from pathlib import Path
from .study_common import Invalid, canonical, digest, read, write, verify_snapshot, sha


def measure_checkpoint(study, plan, arm, key):
    path = study/'audit/inputs'/arm/(key+'.json')
    if not path.exists():
        return {'arm': arm, 'key': key, 'status': 'missing_scheduled_checkpoint',
                'conditional_minimum_proof_complexity': None, 'measured_witness_bytes': None}
    feed = read(path)
    snapshot = study/feed['snapshot']
    manifest = verify_snapshot(snapshot)
    if feed['snapshot_binding'] != manifest['binding'] or digest(feed['mathematics']) != feed['mathematics_binding']:
        raise Invalid('observer binding changed')
    start = time.monotonic()
    data = feed['mathematics']
    prior = read(study/'arms'/arm/'snapshots/initial/manifest.json')['files']
    witnesses, definitions, bridges, residuals = [], {}, {}, []
    all_records = {**data['knowledge'], **data['components']}
    connected = {k for k, v in all_records.items() if v['kind'] == 'reductions'}
    pending = list(connected)
    while pending:
        current = all_records[pending.pop()]
        for dep in current['dependencies']:
            if dep not in connected:
                connected.add(dep)
                pending.append(dep)
    for residual in data['remaining_obligations'].values():
        if residual.get('source') in connected and residual.get('discharge'):
            connected.add(residual['discharge'])
    for identifier in sorted(connected):
        record = all_records[identifier]
        proposal = record['proposal']
        # Exact root reductions and representation transports carry residual
        # proof tasks. Unrelated checked facts remain knowledge, not a shorter goal.
        witnesses.append({'id': record['id'], 'kind': record['kind'], 'task': record['task'],
                          'proposal': proposal, 'receipt_hash': record['receipt_hash']})
        for name, hashed in record['source_files'].items():
            if manifest['files'].get(name) != hashed:
                raise Invalid('witness definitions missing from bound snapshot')
            if prior.get(name) == hashed:
                continue  # explicitly conditional on unchanged initial dictionary
            text = (snapshot/'source'/name).read_text()
            target = bridges if name.endswith(record.get('export_module', '').split('.')[-1]+'.lean') else definitions
            target[name] = text
    for identifier, residual in sorted(data['remaining_obligations'].items()):
        if residual.get('source') not in connected:
            continue
        residuals.append({'id': identifier, **residual,
            'proof_encoding_bytes': None if residual['status'] == 'open' else 'included in checked discharge bundle where available'})
    # Count every new definition/adapter and bridge exactly once, even when an
    # abbreviation makes an individual residual statement shorter.
    bundle = {'encoding': plan['encoding'], 'root': plan['root'], 'panel': plan['panel_hash'],
              'conditional_dictionary': prior, 'witnesses': witnesses, 'definitions': definitions,
              'bridges': bridges, 'residual_tasks': residuals}
    artifact = study/'audit/burden-bundles'/arm/(key+'.json')
    write(artifact, bundle)
    return {'schema': 'math-gkm.conditional-burden.v1', 'arm': arm, 'key': key,
        'status': 'measured_explicit_witness_with_unknown_residual_burden' if witnesses else 'insufficient_checked_connection',
        'root': plan['root'], 'panel_hash': plan['panel_hash'], 'encoding': plan['encoding'],
        'snapshot_binding': manifest['binding'], 'bundle_sha256': sha(artifact),
        'conditional_dictionary_sha256': digest(prior),
        'conditional_minimum_proof_complexity': None,
        'remaining_proof_burden': 'unknown unless a complete checked witness is explicitly supplied',
        'measured_witness_bytes': len(canonical(bundle).encode()) if witnesses else None,
        'definition_dictionary_bytes': len(canonical(definitions).encode()),
        'adapter_and_connecting_proof_bytes': len(canonical(bridges).encode()),
        'shared_cost_rule': 'count each source once in the complete bundle; never free or amortized away',
        'residual_tasks': residuals, 'lower_bound': None,
        'cost': {k: feed[k] for k in ('reservation_seconds', 'worker_observed_seconds', 'controller_active_seconds', 'accounting')},
        'marker': {'program': digest(data['program']), 'policy': digest(data['policy']),
                   'components': sorted(data['components'])},
        'observer_seconds': time.monotonic()-start,
        'meaning': 'Encoding length of an actual checked reduction/transport witness plus full new overhead. NOT proof difficulty, shortest proof, payoff, reward, or evidence of easier residuals.'}


def report(study, output):
    plan = read(study/'audit/plan.json')
    records = [measure_checkpoint(study, plan, arm, key)
               for arm in ('baseline', 'exploration') for key in plan['checkpoints']]
    output.mkdir(parents=True, exist_ok=True)
    write(output/'raw.json', records)
    pairs = []
    for arm in ('baseline', 'exploration'):
        rows = [r for r in records if r['arm'] == arm]
        for a, b in zip(rows, rows[1:]):
            comparable = all(a.get(k) == b.get(k) and a.get(k) is not None for k in
                             ('root', 'panel_hash', 'encoding', 'conditional_dictionary_sha256'))
            known = comparable and all(r['measured_witness_bytes'] is not None for r in (a,b))
            pairs.append({'arm': arm, 'before': a['key'], 'after': b['key'],
                'same_goal_panel_dictionary_encoding': comparable,
                'encoding_change': b['measured_witness_bytes']-a['measured_witness_bytes'] if known else None,
                'proof_difficulty_change': None, 'interpretation': 'unknown proof burden; no inferred improvement'})
    write(output/'paired.json', pairs)
    svg = ['<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="500">',
        '<rect width="100%" height="100%" fill="white"/>',
        '<text x="20" y="30">Conditional witness encodings; remaining proof complexity UNKNOWN</text>']
    known = [r for r in records if r['measured_witness_bytes'] is not None]
    if not known:
        svg.append('<text x="40" y="200">Insufficient checked connections. No curve or improvement inferred.</text>')
    else:
        xmax = max(1, max(r['cost']['worker_observed_seconds'] for r in known))
        ymax = max(1, max(r['measured_witness_bytes'] for r in known))
        for r in known:
            x = 60+880*r['cost']['worker_observed_seconds']/xmax
            y = 420-340*r['measured_witness_bytes']/ymax
            color = '#0072B2' if r['arm'] == 'baseline' else '#D55E00'
            svg.append(f'<circle cx="{x}" cy="{y}" r="4" fill="{color}"><title>{html.escape(canonical(r))}</title></circle>')
            svg.append(f'<text x="{x}" y="{y-8}" font-size="10">{html.escape(r["key"])}</text>')
        svg.append('<text x="40" y="470">Measured worker wall seconds; points only, missing values omitted, all raw checkpoints retained.</text>')
    svg.append('</svg>')
    (output/'burden.svg').write_text('\n'.join(svg))
    (output/'README.md').write_text('Conditional remaining-proof audit, not source storage.\n\n'
        'Every scheduled checkpoint, including missing/unfavorable points, is in raw.json. '
        'The unchanged goal, panel, conditional dictionary and encoding are bound before comparison. '
        'Definitions, adapters and connecting proof costs are included once. Unknown residual proof '
        'burden and minimum complexity stay unknown. A smaller encoding is not an easier proof. '
        'No failed bounded search supplies a lower bound. No sawtooth is required or inferred. '
        'These files and derived proxies have no research-role read grant or decision consumer.\n')
    return {'records': len(records), 'known_witness_encodings': len(known), 'status': 'audit_only'}


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--study', type=Path, required=True)
    p.add_argument('--output', type=Path, required=True)
    a = p.parse_args()
    print(canonical(report(a.study.resolve(), a.output.resolve())))
