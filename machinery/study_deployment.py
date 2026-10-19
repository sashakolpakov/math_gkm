"""Bounded neutral deployment preflight. No hosted model or research inputs.

Run in the approved host context:
  /opt/homebrew/bin/python3 -m machinery.study_deployment --out .scratch/FRESH_NAME
Exit 0 requires the real sandbox, fresh Lean/kernel/premise checks, rejected
negative controls, and the actual completion adapter's exact-root check. This
is operational evidence for independent review, never a self-certification.
"""
import argparse
import json
from pathlib import Path
import platform
import sys
import time
import shutil
import re

from .study_common import ROOT, Invalid, canonical, digest, read, sha, write, dependencies, dependency_identity
from .study_transfer import check_task, sandbox_prefix
from .trust import CORE, LEAN, CHECKER, environment
from .process import run


ROOT_REQUIRED = ['MathGKM.DeploymentRoot.Root']


class NeutralArm:
    """Ordinary own state for the real adapter; never a correspondence audit."""
    def __init__(self, directory, workspace, seconds, stopped=lambda: False):
        from .study_policy import initial
        self.study = Path(directory)
        self.root = self.study/'completion-adapter'
        self.workspace = workspace
        self.p = {'transport': 'live', 'validation_seconds': seconds}
        self.s = {'round': 0, 'status': 'neutral_unresolved', 'research': initial('baseline')}
        self.reservations = []
        self.stopped = stopped
        self.save()

    def reserve(self, key, cap):
        self.reservations.append({'key': key, 'seconds': cap})
        self.save()

    def save(self):
        # study_common.write flushes/fsyncs the file and parent after replacement.
        write(self.root/'state.json', {**self.s, 'reservations': self.reservations})


def missing_required_control(result, binding):
    """Authenticate this own attempt, not reported categories or error prose."""
    if not binding:
        return False
    from .study_transfer import bind_task, inventory, target_source, wrapper
    from .validation_receipts import reuse
    from . import proof_audit
    try:
        directory, workspace = binding['directory'], binding['workspace']
        task, solution = binding['task'], binding['solution']
        if task['required_constants'] != ROOT_REQUIRED:
            return False
        task = bind_task(workspace, task) if 'target_module' not in task else task
        checked = reuse(directory, task, solution, ROOT_REQUIRED)
        # Match the writer's complete JSON form, including integer PID map keys.
        persisted = json.loads(canonical(result))
        if json.dumps(checked, sort_keys=True, allow_nan=False) != json.dumps(persisted, sort_keys=True, allow_nan=False) or result.get('checked') is not False or result.get('validation_mode') != 'deployed_sandbox':
            return False
        if result.get('controller_stage') != 'trusted_premise_inspection' or result.get('infrastructure_failure'):
            return False
        if result.get('required_constants') != ROOT_REQUIRED or result.get('task_hash') != digest(task):
            return False
        contract = read(workspace/'contract.json')
        if sha(workspace/contract['root_file']) != contract['root_sha256'] or result['source_sha256'] != contract['root_sha256']:
            return False
        source = directory/'source'
        inspector = (source/'StudyInspect.lean').read_text()
        nonces = re.findall(r'nonce := "([0-9a-f]{64})"', inspector)
        if len(nonces) != 1:
            return False
        modules = [n[:-5].replace('/', '.') for n in inventory(workspace) if n.startswith('MathGKM/') and n.endswith('.lean')]
        declarations = ('StudyObligation', 'StudyInterface', 'StudyTransport')
        if inspector != proof_audit.inspector('StudyCheck', declarations, ROOT_REQUIRED, modules, artifact='declarations.json', nonce=nonces[0]):
            return False
        if (source/'StudyCheck.lean').read_text() != wrapper(task, solution) or (source/(task['target_module'].replace('.', '/')+'.lean')).read_text() != target_source(task):
            return False
        for name in task['context_sources']:
            if not (source/name).is_file() or sha(source/name) != sha(workspace/name):
                return False
        if set(result.get('binary_hashes', {})) != {str(LEAN), str(CHECKER)}:
            return False
        if set(result.get('pin_hashes', {})) != {'lean-toolchain','lakefile.toml','lake-manifest.json'}:
            return False
        checks = result.get('checks', [])
        inspected = [c for c in checks if c.get('operation') == 'trusted_premise_inspection']
        preceding = checks[:-1]
        if (len(inspected) != 1 or checks[-1] != inspected[0] or not preceding or
            any(c.get('returncode') != 0 or c.get('termination') or c.get('operationally_incomplete') for c in preceding) or
            {c.get('operation') for c in preceding} != {'compile', 'kernel_replay'}):
            return False
        staged_modules = {str(p.relative_to(source))[:-5].replace('/', '.') for p in source.rglob('*.lean')} - {'StudyInspect'}
        for op in ('compile', 'kernel_replay'):
            if {c.get('module') for c in preceding if c.get('operation') == op} != staged_modules:
                return False
        record = inspected[0]
        if record.get('returncode') != 1 or record.get('termination') or record.get('operationally_incomplete'):
            return False
        if any(not c.get('argv') or c['argv'][0] != '/usr/bin/sandbox-exec' for c in checks):
            return False
        if sha(directory/'validator.sb') != result.get('sandbox_profile_sha256'):
            return False
        artifact = source/'declarations.json'
        if not artifact.is_file() or artifact.is_symlink():
            return False
        expected = {'category': 'missing_required', 'measured': {}}
        return (proof_audit.failure_artifact(artifact, declarations, record, nonce=nonces[0]) == expected and
            proof_audit.failure_artifact(artifact, declarations) == expected and
            result.get('trusted_inspector_failure') == expected)
    except (Invalid, OSError, ValueError, KeyError, TypeError):
        return False


