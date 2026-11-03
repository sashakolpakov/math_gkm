"""Frozen structural obligations, equal-budget adaptations, fresh Lean replay.

No theorem counts, evaluator praise or new vocabulary establish transfer. The
required component constants must occur in the checked consumer's dependency
closure; this establishes use, not causal indispensability. Optional ablation
comparisons use the same evaluate_pair API and debit the same owning arm.
"""
import copy
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
from .inspection_profiles import resolve, catalogue_selection, validate_binding, from_result
from .adapter_protocol import intake, AdapterProtocolError

# PROPOSED ONLY: root must fill the exact separately built/qualified engine
# pointer/hash map before this source can be frozen or deployed. No writable
# manifest, role request or protocol option can select a replay implementation.
CATALOG_REPLAY_ENGINE = {'executable': {'path': '/Users/sasha/math_gkm/.bootstrap/concept-driver-20261020/general-continuation/context-replay25-20261026/standalone-origin-0002/native/leanchecker', 'sha256': '408d922ca4bc2cfa2f8f4757c35d1133d9c16881e9f6c0448dc46dcb66c3e41e'}, 'interface_source': {'path': '/Users/sasha/math_gkm/machinery/serial_replay.py', 'sha256': '38673be376e02423efd213a9bcc0ca71ed222e4acb41e3e3c6aff92e18e5cfa4'}, 'official_source': {'path': '/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/src/lean/LeanChecker.lean', 'sha256': 'eb5dee411837629f09c5c18d63cc833d30335a46048bc586642742e90aa65d5f'}, 'official_worker_sha256': '4a1a5a15aa9296ca7fa05bc6fae5413962b27b718ab9acf1b50b6c461bbe7464', 'schema': 'math-gkm.catalogue-serial-engine.v1', 'source': {'path': '/Users/sasha/math_gkm/.bootstrap/concept-driver-20261020/general-continuation/context-replay25-20261026/standalone-origin-0002/sources/SerialReplay.lean', 'sha256': '9109555d0a15a52861ba74adfe61a02f692f96ac07f9eb3354b18555cdc47116'}, 'toolchain': {'checker': {'path': '/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/leanchecker', 'sha256': '4c4f966e8c42ae7a7ce6d7f5999de8c1b1fbc920040f72e60d2086aa25ceec01'}, 'lean': {'path': '/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean', 'sha256': '1b370cfcbf44e80d1b004ab1b1ab9a4c73951f9f7c242140bcff9bc577576554'}, 'root': '/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2'}}


# INACTIVE: later source review/calibration is required to select a catalogue
# preset here. Proposal/protocol/result data cannot select this controller value.
CATALOG_INSPECTION_PROFILE = 'catalogue-4m-256mib-v1'


def _catalog_engine():
    if CATALOG_REPLAY_ENGINE is None:
        raise Invalid('catalogue serial replay engine has not been qualified and source-pinned')
    from . import serial_replay
    engine = {k: dict(v) if isinstance(v, dict) else v
              for k, v in CATALOG_REPLAY_ENGINE.items()}
    serial_replay.engine_identity(engine)
    return engine


def catalogue_seconds(protocol):
    """Derived frozen-own-context allowance; ordinary proof caps are unchanged."""
    seconds = protocol['validation_seconds']
    if type(seconds) is not int or not 1 <= seconds <= 1800:
        raise Invalid('invalid catalogue validation basis')
    return min(5400, 3*seconds)


