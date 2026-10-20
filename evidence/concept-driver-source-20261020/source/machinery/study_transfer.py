"""Frozen structural obligations, equal-budget adaptations, fresh Lean replay.

No theorem counts, evaluator praise or new vocabulary establish transfer. The
required component constants must occur in the checked consumer's dependency
closure; this establishes use, not causal indispensability. Optional ablation
comparisons use the same evaluate_pair API and debit the same owning arm.
"""
import os
import secrets
from pathlib import Path
import re
import shutil
import time
from textwrap import indent

from .study_common import (ROOT, Invalid, read, write, digest, sha, verify_snapshot,
                           copy_seed, inventory)
from .trust import LEAN, CHECKER, CORE, environment
from .process import run
from .completion import NAME, ALLOWED, without_comments
from . import proof_audit
from .adapter_protocol import intake, AdapterProtocolError

def dependency_paths(workspace):
    return [CORE] + [p/'.lake/build/lib/lean' for p in sorted((workspace/'.lake/packages').iterdir())]


def validation_dependencies(workspace, texts):
    """Core-only import closures need no package search directories.

    leanchecker scans every search directory on each invocation. Avoid scanning
    unrelated Mathlib objects for a core-only neutral check. Every project module
    is still rebuilt and independently replayed; non-core imports keep all pins.
    """
    for text in texts:
        for line in without_comments(text).splitlines():
            if line.lstrip().startswith('import '):
                for module in line.strip()[7:].split():
                    if not module.startswith('MathGKM.') and module not in ('StudyCheck',) and not (CORE/(module.replace('.', '/')+'.olean')).is_file():
                        return dependency_paths(workspace)
    return [CORE]

def collect(workspace, module):
    sources, order, visiting = {}, [], set()
    def visit(name):
        if name in sources:
            return
        if name in visiting or not NAME.fullmatch(name):
            raise Invalid('cyclic/invalid project import')
        visiting.add(name)
        p = workspace/(name.replace('.', '/')+'.lean')
        if not name.startswith('MathGKM.') or not p.is_file() or p.is_symlink() or not p.resolve().is_relative_to(workspace.resolve()):
            raise Invalid('project import outside frozen MathGKM source')
        text = p.read_text()
        screened = without_comments(text)
        if re.search(r'\b(sorry|admit|axiom|native_decide)\b', screened):
            raise Invalid('forbidden proof construct')
        for line in screened.splitlines():
            if line.lstrip().startswith('import '):
                for dep in line.strip()[7:].split():
                    if not NAME.fullmatch(dep):
                        raise Invalid('unsupported import')
                    if dep.startswith('MathGKM.'):
                        visit(dep)
                    elif not any((d/(dep.replace('.', '/')+'.olean')).is_file() for d in dependency_paths(workspace)):
                        raise Invalid('unpinned dependency')
        visiting.remove(name)
        sources[name] = text
        order.append(name)
    visit(module)
    return sources, order

def sandbox_prefix(directory, dependencies):
    """macOS live validator containment; fail closed if unavailable.

    Lean elaboration is executable code. It receives only its fresh source/build,
    pinned dependencies and system runtime, never evaluator answers or other arms.
    """
    if not Path('/usr/bin/sandbox-exec').exists():
        raise Invalid('live validation requires reviewed OS sandbox adapter')
    import json
    toolchain = LEAN.resolve().parent.parent
    read_roots = [directory, toolchain, Path('/System'), Path('/usr'), Path('/bin'),
                  Path('/sbin'), Path('/Library'), Path('/opt/homebrew')]
    read_roots += [p.resolve() for p in dependencies]
    profile = '(version 1)\n(deny default)\n(allow process* sysctl-read mach-lookup)\n'
    profile += '(allow file-read* ' + ' '.join('(subpath '+json.dumps(str(p))+')' for p in read_roots) + ')\n'
    profile += '(allow file-read* (literal "/dev/null") (literal "/dev/urandom"))\n'
    # macOS dyld needs the root directory itself, not its descendants. Lean also
    # resolves its application path, source cwd and lexical LEAN_PATH symlinks.
    # Metadata literals permit traversal without recursive ancestor content reads.
    profile += '(allow file-read-data (literal "/"))\n'
    metadata = list(reversed(toolchain.parents))
    metadata.extend(reversed(directory.absolute().parents))
    for dependency in dependencies:
        lexical = dependency.absolute()  # Preserve approved LEAN_PATH symlink chains.
        metadata.extend(reversed(lexical.parents))
        metadata.append(lexical)
    profile += '(allow file-read-metadata ' + ' '.join(
        '(literal '+json.dumps(str(p))+')' for p in dict.fromkeys(metadata)) + ')\n'
    profile += '(allow file-write* (subpath '+json.dumps(str(directory))+') (literal "/dev/null"))\n'
    path = directory/'validator.sb'
    path.write_text(profile)
    return ['/usr/bin/sandbox-exec', '-f', str(path)]

