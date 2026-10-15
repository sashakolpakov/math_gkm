"""Machine-authored exact chamber-gap experiment."""
from pathlib import Path
from uniform_shape_8bbb import Q,var,subst,horner
import json
O=Path('evidence/markov-e2cd486c');d=json.loads((O/'terminal-probe.json').read_text())
u,v,_,_=map(var,range(4)); rec=[]
for name,g in d['gaps'].items():
 if name=='lo1' or name=='mid1':continue
 p=Q({tuple(a):b for a,b in g})
 for a,b in [(0,0),(1,0),(0,1),(1,1),(2,0),(0,2)]:
  w,z=u+a,v+b
  c,r=(3*w+2*z,w+z) if name.startswith('lo') else ((3*w+2*z,2*w+z) if name.startswith('mid') else (3*w+z,2*w+z))
  gap=subst(p,[0,c,r,0]);neg=[(k,x) for k,x in gap.items() if x<0]
  rec.append(dict(name=name,shift=[a,b],terms=len(gap),negatives=len(neg),examples=neg[:5]))
print(json.dumps(rec,indent=2));(O/'terminal-gap-probe.json').write_text(json.dumps(rec,indent=2)+'\n')