def paired_evaluation_seconds(protocol, tasks):
    """Symmetric reserved ceiling; each task retains the ordinary proof cap.

    The zero-task formula remains useful for conservative trial reservations;
    callers with an empty suite still skip evaluation work as before.
    """
    if type(tasks) is not int or tasks < 0:
        raise Invalid('invalid paired evaluation task count')
    return (2*protocol['adaptation_seconds'] +
            2*tasks*protocol['validation_seconds'] + 2*catalogue_seconds(protocol))


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
        ('set_option autoImplicit false\n' if task.get('strict_closed_statement') is True else '')+
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
               frozen_files=None, transfer_modules=None, required=(), contract=None,
               catalog_replay_engine=None, catalog_inspection_profile=None):
    """Whole compilation/replay sequence shares one timeout; failures are bounded."""
    task = task if 'target_module' in task else bind_task(workspace, task)
    directory.mkdir(parents=True, exist_ok=False)
    start = time.monotonic()
    profile = resolve()
    result = {'task_id': task['id'], 'task_hash': digest(task), 'checked': False,
        'source_sha256': task['source_sha256'], 'scope': task['scope'], 'hypotheses': task['hypotheses'],
        'budget_seconds': seconds, 'checks': [], 'status': 'invalid_comparison',
        'validation_mode': 'deployed_sandbox' if live else 'unwrapped_fixture',
        'required_constants': task['required_constants'], 'inspection_schema': profile.inspection_schema,
        'inspection_profile': profile.binding(),
        'controller_stage': 'context'}
    try:
        if catalog_replay_engine is not None and (
                task.get('id') != 'catalog' or not isinstance(solution, dict) or
                solution.get('module') != 'MathGKM.FrozenCatalog'):
            raise Invalid('serial replay is restricted to the frozen own catalogue')
        profile = catalogue_selection(catalog_inspection_profile, task=task, solution=solution,
            replay_engine=catalog_replay_engine)
        result.update(inspection_schema=profile.inspection_schema, inspection_profile=profile.binding())
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
        sources['StudyInspect'] = proof_audit.inspector('StudyCheck', declarations, required, frozen_modules, artifact='declarations.json', nonce=inspection_nonce, inspection_profile=profile.id)
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
            if operation == 'kernel_replay' and catalog_replay_engine is not None:
                from . import serial_replay
                prefixes = order + ['StudyCheck']
                replayed = serial_replay.run(directory/'serial-replay', prefixes,
                    engine=catalog_replay_engine, cwd=source, env=env,
                    launcher_prefix=prefix,
                    remaining=lambda: seconds-(time.monotonic()-start),
                    invoke=run, stop=stop)
                for item in replayed['process_records']:
                    record = item['record']
                    result['checks'].append({'operation': 'kernel_replay',
                        'serial_phase': item['phase'],
                        'prefix_index': item['prefix_index'], 'batch_index': item['batch_index'],
                        'serial_trace': item['trace'], **record})
                    if live and (record['returncode'] < 0 or 'sandbox-exec:' in record['stderr']):
                        result.update(status='validator_infrastructure_failure', infrastructure_failure=True)
                result['catalog_replay'] = {
                    'engine_identity': serial_replay.engine_identity(catalog_replay_engine),
                    'receipt': replayed['receipt'], 'checked': replayed['checked']}
                write(directory/'result.json', result)
                if not replayed['checked'] or any(
                        item['record']['returncode'] or item['record']['termination']
                        for item in replayed['process_records']):
                    raise Invalid('frozen catalogue serial kernel replay incomplete')
                verified = serial_replay.verify(directory/'serial-replay', prefixes=prefixes,
                    engine=catalog_replay_engine)
                if not verified['checked'] or verified['receipt'] != replayed['receipt']:
                    raise Invalid('frozen catalogue serial kernel replay binding changed')
                continue
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
            result['trusted_inspector_failure']=proof_audit.failure_artifact(source/'declarations.json',declarations,inspected,nonce=inspection_nonce,inspection_profile=profile.id)
        if live and (inspected['returncode'] < 0 or 'sandbox-exec:' in inspected['stderr']):
            result.update(status='validator_infrastructure_failure', infrastructure_failure=True)
        result['declarations'] = proof_audit.parse_artifact(inspected, declarations, source/'declarations.json', nonce=inspection_nonce,inspection_profile=profile.id)
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
        if catalog_replay_engine is not None:
            verified = serial_replay.verify(directory/'serial-replay', prefixes=order+['StudyCheck'],
                engine=catalog_replay_engine)
            if (not verified['checked'] or
                    verified['receipt'] != result['catalog_replay']['receipt']):
                raise Invalid('frozen catalogue serial replay changed during premise inspection')
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
    finish(directory,task,solution,required,inspection_profile=profile.id)
    return result

