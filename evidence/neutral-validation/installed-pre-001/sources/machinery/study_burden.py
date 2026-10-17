"""Conditional remaining-proof-burden observer. No controller imports this file.

The fixed encoding is a canonical source/term/task bundle with the pinned Lean
rebuild/replay decoder. Only a checked witness has a measured encoding. Unknown
residual proofs remain unknown; no search failure gives a lower bound. This is
not a Kolmogorov-complexity estimator. Source-storage audits remain separate.
Direct completion receipts establish a separate resolution observation; their
proof bundles are not encoded here unless represented by a supported ledger route.
"""
import argparse
import html
import time
from pathlib import Path
from .study_common import Invalid, canonical, digest, read, write, verify_snapshot, sha, load_state, inside


def fixed_inputs(study):
    """Every public audit entry point checks the originally committed reference."""
    seal = read(study/'seal.json')
    for arm in ('baseline', 'exploration'):
        if load_state(study/'arms'/arm/'state.json')['seal_hash'] != digest(seal):
            raise Invalid('audit seal differs from original arm commitment')
    if sha(study/'seed/seed-files.json') != seal['seed_files_sha256']:
        raise Invalid('audit seed manifest changed')
    for name, hashed in seal['seed'].items():
        if sha(inside(study/'seed', name)) != hashed:
            raise Invalid('audit fixed seed input changed: '+name)
    contract, suite = read(study/'seed/contract.json'), read(study/'evaluation/suite.json')
    plan = seal['observer_plan']
    if (digest(suite) != seal['suite'] or digest(suite) != plan['panel_hash'] or
        contract['root_sha256'] != plan['root'] or
        seal['seed'][contract['root_file']] != plan['root']):
        raise Invalid('audit fixed root or panel changed')
    return seal, contract, suite, read(study/'seed/seed-files.json')


def bound_feed(study, arm, key):
    feed = read(study/'arms'/arm/'observer-outbox'/(key+'.json'))
    snapshot = inside(study, feed['snapshot'])
    manifest = verify_snapshot(snapshot)
    if (feed['key'] != key or feed['arm'] != arm or
        snapshot != study/'arms'/arm/'snapshots'/key or
        feed['snapshot_binding'] != manifest['binding'] or
        digest(feed['mathematics']) != feed['mathematics_binding']):
        raise Invalid('observer binding changed')
    sealed = read(study/'seal.json')['seed']
    if any(manifest['files'].get(n) != h for n,h in sealed.items() if n.endswith('.lean')):
        raise Invalid('observer snapshot changed immutable seed theory')
    if key == 'terminal':
        binding = feed.get('resolution', {})
        receipt = inside(study, binding['receipt'])
        result = read(receipt)
        if (sha(receipt) != binding['receipt_sha256'] or digest(result) != binding['result_binding'] or
            not result.get('resolved') or 'finished' not in result or
            result.get('bundle_hash') != binding['bundle_hash']):
            raise Invalid('terminal resolution binding changed')
        from .study_observer import validate_resolution
        validate_resolution(study, manifest, result)
    return feed, snapshot, manifest


def measure_checkpoint(study, plan, arm, key):
    seal, _, _, _ = fixed_inputs(study)
    if plan != seal['observer_plan']:
        raise Invalid('audit plan is not original sealed plan')
    path = study/'arms'/arm/'observer-outbox'/(key+'.json')
    if not path.exists():
        return {'arm': arm, 'key': key, 'status': 'missing_scheduled_checkpoint',
                'conditional_minimum_proof_complexity': None, 'measured_witness_bytes': None}
    feed, snapshot, manifest = bound_feed(study, arm, key)
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
        'resolution': feed.get('resolution'),
        'direct_completion_proof_encoding_bytes': None,
        'encoding_coverage': 'Supported reduction-ledger routes only. Receipt-bound root resolution is separate from an unmeasured direct proof encoding.',
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
        'meaning': 'Cumulative portfolio storage of all retained reduction routes plus overhead, not current-goal proof burden or difficulty.'}


