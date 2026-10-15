"""Machine-authored source-bound local axiom inventory, no completion claim."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-00a02b28'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
accepted={}
for d in runs:
 if d.get('returncode')==0 and d.get('mode')=='build' and 'MarkovAudit' not in d['source'] and sha(R/d['source'])==d['sha256']:
  m=Path(d['source']).stem
  accepted[m]=dict(module=m,source=d['source'],sha256=d['sha256'],build=d['receipt'])
all_names=[]
for d in accepted.values():all_names.extend(re.findall(r'^theorem\s+(\w+)',(R/d['source']).read_text(),re.M))
# Audit the public source closures, which transitively include all used staged
# certificate lemmas. Do not repeatedly traverse every large internal proof.
selected=['source_fourth_onsetM00','source_fourth_after_middleM00',
 'run_fourth_iff_middleM00','root_iff_coreM00','root_iff_core_lowM00','source_fourth_onset_lowM00','source_fourth_after_middle_lowM00','pen_convolutionM00']
selected += [f'source_fourth_middle_value{ch}M00' for ch in range(6)]
if 'source_fourth_onsetM00' not in all_names:
 selected += [f'source_fourth_onset_chamber{ch}M00' for ch in range(6)]
names=[n for n in selected if n in all_names]
assert len(names)==len(set(names))
s=''.join('import '+m+'\n' for m in accepted)+'/-! Machine-authored 00a02b28. Local axiom inventory. -/\n'
s+=''.join('#print axioms MathGKM.Markov.'+n+'\n' for n in names)
(R/'research/MarkovAuditM00.lean').write_text(s)
(O/'audit-inventory.json').write_text(json.dumps(dict(modules=list(accepted),theorems=names,all_named_theorems=all_names,scope='Selected public source theorem closures, including every transitive dependency actually used; not a separate printout for each internal helper.',accepted=list(accepted.values())),indent=2)+'\n')
print(dict(modules=len(accepted),theorems=len(names)))
