"""Exact-root experimental validator, separate from the small AST example gate.

General Lean elaboration is trusted code execution under the supplied execution
profile. This is not a hardened hostile-Lean admission service or switch proof.
Independent source/English review is mandatory and cannot be supplied by a worker.
"""
import secrets
import json
from pathlib import Path
import re
import time
import traceback
from .engine import atomic
from .gate import digest, Rejected
from .process import run
from .trust import ROOT, LEAN, CHECKER, CORE, environment, sha

NAME = re.compile(r'[A-Za-z_][A-Za-z_0-9]*(?:\.[A-Za-z_][A-Za-z_0-9]*)*\Z')
ALLOWED = {'propext', 'Classical.choice', 'Quot.sound'}


def without_comments(text):
    """Remove nested Lean comments for conservative source screening."""
    out, i, depth = [], 0, 0
    while i < len(text):
        pair = text[i:i+2]
        if pair == '/-':
            depth += 1
            i += 2
        elif depth and pair == '-/':
            depth -= 1
            i += 2
        elif depth:
            out.append('\n' if text[i] == '\n' else ' ')
            i += 1
        elif pair == '--':
            end = text.find('\n', i)
            i = len(text) if end < 0 else end
        else:
            out.append(text[i])
            i += 1
    return ''.join(out)


def prepare(contract, claim):
    if claim.get('kind') not in ('proof', 'refutation'):
        raise Rejected('unknown completion kind')
    if any(not NAME.fullmatch(claim.get(k, '')) for k in ('module', 'declaration')):
        raise Rejected('invalid Lean name')
    if sha(ROOT/contract['root_file']) != contract['root_sha256']:
        raise Rejected('pinned root changed')
    sources, ordered, visiting = {}, [], set()

    def visit(module):
        if module in sources:
            return
        if module in visiting:
            raise Rejected('cyclic imports')
        visiting.add(module)
        path = ROOT/(module.replace('.', '/')+'.lean')
        if not path.is_file() or path.is_symlink() or not (module == 'MathGKM' or module.startswith('MathGKM.')):
            raise Rejected('completion project module must be ordinary MathGKM source')
        raw = path.read_text()
        screened = without_comments(raw)
        # Conservative lexical rejection, in addition to checked axiom closure.
        if re.search(r'\b(sorry|admit|axiom|native_decide)\b', screened):
            raise Rejected('forbidden proof construct in '+module)
        for line in screened.splitlines():
            line = line.lstrip()
            if line.startswith('import '):
                for dep in line[7:].split('--')[0].split():
                    if not NAME.fullmatch(dep):
                        raise Rejected('unsupported import syntax')
                    if dep == 'MathGKM' or dep.startswith('MathGKM.'):
                        visit(dep)
                    elif not any((p/(dep.replace('.', '/')+'.olean')).is_file() for p in dependency_paths()):
                        raise Rejected('import not in pinned dependencies: '+dep)
        visiting.remove(module)
        sources[module] = {'sha256': sha(path), 'text': raw}
        ordered.append(module)
    visit(contract['root_file'][:-5].replace('/', '.'))
    visit(claim['module'])
    correspondence = ROOT/claim['correspondence']
    if not correspondence.resolve().is_relative_to(ROOT) or any(x in correspondence.parts for x in ('.git', '.bootstrap')):
        raise Rejected('invalid correspondence path')
    if not correspondence.is_file():
        raise Rejected('missing correspondence argument')
    binding = {'contract_hash': digest(contract), 'claim': claim,
               'sources': {m: v['sha256'] for m, v in sources.items()},
               'correspondence_sha256': sha(correspondence)}
    return {'binding': binding, 'bundle_hash': digest(binding), 'sources': sources, 'order': ordered}


def dependency_paths():
    return [CORE] + [p/'.lake/build/lib/lean' for p in sorted((ROOT/'.lake/packages').iterdir())]


