"""Machine-authored exact terminal symbolic experiment; not a proof."""
from pathlib import Path
from uniform_shape_8bbb import Q,var,subst,horner
import json
O=Path('evidence/markov-e2cd486c')
d=json.loads(Path('evidence/markov-53d5229e/tail-probe.json').read_text())
tails={ch:Q({tuple(a):b for a,b in ts}) for ch,ts in d['tails'].items()}
n,c,r,k=map(var,range(4)); records=[];shapes={};gaps={}
for name,q,t,u in [('lo',0,3*r-c,0),('mid',2*r-c,c-r,0),('hi',2*r-c,c-r,3*r-2*c)]:
 tail=tails['low' if name=='lo' else 'high']
 R0=24*t+48*q-72*r+24*c
 R1=24*u-144*t-480*q+744*r-96*r*q+192*r**2-288*c+96*c*q-288*c*r+96*c**2
 vals=[subst(tail,[0,c,r,j]) for j in [1,0,-1,-2]]
 vals[2]=vals[2]+15*R0;vals[3]=vals[3]+15*(6*R0+R1)
 shapes[name]=[[[a,int(b)] for a,b in sorted(v.items())] for v in vals]
 print(name,[horner(v,['n','c','r','k']) for v in vals])
 for offset in [0,1]:
  gap=vals[offset+1]**2-vals[offset]*vals[offset+2]
  gaps[name+str(offset)]=[[a,int(b)] for a,b in sorted(gap.items())]
  print('gap',offset,horner(gap,['n','c','r','k']))
(O/'terminal-probe.json').write_text(json.dumps(dict(shapes=shapes,gaps=gaps),indent=2)+'\n')
