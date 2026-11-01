"""Closed public-constructor schemas for prospective formal-head projection.

This classifies references; it does not prove admission, validate a theorem,
replace FINISHED reuse, or qualify model permissions/ownership. Unknown layouts
are unsupported and choose the normal fresh path through snapshot_routing.
"""
import copy
from pathlib import Path
import re

from .study_common import Invalid, digest, sha, read

SCHEMA = 'math-gkm.formal-projection.public-constructors.v1'
FIELDS = frozenset({'knowledge', 'components', 'remaining_obligations',
                    'formal_obligations', 'proposition_dag', 'pending_discoveries'})
RECORD = frozenset({'id', 'kind', 'proposal_hash', 'proposal', 'task', 'receipt_hash',
    'solution', 'validation_bundle', 'dependencies', 'claim', 'used_declarations',
    'source_files', 'exports', 'export_module', 'export_status', 'truth', 'relevance',
    'novelty', 'usefulness'})
TASK = frozenset({'id', 'hypotheses', 'scope', 'source_sha256', 'kind',
    'context_modules', 'required_constants', 'statement', 'interface_type',
    'transport_type', 'context_sources', 'target_module'})
KINDS = frozenset({'mathematical_claims', 'attachments', 'representations',
                   'reductions', 'compositions', 'fiber_gluings'})
COMPONENTS = frozenset({'attachments', 'representations', 'fiber_gluings'})
HEX = re.compile('[0-9a-f]{64}')
MODULE = re.compile(r'MathGKM\.[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*')


def _need(test, reason):
    if not test:
        raise Invalid('unsupported formal projection: '+reason)


def _keys(value, required, optional=()):
    _need(type(value) is dict and set(required) <= value.keys() and
          not (value.keys() - set(required) - set(optional)), 'unknown/missing constructor keys')


def _strings(value):
    _need(type(value) is list and all(type(x) is str and x for x in value), 'string list')


def _hash(value):
    _need(type(value) is str and HEX.fullmatch(value), 'hash binding')


def _source(source, files, name):
    _need(type(name) is str, 'source reference type')
    path = Path(name)
    _need(not path.is_absolute() and '..' not in path.parts and
          all(not p.startswith('.') for p in path.parts) and name.startswith('MathGKM/') and
          name.endswith('.lean') and name in files, 'constructor source path')
    full = source/path
    _need(not full.is_symlink() and full.resolve().is_relative_to(source.resolve()) and
          full.is_file() and sha(full) == files[name], 'source reference bytes')
    return full


def _module(source, files, name):
    _need(type(name) is str and MODULE.fullmatch(name), 'module reference')
    return _source(source, files, name.replace('.', '/')+'.lean')


def _proposal(kind, item):
    from .study_knowledge import SCHEMAS
    optional = {'dependencies', 'required_constants', 'discharges', 'target_id', 'premises'}
    schema = SCHEMAS[kind]
    _keys(item, set(schema)-optional, set(schema) | {'dependencies', 'required_constants'})
    for name, value in item.items():
        if name in ('dependencies', 'required_constants', 'discharges', 'premises'):
            _strings(value)
        elif name == 'residuals':
            _need(type(value) is list, 'proposal residual list')
            for residual in value:
                _keys(residual, {'id', 'statement'})
                _need(all(type(v) is str and v for v in residual.values()), 'proposal residual strings')
        else:
            _need(type(value) is str and value, 'proposal scalar')


def _task(source, files, task, contract):
    from .study_transfer import target_source
    _keys(task, TASK, {'residuals', 'reduction_root'})
    _need(task['source_sha256'] == contract['root_sha256'], 'task goal source binding')
    for name in TASK - {'hypotheses', 'context_modules', 'required_constants', 'context_sources'}:
        _need(type(task[name]) is str and task[name], 'task scalar')
    for name in ('hypotheses', 'context_modules', 'required_constants'):
        _strings(task[name])
    _need(task['hypotheses'] == [], 'ordinary constructor hypotheses')
    _need(type(task['context_sources']) is dict and task['context_sources'], 'context source map')
    for name, hashed in task['context_sources'].items():
        _hash(hashed)
        _need(digest(_source(source, files, name).read_text()) == hashed, 'exact context text binding')
    for module in task['context_modules']:
        _module(source, files, module)
        _need(module.replace('.', '/')+'.lean' in task['context_sources'], 'context module association')
    if 'residuals' in task:
        _need(type(task['residuals']) is list, 'task residual list')
        for residual in task['residuals']:
            _keys(residual, {'statement'}, {'id', 'existing_constant'})
            _need(all(type(v) is str and v for v in residual.values()), 'task residual scalars')
    if 'reduction_root' in task:
        _need(type(task['reduction_root']) is str and task['reduction_root'], 'reduction root')
    unbound = {k: v for k, v in task.items() if k != 'target_module'}
    _need(task['target_module'] == 'MathGKM.Target'+digest(unbound)[:24], 'target module binding')
    _need(_module(source, files, task['target_module']).read_text() == target_source(task), 'generated exact target bytes')


