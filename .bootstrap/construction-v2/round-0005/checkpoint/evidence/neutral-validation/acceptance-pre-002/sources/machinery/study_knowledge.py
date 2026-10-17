"""Checked knowledge and typed component consumers in the active study loop.

Proposals never supply `checked=True`. All acceptance comes from fresh, bounded
Lean rebuild/replay/closure inspection. Residual obligations remain explicit;
even a checked residual→root theorem does not assert satisfiable residuals or
a reduction in difficulty. English/source completion remains a separate gate.
"""
import copy
import re
from .study_common import Invalid, digest, read, write, sha, inside
from .study_transfer import check_task, wrapper, bind_task

SCHEMAS = {
 'mathematical_claims': {'id': 'new identity', 'module': 'MathGKM module',
     'statement': 'exact closed Lean proposition (quantify premises)', 'term': 'proof term',
     'discharges': ['optional explicit residual ids; checked against their original target constants']},
 'attachments': {'id': 'new identity', 'module': 'MathGKM module importing ResearchSemantics',
     'base': 'Lean type', 'extended': 'Lean type', 'forget': 'E → B term',
     'extend': 'B → E term', 'section_law': '∀ b, forget (extend b) = b proof',
     'predicate': 'B → Prop term', 'base_proof': '∀ b, predicate b proof',
     'dependencies': ['checked knowledge/component ids'], 'required_constants': ['used Lean declarations']},
 'representations': {'id': 'new identity', 'module': 'MathGKM module importing ResearchSemantics',
     'base': 'Lean type', 'extended': 'Lean type', 'predicate': 'B → Prop',
     'target_predicate': 'E → Prop', 'forward': 'B → E',
     'law': '∀ b, target_predicate (forward b) ↔ predicate b proof',
     'dependencies': ['checked ids'], 'required_constants': ['used Lean declarations']},
 'reductions': {'id': 'new identity', 'module': 'MathGKM module',
     'residuals': [{'id': 'new residual id', 'statement': 'closed Lean proposition'}],
     'term': 'conjunction of residual propositions → exact pinned root proof',
     'dependencies': ['checked ids'], 'required_constants': ['used Lean declarations']},
 'fiber_gluings': {'id': 'new identity', 'module': 'MathGKM.ResearchSemantics or importing module',
     'base': 'index type I', 'extended': 'index type J', 'map': 'I → J',
     'family': 'I → Type', 'target_family': 'J → Type',
     'family_map': '∀ i, family i → target_family (map i)',
     'dependencies': ['checked ids'], 'required_constants': ['used declarations']}}


def task_for(kind, item, contract):
    base = {'id': item['id'], 'hypotheses': [], 'scope': 'exact proposal; usefulness and novelty unassessed',
            'source_sha256': contract['root_sha256'], 'kind': 'holdout',
            'context_modules': [item['module']] + (['MathGKM.ResearchSemantics'] if kind in ('attachments', 'representations', 'fiber_gluings') else []),
            'required_constants': item.get('required_constants', [])}
    solution = {'module': item['module']}
    if kind == 'mathematical_claims':
        base.update(statement=item['statement'], interface_type='True', transport_type='True')
        solution.update(term=item['term'], interface_term='True.intro', transport_term='True.intro')
    elif kind == 'attachments':
        B, E, P = item['base'], item['extended'], item['predicate']
        base.update(interface_type=f'MathGKM.ResearchSemantics.ConservativeExtension ({B}) ({E})',
            transport_type=f'∀ b : ({B}), StudyInterface.forget (StudyInterface.extend b) = b',
            statement=f'∀ e : ({E}), ({P}) (StudyInterface.forget e)')
        solution.update(interface_term='{ forget := '+item['forget']+', extend := '+item['extend']+
            ', forget_extend := '+item['section_law']+' }',
            transport_term='StudyInterface.forget_extend',
            term=f'MathGKM.ResearchSemantics.ConservativeExtension.preserves StudyInterface ({P}) ({item["base_proof"]})')
    elif kind == 'representations':
        B, E, P, Q = item['base'], item['extended'], item['predicate'], item['target_predicate']
        base.update(interface_type=f'MathGKM.ResearchSemantics.Representation ({B}) ({E}) ({P}) ({Q})',
            transport_type=f'∀ b : ({B}), ({Q}) (StudyInterface.forward b) ↔ ({P}) b',
            statement=f'(∀ e : ({E}), ({Q}) e) → ∀ b : ({B}), ({P}) b')
        solution.update(interface_term='{ forward := '+item['forward']+', law := '+item['law']+' }',
            transport_term='StudyInterface.law',
            term='MathGKM.ResearchSemantics.Representation.consume StudyInterface')
    elif kind == 'reductions':
        residuals = item['residuals']
        if not residuals or len({r['id'] for r in residuals}) != len(residuals):
            raise Invalid('explicit distinct residual obligations required')
        conjunction = ' ∧ '.join('('+r['statement']+')' for r in residuals)
        base.update(statement=f'({conjunction}) → {contract["root_declaration"]}',
                    residuals=residuals, reduction_root=contract['root_declaration'],
                    interface_type='True', transport_type='True')
        solution.update(term=item['term'], interface_term='True.intro', transport_term='True.intro')
    elif kind == 'fiber_gluings':
        I, J, f, F, G, h = (item[k] for k in ('base', 'extended', 'map', 'family', 'target_family', 'family_map'))
        push = f'MathGKM.ResearchSemantics.Push ({f}) ({F})'
        unit = f'MathGKM.ResearchSemantics.pushUnit ({f}) ({F})'
        typ = f'∀ j : ({J}), {push} j → ({G}) j'
        beta = f'∀ (i : ({I})) (x : ({F}) i), StudyInterface (({f}) i) ({unit} i x) = ({h}) i x'
        base.update(interface_type=typ, transport_type=beta,
            statement=f'∀ k : ({typ}), (∀ (i : ({I})) (x : ({F}) i), k (({f}) i) ({unit} i x) = ({h}) i x) → k = StudyInterface')
        parameters = f'(f := ({f})) (F := ({F})) (G := ({G}))'
        solution.update(interface_term=f'MathGKM.ResearchSemantics.pushLift {parameters} ({h})',
            transport_term=f'MathGKM.ResearchSemantics.push_beta {parameters} ({h})',
            term=f'MathGKM.ResearchSemantics.push_unique {parameters} ({h})')
    else:
        raise Invalid('unsupported knowledge proposal')
    return base, solution


