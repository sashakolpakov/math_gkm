"""Isolated acquisition and bounded before/after tests of admitted methods.

The controller selects a frozen predecessor. Candidates select already checked
mathematics, not arbitrary axioms or self-certified exports. The comparison is
an exact additive source extension with the old policy and notes retained.
Private challenges, solutions and the growing application regression pool stay
under the owning arm's method-learning directory, never in research requests.
"""
import copy
import math
from pathlib import Path
import re
import shutil

from .study_common import (Invalid, digest, inside, read, sha, snapshot,
                           verify_snapshot, write, SOURCE_TOTAL_CAP, copy_seed)

SCHEMA = 'math-gkm.method-acquisition.v1'
DEFAULT = {'enabled': False, 'repetitions': 2, 'max_methods_per_review': 1,
           'max_methods': 16, 'holdout_tasks': 2, 'regression_limit': 8}
IDENT = re.compile(r'[A-Za-z0-9][A-Za-z0-9_.-]{0,95}\Z')
SHA = re.compile(r'[0-9a-f]{64}\Z')
CANDIDATE_KEYS = {'id', 'accepted_ids', 'application_notes', 'goal_connection', 'predictions'}
SCHEMAS = {'method_plan': {'id': 'immutable method identifier',
    'predictions': [{'consequence_id': 'fresh own prediction identifier',
                     'statement': 'exact closed Lean proposition committed before development'}]},
    'method_candidate': {
    'id': 'new immutable method identifier',
    'accepted_ids': ['already independently admitted knowledge/component identifier'],
    'application_notes': ['NEW research/*.md, *.txt or *.rst source path; optional'],
    'goal_connection': 'own-source explanation of relevance; not proof certification',
    'predictions': [{'consequence_id': 'prospectively committed concept consequence',
                     'accepted_id': 'selected already admitted item'}],
}}
RULES = ('A method_candidate selects accepted_ids and their exact source closure, plus optional NEW '
         'application notes. The controller compares an unchanged frozen predecessor with its additive '
         'extension. It excludes unrelated episode work and keeps policy/base notes identical. '
         'Commit method_plan exact closed Lean predictions before development. Candidate prediction links '
         'must match independently checked closed mathematical claims; relevance and English/Lean '
         'correspondence remain research interpretations. Fresh bounded '
         'comparisons may show finite-resource search benefit; predecessor failure is not unprovability. '
         'Keep method feedback and uncertainty when choosing whether to develop, generalize, apply or '
         'deprioritize a method. In an enabled method-learning experiment, plan the development '
         'of a genuinely reusable method early and submit it for a matched test when its '
         'mathematics has been independently admitted. If no defensible candidate emerges, '
         'report the obstruction honestly; no comparison means the learning hypothesis remains '
         'untested. Preserve the full original conjecture and never manufacture a trivial method '
         'to fill an experiment quota. Description length and complexity remain audit-only.')


def validate_config(config=None):
    if config is None:
        return copy.deepcopy(DEFAULT)
    if not isinstance(config, dict) or set(config)-set(DEFAULT):
        raise Invalid('method learning config keys/schema mismatch')
    value = {**DEFAULT, **config}
    if type(value['enabled']) is not bool:
        raise Invalid('method learning enabled must be boolean')
    bounds = {'repetitions': (1, 8), 'max_methods_per_review': (1, 4),
              'max_methods': (1, 128), 'holdout_tasks': (1, 16),
              'regression_limit': (0, 32)}
    for field, (low, high) in bounds.items():
        if type(value[field]) is not int or not low <= value[field] <= high:
            raise Invalid('method learning integer bound: '+field)
    if value['max_methods_per_review'] > value['max_methods']:
        raise Invalid('method review bound exceeds total method bound')
    return value


