"""Machine-authored current-source axiom inventory; excludes rejected attempts."""
from pathlib import Path
import json,re,hashlib,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8ae35b59'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods={}
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text())
 if d.get('mode')!='build' or d.get('returncode')!=0 or 'Audit' in d['source']:continue
 if sha(R/d['source'])!=d['sha256']:continue
 mods[Path(d['source']).stem]=d['source']
name=sys.argv[1] if len(sys.argv)>1 else 'MarkovAllAuditM8AE'
s=''.join(f'import {m}\n' for m in mods)+'/-! Machine-authored request 8ae35b59. Axiom closure audit. -/\n'
names=[]
for m,p in mods.items():
 names+=re.findall(r'^theorem (\w+)',(R/p).read_text(),re.M)
s+=''.join(f'#print axioms MathGKM.Markov.{n}\n' for n in names)
(R/'research'/f'{name}.lean').write_text(s)
(O/f'{name}-inventory.json').write_text(json.dumps(dict(modules=mods,declarations=names),indent=2)+'\n')
print(name,len(mods),'modules;',len(names),'closures')