def exact_type(task, key):
    hypotheses = task['hypotheses']
    if not all(isinstance(h, str) and h.startswith('(') and h.endswith(')') for h in hypotheses):
        raise Invalid('hypotheses must be explicit Lean binders')
    return ('∀ ' + ' '.join(hypotheses) + ', ' if hypotheses else '') + task[key]

def bind_task(workspace, task, modules=None):
    """Freeze target meaning independently of the later adapter module."""
    task = dict(task)
    contract = read(workspace/'contract.json')
    modules = modules or task.get('context_modules') or [contract['root_file'][:-5].replace('/', '.')]
    modules = list(dict.fromkeys(modules + [contract['root_file'][:-5].replace('/', '.')]))
    if 'MathGKM.ResearchSemantics' in modules:
        foundation = 'MathGKM/ResearchSemantics.lean'
        if sha(workspace/foundation) != sha(ROOT/foundation):
            raise Invalid('canonical generic foundation changed')
    context = {}
    for module in modules:
        sources, _ = collect(workspace, module)
        context.update({m.replace('.', '/')+'.lean': digest(t) for m,t in sources.items()})
    task.update(context_modules=modules, context_sources=context)
    task['target_module'] = 'MathGKM.Target'+digest(task)[:24]
    return task


def lean_expr(term):
    """A delimited term with its original relative layout, including by blocks."""
    return '(\n'+indent(term.strip(),'  ')+'\n)'


def lean_structure(fields):
    return '{\n'+'\n'.join('  '+name+' := '+indent(lean_expr(value),'  ').lstrip()
        for name,value in fields)+'\n}'


def target_source(task):
    target = task['target_module']
    statement = exact_type(task, 'statement')
    if task.get('reduction_root'):
        statement = '('+' ∧ '.join(r.get('existing_constant',target+'.Residual'+str(n))
            for n,r in enumerate(task['residuals']))+') → '+task['reduction_root']
    def definition(name,typ,value):
        return f'def {name}{typ} :=\n'+indent(lean_expr(value),'  ')+'\n'
    return ('\n'.join('import '+m for m in task['context_modules'])+'\n'+
        ''.join(definition(f'{target}.Residual{n}',' : Prop',r['statement'])
            for n,r in enumerate(task.get('residuals', [])) if not r.get('existing_constant'))+
        definition(target+'.Interface','',exact_type(task,'interface_type'))+
        definition(target+'.Transport',f' (StudyInterface : {target}.Interface) : Prop',exact_type(task,'transport_type'))+
        definition(target+'.Goal',f' (StudyInterface : {target}.Interface) : Prop',statement))


def wrapper(task, solution, frozen_modules=None, transfer_modules=None):
    target = task['target_module']
    header=f"import {target}\nimport {solution['module']}\nimport Lean\n"
    return header+'\n'.join(
        f'{kind} {name} : {typ} :=\n'+indent(lean_expr(solution[key]),'  ')
        for kind,name,typ,key in [
            ('def','StudyInterface',target+'.Interface','interface_term'),
            ('theorem','StudyTransport',target+'.Transport StudyInterface','transport_term'),
            ('theorem','StudyObligation',target+'.Goal StudyInterface','term')])+'\n'


