"""One-way description-burden audit. This module is never imported by policy code.

Raw bytes and zlib-9 bytes are encoding measurements, not Kolmogorov complexity.
No interpolation/smoothing or claimed sawtooth. SVG is generated with stdlib.
"""
import argparse
import html
from pathlib import Path
import time
import zlib
import json
import os
from .study_common import ROOT, Invalid, read, write, sha, load_state, canonical, verify_snapshot

def encoding_sizes(path):
    raw=packed=0; compressor=zlib.compressobj(9)
    with path.open('rb') as source:
        for block in iter(lambda:source.read(65536),b''):
            raw+=len(block)
            if raw>128*1024**2: raise Invalid('audit artifact bound; observation unavailable')
            packed+=len(compressor.compress(block))
    return raw,packed+len(compressor.flush())

def source_bundle(snapshot_path,manifest,bundle):
    bundle.parent.mkdir(parents=True,exist_ok=True)
    tmp=bundle.with_name(bundle.name+'.next'); total=0
    with tmp.open('w') as out:
        out.write('{'); first=True
        for name in sorted(manifest['files']):
            if not (name.startswith('MathGKM/') and name.endswith('.lean')): continue
            source=snapshot_path/'source'/name
            if source.stat().st_size>8*1024**2: raise Invalid('audit source bound')
            text=source.read_text(); encoded=canonical(name)+':'+canonical(text)
            total+=len(encoded.encode())
            if total>128*1024**2: raise Invalid('audit bundle bound')
            if not first: out.write(',')
            first=False; out.write(encoded)
        out.write('}\n'); out.flush(); os.fsync(out.fileno())
    os.replace(tmp,bundle)

def measured_cost(study, arm):
    root = study/'arms'/arm
    receipts = list((root/'jobs').glob('*/receipt.json'))
    validations = list((root/'evaluations').glob('*/*/*/result.json'))
    return {'subprocess_wall_seconds': sum(read(p).get('elapsed_seconds', 0) for p in receipts),
            'validation_wall_seconds': sum(read(p).get('elapsed_seconds', 0) for p in validations),
            'controller_overhead_seconds': None,
            'accounting': 'Non-overlapping worker watchdog wall plus standalone compiler/replay wall. Includes model wait and tools inside each worker. Controller overhead unknown; no CPU/token/money equivalence.'}

def measure(study, arm, artifact, dataset, reference_set, representation, marker=None, pair_id=None):
    start = time.monotonic()
    artifact, dataset = artifact.resolve(), dataset.resolve()
    if not artifact.is_relative_to(study.resolve()) or not dataset.is_relative_to(study.resolve()):
        raise Invalid('audit artifacts must be actual local study artifacts')
    raw_bytes,zlib_bytes=encoding_sizes(artifact)
    costs = measured_cost(study, arm)
    record = {'schema': 'math-gkm.audit.v2', 'synthetic': read(study/'protocol.json')['transport'] == 'fixture',
        'arm': arm, 'artifact': str(artifact), 'artifact_sha256': sha(artifact),
        'dataset_sha256': sha(dataset), 'reference_set': reference_set,
        'representation': representation, 'pair_id': pair_id, 'marker': marker,
        'raw_bytes': raw_bytes, 'zlib9_bytes': zlib_bytes,
        'cost': costs, 'cumulative_research_seconds': costs['subprocess_wall_seconds']+costs['validation_wall_seconds'],
        'cost_basis': 'worker_plus_standalone_validation_wall',
        'meaning': 'Bytes of the specified representation artifact; no estimate of shortest description or intrinsic mathematical difficulty.',
        'timestamp': time.time(), 'measurement_seconds': time.monotonic()-start}
    directory = study/'audit/raw'
    directory.mkdir(parents=True, exist_ok=True)
    write(directory/f'{time.time_ns()}.json', record)
    return record

