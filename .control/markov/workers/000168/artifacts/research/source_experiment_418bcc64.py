"""Machine-authored 418bcc64. Compare raw recurrence and first-correction formula."""
from pathlib import Path
from math import comb
import json,time
from three_probe_9e205206 import frame
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-418bcc64'
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(d,j,t):
 return C(d+j,t)*C(t+j+3,j)+4*sum((j-s)*C(d+s,t)*C(t+s+3,s) for s in range(j))
def run():
 start=time.monotonic()
 out={'status':'finite source experiment only; not a theorem','q_range':[1,64],
 'coefficients':0,'zeros':0,'triples':0,'polygon_triples':0,'window_triples':0,'failures':[]}
 for q in range(1,65):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert (a,n)==(3,3*q+(1 if r else 2))
   d=q-(2 if r else 1);j=q+1;c=8 if r else 4
   vals=[]
   for i in range(n+7):
    actual=p.get((i,j),0); vals.append(actual)
    if q>=2:
     predicted=0 if i<2 else c if i==2 else L(d,j,i-3)+c*C(d,i-2)
     out['coefficients']+=1;out['zeros']+=actual==0
     if actual!=predicted:out['failures'].append(['formula',q,r,i,actual,predicted])
   for i in range(len(vals)-2):
    out['triples']+=1
    inside=lambda k:3*n<=n*k+3*j and k+j<=n+2
    out['polygon_triples']+=all(inside(k) for k in [i,i+1,i+2])
    out['window_triples']+=q>=2 and 7<=i<=d+2
    if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['inequality',q,r,i,vals[i:i+3]])
 out['seconds']=time.monotonic()-start
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