def check_task(workspace, task, solution, directory, seconds, *, live=False, stop=lambda: False,
               frozen_files=None, transfer_modules=None, required=(), contract=None):
    """Whole compilation/replay sequence shares one timeout; failures are bounded."""
    task = task if 'target_module' in task else bind_task(workspace, task)
    directory.mkdir(parents=True, exist_ok=False)
    start = time.monotonic()
    result = {'task_id': task['id'], 'task_hash': digest(task), 'checked': False,
        'source_sha256': task['source_sha256'], 'scope': task['scope'], 'hypotheses': task['hypotheses'],
        'budget_seconds': seconds, 'checks': [], 'status': 'invalid_comparison',
        'validation_mode': 'deployed_sandbox' if live else 'unwrapped_fixture',
        'required_constants': task['required_constants'], 'inspection_schema': proof_audit.SCHEMA,
        'controller_stage': 'context'}
    try:
        contract = contract or read(workspace/'contract.json')
        if sha(workspace/contract['root_file']) != task['source_sha256'] or task['source_sha256'] != contract['root_sha256']:
            raise Invalid('exact source check failed')
        before = inventory(workspace)
        frozen_files = before if frozen_files is None else frozen_files
        if any(before.get(name) != hashed for name, hashed in frozen_files.items()):
            raise Invalid('adaptation altered frozen solver sources')
        for name, hashed in task['context_sources'].items():
            if digest((workspace/name).read_text()) != hashed:
                raise Invalid('frozen target context changed')
        nonsolution = bool(solution and solution.get('status') == 'bounded_non_solution')
        if nonsolution:
            if set(solution) != {'status', 'reason'} or not isinstance(solution['reason'], str) or not solution['reason']:
                raise Invalid('malformed bounded non-solution')
        elif not solution or not NAME.fullmatch(solution.get('module', '')):
            raise Invalid('missing exact solution module')
        frozen_modules = [name[:-5].replace('/', '.') for name in frozen_files
                          if name.startswith('MathGKM/') and name.endswith('.lean')]
        sources, order = {}, []
        for module in task['context_modules'] + ([] if nonsolution else [solution['module']]):
            collected, ordered = collect(workspace, module)
            sources.update(collected)
            order += [m for m in ordered if m not in order]
        target = task['target_module']
        sources[target] = target_source(task)
        # Target is compiled before the adapter, preventing its notation or names
        # from determining the proposition. Imports with conflicting names fail.
        context_order = []
        for module in task['context_modules']:
            _, ordered = collect(workspace, module)
            context_order += [m for m in ordered if m not in context_order]
        order = context_order + [target] + [m for m in order if m not in context_order]
        sources['StudyCheck'] = (f'import {target}\ntheorem StudyInterface : True := True.intro\n'
            'theorem StudyTransport : True := True.intro\ntheorem StudyObligation : True := True.intro\n'
            if nonsolution else wrapper(task, solution))
        declarations = ('StudyObligation', 'StudyInterface', 'StudyTransport')
        inspection_nonce = secrets.token_hex(32)
        sources['StudyInspect'] = proof_audit.inspector('StudyCheck', declarations, required, frozen_modules, artifact='declarations.json', nonce=inspection_nonce)
        # Terms are elaborated as code; reject obvious authority-changing constructs.
        for key in ('term', 'interface_term', 'transport_term'):
            if re.search(r'\b(sorry|admit|axiom|native_decide)\b', without_comments(solution.get(key, ''))):
                raise Invalid('forbidden proof construct in adapter')
        source, build = directory/'source', directory/'build'
        source.mkdir()
        build.mkdir()
        for module, text in sources.items():
            path = source/(module.replace('.', '/')+'.lean')
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
        deps = validation_dependencies(workspace, sources.values())
        env = environment([build]+deps)
        env['TMPDIR'] = str(directory)
        prefix = sandbox_prefix(directory, deps) if live else []
        binaries = {str(p): sha(p) for p in (LEAN, CHECKER)}
        result.update(binary_hashes=binaries, launch_environment=env,
                      pin_hashes={n:sha(ROOT/n) for n in ('lean-toolchain','lakefile.toml','lake-manifest.json')},
                      dependency_paths=list(map(str, deps)),
                      sandbox_profile_sha256=sha(directory/'validator.sb') if live else None)
        for operation in ('compile', 'kernel_replay'):
            result['controller_stage'] = operation
            for module in order + ['StudyCheck']:
                if stop():
                    raise Invalid('validation stopped; no mathematical conclusion')
                remaining = seconds - (time.monotonic()-start)
                if remaining <= 0:
                    raise Invalid('failure within validation budget')
                relative = Path(module.replace('.', '/'))
                output = build/relative.with_suffix('.olean')
                output.parent.mkdir(parents=True, exist_ok=True)
                argv = ([str(LEAN), '-j', '1', '-o', str(output), str(relative.with_suffix('.lean'))]
                        if operation == 'compile' else [str(CHECKER), module])
                record = run(prefix+argv, cwd=source, env=env, timeout=min(1800, remaining), output_bytes=1048576)
                result['checks'].append({'module': module, 'operation': operation, **record})
                if live and (record['returncode'] < 0 or 'sandbox-exec:' in record['stderr']):
                    result.update(status='validator_infrastructure_failure', infrastructure_failure=True)
                write(directory/'result.json', result)
                if record['returncode'] or record['termination']:
                    raise Invalid('failure within compilation/replay budget: '+module)
        objects = {str(p.relative_to(build)): sha(p) for p in build.rglob('*') if p.is_file()}
        if stop() or seconds <= time.monotonic()-start:
            raise Invalid('interrupted or exhausted before premise inspection')
        result['controller_stage'] = 'trusted_premise_inspection'
        inspected = run(prefix+[str(LEAN), '-j', '1', 'StudyInspect.lean'], cwd=source, env=env,
                        timeout=min(1800, seconds-(time.monotonic()-start)), output_bytes=1048576)
        result['checks'].append({'operation': 'trusted_premise_inspection', **inspected})
        if inspected['returncode'] and (source/'StudyInspect.lean').read_text()==sources['StudyInspect']:
            result['trusted_inspector_failure']=proof_audit.failure_artifact(source/'declarations.json',declarations,inspected,nonce=inspection_nonce)
        if live and (inspected['returncode'] < 0 or 'sandbox-exec:' in inspected['stderr']):
            result.update(status='validator_infrastructure_failure', infrastructure_failure=True)
        result['declarations'] = proof_audit.parse_artifact(inspected, declarations, source/'declarations.json', nonce=inspection_nonce)
        result['producer_completion'] = result['declarations'][0]['producer_completion']
        result['declaration_artifact_sha256'] = sha(source/'declarations.json')
        if result['declaration_artifact_sha256'] != result['declarations'][0]['artifact_sha256']:
            raise Invalid('inspector artifact changed after parsing')
        result['controller_stage'] = 'binding'
        if objects != {str(p.relative_to(build)): sha(p) for p in build.rglob('*') if p.is_file()}:
            raise Invalid('checked objects changed during inspection')
        if any((source/(m.replace('.', '/')+'.lean')).read_text() != text for m, text in sources.items()):
            raise Invalid('validator or staged source changed')
        if binaries != {str(p): sha(p) for p in (LEAN, CHECKER)}:
            raise Invalid('validator binaries changed')
        if live and sha(directory/'validator.sb') != result['sandbox_profile_sha256']:
            raise Invalid('validator sandbox profile changed')
        if inventory(workspace) != before:
            raise Invalid('solver changed during check')
        versions = proof_audit.used_versions(result['declarations'], frozen_files)
        result.update(checked=True, valid_attempt=True, status='checked_exact_obligation_and_interfaces',
                      source_binding=digest(before), frozen_used_declarations=versions,
                      component_use_checked=bool(task['required_constants']) and set(task['required_constants']) <= set(versions),
                      target_binding=digest(task), target_module=target, target_source=sources[target],
                      object_hashes=objects, binary_hashes=binaries,
                      imported_sources={m.replace('.', '/')+'.lean': sha(workspace/(m.replace('.', '/')+'.lean')) for m in order if m != target},
                      staged_sources={m: digest(t) for m, t in sources.items()},
                      claim={'statement': task['statement'], 'hypotheses': task['hypotheses']},
                      solution_binding=digest(solution))
        if nonsolution:
            result.update(checked=False, status='bounded_valid_non_solution', valid_attempt=True, reason=solution['reason'])
        result['controller_stage'] = 'complete'
    except (Invalid, OSError, KeyError, TypeError,ValueError) as exc:
        result['failure'] = str(exc)
        from .own_feedback import diagnostic
        result['controller_diagnostic'] = diagnostic(result, exc)
    if 'controller_diagnostic' not in result:
        from .own_feedback import diagnostic
        result['controller_diagnostic'] = diagnostic(result)
    result['elapsed_seconds'] = time.monotonic()-start
    result['finished'] = time.time()
    write(directory/'result.json', result)
    # Delete only this attempt's rebuildable objects, after durable recovery
    # material. Sources, failures, inspector artifacts and receipts stay intact.
    from .retention import retire_build
    retire_build(directory, result)
    from .validation_receipts import finish
    finish(directory,task,solution,required)
    return result

