"""Machine-authored research setup; no controller modifications."""
import pathlib,json,hashlib
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-e5822cfc';o.mkdir(exist_ok=True)
v=json.loads((r/'evidence/markov-26dd33d6/validation-1791952476518063000.json').read_text())
checks=[]
for m in v['modules']:
 p=r/m['source'];h=hashlib.sha256(p.read_bytes()).hexdigest()
 checks.append(dict(path=m['source'],actual=h,expected=m['sha256'],equal=h==m['sha256']))
checks.append(dict(path='MathGKM/Markov.lean',actual=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()))
(o/'reconciliation.json').write_text(json.dumps(dict(latest_status='completed',prior_interruption='already reconciled by f6506bc6',checks=checks),indent=2)+'\n')
s=(r/'research/validate_26dd.py').read_text().replace('markov-26dd33d6','markov-e5822cfc').replace("evidence/markov-4f8ceeeb/run-1791951490611293000.json","evidence/markov-26dd33d6/run-1791952216156985000.json")
(r/'research/validate_e582.py').write_text(s)
print(checks)
