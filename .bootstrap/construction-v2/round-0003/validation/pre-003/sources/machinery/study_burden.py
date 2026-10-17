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
    path = study/'arms'/arm/'observer-outbox'/(key+'.json')
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
    return {'schema': 'math-gkm.cumulative-witness-storage.v2', 'arm': arm, 'key': key,
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
    seal = read(study/'seal.json')
    plan = seal['observer_plan']
    output.mkdir(parents=True, exist_ok=True)
    anomalies = []
    if not (study/'audit/plan.json').exists() or sha(study/'audit/plan.json') != seal['audit_plan_sha256']:
        anomalies.append({'kind': 'missing_or_changed_audit_plan', 'action': 'use sealed schedule; no research consequence'})
    for arm in ('baseline', 'exploration'):
        for key in plan['checkpoints'] + ['terminal']:
            producer = study/'arms'/arm/'observer-outbox'/(key+'.json')
            export = study/'audit/inputs'/arm/(key+'.json')
            if producer.exists() and (not export.exists() or sha(producer) != sha(export)):
                anomalies.append({'kind': 'missing_or_conflicting_export', 'arm': arm, 'key': key,
                    'producer_sha256': sha(producer), 'export_sha256': sha(export) if export.exists() else None})
    write(output/'audit-anomalies.json', anomalies)
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
    conditional = []
    for arm in ('baseline', 'exploration'):
        for old, new in zip(plan['checkpoints'], plan['checkpoints'][1:]):
            conditional.append(conditional_pair(study, arm, old, new))
    write(output/'conditional-paired.json', conditional)
    svg = ['<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="500">',
        '<rect width="100%" height="100%" fill="white"/>',
        '<text x="20" y="30">Cumulative witness encodings against initial theory; proof complexity UNKNOWN</text>']
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
    (output/'README.md').write_text('Two separate audits: cumulative explicit witness storage in raw.json; '
        'same-goal conditional descriptions under old/enlarged accepted theories in conditional-paired.json.\n\n'
        'Every scheduled checkpoint, including missing/unfavorable points, is in raw.json. '
        'The unchanged goal, panel, conditional dictionary and encoding are bound before comparison. '
        'Definitions, adapters and connecting proof costs are included once. Unknown residual proof '
        'burden and minimum complexity stay unknown. A smaller encoding is not an easier proof. '
        'No failed bounded search supplies a lower bound. No sawtooth is required or inferred. '
        'These files and derived proxies have no research-role read grant or decision consumer.\n')
    return {'records': len(records), 'known_witness_encodings': len(known), 'status': 'audit_only'}


def conditional_pair(study, arm, old, new):
    """Explicit partial proof descriptions conditioned on each accepted theory.

    The decoder is pinned Lean plus the canonical JSON schema. References to
    accepted declarations cost their encoded names; the dictionary delta is
    reported separately in full. Holes have no measured proof length.
    No minimum, proof difficulty, or easier-residual claim is computed.
    """
    contract = read(study/'seed/contract.json')
    suite = read(study/'evaluation/suite.json')
    seed = read(study/'seed/seed-files.json')
    references = [{'id': 'exact-root', 'declaration': contract['root_declaration'],
        'context': {n: sha(study/'seed'/n) for n in seed if n.endswith('.lean')}}] + suite['tasks']
    result = {'schema': 'math-gkm.conditional-remaining.v2', 'arm': arm, 'before': old, 'after': new,
        'reference_tasks': references, 'reference_binding': digest(references),
        'encoding': 'canonical UTF-8 JSON partial Lean application descriptions v2',
        'minimum_proof_complexity': None, 'proof_difficulty_change': None,
        'status': 'audit_only', 'theories': {}}
    dictionaries = {}
    for key in (old, new):
        path = study/'arms'/arm/'observer-outbox'/(key+'.json')
        if not path.exists():
            result['status'] = 'missing_scheduled_checkpoint'
            return result
        feed = read(path)
        snap = study/feed['snapshot']
        manifest = verify_snapshot(snap)
        data = feed['mathematics']
        records = {**data['knowledge'], **data['components']}
        paths = {n for n in seed if n.endswith('.lean')}
        paths |= {n for r in records.values() for n in r['source_files']}
        dictionary = {n: (snap/'source'/n).read_text() for n in sorted(paths)}
        dictionaries[key] = dictionary
        descriptions = []
        for rid, record in sorted(records.items()):
            if record['kind'] != 'reductions':
                continue
            residuals = []
            for oid, obligation in sorted(data['remaining_obligations'].items()):
                if obligation.get('source') != rid:
                    continue
                discharge = records.get(obligation.get('discharge'))
                residuals.append({'id': oid, 'exact_target': obligation.get('target_constant'),
                    'context_binding': obligation.get('context_binding'),
                    'checked_discharge_reference': discharge['exports'][0] if discharge else None,
                    'unknown_proof_remainder_bytes': None if not discharge else 0})
            descriptions.append({'target': 'exact-root', 'apply_checked_reduction': record['exports'][0],
                'receipt_hash': record['receipt_hash'], 'residuals': residuals,
                'meaning': 'partial derivation description; holes explicitly unknown'})
        fixed = [{'task': t['id'], 'proof': None, 'unknown_proof_remainder_bytes': None}
                 for t in references if t['id'] != 'exact-root' or not descriptions]
        payload = {'descriptions': descriptions, 'unwitnessed_reference_tasks': fixed}
        result['theories'][key] = {'theory_binding': digest(dictionary),
            'snapshot_binding': manifest['binding'], 'dictionary_source_hashes': {n: digest(v) for n,v in dictionary.items()},
            'conditional_description': payload, 'conditional_description_bytes': len(canonical(payload).encode()),
            'unknown_proof_remainder': 'unknown; missing proofs are never assigned zero bytes',
            'costs': {k: feed[k] for k in ('reservation_seconds', 'worker_observed_seconds', 'controller_active_seconds')}}
    delta = {n: text for n,text in dictionaries[new].items() if dictionaries[old].get(n) != text}
    removed = sorted(set(dictionaries[old])-set(dictionaries[new]))
    categories = {'dictionary_definitions': {}, 'adapters_and_connecting_proofs': {}}
    for n,text in delta.items():
        category = 'adapters_and_connecting_proofs' if '/Accepted' in n or '/Target' in n else 'dictionary_definitions'
        categories[category][n] = text
    result.update(enlargement=not removed and all(dictionaries[new].get(n) == t for n,t in dictionaries[old].items()),
        removed_or_changed_old_sources=[n for n,t in dictionaries[old].items() if dictionaries[new].get(n) != t],
        introduced_overhead=categories,
        overhead_bytes={k: len(canonical(v).encode()) for k,v in categories.items()},
        shared_cost_rule='Each new source appears once across overhead categories; dictionary is not a free abbreviation.',
        interpretation='Same exact reference tasks under two bound theories. Description bytes are not proof difficulty; no forced change.')
    return result


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--study', type=Path, required=True)
    p.add_argument('--output', type=Path, required=True)
    a = p.parse_args()
    print(canonical(report(a.study.resolve(), a.output.resolve())))
