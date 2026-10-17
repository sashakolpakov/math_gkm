"""Machine-authored 7a344181. Exact finite checks; these do not prove universality."""
from pathlib import Path
from math import comb
from collections import defaultdict
import json,time,hashlib
from three_probe_9e205206 import frame
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-7a344181'
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def run():
 t=time.monotonic()
 out={'status':'finite experiment, not a theorem','q_range':[1,32],
      'source_coefficients':0,'zero_coefficients':0,'lower_triples':0,'polygon_triples':0,'failures':[]}
 for q in range(1,33):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert (a,n)==(3,3*q+(1 if r else 2))
   for j in range(q+1):
    d=n-2*j-1
    h=[C(j+3,k+3)*C(d+j+k+3,k)+4*sum((j-s)*C(s+3,k+3)*C(d+s+k+3,k) for s in range(j)) for k in range(j+1)]
    vals=[]
    for i in range(n+7):
     actual=p.get((i,j),0)
     predicted=sum(v*C(d,i-3-k) for k,v in enumerate(h))
     out['source_coefficients']+=1;out['zero_coefficients']+=actual==0
     if actual!=predicted:out['failures'].append(['formula',q,r,i,j,actual,predicted])
     vals.append(actual)
    for i in range(len(vals)-2):
     out['lower_triples']+=1
     inside=lambda k:3*n<=n*k+3*j and k+j<=n+2
     out['polygon_triples']+=all(inside(k) for k in [i,i+1,i+2])
     if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['inequality',q,r,i,j,vals[i:i+3]])
 out['seconds']=time.monotonic()-t
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':run()
