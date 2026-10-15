"""Machine-authored exact algebraic crossing-gap exploration."""
from pathlib import Path
from fractions import Fraction
from math import comb
from uniform_shape_8bbb import Q,var,subst,horner
import json
O=Path('evidence/markov-53d5229e');data=json.loads(Path('evidence/markov-bdee9a64/rational-normalization.json').read_text())
second=Q({tuple(k):v for k,v in json.loads(Path('evidence/markov-07f1d410/second-band-probe.json').read_text())['second_terms']})
n,c,r,z=map(var,range(4)); shapes={}; records=[];gaps={}
for ch,q in [('low',0),('high',2*r-c)]:
 vals=[]
 for off in range(1,7):
  p=subst(second,[n,c,r,2*n+off])
  for k,v in data['numerator']:
   if k[1]!=2 or k[7]>off:continue
   p=p+15*Fraction(v)*n**k[0]*c**k[2]*r**k[3]*q**k[4]*comb(off-k[7]+5,5)
  vals.append(p)
 shapes[ch]=[[[k,int(v)] for k,v in sorted(p.items())] for p in vals]
 t,u,v,w=map(var,range(4))
 cases=[('LowLarge',2*u+v+4,u+2),('LowOne',v+4,1)] if ch=='low' else [('HighLarge',u+2*v+4,u+v+2),('HighOne',u+4,u+3)]
 for name,cc,rr in cases:
  for off in range(1,5):
   vs=[t+5,cc,rr,0]
   gap=subst(vals[off],vs)**2-subst(vals[off-1],vs)*subst(vals[off+1],vs)
   neg=[(k,int(x)) for k,x in gap.items() if x<0]
   records.append(dict(name=name,offset=off,terms=len(gap),negatives=len(neg),examples=neg[:4]))
   gaps[name+str(off)]=[[k,int(v)] for k,v in sorted(gap.items())]
(O/'cross-probe.json').write_text(json.dumps(dict(shapes=shapes,records=records,gaps=gaps),indent=2)+'\n');print(json.dumps(records),flush=True)
