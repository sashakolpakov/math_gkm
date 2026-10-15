"""Exact geometric-field tests on actual R^m L^2 source words."""
from activity_b485 import transfer
from pathlib import Path
import json,time
start=time.monotonic();records=[];checks=0
for m in range(1,36):
 a,b=3*m+1,3*m+4;N=b-1;w=(1,)*m+(0,)+(1,)*m+(0,)+(1,)*(m+1)
 assert w==tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
 for q in [2,3,4,8]:
  F=transfer(w,tuple(q**(N-1-k) for k in range(N)))
  vals=[F.get((s,b-1),0) for s in [3,4,5]];checks+=1
  records.append(dict(m=m,a=a,b=b,q=q,values=vals,gap=vals[1]**2-vals[0]*vals[2]))
 if time.monotonic()-start>45:break
out=dict(status='finite exact experiments only; fields are not raw source coefficients',checks=checks,records=records,seconds=time.monotonic()-start)
Path('evidence/markov-b485717c/geometric-family.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(checks=checks,seconds=out['seconds'],first_failures=[next((r for r in records if r['q']==q and r['gap']<0),None) for q in [2,3,4,8]])))
