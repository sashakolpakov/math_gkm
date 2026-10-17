"""Frozen structural obligations, equal-budget adaptations, fresh Lean replay.

No theorem counts, evaluator praise or new vocabulary establish transfer. The
required component constants must occur in the checked consumer's dependency
closure; this establishes use, not causal indispensability. Optional ablation
comparisons use the same evaluate_pair API and debit the same owning arm.
"""
import os
from pathlib import Path
import re
import shutil
import time

from .study_common import (ROOT, Invalid, read, write, digest, sha, verify_snapshot,
                           copy_seed, inventory)
from .trust import LEAN, CHECKER, CORE, environment
from .process import run
from .completion import NAME, ALLOWED, without_comments

def dependency_paths(workspace):
    return [CORE] + [p/'.lake/build/lib/lean' for p in sorted((workspace/'.lake/packages').iterdir())]

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
    read_roots = [directory, LEAN.parent.parent, Path('/System'), Path('/usr'), Path('/bin'),
                  Path('/sbin'), Path('/Library'), Path('/opt/homebrew')]
    read_roots += [p.resolve() for p in dependencies]
    profile = '(version 1)\n(deny default)\n(allow process* sysctl-read mach-lookup)\n'
    profile += '(allow file-read* ' + ' '.join('(subpath '+json.dumps(str(p))+')' for p in read_roots) + ')\n'
    profile += '(allow file-read* (literal "/dev/null") (literal "/dev/urandom"))\n'
    profile += '(allow file-write* (subpath '+json.dumps(str(directory))+') (literal "/dev/null"))\n'
    path = directory/'validator.sb'
    path.write_text(profile)
    return ['/usr/bin/sandbox-exec', '-f', str(path)]

def exact_type(task, key):
    hypotheses = task['hypotheses']
    if not all(isinstance(h, str) and h.startswith('(') and h.endswith(')') for h in hypotheses):
        raise Invalid('hypotheses must be explicit Lean binders')
    return ('∀ ' + ' '.join(hypotheses) + ', ' if hypotheses else '') + task[key]

def wrapper(task, solution, frozen_modules=None, transfer_modules=None):
    for name in task['required_constants']:
        if not NAME.fullmatch(name):
            raise Invalid('invalid required component name')
    required = ', '.join('`'+name for name in task['required_constants'])
    frozen = ', '.join('`'+name for name in (frozen_modules or []))
    transferred = ', '.join('`'+name for name in (transfer_modules or []))
    return f'''import {solution['module']}
import Lean
theorem StudyObligation : {exact_type(task, 'statement')} := {solution['term']}
def StudyInterface : {exact_type(task, 'interface_type')} := {solution['interface_term']}
theorem StudyTransport : {exact_type(task, 'transport_type')} := {solution['transport_term']}
#print axioms StudyObligation
#print axioms StudyInterface
#print axioms StudyTransport
open Lean in
run_elab do
  let env ← Lean.getEnv
  let mut todo : List Lean.Name := [`StudyObligation]
  let mut seen : List Lean.Name := []
  let mut fuel := 100000
  while !todo.isEmpty && fuel > 0 do
    fuel := fuel - 1
    let n := todo.head!
    todo := todo.tail!
    if !seen.contains n then
      seen := n :: seen
      if let some ci := env.find? n then
        if let some value := ci.value? (allowOpaque := true) then
          todo := value.getUsedConstants.toList ++ todo
  if fuel == 0 then throwError "dependency audit budget exhausted"
  for n in ([{required}] : List Lean.Name) do
    unless seen.contains n do throwError "required component absent from checked consumer: {{n}}"
    let some idx := env.getModuleIdxFor? n | throwError "component is not an imported frozen declaration"
    let origin := env.header.moduleNames[idx]!
    unless ([{frozen}] : List Lean.Name).contains origin do
      throwError "component was invented during adaptation, not supplied by frozen solver: {{n}}"
  let mut transferredUse := false
  for n in ([{required}] : List Lean.Name) do
    if let some idx := env.getModuleIdxFor? n then
      if ([{transferred}] : List Lean.Name).contains env.header.moduleNames[idx]! then
        transferredUse := true
  if transferredUse then Lean.logInfo "STUDY_FROZEN_CHANGED_COMPONENT_USED"
'''

