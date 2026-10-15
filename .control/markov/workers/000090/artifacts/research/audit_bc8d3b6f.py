"""Machine-authored axiom inventory for actually built new modules."""
from pathlib import Path
import re,json,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bc8d3b6f'
runs=[json.loads(p.read_text()) for p in O.glob('run-*.json')]
planned=[p.stem for p in sorted((R/'research').glob('Markov*BC.lean')) if p.stem!='MarkovAuditBC']
mods=[]
for m in planned:
 h=hashlib.sha256((R/'research'/f'{m}.lean').read_bytes()).hexdigest()
 if any(d.get('returncode')==0 and d.get('mode')=='build' and d.get('source')==f'research/{m}.lean' and d.get('sha256')==h for d in runs):mods.append(m)
theorems=[(m,n) for m in mods for n in re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M)]
s=''.join(f'import {m}\n' for m in mods)+'/-! Machine-authored bc8d3b6f axiom audit. -/\n'
s+=''.join(f'#print axioms MathGKM.Markov.{n}\n' for m,n in theorems)
(R/'research/MarkovAuditBC.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=theorems),indent=2)+'\n')
(O/'pending-modules.json').write_text(json.dumps(dict(pending=[m for m in planned if m not in mods],status='Draft only; explicitly excluded from theorem claims'),indent=2)+'\n')
print(json.dumps(dict(modules=len(mods),theorems=len(theorems),pending=[m for m in planned if m not in mods])))