def _composition(value, source, files, records):
    _keys(value, {'statement', 'term', 'open_leaves', 'dependencies', 'modules', 'target', 'selected_routes'})
    for key in ('statement', 'term', 'target'):
        _need(type(value[key]) is str and value[key], 'composition scalar')
    for key in ('open_leaves', 'dependencies', 'modules'):
        _strings(value[key])
    _need(set(value['dependencies']) <= records.keys(), 'composition dependency references')
    for module in value['modules']:
        _module(source, files, module)
    _need(type(value['selected_routes']) is list, 'composition routes')
    for route in value['selected_routes']:
        _keys(route, {'target', 'edge', 'premises'})
        _strings(route['premises'])
        _need(type(route['target']) is str and route['edge'] in records, 'composition edge reference')


def _record(identifier, record, group, source, files, contract, armroot, records):
    from .study_transfer import wrapper
    _keys(record, RECORD, {'composition'})
    _need(type(identifier) is str and re.fullmatch('[A-Za-z0-9_-]+', identifier) and
          record['id'] == identifier and record['kind'] in KINDS and
          ((record['kind'] in COMPONENTS) == (group == 'components')), 'record identity/kind/group')
    _proposal(record['kind'], record['proposal'])
    _need(record['proposal']['id'] == identifier and digest(record['proposal']) == record['proposal_hash'], 'proposal binding')
    _task(source, files, record['task'], contract)
    _need(record['task']['id'] == identifier, 'record task identity')
    _keys(record['solution'], {'module', 'term', 'interface_term', 'transport_term'})
    _module(source, files, record['solution']['module'])
    _need(all(type(v) is str and v for v in record['solution'].values()), 'solution scalars')
    _keys(record['claim'], {'statement', 'hypotheses'})
    _need(record['claim'] == {k: record['task'][k] for k in ('statement', 'hypotheses')}, 'claim target association')
    _keys(record['validation_bundle'], {'directory', 'finished_sha256'})
    directory = Path(record['validation_bundle']['directory'])
    _need(directory.is_absolute() and directory.resolve() == directory and
          directory.is_relative_to(armroot.resolve()), 'canonical same-arm receipt reference')
    _hash(record['validation_bundle']['finished_sha256']); _hash(record['receipt_hash'])
    marker, result = directory/'FINISHED.json', directory/'result.json'
    _need(not marker.is_symlink() and not result.is_symlink() and
          marker.stat().st_size <= 32*1024**2 and
          sha(marker) == record['validation_bundle']['finished_sha256'] and
          digest(read(result, max_bytes=64*1024**2)) == record['receipt_hash'],
          'actual accepted finished/result reference bytes')
    # The unchanged verify_record/reuse path remains authoritative for the
    # FINISHED schema, every retained artifact, binary/pin and premise check.
    _strings(record['dependencies']); _need(set(record['dependencies']) <= records.keys(), 'accepted dependencies')
    _need(type(record['source_files']) is dict and record['source_files'], 'accepted source map')
    for name, hashed in record['source_files'].items():
        _hash(hashed)
        _need(sha(_source(source, files, name)) == hashed, 'accepted source version')
    _need(set(record['task']['context_sources']) <= record['source_files'].keys() and
          record['solution']['module'].replace('.', '/')+'.lean' in record['source_files'],
          'complete accepted context/solution references')
    _need(type(record['used_declarations']) is dict, 'used declaration map')
    for value in record['used_declarations'].values():
        _keys(value, {'module', 'source_sha256', 'identity_schema', 'semantic_sha256'})
        _module(source, files, value['module']); _hash(value['source_sha256']); _hash(value['semantic_sha256'])
        _need(files[value['module'].replace('.', '/')+'.lean'] == value['source_sha256'] and
              type(value['identity_schema']) is str and value['identity_schema'], 'used declaration source/identity')
    key = digest({'kind': record['kind'], 'item': record['proposal'], 'task': record['task']})
    prefix = 'Accepted'+key[:24]
    _need(record['export_module'] == 'MathGKM.'+prefix and record['exports'] ==
          [prefix+'.'+suffix for suffix in ('obligation', 'interface', 'transport')], 'generated export binding')
    exported = wrapper(record['task'], record['solution'])
    for old, new in zip(('StudyObligation', 'StudyInterface', 'StudyTransport'), record['exports']):
        exported = exported.replace(old, new)
    _need(_module(source, files, record['export_module']).read_text() == exported, 'generated export bytes')
    _need(record['task']['target_module'].replace('.', '/')+'.lean' in record['source_files'] and
          record['export_module'].replace('.', '/')+'.lean' in record['source_files'], 'generated source references')
    for key in ('export_status', 'truth', 'relevance', 'novelty', 'usefulness'):
        _need(type(record[key]) is str and record[key], 'constructor record scalar')
    if 'composition' in record:
        _need(record['kind'] == 'compositions', 'composition record kind')
        _composition(record['composition'], source, files, records)