def accepted_controls(positive, wrong_target, missing_premise, completion, *, missing_binding=None):
    """Infrastructure failures cannot count as successful negative controls."""
    return (positive.get('checked') is True and
        positive.get('validation_mode') == 'deployed_sandbox' and
        positive.get('component_use_checked') is True and
        {'compile', 'kernel_replay', 'trusted_premise_inspection'} <=
            {c['operation'] for c in positive.get('checks', [])} and
        not wrong_target.get('checked') and
        any(c.get('module') == 'StudyCheck' and c['operation'] == 'compile' and
            c.get('returncode') == 1 and not c.get('termination') and
            'type mismatch' in c.get('stdout', '').lower()
            for c in wrong_target.get('checks', [])) and
        missing_required_control(missing_premise, missing_binding) and
        completion.get('lean_exact_root_checked') is True and
        completion.get('resolved') is False and
        completion.get('rejection') ==
            'independent source/English correspondence audit required for this exact bundle')


def preflight(directory, seconds=1200):
    directory = Path(directory).resolve()
    if (not directory.is_relative_to(ROOT) or directory == ROOT or
        directory.exists() or type(seconds) is not int or not 10 <= seconds <= 1800):
        raise Invalid('fresh local output and 10..1800 second total preflight bound required')
    directory.mkdir(parents=True)
    start = time.monotonic()
    report = {'schema': 'math-gkm.deployment-preflight.v1', 'ready': False,
        'neutral': True, 'hosted_model_calls': 0, 'budget_seconds': seconds,
        'started': time.time(), 'probes': [], 'host': {'system': platform.system(),
            'release': platform.release(), 'machine': platform.machine()},
        'accounting': 'separate infrastructure setup overhead; unchanged frozen arm opportunities',
        'cause': 'Unproved. Startup failure is infrastructure evidence, never a mathematical rejection.',
        'scope': 'neutral deployed-path observations requiring independent review; no host refinement or continuation proof'}

    def remaining():
        left = seconds-(time.monotonic()-start)
        if left <= 0:
            raise Invalid('preflight total time budget exhausted')
        return left

    try:
        report['source_hashes'] = {str(p.relative_to(ROOT)): sha(p) for p in
            sorted((ROOT/'machinery').glob('*.py'))}
        report['binary_hashes'] = {str(p): sha(p) for p in (LEAN, CHECKER)}
        report['dependency_identity'] = dependency_identity()
        startup = directory/'startup'
        startup.mkdir()
        env = environment([CORE])
        env['TMPDIR'] = str(startup)
        prefix = sandbox_prefix(startup, [CORE])
        report.update(environment=env, sandbox_profile_sha256=sha(startup/'validator.sb'))
        # Both independent startup probes are retained even when the first fails.
        for label, argv in [('echo', ['/bin/echo', 'neutral-wrapper-startup']),
                            ('lean_version', [str(LEAN), '--version'])]:
            record = run(prefix+argv, cwd=startup, env=env,
                         timeout=min(5, remaining()), output_bytes=65536)
            report['probes'].append({'label': label, **record})
            write(directory/'result.json', report)
        if any(p['returncode'] or p['termination'] for p in report['probes']):
            raise Invalid('real wrapper startup failed; no compiler validation established')
        if report['probes'][0]['stdout'].strip() != 'neutral-wrapper-startup':
            raise Invalid('wrapper echo output mismatch')

        # Files immediately outside the allowed validation directory must stay
        # inaccessible, even though the host running this diagnostic owns them.
        forbidden = directory/'outside-validator.txt'
        forbidden.write_text('neutral-private-boundary-token\n')
        denied_write = directory/'outside-validator-write.txt'
        for label, argv in [('denied_read', ['/bin/cat', str(forbidden)]),
                ('denied_write', ['/bin/sh', '-c', 'printf neutral > "$1"',
                                  'neutral-boundary', str(denied_write)])]:
            record = run(prefix+argv, cwd=startup, env=env,
                         timeout=min(5, remaining()), output_bytes=65536)
            report['probes'].append({'label': label, **record})
            expected_exits = (1,) if label == 'denied_read' else (1, 2)
            if (record['returncode'] not in expected_exits or record['termination'] or
                'neutral-private-boundary-token' in record['stdout'] or
                not any(s in record['stderr'].lower() for s in ('operation not permitted', 'permission denied'))):
                raise Invalid('sandbox boundary control did not demonstrate denial: '+label)
        if denied_write.exists():
            raise Invalid('sandbox wrote outside the validator directory')

        workspace = directory/'workspace'
        (workspace/'MathGKM').mkdir(parents=True)
        (workspace/'.lake/packages').mkdir(parents=True)
        dependencies(workspace)
        (workspace/'research').mkdir()
        for name in ('lean-toolchain','lakefile.toml','lake-manifest.json'):
            shutil.copyfile(ROOT/name,workspace/name)
        foundation = 'MathGKM/ResearchSemantics.lean'
        (workspace/foundation).write_bytes((ROOT/foundation).read_bytes())
        root = workspace/'MathGKM/DeploymentRoot.lean'
        root.write_text('import MathGKM.ResearchSemantics\nimport Mathlib\n'
            'namespace MathGKM.DeploymentRoot\n'
            'def Root : Prop := ∀ n : Nat, n + 0 = n\n'
            'theorem identity (n : Nat) : n + 0 = n := Nat.add_zero n\n'
            'end MathGKM.DeploymentRoot\n')
        contract = {'id': 'neutral-deployment-v1', 'root_file': str(root.relative_to(workspace)),
            'root_sha256': sha(root), 'root_declaration': 'MathGKM.DeploymentRoot.Root',
            'assumptions': ['propext', 'Classical.choice', 'Quot.sound'],
            'correspondence_obligations': ['neutral_identity']}
        write(workspace/'contract.json', contract)
        report['deployment_import_scope']='Full Mathlib through actual sandbox, compile, independent leanchecker and trusted premise inspector; unchanged global caps'
        report['neutral_sources'] = {foundation: sha(workspace/foundation),
                                    contract['root_file']: sha(root)}
        task = {'id': 'neutral-identity', 'statement': '∀ n : Nat, n + 0 = n',
            'hypotheses': [], 'scope': 'Neutral deployment check only',
            'source_sha256': sha(root), 'kind': 'regression', 'interface_type': 'True',
            'transport_type': 'True', 'required_constants': ['MathGKM.DeploymentRoot.identity']}
        solution = {'module': 'MathGKM.DeploymentRoot', 'term': 'MathGKM.DeploymentRoot.identity',
                    'interface_term': 'True.intro', 'transport_term': 'True.intro'}
        positive = check_task(workspace, task, solution, directory/'positive', remaining(),
                              live=True, required=task['required_constants'])
        report['positive'] = positive
        report['positive_resource_evidence']=dict(
            peak_rss_observed=max((c.get('resources',{}).get('peak_rss_observed',0) for c in positive.get('checks',[])),default=0),
            phase_elapsed_ns=[dict(operation=c['operation'],module=c.get('module'),elapsed_ns=c.get('elapsed_ns')) for c in positive.get('checks',[])],
            interpretation='Observed RSS samples, not a continuous bound or provider cost; raw per-process resource receipts retained')
        if not positive.get('checked'):
            raise Invalid('neutral actual-wrapper compilation/replay/premise inspection failed')
        wrong = check_task(workspace, {**task, 'id': 'wrong-target', 'statement': 'False'},
                           solution, directory/'wrong-target', remaining(), live=True)
        missing_task = {**task, 'id': 'neutral-missing-root', 'required_constants': ROOT_REQUIRED}
        missing = check_task(workspace, missing_task, solution, directory/'missing-premise', remaining(),
                             live=True, required=ROOT_REQUIRED)
        report.update(wrong_target=wrong, missing_premise=missing)

        # Exercise the actual completion adapter, while leaving independent
        # correspondence unfulfilled. A diagnostic cannot resolve a study root.
        from .study_completion import check
        (workspace/'research/correspondence.txt').write_text('Neutral identity only. No independent audit supplied.\n')
        arm = NeutralArm(directory, workspace, remaining())
        completed = check(arm, {'kind': 'proof', 'module': solution['module'],
            'declaration': 'MathGKM.DeploymentRoot.identity', 'correspondence': 'research/correspondence.txt'})
        report.update(completion=completed, completion_reservations=arm.reservations,
            completion_state_sha256=sha(arm.root/'state.json'))
        if not accepted_controls(positive, wrong, missing, completed, missing_binding=dict(
                directory=directory/'missing-premise', workspace=workspace, task=missing_task, solution=solution)):
            raise Invalid('neutral positive/negative/completion controls not all established')
        if report['binary_hashes'] != {str(p): sha(p) for p in (LEAN, CHECKER)}:
            raise Invalid('preflight binaries changed')
        if report['source_hashes'] != {str(p.relative_to(ROOT)): sha(p) for p in sorted((ROOT/'machinery').glob('*.py'))}:
            raise Invalid('preflight machinery changed')
        remaining()
        report['ready'] = True
    except (Invalid, OSError, ValueError, KeyError, TypeError) as exc:
        report['failure'] = type(exc).__name__+': '+str(exc)
    report.update(elapsed_seconds=time.monotonic()-start, finished=time.time())
    write(directory/'result.json', report)
    # Bind all retained profiles, neutral sources, compiler/premise artifacts and
    # raw results, including failures. Existing paths are never overwritten.
    files = {str(p.relative_to(directory)): sha(p) for p in directory.rglob('*') if p.is_file()}
    write(directory/'receipt.json', {'result_sha256': sha(directory/'result.json'),
        'files': files, 'files_binding': digest(files), 'ready': report['ready']})
    return report


