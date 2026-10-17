"""Machine-authored exploration outside the inherited top parameter domain."""
from exact_integer_experiment_73199834 import scalar,cut
from top_parameter_probe_dcb64029 import M
from math import comb
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-99a0f3b8')
start=time.monotonic();out=dict(groups=0,failures=[],total_failures=[],totals=0)
for i in [0,1,2,3,5,6,10,20,50]:
 for r in [1,2,5,10,20,50,100]:
  for d in sorted(set([0,1,i,max(0,r-i),r,i+r])):
   a=i+1;H=d+2*i+9
   ts=[comb(i+k,i)*comb(H+k-1,i+3) for k in range(2*r+1)]
   for m in sorted(set([2,r, r+1,3*r//2,2*r-1,2*r])):
    if not 2<=m<=2*r:continue
    z=sum(ts[k]*ts[m-k]*cut(r,k)*cut(r,m-k)*scalar(a,H,k,m-k) for k in range(m+1))
    out['groups']+=1
    if z<=0 and len(out['failures'])<30:out['failures'].append([d,i,r,m,z])
   vals=[M(d,i+r,k) for k in [i,i+1,i+2]];out['totals']+=1
   if vals[1]**2<=vals[0]*vals[2] and r>=2:out['total_failures'].append([d,i,r])
out['seconds']=time.monotonic()-start
(O/'group-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