def _catalog_identity(arm, manifest, task, solution):
    """Exact immutable context identity; no evaluator answer material enters it."""
    sealed = read(arm.study/'seal.json')
    if 'dependencies' not in sealed:
        raise Invalid('frozen catalog cache requires sealed dependency identity')
    return {'schema': 'math-gkm.frozen-catalog-identity.v1',
            'snapshot_binding': manifest['binding'],
            'snapshot_files': manifest['files'],
            'admitted_modules': manifest.get('admitted_modules'),
            'source_sha256': task['source_sha256'],
            'task': task, 'solution': solution, 'required': [],
            'validation_mode': arm.p['transport'],
            'inspection_schema': proof_audit.SCHEMA,
            'binaries': {str(p): sha(p) for p in (LEAN, CHECKER)},
            'pins': {n: sha(ROOT/n) for n in ('lean-toolchain','lakefile.toml','lake-manifest.json')},
            'dependency_identity': digest(sealed['dependencies']),
            'implementation': {n: sha(ROOT/'machinery'/n) for n in
                ('proof_audit.py','inspection_stream.py','validation_receipts.py','study_transfer.py')}}


def _catalog_verified(directory, task, solution, identity):
    from .validation_receipts import reuse
    result = reuse(directory, task, solution, ())
    if (result.get('checked') is not True or result.get('inspection_schema') != proof_audit.SCHEMA or
            result.get('target_binding') != digest(task) or result.get('solution_binding') != digest(solution) or
            result.get('binary_hashes') != identity['binaries'] or result.get('pin_hashes') != identity['pins'] or
            not result.get('declarations') or 'catalog' not in result['declarations'][0]):
        raise Invalid('frozen catalog successful exact inspection binding required')
    return result