def report(study, output):
    seal, _, _, _ = fixed_inputs(study)
    plan = seal['observer_plan']
    output.mkdir(parents=True, exist_ok=True)
    anomalies = []
    if not (study/'audit/plan.json').exists() or sha(study/'audit/plan.json') != seal['audit_plan_sha256']:
        anomalies.append({'kind': 'missing_or_changed_audit_plan', 'action': 'use sealed schedule; no research consequence'})
    for arm in ('baseline', 'exploration'):
        for key in plan['checkpoints']:
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
    plot_conditional(conditional, records, output)
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
    (output/'README.md').write_text('NEUTRAL FIXTURE when protocol transport is fixture; no live Astra campaign.\n'
        'Separate audits: cumulative portfolio witness storage in raw.json; '
        'conditional portfolio and separately bound per-witness descriptions in conditional-paired.json.\n'
        'conditional-descriptions.svg plots each witness against actual worker wall; overhead.svg plots the full '
        'introduced dictionary/adapter/connecting source charge separately. costs.svg plots observed worker wall, '
        'overlapping controller wall and reserved caps separately, never added. Points have tooltips and markers.\n\n'
        'Every scheduled checkpoint, including missing/unfavorable points, is in raw.json. '
        'Each available conditional endpoint is measured even if its neighbor is missing; '
        'no comparison, delta or line bridges a missing checkpoint. '
        'Direct completed root proofs are receipt/source-bound resolution observations, but their '
        'proof encodings are unmeasured unless represented by a supported reduction-ledger route. '
        'An unwitnessed encoding is not an unresolved mathematical root. '
        'The unchanged goal, panel, conditional dictionary and encoding are bound before comparison. '
        'Definitions, adapters and connecting proof costs are included once. Unknown residual proof '
        'burden and minimum complexity stay unknown. A smaller encoding is not an easier proof. '
        'No failed bounded search supplies a lower bound. No sawtooth is required or inferred. '
        'These files and derived proxies have no research-role read grant or decision consumer.\n')
    return {'records': len(records), 'known_witness_encodings': len(known), 'status': 'audit_only'}


