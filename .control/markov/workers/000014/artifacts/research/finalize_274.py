"""Machine-authored evidence summary, not an independent admission gate."""
import pathlib, json, hashlib, time, re
root = pathlib.Path('/Users/sasha/math_gkm')
out = root/'evidence/markov-274e6973'
records = [(p, json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
modules = ['MarkovBlockAssembly274', 'MarkovBlockCounts274',
           'MarkovVerticalFormula274', 'MarkovVerticalLC274',
           'MarkovTruncated274', 'MarkovSmallVertical274']
validation = []
for module in modules:
    p = root/'research'/f'{module}.lean'
    sha = hashlib.sha256(p.read_bytes()).hexdigest()
    matched = [(f, r) for f, r in records if r['source']==str(p.relative_to(root))
               and r['sha256']==sha and r.get('returncode')==0]
    builds = [str(f.relative_to(root)) for f, r in matched if r['command'][0].endswith('/lean')]
    kernels = [str(f.relative_to(root)) for f, r in matched if r['command'][0].endswith('/leanchecker')]
    assert builds and kernels, module
    assert all('sorryAx' not in r['stdout'] for _, r in matched)
    assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b', p.read_text())
    validation.append(dict(module=module, sha256=sha, builds=builds, kernels=kernels))
root_hash = hashlib.sha256((root/'MathGKM/Markov.lean').read_bytes()).hexdigest()
assert root_hash=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
result = dict(modules=validation, root_sha256=root_hash,
              rejected_attempts=[str(p.relative_to(root)) for p,r in records if r.get('returncode')!=0],
              scope='Fresh named modules and kernel replay using inherited compiled imports; not independent full-source validation',
              completion=None)
dest = out/f'validation-{time.time_ns()}.json'
dest.write_text(json.dumps(result, indent=2)+'\n')
print(str(dest.relative_to(root)))
print('All six modules have matching successful build/replay receipts.')
