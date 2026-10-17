"""Machine-authored exact middle-row exploratory computations, not proofs."""
from pathlib import Path
from three_probe_9e205206 import frame
from source_experiment_55cf20d2 import upper
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-99a0f3b8')
def run():
 start=time.monotonic();out=dict(samples=[],cases=0,template_lc_failures=[],correction_signs=[0,0,0],source_lc_failures=[])
 for q in list(range(2,31))+[40,60]:
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r])
   for t in range(q+3,n//2+1):
    j=n+2-t
    A=[p.get((i,j),0) for i in range(t+3)];B=[upper(n,t,i) for i in range(t+3)]
    D=[x-y for x,y in zip(A,B)]
    out['cases']+=1
    if q in [6,10,20] and t<=q+6:out['samples'].append(dict(q=q,r=r,n=n,t=t,j=j,raw=A,template=B,correction=D))
    for v in D:out['correction_signs'][(v>0)-(v<0)+1]+=1
    for i in range(len(A)-2):
     if A[i]*A[i+2]>A[i+1]**2:out['source_lc_failures'].append([q,r,t,i])
     if B[i]*B[i+2]>B[i+1]**2 and len(out['template_lc_failures'])<30:out['template_lc_failures'].append([q,r,t,i,B[i:i+3]])
 out.update(seconds=time.monotonic()-start,status='exact finite experiment only')
 (O/'middle-probe.json').write_text(json.dumps(out,indent=2))
 print(json.dumps({k:v for k,v in out.items() if k!='samples'}))
 for z in out['samples'][:8]:print(json.dumps(z))
if __name__=='__main__':run()