def require_deployment(directory):
    report = preflight(directory)
    if not report['ready']:
        raise Invalid('deployment preflight failed before research calls; inspect '+str(directory/'result.json'))
    return {'receipt': str(directory/'receipt.json'), 'receipt_sha256': sha(directory/'receipt.json'),
            'elapsed_seconds': report['elapsed_seconds'], 'ready': True}


def verify_receipt(binding):
    if not binding or binding.get('ready') is not True:
        raise Invalid('missing successful deployment preflight')
    path = Path(binding['receipt']).resolve()
    if not path.is_relative_to(ROOT) or sha(path) != binding['receipt_sha256']:
        raise Invalid('deployment receipt binding changed')
    receipt = read(path)
    if receipt.get('ready') is not True or digest(receipt['files']) != receipt['files_binding']:
        raise Invalid('deployment receipt is incomplete')
    for name, expected in receipt['files'].items():
        item = (path.parent/name).resolve()
        if not item.is_relative_to(path.parent) or sha(item) != expected:
            raise Invalid('deployment preflight artifact changed')
    if sha(path.parent/'result.json') != receipt['result_sha256'] or not read(path.parent/'result.json')['ready']:
        raise Invalid('deployment preflight result changed')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--seconds', type=int, default=1200)
    args = parser.parse_args()
    try:
        result = preflight(args.out, args.seconds)
    except Invalid as exc:
        print(str(exc), file=sys.stderr)
        return 2
    print('READY' if result['ready'] else 'FAILED', args.out/'result.json')
    return 0 if result['ready'] else 1


if __name__ == '__main__':
    sys.exit(main())
