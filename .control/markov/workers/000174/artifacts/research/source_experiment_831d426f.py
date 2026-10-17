"""Machine-authored 831d426f. Independent positive sum versus actual recurrence."""
from pathlib import Path
from math import comb
import json,time
from three_probe_9e205206 import frame
from source_experiment_9647c1ba import L,C
from band_experiment_139fed75 import Q
O=Path('/Users/sasha/math_gkm/evidence/markov-831d426f')
def positive(d,k,r):
 a=2 if r else 1
 return [4*sum((3*(k-s)+a)*C(s+1,m+1)*C(d+s+m+1,m) for s in range(k+1)) for m in range(k+1)]
def run():
 t=time.monotonic();out={'status':'finite exact experiment only','q_values':list(range(2,21))+[24,32,50,73],
 'rows':0,'positive_sum_comparisons':0,'source_coefficients':0,'zeros':0,'raw_triples':0,
 'polygon_triples':0,'factor_adjacent':0,'failures':[],'factor_lc_failures':[]}
 for q in out['q_values']:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);N=3*q+(1 if r else 2)
   for k in range((q-(2 if r else 1))//2+1):
    d=q-2*k-(2 if r else 1);j=q+k+1
    h=positive(d,k,r);qr=Q(q,r,k);out['rows']+=1
    for m,(u,v) in enumerate(zip(h,qr)):
     out['positive_sum_comparisons']+=1
     if u!=v:out['failures'].append(['sum',q,r,k,m,u,v])
    for m in range(k-1):
     out['factor_adjacent']+=1
     if h[m]*h[m+2]>h[m+1]**2:out['factor_lc_failures'].append([q,r,k,m,h[m:m+3]])
    vals=[]
    for i in range(N+6):
     v=p.get((i,j),0);vals.append(v);out['source_coefficients']+=1;out['zeros']+=v==0
     pred=L(d,j,i-3)+sum(vv*C(d,i-2-m) for m,vv in enumerate(h))
     if pred!=v:out['failures'].append(['source',q,r,k,i,v,pred])
    for i in range(len(vals)-2):
     valid=all(a*b<=b*x+a*j and x+j<=a+b-1 for x in range(i,i+3))
     out['raw_triples']+=1;out['polygon_triples']+=valid
     if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['source_lc',q,r,k,i,vals[i:i+3],valid])
  (O/'source-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-t
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':run()