def plot_conditional(pairs, records, output):
    """Measured series only; missing points break trajectories. No optimization."""
    order = {r['key']: i for i,r in enumerate(r for r in records if r['arm'] == 'baseline')}
    theories, overhead = {}, []
    events, previous_markers = {}, {}
    for r in records:
        if 'marker' not in r:
            continue
        previous = previous_markers.get(r['arm'])
        events[(r['arm'], r['key'])] = ['initial snapshot'] if previous is None else [
            k+' changed' for k,v in r['marker'].items() if previous.get(k) != v]
        previous_markers[r['arm']] = r['marker']
    for pair in pairs:
        for key, theory in pair.get('theories', {}).items():
            theories[(pair['arm'], key)] = theory
        if 'overhead_bytes' in pair:
            theory = pair['theories'][pair['after']]
            overhead.append({'series': pair['arm']+' / full new dictionary, adapters and connecting proofs',
                'key': pair['after'], 'x': theory['costs']['worker_observed_seconds'],
                'y': sum(pair['overhead_bytes'].values()), 'marker': 'theory delta',
                'details': pair['overhead_bytes']})
    points = []
    for (arm,key), theory in theories.items():
        for identifier, witness in theory['per_witness'].items():
            points.append({'series': arm+' / '+identifier+' / '+witness['witness_binding'][:8],
                'key': key, 'x': theory['costs']['worker_observed_seconds'],
                'y': witness['description_bytes'], 'marker': events.get((arm,key), []),
                'details': witness})
    costs = []
    for r in records:
        for metric in ('worker_observed_seconds', 'controller_active_seconds', 'reservation_seconds'):
            if 'cost' in r:
                costs.append({'series': r['arm']+' / '+metric, 'key': r['key'],
                    'x': order[r['key']], 'y': r['cost'][metric], 'marker': r['key'], 'details': r['cost']})
    missing = [r['arm']+'/'+r['key'] for r in records if r['status'] == 'missing_scheduled_checkpoint']
    for filename, rows, ylabel, xlabel in (
        ('conditional-descriptions.svg', points, 'Per-witness conditional description bytes (proof holes UNKNOWN)', 'Actual cumulative worker wall seconds'),
        ('overhead.svg', overhead, 'Full introduced dictionary / adapter / connecting proof bytes', 'Actual cumulative worker wall seconds'),
        ('costs.svg', costs, 'Seconds: observed quantities and reserved caps are separate', 'Scheduled checkpoint index')):
        series = sorted({p['series'] for p in rows})
        height = 580+18*len(series)
        svg = [f'<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="{height}" viewBox="0 0 1200 {height}">',
            '<rect width="100%" height="100%" fill="white"/>',
            '<text x="20" y="25">Audit only: measured encodings/costs; no proof-complexity estimate or required decrease</text>',
            f'<text x="20" y="50">{html.escape(ylabel)}</text>',
            '<path d="M 90 80 V 430 H 1140" fill="none" stroke="black"/>',
            f'<text x="240" y="475">{html.escape(xlabel)}</text>']
        xmax = max([1]+[p['x'] for p in rows]); ymax = max([1]+[p['y'] for p in rows])
        for fraction in (0, .25, .5, .75, 1):
            x, y = 90+1050*fraction, 430-340*fraction
            svg += [f'<text x="{x}" y="450" font-size="11">{xmax*fraction:.2f}</text>',
                    f'<text x="10" y="{y}" font-size="11">{ymax*fraction:.1f}</text>']
        colors = ['#0072B2','#D55E00','#009E73','#CC79A7','#555555','#882255']
        for index, name in enumerate(series):
            color = colors[index % len(colors)]
            group = sorted((p for p in rows if p['series'] == name), key=lambda p: order[p['key']])
            previous = None
            for p in group:
                x,y = 90+1050*p['x']/xmax, 430-340*p['y']/ymax
                if previous and order[p['key']] == order[previous[0]['key']]+1:
                    svg.append(f'<path d="M {previous[1]} {previous[2]} L {x} {y}" stroke="{color}" fill="none"/>')
                changed = previous is None or p['y'] != previous[0]['y'] or bool(p['marker'])
                if changed:
                    svg.append(f'<path d="M {x} 80 V 430" stroke="{color}" stroke-dasharray="2,5" opacity="0.3"/>')
                svg.append(f'<circle cx="{x}" cy="{y}" r="4" fill="{color}"><title>{html.escape(canonical(p))}</title></circle>')
                svg.append(f'<text x="{min(x+3,1060)}" y="{y-7-index%3*12}" font-size="9">{html.escape(p["key"])}</text>')
                previous = (p,x,y)
            svg.append(f'<text x="20" y="{580+18*index}" fill="{color}" font-size="11">{html.escape(name)}</text>')
        if not rows:
            svg.append('<text x="180" y="240">Insufficient measured witnesses; no curve inferred.</text>')
        svg += ['<text x="20" y="505">Markers: first/value change or recorded program/policy/component change (tooltip). Flat/rising/irregular retained.</text>',
            '<text x="20" y="525">Missing points break lines; unknown proof holes are not zero. Overhead is separate and charged in per-witness pairs.</text>',
            f'<text x="20" y="545" font-size="10">Missing: {html.escape(", ".join(missing))}</text>', '</svg>']
        (output/filename).write_text('\n'.join(svg))


