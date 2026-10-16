"""Machine-authored finite midpoint tests; experiments are not proofs."""
from pathlib import Path
from math import comb
import json,time
O=Path('evidence/markov-0d346fa7')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def f(n,i,j):
 if min(n,i,j)<0:return 0
 if i==0:return int(j==n)
 return C(n-j-1,i-1)*C(i+j,i)
def main():
 out={'status':'finite experiment only','fib_midpoint':{},'convolution_midpoint':{}}
 for mode in ['floorfloor','floorceil','best']:
  tests=0;fails=[]
  for n in range(2,18):
   pts=[(i,j) for i in range(1,n+1) for j in range(n-i+1)]
   for a,b in pts:
    for c,d in pts:
     lo=(a+c)//2;hi=a+c-lo;bot=(b+d)//2;top=b+d-bot
     v=f(n,a,b)*f(n,c,d)
     t1=f(n,lo,bot)*f(n,hi,top);t2=f(n,lo,top)*f(n,hi,bot)
     rhs=t1 if mode=='floorfloor' else t2 if mode=='floorceil' else max(t1,t2)
     tests+=1
     if v>rhs and len(fails)<5:fails.append([n,[a,b],[c,d],v,t1,t2])
  out['fib_midpoint'][mode]={'tests':tests,'failures':fails}
 for mode in ['floorfloor','floorceil','best']:
  tests=0;fails=[]
  for q in range(1,9):
   for i in range(2,2*q+3):
    for j in range(2*q+1):
     def term(l,k,e,t):return f(q+1-e,l,k)*f(q+1-e,i-l,t-e-k)
     aa=[(l,k,e) for e in range(2) for l in range(i+1) for k in range(j+1) if term(l,k,e,j)]
     bb=[(l,k,e) for e in range(2) for l in range(i+1) for k in range(j+3) if term(l,k,e,j+2)]
     for a,b,e in aa:
      for c,d,g in bb:
       l=(a+c)//2;ll=a+c-l;k=(b+d)//2;kk=b+d-k;ee=min(e,g);gg=max(e,g)
       v=term(a,b,e,j)*term(c,d,g,j+2)
       ts=[term(l,k,ee,j+1)*term(ll,kk,gg,j+1),term(l,kk,ee,j+1)*term(ll,k,gg,j+1),term(ll,k,ee,j+1)*term(l,kk,gg,j+1),term(ll,kk,ee,j+1)*term(l,k,gg,j+1)]
       rhs=ts[0] if mode=='floorfloor' else ts[1] if mode=='floorceil' else max(ts)
       tests+=1
       if v>rhs and len(fails)<5:fails.append([q,i,j,[a,b,e],[c,d,g],v,ts])
  out['convolution_midpoint'][mode]={'tests':tests,'failures':fails}
  (O/'midpoint-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
