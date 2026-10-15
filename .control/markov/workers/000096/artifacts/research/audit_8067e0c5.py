"""Machine-authored axiom inventory; only matching successful current-source builds."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
accepted={}
for d in runs:
 if d.get('returncode')==0 and d.get('mode')=='build' and 'AuditM806' not in d['source'] and not re.search(r'MarkovOnsetL(?:Checked)?[1-4]M96',d['source']) and sha(R/d['source'])==d['sha256']:
  accepted[Path(d['source']).stem]=dict(module=Path(d['source']).stem,source=d['source'],sha256=d['sha256'],build=d['receipt'])
names=[]
for d in accepted.values():names.extend(re.findall(r'^theorem\s+(\w+)',(R/d['source']).read_text(),re.M))
assert len(names)==len(set(names))
s=''.join('import '+m+'\n' for m in accepted)+'/-! Machine-authored 8067e0c5. Local axiom inventory. -/\n'
s+=''.join('#print axioms MathGKM.Markov.'+n+'\n' for n in names)
(R/'research/MarkovAuditM806.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=list(accepted),theorems=names,accepted=list(accepted.values())),indent=2)+'\n')
print(dict(modules=len(accepted),theorems=len(names)))
