"""Static saved-evidence comparison only; no project imports or mathematical evaluation."""
import ast
import hashlib
import json
from datetime import datetime, timezone
from pathlib import Path

T = Path('/private/tmp/math_gkm_godel_20261013')
MP = T / 'markov_worker_000183_replay_method_evidence.json'
def read(p):
    return json.loads(Path(p).read_text())
def digest(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def pin(p):
    p = Path(p)
    return dict(path=str(p), bytes=p.stat().st_size, sha256=digest(p))
m = read(MP)
hp = T / 'markov_worker_000183_mathematical_source_hashes.json'
sp = T / 'markov_worker_000183_source_structure_audit.json'
fp = T / 'markov_worker_000183_finite_domain_audit.json'
vp = T / 'markov_worker_000183_validation_evidence.json'
h, s, f, v = map(read, (hp, sp, fp, vp))
assert all(x['worker'] == 183 for x in (h, s, f, v))
hs = {x['module']: x for x in h['new_sources']}
ss = {x['module']: x for x in s['new_modules']}
assert hs == ss
assert set(hs) == set(m['compiled_only_source_object_bindings']) == set(v['all_sources'])
for n, x in hs.items():
    g = m['source_graph'][n]
    b = m['compiled_only_source_object_bindings'][n]
    y = v['all_sources'][n]
    decl = [(z['kind'], z['name']) for z in x['declarations']]
    assert decl == [(z['kind'], z['name']) for z in g['declarations']]
    assert decl == [(z['kind'], z['name']) for z in y['declarations']]
    assert x['sha256'] == g['sha256'] == b['source_sha256'] == y['sha256']
    assert x['imports'] == g['imports'] == y['imports']
    assert x['theorem_count'] == sum(a == 'theorem' for a, _ in decl)
    assert x['definition_count'] == sum(a in ('def', 'abbrev') for a, _ in decl)
    assert x['ordinary_current_object']['sha256'] == b['object_sha256']
    assert x['ordinary_current_object']['bytes'] == b['object_bytes']
    assert not x['replayed_in183'] and not x['printed_in183']
assert m['all_new_counts'] == {'def': 26, 'theorem': 54}
mb = {x['receipt']: x for x in m['build_receipts']}
vb = {Path(x['receipt']['path']).name: x for x in v['runs']}
assert len(h['builds']) == len(mb) == len(vb) == 18
for x in h['builds']:
    name = Path(x['receipt']['path']).name
    a, b = mb[name], vb[name]
    assert x['receipt']['sha256'] == a['receipt_sha256'] == b['receipt']['sha256']
    assert x['module'] in a['modules'] and x['module'] == b['module']
    assert x['source_sha256'] == a['modules'][x['module']] == b['source_sha256']
    assert x['snapshot']['sha256'] == x['source_sha256'] == b['snapshot']['sha256']
    assert x['returncode'] == a['returncode'] == b['returncode']
    assert x['timeout'] == a.get('timeout', False) == b['timeout']
    assert x['seconds'] == a['seconds'] == b['seconds']
    assert x['command'] == a['command']
    assert x['final_source_identical'] == b['final_source_identical']
for x in h['scripts']:
    assert x['sha256'] == m['retained_path_provenance'][x['project_relative_path']]['sha256']
assert len(h['scripts']) == 7
objects = {x['module']: x for x in v['objects']}
for n, b in m['compiled_only_source_object_bindings'].items():
    x = objects[n]
    assert x['current']['sha256'] == b['object_sha256'] == x['content_addressed_object']['sha256']
    assert x['content_addressed_matches_current'] and not x['compiler_receipt_has_object_digest']
commands = {x['line']: x for x in m['commands'] if x['type'] == 'item.completed'}
sections = dict(zip(('source-experiment.json','top-midpoint.json','top-moment-probe.json',
    'geometric-weight-probe.json','high-mass-probe.json','kernel-lc-weight-probe.json'),
    ('source_experiment','midpoint','moment','geometric','high_mass','random_weight')))
finite = []
for x in f['output_event_bindings']:
    p = Path(x['pin']['path'])
    assert digest(p) == x['pin']['sha256'] and p.stat().st_size == x['pin']['bytes']
    saved = read(p)
    assert saved == f[sections[x['result']]]['result']
    events = []
    for z in x['matching_completed_stdout']:
        c = commands[z['line']]
        assert c['exit_code'] == z['exit_code'] == 0
        try:
            literal = json.loads(c['output'])
            kind = 'JSON'
        except json.JSONDecodeError:
            literal = ast.literal_eval(c['output'])
            kind = 'Python literal'
        # JSON normalization only reconciles tuple/list serialization; no value computation.
        literal = json.loads(json.dumps(literal))
        projection = {k: val for k, val in saved.items() if k != 'labels'} if x['result'] == 'source-experiment.json' else saved
        assert literal == projection
        events.append(dict(line=z['line'], format=kind, excludes=['labels'] if x['result'] == 'source-experiment.json' else [], equal=True))
    finite.append(dict(result=x['result'], pin=x['pin'], events=events))
    m['static_input_sha256'][str(p)] = digest(p)
cp = Path(f['certificate']['pin']['path'])
assert digest(cp) == f['certificate']['pin']['sha256']
cert = read(cp)
gen = ast.literal_eval(commands[49]['output'])
assert gen == {'scale': 6300, 'terms': 56}
assert cert['scale'] == f['certificate']['scale_literal'] == gen['scale']
assert len(cert['coefficients']) == f['certificate']['term_count'] == gen['terms']
assert cert['coefficients'][0] == f['certificate']['constant_literal']
m['static_input_sha256'][str(cp)] = digest(cp)
dep = v['dependency_hash_observation']
expected = m['inherited_object_bindings_from_prior182']['entries']
assert dep['pair_count'] == len(dep['rows']) == len(expected) == 2797 and not dep['mismatches']
assert dep['source_current_hashes_read'] == dep['object_current_hashes_read'] == 2797
for x in dep['rows']:
    e = expected[x['module']]
    assert x['source'] == e['source'] and x['object'] == e['object']
    assert x['source_sha256'] == e['source_sha256'] == e['prior_source_sha256'] == e['before183_source_sha256']
    assert x['object_sha256'] == e['prior_object_sha256'] == e['before183_object_sha256']
    assert x['all_expected_current_controller_before_match']
summary = ('Primary H/S/F and the reviewed validation draft agree on all ten compiled-only source/object bindings, '
    '54 theorem declarations, 26 definitions, all 18 attempts and seven current scripts. Six saved finite objects '
    'match their retained literal outputs; the source output excludes only its labels. The generator scale and '
    '56-term list length are compared literally; no coefficient, gap, polynomial, sign or random value was recomputed. '
    'The validator independently freshly hashed all 2,797 inherited source/object pairs at '
    + dep['started_utc'] + '–' + dep['finished_utc'] + '; every identity agrees with the method’s sealed182/controller-before expectations. '
    'That is the validator’s bounded byte observation, not a separate method pair-hashing window or proof replay. '
    'The evolving validation/main files are reviewed as drafts, not immutable method inputs.')
cross = dict(observed_utc=datetime.now(timezone.utc).isoformat(), scope='Saved evidence and exact retained literal comparisons only',
    primary_supports=[pin(p) for p in (hp, sp, fp)], reviewed_validation_draft=pin(vp),
    sources=10, theorem_declarations=54, definitions=26, attempts=18, current_scripts=7,
    finite_outputs=finite, certificate_literal_summary=gen, inherited_pairs=2797,
    validator_dependency_observation={k: val for k,val in dep.items() if k != 'rows'},
    validator_all_pair_identities_match=True, validator_current_object_CAS_hashes_agree=10,
    mathematical_values_recomputed=False, random_samples_regenerated=False, summary=summary)
m['companion_crosscheck'] = cross
m['validator_inherited_pair_observation'] = {k: val for k,val in dep.items() if k != 'rows'}
m['validator_inherited_pair_observation']['method_independent_fresh_pair_hash_window'] = False
m['validator_inherited_pair_observation']['all_expected_identity_comparisons_pass'] = True
m['audit_helper_refinements'].append(dict(scope='Pre-window audit-only companion parser',
    change='Certificate saved list key is coefficients, while generator stdout uses terms for its length.',
    prior_attempt='Stopped at a KeyError before writing evidence; all preceding static comparisons had passed.',
    project_execution=False, mathematical_values_recomputed=False))
for p in (hp, sp, fp, T/'audit_worker183_static.py', Path(__file__)):
    m['static_input_sha256'][str(p)] = digest(p)
MP.write_text(json.dumps(m, indent=2, sort_keys=True)+'\n')
print(json.dumps(dict(pins=len(m['static_input_sha256']), sources=10, attempts=18, scripts=7, outputs=6, pairs=2797)))