def report(study, output):
    paths=sorted((study/'audit/raw').glob('*.json'))
    if len(paths)>4096 or any(p.stat().st_size>65536 for p in paths): raise Invalid('audit report bound')
    records = [read(p) for p in paths]
    output.mkdir(parents=True, exist_ok=True)
    write(output/'raw.json', records)
    synthetic = read(study/'protocol.json')['transport'] == 'fixture' or any(r.get('synthetic') for r in records)
    title = 'SYNTHETIC FIXTURE — no mathematical progress' if synthetic else 'Observed representation burden — live artifacts'
    groups = {}
    for r in records:
        # Changing workload NEVER joins a fixed-set trajectory.
        key = (r['arm'], r['reference_set'], r['dataset_sha256'], r.get('cost_basis', 'unspecified'))
        groups.setdefault(key, []).append(r)
    width, height = 1000, 540
    svg = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="white"/>',
        f'<text x="30" y="30" font-size="19">{html.escape(title)}</text>',
        '<text x="30" y="53" font-size="13">Raw byte observations; no smoothing, no Kolmogorov estimate, no automatic sawtooth inference.</text>']
    if not records:
        svg.append('<text x="100" y="240" font-size="24">No measurements. No curve or improvement can be inferred.</text>')
    else:
        xmax = max(1, max(r['cumulative_research_seconds'] for r in records))
        ymax = max(1, max(r['raw_bytes'] for r in records))
        svg += ['<path d="M 90 90 V 440 H 950" fill="none" stroke="black"/>',
            '<text x="250" y="495">Cumulative measured seconds (accounting basis recorded per series)</text>',
            '<text x="10" y="80">Bytes</text>']
        colors = ['#0072B2', '#D55E00', '#009E73', '#CC79A7', '#555555']
        for index, (key, rows) in enumerate(groups.items()):
            color = colors[index % len(colors)]
            rows.sort(key=lambda r: (r['cumulative_research_seconds'], r['timestamp']))
            points = [(90+850*r['cumulative_research_seconds']/xmax, 440-340*r['raw_bytes']/ymax) for r in rows]
            if len(points) > 1:
                svg.append('<polyline fill="none" stroke="'+color+'" points="'+' '.join(f'{x:.2f},{y:.2f}' for x,y in points)+'"/>')
            for r, (x,y) in zip(rows, points):
                label = html.escape(f"{r['representation']}: {r['raw_bytes']} bytes; data {r['dataset_sha256']}; {r['cumulative_research_seconds']:.3f}s")
                svg.append(f'<circle cx="{x:.2f}" cy="{y:.2f}" r="4" fill="{color}"><title>{label}</title></circle>')
                if r.get('marker'):
                    svg.append(f'<line x1="{x:.2f}" x2="{x:.2f}" y1="90" y2="440" stroke="{color}" stroke-dasharray="3,3"/>')
                    svg.append(f'<text x="{x+5:.2f}" y="{110+index*18}" font-size="11">{html.escape(r["marker"])}</text>')
            svg.append(f'<text x="{100+index%2*430}" y="{515+index//2*16}" font-size="9" fill="{color}">{html.escape(str(key[0:2]))} / {key[2][:8]} / {html.escape(key[3])}</text>')
    svg.append('</svg>')
    (output/'burden.svg').write_text('\n'.join(svg))
    pairs = {}
    for r in records:
        if r.get('pair_id'):
            pairs.setdefault(r['pair_id'], []).append(r)
    pair_report = []
    for name, rows in pairs.items():
        comparable = len(rows) == 2 and rows[0]['dataset_sha256'] == rows[1]['dataset_sha256'] and rows[0]['reference_set'] == rows[1]['reference_set']
        pair_report.append({'pair_id': name, 'same_data_comparable': comparable,
            'raw_byte_change': rows[1]['raw_bytes'] - rows[0]['raw_bytes'] if comparable else None})
    write(output/'paired-comparisons.json', pair_report)
    (output/'README.md').write_text(f'''# {title}

{len(records)} raw observations in {len(groups)} fixed-data groups. Fewer than two observations in a group cannot show a trend. A live-empty report deliberately shows no curve.

`raw.json` retains every unfavorable and favorable observation. `burden.svg` plots raw bytes, connects only the same arm/reference-set/data hash, and marks reported representation/strategy changes. `paired-comparisons.json` admits a drop comparison only for exactly two measurements on the same data and reference set. Changed data form separate trajectories. Connecting points is visual ordering, not interpolation evidence.

Raw bytes measure the explicitly named artifact's encoding. zlib level 9 byte counts are also saved, but are not shortest descriptions, Kolmogorov complexity, mathematical difficulty or a reward. Representation semantics and encoding choices may change; a byte drop alone proves no improvement. A sawtooth may be absent. This program neither detects nor manufactures one.

The x coordinate uses the accounting basis recorded per series: manual `measure` sums worker-watchdog wall (including provider wait/tools) and separately run validation wall; retrospective `collect` uses only actual worker receipts completed before a snapshot. These bases never join a trajectory. Neither is CPU, invoice cost, token equivalence or total elapsed calendar time. Measurement overhead is separate. Controller overhead is unknown. Provider usage remains verbatim in receipts. Prediction/transfer results remain in independently checked evaluation records; this byte plot does not imply them. Retrospective bundles measure active Lean source storage against a fixed target, not an encoding of mathematical input data; equivalence is not asserted.

Audit files are outside every live proposer filesystem grant and are absent from the policy/request projection. Do not copy this report or its derived proxies into a research request. Synthetic fixtures are not mathematical evidence.
''')
    return {'records': len(records), 'groups': len(groups), 'synthetic': synthetic, 'output': str(output)}

