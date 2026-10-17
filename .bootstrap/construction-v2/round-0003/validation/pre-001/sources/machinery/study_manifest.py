"""Reproducible source/install manifest; never reads Git or historical research."""
import argparse
import platform
from pathlib import Path
import sys
from .study_common import ROOT, SEED, read, write, sha

def generate(output):
    before = {}
    paths = set(SEED)
    for folder in ('machinery', 'tests', 'contracts', 'docs', 'studies', 'MathGKM'):
        paths.update(str(p.relative_to(ROOT)) for p in (ROOT/folder).glob('*')
                     if p.is_file() and p.suffix in ('.py', '.json', '.md', '.lean'))
    files = []
    for name in sorted(paths):
        p = ROOT/name
        after = sha(p) if p.is_file() else None
        files.append({'path': name, 'before_sha256': before.get(name), 'after_sha256': after,
                      'status': 'unchanged' if before.get(name) == after else 'new' if name not in before else 'changed'})
    protected = {name: {'before_sha256': sha(ROOT/name), 'after_sha256': sha(ROOT/name)} for name in SEED}
    if any(v['before_sha256'] != v['after_sha256'] for v in protected.values()):
        raise ValueError('protected input changed')
    logs = {str(p.relative_to(ROOT)): sha(p) for p in (ROOT/'evidence/neutral-validation').glob('*.log')}
    result = {'schema': 'math-gkm.install-manifest.v2', 'phase': 'construction',
        'status': 'reviewable experimental sources; no live installation/migration/publication',
        'source_files': files, 'protected_inputs': protected,
        'validation_logs': logs, 'python': {'executable': sys.executable, 'version': platform.python_version()},
        'dependency_pins': {'lean-toolchain': (ROOT/'lean-toolchain').read_text().strip(),
            'lake-manifest.json': sha(ROOT/'lake-manifest.json'), 'lakefile.toml': sha(ROOT/'lakefile.toml')},
        'reproduce': [
            '/opt/homebrew/bin/python3 -m unittest tests.test_revision_static_checkpoint tests.test_context_revision -v',
            '/opt/homebrew/bin/python3 -m machinery.study_manifest'],
        'install': 'No live activation. Explicit USER OK after the final harness report remains required. No old run resumes.',
        'limitations': ['No live Codex invocation tested by builder',
            'Nested sandbox-exec denied by managed builder environment; live validator fails closed',
            'Provider token semantics/prices unverified; only raw usage and time/call caps',
            'Independent holdout relevance and published-source correspondence need actual independent review',
            'No modeled whole-continuation improvement proof or Python/LLM implementation bridge',
            'General Lean elaboration remains trusted executable code; not a hostile-code admission service']}
    write(output, result)
    return result

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, default=ROOT/'evidence/construction-v2/install-manifest.json')
    args = parser.parse_args()
    result = generate(args.out)
    print('Wrote', args.out, 'with', len(result['source_files']), 'source hashes; protected inputs unchanged.')