def conditional_pair(study, arm, old, new):
    """Explicit partial proof descriptions conditioned on each accepted theory.

    The decoder is pinned Lean plus the canonical JSON schema. References to
    accepted declarations cost their encoded names; the dictionary delta is
    reported separately in full. Holes have no measured proof length.
    No minimum, proof difficulty, or easier-residual claim is computed.
    """
    seal, contract, suite, seed = fixed_inputs(study)
    references = [{'id': 'exact-root', 'declaration': contract['root_declaration'],
        'context': {n: sha(study/'seed'/n) for n in seed if n.endswith('.lean')}}] + suite['tasks']
    result = {'schema': 'math-gkm.conditional-portfolio-and-witness.v3', 'arm': arm, 'before': old, 'after': new,
        'reference_tasks': references, 'reference_binding': digest(references),
        'encoding': 'canonical UTF-8 JSON separately bound partial Lean application descriptions v3',
        'minimum_proof_complexity': None, 'proof_difficulty_change': None,
        'status': 'audit_only', 'theories': {}, 'missing_checkpoints': [],
        'comparison_available': False, 'per_witness_pairs': [],
        'description_change_bytes': None}
    dictionaries = {}
    for key in (old, new):
        path = study/'arms'/arm/'observer-outbox'/(key+'.json')
        if not path.exists():
            result['status'] = 'missing_scheduled_checkpoint'
            result['missing_checkpoints'].append(key)
            continue
        feed, snap, manifest = bound_feed(study, arm, key)
        data = feed['mathematics']
        records = {**data['knowledge'], **data['components']}
        if any(manifest['files'].get(n) != h for r in records.values() for n,h in r['source_files'].items()):
            raise Invalid('conditional dictionary differs from accepted source bindings')
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
            descriptions.append({'witness_id': rid, 'target': 'exact-root', 'apply_checked_reduction': record['exports'][0],
                'receipt_hash': record['receipt_hash'], 'residuals': residuals,
                'meaning': 'partial derivation description; holes explicitly unknown'})
        fixed = [{'task': t['id'], 'proof': None, 'unknown_proof_remainder_bytes': None}
                 for t in references if t['id'] != 'exact-root' or not descriptions]
        payload = {'descriptions': descriptions, 'unwitnessed_reference_tasks': fixed}
        result['theories'][key] = {'theory_binding': digest(dictionary),
            'snapshot_binding': manifest['binding'], 'dictionary_source_hashes': {n: manifest['files'][n] for n in dictionary},
            'conditional_portfolio_description': payload, 'conditional_portfolio_description_bytes': len(canonical(payload).encode()),
            'resolution': feed.get('resolution'),
            'direct_completion_proof_encoding_bytes': None,
            'encoding_coverage': 'Supported reduction-ledger routes only; unwitnessed encoding does not mean unresolved mathematics.',
            'per_witness': {d['witness_id']: {'description': d,
                'witness_binding': digest({'root': references[0], 'id': d['witness_id'], 'receipt': d['receipt_hash']}),
                'description_bytes': len(canonical(d).encode()),
                'unknown_proof_holes': [x['id'] for x in d['residuals'] if x['unknown_proof_remainder_bytes'] is None],
                'minimum_proof_complexity': None} for d in descriptions},
            'unknown_proof_remainder': 'unknown; missing proofs are never assigned zero bytes',
            'costs': {k: feed[k] for k in ('reservation_seconds', 'worker_observed_seconds', 'controller_active_seconds')}}
    if result['missing_checkpoints']:
        result['interpretation'] = 'Available endpoints retained independently; comparison and overhead delta unknown across missing checkpoints.'
        return result
    result['comparison_available'] = True
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
        interpretation='Portfolio and each fixed witness are separate. No current route is selected by this observer. Same references; description bytes are not proof difficulty.')
    # Charge the full new dictionary once per paired theory comparison. A
    # per-witness total includes it conservatively, never sums unused routes.
    overhead = sum(result['overhead_bytes'].values())
    result['per_witness_pairs'] = []
    left, right = result['theories'][old]['per_witness'], result['theories'][new]['per_witness']
    for identifier in sorted(set(left) | set(right)):
        a, b = left.get(identifier), right.get(identifier)
        same = bool(a and b and a['witness_binding'] == b['witness_binding'])
        result['per_witness_pairs'].append({'id': identifier, 'same_witness': same,
            'before': a, 'after': b, 'introduced_dictionary_adapter_connecting_overhead_bytes': overhead,
            'after_description_plus_full_introduced_overhead_bytes': b['description_bytes']+overhead if b else None,
            'description_change_bytes': b['description_bytes']-a['description_bytes'] if same else None,
            'unknown_proof_complexity': None,
            'accounting': 'Full shared dictionary delta charged to each standalone witness comparison; do not sum these totals across witnesses.'})
    return result


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--study', type=Path, required=True)
    p.add_argument('--output', type=Path, required=True)
    a = p.parse_args()
    print(canonical(report(a.study.resolve(), a.output.resolve())))
