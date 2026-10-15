"""Machine-authored operational experiment: unchanged pinned dependencies first in search path."""
from pathlib import Path
import json
O=Path('/Users/sasha/math_gkm/evidence/markov-5dc9c88d')
old=json.loads((O/'inherited-lean-path.json').read_text()).split(':')
deps=[p for p in old if '/.lake/' in p or '/.elan/' in p]
project=[p for p in old if p not in deps]
new=deps+project
assert set(new)==set(old)
(O/'optimized-lean-path.json').write_text(json.dumps(':'.join(new))+'\n')
(O/'path-order.json').write_text(json.dumps(dict(old=old,new=new,reason='Avoid probing every historical project evidence directory for each Mathlib module. Only directory lookup order changes; packages remain pinned and unchanged.'),indent=2)+'\n')
print(len(deps),'dependency roots moved before',len(project),'project roots')
