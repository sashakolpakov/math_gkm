"""Machine-authored 2b34268b. Exact finite summand experiments, not proofs."""
from math import comb
from functools import cache
from pathlib import Path
import json,time
def C(n,k):return comb(n,k) if 0<=k<=n else 0
@cache
def f(n,i,j):
 if i==0:return int(j==n)
 return C(n-j-1,i-1)*C(j+i,i) if 0<=j<n and i>0 else 0
@cache
def T(q,j,i,t):
 if not 0<=t<=j:return 0
 return sum(f(q+1,h,t)*f(q+1,i-h,j-t)+f(q,h,t)*f(q,i-h,j-1-t) for h in range(i+1))
def main():
 start=time.monotonic();out={'status':'finite experiment only','variants':{}}
 for shift in [-1,0,1]:
  count=0;fails=[]
  for q in range(1,14):
   for j in range(q+1,2*q+2):
    for i in range(2*q+1-j):
     for t in range(j+1):
      for s in range(j+1):
       l=T(q,j,i,t)*T(q,j,i+2,s)
       if shift<0:m,n=(t+s)//2,(t+s+1)//2
       else:m,n=min(t+shift,s),max(t+shift,s)-shift
       r=T(q,j,i+1,m)*T(q,j,i+1,n);count+=1
       if l>r and len(fails)<8:fails.append([q,j,i,t,s,l,r])
  out['variants'][str(shift)]={'checks':count,'failures':fails}
 out['seconds']=time.monotonic()-start
 Path('evidence/markov-2b34268b/probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
