"""Machine-authored db972d62: exact exploration, not proof."""
from math import comb
from pathlib import Path
import json,time
def C(n,r): return comb(n,r) if 0<=r<=n else 0
def T(i,j,m,k):
 return (1 if k==0 else 2)*C(j-k+i,i)*C(m-k,i-2) if 0<=k<=min(j,m) else 0
def main():
 out={};start=time.monotonic()
 for shift in range(4):
  count=0;fail=None
  for i in range(3,15):
   if fail:break
   for j in range(15):
    if fail:break
    for m in range(15):
     if fail:break
     for k in range(min(j+2,m)+1):
      if fail:break
      for l in range(min(j,m+2)+1):
       lo=min(k,l+shift);hi=max(k-shift,l)
       a=T(i,j+2,m,k)*T(i+2,j,m+2,l)
       b=T(i+1,j+1,m+1,lo)*T(i+1,j+1,m+1,hi)
       count+=1
       if a>b:fail=dict(i=i,j=j,m=m,k=k,l=l,lo=lo,hi=hi,lhs=a,rhs=b);break
  out[shift]={'count':count,'first_failure':fail}
 out['seconds']=time.monotonic()-start
 out['status']='finite summand-certificate probe; no root conclusion'
 Path('evidence/markov-db972d62/diagonal-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
def symmetric():
 start=time.monotonic(); count=0; fail=None
 for i in range(3,20):
  if fail:break
  for j in range(20):
   if fail:break
   for m in range(20):
    if fail:break
    for k in range(min(j+2,m+2)+1):
     if fail:break
     for l in range(k+1):
      a=T(i,j+2,m,k)*T(i+2,j,m+2,l)+T(i,j+2,m,l)*T(i+2,j,m+2,k)
      b=2*T(i+1,j+1,m+1,k)*T(i+1,j+1,m+1,l)
      count+=1
      if a>b:fail=dict(i=i,j=j,m=m,k=k,l=l,lhs=a,rhs=b);break
 out={'count':count,'first_failure':fail,'seconds':time.monotonic()-start,'status':'finite symmetrized summand probe'}
 Path('evidence/markov-db972d62/symmetric-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
if __name__=='__main__':symmetric()
