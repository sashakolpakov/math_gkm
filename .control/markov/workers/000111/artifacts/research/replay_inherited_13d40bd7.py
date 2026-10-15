"""Machine-authored bounded foreground replay batches, excluding completed batches."""
from validate_13d40bd7 import *
inventory=json.loads((O/'inherited-validation-refreshed.json').read_text())['modules']
done=set()
for base in [O,R/'evidence/markov-cfcbaf30']:
 for p in list(base.glob('replay-*.json'))+list(base.glob('kernel-union-*.json')):
  d=json.loads(p.read_text())
  if d.get('returncode')==0:done.update(m for m,h in d.get('modules',{}).items() if m in inventory and inventory[m]['sha256']==h)
todo=[m for m in sorted(inventory) if m not in done]
which=int(sys.argv[1]); batches=[todo[k:k+3] for k in range(0,len(todo),3)]
for i,mods in enumerate(batches):
 if i%2==which:run(mods,'replay',100)
