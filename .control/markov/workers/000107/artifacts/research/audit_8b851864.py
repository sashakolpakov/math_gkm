"""Machine-authored current-source axiom inventory, not a completion audit."""
from pathlib import Path
import json,re,sys
from validate_8b851864 import R,O,sha
mods={}
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text())
 if d.get('mode')!='build' or d.get('returncode')!=0 or 'Audit' in d['source']:continue
 if sha(R/d['source'])==d['sha256']:mods[Path(d['source']).stem]=d['source']
name=sys.argv[1] if len(sys.argv)>1 else 'MarkovAuditM8B8'
s=''.join(f'import {m}\n' for m in mods)+'/-! Machine-authored request 8b851864. Theorem axiom closure audit. -/\n'
names=[]
for m,p in mods.items():names+=re.findall(r'^theorem (\w+)',(R/p).read_text(),re.M)
s+=''.join(f'#print axioms MathGKM.Markov.{n}\n' for n in names)
(R/'research'/f'{name}.lean').write_text(s)
(O/f'{name}-inventory.json').write_text(json.dumps(dict(modules=mods,declarations=names),indent=2)+'\n')
print(name,len(mods),'modules;',len(names),'closures')
