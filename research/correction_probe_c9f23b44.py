"""Machine-authored c9f23b44. Next-route experiment only; no universal inference."""
from pathlib import Path
from math import comb
import json,time
from source_experiment_c9f23b44 import C,candidate
O=Path('/Users/sasha/math_gkm/evidence/markov-c9f23b44')
t=time.monotonic();out=dict(status='finite exact experiment only',q_max=100,mixed_triples=0,mixed_negative_count=0,first_mixed_failures=[],sum_lc_failures=[],binomial_ratio_failures=[])
for q in range(2,101):
 for r in [False,True]:
  n=3*q+(1 if r else 2);j=q+1;d=n-2*j-1;kappa=8 if r else 4
  for i in range(n+5):
   a=[candidate(n,i+s,j) for s in range(3)]
   b=[kappa*C(d,i+s-2) for s in range(3)]
   mixed=2*a[1]*b[1]-a[0]*b[2]-b[0]*a[2]
   out['mixed_triples']+=1
   if mixed<0:
    out['mixed_negative_count']+=1
    if len(out['first_mixed_failures'])<10:out['first_mixed_failures'].append([q,r,i,a,b,mixed])
   if (a[0]+b[0])*(a[2]+b[2])>(a[1]+b[1])**2:out['sum_lc_failures'].append([q,r,i])
out['seconds']=time.monotonic()-t
(O/'correction-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
