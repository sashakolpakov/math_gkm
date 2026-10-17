"""Machine-authored 139fed75. Exact scalar diagnostic using closed Q0/Q1.
This checks a sufficient criterion, not raw log-concavity.
"""
from source_experiment_9647c1ba import C,lift,F
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-139fed75')
out={'status':'finite sufficient-criterion scan only','q_values':list(range(2,201))+[256,512,1000,2000,10000],
'checks':0,'pass':0,'fail':0,'largest_failed_s':None,'failures_at_ge8':[],'first_failures':[]}
t=time.monotonic()
for q in out['q_values']:
 for r in [False,True]:
  maxk=(q-(2 if r else 1))//2
  ks=range(maxk+1) if q<=200 else sorted({0,1,2,3,maxk//4,maxk//2,maxk-1,maxk})
  for k in ks:
   if k<0:continue
   d=q-2*k-(2 if r else 1);j=q+k+1
   c0=2*(k+1)*(k+2)**2 if r else 2*(k+1)**2*(k+2)
   c1=F(k*(k+1)*(k+2)*(5*(3*k+(5 if r else 1))*d+3*(3*k+(7 if r else 2))*(k+3)),30)
   assert c1.denominator==1
   for s in range(7,min(13,j+1)):
    U=F(c0*d,s+1)+c1;B=C(s+j+3,j);M=lift(j,s+1,0)**2
    N=C(s+j+4,j)**2-B*C(s+j+5,j)
    out['checks']+=1
    if (2*B*U+U*U)*M<=B*B*N:out['pass']+=1
    else:
     out['fail']+=1;out['largest_failed_s']=max(s,out['largest_failed_s'] or 0)
     witness=[q,r,k,s,d,j]
     if s>=8:out['failures_at_ge8'].append(witness)
     if len(out['first_failures'])<20:out['first_failures'].append(witness)
out['seconds']=time.monotonic()-t
(O/'margin-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