def ingest(arm, state, report, workspace, directory):
    """Called on main AND experimental continuation reports before next request."""
    contract = read(workspace/'contract.json')
    if sum(len(report.get(k, [])) for k in SCHEMAS) > arm.p.get('knowledge_checks_per_round', 6):
        raise Invalid('declared per-round validation envelope exceeded; no checks executed')
    for kind in SCHEMAS:
        for item in report.get(kind, []):
            identifier = item.get('id', '')
            if not re.fullmatch(r'[A-Za-z0-9_-]+', identifier):
                raise Invalid('invalid knowledge identity')
            if identifier in state['knowledge'] or identifier in state['components']:
                old = state['knowledge'].get(identifier, state['components'].get(identifier))
                if old['proposal_hash'] != digest(item):
                    raise Invalid('knowledge identities are immutable; use a new version')
                continue
            dependencies = item.get('dependencies', [])
            if any(dep not in state['knowledge'] and dep not in state['components'] for dep in dependencies):
                raise Invalid('omitted, unknown, circular or unaccepted attachment dependency')
            task, solution = task_for(kind, item, contract)
            modules = [item['module']]
            if kind in ('attachments', 'representations', 'fiber_gluings'):
                from .study_common import ROOT
                foundation = 'MathGKM/ResearchSemantics.lean'
                if sha(workspace/foundation) != sha(ROOT/foundation):
                    raise Invalid('canonical generic foundation changed')
                modules.append('MathGKM.ResearchSemantics')
            if kind == 'reductions':
                task['residuals'] = item['residuals']
            if kind == 'representations':
                task['residuals'] = [{'statement': f'∀ e : ({item["extended"]}), ({item["target_predicate"]}) e'}]
            if kind == 'mathematical_claims' and item.get('discharges'):
                residuals = [state['remaining_obligations'][rid] for rid in item['discharges']]
                modules += [r['target_module'] for r in residuals]
                propositions = [item['statement']] + [r['target_constant'] for r in residuals]
                task['statement'] = ' ∧ '.join('('+v+')' for v in propositions)
                terms = ['(show '+item['statement']+' from '+item['term']+')'] * len(propositions)
                solution['term'] = '⟨'+', '.join(terms)+'⟩'
            task = bind_task(workspace, task, modules)
            key = digest({'kind': kind, 'item': item, 'task': task})
            dest = directory/key
            if (dest/'result.json').exists():
                checked = read(dest/'result.json')
                if checked.get('task_hash') != digest(task):
                    raise Invalid('checked artifact task binding changed')
            elif dest.exists():
                checked = {'checked': False, 'status': 'interrupted_validation_not_replayed',
                           'task_hash': digest(task)}
                write(dest/'result.json', checked)
            else:
                # Reservation is durable BEFORE check_task creates its directory.
                reservation = directory/(key+'.reservation.json')
                if reservation.exists():
                    checked = {'checked': False, 'status': 'interrupted_before_validator_not_replayed',
                               'task_hash': digest(task)}
                    write(dest/'result.json', checked)
                else:
                    write(reservation, {'seconds': arm.p['validation_seconds'], 'task_hash': digest(task)})
                    arm.reserve('knowledge-'+digest(str(dest.resolve())), arm.p['validation_seconds'])
                    checked = check_task(workspace, task, solution, dest, arm.p['validation_seconds'],
                        live=arm.p['transport'] == 'live', stop=arm.stopped,
                        required=item.get('required_constants', []), contract=contract)
            state['observations'].append({'knowledge_attempt': identifier, 'kind': kind,
                'checked': checked['checked'], 'status': checked['status'], 'receipt_hash': digest(checked)})
            if not checked['checked']:
                continue
            if any(sha(inside(workspace, p)) != h for p, h in checked['imported_sources'].items()):
                raise Invalid('checked knowledge source changed before admission/recovery')
            closure = {c['name'] for c in checked['declarations'][0]['constants']}
            for dep in dependencies:
                prior = state['knowledge'].get(dep, state['components'].get(dep))
                if not closure.intersection(prior['exports']):
                    raise Invalid('declared component dependency absent from actual consumer closure')
                if any(sha(inside(workspace, p)) != h for p, h in prior['source_files'].items()):
                    raise Invalid('accepted component version changed')
            # Materialize a reusable module from the exact checked composition.
            # The next consumer freshly rebuilds it, including the renamed defs.
            prefix = 'Accepted'+key[:24]
            module_path = 'MathGKM/'+prefix+'.lean'
            target_file = workspace/(task['target_module'].replace('.', '/')+'.lean')
            target_file.parent.mkdir(parents=True, exist_ok=True)
            target_file.write_text(checked['target_source'])
            exported = wrapper(task, solution)
            exports = []
            for old, new in [('StudyObligation', 'obligation'), ('StudyInterface', 'interface'), ('StudyTransport', 'transport')]:
                qualified = prefix+'.'+new
                exported = exported.replace(old, qualified)
                exports.append(qualified)
            target_path = inside(workspace, module_path)
            if target_path.exists() and target_path.read_text() != exported:
                raise Invalid('generated component binding conflict')
            target_path.write_text(exported)
            record = {'id': identifier, 'kind': kind, 'proposal_hash': digest(item),
                'proposal': copy.deepcopy(item), 'task': task, 'receipt_hash': digest(checked),
                'dependencies': dependencies, 'claim': checked['claim'],
                'used_declarations': checked['frozen_used_declarations'],
                'source_files': {**checked['imported_sources'], str(target_file.relative_to(workspace)): sha(target_file), module_path: sha(target_path)},
                'exports': exports, 'export_module': module_path[:-5].replace('/', '.'),
                'export_status': 'exact checked composition renamed; fresh rebuild mandatory for every consumer',
                'truth': 'checked exact proposition under allowed premise closure',
                'relevance': 'checked residual implication' if kind == 'reductions' else 'not asserted',
                'novelty': 'not assessed', 'usefulness': 'not established by checking'}
            target = state['components'] if kind in ('attachments', 'representations', 'fiber_gluings') else state['knowledge']
            target[identifier] = record
            if kind == 'representations':
                state['remaining_obligations'][identifier] = {'statement':
                    f'∀ e : ({item["extended"]}), ({item["target_predicate"]}) e',
                    'target_module': task['target_module'], 'target_constant': task['target_module']+'.Residual0',
                    'context_binding': digest(task['context_sources']),
                    'status': 'open', 'source': identifier, 'connection': 'representation antecedent'}
            if kind == 'reductions':
                for n, residual in enumerate(item['residuals']):
                    old = state['remaining_obligations'].get(residual['id'])
                    value = {**residual, 'status': 'open', 'source': identifier,
                             'target_module': task['target_module'], 'target_constant': task['target_module']+'.Residual'+str(n),
                             'context_binding': digest(task['context_sources']),
                             'connection': 'checked implication to unchanged root; satisfiability/difficulty unknown'}
                    if old and (old['statement'], old.get('context_binding')) != (value['statement'], value['context_binding']):
                        raise Invalid('residual identity changed')
                    state['remaining_obligations'][residual['id']] = old or value
            # Close only exactly matching explicit propositions, never a metric.
            if kind == 'mathematical_claims':
                for rid in item.get('discharges', []):
                    state['remaining_obligations'][rid].update(status='checked', discharge=identifier)
            state['use_links'].append({'artifact': identifier, 'consumer': checked['claim'],
                'status': 'checked generated composition' if kind in ('attachments', 'representations') else 'checked declaration closure',
                'receipt_hash': digest(checked)})
    return state