def collect(study):
    """Post-run observer of immutable snapshots; never called by the controller.

    The representation is an exact canonical JSON source bundle, not a compressed
    encoding of mathematical data. The fixed reference is the pinned target file.
    Reconstruct costs only from actual receipts ending before each snapshot.
    """
    collected = []
    for arm in ('baseline', 'exploration'):
        root = study/'arms'/arm
        receipts = [read(p) for p in (root/'jobs').glob('*/receipt.json')]
        previous_policy = None
        for path in sorted((root/'snapshots').iterdir()):
            manifest = verify_snapshot(path)
            start = time.monotonic()
            bundle = study/'audit/bundles'/f'{arm}-{path.name}.json'
            source_bundle(path,manifest,bundle)
            raw_bytes,zlib_bytes=encoding_sizes(bundle)
            cost = sum(r.get('elapsed_seconds', 0) for r in receipts
                       if r.get('finished', float('inf')) <= manifest['created'])
            marker = 'initial representation' if previous_policy is None else (
                'strategy change' if previous_policy != manifest['policy'] else None)
            previous_policy = manifest['policy']
            record = {'schema': 'math-gkm.audit.v2', 'synthetic': read(study/'protocol.json')['transport'] == 'fixture',
                'arm': arm, 'artifact': str(bundle), 'artifact_sha256': sha(bundle),
                'dataset_sha256': sha(study/'seed'/read(study/'seed/contract.json')['root_file']), 'reference_set': 'fixed-pinned-target-source',
                'representation': 'canonical active MathGKM source bundle at '+path.name,
                'pair_id': None, 'marker': marker, 'raw_bytes': raw_bytes, 'zlib9_bytes': zlib_bytes,
                'cumulative_research_seconds': cost, 'timestamp': manifest['created'],
                'cost_basis': 'worker_wall_only_before_snapshot',
                'measurement_seconds': time.monotonic()-start,
                'cost': {'accounting': 'Only actual worker/watchdog wall completed before snapshot; excludes standalone validation and controller wall. Unknown interrupted receipts excluded, not treated as observed zero.',
                         'subprocess_wall_seconds': cost, 'validation_wall_seconds': None,
                         'controller_overhead_seconds': None},
                'meaning': 'Exact active Lean source bundle storage against fixed target bytes; excludes archived sources and non-Lean experiments. No claim that programs are equivalent or encode the dataset; no prediction/transfer inference.'}
            write(study/'audit/raw'/f'collected-{arm}-{path.name}.json', record)
            collected.append(record)
    return {'observations': len(collected), 'status': 'audit_only; no decisions affected'}

def main():
    p = argparse.ArgumentParser(description=__doc__)
    sub = p.add_subparsers(dest='command', required=True)
    plot = sub.add_parser('report')
    plot.add_argument('--study', type=Path, required=True)
    plot.add_argument('--output', type=Path, required=True)
    c = sub.add_parser('collect')
    c.add_argument('--study', type=Path, required=True)
    m = sub.add_parser('measure')
    m.add_argument('--study', type=Path, required=True)
    m.add_argument('--arm', choices=['baseline', 'exploration'], required=True)
    for flag in ('artifact', 'dataset'):
        m.add_argument('--'+flag, type=Path, required=True)
    for flag in ('reference-set', 'representation'):
        m.add_argument('--'+flag, required=True)
    m.add_argument('--marker')
    m.add_argument('--pair-id')
    a = p.parse_args()
    if a.command == 'collect':
        result = collect(a.study.resolve())
    elif a.command == 'report':
        result = report(a.study.resolve(), a.output.resolve())
    else:
        result = measure(a.study.resolve(), a.arm, a.artifact, a.dataset, a.reference_set, a.representation, a.marker, a.pair_id)
    print(canonical(result))

if __name__ == '__main__':
    main()
