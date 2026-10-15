"""Machine-authored axiom inventory; compilation and replay remain required."""
from pathlib import Path
import re,json,sys,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-062809ba'
mods=['MarkovFourthLowerK062','MarkovFourthGauge2K062','MarkovFourthGauge3K062']
for w in ['Two','Three']:
 mods += ([f'MarkovFourthThreeCert{z}K062' for z in range(6)] if w=='Three' else [])
 mods += [f'MarkovFourth{w}LocalK062']+[f'MarkovFourth{w}{z}K062' for z in range(6)]
mods += [f'MarkovFourthShort{n}{c}{r}K062' for n in [2,3] for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]]
mods += ['MarkovFourthTwoSourceK062','MarkovFourthThreeSourceK062','MarkovResidualTwoK062','MarkovResidualK062']
if '--ready' in sys.argv:
 runs=[json.loads(p.read_text()) for p in O.glob('run-*.json')]
 planned=mods
 mods=[m for m in mods if any(d.get('returncode')==0 and d.get('mode')=='build' and d.get('source')==f'research/{m}.lean' and d.get('sha256')==hashlib.sha256((R/'research'/f'{m}.lean').read_bytes()).hexdigest() for d in runs)]
 (O/'pending-modules.json').write_text(json.dumps(dict(pending=[m for m in planned if m not in mods],status='Generated source only; no accepted theorem claim'),indent=2)+'\n')
theorems=[(m,n) for m in mods for n in re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M)]
s=''.join(f'import {m}\n' for m in mods)+'/-! Machine-authored 062809ba axiom closure audit. -/\n'
s+=''.join(f'#print axioms MathGKM.Markov.{n}\n' for m,n in theorems)
(R/'research/MarkovAuditK062.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=mods,theorems=theorems),indent=2)+'\n')
print(json.dumps(dict(modules=len(mods),theorems=len(theorems))))
