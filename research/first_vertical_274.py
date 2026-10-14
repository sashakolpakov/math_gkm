"""Machine-authored request 274e6973. Finite exact formula test, not proof."""
import importlib.util, pathlib, json, math, time
spec = importlib.util.spec_from_file_location('scan', 'evidence/markov/scan.py')
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
t = time.monotonic()
failures = []
counts = {'1': 0, '2': 0, 'large': 0}
for path, (a, b, p) in m.generate(35):
    q, r = divmod(b, a)
    if a == 1:
        expected = {k: k+1 for k in range(b)}
    elif a == 2:
        expected = {q+1+k: 4*(k+1) for k in range(q)}
        expected[2*q+1] = 2*(q+1)
    else:
        expected = {}
        for k, c in enumerate([4*(a*k+r) for k in range(q)]+[3*b-1, a+b-1]):
            for z in range(a-2):
                j = b-q+k+z
                expected[j] = expected.get(j, 0)+c*math.comb(a-3, z)
    expected = {j: c for j, c in expected.items() if c}
    actual = {j: c for (i, j), c in p.items() if i == 1}
    counts[str(a) if a < 3 else 'large'] += 1
    if expected != actual:
        failures.append(dict(a=a, b=b, expected=expected, actual=actual))
result = dict(counts=counts, failures=failures, bound=35,
              seconds=time.monotonic()-t, status='finite exact test only')
out = pathlib.Path('evidence/markov-274e6973') / f'first-vertical-{time.time_ns()}.json'
out.write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result))