def _catalog_cached(arm, entry, identity, task, solution):
    if (not isinstance(entry, dict) or set(entry) != {'schema','identity','validator_directory','finished_sha256'} or
            entry['schema'] != 'math-gkm.frozen-catalog-cache.v1' or entry['identity'] != identity):
        raise Invalid('frozen catalog cache identity changed')
    relative = Path(entry['validator_directory'])
    directory = arm.root/relative
    if (relative.is_absolute() or '..' in relative.parts or directory.is_symlink() or
            not directory.resolve().is_relative_to(arm.root.resolve()) or
            sha(directory/'FINISHED.json') != entry['finished_sha256']):
        raise Invalid('frozen catalog cache finished receipt changed')
    return _catalog_verified(directory, task, solution, identity), directory


def _catalog_account(result, *, reused, start, origin):
    # Preserve the original receipt's elapsed compile/replay/inspection costs;
    # current comparison accounting uses only this invocation's actual work.
    out = dict(result)
    out['catalog_accounting'] = {'reused_finished_receipt': reused,
        'current_elapsed_seconds': time.monotonic()-start,
        'original_validation_seconds': result.get('elapsed_seconds'),
        'validator_directory': str(origin),
        'scope': 'exact frozen declaration catalog; full reservation remains charged'}
    return out


def catalog_snapshot(arm, source, manifest, directory, key):
    """Inspect every frozen declaration, reusing only exact FINISHED receipts.

    A cached success never substitutes for a different context. Cache verification
    still hashes all retained receipt artifacts and checks binaries/pins through
    the official validator-reuse path. Failed, stale or partial entries are
    inconclusive; caps and declaration inspection remain unchanged.
    """
    started = time.monotonic()
    actual = verify_snapshot(source)
    if actual != manifest:
        raise Invalid('frozen catalog snapshot manifest changed')
    arm.reserve('catalog-'+key, arm.p['validation_seconds'])
    marker = directory.parent/(directory.name+'.reserved.json')
    cached_attempt = directory/'CACHE_REUSE.json'
    existing = (directory/'result.json').exists() or cached_attempt.exists()
    if not existing and (marker.exists() or directory.exists()):
        return {'checked': False, 'status': 'interrupted_catalog_not_replayed',
                'elapsed_seconds': time.monotonic()-started}
    if not existing:
        write(marker, {'snapshot': manifest['binding'], 'seconds': arm.p['validation_seconds']})
    ws = directory.parent/(directory.name+'-workspace')
    if not ws.exists():
        copy_seed(arm.study/'seed', ws)
        for name in manifest['files']:
            p = ws/name
            p.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source/'source'/name, p)
    admitted = manifest.get('admitted_modules', [p for p in read(arm.study/'seed/seed-files.json') if p.endswith('.lean')])
    modules = [p[:-5].replace('/', '.') for p in admitted]
    catalog_source = '\n'.join('import '+m for m in modules)+'\n'
    catalog_file = ws/'MathGKM/FrozenCatalog.lean'
    if catalog_file.exists() and catalog_file.read_text() != catalog_source:
        return {'checked': False, 'status': 'frozen_catalog_source_changed',
                'elapsed_seconds': time.monotonic()-started}
    catalog_file.write_text(catalog_source)
    contract = read(ws/'contract.json')
    task = {'id': 'catalog', 'statement': 'True', 'interface_type': 'True', 'transport_type': 'True',
            'hypotheses': [], 'scope': 'frozen declaration versions; not a research theorem',
            'required_constants': [], 'source_sha256': contract['root_sha256']}
    task = bind_task(ws, task, ['MathGKM.FrozenCatalog'])
    solution = {'module': 'MathGKM.FrozenCatalog', 'term': 'True.intro',
                'interface_term': 'True.intro', 'transport_term': 'True.intro'}
    identity = _catalog_identity(arm, manifest, task, solution)
    cache = arm.root/'frozen-catalog-cache'/digest(identity)/'index.json'
    try:
        if cached_attempt.exists():
            checked, origin = _catalog_cached(arm, read(cached_attempt), identity, task, solution)
            return _catalog_account(checked, reused=True, start=started, origin=origin)
        if (directory/'result.json').exists():
            checked = _catalog_verified(directory, task, solution, identity)
            return _catalog_account(checked, reused=True, start=started, origin=directory)
        if cache.exists():
            entry = read(cache)
            checked, origin = _catalog_cached(arm, entry, identity, task, solution)
            write(cached_attempt, entry)
            return _catalog_account(checked, reused=True, start=started, origin=origin)
    except (Invalid, OSError, KeyError, TypeError, ValueError):
        return {'checked': False, 'status': 'invalid_finished_catalog_cache; inconclusive',
                'elapsed_seconds': time.monotonic()-started}
    result = check_task(ws, task, solution, directory, arm.p['validation_seconds'],
        live=arm.p['transport'] == 'live', stop=arm.stopped, frozen_files=manifest['files'])
    if result.get('checked'):
        try:
            _catalog_verified(directory, task, solution, identity)
            entry = {'schema': 'math-gkm.frozen-catalog-cache.v1', 'identity': identity,
                     'validator_directory': str(directory.relative_to(arm.root)),
                     'finished_sha256': sha(directory/'FINISHED.json')}
            write(cache, entry)
        except (Invalid, OSError, KeyError, TypeError, ValueError):
            return {'checked': False, 'status': 'unbound_frozen_catalog_result; inconclusive',
                    'elapsed_seconds': time.monotonic()-started}
    return _catalog_account(result, reused=False, start=started, origin=directory)


