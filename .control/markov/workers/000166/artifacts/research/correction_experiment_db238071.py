"""Machine-authored db238071. Exact first-correction experiment, not a proof."""
from pathlib import Path
from math import comb
import json,time
from three_probe_9e205206 import frame
O=Path('/Users/sasha/math_gkm/evidence/markov-db238071')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def h(d,j,k):
 return C(j+3,k+3)*C(d+j+k+3,k)+4*sum((j-s)*C(s+3,k+3)*C(d+s+k+3,k) for s in range(j))
def main():
 t=time.monotonic();out={'status':'finite exact experiment only; no universal inference','q_range':[2,50],'source_comparisons':0,'zero_comparisons':0,'residual_cross_pairs':0,'raw_triples':0,'failures':[]}
 for q in range(2,51):
  for r in [False,True]:
   n=3*q+(1 if r else 2);j=q+1;d=q-(2 if r else 1);c=8 if r else 4
   residual=[c]+[h(d,j,k) for k in range(j+1)]
   a,b,p=frame([False]*(q-1)+[True,r]);assert (a,b)==(3,n)
   vals=[]
   for i in range(n+6):
    actual=p.get((i,j),0);pred=sum(v*C(d,i-2-k) for k,v in enumerate(residual));vals.append(actual)
    out['source_comparisons']+=1;out['zero_comparisons']+=actual==0
    if actual!=pred:out['failures'].append(['factor',q,r,i,actual,pred])
   f=lambda k:residual[k] if 0<=k<len(residual) else 0
   for i in range(-2,len(residual)+2):
    for k in range(i,len(residual)+2):
     out['residual_cross_pairs']+=1
     if f(i)*f(k+1)>f(i+1)*f(k):out['failures'].append(['cross',q,r,i,k])
   for i in range(len(vals)-2):
    out['raw_triples']+=1
    if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['raw',q,r,i])
 out['seconds']=time.monotonic()-t
 (O/'correction-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
