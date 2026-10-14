"""Machine-authored local receipt index. Not an independent admission authority."""
import hashlib, json, pathlib, re
root = pathlib.Path('/Users/sasha/math_gkm')
out = root / 'evidence/markov-4b57f2c3'
modules, rejected, axioms = {}, [], {}
for log in sorted(out.glob('run-*.json')):
    for rec in json.loads(log.read_text()):
        if rec['returncode']:
            rejected.append(str(log.relative_to(root)))
            continue
        source = rec['source']
        entry = modules.setdefault(source, {'sha256': rec['sha256']})
        kernel = 'leanchecker' in rec['command'][0]
        inherited = 'evidence/markov-21afc594:' in rec['lean_path']
        entry['kernel' if kernel else ('preflight' if inherited else 'compile')] = str(log.relative_to(root))
        for name, aa in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]", rec['stdout']):
            vals = [a.strip() for a in aa.split(',') if a.strip()]
            assert set(vals) <= {'propext', 'Classical.choice', 'Quot.sound'}, (name, vals)
            axioms[name] = vals
paths = ['research/MarkovSource4b5.lean', 'research/validate_source_4b5.py',
         'research/finalize_4b5.py', 'research/markov-4b57f2c3-checkpoint.md',
         'research/markov-4b57f2c3-correspondence.md',
         'evidence/markov-4b57f2c3/capability-timeout.json']
sha = lambda p: hashlib.sha256((root/p).read_bytes()).hexdigest()
assert sha('MathGKM/Markov.lean') == '8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
data = dict(request_id='4b57f2c364b44937ac866aa14bd8c6bb', completion=None,
    independent_audit=False, root_unchanged=True, modules=modules,
    theorem_axioms=axioms, rejected_runs=sorted(set(rejected)),
    artifacts={p:sha(p) for p in paths},
    stop_exists=(root/'.control/markov/STOP.json').exists(),
    remaining=['Newton-polygon equality', 'universal raw inequalities in all three directions',
               'independent hash-bound English/source completion audit'])
(out/'validation.json').write_text(json.dumps(data, indent=2)+'\n')
print(json.dumps(data, indent=2))