def _measured_number(value):
    import math
    return value if type(value) in (int,float) and math.isfinite(value) and value >= 0 else None


def _measured_costs(sides, contexts):
    """Controller elapsed times only; reservation caps are separate evidence."""
    measured = {}
    for side in ('before','after'):
        records = sides.get(side)
        context = contexts.get(side)
        checks = records.get('checks', []) if records else []
        elapsed = [_measured_number(c.get('elapsed_seconds')) for c in checks]
        measured[side] = {
            'adapter_seconds': _measured_number(records.get('adapter_receipt', {}).get('elapsed_seconds')) if records else None,
            'validation_seconds': sum(elapsed) if records and all(v is not None for v in elapsed) else None,
            'context_validation_seconds': _measured_number(context.get('catalog_accounting', {}).get(
                'current_elapsed_seconds', context.get('elapsed_seconds'))) if context else None}
    return measured


def evaluate_pair(arm, before, after, key, *, policy_comparison=False):
    suite = read(arm.study/'evaluation/suite.json')
    result = arm.root/'evaluations'/key/'result.json'
    if suite['tasks'] and not result.exists():
        cap = 2*arm.p['adaptation_seconds'] + 2*(len(suite['tasks'])+1)*arm.p['validation_seconds']
        arm.fund('paired-evaluation-'+key, cap)
        with arm.budget('paired-evaluation-'+key):
            return _evaluate_pair(arm, before, after, key, policy_comparison=policy_comparison)
    return _evaluate_pair(arm, before, after, key, policy_comparison=policy_comparison)


def adapter_checks(arm, receipt, tasks, bound_tasks, directory, side, ws, key, binding, manifest, bm, am):
    """Submission intake only; existing validation and reservation stay authoritative."""
    intake_error = None
    try:
        payload, intake_provenance = intake(receipt, tasks)
        solutions = payload['solutions']
    except AdapterProtocolError as exc:
        intake_error = exc.code
        intake_provenance = None
    checks = []
    for task in bound_tasks:
        target = directory/side/task['id']
        if intake_error:
            checked = {'checked': False, 'status': 'adapter_protocol_error',
                       'protocol_error': intake_error, 'elapsed_seconds': 0}
        elif (target/'result.json').exists():
            checked = read(target/'result.json',max_bytes=64*1024**2)
        else:
            # Journal reservation before compiler effects. Recovery charges the
            # full reservation if interrupted, never silently repeats a check.
            journal = directory/'reservations'/f'{side}-{task["id"]}.json'
            if target.exists() or journal.exists():
                checked = {'checked': False, 'task_id': task['id'], 'status': 'interrupted_validation_not_replayed',
                           'elapsed_seconds': 0, 'component_use_checked': False}
                write(target/'result.json', checked)
            else:
                arm.reserve('evaluation-'+key+'-'+side+'-'+task['id'], arm.p['validation_seconds'])
                write(journal, {'binding': binding, 'task_hash': digest(task), 'side': side})
                checked = check_task(ws, task, solutions[task['id']], target, arm.p['validation_seconds'],
                    live=arm.p['transport'] == 'live', stop=arm.stopped, frozen_files=manifest['files'],
                    transfer_modules=[name[:-5].replace('/', '.') for name, hashed in am['files'].items()
                        if name.endswith('.lean') and name.startswith('MathGKM/') and bm['files'].get(name) != hashed])
                # Reserved budget stays charged; measured costs remain separate.
        checks.append(checked)
    return checks, intake_provenance, intake_error


