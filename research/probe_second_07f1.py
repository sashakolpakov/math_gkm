"""Machine-authored symbolic probes of the next band; not source proofs."""
from pathlib import Path
from fractions import Fraction
import json,time
from uniform_shape_8bbb import Q,var,subst,choose,horner
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
p=Q({tuple(k):v for k,v in json.loads((R/'evidence/markov-8bbb934e/uniform-shape.json').read_text())['coefficient_terms']})
n,c,r,j=map(var,range(4)); second=p.copy();second=Q(second)
tail=[]
for kk,vv in data['numerator']:
 k=tuple(kk);v=Fraction(vv)
 if k[1]!=1:continue
 assert not any(k[4:7])
 tail.append((k,v))
 second=second+15*v*n**k[0]*c**k[2]*r**k[3]*choose(j-n-k[7]+5,5)
assert all(Fraction(v).denominator==1 for v in second.values())
t,s,u,v=map(var,range(4)); records=[]
# Center j=n+k+2; k=t+3, n=k+s+1, so neighbors lie inside second band.
for shift in [1,0,-1]:
 nn=t+s+3+shift;jj=nn+t+5
 vs=[nn,u+v+2,u+1,jj]
 left=subst(second,[*vs[:3],jj-1]);center=subst(second,vs);right=subst(second,[*vs[:3],jj+1]);gap=center**2-left*right
 neg=[(k,int(x)) for k,x in gap.items() if x<0]
 records.append(dict(kind='interior',n_shift=shift,terms=len(gap),negative_terms=neg[:20],negative_count=len(neg)))
# Three crossing centers n+1,n+2,n+3: retain the literal truncated tail sums.
for offset in [1,2,3]:
 nn=t+4
 vals=[]
 for d in [-1,0,1]:
  jj=nn+offset+d
  val=subst(p,[nn,u+v+2,u+1,jj])
  from math import comb
  for k,w in tail:
   m=offset+d-k[7]
   if m>=0:val=val+15*w*nn**k[0]*(u+v+2)**k[2]*(u+1)**k[3]*comb(m+5,5)
  vals.append(val)
 gap=vals[1]**2-vals[0]*vals[2]
 neg=[(k,int(x)) for k,x in gap.items() if x<0]
 records.append(dict(kind='crossing',center_offset=offset,terms=len(gap),negative_count=len(neg),negative_terms=neg[:20]))
out=dict(status='Exact rational symbolic experiments, not universal source proof',second_terms=[[k,int(v)] for k,v in sorted(second.items())],records=records)
(O/'second-band-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(records),flush=True)
