"""Machine-authored source-bound axiom audit generator; never changes old evidence."""
from pathlib import Path
import json,re,sys
from validate_0a5fcabe import R,O,sha
tag=sys.argv[1] if len(sys.argv)>1 else 'Final'
accepted={}
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text());m=Path(d['source']).stem
 if d.get('returncode')==0 and d['mode']=='build' and sha(R/d['source'])==d['sha256'] and m.endswith('M0A5') and 'Audit' not in m and m!='MarkovFourCycleLocalM0A5':accepted[m]=d
lines=[];inv={}
for m,d in accepted.items():
 lines.append('import '+m)
 inv[m]=re.findall(r'^theorem (\w+)',(R/d['source']).read_text(),re.M)
lines+=['/-! Machine-authored axiom closure inspection. Not root closure. -/']
for m,names in inv.items():
 for n in names:lines.append('#print axioms MathGKM.Markov.'+n)
module='MarkovAudit'+tag+'M0A5'
(R/'research'/f'{module}.lean').write_text('\n'.join(lines)+'\n')
(O/f'{module}-inventory.json').write_text(json.dumps(dict(modules=inv,sources={m:d['sha256'] for m,d in accepted.items()}),indent=2)+'\n')
print(json.dumps(dict(module=module,modules=len(inv),theorems=sum(map(len,inv.values())))))