def _evaluate_pair(arm, before, after, key, *, policy_comparison=False):
    directory = arm.root/'evaluations'/key
    suite = read(arm.study/'evaluation/suite.json')
    bm, am = verify_snapshot(before), verify_snapshot(after)
    binding = {'before': bm['binding'], 'after': am['binding'], 'suite': digest(suite),
               'inspection_schema': proof_audit.SCHEMA,
               'policy_comparison': policy_comparison,
               'adaptation_seconds_each': arm.p['adaptation_seconds'],
               'validation_seconds_each_task': arm.p['validation_seconds']}
    if (directory/'result.json').exists():
        previous = read(directory/'result.json',max_bytes=64*1024**2)
        if previous['binding'] != binding:
            raise Invalid('comparison result binding changed')
        return previous
    if not suite['tasks']:
        result = {'binding': binding, 'eligible': False, 'status': 'no_independent_holdout; transfer_not_demonstrated',
                  'correctness': 'not_evaluated', 'scope': 'exact_root_unchanged', 'costs': {}, 'transfer': 'not_demonstrated',
                  'measured_costs': _measured_costs({}, {})}
        write(directory/'result.json', result)
        return result
    # Reserve symmetric entire comparison before any adaptation call.
    reserve = 2*arm.p['adaptation_seconds'] + 2*(len(suite['tasks'])+1)*arm.p['validation_seconds']
    if not (directory/'commitment.json').exists():
        if reserve > arm.available() or arm.available_calls() < 2:
            raise Invalid('insufficient equal adaptation/validation reservation for pair')
        write(directory/'commitment.json', {'binding': binding, 'reservation': reserve,
            'outcomes': ['checked solution', 'explicit bounded non-solution', 'invalid comparison'],
            'consequences': 'only valid matched task gain with regression retention may support experimental selection'})
    elif read(directory/'commitment.json')['binding'] != binding:
        raise Invalid('comparison commitment changed')
    target_ws = directory/'target-context'
    if not target_ws.exists():
        copy_seed(arm.study/'seed', target_ws)
        for name in bm['files']:
            p = target_ws/name
            p.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(before/'source'/name, p)
    bound_tasks = [bind_task(target_ws, t) for t in suite['tasks']]
    write(directory/'bound-tasks.json', bound_tasks)
    catalogs = {}
    context_checks = {}
    for side, source, manifest in [('before', before, bm), ('after', after, am)]:
        checked = catalog_snapshot(arm, source, manifest, directory/('catalog-'+side), key+'-'+side)
        context_checks[side] = {k: checked[k] for k in ('elapsed_seconds','catalog_accounting') if k in checked}
        if not checked['checked']:
            result = {'binding': binding, 'eligible': False, 'status': 'invalid_frozen_context',
                      'catalog_failure': checked, 'transfer': [], 'regressions': [],
                      'measured_costs': _measured_costs({}, context_checks)}
            write(directory/'result.json', result)
            return result
        if checked.get('inspection_schema') != proof_audit.SCHEMA:
            raise Invalid('catalog identity schema changed; charged fresh comparison required')
        catalogs[side] = {c['name']: (c['identity_schema'], c['semantic_sha256']) for c in checked['declarations'][0]['catalog']}
    retained = all(catalogs['after'].get(n) == h for n, h in catalogs['before'].items())
    sides = {}
    for side, source, manifest in [('before', before, bm), ('after', after, am)]:
        ws = arm.root/'roles'/f'eval-{key}-{side}'
        if not ws.exists():
            copy_seed(arm.study/'seed', ws)
            for name in manifest['files']:
                p = ws/name
                p.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(source/'source'/name, p)
        tasks = copy_tasks(suite['tasks'], arm.p['transport'])
        req = {'role': 'adapter', 'tasks': tasks, 'policy': manifest['policy'],
               'solver_binding': manifest['binding'], 'purpose': 'withheld structural obligation; no training feedback'}
        receipt = arm.call(f'eval-{key}-{side}', 'adapter', req, ws, False, arm.p['adaptation_seconds'])
        checks, intake_provenance, intake_error = adapter_checks(
            arm, receipt, tasks, bound_tasks, directory, side, ws, key, binding, manifest, bm, am)
        sides[side] = {'adapter_receipt': receipt, 'checks': checks,
                       'adapter_intake': intake_provenance, 'adapter_protocol_error': intake_error}
    old, new = sides['before']['checks'], sides['after']['checks']
    valid = all(c.get('valid_attempt', False) for c in old+new) and all(
        side['adapter_receipt']['outcome'] == 'completed' for side in sides.values())
    regressions = [t['id'] for t, a, b in zip(suite['tasks'], old, new) if (t['kind'] == 'regression' or a['checked']) and not b['checked']]
    gains = [t['id'] for t, a, b in zip(suite['tasks'], old, new)
             if t['kind'] == 'holdout' and b['checked'] and a.get('status') == 'bounded_valid_non_solution']
    transfer = []
    for task, a, b in zip(suite['tasks'], old, new):
        actual_new = {n: v for n, v in b.get('frozen_used_declarations', {}).items()
            if catalogs['after'].get(n) == (v['identity_schema'], v['semantic_sha256']) and catalogs['before'].get(n) != (v['identity_schema'], v['semantic_sha256'])}
        # Origin in a changed module is insufficient; exact declaration type/body
        # must differ, be present before adaptation, and occur in the proof closure.
        b['changed_component_use_checked'] = bool(actual_new)
        b['changed_declarations_used'] = actual_new
        if task['id'] in gains and actual_new and (not task['required_constants'] or b.get('component_use_checked')):
            transfer.append(task['id'])
    result = {'binding': binding, 'sides': sides, 'correctness': 'per_obligation_kernel_results',
        'scope': 'frozen exact hypotheses, source and interfaces only; not root completion',
        'transfer': transfer, 'task_gains': gains, 'regressions': regressions,
        'all_frozen_declarations_retained': retained, 'catalogs': catalogs,
        'costs': 'raw receipts plus full validation/call reservations and measured seconds',
        'measured_costs': _measured_costs(sides, context_checks),
        'catalog_accounting': {side: result.get('catalog_accounting') for side,result in context_checks.items()},
        'eligible': bool(suite['independent'] and valid and retained and (gains if policy_comparison else transfer) and not regressions),
        'status': 'valid_finite_budget_comparison' if valid and retained else 'invalid_comparison_or_capability_regression',
        'independence': 'precommitted selection provenance; not authenticated by JSON alone',
        'causal_limit': 'dependency use is not indispensability; run a separately precommitted ablation where feasible'}
    write(directory/'result.json', result)
    arm.s['evaluations'].append({'binding': binding, 'transfer': transfer, 'regressions': regressions,
                                'eligible': result['eligible']})
    arm.save()
    return result