def partition_suite(suite, config=None):
    """Disjoint acquisition, interim assessment, and untouched final holdouts.

    Explicit holdout annotations take precedence. With no annotations, the last
    batch is final, the preceding batch is interim assessment, and earlier batches
    are available for method acquisition. Previous regression tasks can be shared.
    Disabled historical protocols retain their original comparison behavior.
    """
    cfg = validate_config(config)
    if not cfg['enabled']:
        return {name: copy.deepcopy(suite) for name in ('methods', 'assessment', 'final')}
    tasks = suite['tasks']
    for task in tasks:
        if 'evaluation_scope' in task and (task['kind'] != 'holdout' or
                task['evaluation_scope'] not in ('method', 'assessment', 'final')):
            raise Invalid('invalid frozen evaluation scope')
    explicit = any('evaluation_scope' in t for t in tasks if t['kind'] == 'holdout')
    holdouts = [t for t in tasks if t['kind'] == 'holdout']
    count = cfg['holdout_tasks']
    final_ids = {t['id'] for t in holdouts[-count:]} if not explicit else set()
    assessment_ids = {t['id'] for t in holdouts[-2*count:-count]} if not explicit else set()
    groups = {name: [] for name in ('methods', 'assessment', 'final')}
    for task in tasks:
        if task['kind'] == 'regression':
            for group in groups.values():
                group.append(copy.deepcopy(task))
            continue
        if explicit:
            scope = task.get('evaluation_scope', 'assessment')
        else:
            scope = ('final' if task['id'] in final_ids else
                     'assessment' if task['id'] in assessment_ids else 'method')
        groups['methods' if scope == 'method' else scope].append(copy.deepcopy(task))
    return {name: {**copy.deepcopy(suite), 'tasks': values} for name, values in groups.items()}


def validate_plan(plan):
    if (not isinstance(plan, dict) or set(plan) != {'id', 'predictions'} or
            not isinstance(plan['id'], str) or not IDENT.fullmatch(plan['id'])):
        raise Invalid('method plan keys/identifier mismatch')
    predictions = plan['predictions']
    if not isinstance(predictions, list) or not 1 <= len(predictions) <= 16:
        raise Invalid('method plan needs prospective exact statements')
    seen = set()
    for prediction in predictions:
        if (not isinstance(prediction, dict) or set(prediction) != {'consequence_id', 'statement'} or
                not isinstance(prediction['consequence_id'], str) or
                not IDENT.fullmatch(prediction['consequence_id']) or prediction['consequence_id'] in seen or
                not isinstance(prediction['statement'], str) or not prediction['statement'].strip() or
                len(prediction['statement']) > 8000):
            raise Invalid('invalid exact prospective method prediction')
        seen.add(prediction['consequence_id'])
    return copy.deepcopy(plan)


def validate_candidate(proposal):
    if not isinstance(proposal, dict) or set(proposal) != CANDIDATE_KEYS:
        raise Invalid('method candidate keys/schema mismatch')
    if not isinstance(proposal['id'], str) or not IDENT.fullmatch(proposal['id']):
        raise Invalid('invalid method identifier')
    ids = proposal['accepted_ids']
    if (not isinstance(ids, list) or not 1 <= len(ids) <= 16
            or any(not isinstance(x, str) or not IDENT.fullmatch(x) for x in ids)
            or len(set(ids)) != len(ids)):
        raise Invalid('method needs distinct accepted identifiers')
    notes = proposal['application_notes']
    if (not isinstance(notes, list) or len(notes) > 16 or
            any(not isinstance(x, str) for x in notes) or len(set(notes)) != len(notes)):
        raise Invalid('method note list bound')
    for name in notes:
        if (not isinstance(name, str) or not name.startswith('research/') or
                Path(name).suffix not in ('.md', '.txt', '.rst')):
            raise Invalid('method application notes must be research text')
        inside(Path('/'), name)
    text = proposal['goal_connection']
    if not isinstance(text, str) or not text.strip() or len(text) > 4000:
        raise Invalid('bounded own goal connection required')
    predictions = proposal['predictions']
    if not isinstance(predictions, list) or len(predictions) > 16:
        raise Invalid('method prediction list bound')
    seen = set()
    for item in predictions:
        if (not isinstance(item, dict) or set(item) != {'consequence_id', 'accepted_id'} or
                not isinstance(item['consequence_id'], str) or not IDENT.fullmatch(item['consequence_id']) or
                item['consequence_id'] in seen or item['accepted_id'] not in ids):
            raise Invalid('method prediction must bind a selected accepted item')
        seen.add(item['consequence_id'])
    return copy.deepcopy(proposal)