def _obligations(remaining, dag, source, files, contract, records):
    _need(type(remaining) is dict, 'remaining obligation map')
    for identifier, value in remaining.items():
        _keys(value, {'statement', 'target_module', 'target_constant', 'context_binding',
                     'status', 'source', 'connection'}, {'id', 'discharge'})
        _need(all(type(v) is str and v for v in value.values()), 'remaining obligation scalars')
        _need(value.get('id', identifier) == identifier and value['source'] in records, 'residual source identity')
        parent = records[value['source']]
        _need(parent['kind'] in ('representations', 'reductions') and
              value['target_module'] == parent['task']['target_module'] and
              value['context_binding'] == digest(parent['task']['context_sources']), 'residual target/context association')
        residuals = parent['task'].get('residuals', [])
        matches = [n for n, residual in enumerate(residuals) if residual['statement'] == value['statement'] and
                   residual.get('id', identifier) == identifier]
        _need(any(value['target_constant'] == value['target_module']+'.Residual'+str(n) for n in matches), 'residual exact constant')
        _module(source, files, value['target_module'])
        _need(value['status'] in ('open', 'checked') and
              (value['status'] == 'checked') == ('discharge' in value), 'residual discharge status')
        if 'discharge' in value:
            _need(value['discharge'] in records and identifier in records[value['discharge']]['proposal'].get('discharges', []), 'discharge reference')
    if dag is None:
        _need(not records and not remaining, 'missing constructor DAG')
        return
    _keys(dag, {'root', 'nodes', 'edges'})
    _need(dag['root'] == 'root' and type(dag['nodes']) is dict and 'root' in dag['nodes'] and
          type(dag['edges']) is dict and set(dag['nodes']) == {'root'} | set(remaining), 'DAG nodes/root')
    for identifier, node in dag['nodes'].items():
        _keys(node, {'constant', 'module', 'context', 'status'},
              {'source', 'connection', 'proof', 'proof_id', 'proof_module'})
        _need(all(type(v) is str and v for v in node.values()), 'DAG scalar')
        expected = {'constant': contract['root_declaration'], 'module': contract['root_file'][:-5].replace('/', '.'),
                    'context': contract['root_sha256']} if identifier == 'root' else {
            'constant': remaining[identifier]['target_constant'], 'module': remaining[identifier]['target_module'],
            'context': remaining[identifier]['context_binding']}
        _need(all(node[k] == v for k, v in expected.items()), 'DAG exact proposition context')
        _module(source, files, node['module'])
        if any(key in node for key in ('proof', 'proof_id', 'proof_module')):
            _need({'proof', 'proof_id', 'proof_module'} <= node.keys() and node['status'] == 'checked' and
                  node['proof_id'] in records and node['proof_module'] == records[node['proof_id']]['export_module'], 'DAG proof reference')
        else:
            _need(node['status'] == 'open', 'DAG open status')
        if 'source' in node:
            _need(node['source'] in records and node['source'] == identifier, 'representation source node')
    for target, edges in dag['edges'].items():
        _need(target in dag['nodes'] and type(edges) is list, 'DAG edge target')
        for edge in edges:
            _keys(edge, {'id', 'premises', 'proof', 'module', 'receipt_hash'})
            _strings(edge['premises'])
            _need(edge['id'] in records and records[edge['id']]['kind'] == 'reductions' and
                  set(edge['premises']) <= dag['nodes'].keys(), 'DAG edge references')
            record = records[edge['id']]
            _need(target == record['proposal'].get('target_id', 'root') and
                  edge['premises'] == record['proposal'].get('premises', []) +
                    [r['id'] for r in record['proposal']['residuals']] and
                  edge['proof'] == record['exports'][0] and edge['module'] == record['export_module'] and
                  edge['receipt_hash'] == record['receipt_hash'], 'DAG edge receipt/export association')


def project(research, source, files, contract, armroot):
    """Return the FULL supported ledger; never normalize/drop formal fields."""
    from .study_bridge import OBLIGATIONS
    _need(research.get('mode') == armroot.name, 'same-arm research mode')
    _need(research.get('pending_discoveries') in (None, {}), 'nonempty pending external reference schema')
    _need(research['formal_obligations'] == OBLIGATIONS, 'fixed bridge obligation constructor')
    for group in ('knowledge', 'components'):
        _need(type(research[group]) is dict, 'accepted map')
    _need(not (research['knowledge'].keys() & research['components'].keys()), 'duplicate accepted identity')
    records = {**research['knowledge'], **research['components']}
    _source(source, files, contract['root_file'])
    _need(files[contract['root_file']] == contract['root_sha256'], 'unchanged root source')
    for group in ('knowledge', 'components'):
        for identifier, record in research[group].items():
            _record(identifier, record, group, source, files, contract, armroot, records)
    _obligations(research['remaining_obligations'], research.get('proposition_dag'), source, files, contract, records)
    return {name: copy.deepcopy(research.get(name)) for name in sorted(FIELDS)}


def admitted_paths(research, seed_files):
    """Same path union as the unchanged Arm.admitted constructor."""
    return sorted({name for name in seed_files if name.endswith('.lean')} |
        {name for group in ('knowledge', 'components') for record in research[group].values()
         for name in record['source_files'] if name.endswith('.lean')})