def copy_tasks(tasks, transport):
    # Neither reference solutions nor hidden evaluation notes enter the request.
    keys = {'id', 'statement', 'hypotheses', 'scope', 'source_sha256', 'kind',
            'interface_type', 'transport_type', 'required_constants'}
    if transport == 'fixture':
        keys |= {'fixture_term', 'fixture_module', 'fixture_interface_term', 'fixture_transport_term', 'fixture_strategy'}
    return [{k: v for k, v in t.items() if k in keys} for t in tasks]

def ablate(arm, source, artifact):
    """Precommitted with/without component comparison on the same frozen suite.

    Adaptation may rediscover the component within the equal budget. Failure of
    a dependent old module is a recorded regression, not erased from the suite.
    """
    if artifact not in arm.p['ablations']:
        raise Invalid('ablation was not precommitted')
    manifest = verify_snapshot(source)
    key = 'ablation-'+digest({'source': manifest['binding'], 'artifact': artifact})[:20]
    target = arm.root/'ablations'/key
    if artifact not in manifest['files']:
        result = {'status': 'artifact_unavailable; usefulness_not_demonstrated', 'artifact': artifact}
        write(target/'unavailable.json', result)
        return result
    if not (target/'manifest.json').exists():
        target.mkdir(parents=True, exist_ok=True)
        files = {k: v for k, v in manifest['files'].items() if k != artifact}
        for name in files:
            p = target/'source'/name
            p.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source/'source'/name, p)
        binding = {'files': files, 'policy': manifest['policy']}
        write(target/'manifest.json', {**binding, 'binding': digest(binding), 'created': time.time(),
                                      'removed_artifact': artifact})
    return evaluate_pair(arm, target, source, key)
