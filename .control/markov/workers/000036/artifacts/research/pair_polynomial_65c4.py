"""Exact symbolic n-polynomial coefficients, not universal proof."""
import math,json,pathlib,time
from fractions import Fraction as F
from pair_probe_65c4 import c
def add(a,b):
 o=[F(0)]*max(len(a),len(b))
 for i,v in enumerate(a):o[i]+=v
 for i,v in enumerate(b):o[i]+=v
 return o
def scale(a,c):return [v*c for v in a]
def mul(a,b):
 o=[F(0)]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):o[i+j]+=x*y
 return o
def choosepoly(offset,s):
 p=[F(1)]
 for r in range(s):p=mul(p,[F(offset-r),F(1)])
 return scale(p,F(1,math.factorial(s)))
def H(s,j,q,N):
 if s==0:return [F(int(q==j==0))]
 return scale(choosepoly(N-q,s),c(s+q-1,q)*c(2*s,j-q))
start=time.monotonic();count=0;fails=[]
for s in range(1,9):
 for k in range(19):
  N=s+k+1
  for j in range(2*(s+1)+k+1):
   layers=[]
   for q in range(k//2+1):
    r=k-q
    p=add(scale(mul(H(s,j,q,N),H(s,j,r,N)),2),scale(add(mul(H(s-1,j,q,N),H(s+1,j,r,N)),mul(H(s+1,j,q,N),H(s-1,j,r,N))),-1))
    if q==r:p=scale(p,F(1,2))
    layers.append(p)
   total=[F(0)]
   for r in reversed(range(len(layers))):
    total=add(total,layers[r]);count+=1
    if any(x<0 for x in total):fails.append(dict(s=s,j=j,k=k,r=r,shift=N,coefficients=list(map(str,total))));break
   if fails:break
  if fails:break
 if fails or time.monotonic()-start>35:break
out=dict(status='finite exact polynomial expansion; no universal s claim',s_completed=s,checks=count,failures=fails,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-65c4dfb8/pair-polynomial.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