def _root(arm):
    return arm.root/'method-learning'


def _copy_sources(source, files, target):
    for name, hashed in files.items():
        original = inside(source/'source', name)
        if not original.is_file() or sha(original) != hashed:
            raise Invalid('method source differs from its frozen snapshot')
        dest = inside(target, name)
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(original, dest)
        dest.chmod(0o444)


def prepare_method(arm, before, after, proposal, registry=None, *,
                   concept_reference=None, prediction_ids=None, prediction_statements=None):
    """Create a new exact additive candidate; never alter or reseal old snapshots.

    `before` is controller-selected before development, never a proposer path.
    Named exports are recovered from finished admitted records, not model claims.
    Receipt verification uses existing unchanged reuse APIs, not a new proof gate.
    """
    cfg = validate_config(arm.p.get('method_learning'))
    if not cfg['enabled']:
        raise Invalid('method learning is not enabled')
    proposal = validate_candidate(proposal)
    before, after = Path(before), Path(after)
    if any(not p.resolve().is_relative_to(arm.root.resolve()) or p.is_symlink() for p in (before, after)):
        raise Invalid('method snapshots must belong to their owning arm')
    bm, am = verify_snapshot(before), verify_snapshot(after)
    if concept_reference is not None and (not isinstance(concept_reference, str) or not SHA.fullmatch(concept_reference)):
        raise Invalid('invalid method concept reference')
    if prediction_statements is not None:
        if not isinstance(prediction_statements, dict):
            raise Invalid('method prediction statements must be a mapping')
        validate_plan({'id': proposal['id'], 'predictions': [
            {'consequence_id': key, 'statement': value} for key, value in prediction_statements.items()]})
    allowed_predictions = set(prediction_ids or (prediction_statements or {}).keys())
    if any(p['consequence_id'] not in allowed_predictions for p in proposal['predictions']):
        raise Invalid('method prediction was not prospectively committed')
    binding = {'schema': SCHEMA, 'proposal': proposal, 'before': bm['binding'],
               'after': am['binding'], 'concept_reference': concept_reference,
               'prediction_ids': sorted(allowed_predictions),
               'prediction_statements': copy.deepcopy(prediction_statements)}
    reference = digest(binding)
    directory = _root(arm)/reference
    descriptor_path = directory/'prepared.json'
    existing = read(descriptor_path) if descriptor_path.exists() else None
    if existing is not None and existing.get('commitment') != binding:
        raise Invalid('method acquisition commitment changed')
    identity_path = _root(arm)/'identities.json'
    identities = read(identity_path) if identity_path.exists() else {}
    if proposal['id'] in identities and identities[proposal['id']] != reference:
        raise Invalid('method identifiers are immutable; create a new version')
    if proposal['id'] not in identities and len(identities) >= cfg['max_methods']:
        raise Invalid('method acquisition count bound')
    research = arm.s.get('research', {})
    registry = registry if registry is not None else {
        **research.get('knowledge', {}), **research.get('components', {})}
    selected, exports, admitted, sources = {}, [], set(bm.get('admitted_modules', [])), {}
    from .study_knowledge import verify_record
    for identifier in proposal['accepted_ids']:
        record = registry.get(identifier)
        if not isinstance(record, dict):
            raise Invalid('method selects unknown or unaccepted mathematics')
        verify_record(record, after/'source')
        if not record.get('exports') or not record.get('source_files'):
            raise Invalid('method admission lacks exported source closure')
        for name, hashed in record['source_files'].items():
            if am['files'].get(name) != hashed:
                raise Invalid('method admission differs from frozen development source')
            if name in bm['files'] and bm['files'][name] != hashed:
                raise Invalid('method cannot modify predecessor sources')
            if name in sources and sources[name] != hashed:
                raise Invalid('method source closures disagree')
            sources[name] = hashed
            if name.endswith('.lean'):
                admitted.add(name)
        if any(not isinstance(x, str) or not x for x in record['exports']):
            raise Invalid('invalid admitted method export')
        exports.extend(record['exports'])
        selected[identifier] = {'receipt_hash': record['receipt_hash'],
                                'exports': record['exports'], 'source_files': record['source_files'],
                                'export_module': record.get('export_module')}
    prediction_checks = []
    linked = {p['consequence_id']: p['accepted_id'] for p in proposal['predictions']}
    for consequence in sorted(allowed_predictions):
        identifier = linked.get(consequence)
        if identifier is None:
            prediction_checks.append({'consequence_id': consequence, 'accepted_id': None,
                                      'status': 'not_checked'})
            continue
        if prediction_statements is None:
            prediction_checks.append({'consequence_id': consequence, 'accepted_id': identifier,
                                      'status': 'reported_correspondence_only'})
            continue
        record = registry[identifier]
        task = record.get('task', {})
        if (record.get('kind') != 'mathematical_claims' or task.get('hypotheses') != [] or
                not isinstance(task.get('statement'), str) or
                task['statement'].strip() != prediction_statements[consequence].strip()):
            raise Invalid('admission does not prove exact prospective method statement')
        prediction_checks.append({'consequence_id': consequence, 'accepted_id': identifier,
                                  'status': 'statement_binding_pending'})
    for name in proposal['application_notes']:
        if name in bm['files'] or name not in am['files']:
            raise Invalid('method notes must be newly added frozen sources')
        sources[name] = am['files'][name]
    additions = {name: hashed for name, hashed in sources.items() if name not in bm['files']}
    if not additions or not any(n.endswith('.lean') for n in additions):
        raise Invalid('method has no new admitted mathematical source')
    all_files = {**bm['files'], **additions}
    sizes = sum(inside(before/'source', n).stat().st_size for n in bm['files']) + sum(
        inside(after/'source', n).stat().st_size for n in additions)
    if sizes > SOURCE_TOTAL_CAP:
        raise Invalid('method source inventory bound')
    # Journal identity before copies. Interrupted constructors cannot change id.
    identities[proposal['id']] = reference
    write(identity_path, identities)
    write(directory/'commitment.json', binding)
    candidate = directory/'candidate'
    workspace = directory/'construction'
    if candidate.exists():
        cm = verify_snapshot(candidate)
        if (cm['files'] != all_files or cm['policy'] != bm['policy'] or
                cm.get('admitted_modules') != sorted(admitted)):
            raise Invalid('interrupted method candidate binding changed')
    else:
        if workspace.exists():
            raise Invalid('interrupted method construction; preserve origin')
        workspace.mkdir(parents=True, exist_ok=False)
        _copy_sources(before, bm['files'], workspace)
        _copy_sources(after, additions, workspace)
        cm = snapshot(workspace, candidate, copy.deepcopy(bm['policy']), sorted(admitted))
        # The exact candidate is now frozen. Retire only its redundant constructor.
        shutil.rmtree(workspace)
    descriptor = {'schema': SCHEMA, 'reference': reference, 'method_id': proposal['id'],
                  'before': bm['binding'], 'candidate': cm['binding'],
                  'before_path': str(before.resolve()), 'candidate_path': str(candidate.resolve()),
                  'required_exports': sorted(set(exports)), 'commitment': binding,
                  'selected_admissions': selected, 'additions': additions,
                  'prediction_checks': prediction_checks}
    if existing is not None and existing != descriptor:
        raise Invalid('prepared method source or admission binding changed')
    write(descriptor_path, descriptor)
    return descriptor


