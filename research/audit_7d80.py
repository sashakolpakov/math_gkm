"""Machine-authored printed-axiom and artifact audit; no independent certification."""
import json,pathlib,re,hashlib
out=pathlib.Path('evidence/markov-7d80a785')
v=json.loads((out/'validation.json').read_text());allowed={'propext','Classical.choice','Quot.sound'}
ax={}
for m in v['modules']:
 if not m['compiled']:continue
 vals=set()
 for line in m['axioms']:
  match=re.search(r'\[(.*?)\]',line)
  if match:vals.update(x.strip() for x in match.group(1).split(',') if x.strip())
 ax[m['module']]=dict(axioms=sorted(vals),allowed=vals<=allowed,printed=bool(m['axioms']))
bad=[m for m,x in ax.items() if not x['allowed'] or not x['printed']]
(out/'axiom-audit.json').write_text(json.dumps(dict(status='Printed transitive closures from successful builds only; not independent audit',modules=ax,unexpected=bad),indent=2)+'\n')
print(json.dumps(dict(checked=len(ax),unexpected=bad)))
