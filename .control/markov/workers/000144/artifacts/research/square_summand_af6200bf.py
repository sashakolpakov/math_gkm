"""Machine-authored alternate summand experiment; no theorem claim."""
from pathlib import Path
from math import comb
import json,time
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def f(n,i,j):
 if min(i,j)<0:return 0
 if i==0:return int(j==n)
 return C(n-j-1,i-1)*C(j+i,i) if j<n else 0
def T(q,j,i,h):
 if not 0<=h<=i:return 0
 return sum(f(q+1,h,t)*f(q+1,i-h,j-t) for t in range(j+1))+sum(f(q,h,t)*f(q,i-h,j-1-t) for t in range(j))
out=dict(status='finite experiment only',checks={'lower':0,'upper':0},failures={'lower':[],'upper':[]})
start=time.monotonic()
for q in range(1,16):
 for j in range(2*q+3):
  side='lower' if j<=q else 'upper'
  ts=[[T(q,j,i,h) for h in range(2*q+5)] for i in range(2*q+5)]
  for i in range(2*q+3):
   for h in range(i+1):
    for k in range(i+3):
     lhs=ts[i][h]*ts[i+2][k];rhs=ts[i+1][min(h+1,k)]*ts[i+1][max(h+1,k)-1]
     out['checks'][side]+=1
     if lhs>rhs and len(out['failures'][side])<10:out['failures'][side].append(dict(q=q,j=j,i=i,h=h,k=k,lhs=lhs,rhs=rhs))
out['seconds']=time.monotonic()-start
Path('evidence/markov-af6200bf/square-summand.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