def _pool(arm):
    path = _root(arm)/'application-pool.json'
    return path, read(path) if path.exists() else {'schema': SCHEMA, 'entries': [], 'cursor': 0}


def _reserve_suite(arm, prepared, cfg):
    """Reserve an unused pretrial subset; never invent retrospective holdouts."""
    directory = _root(arm)/prepared['reference']
    path = directory/'suite.json'
    original = read(arm.study/'evaluation/suite.json')
    source = partition_suite(original, cfg)['methods']
    if path.exists():
        frozen = read(path)
        if frozen.get('source_suite') != digest(source):
            raise Invalid('method pretrial task pool changed')
        return frozen
    ledger_path = _root(arm)/'holdout-use.json'
    ledger = read(ledger_path) if ledger_path.exists() else {
        'schema': SCHEMA, 'source_suite': digest(source), 'reservations': {}}
    if ledger.get('source_suite') != digest(source):
        raise Invalid('method pretrial task pool changed')
    previous = ledger['reservations'].get(prepared['reference'])
    used = {task for reference, reservation in ledger['reservations'].items()
            if reference != prepared['reference'] for task in reservation}
    holdouts = [t for t in source['tasks'] if t['kind'] == 'holdout' and t['id'] not in used]
    chosen = ([t for t in holdouts if t['id'] in set(previous)] if previous is not None
              else holdouts[:cfg['holdout_tasks']])
    if not source.get('independent') or len(chosen) < cfg['holdout_tasks']:
        result = {'available': False, 'source_suite': digest(source), 'suite': None,
                  'reason': 'independent_holdout_pool_exhausted_or_unavailable'}
        write(path, result)
        return result
    # Reserve task IDs before effects, including an interruption before suite copy.
    if previous is not None:
        ids = set(previous)
        chosen = [t for t in source['tasks'] if t['id'] in ids]
        if len(chosen) != cfg['holdout_tasks']:
            raise Invalid('interrupted method task reservation changed')
    else:
        ledger['reservations'][prepared['reference']] = [t['id'] for t in chosen]
        write(ledger_path, ledger)
    _, pool = _pool(arm)
    entries = pool['entries']
    old_regressions = [t for t in source['tasks'] if t['kind'] == 'regression']
    if entries:
        start = pool['cursor'] % len(entries)
        learned = [entries[(start+i) % len(entries)]['task'] for i in range(len(entries))]
    else:
        learned = []
    tasks, identities = [], set()
    # Learned applications rotate; original declared regression tasks join them.
    for task in learned + old_regressions:
        if task['id'] not in identities and len(tasks) < cfg['regression_limit']:
            tasks.append({**copy.deepcopy(task), 'kind': 'regression'})
            identities.add(task['id'])
    for task in chosen:
        if task['id'] in identities:
            raise Invalid('method holdout overlaps a regression identity')
        tasks.append(copy.deepcopy(task))
        identities.add(task['id'])
    suite = {**source, 'tasks': tasks}
    result = {'available': True, 'source_suite': digest(source), 'suite': suite,
              'scope': 'unused pretrial holdouts plus bounded rotating learned applications',
              'regression_count': sum(t['kind'] == 'regression' for t in tasks)}
    write(path, result)
    return result