def check_task(workspace, task, solution, directory, seconds, *, live=False, stop=lambda: False,
               frozen_files=None, transfer_modules=None):
    """Whole compilation/replay sequence shares one timeout; failures are bounded."""
    directory.mkdir(parents=True, exist_ok=False)
    start = time.monotonic()
    result = {'task_id': task['id'], 'task_hash': digest(task), 'checked': False,
        'source_sha256': task['source_sha256'], 'scope': task['scope'], 'hypotheses': task['hypotheses'],
        'budget_seconds': seconds, 'checks': [], 'status': 'usefulness_not_demonstrated',
        'required_constants': task['required_constants']}
    try:
        if sha(workspace/'MathGKM/Markov.lean') != task['source_sha256']:
            raise Invalid('exact source check failed')
        if not solution or not NAME.fullmatch(solution.get('module', '')):
            raise Invalid('missing exact solution module')
        before = inventory(workspace)
        frozen_files = before if frozen_files is None else frozen_files
        if any(before.get(name) != hashed for name, hashed in frozen_files.items()):
            raise Invalid('adaptation altered frozen solver sources')
        frozen_modules = [name[:-5].replace('/', '.') for name in frozen_files
                          if name.startswith('MathGKM/') and name.endswith('.lean')]
        sources, order = collect(workspace, solution['module'])
        sources['StudyCheck'] = wrapper(task, solution, frozen_modules, transfer_modules)
        # Terms are elaborated as code; reject obvious authority-changing constructs.
        for key in ('term', 'interface_term', 'transport_term'):
            if re.search(r'\b(sorry|admit|axiom|native_decide)\b', without_comments(solution[key])):
                raise Invalid('forbidden proof construct in adapter')
        source, build = directory/'source', directory/'build'
        source.mkdir()
        build.mkdir()
        for module, text in sources.items():
            path = source/(module.replace('.', '/')+'.lean')
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
        deps = dependency_paths(workspace)
        env = environment([build]+deps)
        env['TMPDIR'] = str(directory)
        prefix = sandbox_prefix(directory, deps) if live else []
        for operation in ('compile', 'kernel_replay'):
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
                record = run(prefix+argv, cwd=source, env=env, timeout=min(180, remaining), output_bytes=1048576)
                result['checks'].append({'module': module, 'operation': operation, **record})
                write(directory/'result.json', result)
                if record['returncode'] or record['termination']:
                    raise Invalid('failure within compilation/replay budget: '+module)
                if module == 'StudyCheck' and operation == 'compile':
                    result['changed_component_use_checked'] = 'STUDY_FROZEN_CHANGED_COMPONENT_USED' in record['stdout']
                    for name in ('StudyObligation', 'StudyInterface', 'StudyTransport'):
                        m = re.search("'"+name+r"' depends on axioms: \[([^\]]*)\]", record['stdout'])
                        if not m and "'"+name+"' does not depend on any axioms" not in record['stdout']:
                            raise Invalid('missing axiom closure report')
                        if m and not set(x.strip() for x in m[1].split(',') if x.strip()) <= ALLOWED:
                            raise Invalid('unpermitted axiom closure')
        if inventory(workspace) != before:
            raise Invalid('solver changed during check')
        result.update(checked=True, status='checked_exact_obligation_and_interfaces',
                      source_binding=digest(before), component_use_checked=bool(task['required_constants']))
    except (Invalid, OSError, KeyError, TypeError) as exc:
        result['failure'] = str(exc)
    result['elapsed_seconds'] = time.monotonic()-start
    write(directory/'result.json', result)
    return result

def evaluate_pair(arm, before, after, key):
    directory = arm.root/'evaluations'/key
    suite = read(arm.study/'evaluation/suite.json')
    bm, am = verify_snapshot(before), verify_snapshot(after)
    binding = {'before': bm['binding'], 'after': am['binding'], 'suite': digest(suite),
               'adaptation_seconds_each': arm.p['adaptation_seconds'],
               'validation_seconds_each_task': arm.p['validation_seconds']}
    if (directory/'result.json').exists():
        previous = read(directory/'result.json')
        if previous['binding'] != binding:
            raise Invalid('comparison result binding changed')
        return previous
    if not suite['tasks']:
        result = {'binding': binding, 'eligible': False, 'status': 'no_independent_holdout; transfer_not_demonstrated',
                  'correctness': 'not_evaluated', 'scope': 'exact_root_unchanged', 'costs': {}, 'transfer': 'not_demonstrated'}
        write(directory/'result.json', result)
        return result
    # Reserve symmetric entire comparison before any adaptation call.
    reserve = 2*arm.p['adaptation_seconds'] + 2*len(suite['tasks'])*arm.p['validation_seconds']
    if arm.s['seconds'] + reserve > arm.p['arm_seconds'] or arm.s['calls'] + 2 > arm.p['max_calls']:
        raise Invalid('insufficient equal adaptation/validation reservation for pair')
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
        solutions = receipt.get('payload', {}).get('solutions', {}) if receipt['outcome'] == 'completed' else {}
        checks = []
        for task in suite['tasks']:
            target = directory/side/task['id']
            if (target/'result.json').exists():
                checked = read(target/'result.json')
            else:
                # Journal reservation before compiler effects. Recovery charges the
                # full reservation if interrupted, never silently repeats a check.
                journal = target/'reservation.json'
                if target.exists():
                    checked = {'checked': False, 'task_id': task['id'], 'status': 'interrupted_validation_not_replayed',
                               'elapsed_seconds': 0, 'component_use_checked': False}
                    write(target/'result.json', checked)
                else:
                    arm.s['seconds'] += arm.p['validation_seconds']
                    arm.save()
                    checked = check_task(ws, task, solutions.get(task['id']), target, arm.p['validation_seconds'],
                        live=arm.p['transport'] == 'live', stop=arm.stopped, frozen_files=manifest['files'],
                        transfer_modules=[name[:-5].replace('/', '.') for name, hashed in am['files'].items()
                            if name.endswith('.lean') and name.startswith('MathGKM/') and bm['files'].get(name) != hashed])
                    # Reserved budget stays charged; measured costs remain separate.
            checks.append(checked)
        sides[side] = {'adapter_receipt': receipt, 'checks': checks}
    old, new = sides['before']['checks'], sides['after']['checks']
    regressions = [t['id'] for t, a, b in zip(suite['tasks'], old, new) if (t['kind'] == 'regression' or a['checked']) and not b['checked']]
    transfer = [t['id'] for t, a, b in zip(suite['tasks'], old, new)
                if t['kind'] == 'holdout' and b['checked'] and b.get('changed_component_use_checked') and not a['checked']]
    result = {'binding': binding, 'sides': sides, 'correctness': 'per_obligation_kernel_results',
        'scope': 'frozen exact hypotheses, source and interfaces only; not root completion',
        'transfer': transfer, 'regressions': regressions, 'costs': 'raw receipts plus validation reservations and measured seconds',
        'eligible': bool(suite['independent'] and transfer and not regressions),
        'status': 'finite_budget_comparison; failures_not_unprovability',
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
        keys |= {'fixture_term', 'fixture_module', 'fixture_interface_term', 'fixture_transport_term'}
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