def _catalog_identity(arm, manifest, task, solution):
    """Exact immutable context identity; no evaluator answer material enters it."""
    sealed = read(arm.study/'seal.json')
    if 'dependencies' not in sealed:
        raise Invalid('frozen catalog cache requires sealed dependency identity')
    from . import serial_replay
    profile = catalogue_selection(CATALOG_INSPECTION_PROFILE, task=task, solution=solution,
        replay_engine=_catalog_engine())
    return {'schema': 'math-gkm.frozen-catalog-identity.v2',
            'snapshot_binding': manifest['binding'],
            'snapshot_files': manifest['files'],
            'admitted_modules': manifest.get('admitted_modules'),
            'source_sha256': task['source_sha256'],
            'task': task, 'solution': solution, 'required': [],
            'validation_mode': arm.p['transport'],
            'inspection_schema': profile.inspection_schema,
            'inspection_profile': profile.binding(),
            'binaries': {str(p): sha(p) for p in (LEAN, CHECKER)},
            'pins': {n: sha(ROOT/n) for n in ('lean-toolchain','lakefile.toml','lake-manifest.json')},
            'dependency_identity': digest(sealed['dependencies']),
            'serial_replay_engine': serial_replay.engine_identity(_catalog_engine()),
            'implementation': {n: sha(ROOT/'machinery'/n) for n in
                ('proof_audit.py','inspection_stream.py','inspection_profiles.py','validation_receipts.py','own_feedback.py','study_transfer.py')}}


def _catalog_verified(directory, task, solution, identity):
    from .validation_receipts import reuse
    profile = resolve(identity['inspection_profile']['id'])
    validate_binding(identity['inspection_profile'], profile.id)
    result = reuse(directory, task, solution, (), inspection_profile=profile.id)
    from_result(result, profile.id)
    if (result.get('checked') is not True or result.get('inspection_schema') != profile.inspection_schema or
            result.get('target_binding') != digest(task) or result.get('solution_binding') != digest(solution) or
            result.get('binary_hashes') != identity['binaries'] or result.get('pin_hashes') != identity['pins'] or
            not result.get('declarations') or 'catalog' not in result['declarations'][0]):
        raise Invalid('frozen catalog successful exact inspection binding required')
    from . import serial_replay
    replay = result.get('catalog_replay', {})
    prefixes = [row['module'] for row in result.get('checks', [])
                if row.get('operation') == 'compile']
    if (not prefixes or replay.get('checked') is not True or
            replay.get('engine_identity') != identity['serial_replay_engine']):
        raise Invalid('frozen catalog serial replay identity or coverage missing')
    verified = serial_replay.verify(directory/'serial-replay', prefixes=prefixes, engine=_catalog_engine())
    if not verified['checked'] or replay.get('receipt') != verified['receipt']:
        raise Invalid('frozen catalog serial replay receipt changed')
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
    # This function is called only for the frozen OWN catalogue. It projects a
    # controller diagnostic token; never task text, compiler output, or reports.
    diagnostic = result.get('controller_diagnostic')
    if (result.get('checked') is False and isinstance(diagnostic, dict) and
            diagnostic.get('schema') == 'math-gkm.own-check-feedback.v1' and
            diagnostic.get('category') == 'timeout' and
            diagnostic.get('mathematical_conclusion') == 'none'):
        out['frozen_context_failure_category'] = 'timeout'
    return out


def catalog_snapshot(arm, source, manifest, directory, key):
    """Inspect every frozen declaration, reusing only exact FINISHED receipts.

    A cached success never substitutes for a different context. Cache verification
    still hashes all retained receipt artifacts and checks binaries/pins through
    the official validator-reuse path. Failed, stale or partial entries are
    inconclusive; wall caps and acceptance checks stay fixed; inspection uses the bound preset.
    """
    started = time.monotonic()
    actual = verify_snapshot(source)
    if actual != manifest:
        raise Invalid('frozen catalog snapshot manifest changed')
    arm.reserve('catalog-'+key, catalogue_seconds(arm.p))
    marker = directory.parent/(directory.name+'.reserved.json')
    cached_attempt = directory/'CACHE_REUSE.json'
    existing = (directory/'result.json').exists() or cached_attempt.exists()
    if not existing and (marker.exists() or directory.exists()):
        return {'checked': False, 'status': 'interrupted_catalog_not_replayed',
                'elapsed_seconds': time.monotonic()-started}
    if not existing:
        write(marker, {'snapshot': manifest['binding'], 'seconds': catalogue_seconds(arm.p)})
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
    result = check_task(ws, task, solution, directory, catalogue_seconds(arm.p),
        live=arm.p['transport'] == 'live', stop=arm.stopped, frozen_files=manifest['files'],
        catalog_replay_engine=_catalog_engine(),
        catalog_inspection_profile=identity['inspection_profile']['id'])
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