def _remember_applications(arm, suite, trials, reference):
    """Retain checked applications privately; complete proof artifacts stay put."""
    path, pool = _pool(arm)
    indexed = {entry['task']['id']: entry for entry in pool['entries']}
    for result in trials:
        if (result.get('status') != 'valid_finite_budget_comparison' or
                result.get('all_frozen_declarations_retained') is not True):
            continue
        checks = result.get('sides', {}).get('after', {}).get('checks', [])
        checked = {item.get('task_id') for item in checks if item.get('checked') is True}
        for task in suite['tasks']:
            if task['kind'] == 'holdout' and task['id'] in checked:
                entry = {'task': copy.deepcopy(task), 'origin_method': reference,
                         'comparison_binding': digest(result['binding'])}
                old = indexed.get(task['id'])
                if len(indexed) >= 2048 and old is None:
                    raise Invalid('learned application pool exceeds frozen method bound')
                if old is not None and old['task'] != task:
                    raise Invalid('learned application identity changed')
                indexed.setdefault(task['id'], entry)
    pool['entries'] = list(indexed.values())
    pool['cursor'] += 1
    write(path, pool)


def prediction_gate(arm, prepared):
    """Parse committed predictions in T, then prove them with T+C exports.

    Textual equality alone is insufficient: a new definition or notation must
    not determine the meaning of the prediction it purportedly establishes.
    The existing validator compiles the target from OLD context modules before
    importing the selected new proof modules. Only a finished check is reused.
    """
    directory = _root(arm)/prepared['reference']
    checks = [p for p in prepared['prediction_checks'] if p['status'] == 'statement_binding_pending']
    if not checks:
        return {'checked': True, 'status': 'no_linked_exact_predictions', 'checked_predictions': 0,
                'elapsed_seconds': 0.0}
    before, candidate = Path(prepared['before_path']), Path(prepared['candidate_path'])
    bm, cm = verify_snapshot(before), verify_snapshot(candidate)
    if bm['binding'] != prepared['before'] or cm['binding'] != prepared['candidate']:
        raise Invalid('method prediction source binding changed')
    workspace = directory/'prediction-workspace'
    if not workspace.exists():
        copy_seed(arm.study/'seed', workspace)
        _copy_sources(candidate, cm['files'], workspace)
    from .study_transfer import bind_task, check_task
    from .completion import NAME
    modules, terms, propositions = [], [], []
    statements = prepared['commitment']['prediction_statements']
    for item in checks:
        record = prepared['selected_admissions'][item['accepted_id']]
        module = record.get('export_module')
        if not isinstance(module, str) or not NAME.fullmatch(module):
            raise Invalid('method prediction needs the accepted export module')
        modules.append(module)
        terms.append(record['exports'][0])
        propositions.append(statements[item['consequence_id']])
    solution_module = 'MathGKM.MethodPrediction'+prepared['reference'][:24]
    source = ''.join('import '+module+chr(10) for module in dict.fromkeys(modules))
    path = workspace/(solution_module.replace('.', '/')+'.lean')
    if path.exists() and path.read_text() != source:
        raise Invalid('method prediction consumer source changed')
    if not path.exists():
        path.write_text(source)
    contract = read(workspace/'contract.json')
    context_modules = [name[:-5].replace('/', '.') for name in bm.get('admitted_modules', [])]
    task = {'id': 'method_prediction', 'statement': ' ∧ '.join('('+p+')' for p in propositions),
            'hypotheses': [], 'scope': 'exact prospective propositions parsed solely in the predecessor context',
            'source_sha256': contract['root_sha256'], 'kind': 'holdout',
            'interface_type': 'True', 'transport_type': 'True', 'required_constants': terms,
            'strict_closed_statement': True}
    task = bind_task(workspace, task, context_modules)
    solution = {'module': solution_module, 'interface_term': 'True.intro',
                'transport_term': 'True.intro',
                'term': terms[0] if len(terms) == 1 else '⟨'+', '.join(terms)+'⟩'}
    dest = directory/'prediction-validation'
    reservation = directory/'prediction-reservation.json'
    identity = {'task': digest(task), 'solution': digest(solution),
                'seconds': arm.p['validation_seconds'], 'candidate': prepared['candidate']}
    if (dest/'FINISHED.json').exists():
        if not reservation.exists() or read(reservation) != identity:
            raise Invalid('method prediction validation commitment changed')
        from .validation_receipts import reuse
        result = reuse(dest, task, solution, terms)
    elif dest.exists() or reservation.exists():
        return {'checked': False, 'status': 'interrupted_prediction_not_replayed',
                'checked_predictions': 0, 'elapsed_seconds': None}
    else:
        arm.reserve('method-prediction-'+prepared['reference'], arm.p['validation_seconds'])
        write(reservation, identity)
        result = check_task(workspace, task, solution, dest, arm.p['validation_seconds'],
            live=arm.p.get('transport') == 'live', stop=arm.stopped,
            frozen_files=cm['files'], required=terms, contract=contract)
    return {'checked': result.get('checked') is True,
            'status': result.get('status', 'invalid_prediction_context'),
            'checked_predictions': len(checks) if result.get('checked') is True else 0,
            'receipt_hash': digest(result), 'elapsed_seconds': result.get('elapsed_seconds')}


