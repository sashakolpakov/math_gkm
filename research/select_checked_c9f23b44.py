"""Machine-authored c9f23b44. Freeze only successfully compiled current-source modules.
Incomplete assembly candidates remain preserved and explicitly unaccepted.
"""
from validate_c9f23b44 import *
intended=json.loads((O/'mathematical-modules.json').read_text())
(O/'intended-mathematical-modules.json').write_text(json.dumps(intended,indent=2)+'\n')
receipts=[json.loads(p.read_text()) for p in O.glob('build-*.json')]
accepted=[];pending=[]
for m in intended:
 h=sha(R/'research'/f'{m}.lean')
 if any(d.get('returncode')==0 and d.get('modules',{}).get(m)==h for d in receipts):accepted.append(m)
 else:pending.append(m)
(O/'mathematical-modules.json').write_text(json.dumps(accepted,indent=2)+'\n')
(O/'scope-freeze.json').write_text(json.dumps(dict(accepted=accepted,pending=pending,root_status='Unresolved',reduced_pair_positivity='Unproved unless full assembly is selected',source_consequence='No new lower-horizontal source result without full assembly',completion=None),indent=2)+'\n')
print(json.dumps(dict(accepted=len(accepted),pending=pending)))
