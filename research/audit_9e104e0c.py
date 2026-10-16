"""Machine-authored source-bound audit inventory. Operational evidence, not certification."""
from validate_9e104e0c import R,O,sha,run
import json,re,sys
accepted={}
for p in sorted(O.glob('build-*.json')):
 d=json.loads(p.read_text())
 if d.get('returncode')!=0:continue
 for m,h in d['modules'].items():
  if 'Audit' in m or sha(R/'research'/f'{m}.lean')!=h:continue
  accepted[m]=dict(sha256=h,receipt=str(p.relative_to(R)))
tag=sys.argv[1]
mod=f'MarkovAudit{tag}M9E1'
s=''.join(f'import {m}\n' for m in accepted)
names=[]
for m in accepted:
 src=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',src)
 names+=re.findall(r'^theorem (\w+)',src,re.M)
s+='\n/-! Machine-authored axiom inspection; no new mathematical declarations. -/\n'
s+=''.join(f'#print axioms MathGKM.Markov.{n}\n' for n in names)
(R/'research'/f'{mod}.lean').write_text(s)
(O/f'audit-{tag}-inventory.json').write_text(json.dumps(dict(modules=accepted,names=names),indent=2)+'\n')
result=run([mod],'build',120)
sys.exit(result.get('returncode',1))