def compare_method(arm, prepared, *, development_role_seconds=None):
    """Fresh repeated adapters compare exact source environments, no routing alias.

    Invalid or interrupted comparisons remain inconclusive, not negative data.
    Old adapters may rediscover the new method within the same allowance.
    """
    cfg = validate_config(arm.p.get('method_learning'))
    if not cfg['enabled']:
        raise Invalid('method learning is not enabled')
    directory = _root(arm)/prepared['reference']
    stored = read(directory/'prepared.json')
    if stored != prepared:
        raise Invalid('prepared method descriptor changed')
    path = directory/'result.json'
    before, candidate = Path(prepared['before_path']), Path(prepared['candidate_path'])
    if (verify_snapshot(before)['binding'] != prepared['before'] or
            verify_snapshot(candidate)['binding'] != prepared['candidate']):
        raise Invalid('method comparison source changed')
    if (development_role_seconds is not None and
            (type(development_role_seconds) not in (int, float) or
             not math.isfinite(development_role_seconds) or development_role_seconds < 0)):
        raise Invalid('invalid method development cost')
    commitment = {'reference': prepared['reference'], 'before': prepared['before'],
                  'candidate': prepared['candidate'], 'config': cfg,
                  'development_role_seconds': development_role_seconds}
    commitment_path = directory/'comparison-commitment.json'
    if commitment_path.exists():
        if read(commitment_path) != commitment:
            raise Invalid('method comparison configuration or development cost changed')
    else:
        write(commitment_path, commitment)
    gate = prediction_gate(arm, prepared)
    prediction_counts = {
        'checked': gate['checked_predictions'],
        'pending': len(prepared['prediction_checks'])-gate['checked_predictions']}
    expected = {'method_id': prepared['method_id'], 'reference': prepared['reference'],
                'before': prepared['before'], 'candidate': prepared['candidate'],
                'expected_trials': cfg['repetitions'], 'prediction_counts': prediction_counts,
                'prediction_validation_seconds': gate.get('elapsed_seconds'),
                'development_role_seconds': development_role_seconds}
    if path.exists():
        cached = read(path)
        if (any(cached.get(k) != v for k, v in expected.items()) or
                not isinstance(cached.get('trials'), list) or len(cached['trials']) > cfg['repetitions'] or
                cached.get('status') not in ('completed', 'unavailable', 'insufficient_budget', 'invalid_candidate_context') or
                any(t.get('binding', {}).get('before') != prepared['before'] or
                    t.get('binding', {}).get('after') != prepared['candidate'] for t in cached['trials'])):
            raise Invalid('cached method comparison binding changed')
        return cached
    raw = {**expected, 'trials': [], 'status': 'unavailable'}
    if not gate['checked']:
        raw['status'] = 'invalid_candidate_context'
        write(path, raw)
        return raw
    reservation = _reserve_suite(arm, prepared, cfg)
    if not reservation['available']:
        write(path, raw)
        return raw
    suite = reservation['suite']
    from .study_transfer import evaluate_pair
    for index in range(cfg['repetitions']):
        key = 'method-'+prepared['reference'][:20]+'-'+str(index)
        if arm.available_calls() < 2 and not (arm.root/'evaluations'/key/'result.json').exists():
            raw['status'] = 'insufficient_budget'
            break
        try:
            trial = evaluate_pair(arm, before, candidate, key, suite=suite,
                side_order=('before', 'after') if index % 2 == 0 else ('after', 'before'),
                required_exports=tuple(prepared['required_exports']), route_snapshots=False)
        except (Invalid, OSError, ValueError):
            # Original evidence stays at the comparison origin. No invented gain.
            raw['status'] = 'unavailable'
            break
        raw['trials'].append(trial)
        write(directory/'progress.json', raw)
    else:
        raw['status'] = 'completed'
    _remember_applications(arm, suite, raw['trials'], prepared['reference'])
    write(path, raw)
    return raw


def ingest_candidate(arm, before, after, proposal, *, development_role_seconds=None,
                     registry=None, concept_reference=None, prediction_ids=None, prediction_statements=None):
    prepared = prepare_method(arm, before, after, proposal, registry,
        concept_reference=concept_reference, prediction_ids=prediction_ids,
        prediction_statements=prediction_statements)
    return compare_method(arm, prepared, development_role_seconds=development_role_seconds)
