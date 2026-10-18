"""Bounded neutral deployment preflight. No hosted model or research inputs.

Run in the approved host context:
  /opt/homebrew/bin/python3 -m machinery.study_deployment --out .scratch/FRESH_NAME
Exit 0 requires the real sandbox, fresh Lean/kernel/premise checks, rejected
negative controls, and the actual completion adapter's exact-root check. This
is operational evidence for independent review, never a self-certification.
"""
import argparse
from pathlib import Path
import platform
import sys
import time
import shutil
from types import SimpleNamespace

from .study_common import ROOT, Invalid, digest, read, sha, write, dependencies, dependency_identity
from .study_transfer import check_task, sandbox_prefix
from .trust import CORE, LEAN, CHECKER, environment
from .process import run


def accepted_controls(positive, wrong_target, missing_premise, completion):
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
        not missing_premise.get('checked') and
        'inspector' in missing_premise.get('failure', '').lower() and
        any(c['operation'] == 'trusted_premise_inspection' and
            c.get('returncode') == 1 and not c.get('termination') and
            'consumer does not use MathGKM.DeploymentRoot.Root' in c.get('stdout', '')
            for c in missing_premise.get('checks', [])) and
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
        missing = check_task(workspace, task, solution, directory/'missing-premise', remaining(),
                             live=True, required=['MathGKM.DeploymentRoot.Root'])
        report.update(wrong_target=wrong, missing_premise=missing)

        # Exercise the actual completion adapter, while leaving independent
        # correspondence unfulfilled. A diagnostic cannot resolve a study root.
        from .study_completion import check
        (workspace/'research/correspondence.txt').write_text('Neutral identity only. No independent audit supplied.\n')
        reservations = []
        arm = SimpleNamespace(p={'transport': 'live', 'validation_seconds': remaining()},
            root=directory/'completion-adapter', workspace=workspace, s={'round': 0},
            reserve=lambda key, cap: reservations.append({'key': key, 'seconds': cap}),
            stopped=lambda: False)
        completed = check(arm, {'kind': 'proof', 'module': solution['module'],
            'declaration': 'MathGKM.DeploymentRoot.identity', 'correspondence': 'research/correspondence.txt'})
        report.update(completion=completed, completion_reservations=reservations)
        if not accepted_controls(positive, wrong, missing, completed):
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
