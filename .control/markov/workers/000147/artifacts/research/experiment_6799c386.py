"""Machine-authored exact finite checks of the newly formalized formula.
All observations are computations, not universal mathematical proofs.
"""
from pathlib import Path
from math import comb
from functools import lru_cache
import json,time,sys,hashlib
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw
O=Path('evidence/markov-6799c386')
def rise(m,n):return int(n==0) if m==0 else comb(m+n-1,n)
@lru_cache(None)
def kernel(m,l,s,n):
 z={}
 if n<0:return z
 for c in range(n+1):
  for b in (range(n-c+1) if l else [0]):
   a=n-b-c;j=b+2*c;v=rise(m,a)*rise(l,b)*rise(s,c)
   if v:z[j]=z.get(j,0)+v
 return z
def shift(m,l,s,n):
 z=dict(kernel(m,l,s,n))
 for j,c in kernel(m,l,s,n-1).items():z[j+1]=z.get(j+1,0)+c
 return z
def column(q,i):
 z={2*q+1:1,2*q+2:1} if i==0 else {}
 for r in range(q+1):
  for e,m,l,extra,factor in [(1,r,1,1,2),(2,r+1,0,0,1)]:
   k=i-r-e
   if not 0<=k<=r:continue
   h=r-k;fac=factor*2**h*comb(r,k)
   for j,c in shift(m,l,r+2,q-r).items():
    for a in range(h+1):
     jj=j+a+extra;z[jj]=z.get(jj,0)+fac*c*comb(h,a)
 return z
def main():
 t=time.monotonic();o={'status':'finite exact checks only','columns':0,'coefficients':0,
 'zero_coefficients':0,'triples':0,'zero_triples':0,'failures':[],
 'q_values':list(range(1,31))+[40,60], 'sample':{}}
 for q in o['q_values']:
  p=raw(2,2*q+1)
  for i in range(2*q+5 if q<=30 else 11):
   a=column(q,i);o['columns']+=1
   for j in range(2*q+5):
    actual=p.get((i,j),0);candidate=a.get(j,0)
    o['coefficients']+=1;o['zero_coefficients']+=int(actual==0)
    if actual!=candidate:o['failures'].append([q,i,j,actual,candidate])
  for i in range(2*q+4):
   for j in range(2*q+4):
    for points in [[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]:
     a,b,c=[p.get(v,0) for v in points];o['triples']+=1;o['zero_triples']+=int(not(a*b*c))
     if a*c>b*b:o['failures'].append(['raw_lc',q,points,[a,b,c]])
  o['sample'][q]=[p.get((4,j),0) for j in range(min(2*q+3,10))]
  (O/'experiment-progress.json').write_text(json.dumps(o,indent=2)+'\n')
  kernel.cache_clear()
 o['seconds']=time.monotonic()-t
 o['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'experiments.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
if __name__=='__main__':main()
