"""Machine-authored 6576ccc5. Reproduce tested and rejected auxiliary routes."""
from pathlib import Path
from math import comb
import json,time
from source_experiment_6576ccc5 import positive
O=Path('/Users/sasha/math_gkm/evidence/markov-6576ccc5')
C=lambda n,k:comb(n,k) if 0<=k<=n else 0
get=lambda a,i:a[i] if 0<=i<len(a) else 0
def H(d,s,m):return C(s+1,m+1)*C(d+s+m+1,m)
start=time.monotonic()
out=dict(status='finite auxiliary experiments only',d_values=list(range(21)),k_bound=40,mixed_checks=0,mixed_failures=[],midpoint_checks=0,midpoint_failures=0,midpoint_examples=[],edge_ratio_checks=0,edge_ratio_failures=0,edge_ratio_examples=[])
for d in out['d_values']:
    S=[];T=[]
    for k in range(out['k_bound']+1):
        F=[H(d,k,m) for m in range(k+1)]
        for name,A,B in [('prefix_H',S,F),('double_H',T,F),('double_prefix',T,S)]:
            for m in range(max(len(A),len(B))-2):
                gap=2*get(A,m+1)*get(B,m+1)-get(A,m)*get(B,m+2)-get(A,m+2)*get(B,m)
                out['mixed_checks']+=1
                if gap<0 and len(out['mixed_failures'])<20:out['mixed_failures'].append([d,k,m,name,gap])
        S=[get(S,i)+F[i] for i in range(k+1)];T=[get(T,i)+S[i] for i in range(k+1)]
        for r in [False,True]:
            Q=positive(d,k,r)
            for m in range(k-1):
                gap=Q[m+1]*(m+2)*(m+3)-Q[m]*(k-m-1)*(d+k+m+3)
                out['edge_ratio_checks']+=1
                if gap<0:
                    out['edge_ratio_failures']+=1
                    if len(out['edge_ratio_examples'])<12:out['edge_ratio_examples'].append([d,k,r,m,gap])
for d in range(10):
 for s in range(20):
  for t in range(20):
   for m in range(10):
    out['midpoint_checks']+=1
    gap=H(d,(s+t)//2,m+1)*H(d,(s+t+1)//2,m+1)-H(d,s,m)*H(d,t,m+2)
    if gap<0:
     out['midpoint_failures']+=1
     if len(out['midpoint_examples'])<12:out['midpoint_examples'].append([d,s,t,m,gap])
out['seconds']=time.monotonic()-start
(O/'prefix-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
