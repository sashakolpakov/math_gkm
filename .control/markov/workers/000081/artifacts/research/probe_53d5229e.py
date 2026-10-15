"""Machine-authored symbolic third-band research; computations are not proofs."""
from pathlib import Path
from fractions import Fraction
import json,time
from uniform_shape_8bbb import Q,var,subst,choose,horner
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-53d5229e'
data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
second=Q({tuple(k):v for k,v in json.loads((R/'evidence/markov-07f1d410/second-band-probe.json').read_text())['second_terms']})
n,c,r,j=map(var,range(4)); shapes=[]
for chamber,q in [('low',0),('high',2*r-c)]:
 p=Q(second)
 for k,v in data['numerator']:
  if k[1]!=2:continue
  assert not any(k[5:7])
  p=p+15*Fraction(v)*n**k[0]*c**k[2]*r**k[3]*q**k[4]*choose(j-2*n-k[7]+5,5)
 assert all(Fraction(v).denominator==1 for v in p.values())
 shapes.append((chamber,p))
records=[];t,s,u,v=map(var,range(4)); nn=t+s+4;jj=2*nn+6+t
for chamber,p in shapes:
 cc,rr=(2*u+v+2,u+1) if chamber=='low' else (u+2*v+2,u+v+1)
 for offset in [0,1]:
  vs=[nn,cc+offset,rr,jj]
  gap=subst(p,vs)**2-subst(p,[*vs[:3],jj-1])*subst(p,[*vs[:3],jj+1])
  neg=[(k,int(x)) for k,x in gap.items() if x<0]
  records.append(dict(chamber=chamber,offset=offset,terms=len(gap),negatives=len(neg),examples=neg[:8]))
out=dict(status='Exact symbolic candidate only; source bridge not yet proved',shapes={ch:[[k,int(v)] for k,v in sorted(p.items())] for ch,p in shapes},records=records)
(O/'third-band-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(records),flush=True)
