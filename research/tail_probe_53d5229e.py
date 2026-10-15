"""Machine-authored symbolic reversed-tail certificates; not Lean proofs."""
from pathlib import Path
from uniform_shape_8bbb import Q,var,subst,horner
import json
O=Path('evidence/markov-53d5229e');d=json.loads((O/'third-band-probe.json').read_text())
n,c,r,k=map(var,range(4)); tails={ch:subst(Q({tuple(a):b for a,b in ts}),[n,c,r,3*n+3-k]) for ch,ts in d['shapes'].items()}
t,u,v,w=map(var,range(4));records=[];gaps={}
for name,ch,cc,rr in [('low_large','low',2*u+v+4,u+2),('low_one','low',v+4,1),('high_large','high',u+2*v+4,u+v+2),('high_one','high',u+4,u+3)]:
 for shift in [0,1,2,3]:
  p=tails[ch];vs=[0,cc,rr,t+shift]
  gap=subst(p,vs)**2-subst(p,[*vs[:3],t+shift-1])*subst(p,[*vs[:3],t+shift+1])
  neg=[(k,int(x)) for k,x in gap.items() if x<0]
  records.append(dict(name=name,shift=shift,terms=len(gap),negatives=len(neg),examples=neg[:5]))
  gaps[name+str(shift)]=[[k,int(v)] for k,v in sorted(gap.items())]
(O/'tail-probe.json').write_text(json.dumps(dict(tails={ch:[[k,int(v)] for k,v in sorted(p.items())] for ch,p in tails.items()},records=records,gaps=gaps),indent=2)+'\n')
print(json.dumps(records),flush=True)