def evaluate_pair(arm, before, after, key, *, policy_comparison=False,
                  suite=None, required_exports=(), side_order=('before', 'after'),
                  route_snapshots=True):
    """Exact solver comparison; optional controls belong to the controller.

    Isolated methods use fresh exact snapshots, precommitted suite subsets,
    selected exports and balanced adapter order. Role payloads select none of
    these controls. Every call and validation debits the owning arm.
    """
    if suite is None:
        from .study_methods import partition_suite
        partition = 'final' if key.startswith('final-') else 'assessment'
        suite = partition_suite(read(arm.study/'evaluation/suite.json'),
                                arm.p.get('method_learning'))[partition]
    else:
        suite = copy.deepcopy(suite)
    from .study import validate_suite
    validate_suite(suite, read(arm.study/'seed/contract.json'))
    if (tuple(side_order) not in (('before', 'after'), ('after', 'before')) or
            type(route_snapshots) is not bool or
            not isinstance(required_exports, (list, tuple)) or
            any(not isinstance(n, str) or not NAME.fullmatch(n) for n in required_exports)):
        raise Invalid('invalid controller comparison controls')
    options = dict(policy_comparison=policy_comparison, suite=suite,
                   required_exports=tuple(required_exports), side_order=tuple(side_order),
                   route_snapshots=route_snapshots)
    result = arm.root/'evaluations'/key/'result.json'
    if suite['tasks'] and not result.exists():
        cap = paired_evaluation_seconds(arm.p, len(suite['tasks']))
        if required_exports and not route_snapshots:
            arm.fund_many({'paired-evaluation-'+key: (cap, 2, 0)})
        else:
            arm.fund('paired-evaluation-'+key, cap)
        with arm.budget('paired-evaluation-'+key):
            return _evaluate_pair(arm, before, after, key, **options)
    return _evaluate_pair(arm, before, after, key, **options)


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


def _evaluate_pair(arm, before, after, key, *, policy_comparison=False,
                   suite=None, required_exports=(), side_order=('before', 'after'),
                   route_snapshots=True):
    directory = arm.root/'evaluations'/key
    suite = read(arm.study/'evaluation/suite.json') if suite is None else suite
    bm, am = verify_snapshot(before), verify_snapshot(after)
    from . import snapshot_routing
    routes = None
    if snapshot_routing.ENABLED and route_snapshots:
        routes = snapshot_routing.prepare_pair(arm, before, after, directory)
        before = Path(routes['before']['validation_snapshot'])
        after = Path(routes['after']['validation_snapshot'])
        bm, am = verify_snapshot(before), verify_snapshot(after)
    catalog_profile = resolve(CATALOG_INSPECTION_PROFILE)
    binding = {'before': bm['binding'], 'after': am['binding'], 'suite': digest(suite),
               'inspection_schema': proof_audit.SCHEMA,
               'adapter_typing_contract_schema': ADAPTER_TYPING_CONTRACT_SCHEMA,
               'catalog_inspection_profile': catalog_profile.binding(),
               'catalog_inspection_schema': catalog_profile.inspection_schema,
               'policy_comparison': policy_comparison,
               'adaptation_seconds_each': arm.p['adaptation_seconds'],
               'validation_seconds_each_task': arm.p['validation_seconds'],
               'catalog_seconds_each': catalogue_seconds(arm.p)}
    if routes is not None:
        binding['snapshot_routing'] = routes
    if required_exports or tuple(side_order) != ('before', 'after') or not route_snapshots:
        binding['method_controls'] = {'required_exports': list(required_exports),
            'side_order': list(side_order), 'exact_fresh_snapshots': not route_snapshots}
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
    reserve = paired_evaluation_seconds(arm.p, len(suite['tasks']))
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
    typing_contract = adapter_typing_contract(bound_tasks)
    catalogs = {}
    context_checks = {}
    for side, source, manifest in [('before', before, bm), ('after', after, am)]:
        checked = catalog_snapshot(arm, source, manifest, directory/('catalog-'+side), key+'-'+side)
        context_checks[side] = {k: checked[k] for k in ('elapsed_seconds','catalog_accounting') if k in checked}
        if not checked['checked']:
            result = {'binding': binding, 'eligible': False, 'status': 'invalid_frozen_context',
                      'catalog_failure': checked, 'transfer': [], 'regressions': [],
                      'own_context_status': ('timeout' if checked.get('frozen_context_failure_category') == 'timeout' else 'inconclusive'),
                      'measured_costs': _measured_costs({}, context_checks)}
            write(directory/'result.json', result)
            return result
        from_result(checked, catalog_profile.id)
        if checked.get('inspection_schema') != catalog_profile.inspection_schema:
            raise Invalid('catalog identity schema changed; charged fresh comparison required')
        catalogs[side] = {c['name']: (c['identity_schema'], c['semantic_sha256']) for c in checked['declarations'][0]['catalog']}
    retained = all(catalogs['after'].get(n) == h for n, h in catalogs['before'].items())
    sides = {}
    source_sides = {'before': (before, bm), 'after': (after, am)}
    for side in side_order:
        source, manifest = source_sides[side]
        ws = arm.root/'roles'/f'eval-{key}-{side}'
        if not ws.exists():
            copy_seed(arm.study/'seed', ws)
            for name in manifest['files']:
                p = ws/name
                p.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(source/'source'/name, p)
        tasks = copy_tasks(suite['tasks'], arm.p['transport'])
        req = {'role': 'adapter', 'tasks': tasks, 'policy': manifest['policy'],
               'typing_contract': copy.deepcopy(typing_contract),
               'solver_binding': manifest['binding'], 'purpose': 'withheld structural obligation; no training feedback'}
        routed_side = routes is not None and routes[side]['execution_mode'] == 'dual_snapshot'
        if routed_side:
            req.update(snapshot_context_schema=snapshot_routing.CONTEXT_SCHEMA,
                       snapshot_route=routes[side], research_notes=routes[side]['research_notes'],
                       validation_frozen_files=manifest['files'])
        receipt = arm.call(f'eval-{key}-{side}', 'adapter', req, ws, False, arm.p['adaptation_seconds'])
        if routed_side:
            ws = snapshot_routing.validation_workspace(arm, source, manifest, ws,
                directory/('validation-workspace-'+side))
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
        selected_use = {n: value for n, value in actual_new.items()
                        if not required_exports or n in required_exports}
        if required_exports:
            b['method_exports_used'] = selected_use
        if task['id'] in gains and selected_use and (not task['required_constants'] or b.get('component_use_checked')):
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
    if required_exports:
        result['bounded_counts'] = {
            'before_successes': sum(c['checked'] is True for c in old),
            'after_successes': sum(c['checked'] is True for c in new),
            'obligations': len(suite['tasks']),
            'holdouts': sum(t['kind'] == 'holdout' for t in suite['tasks']),
            'regressions': sum(t['kind'] == 'regression' for t in suite['tasks'])}
    write(directory/'result.json', result)
    arm.s['evaluations'].append({'binding': binding, 'transfer': transfer, 'regressions': regressions,
                                'eligible': result['eligible']})
    arm.save()
    return result


