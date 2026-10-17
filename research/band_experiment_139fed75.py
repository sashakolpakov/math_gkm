"""Machine-authored 139fed75. Exact finite experiments, never universal proofs."""
from pathlib import Path
from math import comb
from functools import lru_cache
import json,time
from source_experiment_9647c1ba import L,C,lift,F
from three_probe_9e205206 import frame
O=Path('/Users/sasha/math_gkm/evidence/markov-139fed75')
def trim(p):
 while p and not p[-1]:p.pop()
 return p
def add(*ps):return trim([sum(p[i] if i<len(p) else 0 for p in ps) for i in range(max(map(len,ps),default=0))])
def scale(p,c):return trim([c*x for x in p])
def mul(p,q):
 a=[0]*(len(p)+len(q)-1)
 for i,x in enumerate(p):
  for j,y in enumerate(q):a[i+j]+=x*y
 return trim(a)
@lru_cache(None)
def fibband(n,k):
 return add(*[[0]*s+[C(k+1,k-s)*C(n-k-1,s)*C(k-s,t) for t in range(k-s+1)] for s in range(k+1)])
def gain(q,r,k):
 if k==0:return [2 if r else 1]
 if r:return add(fibband(q,k),fibband(q+1,k),mul([1,1],fibband(q,k-1)))
 return add(fibband(q,k-1),fibband(q+1,k),mul([1,1],fibband(q+1,k-1)))
@lru_cache(None)
def Q(q,r,k):
 if k==0:return scale(gain(q,r,k),4)
 return add(scale(gain(q,r,k),4),mul([2,-2],Q(q,r,k-1)),scale(mul([1,2,1],Q(q,r,k-2)),-1) if k>=2 else [])
def run():
 start=time.monotonic();out={'status':'finite exact experiment only','source_q':list(range(2,17))+[20,24,32],
 'rows':0,'coefficients':0,'zeros':0,'raw_triples':0,'polygon_triples':0,'budget_checks':0,'residual_lc_checks':0,
 'failures':[],'residual_lc_failures':[],'budget_failures':[],'samples':[]}
 for q in out['source_q']:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);N=3*q+(1 if r else 2)
   for k in range((q-(2 if r else 1))//2+1):
    j=q+k+1;d=N-2*j-1;h=Q(q,r,k)
    assert d>=0
    if len(h)>k+1 or any(x<0 for x in h):out['failures'].append(['shape',q,r,k,h])
    expected0=2*(k+1)*(k+2)**2 if r else 2*(k+1)**2*(k+2)
    if h[0]!=expected0:out['failures'].append(['constant',q,r,k,h[0],expected0])
    vals=[];out['rows']+=1
    for i in range(N+5):
     v=p.get((i,j),0);vals.append(v);out['coefficients']+=1;out['zeros']+=v==0
     pred=L(d,j,i-3)+sum(c*C(d,i-2-m) for m,c in enumerate(h))
     if v!=pred:out['failures'].append(['identity',q,r,k,i,v,pred])
    for i in range(len(vals)-2):
     out['raw_triples']+=1
     inside=all(a*b<=b*x+a*j and x+j<=a+b-1 for x in range(i,i+3))
     out['polygon_triples']+=inside
     if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['raw_lc',q,r,k,i,vals[i:i+3],inside])
    for m in range(len(h)-2):
     out['residual_lc_checks']+=1
     if h[m]*h[m+2]>h[m+1]**2:out['residual_lc_failures'].append([q,r,k,m,h[m:m+3]])
    if len(h)>1:
     for m in range(len(h)-1):
      out['budget_checks']+=1
      if h[m+1]>h[1]*C(j,m):out['budget_failures'].append([q,r,k,m])
    if q in [8,16] and k<=5:out['samples'].append([q,r,k,d,h])
  (O/'band-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'band-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='samples'}))
if __name__=='__main__':run()
