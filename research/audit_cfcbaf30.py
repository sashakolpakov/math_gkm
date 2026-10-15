"""Machine-authored source-bound axiom audit generator for successful current builds."""
from validate_cfcbaf30 import R,O,sha
import json,re,sys
tag=sys.argv[1] if len(sys.argv)>1 else 'Final'
accepted={}
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text());m=(R/d['source']).stem
 if d.get('returncode')==0 and d['mode']=='build' and sha(R/d['source'])==d['sha256'] and 'Audit' not in m:
  accepted[m]=d
s=''.join(f'import {m}\n' for m in sorted(accepted))
names=[]
for m,d in sorted(accepted.items()):
 names+=re.findall(r'^theorem (\w+)',(R/d['source']).read_text(),re.M)
s+='\n/-! Machine-authored operational axiom inspection, not an independent audit. -/\n'
s+=''.join(f'#print axioms MathGKM.Markov.{n}\n' for n in names)
m=f'MarkovAudit{tag}MCFC';(R/f'research/{m}.lean').write_text(s)
(O/f'audit-{tag}-inventory.json').write_text(json.dumps(dict(modules={m:d['sha256'] for m,d in accepted.items()},names=names),indent=2)+'\n')
print(json.dumps(dict(module=m,modules=len(accepted),declarations=len(names))))