def verify(contract, claim, directory, *, audit=None, stop=lambda: False):
    directory.mkdir(parents=True, exist_ok=True)
    result = {'resolved': False, 'kind': claim.get('kind'), 'checks': [], 'started': time.time()}
    try:
        bundle = prepare(contract, claim)
        result.update(bundle_hash=bundle['bundle_hash'], binding=bundle['binding'])
        atomic(directory/'bundle.json', bundle['binding'])
        source, build = directory/'source', directory/'build'
        if source.exists() or build.exists():
            raise Rejected('completion requires a fresh source/object directory')
        source.mkdir()
        build.mkdir()
        from .study_transfer import validation_dependencies
        env = environment([build]+validation_dependencies(ROOT, [v['text'] for v in bundle['sources'].values()]))
        env['TMPDIR'] = str(directory)
        from .study_common import ROOT as pinned_root
        result.update(launch_environment=env,dependency_paths=env['LEAN_PATH'].split(':')[1:],
            pin_hashes={n:sha(pinned_root/n) for n in ('lean-toolchain','lakefile.toml','lake-manifest.json')})
        for module in bundle['order']:
            relative = Path(module.replace('.', '/'))
            path = source/relative.with_suffix('.lean')
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(bundle['sources'][module]['text'])
        wrapper = ('import '+claim['module']+'\nimport '+contract['root_file'][:-5].replace('/', '.')+'\n'
            'theorem ControllerRootCheck : '+('Not ' if claim['kind'] == 'refutation' else '')+
            contract['root_declaration']+' := @'+claim['declaration']+'\n'
            '#print axioms ControllerRootCheck\n')
        (source/'ControllerCompletion.lean').write_text(wrapper)
        from . import proof_audit
        inspection_nonce = secrets.token_hex(32)
        inspector = proof_audit.inspector('ControllerCompletion', ('ControllerRootCheck',), artifact='declarations.json', nonce=inspection_nonce)
        result['inspection_schema'] = proof_audit.SCHEMA
        (source/'ControllerInspect.lean').write_text(inspector)
        binaries = {str(p): sha(p) for p in (LEAN, CHECKER)}
        # Reject a wrong closed target before spending time on kernel replay.
        for operation in ('compile', 'kernel_replay'):
            result['controller_stage'] = operation
            for module in bundle['order']+['ControllerCompletion']:
                if stop():
                    raise Rejected('validation stopped')
                relative = Path(module.replace('.', '/'))
                output = build/relative.with_suffix('.olean')
                output.parent.mkdir(parents=True, exist_ok=True)
                argv = ([str(LEAN), '-j', '1', '-o', str(output), str(relative.with_suffix('.lean'))]
                        if operation == 'compile' else [str(CHECKER), module])
                record = run(argv, cwd=source, env=env, timeout=1800, output_bytes=1048576)
                result['checks'].append({'module': module, 'operation': operation, **record})
                atomic(directory/'result.json', result)
                if record['returncode'] or record['termination']:
                    raise Rejected('Lean '+operation+' failed: '+module)
        objects = {str(p.relative_to(build)): sha(p) for p in build.rglob('*') if p.is_file()}
        result['controller_stage'] = 'trusted_premise_inspection'
        inspected = run([str(LEAN), '-j', '1', 'ControllerInspect.lean'], cwd=source,
                        env=env, timeout=1800, output_bytes=1048576)
        result['checks'].append({'operation': 'trusted_premise_inspection', **inspected})
        if inspected['returncode'] and (source/'ControllerInspect.lean').read_text()==inspector:
            result['trusted_inspector_failure']=proof_audit.failure_artifact(source/'declarations.json',('ControllerRootCheck',),inspected,nonce=inspection_nonce)
        result['declarations'] = proof_audit.parse_artifact(inspected, ('ControllerRootCheck',), source/'declarations.json', nonce=inspection_nonce)
        result['producer_completion'] = result['declarations'][0]['producer_completion']
        result['declaration_artifact_sha256'] = sha(source/'declarations.json')
        if result['declaration_artifact_sha256'] != result['declarations'][0]['artifact_sha256']:
            raise Rejected('inspector artifact changed after parsing')
        result['axioms'] = result['declarations'][0]['axioms']
        if objects != {str(p.relative_to(build)): sha(p) for p in build.rglob('*') if p.is_file()}:
            raise Rejected('checked object changed during inspection')
        if (source/'ControllerCompletion.lean').read_text() != wrapper or (source/'ControllerInspect.lean').read_text() != inspector:
            raise Rejected('trusted validator source changed')
        if any((source/(m.replace('.', '/')+'.lean')).read_text() != v['text'] for m, v in bundle['sources'].items()):
            raise Rejected('staged candidate source changed')
        if binaries != {str(p): sha(p) for p in (LEAN, CHECKER)}:
            raise Rejected('validator binaries changed')
        result.update(object_hashes=objects, binary_hashes=binaries, inspector_sha256=digest(inspector))
        if prepare(contract, claim)['bundle_hash'] != bundle['bundle_hash']:
            raise Rejected('candidate changed during validation')
        result['lean_exact_root_checked'] = True
        if not audit or audit.get('bundle_hash') != bundle['bundle_hash'] or audit.get('accepted') is not True:
            raise Rejected('independent source/English correspondence audit required for this exact bundle')
        if not isinstance(audit.get('reviewer'), str) or not audit['reviewer'].strip():
            raise Rejected('missing independent reviewer identity')
        for obligation in contract['correspondence_obligations']:
            explanation = audit.get('checks', {}).get(obligation)
            if not isinstance(explanation, str) or not explanation.strip():
                raise Rejected('undischarged source obligation: '+obligation)
        result.update(resolved=True, audit=audit, status='mathematically_resolved')
    except (Rejected, OSError, ValueError) as exc:
        result['rejection'] = str(exc)
        result['error_type'] = type(exc).__name__
        result['traceback'] = traceback.format_exc()
        from .own_feedback import diagnostic
        result['controller_diagnostic']=diagnostic(result,exc)
    result['finished'] = time.time()
    atomic(directory/'result.json', result)
    from .retention import retire_build
    retire_build(directory,result)
    from .validation_receipts import finish
    finish(directory,{'contract':contract,'claim':claim,'audit':audit},claim,())
    return result
