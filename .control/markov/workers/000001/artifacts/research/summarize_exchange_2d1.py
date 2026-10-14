"""Machine-authored local validation manifest; does not admit a root theorem."""
import hashlib, json, pathlib, re
root = pathlib.Path('/Users/sasha/math_gkm')
out = root / 'evidence/markov-2d1cb040'
records = [(str(p.relative_to(root)), r) for p in sorted(out.glob('run-*.json'))
           for r in json.loads(p.read_text())]
sources = ['MathGKM/Markov.lean', 'MathGKM/MarkovIndices.lean',
           'research/MarkovExchange2d1.lean', 'research/MarkovLaurent2d1.lean',
           'research/MarkovProjective2d1.lean']
validation = {}
axioms = {}
for src in sources:
    digest = hashlib.sha256((root/src).read_bytes()).hexdigest()
    same = [(p,r) for p,r in records if r['source']==src and r['sha256']==digest
            and r['returncode']==0]
    compile_ok = [(p,r) for p,r in same if r['command'][0]=='lean']
    kernel_ok = [(p,r) for p,r in same if r['command'][0].endswith('/leanchecker')]
    assert compile_ok and kernel_ok, (src, 'missing successful compile or replay')
    for name, deps in re.findall(r"'([^']+)' depends on axioms: \[([^]]*)\]",
                                 compile_ok[-1][1]['stdout']):
        deps = [x.strip() for x in deps.split(',')]
        assert set(deps) <= {'propext','Classical.choice','Quot.sound'}, (name,deps)
        axioms[name] = deps
    validation[src] = dict(sha256=digest, compile=compile_ok[-1][0], kernel=kernel_ok[-1][0])
assert validation[sources[0]]['sha256']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
result = dict(request_id='2d1cb04012e444d0bf81aa075e38674a', completion=None,
              status='local compiled and kernel-replayed partial bridges',
              independent_audit=False, root_unchanged=True, modules=validation,
              theorem_axioms=axioms,
              rejected_runs=sorted(set(p for p,r in records if r['returncode'])),
              artifacts={s: hashlib.sha256((root/s).read_bytes()).hexdigest() for s in
                         ['research/markov-2d1cb040-correspondence.md',
                          'research/markov-2d1cb040-checkpoint.md',
                          'research/validate_exchange_2d1.py',
                          'research/summarize_exchange_2d1.py']},
              remaining=['formal Laurent coefficient identification and homogeneity',
                         'Newton polygon identification',
                         'universal raw inequalities in all three directions',
                         'independent hash-bound English/source closure audit'])
(out/'validation.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