ADAPTER_TYPING_CONTRACT_SCHEMA = 'math-gkm.adapter-typing-contract.v1'


def adapter_typing_contract(bound_tasks):
    """Inline types/scope only, derived from the unchanged frozen generator.

    Never serialize a complete bound task: fixture/hidden/reference fields are
    not part of this API. No Lean module, import or wrapper declaration is made.
    """
    previews = []
    for task in bound_tasks:
        target = {key: copy.deepcopy(task[key]) for key in
            ('target_module', 'context_modules', 'hypotheses', 'statement',
             'interface_type', 'transport_type')}
        if 'reduction_root' in task:
            target['reduction_root'] = task['reduction_root']
        if 'residuals' in task:
            target['residuals'] = [{key: value for key, value in residual.items()
                if key in ('statement', 'existing_constant')} for residual in task['residuals']]
        generated = target_source(target)
        imports = ''.join('import '+module+'\n' for module in target['context_modules'])
        if not generated.startswith(imports):
            raise Invalid('typing preview differs from authoritative target generator')
        module = task['target_module']
        interface = {'name': 'StudyInterface', 'type': module+'.Interface'}
        transport = {'name': 'StudyTransport', 'type': module+'.Transport StudyInterface'}
        previews.append({'task_id': task['id'],
            'context_modules': copy.deepcopy(task['context_modules']),
            'context_sources': copy.deepcopy(task['context_sources']),
            'target_module': module, 'target_definitions': generated[len(imports):],
            'entries': [
                {'field': 'interface_term', 'expected_type': module+'.Interface', 'prior_bindings': []},
                {'field': 'transport_term', 'expected_type': module+'.Transport StudyInterface',
                 'prior_bindings': [copy.deepcopy(interface)]},
                {'field': 'term', 'expected_type': module+'.Goal StudyInterface',
                 'prior_bindings': [copy.deepcopy(interface), copy.deepcopy(transport)]}]})
    return {'schema': ADAPTER_TYPING_CONTRACT_SCHEMA, 'tasks': previews}

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
