"""Exact finite probes of positive Pell summands; all claims experimental."""
import math,pathlib,json,time
from gas_probe_0618 import poly
def c(n,k):return math.comb(n,k) if 0<=k<=n else 0
def f(n,j,s,q):
 if min(s,q)<0:return 0
 if s==0:return int(q==j==0)
 return c(n-q,s)*c(s+q-1,q)*c(2*s,j-q)
def g(n,i,s,p):
 if min(s,p)<0:return 0
 if s==0:return int(p==i==n)
 return c(s+p,p)*c(n-p-1,s-1)*c(2*s,i-p)
def main():
 t=time.monotonic();fail={};checks=0;ids=0
 for n in range(1,26):
  raw=poly([False,True]*(n-1)+[False])
  for i in range(2*n+2):
   for j in range(2*n+2):
    s=i+j-n
    a=sum(f(n,j,s,q) for q in range(n+1))
    b=sum(g(n,i,s,p) for p in range(n+1))
    ids+=2
    if a!=raw.get((i,j),0) and 'horizontal_identity' not in fail:fail['horizontal_identity']=[n,i,j,a,raw.get((i,j),0)]
    if b!=raw.get((i,j),0) and 'vertical_identity' not in fail:fail['vertical_identity']=[n,i,j,b,raw.get((i,j),0)]
  for direction,fun in [('horizontal',f),('vertical',g)]:
   for fixed in range(2*n+1):
    for s in range(1,n):
     lo=[fun(n,fixed,s-1,k) for k in range(n+1)];mid=[fun(n,fixed,s,k) for k in range(n+1)];hi=[fun(n,fixed,s+1,k) for k in range(n+1)]
     for k in range(n+1):
      for l in range(n+1):
       if not lo[k]*hi[l]:continue
       checks+=1
       rhs=mid[(k+l)//2]*mid[(k+l+1)//2]
       if lo[k]*hi[l]>rhs and direction+'_midpoint' not in fail:fail[direction+'_midpoint']=dict(n=n,fixed=fixed,s=s,k=k,l=l,values=[lo[k],hi[l],mid[(k+l)//2],mid[(k+l+1)//2]])
  out=dict(status='finite exact experiment only',n_max=n,identity_checks=ids,midpoint_checks=checks,first_failures=fail,seconds=time.monotonic()-t)
  pathlib.Path('evidence/markov-9a720f77/pell-sum-probe.json').write_text(json.dumps(out,indent=2)+'\n')
  print(json.dumps(out),flush=True)
if __name__=='__main__':main()
